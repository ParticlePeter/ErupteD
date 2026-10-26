/**
 * Templates of the generated D modules
 *
 * Placeholders use python str.format syntax: {NAME} is substituted, {{ and }} are literal braces
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module templates;

import std.array     : appender;
import std.exception : enforce;
import std.string    : indexOf;


/// substitute {NAME} placeholders with args[ NAME ] and unescape {{ and }}
string substitute( string tmpl, string[ string ] args ) {
    auto result = appender!string;
    size_t i = 0;
    while( i < tmpl.length ) {
        char c = tmpl[ i ];
        if( c == '{' && i + 1 < tmpl.length && tmpl[ i + 1 ] == '{' ) { result ~= '{'; i += 2; }
        else if( c == '}' && i + 1 < tmpl.length && tmpl[ i + 1 ] == '}' ) { result ~= '}'; i += 2; }
        else if( c == '{' ) {
            auto end = tmpl[ i .. $ ].indexOf( '}' );
            enforce( end > 0, "Unterminated template placeholder" );
            string key = tmpl[ i + 1 .. i + end ];
            auto value = key in args;
            enforce( value, "Missing template argument: " ~ key );
            result ~= *value;
            i += end + 1;
        }
        else { enforce( c != '}', "Single '}' in template" ); result ~= c; ++i; }
    }
    return result.data;
}



////////////////
// package.d  //
////////////////

enum PACKAGE_HEADER = `/**
 * Dlang vulkan types and function definitions package
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module {PACKAGE_PREFIX};
public import {PACKAGE_PREFIX}.types;
public import {PACKAGE_PREFIX}.functions;`;



//////////////
// types.d  //
//////////////

enum TYPES = `/**
 * Dlang vulkan type definitions
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module {PACKAGE_PREFIX}.types;

import {PACKAGE_PREFIX}.vk_video;
import std.bitmanip : bitfields;

nothrow @nogc:

// defined in vk_platform.h
alias uint8_t   = ubyte;
alias uint16_t  = ushort;
alias uint32_t  = uint;
alias uint64_t  = ulong;
alias int8_t    = byte;
alias int16_t   = short;
alias int32_t   = int;
alias int64_t   = long;


enum VK_NULL_HANDLE = null;

enum VK_DEFINE_HANDLE( string name ) = "struct " ~ name ~ "_T; alias " ~ name ~ " = " ~ name ~ "_T*;";

version( D_LP64 ) {{
    alias VK_DEFINE_NON_DISPATCHABLE_HANDLE( string name ) = VK_DEFINE_HANDLE!name;
    enum VK_NULL_ND_HANDLE = null;
}} else {{
    enum VK_DEFINE_NON_DISPATCHABLE_HANDLE( string name ) = "alias " ~ name ~ " = ulong;";
    enum VK_NULL_ND_HANDLE = 0uL;
}}


// Linkage of debug and allocation callbacks
extern( System ):

{TYPE_DEFINITIONS}
`;



/////////////////
// vk_video.d  //
/////////////////

enum VK_VIDEO = `/**
 * Dlang vulkan type definitions
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module {PACKAGE_PREFIX}.vk_video;

import std.bitmanip : bitfields;

nothrow @nogc:

// defined in vk_platform.h
alias uint8_t   = ubyte;
alias uint16_t  = ushort;
alias uint32_t  = uint;
alias uint64_t  = ulong;
alias int8_t    = byte;
alias int16_t   = short;
alias int32_t   = int;
alias int64_t   = long;

{TYPE_DEFINITIONS}
`;



//////////////////
// functions.d  //
//////////////////

enum FUNCS = `/**
 * Dlang vulkan function pointer prototypes, declarations and loader from vkGetInstanceProcAddr
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module {PACKAGE_PREFIX}.functions;

public import {PACKAGE_PREFIX}.types;

nothrow @nogc:


/// function type aliases
extern( System ) {{
{FUNC_TYPE_ALIASES}
}}


/// function declarations
__gshared {{
{FUNC_DECLARATIONS}
}}


/// sets vkCreateInstance function pointer and acquires basic functions to retrieve information about the implementation
/// and create an instance: vkEnumerateInstanceExtensionProperties, vkEnumerateInstanceLayerProperties, vkCreateInstance
void loadGlobalLevelFunctions( PFN_vkGetInstanceProcAddr getInstanceProcAddr ) {{
{IND}vkGetInstanceProcAddr = getInstanceProcAddr;
{GLOBAL_LEVEL_FUNCS}
}}


/// with a valid VkInstance call this function to retrieve additional VkInstance, VkPhysicalDevice, ... related functions
void loadInstanceLevelFunctions( VkInstance instance ) {{
{IND}assert( vkGetInstanceProcAddr !is null, "Function pointer vkGetInstanceProcAddr is null!\nCall loadGlobalLevelFunctions -> loadInstanceLevelFunctions" );
{INSTANCE_LEVEL_FUNCS}
}}


/// with a valid VkInstance call this function to retrieve VkDevice, VkQueue and VkCommandBuffer related functions
/// the functions call indirectly through the VkInstance and will be internally dispatched by the implementation
/// use loadDeviceLevelFunctions( VkDevice device ) bellow to avoid this indirection and get the pointers directly form a VkDevice
void loadDeviceLevelFunctions( VkInstance instance ) {{
{IND}assert( vkGetInstanceProcAddr !is null, "Function pointer vkGetInstanceProcAddr is null!\nCall loadGlobalLevelFunctions -> loadDeviceLevelFunctions( instance )" );
{DEVICE_I_LEVEL_FUNCS}
}}


/// with a valid VkDevice call this function to retrieve VkDevice, VkQueue and VkCommandBuffer related functions
/// the functions call directly VkDevice and related resources and can be retrieved for one and only one VkDevice
/// calling this function again with another VkDevices will overwrite the __gshared functions retrieved previously
/// see module {PACKAGE_PREFIX}.dispatch_device if multiple VkDevices will be used
void loadDeviceLevelFunctions( VkDevice device ) {{
{IND}assert( vkGetDeviceProcAddr !is null, "Function pointer vkGetDeviceProcAddr is null!\nCall loadGlobalLevelFunctions -> loadInstanceLevelFunctions -> loadDeviceLevelFunctions( device )" );
{DEVICE_D_LEVEL_FUNCS}
}}
`;



////////////////////////
// dispatch_device.d  //
////////////////////////

enum DISPATCH_DEVICE = `/**
 * Dlang vulkan device related func loader as struct members
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module {PACKAGE_PREFIX}.dispatch_device;

public import {PACKAGE_PREFIX}.types;
import {PACKAGE_PREFIX}.functions;

nothrow @nogc:


/// struct to group per device device level functions into a custom namespace
/// keeps track of the device to which the functions are bound
/// additionally to the device related vulkan functions, convenience functions exist
/// with same name but omitting the vk prefix as well as the first (VkDevice) parameter
/// these functions forward to their vk counterparts using the VkDevice member of the DispatchDevice
/// Moreover the same convenience functions exist for vkCmd... functions. In this case the
/// first parameter is substituted with the public member VkCommandBuffer commandBuffer,
/// which must have been set to a valid command buffer before usage.
struct DispatchDevice {{

{IND}private VkDevice                           device          = VK_NULL_HANDLE;
{IND}private const( VkAllocationCallbacks )*    allocator       = null;
{IND}VkCommandBuffer                            commandBuffer   = VK_NULL_HANDLE;


{IND}/// return copy of the internal VkDevice
{IND}VkDevice vkDevice() {{
{IND}{IND}return device;
{IND}}}


{IND}/// return const allocator address
{IND}const( VkAllocationCallbacks )* pAllocator() {{
{IND}{IND}return allocator;
{IND}}}


{IND}/// constructor forwards parameter 'device' to 'this.loadDeviceLevelFunctions'
{IND}this( VkDevice device, const( VkAllocationCallbacks )* allocator = null ) {{
{IND}{IND}this.loadDeviceLevelFunctions( device );
{IND}}}


{IND}/// load the device level member functions
{IND}/// this also sets the private member 'device' to the passed in VkDevice
{IND}/// as well as the otional host allocator
{IND}/// if a custom allocator is required it must be specified here and cannot be changed throughout the liftime of the device
{IND}/// now the DispatchDevice can be used e.g.:
{IND}///      auto dd = DispatchDevice( device );
{IND}///      dd.vkDestroyDevice( dd.vkDevice, pAllocator );
{IND}/// convenience functions to omit the first arg and the allocator do exist, see bellow
{IND}void loadDeviceLevelFunctions( VkDevice device, const( VkAllocationCallbacks )* allocator = null ) {{
{IND}{IND}assert( vkGetInstanceProcAddr !is null, "Function pointer vkGetInstanceProcAddr is null!\nCall loadGlobalLevelFunctions -> loadInstanceLevelFunctions -> DispatchDevice.loadDeviceLevelFunctions" );
{IND}{IND}this.allocator = allocator;
{IND}{IND}this.device = device;
{DISPATCH_MEMBER_FUNCS}
{IND}}}


{IND}/// convenience member functions, forwarded to corresponding vulkan functions
{IND}/// parameters of type VkDevice, const( VkAllocationCallbacks )* and VkCommandBuffer are omitted
{IND}/// they will be supplied by the member properties vkDevice, pAllocator and the public member commandBuffer
{IND}/// e.g.:
{IND}///      auto dd = DispatchDevice( device );
{IND}///      dd.DestroyDevice();       // instead of: dd.vkDestroyDevice( dd.vkDevice, pAllocator );
{IND}///
{IND}/// Same mechanism works with functions which require a VkCommandBuffer as first arg
{IND}/// In this case the public member 'commandBuffer' must be set beforehand
{IND}/// e.g.:
{IND}///      dd.commandBuffer = some_command_buffer;
{IND}///      dd.BeginCommandBuffer( &beginInfo );
{IND}///      dd.CmdBindPipeline( VK_PIPELINE_BIND_POINT_GRAPHICS, some_pipeline );
{IND}///
{IND}/// Does not work with queues, there are just too few queue related functions
{DISPATCH_CONVENIENCE_FUNCS}


{IND}/// member function pointer decelerations
{DISPATCH_FUNC_DECLARATIONS}
}}
`;



////////////////////////////
// platform_extensions.d  //
////////////////////////////

enum STATIC_IF_EXTENSION = `
{IND}// VK_{EXTENSION}{COMMENT}
{IND}{ELSE_PREFIX}static if( __traits( isSame, extension, {EXTENSION} )) {{
{SECTIONS}
{IND}}}
`;


enum PLATFORM_EXTENSIONS = `/**
 * Dlang vulkan platform specific types and functions as mixin template
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module {PACKAGE_PREFIX}.platform_extensions;

/// define platform extension names as enums
/// these enums can be used directly in Platform_Extensions mixin template
{PLATFORM_EXTENSIONS}


/// extensions to a specific platform are grouped in these enum sequences
import std.meta : AliasSeq;
{PLATFORM_PROTECTIONS}


/// instantiate platform and extension specific code with this mixin template
/// required types and data structures must be imported into the module where
/// this template is instantiated
mixin template Platform_Extensions( extensions... ) {{

{IND}// publicly import erupted package modules
{IND}public import {PACKAGE_PREFIX}.types;
{IND}public import {PACKAGE_PREFIX}.functions;
{IND}import {PACKAGE_PREFIX}.dispatch_device;

{IND}// mixin function linkage, nothrow and @nogc attributes for subsecuent functions
{IND}extern(System) nothrow @nogc:

{IND}// remove duplicates from alias sequence
{IND}// this might happen if a platform extension collection AND a single extension, which is included in the collection, was specified
{IND}// e.g.: mixin Platform_Extensions!( VK_USE_PLATFORM_WIN32_KHR, VK_KHR_external_memory_win32 );
{IND}import std.meta : NoDuplicates;
{IND}alias noDuplicateExtensions = NoDuplicates!extensions;

{IND}// 1. loop through alias sequence and mixin corresponding
{IND}// extension types, aliased function pointer type definitions and __gshared function pointer declarations
{IND}static foreach( extension; noDuplicateExtensions ) {{
{TYPE_DEFINITIONS}

{IND}{IND}__gshared {{
{FUNC_DECLARATIONS}
{IND}{IND}}}
{IND}}}

{IND}// workaround for not being able to mixin two overloads with the same symbol name
{IND}alias loadDeviceLevelFunctionsExt = loadDeviceLevelFunctionsExtI;
{IND}alias loadDeviceLevelFunctionsExt = loadDeviceLevelFunctionsExtD;

{IND}// backwards compatibility aliases
{IND}alias loadInstanceLevelFunctions = loadInstanceLevelFunctionsExt;
{IND}alias loadDeviceLevelFunctions = loadDeviceLevelFunctionsExt;
{IND}alias DispatchDevice = DispatchDeviceExt;

{IND}// compose loadInstanceLevelFunctionsExt function out of unextended
{IND}// loadInstanceLevelFunctions and additional function pointers from extensions
{IND}void loadInstanceLevelFunctionsExt( VkInstance instance ) {{

{IND}{IND}// first load all non platform related function pointers from implementation
{IND}{IND}{PACKAGE_PREFIX}.functions.loadInstanceLevelFunctions( instance );

{IND}{IND}// 2. loop through alias sequence and mixin corresponding
{IND}{IND}// instance level function pointer definitions
{IND}{IND}static foreach( extension; noDuplicateExtensions ) {{
{INSTANCE_LEVEL_FUNCS}
{IND}{IND}}}
{IND}}}

{IND}// compose instance based loadDeviceLevelFunctionsExtI function out of unextended
{IND}// loadDeviceLevelFunctions and additional function pointers from extensions
{IND}// suffix I is required, as we cannot mixin mixin two overloads with the same symbol name (any more!)
{IND}void loadDeviceLevelFunctionsExtI( VkInstance instance ) {{

{IND}{IND}// first load all non platform related function pointers from implementation
{IND}{IND}{PACKAGE_PREFIX}.functions.loadDeviceLevelFunctions( instance );

{IND}{IND}// 3. loop through alias sequence and mixin corresponding
{IND}{IND}// instance based device level function pointer definitions
{IND}{IND}static foreach( extension; noDuplicateExtensions ) {{
{DEVICE_I_LEVEL_FUNCS}
{IND}{IND}}}
{IND}}}

{IND}// compose device based loadDeviceLevelFunctionsExtD function out of unextended
{IND}// loadDeviceLevelFunctions and additional function pointers from extensions
{IND}// suffix D is required as, we cannot mixin mixin two overloads with the same symbol name (any more!)
{IND}void loadDeviceLevelFunctionsExtD( VkDevice device ) {{

{IND}{IND}// first load all non platform related function pointers from implementation
{IND}{IND}erupted.functions.loadDeviceLevelFunctions( device );

{IND}{IND}// 4. loop through alias sequence and mixin corresponding
{IND}{IND}// device based device level function pointer definitions
{IND}{IND}static foreach( extension; noDuplicateExtensions ) {{
{DEVICE_D_LEVEL_FUNCS}
{IND}{IND}}}
{IND}}}

{IND}// compose extended dispatch device out of unextended original dispatch device with
{IND}// extended, device based loadDeviceLevelFunctionsExt member function,
{IND}// device and command buffer based function pointer decelerations
{IND}struct DispatchDeviceExt {{

{IND}{IND}// use unextended dispatch device from module {PACKAGE_PREFIX}.functions as member and alias this
{IND}{IND}{PACKAGE_PREFIX}.dispatch_device.DispatchDevice commonDispatchDevice;
{IND}{IND}alias commonDispatchDevice this;

{IND}{IND}// Constructor forwards parameter 'device' to 'loadDeviceLevelFunctionsExt'
{IND}{IND}this( VkDevice device ) {{
{IND}{IND}{IND}loadDeviceLevelFunctionsExt( device );
{IND}{IND}}}

{IND}{IND}// backwards compatibility alias
{IND}{IND}alias loadDeviceLevelFunctions = loadDeviceLevelFunctionsExt;

{IND}{IND}// compose device based loadDeviceLevelFunctionsExt member function out of unextended
{IND}{IND}// loadDeviceLevelFunctions and additional member function pointers from extensions
{IND}{IND}void loadDeviceLevelFunctionsExt( VkDevice device ) {{

{IND}{IND}{IND}// first load all non platform related member function pointers of wrapped commonDispatchDevice
{IND}{IND}{IND}commonDispatchDevice.loadDeviceLevelFunctions( device );

{IND}{IND}{IND}// 5. loop through alias sequence and mixin corresponding
{IND}{IND}{IND}// device level member function pointer definitions of this wrapping DispatchDevice
{IND}{IND}{IND}static foreach( extension; noDuplicateExtensions ) {{
{DISPATCH_MEMBER_FUNCS}
{IND}{IND}{IND}}}
{IND}{IND}}}

{IND}{IND}// 6. loop through alias sequence and mixin corresponding convenience member functions
{IND}{IND}// omitting device parameter of this wrapping DispatchDevice. Member vkDevice of commonDispatchDevice is used instead
{IND}{IND}static foreach( extension; noDuplicateExtensions ) {{
{DISPATCH_CONVENIENCE_FUNCS}
{IND}{IND}}}

{IND}{IND}// 7. loop last time through alias sequence and mixin corresponding function pointer declarations
{IND}{IND}static foreach( extension; noDuplicateExtensions ) {{
{DISPATCH_FUNC_DECLARATIONS}
{IND}{IND}}}
{IND}}}
}}`;



//////////////////////////
// vulkan_lib_loader.d  //
//////////////////////////

enum LIB_LOADER = `/**
 * Dlang vulkan lib loader retrieving vkGetInstanceProcAddr for windows, macos and posix systems
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module {PACKAGE_PREFIX}.vulkan_lib_loader;

import {PACKAGE_PREFIX}.functions;
import core.stdc.stdio : fprintf, stderr, FILE;

nothrow @nogc:


/// private helper functions for windows platform
version( Windows ) {{
private:
{IND}import core.sys.windows.windows;
{IND}HMODULE         vulkan_lib  = null;
{IND}auto loadLib()  {{ return LoadLibrary( "vulkan-1.dll" ); }}
{IND}bool freeLib()  {{ return FreeLibrary( vulkan_lib ) != 0; }}
{IND}auto loadSym()  {{ return cast( PFN_vkGetInstanceProcAddr )GetProcAddress( vulkan_lib, "vkGetInstanceProcAddr" ); }}
{IND}void logLibError( FILE* log_stream, const( char )* message ) {{
{IND}{IND}fprintf( log_stream, "%svulkan-1.dll! Error code: 0x%x\n", message, GetLastError());
{IND}}}
}}


/// private helper functions for android platform
else version( Android ) {{
private:
{IND}import core.sys.posix.dlfcn : dlerror, dlopen, dlclose, dlsym, RTLD_NOW, RTLD_LOCAL;
{IND}void*           vulkan_lib  = null;
{IND}auto loadLib()  {{ return dlopen( "libvulkan.so", RTLD_NOW | RTLD_LOCAL ); }}
{IND}bool freeLib()  {{ return dlclose( vulkan_lib ) == 0; }}
{IND}auto loadSym()  {{ return cast( PFN_vkGetInstanceProcAddr )dlsym( vulkan_lib, "vkGetInstanceProcAddr" ); }}
{IND}void logLibError( FILE* log_stream, const( char )* message ) {{
{IND}{IND}fprintf( log_stream, "%slibvulkan.so.1! Error: %s\n", message, dlerror );
{IND}}}
}}


/// private helper functions for macos platforms
else version( OSX ) {{
private:
{IND}import core.sys.posix.dlfcn : dlerror, dlopen, dlclose, dlsym, RTLD_LAZY, RTLD_LOCAL;
{IND}void*           vulkan_lib  = null;
{IND}auto loadLib()  {{ return dlopen( "libvulkan.1.dylib", RTLD_LAZY | RTLD_LOCAL ); }}
{IND}bool freeLib()  {{ return dlclose( vulkan_lib ) == 0; }}
{IND}auto loadSym()  {{ return cast( PFN_vkGetInstanceProcAddr )dlsym( vulkan_lib, "vkGetInstanceProcAddr" ); }}
{IND}void logLibError( FILE* log_stream, const( char )* message ) {{
{IND}{IND}fprintf( log_stream, "%slibvulkan.1.dylib! Error: %s\n", message, dlerror );
{IND}}}
}}


/// private helper functions for posix platforms
else version( Posix ) {{
private:
{IND}import core.sys.posix.dlfcn : dlerror, dlopen, dlclose, dlsym, RTLD_LAZY, RTLD_LOCAL;
{IND}void*           vulkan_lib  = null;
{IND}auto loadLib()  {{ return dlopen( "libvulkan.so.1", RTLD_LAZY | RTLD_LOCAL ); }}
{IND}bool freeLib()  {{ return dlclose( vulkan_lib ) == 0; }}
{IND}auto loadSym()  {{ return cast( PFN_vkGetInstanceProcAddr )dlsym( vulkan_lib, "vkGetInstanceProcAddr" ); }}
{IND}void logLibError( FILE* log_stream, const( char )* message ) {{
{IND}{IND}fprintf( log_stream, "%slibvulkan.so.1! Error: %s\n", message, dlerror );
{IND}}}
}}


/// tries to load the platform vulkan dynamic link library
/// the library handle / pointer is stored privately in this module
/// errors are reported to a specifiable stream which is standard error by default
/// Params:
///     log_stream = file stream to receive error messages, default stderr
/// Returns: true if the vulkan lib could be loaded, false otherwise
bool loadVulkanLib( FILE* log_stream = stderr ) {{
{IND}vulkan_lib = loadLib;
{IND}if( !vulkan_lib ) {{
{IND}{IND}logLibError( log_stream, "Could not load " );
{IND}{IND}return false;
{IND}}} else {{
{IND}{IND}return true;
{IND}}}
}}


/// tries to load the vkGetInstanceProcAddr function from the module private lib handle / pointer
/// if the lib was not loaded so far loadVulkanLib is called
/// errors are reported to a specifiable stream which is standard error by default
/// Params:
///     log_stream = file stream to receive error messages, default stderr
/// Returns: vkGetInstanceProcAddr if it could be loaded from the lib, null otherwise
PFN_vkGetInstanceProcAddr loadGetInstanceProcAddr( FILE* log_stream = stderr ) {{
{IND}if( !vulkan_lib && !loadVulkanLib( log_stream )) {{
{IND}{IND}fprintf( log_stream, "Cannot not retrieve vkGetInstanceProcAddr as vulkan lib is not loaded!" );
{IND}{IND}return null;
{IND}}}
{IND}auto getInstanceProcAddr = loadSym;
{IND}if( !getInstanceProcAddr )
{IND}{IND}logLibError( log_stream, "Could not retrieve vkGetInstanceProcAddr from " );
{IND}return getInstanceProcAddr;
}}


/// tries to free / unload the previously loaded platform vulkan lib
/// errors are reported to a specifiable stream which is standard error by default
/// Params:
///     log_stream = file stream to receive error messages, default stderr
/// Returns: true if the vulkan lib could be freed, false otherwise
bool freeVulkanLib( FILE* log_stream = stderr ) {{
{IND}if( !vulkan_lib ) {{
{IND}{IND}fprintf( log_stream, "Cannot free vulkan lib as it is not loaded!" );
{IND}{IND}return false;
{IND}}} else if( !freeLib() ) {{
{IND}{IND}logLibError( log_stream, "Could not unload " );
{IND}{IND}return false;
{IND}}} else {{
{IND}{IND}return true;
{IND}}}
}}


/// Combines loadVulkanLib, loadGetInstanceProcAddr and loadGlobalLevelFunctions( PFN_vkGetInstanceProcAddr )
/// from module {PACKAGE_PREFIX}.functions. If this function succeeds the function vkGetInstanceProcAddr
/// from module {PACKAGE_PREFIX}.functions can be used freely. Moreover the required functions to initialize a
/// vulkan instance a vkEnumerateInstanceExtensionProperties, vkEnumerateInstanceLayerProperties and vkCreateInstance
/// are available as well. To get all the other functions an vulkan instance must be created and with it
/// loadInstanceLevelFunctions be called from either {PACKAGE_PREFIX}.functions or through a custom tailored module
/// with mixed in extensions through the {PACKAGE_PREFIX}.platform.mixin_extensions mechanism.
/// Additional device based functions can then be loaded with loadDeviceLevelFunctions passing in the instance or
/// with creating a vulkan device beforehand and calling the same function with it.
///
/// Note: as this function indirectly calls loadVulkanLib loading the vulkan lib, freeVulkanLib should be called
///       at some point in the process to cleanly free / unload the lib
/// all errors during vulkan lib loading and vkGetInstanceProcAddr retrieving are reported to log_stream, default stderr
///     log_stream = file stream to receive error messages, default stderr
/// Returns: true if the vulkan lib could be freed, false otherwise
bool loadGlobalLevelFunctions( FILE* log_stream = stderr ) {{
{IND}auto getInstanceProcAddr = loadGetInstanceProcAddr( log_stream );
{IND}if( !getInstanceProcAddr ) return false;
{IND}{PACKAGE_PREFIX}.functions.loadGlobalLevelFunctions( getInstanceProcAddr );
{IND}return true;
}}

`;
