/**
 * Minimal xml dom, modeled after python's xml.etree.ElementTree
 *
 * Only what the vulkan registry requires is supported. Text is stored ElementTree style:
 * text is the data before the first child element, tail is the data after the element's end tag.
 * Comments, processing instructions and doctype declarations are dropped, data around them is merged.
 */
module xml;

import std.array     : appender, join, replace;
import std.algorithm : canFind, countUntil, startsWith, splitter;
import std.ascii     : isWhite;
import std.conv      : to;
import std.exception : enforce;
import std.utf       : encode;


struct Attribute {
    string name;
    string value;
}


final class Element {
    string      tag;
    Attribute[] attributes;
    string      text;       // null if element has no text
    string      tail;       // null if element has no tail
    Element[]   children;

    this( string tag ) { this.tag = tag; }


    /// python: name in elem.attrib
    bool has( string name ) {
        foreach( ref a; attributes ) if( a.name == name ) return true;
        return false;
    }


    /// python: elem.get( name ), null if attribute does not exist
    string get( string name ) {
        foreach( ref a; attributes ) if( a.name == name ) return a.value;
        return null;
    }


    /// python: elem.set( name, value )
    void set( string name, string value ) {
        foreach( ref a; attributes ) if( a.name == name ) { a.value = value; return; }
        attributes ~= Attribute( name, value );
    }


    /// python: elem.findall( path ), supports "tag", "a/b/c", "*" steps and ".//tag"
    /// returns a new array, hence children may be removed while iterating the result
    Element[] findAll( string path ) {
        if( path.startsWith( ".//" )) {
            Element[] result;
            collectDescendants( path[ 3 .. $ ], result );
            return result;
        }
        Element[] current = [ this ];
        foreach( step; path.splitter( '/' )) {
            Element[] next;
            foreach( e; current )
                foreach( c; e.children )
                    if( step == "*" || c.tag == step )
                        next ~= c;
            current = next;
        }
        return current;
    }


    /// python: elem.find( path ), null if nothing was found
    Element find( string path ) {
        auto result = findAll( path );
        return result.length ? result[ 0 ] : null;
    }


    /// python: elem.find( "tag[@name='value']" )
    Element findWithAttribute( string tag, string name, string value ) {
        foreach( c; children )
            if( c.tag == tag && c.get( name ) == value && c.has( name ))
                return c;
        return null;
    }


    private void collectDescendants( string tag, ref Element[] result ) {
        foreach( c; children ) {
            if( c.tag == tag ) result ~= c;
            c.collectDescendants( tag, result );
        }
    }


    /// python: elem.remove( child ), the tail of the child is removed as well
    void remove( Element child ) {
        auto i = children.countUntil!( c => c is child );
        enforce( i >= 0, "Element.remove: " ~ child.tag ~ " is not a child of " ~ tag );
        children = children[ 0 .. i ] ~ children[ i + 1 .. $ ];
    }


    /// python: elem.append( child )
    void append( Element child ) {
        children ~= child;
    }


    /// python: copy.deepcopy( elem )
    Element deepCopy() {
        auto result = new Element( tag );
        result.attributes = attributes.dup;
        result.text = text;
        result.tail = tail;
        result.children.reserve( children.length );
        foreach( c; children ) result.children ~= c.deepCopy;
        return result;
    }


    /// python: list( elem.itertext()), only non empty text pieces are included
    string[] iterText() {
        string[] result;
        iterText( result );
        return result;
    }

    private void iterText( ref string[] result ) {
        if( text.length ) result ~= text;
        foreach( c; children ) {
            c.iterText( result );
            if( c.tail.length ) result ~= c.tail;
        }
    }
}


/// parse an xml document and return its root element
Element parseXml( string source ) {
    // xml processors must normalize line breaks before parsing
    if( source.startsWith( "﻿" )) source = source[ "﻿".length .. $ ];
    if( source.canFind( '\r' )) source = source.replace( "\r\n", "\n" ).replace( "\r", "\n" );
    auto parser = Parser( source );
    return parser.parseDocument;
}


private:


struct Parser {
    string      src;
    size_t      pos;
    Element     root;
    Element[]   stack;

    // tree builder state, see python TreeBuilder: data goes into last.text or last.tail
    Element     last;
    bool        tailMode;
    string[]    data;

    this( string src ) { this.src = src; }


