/**
 * Generates the ErupteD Vulkan bindings from the Khronos vk.xml and video.xml registry
 *
 * to generate bindings run: erupt path/to/Vulkan-Docs (or Vulkan-Headers) outputDir
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module erupt;

import std.algorithm : endsWith, startsWith;
import std.file      : exists;
import std.path      : buildPath;
import std.stdio     : stderr, writeln;
import std.string    : lastIndexOf, stripRight;

import generator;
import registry;


enum USAGE = `usage: erupt [vulkan-docs-or-headers-dir] outputDirectory [--packagePrefix PREFIX] [--namePrefix PREFIX] [--indentString STRING] [-defaultExtensions NAME]

  vulkan-docs-or-headers-dir  Vulkan-Docs (xml/vk.xml) or Vulkan-Headers (registry/vk.xml) directory,
                              Vulkan-Headers is detected by the directory name ending with 'Headers'
                              if omitted, vk.xml and video.xml are expected in the current directory
  outputDirectory             directory receiving the generated D modules`;


int main( string[] args ) {
    auto options = new GeneratorOptions;
    string[] positional;

    // python argparse style options: --name value and --name=value
    for( size_t i = 1; i < args.length; ++i ) {
        string arg = args[ i ];
        if( arg == "-h" || arg == "--help" ) { writeln( USAGE ); return 0; }
        if( !arg.startsWith( "-" )) { positional ~= arg; continue; }

        string name = arg, value;
        auto eq = arg.lastIndexOf( '=' );
        if( eq > 0 ) { name = arg[ 0 .. eq ]; value = arg[ eq + 1 .. $ ]; }
        else if( i + 1 < args.length ) value = args[ ++i ];
        else { stderr.writeln( "Missing value for option ", arg, "\n", USAGE ); return 1; }

        switch( name ) {
            case "--packagePrefix"      : options.packagePrefix     = value; break;
            case "--namePrefix"         : options.namePrefix        = value; break;
            case "--indentString"       : options.indentString      = value; break;
            case "-defaultExtensions"   :
            case "--defaultExtensions"  : options.defaultExtensions = value; break;
            default: stderr.writeln( "Unknown option ", name, "\n", USAGE ); return 1;
        }
    }

    string vkXml = "vk.xml", videoXml = "video.xml";
    if( positional.length == 2 ) {
        string registryDir = positional[ 0 ].stripRight( "/\\" );
        if( registryDir.endsWith( "Headers" )) {
            vkXml    = buildPath( registryDir, "registry", "vk.xml" );
            videoXml = buildPath( registryDir, "registry", "video.xml" );
        } else {
            vkXml    = buildPath( registryDir, "xml", "vk.xml" );
            videoXml = buildPath( registryDir, "xml", "video.xml" );
        }
        options.directory = positional[ 1 ];
    } else if( positional.length == 1 ) {
        options.directory = positional[ 0 ];
    } else {
        stderr.writeln( USAGE );
        return 1;
    }

    foreach( xml; [ vkXml, videoXml ] )
        if( !xml.exists ) {
            stderr.writeln( "Could not find ", xml, ", please ensure that the first argument points to the Vulkan-Docs or Vulkan-Headers directory" );
            return 1;
        }

    options.currentXml = "vk";
    auto reg = new Registry( new Generator, options );
    reg.loadFile( vkXml );
    reg.apiGen;

    options.currentXml = "video";
    reg = new Registry( new Generator, options );
    reg.loadFile( videoXml );
    reg.apiGen;

    return 0;
}
