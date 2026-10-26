/**
 * Port of the parts of Khronos reg.py (Vulkan-Docs / Vulkan-Headers) used by the D bindings generator
 *
 * Only the passes affecting generated declarations are ported. Not ported: mergeApiNames, profiles,
 * feature dictionaries, additional validity, spirv, formats and sync elements.
 *
 * Copyright: Copyright 2013-2023 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   Apache-2.0
 */
module registry;

import std.algorithm : canFind, sort, SwapStrategy;
import std.array     : split;
import std.conv      : to;
import std.file      : readText;
import std.typecons  : tuple;

import xml;
import generator;


/// whether api name 'name' matches the comma separated list 'supported', null 'supported' always matches
bool apiNameMatch( string name, string supported ) {
    if( name is null ) return false;
    return supported is null || supported.split( ',' ).canFind( name );
}


/// remove all elements with an 'api' attribute not matching apiName
void stripNonmatchingAPIs( Element tree, string apiName ) {
    Element[] stack = [ tree ];
    while( stack.length ) {
        auto parent = stack[ $ - 1 ];
        stack = stack[ 0 .. $ - 1 ];
        foreach( child; parent.findAll( "*" )) {
            if( apiNameMatch( apiName, child.get( "api" )))  stack ~= child;
            else                                            parent.remove( child );
        }
    }
}


/// state of a registry element (type / group / enum / command), used during API generation
class BaseInfo {
    Element elem;
    bool    required;   /// should this be defined during generation
    bool    declared;   /// has this been defined already

    this( Element elem ) { this.elem = elem; }

    bool compareKeys( BaseInfo info, string key, bool required = false ) {
        if( required && !elem.has( key )) return false;
        return elem.has( key ) == info.elem.has( key ) && elem.get( key ) == info.elem.get( key );
    }

    /// only <enum>s may be redefined consistently
    bool compareElem( BaseInfo info, string infoName ) {
        if( infoName != "enum" || !compareKeys( info, "extends" )) return false;
        return compareKeys( info, "value", true ) || compareKeys( info, "bitpos", true )
            || ( compareKeys( info, "extnumber" ) && compareKeys( info, "offset" ) && compareKeys( info, "dir" ))
            || compareKeys( info, "alias" );
    }
}


/// state of a <feature> or <extension>
final class FeatureInfo : BaseInfo {
    string  name;
    bool    emit;
    int     sortorder;
    string  category;
    string  versionNumber;
    int     number;
    string  supported;
    bool    isFeature;

    this( Element elem ) {
        super( elem );
        name = elem.get( "name" );
        sortorder = elem.has( "sortorder" ) ? elem.get( "sortorder" ).to!int : 0;
        isFeature = elem.tag == "feature";
        if( isFeature ) {
            category = "VERSION";
            versionNumber = elem.get( "number" );
            number = 0;
            supported = null;
        } else {
            // extract vendor portion of <APIprefix>_<vendor>_<name>
            auto parts = name.split( '_' );
            category = parts.length > 1 ? parts[ 1 ] : null;
            versionNumber = "0";
            number = elem.has( "number" ) ? elem.get( "number" ).to!int : 0;
            supported = elem.has( "supported" ) ? elem.get( "supported" ) : "disabled";
        }
    }
}


/// object representing an API registry, loaded from an XML file
final class Registry {
    Generator     gen;
    GeneratorOptions    genOpts;
    Element             reg;            /// root <registry> element

    BaseInfo[ string ]  typedict;
    BaseInfo[ string ]  groupdict;
    BaseInfo[ string ]  enumdict;
    BaseInfo[ string ]  cmddict;
    FeatureInfo[]       features;       /// <feature> infos in xml order (python apidict)
    FeatureInfo[]       extensions;     /// <extension> infos in xml order (python extdict)

    bool                emitFeatures;

    this( Generator gen, GeneratorOptions genOpts ) {
        this.gen = gen;
        this.genOpts = genOpts;
        gen.registry = this;
        gen.genOpts = genOpts;
    }


