/**
 * D Vulkan bindings generator, D port of V-Erupt erupt_dlang.py, which was based off of and using the Vulkan-Docs code
 * Includes the parts of Khronos generator.py (Vulkan-Docs / Vulkan-Headers) used by the D bindings generator
 *
 * Copyright: Copyright 2013-2023 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module generator;

import std.algorithm : all, canFind, endsWith, filter, map, max, maxElement, startsWith;
import std.array     : array, join, replace, replaceFirst, replicate, split;
import std.ascii     : isDigit, newline;
import std.conv      : to;
import std.file      : mkdirRecurse, write;
import std.format    : format;
import std.path      : buildPath;
import std.range     : drop;
import std.regex     : Regex, ctRegex, regex, matchFirst, replaceAll;
import std.stdio     : stderr;
import std.string    : KeepTerminator, indexOf, leftJustify, lastIndexOf, splitLines, strip, stripLeft, stripRight, toLower, toUpper;

import xml;
import registry;
import templates;



/// options controlling which features are generated and how the D modules are formatted, see python GeneratorOptions
/// regex patterns use python re.match semantics, they are matched at the start of a name
final class GeneratorOptions {
    string  directory           = ".";
    string  apiname             = "vulkan";
    string  versions            = ".*";
    string  emitversions        = ".*";
    string  defaultExtensions   = "vulkan";
    string  addExtensions       = null;     // null or empty matches nothing
    string  removeExtensions    = null;     // null or empty matches nothing
    string  emitExtensions      = ".*";

    string  packagePrefix       = "erupted";
    string  namePrefix          = "Erupted";
    string  indentString        = "    ";
    string  currentXml          = "";       // vk or video

    /// python re.match( pattern, name ) is not None
    bool matches( string pattern, string name ) {
        if( pattern.length == 0 ) return false;
        if( pattern !in regexCache ) regexCache[ pattern ] = regex( "^(?:" ~ pattern ~ ")" );
        return !name.matchFirst( regexCache[ pattern ] ).empty;
    }

    private Regex!char[ string ] regexCache;
}


/// python tuple returned from enumToValue: ( numeric value or None, string value or None )
struct EnumValue {
    bool    hasNum;
    long    num;
    string  str;
}



/// python slicing semantics: negative indices count from the end, out of range indices are clamped
string pySlice( string s, long start, long end = long.max ) {
    long len = s.length;
    if( start < 0 ) start = max( 0, len + start );
    if( end   < 0 ) end   = max( 0, len + end );
    if( start > len ) start = len;
    if( end   > len ) end   = len;
    return start < end ? s[ cast( size_t )start .. cast( size_t )end ] : "";
}


/// python: n * string
string times( string s, size_t n ) {
    return s.replicate( n );
}


string capitalizeFirst( string s ) {
    import std.ascii : toUpper;
    return s.length ? s[ 0 ].toUpper ~ s[ 1 .. $ ] : s;
}


size_t alignTo( size_t length, size_t alignment ) {
    if( length % alignment == 0 ) return length;
    return ( length / alignment + 1 ) * alignment;
}


/// python int( value, 0 ): decimal or 0x / 0o / 0b prefixed, optionally signed
long parsePythonInt( string value ) {
    string s = value.strip.replace( "_", "" );
    bool negative = false;
    if( s.startsWith( "-" ) || s.startsWith( "+" )) {
        negative = s[ 0 ] == '-';
        s = s[ 1 .. $ ];
    }
    ulong result;
    string lower = s.toLower;
    if(      lower.startsWith( "0x" )) result = s[ 2 .. $ ].to!ulong( 16 );
    else if( lower.startsWith( "0o" )) result = s[ 2 .. $ ].to!ulong( 8 );
    else if( lower.startsWith( "0b" )) result = s[ 2 .. $ ].to!ulong( 2 );
    else                               result = s.to!ulong;
    return negative ? -cast( long )result : cast( long )result;
}


/// concatenate type, qualifiers, pointers and array dimensions of a <member>, <param> or <proto> element
/// with decayArray the outermost array dimension becomes a pointer, as c function parameters do,
/// D would otherwise pass static arrays by value: c const float blendConstants[4] is D const( float )* blendConstants
string getFullType( Element elem, bool decayArray = false ) {
    auto elemTyp    = elem.find( "type" );
    string elemStr  = elem.text.stripLeft;
    string typeStr  = elemTyp.text.strip;
    string tailStr  = elemTyp.tail.stripRight;
    string result   = elemStr ~ typeStr ~ tailStr;

    // catch const variations
    if( tailStr.startsWith( "* c" ))            // double const
        result = "const( %s* )*".format( typeStr );
    else if( tailStr == "*" && elemStr.length ) // single const
        result = "const( %s )*".format( typeStr );

    // catch opaque structs
    if( result.startsWith( "struct" ))
        result = typeStr.stripLeft( "struct " );

    // catch array types and bitfield widths, which follow the <name>
    // array sizes are integral or enum constants, e.g.: <name>matrix</name>[3][4] or <name>list</name>[<enum>A</enum>][<enum>B</enum>]
    string suffix;
    bool afterName = false;
    foreach( child; elem.children ) {
        if( child.tag == "name" )               { afterName = true; suffix ~= child.tail; }
        else if( afterName && child.tag == "enum" ) suffix ~= child.text ~ child.tail;
    }

    // D declares array dimensions in reverse order of C: c float m[3][4] is D float[4][3] m
    string[] dimensions;
    string remainder;
    while( suffix.length ) {
        auto open = suffix.indexOf( '[' );
        if( open < 0 ) { remainder ~= suffix; break; }
        auto close = suffix.indexOf( ']', open );
        remainder ~= suffix[ 0 .. open ];
        string size = suffix[ open + 1 .. close ].strip;
        dimensions ~= size.all!isDigit ? "[" ~ size ~ "]" : "[ " ~ size ~ " ]";     // enum array sizes get spaces
        suffix = suffix[ close + 1 .. $ ];
    }

    // the outermost c dimension decays to a pointer to the remaining (inner) array type
    bool decay = decayArray && dimensions.length;
    if( decay ) dimensions = dimensions[ 1 .. $ ];

    foreach_reverse( dimension; dimensions ) result ~= dimension;

    if( decay ) {
        if( result.startsWith( "const " ))  result = "const( %s )*".format( result[ "const ".length .. $ ] );
        else                                result ~= "*";
    }
    return result ~ remainder;
}



/// sections of generated code, collected per feature / extension
enum Section {
    typeDefinitions,
    funcTypeAliases,
    funcDeclarations,
    funcAliases,
    loadGFuncs,
    loadIFuncs,
    loadDFuncs,
    convenFuncs,
    convenAliases,
    dispDeclarations,
    dispAliases,
}


/// a line of generated code, LJUST_NAME placeholders are replaced with padding based on nameLen
struct Line {
    string text;
    size_t nameLen;
}

enum LJUST_NAME = "{LJUST_NAME}";


final class FeatureContent {
    Line[][ Section.max + 1 ] sections;
    ref Line[] opIndex( Section section ) { return sections[ section ]; }
}



/// the D bindings generator, the registry calls its begin / end and gen functions while walking the features
final class Generator {

    Registry            registry;
    GeneratorOptions    genOpts;
    bool                emit;
    string              featureName;

    enum long extBase       = 1_000_000_000;
    enum long extBlockSize  = 1000;

    string indent = "    ";

    size_t maxFuncNameLen;
    size_t maxGFuncNameLen;
    size_t maxIFuncNameLen;
    size_t maxDFuncNameLen;

    string[]                    featureOrder;
    FeatureContent[ string ]    featureContent;

    string[]                    platformExtensionOrder;
    string[]                    platformProtectionOrder;
    string[ string ]            platformExtensionProtection;
    string[ string ]            platformNameProtection;

    Element[ string ]           bitmaskFlagBitsFlags;   // record occurrence of VkSomeFlags or VkSomeFlagBits for pairing

    // ordered list of type sections in the generated module
    static immutable string[] TYPE_SECTIONS = [ "include", "define", "basetype", "handle", "enum", "group", "bitmask", "funcpointer", "struct" ];
    string[][ string ]          sections;


    void logMsg( string level, string msg ) {
        switch( level ) {
            case "error" : stderr.writeln( "ERROR: ",   msg ); break;
            case "warn"  : stderr.writeln( "WARNING: ", msg ); break;
            default      : break;   // diagnostics are not reported
        }
    }


    /// parse and convert an <enum> tag into a value
    /// value, bitpos, offset (with extnumber and optional dir) and alias attributes are supported
    EnumValue enumToValue( Element elem, bool needsNum ) {
        if( elem.has( "value" )) {
            string value = elem.get( "value" );
            return EnumValue( needsNum, needsNum ? parsePythonInt( value ) : 0, value );
        }
        if( elem.has( "bitpos" )) {
            long bitpos = parsePythonInt( elem.get( "bitpos" ));
            ulong numVal = 1UL << bitpos;
            string value = format( "0x%08x", numVal );
            if( bitpos >= 32 ) value ~= "ULL";      // bitwidth argument is always 32 in the D generator
            return EnumValue( true, cast( long )numVal, value );
        }
        if( elem.has( "offset" )) {
            long offset     = parsePythonInt( elem.get( "offset" ));
            long extnumber  = parsePythonInt( elem.get( "extnumber" ));
            long numVal     = extBase + ( extnumber - 1 ) * extBlockSize + offset;
            if( elem.has( "dir" )) numVal *= -1;
            return EnumValue( true, numVal, numVal.to!string );
        }
        if( elem.has( "alias" )) {
            return EnumValue( false, 0, elem.get( "alias" ));
        }
        return EnumValue( false, 0, null );
    }


    /// check enumerated values for duplicates, returns the list with duplicates stripped
    Element[] checkDuplicateEnums( Element[] enums ) {
        EnumValue[ string ] nameMap;
        string[ long ]      valueMap;   // numeric value -> enum name

        Element[] stripped;
        foreach( elem; enums ) {
            string name = elem.get( "name" );
            auto value = enumToValue( elem, true );

            if( auto other = name in nameMap ) {
                // duplicate enum values for the same name are benign
                if( !( other.str == value.str || ( value.hasNum && other.hasNum && value.num == other.num )))
                    logMsg( "warn", "checkDuplicateEnums: Duplicate enum (" ~ name
                        ~ ") found with different values:" ~ value.str ~ " and " ~ other.str );
                continue;
            } else if( value.hasNum && value.num in valueMap ) {
                // duplicate value found (such as an alias), report it but still add this enum to the list
                logMsg( "error", "Two enums found with the same value: %s = %s = %s".format(
                    name, valueMap[ value.num ], value.str ));
            }

            nameMap[ name ] = value;
            if( value.hasNum ) valueMap[ value.num ] = name;
            stripped ~= elem;
        }
        return stripped;
    }


    /// an <enum> element is required if Registry.generateFeature tagged it
    bool isEnumRequired( Element elem ) {
        return elem.has( "required" );
    }


    void validateFeature( string featureType, string name ) {
        if( featureName is null )
            throw new Exception( "Attempt to generate " ~ featureType ~ " " ~ name ~ " when not in feature" );
    }


    // start processing
    void beginFile( GeneratorOptions genOpts ) {
        this.genOpts = genOpts;
        indent = genOpts.indentString;
        mkdirRecurse( genOpts.directory );

        // since v1.1.70 we only get platform names per feature, but not their protect string
        // these are stored in vk.xml in platform tags, we extract them and map platform name to platform protection
        foreach( platform; registry.reg.findAll( "platforms/platform" ))
            platformNameProtection[ platform.get( "name" ) ] = platform.get( "protect" );
    }


    // write a module with platform specific line endings, like python's text mode does
    void writeModule( string fileName, string content ) {
        content ~= "\n";
        static if( newline != "\n" ) content = content.replace( "\n", newline );
        write( buildPath( genOpts.directory, fileName ), content );
    }


    // end processing, store data to files
    void endFile() {

        // --------------------------------- //
        // write types.d and vk_video.d file //
        // --------------------------------- //

        string typesSection() {
            string result;
            foreach( feature; featureOrder ) {
                auto featureSection = featureContent[ feature ][ Section.typeDefinitions ];
                if( featureSection.length )
                    result ~= "\n// - %s -\n%s\n".format( feature, featureSection.map!( l => l.text ).join( "\n" ));
            }
            return result.pySlice( 0, -1 );
        }

        bool isVk = genOpts.currentXml == "vk";
        writeModule( isVk ? "types.d" : "vk_video.d", ( isVk ? TYPES : VK_VIDEO ).substitute( [
            "PACKAGE_PREFIX"    : genOpts.packagePrefix,
            "TYPE_DEFINITIONS"  : typesSection,
        ] ));

        // vulkan-docs-v1.3.238 introduced a second xml file (video.xml), which contains only type definitions
        if( !isVk ) return;


        // -------------------- //
        // write package.d file //
        // -------------------- //

        writeModule( "package.d", PACKAGE_HEADER.substitute( [ "PACKAGE_PREFIX" : genOpts.packagePrefix ] ));


        // ----------------- //
        // justify functions //
        // ----------------- //

        // align function names of all features, each section has its own maximum name length
        // sections which alias functions add the length of 'alias '
        void justify( Section section, size_t maxLen, size_t extra = 0 ) {
            foreach( content; featureContent.byValue )
                foreach( ref line; content[ section ] ) {
                    long lj = cast( long )( maxLen + extra ) - cast( long )line.nameLen;
                    line.text = line.text.replace( LJUST_NAME, "".leftJustify( cast( size_t )max( 0, lj )));
                }
        }
        justify( Section.funcTypeAliases,  maxFuncNameLen );    // alias PFN_vkFuncName = return_type function( params );
        justify( Section.funcDeclarations, maxFuncNameLen );    // PFN_vkFuncName vkFuncName;
        justify( Section.funcAliases,      maxFuncNameLen, 6 ); // alias vkFuncNameKHR = vkFuncName;
        justify( Section.loadGFuncs,       maxGFuncNameLen );   // vkFuncName = cast( PFN_vkFuncName ) vkGetInstanceProcAddr( instance, "vkFuncName" );
        justify( Section.loadIFuncs,       maxIFuncNameLen );
        justify( Section.loadDFuncs,       maxDFuncNameLen );   // vkFuncName = cast( PFN_vkFuncName ) vkGetDeviceProcAddr( device, "vkFuncName" );
        justify( Section.dispDeclarations, maxDFuncNameLen );
        justify( Section.convenAliases,    maxDFuncNameLen, 6 ); // alias FuncNameKHR = FuncName;
        justify( Section.dispAliases,      maxDFuncNameLen, 6 ); // alias vkFuncNameKHR = vkFuncName;


        // substitute {INSTANCE_OR_DEVICE} placeholders of device level function loaders
        string instanceOrDevice( string text, string instanceOrDevice ) {
            if( instanceOrDevice.length == 0 ) return text;
            return text
                .replace( "{INSTANCE_OR_DEVICE}", instanceOrDevice )
                .replace( "{instance_or_device}", instanceOrDevice.toLower );
        }


        // ---------------------- //
        // write functions.d file //
        // ---------------------- //

        // join function sections of all non platform features
        string functionSection( Section section, string ind, string instanceOrDevice_ = "" ) {
            string result;
            string joiner = "\n" ~ ind;
            foreach( feature; featureOrder ) {
                auto featureSection = featureContent[ feature ][ section ];
                if( featureSection.length )
                    result ~= "\n%1$s// %2$s\n%1$s%3$s\n".format( ind, feature, featureSection.map!( l => l.text ).join( joiner ));
            }
            return instanceOrDevice( result, instanceOrDevice_ ).pySlice( 0, -1 );
        }

        writeModule( "functions.d", FUNCS.substitute( [
            "IND"                       : indent,
            "PACKAGE_PREFIX"            : genOpts.packagePrefix,
            "FUNC_TYPE_ALIASES"         : functionSection( Section.funcTypeAliases,  indent ),
            "FUNC_DECLARATIONS"         : functionSection( Section.funcDeclarations, indent ) ~ "\n"
                                        ~ functionSection( Section.funcAliases,      indent ),
            "GLOBAL_LEVEL_FUNCS"        : functionSection( Section.loadGFuncs,       indent ),
            "INSTANCE_LEVEL_FUNCS"      : functionSection( Section.loadIFuncs,       indent ),
            "DEVICE_I_LEVEL_FUNCS"      : functionSection( Section.loadDFuncs,       indent, "Instance" ),
            "DEVICE_D_LEVEL_FUNCS"      : functionSection( Section.loadDFuncs,       indent, "Device" ),
        ] ));


        // ---------------------------- //
        // write dispatch_device.d file //
        // ---------------------------- //

        writeModule( "dispatch_device.d", DISPATCH_DEVICE.substitute( [
            "IND"                       : indent,
            "PACKAGE_PREFIX"            : genOpts.packagePrefix,
            "DISPATCH_MEMBER_FUNCS"     : functionSection( Section.loadDFuncs,       indent ~ indent, "Device" ),
            "DISPATCH_CONVENIENCE_FUNCS": functionSection( Section.convenFuncs,      indent ) ~ "\n"
                                        ~ functionSection( Section.convenAliases,    indent ),
            "DISPATCH_FUNC_DECLARATIONS": functionSection( Section.dispDeclarations, indent ) ~ "\n"
                                        ~ functionSection( Section.dispAliases,      indent ),
        ] ));


        // -------------------------------- //
        // write platform_extensions.d file //
        // -------------------------------- //

        // construct AliasSequences of extension enums
        string platformProtectionAlias() {
            if( platformProtectionOrder.length == 0 ) return "";
            size_t maxProtectLen = platformProtectionOrder.map!( p => p.length ).maxElement;
            string result;
            foreach( protection; platformProtectionOrder )
                result ~= "alias %s = AliasSeq!( %s );\n".format(
                    protection.pySlice( 3 ).leftJustify( maxProtectLen - 3 ), platformExtensionProtection[ protection ] );
            return result;
        }

        // populate a (else) static if block per platform extension with corresponding code
        string platformExtensionSection( Section[] sections, string ind, string comment, string instanceOrDevice_ = "" ) {
            string result;
            string elsePrefix;
            string joiner = "\n" ~ ind ~ indent;
            foreach( extension; platformExtensionOrder ) {
                // merge several sections ( e.g. type definitions and function type aliases ) into one static if block
                string[] extensionSection;
                foreach( section; sections )
                    extensionSection ~= featureContent[ extension ][ section ].map!( l => instanceOrDevice( l.text, instanceOrDevice_ )).array;

                if( extensionSection.length ) {
                    result ~= STATIC_IF_EXTENSION.substitute( [
                        "IND"           : ind,
                        "EXTENSION"     : extension.pySlice( 3 ),
                        "COMMENT"       : comment,
                        "ELSE_PREFIX"   : elsePrefix,
                        "SECTIONS"      : ind ~ indent ~ extensionSection.join( joiner ),
                    ] );
                    elsePrefix = "else ";
                }
            }
            return result.pySlice( 0, -1 );   // omit the final line break
        }

        writeModule( "platform_extensions.d", PLATFORM_EXTENSIONS.substitute( [
            "IND"                       : indent,
            "PACKAGE_PREFIX"            : genOpts.packagePrefix,
            "PLATFORM_EXTENSIONS"       : "enum %s;".format( platformExtensionOrder.map!( e => e.pySlice( 3 )).join( ";\nenum " )),
            "PLATFORM_PROTECTIONS"      : platformProtectionAlias,
            "TYPE_DEFINITIONS"          : platformExtensionSection( [ Section.typeDefinitions, Section.funcTypeAliases ], indent.times( 2 ), " : types and function pointer type aliases" ),
            "FUNC_DECLARATIONS"         : platformExtensionSection( [ Section.funcDeclarations ], indent.times( 3 ), " : function pointer decelerations" ),
            "INSTANCE_LEVEL_FUNCS"      : platformExtensionSection( [ Section.loadIFuncs       ], indent.times( 3 ), " : load instance level function definitions" ),
            "DEVICE_I_LEVEL_FUNCS"      : platformExtensionSection( [ Section.loadDFuncs       ], indent.times( 3 ), " : load instance based device level function definitions", "Instance" ),
            "DEVICE_D_LEVEL_FUNCS"      : platformExtensionSection( [ Section.loadDFuncs       ], indent.times( 3 ), " : load device based device level function definitions"  , "Device" ),
            "DISPATCH_MEMBER_FUNCS"     : platformExtensionSection( [ Section.loadDFuncs       ], indent.times( 4 ), " : load dispatch device member function definitions"     , "Device" ),
            "DISPATCH_CONVENIENCE_FUNCS": platformExtensionSection( [ Section.convenFuncs      ], indent.times( 3 ), " : dispatch device convenience member functions" ),
            "DISPATCH_FUNC_DECLARATIONS": platformExtensionSection( [ Section.funcDeclarations ], indent.times( 3 ), " : dispatch device member function pointer decelerations" ),
        ] ));


        // ------------------------------ //
        // write vulkan_lib_loader.d file //
        // ------------------------------ //

        writeModule( "vulkan_lib_loader.d", LIB_LOADER.substitute( [ "PACKAGE_PREFIX" : genOpts.packagePrefix, "IND" : indent ] ));
    }


    // begin parsing of all types and functions of a certain feature / extension
    void beginFeature( Element interface_, bool emit ) {
        this.emit = emit;
        this.featureName = interface_.get( "name" );

        auto protection = interface_.get( "platform" ) in platformNameProtection;
        if( protection && ( *protection ).length ) {
            // some features are protected with the same protection, we want them only once in list
            if( !platformProtectionOrder.canFind( *protection ))
                platformProtectionOrder ~= *protection;

            // collect all features belonging to one protection in a string, used in module platform_extensions
            if( auto names = *protection in platformExtensionProtection )   *names ~= ", " ~ featureName.pySlice( 3 );
            else    platformExtensionProtection[ *protection ] = featureName.pySlice( 3 );

            // handle the current feature as platform extension
            platformExtensionOrder ~= featureName;
        } else {
            // feature is not protected -> handle as normal types and functions
            featureOrder ~= featureName;
        }

        auto content = new FeatureContent;
        content[ Section.typeDefinitions ] ~= Line( "enum %s = 1;\n".format( featureName ));
        featureContent[ featureName ] = content;

        sections = null;
        foreach( section; TYPE_SECTIONS ~ [ "commandPointer", "command" ] )
            sections[ section ] = [];
    }


    // end parsing of all types and functions of a certain feature / extension
    void endFeature() {
        // exit this function if content is not supposed to be emitted
        if( !emit ) return;

        // combine all type sections
        foreach( section; TYPE_SECTIONS )
            if( sections[ section ].length )
                foreach( line; sections[ section ] ~ [ "" ] )
                    featureContent[ featureName ][ Section.typeDefinitions ] ~= Line( line );

        featureName = null;
    }


    // append a definition to the specified section
    void appendSection( string section, string text ) {
        sections[ section ] ~= text;
    }


    // defer generation for bitmasks, so we can pair alias VkSomeFlags with enum VkSomeFlagBits : VkSomeFlags {}
    void genEnumsOrFlags( string groupName, Element groupElem, Element typeAlias = null ) {

        bool isEnum = typeAlias is null;

        string snakeName = groupName.replaceAll( ctRegex!`([0-9a-z_])([A-Z0-9][^A-Z0-9]?)`, "$1_$2" ).toUpper;

        string namePrefix = snakeName;
        string nameSuffix = "";
        auto expandSuffixMatch = groupName.matchFirst( ctRegex!`[A-Z][A-Z]+$` );
        if( !expandSuffixMatch.empty ) {
            nameSuffix = "_" ~ expandSuffixMatch.hit;
            // strip off the suffix from the prefix
            auto i = snakeName.lastIndexOf( nameSuffix );
            if( i >= 0 ) namePrefix = snakeName[ 0 .. i ];
        }

        // scoped enums
        string[] scopedGroup;

        if( !isEnum ) {
            // alias corresponding Flags to the underlying (indirect) type and group scoped enums by their name
            string enumType = typeAlias.get( "name" );
            scopedGroup ~= "alias %s = %s;".format( enumType, typeAlias.find( "type" ).text );
            scopedGroup ~= "enum %s : %s {".format( groupName, enumType );
        } else {
            // no Flags for enums
            scopedGroup ~= "enum %s {".format( groupName );
        }

        // add grouped enums to global scope
        string[] globalGroup = [ "" ];

        // check for and report duplicates, and get a list with them removed
        auto enums = checkDuplicateEnums( groupElem.findAll( "enum" ));

        // vulkan-docs-v1.1.118 introduced an empty enum group (VkPipelineCompilerControlFlagBitsAMD)
        // in this case requiredEnumNames will be empty and we simply exit this method, but only for enums
        auto requiredEnumNames = enums.filter!( e => isEnumRequired( e )).map!( e => e.get( "name" )).array;
        if( isEnum && requiredEnumNames.length == 0 ) return;
        size_t maxGlobalLen = requiredEnumNames.length ? requiredEnumNames.map!( n => n.length ).maxElement : 0;
        maxGlobalLen = alignTo( 5 + maxGlobalLen, 2 * indent.length );    // len( 'enum ' ) = 5
        size_t maxScopedLen = maxGlobalLen;

        // some enums elements have been renamed, the old names are aliased with new names
        // and the elements added to the end of the enum element lists
        string[] scopedAlias;
        string[] globalAlias;

        foreach( elem; enums ) {
            // extension enumerates are only included if they are required
            if( !isEnumRequired( elem )) continue;

            auto value = enumToValue( elem, true );
            string name = elem.get( "name" );
            string enumStr = value.str;

            // VkFlags64 bitmasks have a bitwidth of 64 and their values a ULL postfix, which we remove
            // VK_SAMPLER_YCBCR_RANGE_ITU_FULL ends with ULL as well, hence we check for bitmasks
            if( !isEnum && enumStr.endsWith( "ULL" ))
                enumStr = enumStr[ 0 .. $ - 3 ];

            string scopedElem = "%s = %s,".format( ( indent ~ name ).leftJustify( maxScopedLen ), enumStr );
            string globalElem = "%s = %s.%s;".format( ( "enum " ~ name ).leftJustify( maxGlobalLen ), groupName, name );
            if( value.hasNum ) {
                scopedGroup ~= scopedElem;
                globalGroup ~= globalElem;
            } else {
                scopedAlias ~= scopedElem;
                globalAlias ~= globalElem;
            }
        }

        globalGroup ~= globalAlias;
        scopedGroup ~= scopedAlias;

        // bitmasks with a bitwidth of 64 do not get a _MAX_ENUM entry, it is also not present in the c header version
        if( !groupElem.has( "bitwidth" )) {
            string maxEnum = namePrefix ~ "_MAX_ENUM" ~ nameSuffix;
            scopedGroup ~= ( indent ~ maxEnum ).leftJustify( maxScopedLen ) ~ " = 0x7FFFFFFF";
            scopedGroup ~= "}";
            globalGroup ~= "%s = %s.%s;".format( ( "enum " ~ maxEnum ).leftJustify( maxGlobalLen ), groupName, maxEnum );
        } else {
            scopedGroup ~= "}";
        }

        string section = isEnum ? "group" : "bitmask";
        if( sections[ section ].length )
            appendSection( section, "" );   // this empty string will be terminated with '\n' at the join operation
        sections[ section ] ~= scopedGroup ~ globalGroup;
    }


    // categories
    void genType( BaseInfo typeinfo, string name, string alias_ ) {
        validateFeature( "type", name );

        auto elem = typeinfo.elem;

        if( elem.has( "requires" )) {
            string required = elem.get( "requires" );
            if( required.endsWith( ".h" ) || required == "vk_platform" ) return;
        }

        if( !elem.has( "category" )) return;
        string category = elem.get( "category" );

        if( alias_.length ) {
            appendSection( category, "alias %s = %s;".format( name, alias_ ));
            return;
        }

        switch( category ) {

            // c header and API version
            case "define": genDefine( elem, name ); break;

            // alias VkFlags = uint32_t;
            case "basetype":
                auto typeChild = elem.find( "type" );
                if( typeChild !is null )
                    appendSection( "basetype", "alias %s = %s;".format( name, typeChild.text ));
                break;

            // mixin( VK_DEFINE_HANDLE!q{VkInstance} );
            case "handle":
                appendSection( "handle", "mixin( %s!q{%s} );".format( elem.find( "type" ).text, name ));
                break;

            // alias VkFlags with ... Flags corresponding to ...FlagBits: enum VkFormatFeatureFlagBits {...}; alias VkFormatFeatureFlags = VkFlags;
            case "bitmask":
                string groupName;
                if(      elem.has( "requires"  )) groupName = elem.get( "requires" );
                else if( elem.has( "bitvalues" )) groupName = elem.get( "bitvalues" );

                if( groupName.length ) {
                    if( auto flagBits = groupName in bitmaskFlagBitsFlags )
                        genEnumsOrFlags( groupName, *flagBits, elem );     // FlagBits were captured previously, create the Flags and FlagBits pair now
                    else
                        bitmaskFlagBitsFlags[ groupName ] = elem;          // record this Flags data for deferred use
                } else {
                    appendSection( "bitmask", "alias %s = %s;".format( name, elem.find( "type" ).text ));
                }
                break;

            // alias PFN_vkAllocationFunction = void* function( ... )
            case "funcpointer": genFuncPointer( elem, name ); break;

            // structs and unions
            case "struct":
            case "union":
                genStruct( typeinfo, name, alias_ );
                break;

            default: break;
        }
    }


    // defines: versions and version macros
    void genDefine( Element elem, string name ) {

        // first line of elem.text is a comment, which we would like to keep, followed by #define on the next line, which we get rid of
        string firstTextLine() { return elem.text.splitLines[ 0 ]; }

        // convert c macro body to D: drop casts and redundant parenthesis around parameters
        string macroBody( string body_, bool dropUnsigned ) {
            body_ = body_.strip.replace( "(uint32_t)", "" ).replace( "((variant))", "variant" ).replace( "((major))", "major" )
                .replace( "((minor))", "minor" ).replace( "((patch))", "patch" ).pySlice( 1, -1 );
            if( dropUnsigned ) body_ = body_.replace( "U", "" );
            return body_.replace( "(", "( " ).replace( ")", " )" );
        }

        // extract header version, e.g.: enum VK_HEADER_VERSION = 238;
        if( name == "VK_HEADER_VERSION" ) {
            appendSection( "define", "\n%s (corresponding c header)\nenum %s = %s;\n".format(
                firstTextLine, name, elem.find( "name" ).tail.strip ));
        }

        // extract header version complete: enum VK_HEADER_VERSION_COMPLETE = VK_MAKE_API_VERSION( 0, 1, 2, VK_HEADER_VERSION )
        else if( name == "VK_HEADER_VERSION_COMPLETE" ) {
            auto typeChild = elem.find( "type" );
            appendSection( "define", "%s (corresponding c header)\nenum %s = %s( %s );".format(
                firstTextLine, name, typeChild.text, typeChild.tail.pySlice( 1, -1 )));
        }

        else if( name == "VK_MAKE_API_VERSION" ) {
            auto paramsBody = elem.find( "name" ).tail.split( " \\" );
            string params = paramsBody[ 0 ].pySlice( 1, -1 ).replace( "v", "uint v" ).replace( "m", "uint m" ).replace( "p", "uint p" );
            string body_ = macroBody( paramsBody[ 1 ], true );
            appendSection( "define", format(
                "pure {\n" ~
                "%1$suint %2$s( %3$s ) { return %4$s; }\n" ~
                "%1$suint VK_API_VERSION_VARIANT( uint ver ) { return ver >> 29; }\n" ~
                "%1$suint VK_API_VERSION_MAJOR( uint ver ) { return ( ver >> 22 ) & 0x7F; }\n" ~
                "%1$suint VK_API_VERSION_MINOR( uint ver ) { return ( ver >> 12 ) & 0x3FF; }\n" ~
                "%1$suint VK_API_VERSION_PATCH( uint ver ) { return ver & 0xFFF; }\n" ~
                "}\n", indent, name, params, body_ ));
        }

        else if( name == "VK_MAKE_VERSION" ) {     // deprecated
            auto paramsBody = elem.find( "name" ).tail.split( " \\" );
            string params = paramsBody[ 0 ].pySlice( 1, -1 ).replace( "m", "uint m" ).replace( "p", "uint p" );
            string body_ = macroBody( paramsBody[ 1 ], true );
            appendSection( "define", format(
                "\n%5$s\n" ~
                "deprecated( \"These defines have been deprecated, use VK_MAKE_API_VERSION and VK_API_VERSION_ variants instead!\" ) {\n" ~
                "%1$spure {\n" ~
                "%1$s%1$suint %2$s( %3$s ) { return %4$s; }\n" ~
                "%1$s%1$suint VK_VERSION_MAJOR( uint ver ) { return ver >> 22; }\n" ~
                "%1$s%1$suint VK_VERSION_MINOR( uint ver ) { return ( ver >> 12 ) & 0x3FF; }\n" ~
                "%1$s%1$suint VK_VERSION_PATCH( uint ver ) { return ver & 0xFFF; }\n" ~
                "%1$s}\n" ~
                "}\n", indent, name, params, body_, firstTextLine ));
        }

        else if( name == "VK_MAKE_VIDEO_STD_VERSION" ) {
            auto paramsBody = elem.find( "name" ).tail.split( " \\" );
            string params = paramsBody[ 0 ].pySlice( 1, -1 ).replace( "m", "uint m" ).replace( "p", "uint p" );
            string body_ = macroBody( paramsBody[ 1 ], false );
            appendSection( "define", "pure uint %s( %s ) { return %s; }".format( name, params, body_ ));
        }

        else if( name.startsWith( "VK_API_VERSION_1" ) || name.startsWith( "VK_STD_VULKAN_VIDEO_CODEC_" )) {
            string comment = firstTextLine;
            if( comment.length )
                appendSection( "define", comment );
            auto typeChild = elem.find( "type" );
            auto typeChildTail = typeChild.tail.split( "//" );
            string tail = typeChildTail.length == 2
                ? "( %s );\t//%s".format( typeChildTail[ 0 ].pySlice( 1, -1 ), typeChildTail[ 1 ] )
                : "( %s );".format( typeChildTail[ 0 ].pySlice( 1, -1 ));
            appendSection( "define", "enum %s = %s%s".format( elem.find( "name" ).text, typeChild.text, tail ));
        }
    }


    // alias PFN_vkAllocationFunction = void* function( ... )
    void genFuncPointer( Element elem, string name ) {
        string returnType = elem.text.pySlice( 8, -13 );
        string params = elem.iterText.drop( 2 ).join;
        auto paramLines = params.splitLines( KeepTerminator.yes );
        bool trimSpace = true;
        enum sixteenSpaces = "                ";
        foreach( ref line; paramLines ) {
            if( line.startsWith( " " )) {
                line = line.strip( " " );
                if( line.startsWith( "const " )) {
                    line = line.replace( "const ", "const( " )     // scope const to next element
                               .replace( "*", " )*" )              // end scope before asterisk
                               .replaceFirst( "   ", "" );         // remove three spaces taken by parenthesis and one space before
                }
                line = indent ~ line;
                trimSpace = trimSpace && line.canFind( sixteenSpaces );
            }
        }

        params = trimSpace
            ? paramLines.map!( line => line.replaceFirst( sixteenSpaces, "" )).join
            : paramLines.join;

        if( params == ")(void);" )  params = ");";
        else                        params = params.pySlice( 2 ).replace( ");", "\n);" ).replace( "  )", " )" );

        if( sections[ "funcpointer" ].length )
            appendSection( "funcpointer", "" );
        appendSection( "funcpointer", "alias %s = %s function(%s".format( name, returnType, params ));
    }


    // structs and unions
    void genStruct( BaseInfo typeinfo, string name, string alias_ ) {
        validateFeature( "struct", name );

        auto elem = typeinfo.elem;
        string category = elem.get( "category" );

        // the mixed-mode <member> tags may contain no-op <comment> tags, remove them
        foreach( member; elem.findAll( ".//member" ))
            foreach( comment; member.findAll( "comment" ))
                member.remove( comment );

        if( sections[ "struct" ].length )
            appendSection( "struct", "" );

        appendSection( "struct", "%s %s {".format( category, name ));

        // a member entry is either a normal member or a run of bitfields
        struct Bitfield { string type, name, bits; }
        struct Member   { string type, name; Bitfield[] bitfields; }

        size_t      memberTypeLength;
        size_t      memberNameLength;
        Member[]    memberTypeNames;
        Bitfield[]  memberBitfield;

        // member names which are D keywords get capitalized and aliased with a pre- and post-fixed underscore
        static immutable string[] keywords = [ "module", "scope", "version", "function" ];
        bool[ string ] hasKeywordMember;

        // store all bitfields of a run as one entry, std.bitmanip.bitfields requires a total of 8, 16, 32 or 64 bits
        // hence we pad the run with an anonymous field, as the c compiler does implicitly
        // the c storage unit is at least as wide as the declared type, e.g. 12 bits of uint32_t occupy 32 bits
        void storeBitfields() {
            if( memberBitfield.length == 0 ) return;
            size_t bitCount = 0;
            size_t typeBits = 0;
            foreach( b; memberBitfield ) {
                bitCount += b.bits.to!size_t;
                switch( b.type[ 0 .. $ - 1 ] ) {    // type without trailing ','
                    case "uint8_t" , "int8_t"  : typeBits = max( typeBits,  8 ); break;
                    case "uint16_t", "int16_t" : typeBits = max( typeBits, 16 ); break;
                    case "uint64_t", "int64_t" : typeBits = max( typeBits, 64 ); break;
                    default                    : typeBits = max( typeBits, 32 ); break;   // uint32_t, int32_t and flags
                }
            }
            foreach( size; [ 8, 16, 32, 64 ] ) {
                if( bitCount > size || typeBits > size ) continue;
                if( bitCount < size )
                    memberBitfield ~= Bitfield( memberBitfield[ $ - 1 ].type, "\"\",", ( size - bitCount ).to!string );
                break;
            }
            memberTypeNames ~= Member( null, null, memberBitfield );
            memberBitfield = null;
        }

        foreach( member; elem.findAll( "member" )) {
            string memberName = member.find( "name" ).text;

            // don't use D keywords module, scope, version and function
            if( keywords.canFind( memberName )) {
                hasKeywordMember[ memberName ] = true;
                memberName = memberName.capitalizeFirst;
            }

            // member default values
            if( member.get( "values" ).length )
                memberName ~= " = " ~ member.get( "values" );

            // v1.2.135 introduced a struct (VkAccelerationStructureInstanceKHR) with bitfields
            // DLang bitfields are implemented via std.bitmanip.bitfields, we need extra work to parse the xml data
            // video.xml separates the bit count with spaces ( name : 1 ), vk.xml does not ( name:24 )
            string memberType = getFullType( member ).strip;
            auto memberTypeBitcount = memberType.split( ':' ).map!( s => s.strip ).array;

            if( memberTypeBitcount.length == 2 ) {      // bitfields
                memberType = memberTypeBitcount.join( ":" );
                memberBitfield ~= Bitfield( memberTypeBitcount[ 0 ] ~ ",", "\"%s\",".format( memberName ), memberTypeBitcount[ 1 ] );
                memberTypeLength = max( memberTypeLength, memberType.length + indent.length );
                memberNameLength = max( memberNameLength, memberName.length + 4 );
            } else {                                    // non-bitfield processing
                storeBitfields;
                memberTypeNames ~= Member( memberType, memberName );
                memberTypeLength = max( memberTypeLength, memberType.length + 2 );
            }
        }
        storeBitfields;     // struct may end with bitfields

        // loop second time and use maximum type string length to offset member names
        foreach( m; memberTypeNames ) {
            if( m.bitfields.length == 0 ) {             // normal struct members
                appendSection( "struct", "%s%s%s;".format( indent, m.type.leftJustify( memberTypeLength ), m.name ));
            } else {                                    // bitfields
                appendSection( "struct", "%smixin( bitfields!(".format( indent ));
                foreach( b; m.bitfields )
                    appendSection( "struct", "%s%s%s%s,".format( indent ~ indent,
                        b.type.leftJustify( memberTypeLength - indent.length ), b.name.leftJustify( memberNameLength ), b.bits ));
                appendSection( "struct", "%s));".format( indent ));
            }
        }

        foreach( keyword; [ "scope", "module", "version", "function" ] ) {
            if( keyword !in hasKeywordMember ) continue;
            string capitalized = keyword.capitalizeFirst;
            appendSection( "struct", "%s%s%s_ = %s;".format( indent, "alias".leftJustify( memberTypeLength ), keyword, capitalized ));
            appendSection( "struct", "%s%s_%s = %s;".format( indent, "alias".leftJustify( memberTypeLength ), keyword, capitalized ));
        }

        appendSection( "struct", "}" );
    }


    // named and global enums and enum flag bits
    void genGroup( BaseInfo groupInfo, string groupName, string alias_ ) {
        validateFeature( "group", groupName );

        if( alias_.length ) {
            appendSection( groupInfo.elem.get( "type" ), "alias %s = %s;".format( groupName, alias_ ));
            return;     // its either alias xor enum group
        }

        auto groupElem = groupInfo.elem;
        if( groupElem.get( "type" ) == "enum" )
            genEnumsOrFlags( groupName, groupElem );                                            // enum case without Flags and FlagBits
        else if( auto flags = groupName in bitmaskFlagBitsFlags )
            genEnumsOrFlags( groupName, groupElem, *flags );                                    // Flags were captured previously, create the Flags and FlagBits pair now
        else
            bitmaskFlagBitsFlags[ groupName ] = groupElem;                                      // record this FlagBits data for deferred use
    }


    // enum VK_TRUE = 1; enum VK_FALSE = 0; enum _SPEC_VERSION = ; enum _EXTENSION_NAME = ;
    void genEnum( BaseInfo enuminfo, string name, string alias_ ) {
        validateFeature( "enum", name );

        if( alias_.length ) {
            appendSection( "enum", "alias %s = %s;".format( name, alias_ ));
            return;
        }

        string enumStr = enumToValue( enuminfo.elem, false ).str;
        if( enumStr == "VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT" )
            enumStr = "VkStructureType." ~ enumStr;
        else if( enumStr == "(~0ULL)" )
            enumStr = "(~0UL)";

        // enum extension name pointers must be explicitly typed to const( char )*, otherwise they are interpreted as d strings
        if( name.endsWith( "_NAME" ))   appendSection( "enum", "enum const( char )* %s = %s;".format( name, enumStr ));
        else                            appendSection( "enum", "enum %s = %s;".format( name, enumStr ));
    }


    // functions
    void genCmd( BaseInfo cmdinfo, string name, string alias_ ) {
        validateFeature( "command", name );

        auto content = featureContent[ featureName ];

        // store the maximum function name length
        size_t nameLen = name.length;
        maxFuncNameLen = max( maxFuncNameLen, nameLen );

        // get params of this function, we require the first param type
        // before we evaluate aliases, to determine if alias ends up in dispatch device
        auto params = cmdinfo.elem.findAll( "param" );
        string param0Type = getFullType( params[ 0 ] );

        // alias global and DispatchDevice functions
        if( alias_.length ) {

            // alias global scope functions
            content[ Section.funcAliases ] ~= Line( "alias %s%s = %s;".format( name, LJUST_NAME, alias_ ), nameLen );

            // alias dispatch device functions and partially device scope vulkan funcs (for VkDevice and VkCommandBuffer)
            if( param0Type == "VkDevice" || param0Type == "VkCommandBuffer" ) {
                content[ Section.convenAliases ] ~= Line( "alias %s%s = %s;".format( name.pySlice( 2 ), LJUST_NAME, alias_.pySlice( 2 )), nameLen );
                content[ Section.dispAliases   ] ~= Line( "alias %s%s = %s;".format( name, LJUST_NAME, alias_ ), nameLen );
                maxDFuncNameLen = max( maxDFuncNameLen, nameLen );
            }

            // second part of device scope vulkan funcs (for VkQueue, for which no convenience funcs exist)
            else if( param0Type == "VkQueue" ) {
                content[ Section.dispAliases   ] ~= Line( "alias %s%s = %s;".format( name, LJUST_NAME, alias_ ), nameLen );
                maxDFuncNameLen = max( maxDFuncNameLen, nameLen );
            }

            return;     // its either alias or full functions
        }

        // get and modify the return type to align functions for better readability
        string returnType = getFullType( cmdinfo.elem.find( "proto" )).strip;
        string doReturn = "";
        if( returnType == "void" )  returnType = "void    ";
        else                        doReturn = "return ";

        // catch and replace parameter names which are DLang keywords
        static string replaceKeyword( string name ) {
            switch( name ) {
                case "version"  : return "Version";
                case "module"   : return "Module";
                case "function" : return "Function";
                default         : return name;
            }
        }

        string paramDecl( Element param ) { return getFullType( param, true ).strip ~ " " ~ replaceKeyword( param.find( "name" ).text ); }

        // a parameter consist of a type and a name, here we merge all parameters into a list
        string joinedParams = params.map!paramDecl.join( ", " );

        // construct function pointer prototypes and declarations, keep track of each function name length for aligning purpose
        content[ Section.funcTypeAliases  ] ~= Line( "alias PFN_%s%s = %s  function( %s );".format( name, LJUST_NAME, returnType, joinedParams ), nameLen );
        content[ Section.funcDeclarations ] ~= Line( "PFN_%1$s%2$s %1$s;".format( name, LJUST_NAME ), nameLen );

        // ignore vkGetInstanceProcAddr, it must be loaded from implementation lib
        if( name == "vkGetInstanceProcAddr" ) {}

        // construct global level functions, which are used to parametrize and create a VkInstance
        else if( ![ "VkInstance", "VkPhysicalDevice", "VkDevice", "VkQueue", "VkCommandBuffer" ].canFind( param0Type )) {
            content[ Section.loadGFuncs ] ~= Line( "%1$s%2$s = cast( PFN_%1$s%2$s ) vkGetInstanceProcAddr( null, \"%1$s\" );".format( name, LJUST_NAME ), nameLen );
            maxGFuncNameLen = max( maxGFuncNameLen, nameLen );
        }

        // construct loader for instance level functions
        // vkGetDeviceProcAddr is an exception as it is an instance level function with param0Type == 'VkDevice'
        else if( param0Type == "VkPhysicalDevice" || param0Type == "VkInstance" || name == "vkGetDeviceProcAddr" ) {
            content[ Section.loadIFuncs ] ~= Line( "%1$s%2$s = cast( PFN_%1$s%2$s ) vkGetInstanceProcAddr( instance, \"%1$s\" );".format( name, LJUST_NAME ), nameLen );
            maxIFuncNameLen = max( maxIFuncNameLen, nameLen );
        }

        // construct loader for device and instance based device level functions as well as dispatch device convenience functions
        else {  // param0Type is one of VkDevice, VkQueue, VkCommandBuffer
            content[ Section.loadDFuncs ] ~= Line( "%1$s%2$s = cast( PFN_%1$s%2$s ) vkGet{INSTANCE_OR_DEVICE}ProcAddr( {instance_or_device}, \"%1$s\" );".format( name, LJUST_NAME ), nameLen );
            content[ Section.dispDeclarations ] ~= Line( "PFN_%1$s%2$s %1$s;".format( name, LJUST_NAME ), nameLen );
            maxDFuncNameLen = max( maxDFuncNameLen, nameLen );

            // for convenience functions we remove the first parameter if it is a VkDevice or VkCommandBuffer
            // additionally we remove the const( VkAllocationCallbacks )* pAllocator parameter
            // arguments are just the parameter names without their types, they will be used with the vk... member functions
            // VkDevice and VkAllocationCallbacks are both supplied by the DispatchDevice
            string joinedArgs = "";
            if( params.length > 1 )
                joinedArgs = ", " ~ params[ 1 .. $ ].map!( p => replaceKeyword( p.find( "name" ).text )).join( ", " );
            joinedParams = params[ 1 .. $ ]
                .filter!( p => !getFullType( p ).strip.startsWith( "const( VkAllocationCallbacks )*" ))
                .map!paramDecl.join( ", " );

            // create VkDevice and VkCommandBuffer convenience functions for DispatchDevice
            string firstArg = param0Type == "VkDevice" ? "vkDevice" : param0Type == "VkCommandBuffer" ? "commandBuffer" : null;
            if( firstArg.length )
                content[ Section.convenFuncs ] ~= Line( "%s  %s( %s ) { %s%s( %s%s ); }".format(
                    returnType, name.pySlice( 2 ), joinedParams, doReturn, name, firstArg, joinedArgs ).replace( "(  )", "()" ));
        }
    }
}