    Element parseDocument() {
        while( pos < src.length ) {
            if( src[ pos ] != '<' ) {
                auto end = src.indexOfFrom( '<', pos );
                if( stack.length || last !is null )
                    data ~= decodeEntities( src[ pos .. end ] );
                pos = end;
            }
            else if( src[ pos .. $ ].startsWith( "<!--" ))        skipPast( "-->" );
            else if( src[ pos .. $ ].startsWith( "<![CDATA[" )) {
                pos += "<![CDATA[".length;
                auto end = src.indexOfFrom( "]]>", pos );
                data ~= src[ pos .. end ];
                pos = end + 3;
            }
            else if( src[ pos .. $ ].startsWith( "<!" ))          skipPast( ">" );
            else if( src[ pos .. $ ].startsWith( "<?" ))          skipPast( "?>" );
            else if( src[ pos .. $ ].startsWith( "</" ))          parseEndTag;
            else                                                parseStartTag;
        }
        enforce( root !is null, "No xml root element found" );
        enforce( stack.length == 0, "Unclosed xml element: " ~ ( stack.length ? stack[ $ - 1 ].tag : "" ));
        return root;
    }


    void flush() {
        if( data.length == 0 ) return;
        string text = data.length == 1 ? data[ 0 ] : data.join;
        data.length = 0;
        if( last is null || text.length == 0 ) return;
        if( tailMode )  last.tail = text;
        else            last.text = text;
    }


    void skipPast( string terminator ) {
        auto end = src.indexOfFrom( terminator, pos );
        enforce( end < src.length, "Unterminated xml construct, expected " ~ terminator );
        pos = end + terminator.length;
    }


    void skipWhite() {
        while( pos < src.length && src[ pos ].isWhite ) ++pos;
    }


    string parseName() {
        auto start = pos;
        while( pos < src.length && !src[ pos ].isWhite && !"=/>".canFind( src[ pos ] )) ++pos;
        enforce( pos > start, "Expected xml name at offset " ~ start.to!string );
        return src[ start .. pos ];
    }


    void parseStartTag() {
        ++pos;  // '<'
        auto element = new Element( parseName );
        while( true ) {
            skipWhite;
            enforce( pos < src.length, "Unterminated xml start tag " ~ element.tag );
            if( src[ pos ] == '>' || src[ pos ] == '/' ) break;
            string name = parseName;
            skipWhite;
            enforce( src[ pos ] == '=', "Expected '=' after xml attribute " ~ name );
            ++pos;
            skipWhite;
            char quote = src[ pos++ ];
            enforce( quote == '"' || quote == '\'', "Expected quoted xml attribute value for " ~ name );
            auto end = src.indexOfFrom( quote, pos );
            string value = src[ pos .. end ];
            pos = end + 1;
            // attribute value normalization: literal white space characters become spaces
            if( value.canFind!( c => c == '\n' || c == '\t' ))
                value = value.replace( "\n", " " ).replace( "\t", " " );
            element.attributes ~= Attribute( name, decodeEntities( value ));
        }

        flush;
        if( stack.length )  stack[ $ - 1 ].children ~= element;
        else                root = element;
        stack ~= element;
        last = element;
        tailMode = false;

        if( src[ pos ] == '/' ) {   // self closing tag
            enforce( src[ pos + 1 ] == '>', "Expected '>' after '/' in xml element " ~ element.tag );
            pos += 2;
            endElement;
        } else {
            ++pos;
        }
    }


    void parseEndTag() {
        pos += 2;   // '</'
        string name = parseName;
        skipWhite;
        enforce( src[ pos ] == '>', "Expected '>' to close xml element " ~ name );
        ++pos;
        enforce( stack.length && stack[ $ - 1 ].tag == name, "Mismatched xml end tag " ~ name );
        endElement;
    }


    void endElement() {
        flush;
        last = stack[ $ - 1 ];
        stack = stack[ 0 .. $ - 1 ];
        tailMode = true;
    }
}


size_t indexOfFrom( T )( string s, T what, size_t from ) {
    import std.string : indexOf;
    auto i = s[ from .. $ ].indexOf( what );
    return i < 0 ? s.length : from + i;
}


string decodeEntities( string s ) {
    if( !s.canFind( '&' )) return s;
    auto result = appender!string;
    size_t i = 0;
    while( i < s.length ) {
        if( s[ i ] != '&' ) { result ~= s[ i++ ]; continue; }
        auto end = s.indexOfFrom( ';', i );
        enforce( end < s.length, "Unterminated xml entity" );
        string entity = s[ i + 1 .. end ];
        switch( entity ) {
            case "lt"   : result ~= '<';  break;
            case "gt"   : result ~= '>';  break;
            case "amp"  : result ~= '&';  break;
            case "quot" : result ~= '"';  break;
            case "apos" : result ~= '\''; break;
            default:
                enforce( entity.startsWith( "#" ), "Unknown xml entity &" ~ entity ~ ";" );
                dchar c = entity.startsWith( "#x" )
                    ? cast( dchar )entity[ 2 .. $ ].to!uint( 16 )
                    : cast( dchar )entity[ 1 .. $ ].to!uint;
                char[ 4 ] buf;
                result ~= buf[ 0 .. encode( buf, c ) ];
        }
        i = end + 1;
    }
    return result.data;
}