    void loadFile( string fileName ) {
        reg = parseXml( readText( fileName ));
        parseTree;
    }


    /// add info to dictionary, keyed by the element's name attribute, the first definition wins
    bool addElementInfo( Element elem, BaseInfo info, string infoName, ref BaseInfo[ string ] dictionary ) {
        string key = elem.get( "name" );
        if( auto existing = key in dictionary ) {
            if( !existing.compareElem( info, infoName ))
                gen.logMsg( "warn", "Attempt to redefine " ~ key ~ " (this should not happen)" );
            return false;
        }
        dictionary[ key ] = info;
        return true;
    }


    BaseInfo lookupElementInfo( string name, BaseInfo[ string ] dictionary ) {
        if( auto info = name in dictionary ) return *info;
        return null;
    }


    void parseTree() {
        stripNonmatchingAPIs( reg, genOpts.apiname );

        // types, add name attribute from nested <name> where missing
        foreach( typeElem; reg.findAll( "types/type" )) {
            if( !typeElem.has( "name" )) {
                auto nameElem = typeElem.find( "name" );
                if( nameElem is null || nameElem.text.length == 0 ) throw new Exception( "Type without a name!" );
                typeElem.set( "name", nameElem.text );
            }
            addElementInfo( typeElem, new BaseInfo( typeElem ), "type", typedict );
        }

        // enum groups
        foreach( group; reg.findAll( "enums" ))
            addElementInfo( group, new BaseInfo( group ), "group", groupdict );

        // enums, all enums of typed groups (enum or bitmask) are required
        foreach( enums; reg.findAll( "enums" )) {
            bool required = enums.has( "type" );
            foreach( enumElem; enums.findAll( "enum" )) {
                auto info = new BaseInfo( enumElem );
                info.required = required;
                addElementInfo( enumElem, info, "enum", enumdict );
            }
        }

        // commands, add name attribute from <proto><name> where missing
        string[ 2 ][] cmdAlias;
        foreach( cmd; reg.findAll( "commands/command" )) {
            string name = cmd.get( "name" );
            if( name is null ) {
                auto nameElem = cmd.find( "proto/name" );
                if( nameElem is null || nameElem.text.length == 0 ) throw new Exception( "Command without a name!" );
                cmd.set( "name", nameElem.text );
            }
            addElementInfo( cmd, new BaseInfo( cmd ), "command", cmddict );
            if( cmd.get( "alias" ).length )
                cmdAlias ~= [ name, cmd.get( "alias" ) ];
        }

        // inject a copy of the aliased command's element with the alias name as command name
        foreach( pair; cmdAlias ) {
            string name = pair[ 0 ], alias_ = pair[ 1 ];
            if( auto aliasInfo = alias_ in cmddict ) {
                auto cmdElem = aliasInfo.elem.deepCopy;
                cmdElem.find( "proto/name" ).text = name;
                cmdElem.set( "name", name );
                cmdElem.set( "alias", alias_ );
                cmddict[ name ] = new BaseInfo( cmdElem );
            } else {
                gen.logMsg( "warn", "No matching <command> found for command " ~ name ~ " alias " ~ alias_ );
            }
        }

        // features and extensions, enums extending a group are copied into that group
        BaseInfo[ string ] featuredict, extdict;
        foreach( feature; reg.findAll( "feature" )) {
            auto featureInfo = new FeatureInfo( feature );
            if( addElementInfo( feature, featureInfo, "feature", featuredict ))
                features ~= featureInfo;
            injectEnums( featureInfo );
        }

        foreach( extension; reg.findAll( "extensions/extension" )) {
            auto featureInfo = new FeatureInfo( extension );
            if( addElementInfo( extension, featureInfo, "extension", extdict ))
                extensions ~= featureInfo;
            injectEnums( featureInfo );
        }
    }


    /// add enums defined in <require> tags of features and extensions to the corresponding group and enum dictionary
    private void injectEnums( FeatureInfo featureInfo ) {
        foreach( require; featureInfo.elem.findAll( "require" )) {
            foreach( enumElem; require.findAll( "enum" )) {
                bool addEnumInfo = false;
                string groupName = enumElem.get( "extends" );
                if( groupName !is null ) {
                    if( featureInfo.isFeature ) {
                        enumElem.set( "version", featureInfo.name );
                    } else {
                        // extension number is used for enumerant value calculation, unless specified explicitly
                        if( enumElem.get( "extnumber" ).length == 0 )
                            enumElem.set( "extnumber", featureInfo.number.to!string );
                        enumElem.set( "extname", featureInfo.name );
                        enumElem.set( "supported", featureInfo.supported );
                    }
                    if( auto gi = groupName in groupdict )
                        gi.elem.append( enumElem.deepCopy );
                    else
                        gen.logMsg( "warn", "NO matching group " ~ groupName ~ " for enum " ~ enumElem.get( "name" ) ~ " found." );
                    addEnumInfo = true;
                } else if( enumElem.get( "value" ).length || enumElem.get( "bitpos" ).length || enumElem.get( "alias" ).length ) {
                    addEnumInfo = true;
                }
                if( addEnumInfo )
                    addElementInfo( enumElem, new BaseInfo( enumElem ), "enum", enumdict );
            }
        }
    }


    /// require (along with its dependencies) or remove (but not its dependencies) a type
    void markTypeRequired( string typename, bool required ) {
        auto typeinfo = lookupElementInfo( typename, typedict );
        if( typeinfo is null ) {
            if( !typename.canFind( ".h" )) gen.logMsg( "warn", "type: " ~ typename ~ " IS NOT DEFINED" );
            return;
        }
        if( required ) {
            foreach( attribName; [ "requires", "alias" ] ) {
                string depname = typeinfo.elem.get( attribName );
                if( depname.length && depname != typename )   // do not recurse on self-referential structures
                    markTypeRequired( depname, required );
            }
            foreach( subtype; typeinfo.elem.findAll( ".//type" ))
                if( subtype.text != typename )
                    markTypeRequired( subtype.text, required );
            foreach( subenum; typeinfo.elem.findAll( ".//enum" ))
                markEnumRequired( subenum.text, required );
            string depType = typeinfo.elem.get( "bitvalues" );
            if( depType.length )
                markTypeRequired( depType, required );
        }
        typeinfo.required = required;
    }


    /// mark an enum as required or not, removed enums are also removed from their <enums> group
    void markEnumRequired( string enumname, bool required ) {
        auto info = lookupElementInfo( enumname, enumdict );
        if( info is null ) {
            gen.logMsg( "warn", "markEnumRequired: " ~ enumname ~ " IS NOT DEFINED" );
            return;
        }
        if( !required ) {
            string groupName = info.elem.get( "extends" );
            if( groupName !is null ) {
                if( auto gi = groupName in groupdict ) {
                    auto gienum = gi.elem.findWithAttribute( "enum", "name", enumname );
                    if( gienum !is null ) gi.elem.remove( gienum );
                    else gen.logMsg( "warn", "markEnumRequired: Cannot remove enum " ~ enumname ~ " not found in group " ~ groupName );
                } else {
                    gen.logMsg( "warn", "markEnumRequired: Cannot remove enum " ~ enumname ~ " from nonexistent group " ~ groupName );
                }
            } else {
                string enumName = info.elem.get( "name" );
                int count = 0;
                foreach( enums; reg.findAll( "enums" ))
                    foreach( thisEnum; enums.findAll( "enum" ))
                        if( thisEnum.get( "name" ) == enumName ) {
                            ++count;
                            enums.remove( thisEnum );
                        }
                if( count == 0 )
                    gen.logMsg( "warn", "markEnumRequired: " ~ enumName ~ ") not found in any <enums> tag" );
            }
        }
        info.required = required;
        string depname = info.elem.get( "alias" );
        if( depname.length )
            markEnumRequired( depname, required );
    }


    /// mark a command as required or not, parameter types of required commands are required as well
    void markCmdRequired( string cmdname, bool required ) {
        auto cmd = lookupElementInfo( cmdname, cmddict );
        if( cmd is null ) {
            gen.logMsg( "warn", "command: " ~ cmdname ~ " IS NOT DEFINED" );
            return;
        }
        cmd.required = required;
        if( required )
            foreach( typeElem; cmd.elem.findAll( ".//type" ))
                markTypeRequired( typeElem.text, required );
    }


    /// require or remove the types, enums and commands of a <require> or <remove> element
    void markRequired( Element feature, bool required ) {
        foreach( typeElem; feature.findAll( "type" ))    markTypeRequired( typeElem.get( "name" ), required );
        foreach( enumElem; feature.findAll( "enum" ))    markEnumRequired( enumElem.get( "name" ), required );
        foreach( cmdElem;  feature.findAll( "command" )) markCmdRequired(  cmdElem.get(  "name" ), required );
    }


    /// python matchAPIProfile, profiles are not supported
    bool matchAPI( Element elem ) {
        string api = elem.get( "api" );
        return api.length == 0 || api == genOpts.apiname;
    }


    /// generate a single type / enum group / enum / command and all its dependencies as needed
    void generateFeature( string fname, string ftype, ref BaseInfo[ string ] dictionary ) {
        auto f = lookupElementInfo( fname, dictionary );
        if( f is null || !f.required || f.declared ) return;
        f.declared = true;   // always mark feature declared, as though actually emitted

        string alias_ = f.elem.get( "alias" );
        void delegate( BaseInfo, string, string ) genProc;
        string followupFeature;

        if( ftype == "type" ) {
            genProc = &gen.genType;

            // generate type dependencies in 'alias' and 'requires' attributes
            if( alias_.length ) generateFeature( alias_, "type", typedict );
            string requires = f.elem.get( "requires" );
            if( requires.length ) generateFeature( requires, "type", typedict );

            // generate types and enums used in defining this type (e.g. in nested <type> and <enum> tags)
            foreach( subtype; f.elem.findAll( ".//type" )) generateFeature( subtype.text, "type", typedict );
            foreach( subenum; f.elem.findAll( ".//enum" )) generateFeature( subenum.text, "enum", enumdict );

            // if the type is an enum group, generate the corresponding group instead
            if( f.elem.get( "category" ) == "enum" ) {
                auto group = lookupElementInfo( fname, groupdict );
                if( alias_ !is null ) {
                    // pass the aliased group to genGroup with the alias name
                    genProc = &gen.genGroup;
                    f = lookupElementInfo( alias_, groupdict );
                } else if( group is null ) {
                    gen.logMsg( "warn", "Skipping enum type " ~ fname ~ ": No matching enumerant group" );
                    return;
                } else {
                    genProc = &gen.genGroup;
                    f = group;
                    tagRequiredGroupEnums( group );
                }
            }
            if( f is null ) throw new Exception( "Should not get here" );
            if( f.elem.get( "category" ) == "bitmask" )
                followupFeature = f.elem.get( "bitvalues" );

        } else if( ftype == "command" ) {
            if( alias_.length ) generateFeature( alias_, "command", cmddict );
            genProc = &gen.genCmd;
            foreach( typeElem; f.elem.findAll( ".//type" ))
                generateFeature( typeElem.text, "type", typedict );

        } else if( ftype == "enum" ) {
            if( alias_.length ) generateFeature( alias_, "enum", enumdict );
            genProc = &gen.genEnum;
        }

        if( emitFeatures ) genProc( f, fname, alias_ );

        if( followupFeature.length )
            generateFeature( followupFeature, "type", typedict );
    }


    /// tag the <enum> elements of a group, which are required for the generated api, with required="true"
    private void tagRequiredGroupEnums( BaseInfo group ) {
        auto enums = group.elem.findAll( "enum" );
        string[] enumAliases;
        foreach( elem; enums ) {
            bool required;
            if( elem.has( "extname" )) {
                // 'supported' attribute was injected when the <enum> was copied into the group in parseTree
                required = elem.get( "supported" ).split( ',' ).canFind( genOpts.defaultExtensions )
                        || genOpts.matches( genOpts.addExtensions, elem.get( "extname" ));
            } else if( elem.has( "version" )) {
                required = genOpts.matches( genOpts.emitversions, elem.get( "version" ));
            } else {
                required = true;
            }
            if( required ) {
                elem.set( "required", "true" );
                if( elem.get( "alias" ).length ) enumAliases ~= elem.get( "alias" );
            }
        }
        foreach( elem; enums )
            if( enumAliases.canFind( elem.get( "name" )))
                elem.set( "required", "true" );
    }


    /// generate all interfaces required by an API version or extension
    void generateRequiredInterface( Element interface_ ) {
        foreach( features; interface_.findAll( "require" )) {
            foreach( t; features.findAll( "type" ))
                generateFeature( t.get( "name" ), "type", typedict );
            foreach( e; features.findAll( "enum" ))
                if( e.get( "extends" ).length == 0 )   // extending enums were copied into their groups in parseTree
                    generateFeature( e.get( "name" ), "enum", enumdict );
            foreach( c; features.findAll( "command" ))
                generateFeature( c.get( "name" ), "command", cmddict );
        }
    }


    /// generate interface for specified versions using the current generator and generator options
    void apiGen() {
        FeatureInfo[] selected;

        // all matching API features
        bool apiMatch = false;
        foreach( fi; features ) {
            if( !apiNameMatch( genOpts.apiname, fi.elem.get( "api" ))) continue;
            apiMatch = true;
            if( !genOpts.matches( genOpts.versions, fi.name )) continue;
            fi.emit = genOpts.matches( genOpts.emitversions, fi.name );
            selected ~= fi;
        }
        if( !apiMatch ) gen.logMsg( "warn", "No matching API versions found!" );

        // all matching extensions, in order of their extension number
        auto sortedExtensions = extensions.dup;
        sortedExtensions.sort!( ( a, b ) => a.number < b.number, SwapStrategy.stable );
        foreach( ei; sortedExtensions ) {
            bool include = apiNameMatch( genOpts.defaultExtensions, ei.elem.get( "supported" ));
            if( genOpts.matches( genOpts.addExtensions, ei.name ))
                include = apiNameMatch( genOpts.apiname, ei.elem.get( "supported" ));
            if( genOpts.matches( genOpts.removeExtensions, ei.name ))
                include = false;
            if( include ) {
                ei.emit = genOpts.matches( genOpts.emitExtensions, ei.name );
                selected ~= ei;
            }
        }

        // python regSortFeatures: by sortorder, category, version number, extension number
        static double categoryKey( FeatureInfo f ) {
            if( f.isFeature ) return f.name.length >= 4 && f.name[ 0 .. 4 ] == "VKSC" ? 0.5 : 0;
            if( f.category == "ARB" || f.category == "KHR" || f.category == "OES" ) return 1;
            return 2;
        }
        selected.sort!( ( a, b ) =>
            tuple( a.sortorder, categoryKey( a ), a.versionNumber.to!double, a.number ) <
            tuple( b.sortorder, categoryKey( b ), b.versionNumber.to!double, b.number ),
            SwapStrategy.stable );

        // pass 1 + 2: tag required and removed features, removals win
        foreach( f; selected )
            foreach( require; f.elem.findAll( "require" ))
                if( matchAPI( require )) markRequired( require, true );
        foreach( f; selected )
            foreach( remove; f.elem.findAll( "remove" ))
                if( matchAPI( remove )) markRequired( remove, false );

        // pass 3: generate declarations for required things which have not already been generated
        gen.beginFile( genOpts );
        foreach( f; selected ) {
            emitFeatures = f.emit;
            gen.beginFeature( f.elem, f.emit );
            generateRequiredInterface( f.elem );
            gen.endFeature;
        }
        gen.endFile;
    }
}
