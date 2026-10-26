/**
 * Dlang vulkan platform specific types and functions as mixin template
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module erupted.platform_extensions;

/// define platform extension names as enums
/// these enums can be used directly in Platform_Extensions mixin template
enum KHR_xlib_surface;
enum KHR_xcb_surface;
enum KHR_wayland_surface;
enum KHR_android_surface;
enum KHR_win32_surface;
enum KHR_external_memory_win32;
enum KHR_win32_keyed_mutex;
enum KHR_external_semaphore_win32;
enum KHR_external_fence_win32;
enum KHR_portability_subset;
enum GGP_stream_descriptor_surface;
enum NV_external_memory_win32;
enum NV_win32_keyed_mutex;
enum NN_vi_surface;
enum EXT_acquire_xlib_display;
enum MVK_ios_surface;
enum MVK_macos_surface;
enum ANDROID_external_memory_android_hardware_buffer;
enum AMDX_shader_enqueue;
enum GGP_frame_token;
enum FUCHSIA_imagepipe_surface;
enum EXT_metal_surface;
enum EXT_full_screen_exclusive;
enum NV_cuda_kernel_launch;
enum EXT_metal_objects;
enum NV_acquire_winrt_display;
enum EXT_directfb_surface;
enum FUCHSIA_external_memory;
enum FUCHSIA_external_semaphore;
enum FUCHSIA_buffer_collection;
enum QNX_screen_surface;
enum NV_displacement_micromap;
enum OHOS_external_memory;
enum ANDROID_external_format_resolve;
enum AMDX_dense_geometry_format;
enum QNX_external_memory_screen_buffer;
enum OHOS_surface;
enum EXT_external_memory_metal;
enum SEC_ubm_surface;


/// extensions to a specific platform are grouped in these enum sequences
import std.meta : AliasSeq;
alias USE_PLATFORM_XLIB_KHR        = AliasSeq!( KHR_xlib_surface );
alias USE_PLATFORM_XCB_KHR         = AliasSeq!( KHR_xcb_surface );
alias USE_PLATFORM_WAYLAND_KHR     = AliasSeq!( KHR_wayland_surface );
alias USE_PLATFORM_ANDROID_KHR     = AliasSeq!( KHR_android_surface, ANDROID_external_memory_android_hardware_buffer, ANDROID_external_format_resolve );
alias USE_PLATFORM_WIN32_KHR       = AliasSeq!( KHR_win32_surface, KHR_external_memory_win32, KHR_win32_keyed_mutex, KHR_external_semaphore_win32, KHR_external_fence_win32, NV_external_memory_win32, NV_win32_keyed_mutex, EXT_full_screen_exclusive, NV_acquire_winrt_display );
alias ENABLE_BETA_EXTENSIONS       = AliasSeq!( KHR_portability_subset, AMDX_shader_enqueue, NV_cuda_kernel_launch, NV_displacement_micromap, AMDX_dense_geometry_format );
alias USE_PLATFORM_GGP             = AliasSeq!( GGP_stream_descriptor_surface, GGP_frame_token );
alias USE_PLATFORM_VI_NN           = AliasSeq!( NN_vi_surface );
alias USE_PLATFORM_XLIB_XRANDR_EXT = AliasSeq!( EXT_acquire_xlib_display );
alias USE_PLATFORM_IOS_MVK         = AliasSeq!( MVK_ios_surface );
alias USE_PLATFORM_MACOS_MVK       = AliasSeq!( MVK_macos_surface );
alias USE_PLATFORM_FUCHSIA         = AliasSeq!( FUCHSIA_imagepipe_surface, FUCHSIA_external_memory, FUCHSIA_external_semaphore, FUCHSIA_buffer_collection );
alias USE_PLATFORM_METAL_EXT       = AliasSeq!( EXT_metal_surface, EXT_metal_objects, EXT_external_memory_metal );
alias USE_PLATFORM_DIRECTFB_EXT    = AliasSeq!( EXT_directfb_surface );
alias USE_PLATFORM_SCREEN_QNX      = AliasSeq!( QNX_screen_surface, QNX_external_memory_screen_buffer );
alias USE_PLATFORM_OHOS            = AliasSeq!( OHOS_external_memory, OHOS_surface );
alias USE_PLATFORM_UBM_SEC         = AliasSeq!( SEC_ubm_surface );



/// instantiate platform and extension specific code with this mixin template
/// required types and data structures must be imported into the module where
/// this template is instantiated
mixin template Platform_Extensions( extensions... ) {

    // publicly import erupted package modules
    public import erupted.types;
    public import erupted.functions;
    import erupted.dispatch_device;

    // mixin function linkage, nothrow and @nogc attributes for subsecuent functions
    extern(System) nothrow @nogc:

    // remove duplicates from alias sequence
    // this might happen if a platform extension collection AND a single extension, which is included in the collection, was specified
    // e.g.: mixin Platform_Extensions!( VK_USE_PLATFORM_WIN32_KHR, VK_KHR_external_memory_win32 );
    import std.meta : NoDuplicates;
    alias noDuplicateExtensions = NoDuplicates!extensions;

    // 1. loop through alias sequence and mixin corresponding
    // extension types, aliased function pointer type definitions and __gshared function pointer declarations
    static foreach( extension; noDuplicateExtensions ) {

        // VK_KHR_xlib_surface : types and function pointer type aliases
        static if( __traits( isSame, extension, KHR_xlib_surface )) {
            enum VK_KHR_xlib_surface = 1;

            enum VK_KHR_XLIB_SURFACE_SPEC_VERSION = 6;
            enum const( char )* VK_KHR_XLIB_SURFACE_EXTENSION_NAME = "VK_KHR_xlib_surface";
            
            alias VkXlibSurfaceCreateFlagsKHR = VkFlags;
            
            struct VkXlibSurfaceCreateInfoKHR {
                VkStructureType              sType = VK_STRUCTURE_TYPE_XLIB_SURFACE_CREATE_INFO_KHR;
                const( void )*               pNext;
                VkXlibSurfaceCreateFlagsKHR  flags;
                Display*                     dpy;
                Window                       window;
            }
            
            alias PFN_vkCreateXlibSurfaceKHR                                               = VkResult  function( VkInstance instance, const( VkXlibSurfaceCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
            alias PFN_vkGetPhysicalDeviceXlibPresentationSupportKHR                        = VkBool32  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, Display* dpy, VisualID visualID );
        }

        // VK_KHR_xcb_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, KHR_xcb_surface )) {
            enum VK_KHR_xcb_surface = 1;

            enum VK_KHR_XCB_SURFACE_SPEC_VERSION = 6;
            enum const( char )* VK_KHR_XCB_SURFACE_EXTENSION_NAME = "VK_KHR_xcb_surface";
            
            alias VkXcbSurfaceCreateFlagsKHR = VkFlags;
            
            struct VkXcbSurfaceCreateInfoKHR {
                VkStructureType             sType = VK_STRUCTURE_TYPE_XCB_SURFACE_CREATE_INFO_KHR;
                const( void )*              pNext;
                VkXcbSurfaceCreateFlagsKHR  flags;
                xcb_connection_t*           connection;
                xcb_window_t                window;
            }
            
            alias PFN_vkCreateXcbSurfaceKHR                                                = VkResult  function( VkInstance instance, const( VkXcbSurfaceCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
            alias PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR                         = VkBool32  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, xcb_connection_t* connection, xcb_visualid_t visual_id );
        }

        // VK_KHR_wayland_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, KHR_wayland_surface )) {
            enum VK_KHR_wayland_surface = 1;

            enum VK_KHR_WAYLAND_SURFACE_SPEC_VERSION = 6;
            enum const( char )* VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME = "VK_KHR_wayland_surface";
            
            alias VkWaylandSurfaceCreateFlagsKHR = VkFlags;
            
            struct VkWaylandSurfaceCreateInfoKHR {
                VkStructureType                 sType = VK_STRUCTURE_TYPE_WAYLAND_SURFACE_CREATE_INFO_KHR;
                const( void )*                  pNext;
                VkWaylandSurfaceCreateFlagsKHR  flags;
                const( wl_display )*            display;
                const( wl_surface )*            surface;
            }
            
            alias PFN_vkCreateWaylandSurfaceKHR                                            = VkResult  function( VkInstance instance, const( VkWaylandSurfaceCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
            alias PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR                     = VkBool32  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, const( wl_display )* display );
        }

        // VK_KHR_android_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, KHR_android_surface )) {
            enum VK_KHR_android_surface = 1;

            enum VK_KHR_ANDROID_SURFACE_SPEC_VERSION = 6;
            enum const( char )* VK_KHR_ANDROID_SURFACE_EXTENSION_NAME = "VK_KHR_android_surface";
            
            alias VkAndroidSurfaceCreateFlagsKHR = VkFlags;
            
            struct VkAndroidSurfaceCreateInfoKHR {
                VkStructureType                 sType = VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR;
                const( void )*                  pNext;
                VkAndroidSurfaceCreateFlagsKHR  flags;
                const( ANativeWindow )*         window;
            }
            
            alias PFN_vkCreateAndroidSurfaceKHR                                            = VkResult  function( VkInstance instance, const( VkAndroidSurfaceCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
        }

        // VK_KHR_win32_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, KHR_win32_surface )) {
            enum VK_KHR_win32_surface = 1;

            enum VK_KHR_WIN32_SURFACE_SPEC_VERSION = 6;
            enum const( char )* VK_KHR_WIN32_SURFACE_EXTENSION_NAME = "VK_KHR_win32_surface";
            
            alias VkWin32SurfaceCreateFlagsKHR = VkFlags;
            
            struct VkWin32SurfaceCreateInfoKHR {
                VkStructureType               sType = VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR;
                const( void )*                pNext;
                VkWin32SurfaceCreateFlagsKHR  flags;
                HINSTANCE                     hinstance;
                HWND                          hwnd;
            }
            
            alias PFN_vkCreateWin32SurfaceKHR                                              = VkResult  function( VkInstance instance, const( VkWin32SurfaceCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
            alias PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR                       = VkBool32  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex );
        }

        // VK_KHR_external_memory_win32 : types and function pointer type aliases
        else static if( __traits( isSame, extension, KHR_external_memory_win32 )) {
            enum VK_KHR_external_memory_win32 = 1;

            enum VK_KHR_EXTERNAL_MEMORY_WIN32_SPEC_VERSION = 1;
            enum const( char )* VK_KHR_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME = "VK_KHR_external_memory_win32";
            
            struct VkImportMemoryWin32HandleInfoKHR {
                VkStructureType                     sType = VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_KHR;
                const( void )*                      pNext;
                VkExternalMemoryHandleTypeFlagBits  handleType;
                HANDLE                              handle;
                LPCWSTR                             name;
            }
            
            struct VkExportMemoryWin32HandleInfoKHR {
                VkStructureType                sType = VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_KHR;
                const( void )*                 pNext;
                const( SECURITY_ATTRIBUTES )*  pAttributes;
                DWORD                          dwAccess;
                LPCWSTR                        name;
            }
            
            struct VkMemoryWin32HandlePropertiesKHR {
                VkStructureType  sType = VK_STRUCTURE_TYPE_MEMORY_WIN32_HANDLE_PROPERTIES_KHR;
                void*            pNext;
                uint32_t         memoryTypeBits;
            }
            
            struct VkMemoryGetWin32HandleInfoKHR {
                VkStructureType                     sType = VK_STRUCTURE_TYPE_MEMORY_GET_WIN32_HANDLE_INFO_KHR;
                const( void )*                      pNext;
                VkDeviceMemory                      memory;
                VkExternalMemoryHandleTypeFlagBits  handleType;
            }
            
            alias PFN_vkGetMemoryWin32HandleKHR                                            = VkResult  function( VkDevice device, const( VkMemoryGetWin32HandleInfoKHR )* pGetWin32HandleInfo, HANDLE* pHandle );
            alias PFN_vkGetMemoryWin32HandlePropertiesKHR                                  = VkResult  function( VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, HANDLE handle, VkMemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties );
        }

        // VK_KHR_win32_keyed_mutex : types and function pointer type aliases
        else static if( __traits( isSame, extension, KHR_win32_keyed_mutex )) {
            enum VK_KHR_win32_keyed_mutex = 1;

            enum VK_KHR_WIN32_KEYED_MUTEX_SPEC_VERSION = 1;
            enum const( char )* VK_KHR_WIN32_KEYED_MUTEX_EXTENSION_NAME = "VK_KHR_win32_keyed_mutex";
            
            struct VkWin32KeyedMutexAcquireReleaseInfoKHR {
                VkStructureType           sType = VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR;
                const( void )*            pNext;
                uint32_t                  acquireCount;
                const( VkDeviceMemory )*  pAcquireSyncs;
                const( uint64_t )*        pAcquireKeys;
                const( uint32_t )*        pAcquireTimeouts;
                uint32_t                  releaseCount;
                const( VkDeviceMemory )*  pReleaseSyncs;
                const( uint64_t )*        pReleaseKeys;
            }
            
        }

        // VK_KHR_external_semaphore_win32 : types and function pointer type aliases
        else static if( __traits( isSame, extension, KHR_external_semaphore_win32 )) {
            enum VK_KHR_external_semaphore_win32 = 1;

            enum VK_KHR_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION = 1;
            enum const( char )* VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME = "VK_KHR_external_semaphore_win32";
            
            struct VkImportSemaphoreWin32HandleInfoKHR {
                VkStructureType                        sType = VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR;
                const( void )*                         pNext;
                VkSemaphore                            semaphore;
                VkSemaphoreImportFlags                 flags;
                VkExternalSemaphoreHandleTypeFlagBits  handleType;
                HANDLE                                 handle;
                LPCWSTR                                name;
            }
            
            struct VkExportSemaphoreWin32HandleInfoKHR {
                VkStructureType                sType = VK_STRUCTURE_TYPE_EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR;
                const( void )*                 pNext;
                const( SECURITY_ATTRIBUTES )*  pAttributes;
                DWORD                          dwAccess;
                LPCWSTR                        name;
            }
            
            struct VkD3D12FenceSubmitInfoKHR {
                VkStructureType     sType = VK_STRUCTURE_TYPE_D3D12_FENCE_SUBMIT_INFO_KHR;
                const( void )*      pNext;
                uint32_t            waitSemaphoreValuesCount;
                const( uint64_t )*  pWaitSemaphoreValues;
                uint32_t            signalSemaphoreValuesCount;
                const( uint64_t )*  pSignalSemaphoreValues;
            }
            
            struct VkSemaphoreGetWin32HandleInfoKHR {
                VkStructureType                        sType = VK_STRUCTURE_TYPE_SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR;
                const( void )*                         pNext;
                VkSemaphore                            semaphore;
                VkExternalSemaphoreHandleTypeFlagBits  handleType;
            }
            
            alias PFN_vkImportSemaphoreWin32HandleKHR                                      = VkResult  function( VkDevice device, const( VkImportSemaphoreWin32HandleInfoKHR )* pImportSemaphoreWin32HandleInfo );
            alias PFN_vkGetSemaphoreWin32HandleKHR                                         = VkResult  function( VkDevice device, const( VkSemaphoreGetWin32HandleInfoKHR )* pGetWin32HandleInfo, HANDLE* pHandle );
        }

        // VK_KHR_external_fence_win32 : types and function pointer type aliases
        else static if( __traits( isSame, extension, KHR_external_fence_win32 )) {
            enum VK_KHR_external_fence_win32 = 1;

            enum VK_KHR_EXTERNAL_FENCE_WIN32_SPEC_VERSION = 1;
            enum const( char )* VK_KHR_EXTERNAL_FENCE_WIN32_EXTENSION_NAME = "VK_KHR_external_fence_win32";
            
            struct VkImportFenceWin32HandleInfoKHR {
                VkStructureType                    sType = VK_STRUCTURE_TYPE_IMPORT_FENCE_WIN32_HANDLE_INFO_KHR;
                const( void )*                     pNext;
                VkFence                            fence;
                VkFenceImportFlags                 flags;
                VkExternalFenceHandleTypeFlagBits  handleType;
                HANDLE                             handle;
                LPCWSTR                            name;
            }
            
            struct VkExportFenceWin32HandleInfoKHR {
                VkStructureType                sType = VK_STRUCTURE_TYPE_EXPORT_FENCE_WIN32_HANDLE_INFO_KHR;
                const( void )*                 pNext;
                const( SECURITY_ATTRIBUTES )*  pAttributes;
                DWORD                          dwAccess;
                LPCWSTR                        name;
            }
            
            struct VkFenceGetWin32HandleInfoKHR {
                VkStructureType                    sType = VK_STRUCTURE_TYPE_FENCE_GET_WIN32_HANDLE_INFO_KHR;
                const( void )*                     pNext;
                VkFence                            fence;
                VkExternalFenceHandleTypeFlagBits  handleType;
            }
            
            alias PFN_vkImportFenceWin32HandleKHR                                          = VkResult  function( VkDevice device, const( VkImportFenceWin32HandleInfoKHR )* pImportFenceWin32HandleInfo );
            alias PFN_vkGetFenceWin32HandleKHR                                             = VkResult  function( VkDevice device, const( VkFenceGetWin32HandleInfoKHR )* pGetWin32HandleInfo, HANDLE* pHandle );
        }

        // VK_KHR_portability_subset : types and function pointer type aliases
        else static if( __traits( isSame, extension, KHR_portability_subset )) {
            enum VK_KHR_portability_subset = 1;

            enum VK_KHR_PORTABILITY_SUBSET_SPEC_VERSION = 1;
            enum const( char )* VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME = "VK_KHR_portability_subset";
            
            struct VkPhysicalDevicePortabilitySubsetFeaturesKHR {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR;
                void*            pNext;
                VkBool32         constantAlphaColorBlendFactors;
                VkBool32         events;
                VkBool32         imageViewFormatReinterpretation;
                VkBool32         imageViewFormatSwizzle;
                VkBool32         imageView2DOn3DImage;
                VkBool32         multisampleArrayImage;
                VkBool32         mutableComparisonSamplers;
                VkBool32         pointPolygons;
                VkBool32         samplerMipLodBias;
                VkBool32         separateStencilMaskRef;
                VkBool32         shaderSampleRateInterpolationFunctions;
                VkBool32         tessellationIsolines;
                VkBool32         tessellationPointMode;
                VkBool32         triangleFans;
                VkBool32         vertexAttributeAccessBeyondStride;
            }
            
            struct VkPhysicalDevicePortabilitySubsetPropertiesKHR {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR;
                void*            pNext;
                uint32_t         minVertexInputBindingStrideAlignment;
            }
            
        }

        // VK_GGP_stream_descriptor_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, GGP_stream_descriptor_surface )) {
            enum VK_GGP_stream_descriptor_surface = 1;

            enum VK_GGP_STREAM_DESCRIPTOR_SURFACE_SPEC_VERSION = 1;
            enum const( char )* VK_GGP_STREAM_DESCRIPTOR_SURFACE_EXTENSION_NAME = "VK_GGP_stream_descriptor_surface";
            
            alias VkStreamDescriptorSurfaceCreateFlagsGGP = VkFlags;
            
            struct VkStreamDescriptorSurfaceCreateInfoGGP {
                VkStructureType                          sType = VK_STRUCTURE_TYPE_STREAM_DESCRIPTOR_SURFACE_CREATE_INFO_GGP;
                const( void )*                           pNext;
                VkStreamDescriptorSurfaceCreateFlagsGGP  flags;
                GgpStreamDescriptor                      streamDescriptor;
            }
            
            alias PFN_vkCreateStreamDescriptorSurfaceGGP                                   = VkResult  function( VkInstance instance, const( VkStreamDescriptorSurfaceCreateInfoGGP )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
        }

        // VK_NV_external_memory_win32 : types and function pointer type aliases
        else static if( __traits( isSame, extension, NV_external_memory_win32 )) {
            enum VK_NV_external_memory_win32 = 1;

            enum VK_NV_EXTERNAL_MEMORY_WIN32_SPEC_VERSION = 1;
            enum const( char )* VK_NV_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME = "VK_NV_external_memory_win32";
            
            struct VkImportMemoryWin32HandleInfoNV {
                VkStructureType                    sType = VK_STRUCTURE_TYPE_IMPORT_MEMORY_WIN32_HANDLE_INFO_NV;
                const( void )*                     pNext;
                VkExternalMemoryHandleTypeFlagsNV  handleType;
                HANDLE                             handle;
            }
            
            struct VkExportMemoryWin32HandleInfoNV {
                VkStructureType                sType = VK_STRUCTURE_TYPE_EXPORT_MEMORY_WIN32_HANDLE_INFO_NV;
                const( void )*                 pNext;
                const( SECURITY_ATTRIBUTES )*  pAttributes;
                DWORD                          dwAccess;
            }
            
            alias PFN_vkGetMemoryWin32HandleNV                                             = VkResult  function( VkDevice device, VkDeviceMemory memory, VkExternalMemoryHandleTypeFlagsNV handleType, HANDLE* pHandle );
        }

        // VK_NV_win32_keyed_mutex : types and function pointer type aliases
        else static if( __traits( isSame, extension, NV_win32_keyed_mutex )) {
            enum VK_NV_win32_keyed_mutex = 1;

            enum VK_NV_WIN32_KEYED_MUTEX_SPEC_VERSION = 2;
            enum const( char )* VK_NV_WIN32_KEYED_MUTEX_EXTENSION_NAME = "VK_NV_win32_keyed_mutex";
            
            struct VkWin32KeyedMutexAcquireReleaseInfoNV {
                VkStructureType           sType = VK_STRUCTURE_TYPE_WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV;
                const( void )*            pNext;
                uint32_t                  acquireCount;
                const( VkDeviceMemory )*  pAcquireSyncs;
                const( uint64_t )*        pAcquireKeys;
                const( uint32_t )*        pAcquireTimeoutMilliseconds;
                uint32_t                  releaseCount;
                const( VkDeviceMemory )*  pReleaseSyncs;
                const( uint64_t )*        pReleaseKeys;
            }
            
        }

        // VK_NN_vi_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, NN_vi_surface )) {
            enum VK_NN_vi_surface = 1;

            enum VK_NN_VI_SURFACE_SPEC_VERSION = 1;
            enum const( char )* VK_NN_VI_SURFACE_EXTENSION_NAME = "VK_NN_vi_surface";
            
            alias VkViSurfaceCreateFlagsNN = VkFlags;
            
            struct VkViSurfaceCreateInfoNN {
                VkStructureType           sType = VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN;
                const( void )*            pNext;
                VkViSurfaceCreateFlagsNN  flags;
                void*                     window;
            }
            
            alias PFN_vkCreateViSurfaceNN                                                  = VkResult  function( VkInstance instance, const( VkViSurfaceCreateInfoNN )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
        }

        // VK_EXT_acquire_xlib_display : types and function pointer type aliases
        else static if( __traits( isSame, extension, EXT_acquire_xlib_display )) {
            enum VK_EXT_acquire_xlib_display = 1;

            enum VK_EXT_ACQUIRE_XLIB_DISPLAY_SPEC_VERSION = 1;
            enum const( char )* VK_EXT_ACQUIRE_XLIB_DISPLAY_EXTENSION_NAME = "VK_EXT_acquire_xlib_display";
            
            alias PFN_vkAcquireXlibDisplayEXT                                              = VkResult  function( VkPhysicalDevice physicalDevice, Display* dpy, VkDisplayKHR display );
            alias PFN_vkGetRandROutputDisplayEXT                                           = VkResult  function( VkPhysicalDevice physicalDevice, Display* dpy, RROutput rrOutput, VkDisplayKHR* pDisplay );
        }

        // VK_MVK_ios_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, MVK_ios_surface )) {
            enum VK_MVK_ios_surface = 1;

            enum VK_MVK_IOS_SURFACE_SPEC_VERSION = 3;
            enum const( char )* VK_MVK_IOS_SURFACE_EXTENSION_NAME = "VK_MVK_ios_surface";
            
            alias VkIOSSurfaceCreateFlagsMVK = VkFlags;
            
            struct VkIOSSurfaceCreateInfoMVK {
                VkStructureType             sType = VK_STRUCTURE_TYPE_IOS_SURFACE_CREATE_INFO_MVK;
                const( void )*              pNext;
                VkIOSSurfaceCreateFlagsMVK  flags;
                const( void )*              pView;
            }
            
            alias PFN_vkCreateIOSSurfaceMVK                                                = VkResult  function( VkInstance instance, const( VkIOSSurfaceCreateInfoMVK )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
        }

        // VK_MVK_macos_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, MVK_macos_surface )) {
            enum VK_MVK_macos_surface = 1;

            enum VK_MVK_MACOS_SURFACE_SPEC_VERSION = 3;
            enum const( char )* VK_MVK_MACOS_SURFACE_EXTENSION_NAME = "VK_MVK_macos_surface";
            
            alias VkMacOSSurfaceCreateFlagsMVK = VkFlags;
            
            struct VkMacOSSurfaceCreateInfoMVK {
                VkStructureType               sType = VK_STRUCTURE_TYPE_MACOS_SURFACE_CREATE_INFO_MVK;
                const( void )*                pNext;
                VkMacOSSurfaceCreateFlagsMVK  flags;
                const( void )*                pView;
            }
            
            alias PFN_vkCreateMacOSSurfaceMVK                                              = VkResult  function( VkInstance instance, const( VkMacOSSurfaceCreateInfoMVK )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
        }

        // VK_ANDROID_external_memory_android_hardware_buffer : types and function pointer type aliases
        else static if( __traits( isSame, extension, ANDROID_external_memory_android_hardware_buffer )) {
            enum VK_ANDROID_external_memory_android_hardware_buffer = 1;

            enum VK_ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_SPEC_VERSION = 5;
            enum const( char )* VK_ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_EXTENSION_NAME = "VK_ANDROID_external_memory_android_hardware_buffer";
            
            struct VkAndroidHardwareBufferUsageANDROID {
                VkStructureType  sType = VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_USAGE_ANDROID;
                void*            pNext;
                uint64_t         androidHardwareBufferUsage;
            }
            
            struct VkAndroidHardwareBufferPropertiesANDROID {
                VkStructureType  sType = VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID;
                void*            pNext;
                VkDeviceSize     allocationSize;
                uint32_t         memoryTypeBits;
            }
            
            struct VkAndroidHardwareBufferFormatPropertiesANDROID {
                VkStructureType                sType = VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID;
                void*                          pNext;
                VkFormat                       format;
                uint64_t                       externalFormat;
                VkFormatFeatureFlags           formatFeatures;
                VkComponentMapping             samplerYcbcrConversionComponents;
                VkSamplerYcbcrModelConversion  suggestedYcbcrModel;
                VkSamplerYcbcrRange            suggestedYcbcrRange;
                VkChromaLocation               suggestedXChromaOffset;
                VkChromaLocation               suggestedYChromaOffset;
            }
            
            struct VkImportAndroidHardwareBufferInfoANDROID {
                VkStructureType            sType = VK_STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID;
                const( void )*             pNext;
                const( AHardwareBuffer )*  buffer;
            }
            
            struct VkMemoryGetAndroidHardwareBufferInfoANDROID {
                VkStructureType  sType = VK_STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID;
                const( void )*   pNext;
                VkDeviceMemory   memory;
            }
            
            struct VkExternalFormatANDROID {
                VkStructureType  sType = VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_ANDROID;
                void*            pNext;
                uint64_t         externalFormat;
            }
            
            struct VkAndroidHardwareBufferFormatProperties2ANDROID {
                VkStructureType                sType = VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_2_ANDROID;
                void*                          pNext;
                VkFormat                       format;
                uint64_t                       externalFormat;
                VkFormatFeatureFlags2          formatFeatures;
                VkComponentMapping             samplerYcbcrConversionComponents;
                VkSamplerYcbcrModelConversion  suggestedYcbcrModel;
                VkSamplerYcbcrRange            suggestedYcbcrRange;
                VkChromaLocation               suggestedXChromaOffset;
                VkChromaLocation               suggestedYChromaOffset;
            }
            
            alias PFN_vkGetAndroidHardwareBufferPropertiesANDROID                          = VkResult  function( VkDevice device, const( AHardwareBuffer )* buffer, VkAndroidHardwareBufferPropertiesANDROID* pProperties );
            alias PFN_vkGetMemoryAndroidHardwareBufferANDROID                              = VkResult  function( VkDevice device, const( VkMemoryGetAndroidHardwareBufferInfoANDROID )* pInfo, AHardwareBuffer pBuffer );
        }

        // VK_AMDX_shader_enqueue : types and function pointer type aliases
        else static if( __traits( isSame, extension, AMDX_shader_enqueue )) {
            enum VK_AMDX_shader_enqueue = 1;

            enum VK_AMDX_SHADER_ENQUEUE_SPEC_VERSION = 2;
            enum const( char )* VK_AMDX_SHADER_ENQUEUE_EXTENSION_NAME = "VK_AMDX_shader_enqueue";
            enum VK_SHADER_INDEX_UNUSED_AMDX = (~0U);
            
            struct VkPhysicalDeviceShaderEnqueueFeaturesAMDX {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ENQUEUE_FEATURES_AMDX;
                void*            pNext;
                VkBool32         shaderEnqueue;
                VkBool32         shaderMeshEnqueue;
            }
            
            struct VkPhysicalDeviceShaderEnqueuePropertiesAMDX {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ENQUEUE_PROPERTIES_AMDX;
                void*            pNext;
                uint32_t         maxExecutionGraphDepth;
                uint32_t         maxExecutionGraphShaderOutputNodes;
                uint32_t         maxExecutionGraphShaderPayloadSize;
                uint32_t         maxExecutionGraphShaderPayloadCount;
                uint32_t         executionGraphDispatchAddressAlignment;
                uint32_t[3]      maxExecutionGraphWorkgroupCount;
                uint32_t         maxExecutionGraphWorkgroups;
            }
            
            struct VkExecutionGraphPipelineScratchSizeAMDX {
                VkStructureType  sType = VK_STRUCTURE_TYPE_EXECUTION_GRAPH_PIPELINE_SCRATCH_SIZE_AMDX;
                void*            pNext;
                VkDeviceSize     minSize;
                VkDeviceSize     maxSize;
                VkDeviceSize     sizeGranularity;
            }
            
            struct VkExecutionGraphPipelineCreateInfoAMDX {
                VkStructureType                            sType = VK_STRUCTURE_TYPE_EXECUTION_GRAPH_PIPELINE_CREATE_INFO_AMDX;
                const( void )*                             pNext;
                VkPipelineCreateFlags                      flags;
                uint32_t                                   stageCount;
                const( VkPipelineShaderStageCreateInfo )*  pStages;
                const( VkPipelineLibraryCreateInfoKHR )*   pLibraryInfo;
                VkPipelineLayout                           layout;
                VkPipeline                                 basePipelineHandle;
                int32_t                                    basePipelineIndex;
            }
            
            union VkDeviceOrHostAddressConstAMDX {
                VkDeviceAddress  deviceAddress;
                const( void )*   hostAddress;
            }
            
            struct VkDispatchGraphInfoAMDX {
                uint32_t                        nodeIndex;
                uint32_t                        payloadCount;
                VkDeviceOrHostAddressConstAMDX  payloads;
                uint64_t                        payloadStride;
            }
            
            struct VkDispatchGraphCountInfoAMDX {
                uint32_t                        count;
                VkDeviceOrHostAddressConstAMDX  infos;
                uint64_t                        stride;
            }
            
            struct VkPipelineShaderStageNodeCreateInfoAMDX {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_NODE_CREATE_INFO_AMDX;
                const( void )*   pNext;
                const( char )*   pName;
                uint32_t         index;
            }
            
            alias PFN_vkCreateExecutionGraphPipelinesAMDX                                  = VkResult  function( VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, const( VkExecutionGraphPipelineCreateInfoAMDX )* pCreateInfos, const( VkAllocationCallbacks )* pAllocator, VkPipeline* pPipelines );
            alias PFN_vkGetExecutionGraphPipelineScratchSizeAMDX                           = VkResult  function( VkDevice device, VkPipeline executionGraph, VkExecutionGraphPipelineScratchSizeAMDX* pSizeInfo );
            alias PFN_vkGetExecutionGraphPipelineNodeIndexAMDX                             = VkResult  function( VkDevice device, VkPipeline executionGraph, const( VkPipelineShaderStageNodeCreateInfoAMDX )* pNodeInfo, uint32_t* pNodeIndex );
            alias PFN_vkCmdInitializeGraphScratchMemoryAMDX                                = void      function( VkCommandBuffer commandBuffer, VkPipeline executionGraph, VkDeviceAddress scratch, VkDeviceSize scratchSize );
            alias PFN_vkCmdDispatchGraphAMDX                                               = void      function( VkCommandBuffer commandBuffer, VkDeviceAddress scratch, VkDeviceSize scratchSize, const( VkDispatchGraphCountInfoAMDX )* pCountInfo );
            alias PFN_vkCmdDispatchGraphIndirectAMDX                                       = void      function( VkCommandBuffer commandBuffer, VkDeviceAddress scratch, VkDeviceSize scratchSize, const( VkDispatchGraphCountInfoAMDX )* pCountInfo );
            alias PFN_vkCmdDispatchGraphIndirectCountAMDX                                  = void      function( VkCommandBuffer commandBuffer, VkDeviceAddress scratch, VkDeviceSize scratchSize, VkDeviceAddress countInfo );
        }

        // VK_GGP_frame_token : types and function pointer type aliases
        else static if( __traits( isSame, extension, GGP_frame_token )) {
            enum VK_GGP_frame_token = 1;

            enum VK_GGP_FRAME_TOKEN_SPEC_VERSION = 1;
            enum const( char )* VK_GGP_FRAME_TOKEN_EXTENSION_NAME = "VK_GGP_frame_token";
            
            struct VkPresentFrameTokenGGP {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP;
                const( void )*   pNext;
                GgpFrameToken    frameToken;
            }
            
        }

        // VK_FUCHSIA_imagepipe_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, FUCHSIA_imagepipe_surface )) {
            enum VK_FUCHSIA_imagepipe_surface = 1;

            enum VK_FUCHSIA_IMAGEPIPE_SURFACE_SPEC_VERSION = 1;
            enum const( char )* VK_FUCHSIA_IMAGEPIPE_SURFACE_EXTENSION_NAME = "VK_FUCHSIA_imagepipe_surface";
            
            alias VkImagePipeSurfaceCreateFlagsFUCHSIA = VkFlags;
            
            struct VkImagePipeSurfaceCreateInfoFUCHSIA {
                VkStructureType                       sType = VK_STRUCTURE_TYPE_IMAGEPIPE_SURFACE_CREATE_INFO_FUCHSIA;
                const( void )*                        pNext;
                VkImagePipeSurfaceCreateFlagsFUCHSIA  flags;
                zx_handle_t                           imagePipeHandle;
            }
            
            alias PFN_vkCreateImagePipeSurfaceFUCHSIA                                      = VkResult  function( VkInstance instance, const( VkImagePipeSurfaceCreateInfoFUCHSIA )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
        }

        // VK_EXT_metal_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, EXT_metal_surface )) {
            enum VK_EXT_metal_surface = 1;

            enum VK_EXT_METAL_SURFACE_SPEC_VERSION = 1;
            enum const( char )* VK_EXT_METAL_SURFACE_EXTENSION_NAME = "VK_EXT_metal_surface";
            
            alias VkMetalSurfaceCreateFlagsEXT = VkFlags;
            
            struct VkMetalSurfaceCreateInfoEXT {
                VkStructureType               sType = VK_STRUCTURE_TYPE_METAL_SURFACE_CREATE_INFO_EXT;
                const( void )*                pNext;
                VkMetalSurfaceCreateFlagsEXT  flags;
                const( CAMetalLayer )*        pLayer;
            }
            
            alias PFN_vkCreateMetalSurfaceEXT                                              = VkResult  function( VkInstance instance, const( VkMetalSurfaceCreateInfoEXT )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
        }

        // VK_EXT_full_screen_exclusive : types and function pointer type aliases
        else static if( __traits( isSame, extension, EXT_full_screen_exclusive )) {
            enum VK_EXT_full_screen_exclusive = 1;

            enum VK_EXT_FULL_SCREEN_EXCLUSIVE_SPEC_VERSION = 4;
            enum const( char )* VK_EXT_FULL_SCREEN_EXCLUSIVE_EXTENSION_NAME = "VK_EXT_full_screen_exclusive";
            
            enum VkFullScreenExclusiveEXT {
                VK_FULL_SCREEN_EXCLUSIVE_DEFAULT_EXT                 = 0,
                VK_FULL_SCREEN_EXCLUSIVE_ALLOWED_EXT                 = 1,
                VK_FULL_SCREEN_EXCLUSIVE_DISALLOWED_EXT              = 2,
                VK_FULL_SCREEN_EXCLUSIVE_APPLICATION_CONTROLLED_EXT  = 3,
                VK_FULL_SCREEN_EXCLUSIVE_MAX_ENUM_EXT                = 0x7FFFFFFF
            }
            
            enum VK_FULL_SCREEN_EXCLUSIVE_DEFAULT_EXT                = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_DEFAULT_EXT;
            enum VK_FULL_SCREEN_EXCLUSIVE_ALLOWED_EXT                = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_ALLOWED_EXT;
            enum VK_FULL_SCREEN_EXCLUSIVE_DISALLOWED_EXT             = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_DISALLOWED_EXT;
            enum VK_FULL_SCREEN_EXCLUSIVE_APPLICATION_CONTROLLED_EXT = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_APPLICATION_CONTROLLED_EXT;
            enum VK_FULL_SCREEN_EXCLUSIVE_MAX_ENUM_EXT               = VkFullScreenExclusiveEXT.VK_FULL_SCREEN_EXCLUSIVE_MAX_ENUM_EXT;
            
            struct VkSurfaceFullScreenExclusiveInfoEXT {
                VkStructureType           sType = VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_INFO_EXT;
                void*                     pNext;
                VkFullScreenExclusiveEXT  fullScreenExclusive;
            }
            
            struct VkSurfaceCapabilitiesFullScreenExclusiveEXT {
                VkStructureType  sType = VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_FULL_SCREEN_EXCLUSIVE_EXT;
                void*            pNext;
                VkBool32         fullScreenExclusiveSupported;
            }
            
            struct VkSurfaceFullScreenExclusiveWin32InfoEXT {
                VkStructureType  sType = VK_STRUCTURE_TYPE_SURFACE_FULL_SCREEN_EXCLUSIVE_WIN32_INFO_EXT;
                const( void )*   pNext;
                HMONITOR         hmonitor;
            }
            
            alias PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT                           = VkResult  function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceSurfaceInfo2KHR )* pSurfaceInfo, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes );
            alias PFN_vkAcquireFullScreenExclusiveModeEXT                                  = VkResult  function( VkDevice device, VkSwapchainKHR swapchain );
            alias PFN_vkReleaseFullScreenExclusiveModeEXT                                  = VkResult  function( VkDevice device, VkSwapchainKHR swapchain );
            alias PFN_vkGetDeviceGroupSurfacePresentModes2EXT                              = VkResult  function( VkDevice device, const( VkPhysicalDeviceSurfaceInfo2KHR )* pSurfaceInfo, VkDeviceGroupPresentModeFlagsKHR* pModes );
        }

        // VK_NV_cuda_kernel_launch : types and function pointer type aliases
        else static if( __traits( isSame, extension, NV_cuda_kernel_launch )) {
            enum VK_NV_cuda_kernel_launch = 1;

            mixin( VK_DEFINE_NON_DISPATCHABLE_HANDLE!q{VkCudaModuleNV} );
            mixin( VK_DEFINE_NON_DISPATCHABLE_HANDLE!q{VkCudaFunctionNV} );
            
            enum VK_NV_CUDA_KERNEL_LAUNCH_SPEC_VERSION = 2;
            enum const( char )* VK_NV_CUDA_KERNEL_LAUNCH_EXTENSION_NAME = "VK_NV_cuda_kernel_launch";
            
            struct VkCudaModuleCreateInfoNV {
                VkStructureType  sType = VK_STRUCTURE_TYPE_CUDA_MODULE_CREATE_INFO_NV;
                const( void )*   pNext;
                size_t           dataSize;
                const( void )*   pData;
            }
            
            struct VkCudaFunctionCreateInfoNV {
                VkStructureType  sType = VK_STRUCTURE_TYPE_CUDA_FUNCTION_CREATE_INFO_NV;
                const( void )*   pNext;
                VkCudaModuleNV   Module;
                const( char )*   pName;
                alias            module_ = Module;
                alias            _module = Module;
            }
            
            struct VkCudaLaunchInfoNV {
                VkStructureType   sType = VK_STRUCTURE_TYPE_CUDA_LAUNCH_INFO_NV;
                const( void )*    pNext;
                VkCudaFunctionNV  Function;
                uint32_t          gridDimX;
                uint32_t          gridDimY;
                uint32_t          gridDimZ;
                uint32_t          blockDimX;
                uint32_t          blockDimY;
                uint32_t          blockDimZ;
                uint32_t          sharedMemBytes;
                size_t            paramCount;
                const( void* )*   pParams;
                size_t            extraCount;
                const( void* )*   pExtras;
                alias             function_ = Function;
                alias             _function = Function;
            }
            
            struct VkPhysicalDeviceCudaKernelLaunchFeaturesNV {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUDA_KERNEL_LAUNCH_FEATURES_NV;
                void*            pNext;
                VkBool32         cudaKernelLaunchFeatures;
            }
            
            struct VkPhysicalDeviceCudaKernelLaunchPropertiesNV {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUDA_KERNEL_LAUNCH_PROPERTIES_NV;
                void*            pNext;
                uint32_t         computeCapabilityMinor;
                uint32_t         computeCapabilityMajor;
            }
            
            alias PFN_vkCreateCudaModuleNV                                                 = VkResult  function( VkDevice device, const( VkCudaModuleCreateInfoNV )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkCudaModuleNV* pModule );
            alias PFN_vkGetCudaModuleCacheNV                                               = VkResult  function( VkDevice device, VkCudaModuleNV Module, size_t* pCacheSize, void* pCacheData );
            alias PFN_vkCreateCudaFunctionNV                                               = VkResult  function( VkDevice device, const( VkCudaFunctionCreateInfoNV )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkCudaFunctionNV* pFunction );
            alias PFN_vkDestroyCudaModuleNV                                                = void      function( VkDevice device, VkCudaModuleNV Module, const( VkAllocationCallbacks )* pAllocator );
            alias PFN_vkDestroyCudaFunctionNV                                              = void      function( VkDevice device, VkCudaFunctionNV Function, const( VkAllocationCallbacks )* pAllocator );
            alias PFN_vkCmdCudaLaunchKernelNV                                              = void      function( VkCommandBuffer commandBuffer, const( VkCudaLaunchInfoNV )* pLaunchInfo );
        }

        // VK_EXT_metal_objects : types and function pointer type aliases
        else static if( __traits( isSame, extension, EXT_metal_objects )) {
            enum VK_EXT_metal_objects = 1;

            enum VK_EXT_METAL_OBJECTS_SPEC_VERSION = 2;
            enum const( char )* VK_EXT_METAL_OBJECTS_EXTENSION_NAME = "VK_EXT_metal_objects";
            
            alias VkExportMetalObjectTypeFlagsEXT = VkFlags;
            enum VkExportMetalObjectTypeFlagBitsEXT : VkExportMetalObjectTypeFlagsEXT {
                VK_EXPORT_METAL_OBJECT_TYPE_METAL_DEVICE_BIT_EXT             = 0x00000001,
                VK_EXPORT_METAL_OBJECT_TYPE_METAL_COMMAND_QUEUE_BIT_EXT      = 0x00000002,
                VK_EXPORT_METAL_OBJECT_TYPE_METAL_BUFFER_BIT_EXT             = 0x00000004,
                VK_EXPORT_METAL_OBJECT_TYPE_METAL_TEXTURE_BIT_EXT            = 0x00000008,
                VK_EXPORT_METAL_OBJECT_TYPE_METAL_IOSURFACE_BIT_EXT          = 0x00000010,
                VK_EXPORT_METAL_OBJECT_TYPE_METAL_SHARED_EVENT_BIT_EXT       = 0x00000020,
                VK_EXPORT_METAL_OBJECT_TYPE_FLAG_BITS_MAX_ENUM_EXT           = 0x7FFFFFFF
            }
            
            enum VK_EXPORT_METAL_OBJECT_TYPE_METAL_DEVICE_BIT_EXT            = VkExportMetalObjectTypeFlagBitsEXT.VK_EXPORT_METAL_OBJECT_TYPE_METAL_DEVICE_BIT_EXT;
            enum VK_EXPORT_METAL_OBJECT_TYPE_METAL_COMMAND_QUEUE_BIT_EXT     = VkExportMetalObjectTypeFlagBitsEXT.VK_EXPORT_METAL_OBJECT_TYPE_METAL_COMMAND_QUEUE_BIT_EXT;
            enum VK_EXPORT_METAL_OBJECT_TYPE_METAL_BUFFER_BIT_EXT            = VkExportMetalObjectTypeFlagBitsEXT.VK_EXPORT_METAL_OBJECT_TYPE_METAL_BUFFER_BIT_EXT;
            enum VK_EXPORT_METAL_OBJECT_TYPE_METAL_TEXTURE_BIT_EXT           = VkExportMetalObjectTypeFlagBitsEXT.VK_EXPORT_METAL_OBJECT_TYPE_METAL_TEXTURE_BIT_EXT;
            enum VK_EXPORT_METAL_OBJECT_TYPE_METAL_IOSURFACE_BIT_EXT         = VkExportMetalObjectTypeFlagBitsEXT.VK_EXPORT_METAL_OBJECT_TYPE_METAL_IOSURFACE_BIT_EXT;
            enum VK_EXPORT_METAL_OBJECT_TYPE_METAL_SHARED_EVENT_BIT_EXT      = VkExportMetalObjectTypeFlagBitsEXT.VK_EXPORT_METAL_OBJECT_TYPE_METAL_SHARED_EVENT_BIT_EXT;
            enum VK_EXPORT_METAL_OBJECT_TYPE_FLAG_BITS_MAX_ENUM_EXT          = VkExportMetalObjectTypeFlagBitsEXT.VK_EXPORT_METAL_OBJECT_TYPE_FLAG_BITS_MAX_ENUM_EXT;
            
            struct VkExportMetalObjectCreateInfoEXT {
                VkStructureType                     sType = VK_STRUCTURE_TYPE_EXPORT_METAL_OBJECT_CREATE_INFO_EXT;
                const( void )*                      pNext;
                VkExportMetalObjectTypeFlagBitsEXT  exportObjectType;
            }
            
            struct VkExportMetalObjectsInfoEXT {
                VkStructureType  sType = VK_STRUCTURE_TYPE_EXPORT_METAL_OBJECTS_INFO_EXT;
                const( void )*   pNext;
            }
            
            struct VkExportMetalDeviceInfoEXT {
                VkStructureType  sType = VK_STRUCTURE_TYPE_EXPORT_METAL_DEVICE_INFO_EXT;
                const( void )*   pNext;
                MTLDevice_id     mtlDevice;
            }
            
            struct VkExportMetalCommandQueueInfoEXT {
                VkStructureType     sType = VK_STRUCTURE_TYPE_EXPORT_METAL_COMMAND_QUEUE_INFO_EXT;
                const( void )*      pNext;
                VkQueue             queue;
                MTLCommandQueue_id  mtlCommandQueue;
            }
            
            struct VkExportMetalBufferInfoEXT {
                VkStructureType  sType = VK_STRUCTURE_TYPE_EXPORT_METAL_BUFFER_INFO_EXT;
                const( void )*   pNext;
                VkDeviceMemory   memory;
                MTLBuffer_id     mtlBuffer;
            }
            
            struct VkImportMetalBufferInfoEXT {
                VkStructureType  sType = VK_STRUCTURE_TYPE_IMPORT_METAL_BUFFER_INFO_EXT;
                const( void )*   pNext;
                MTLBuffer_id     mtlBuffer;
            }
            
            struct VkExportMetalTextureInfoEXT {
                VkStructureType        sType = VK_STRUCTURE_TYPE_EXPORT_METAL_TEXTURE_INFO_EXT;
                const( void )*         pNext;
                VkImage                image;
                VkImageView            imageView;
                VkBufferView           bufferView;
                VkImageAspectFlagBits  plane;
                MTLTexture_id          mtlTexture;
            }
            
            struct VkImportMetalTextureInfoEXT {
                VkStructureType        sType = VK_STRUCTURE_TYPE_IMPORT_METAL_TEXTURE_INFO_EXT;
                const( void )*         pNext;
                VkImageAspectFlagBits  plane;
                MTLTexture_id          mtlTexture;
            }
            
            struct VkExportMetalIOSurfaceInfoEXT {
                VkStructureType  sType = VK_STRUCTURE_TYPE_EXPORT_METAL_IO_SURFACE_INFO_EXT;
                const( void )*   pNext;
                VkImage          image;
                IOSurfaceRef     ioSurface;
            }
            
            struct VkImportMetalIOSurfaceInfoEXT {
                VkStructureType  sType = VK_STRUCTURE_TYPE_IMPORT_METAL_IO_SURFACE_INFO_EXT;
                const( void )*   pNext;
                IOSurfaceRef     ioSurface;
            }
            
            struct VkExportMetalSharedEventInfoEXT {
                VkStructureType    sType = VK_STRUCTURE_TYPE_EXPORT_METAL_SHARED_EVENT_INFO_EXT;
                const( void )*     pNext;
                VkSemaphore        semaphore;
                VkEvent            event;
                MTLSharedEvent_id  mtlSharedEvent;
            }
            
            struct VkImportMetalSharedEventInfoEXT {
                VkStructureType    sType = VK_STRUCTURE_TYPE_IMPORT_METAL_SHARED_EVENT_INFO_EXT;
                const( void )*     pNext;
                MTLSharedEvent_id  mtlSharedEvent;
            }
            
            alias PFN_vkExportMetalObjectsEXT                                              = void      function( VkDevice device, VkExportMetalObjectsInfoEXT* pMetalObjectsInfo );
        }

        // VK_NV_acquire_winrt_display : types and function pointer type aliases
        else static if( __traits( isSame, extension, NV_acquire_winrt_display )) {
            enum VK_NV_acquire_winrt_display = 1;

            enum VK_NV_ACQUIRE_WINRT_DISPLAY_SPEC_VERSION = 1;
            enum const( char )* VK_NV_ACQUIRE_WINRT_DISPLAY_EXTENSION_NAME = "VK_NV_acquire_winrt_display";
            
            alias PFN_vkAcquireWinrtDisplayNV                                              = VkResult  function( VkPhysicalDevice physicalDevice, VkDisplayKHR display );
            alias PFN_vkGetWinrtDisplayNV                                                  = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t deviceRelativeId, VkDisplayKHR* pDisplay );
        }

        // VK_EXT_directfb_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, EXT_directfb_surface )) {
            enum VK_EXT_directfb_surface = 1;

            enum VK_EXT_DIRECTFB_SURFACE_SPEC_VERSION = 1;
            enum const( char )* VK_EXT_DIRECTFB_SURFACE_EXTENSION_NAME = "VK_EXT_directfb_surface";
            
            alias VkDirectFBSurfaceCreateFlagsEXT = VkFlags;
            
            struct VkDirectFBSurfaceCreateInfoEXT {
                VkStructureType                  sType = VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT;
                const( void )*                   pNext;
                VkDirectFBSurfaceCreateFlagsEXT  flags;
                IDirectFB*                       dfb;
                IDirectFBSurface*                surface;
            }
            
            alias PFN_vkCreateDirectFBSurfaceEXT                                           = VkResult  function( VkInstance instance, const( VkDirectFBSurfaceCreateInfoEXT )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
            alias PFN_vkGetPhysicalDeviceDirectFBPresentationSupportEXT                    = VkBool32  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, IDirectFB* dfb );
        }

        // VK_FUCHSIA_external_memory : types and function pointer type aliases
        else static if( __traits( isSame, extension, FUCHSIA_external_memory )) {
            enum VK_FUCHSIA_external_memory = 1;

            enum VK_FUCHSIA_EXTERNAL_MEMORY_SPEC_VERSION = 1;
            enum const( char )* VK_FUCHSIA_EXTERNAL_MEMORY_EXTENSION_NAME = "VK_FUCHSIA_external_memory";
            
            struct VkImportMemoryZirconHandleInfoFUCHSIA {
                VkStructureType                     sType = VK_STRUCTURE_TYPE_IMPORT_MEMORY_ZIRCON_HANDLE_INFO_FUCHSIA;
                const( void )*                      pNext;
                VkExternalMemoryHandleTypeFlagBits  handleType;
                zx_handle_t                         handle;
            }
            
            struct VkMemoryZirconHandlePropertiesFUCHSIA {
                VkStructureType  sType = VK_STRUCTURE_TYPE_MEMORY_ZIRCON_HANDLE_PROPERTIES_FUCHSIA;
                void*            pNext;
                uint32_t         memoryTypeBits;
            }
            
            struct VkMemoryGetZirconHandleInfoFUCHSIA {
                VkStructureType                     sType = VK_STRUCTURE_TYPE_MEMORY_GET_ZIRCON_HANDLE_INFO_FUCHSIA;
                const( void )*                      pNext;
                VkDeviceMemory                      memory;
                VkExternalMemoryHandleTypeFlagBits  handleType;
            }
            
            alias PFN_vkGetMemoryZirconHandleFUCHSIA                                       = VkResult  function( VkDevice device, const( VkMemoryGetZirconHandleInfoFUCHSIA )* pGetZirconHandleInfo, zx_handle_t* pZirconHandle );
            alias PFN_vkGetMemoryZirconHandlePropertiesFUCHSIA                             = VkResult  function( VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, zx_handle_t zirconHandle, VkMemoryZirconHandlePropertiesFUCHSIA* pMemoryZirconHandleProperties );
        }

        // VK_FUCHSIA_external_semaphore : types and function pointer type aliases
        else static if( __traits( isSame, extension, FUCHSIA_external_semaphore )) {
            enum VK_FUCHSIA_external_semaphore = 1;

            enum VK_FUCHSIA_EXTERNAL_SEMAPHORE_SPEC_VERSION = 1;
            enum const( char )* VK_FUCHSIA_EXTERNAL_SEMAPHORE_EXTENSION_NAME = "VK_FUCHSIA_external_semaphore";
            
            struct VkImportSemaphoreZirconHandleInfoFUCHSIA {
                VkStructureType                        sType = VK_STRUCTURE_TYPE_IMPORT_SEMAPHORE_ZIRCON_HANDLE_INFO_FUCHSIA;
                const( void )*                         pNext;
                VkSemaphore                            semaphore;
                VkSemaphoreImportFlags                 flags;
                VkExternalSemaphoreHandleTypeFlagBits  handleType;
                zx_handle_t                            zirconHandle;
            }
            
            struct VkSemaphoreGetZirconHandleInfoFUCHSIA {
                VkStructureType                        sType = VK_STRUCTURE_TYPE_SEMAPHORE_GET_ZIRCON_HANDLE_INFO_FUCHSIA;
                const( void )*                         pNext;
                VkSemaphore                            semaphore;
                VkExternalSemaphoreHandleTypeFlagBits  handleType;
            }
            
            alias PFN_vkImportSemaphoreZirconHandleFUCHSIA                                 = VkResult  function( VkDevice device, const( VkImportSemaphoreZirconHandleInfoFUCHSIA )* pImportSemaphoreZirconHandleInfo );
            alias PFN_vkGetSemaphoreZirconHandleFUCHSIA                                    = VkResult  function( VkDevice device, const( VkSemaphoreGetZirconHandleInfoFUCHSIA )* pGetZirconHandleInfo, zx_handle_t* pZirconHandle );
        }

        // VK_FUCHSIA_buffer_collection : types and function pointer type aliases
        else static if( __traits( isSame, extension, FUCHSIA_buffer_collection )) {
            enum VK_FUCHSIA_buffer_collection = 1;

            mixin( VK_DEFINE_NON_DISPATCHABLE_HANDLE!q{VkBufferCollectionFUCHSIA} );
            
            enum VK_FUCHSIA_BUFFER_COLLECTION_SPEC_VERSION = 2;
            enum const( char )* VK_FUCHSIA_BUFFER_COLLECTION_EXTENSION_NAME = "VK_FUCHSIA_buffer_collection";
            
            alias VkImageFormatConstraintsFlagsFUCHSIA = VkFlags;
            
            alias VkImageConstraintsInfoFlagsFUCHSIA = VkFlags;
            enum VkImageConstraintsInfoFlagBitsFUCHSIA : VkImageConstraintsInfoFlagsFUCHSIA {
                VK_IMAGE_CONSTRAINTS_INFO_CPU_READ_RARELY_FUCHSIA            = 0x00000001,
                VK_IMAGE_CONSTRAINTS_INFO_CPU_READ_OFTEN_FUCHSIA             = 0x00000002,
                VK_IMAGE_CONSTRAINTS_INFO_CPU_WRITE_RARELY_FUCHSIA           = 0x00000004,
                VK_IMAGE_CONSTRAINTS_INFO_CPU_WRITE_OFTEN_FUCHSIA            = 0x00000008,
                VK_IMAGE_CONSTRAINTS_INFO_PROTECTED_OPTIONAL_FUCHSIA         = 0x00000010,
                VK_IMAGE_CONSTRAINTS_INFO_FLAG_BITS_MAX_ENUM_FUCHSIA         = 0x7FFFFFFF
            }
            
            enum VK_IMAGE_CONSTRAINTS_INFO_CPU_READ_RARELY_FUCHSIA           = VkImageConstraintsInfoFlagBitsFUCHSIA.VK_IMAGE_CONSTRAINTS_INFO_CPU_READ_RARELY_FUCHSIA;
            enum VK_IMAGE_CONSTRAINTS_INFO_CPU_READ_OFTEN_FUCHSIA            = VkImageConstraintsInfoFlagBitsFUCHSIA.VK_IMAGE_CONSTRAINTS_INFO_CPU_READ_OFTEN_FUCHSIA;
            enum VK_IMAGE_CONSTRAINTS_INFO_CPU_WRITE_RARELY_FUCHSIA          = VkImageConstraintsInfoFlagBitsFUCHSIA.VK_IMAGE_CONSTRAINTS_INFO_CPU_WRITE_RARELY_FUCHSIA;
            enum VK_IMAGE_CONSTRAINTS_INFO_CPU_WRITE_OFTEN_FUCHSIA           = VkImageConstraintsInfoFlagBitsFUCHSIA.VK_IMAGE_CONSTRAINTS_INFO_CPU_WRITE_OFTEN_FUCHSIA;
            enum VK_IMAGE_CONSTRAINTS_INFO_PROTECTED_OPTIONAL_FUCHSIA        = VkImageConstraintsInfoFlagBitsFUCHSIA.VK_IMAGE_CONSTRAINTS_INFO_PROTECTED_OPTIONAL_FUCHSIA;
            enum VK_IMAGE_CONSTRAINTS_INFO_FLAG_BITS_MAX_ENUM_FUCHSIA        = VkImageConstraintsInfoFlagBitsFUCHSIA.VK_IMAGE_CONSTRAINTS_INFO_FLAG_BITS_MAX_ENUM_FUCHSIA;
            
            struct VkBufferCollectionCreateInfoFUCHSIA {
                VkStructureType  sType = VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CREATE_INFO_FUCHSIA;
                const( void )*   pNext;
                zx_handle_t      collectionToken;
            }
            
            struct VkImportMemoryBufferCollectionFUCHSIA {
                VkStructureType            sType = VK_STRUCTURE_TYPE_IMPORT_MEMORY_BUFFER_COLLECTION_FUCHSIA;
                const( void )*             pNext;
                VkBufferCollectionFUCHSIA  collection;
                uint32_t                   index;
            }
            
            struct VkBufferCollectionImageCreateInfoFUCHSIA {
                VkStructureType            sType = VK_STRUCTURE_TYPE_BUFFER_COLLECTION_IMAGE_CREATE_INFO_FUCHSIA;
                const( void )*             pNext;
                VkBufferCollectionFUCHSIA  collection;
                uint32_t                   index;
            }
            
            struct VkBufferCollectionConstraintsInfoFUCHSIA {
                VkStructureType  sType = VK_STRUCTURE_TYPE_BUFFER_COLLECTION_CONSTRAINTS_INFO_FUCHSIA;
                const( void )*   pNext;
                uint32_t         minBufferCount;
                uint32_t         maxBufferCount;
                uint32_t         minBufferCountForCamping;
                uint32_t         minBufferCountForDedicatedSlack;
                uint32_t         minBufferCountForSharedSlack;
            }
            
            struct VkBufferConstraintsInfoFUCHSIA {
                VkStructureType                           sType = VK_STRUCTURE_TYPE_BUFFER_CONSTRAINTS_INFO_FUCHSIA;
                const( void )*                            pNext;
                VkBufferCreateInfo                        createInfo;
                VkFormatFeatureFlags                      requiredFormatFeatures;
                VkBufferCollectionConstraintsInfoFUCHSIA  bufferCollectionConstraints;
            }
            
            struct VkBufferCollectionBufferCreateInfoFUCHSIA {
                VkStructureType            sType = VK_STRUCTURE_TYPE_BUFFER_COLLECTION_BUFFER_CREATE_INFO_FUCHSIA;
                const( void )*             pNext;
                VkBufferCollectionFUCHSIA  collection;
                uint32_t                   index;
            }
            
            struct VkSysmemColorSpaceFUCHSIA {
                VkStructureType  sType = VK_STRUCTURE_TYPE_SYSMEM_COLOR_SPACE_FUCHSIA;
                const( void )*   pNext;
                uint32_t         colorSpace;
            }
            
            struct VkBufferCollectionPropertiesFUCHSIA {
                VkStructureType                sType = VK_STRUCTURE_TYPE_BUFFER_COLLECTION_PROPERTIES_FUCHSIA;
                void*                          pNext;
                uint32_t                       memoryTypeBits;
                uint32_t                       bufferCount;
                uint32_t                       createInfoIndex;
                uint64_t                       sysmemPixelFormat;
                VkFormatFeatureFlags           formatFeatures;
                VkSysmemColorSpaceFUCHSIA      sysmemColorSpaceIndex;
                VkComponentMapping             samplerYcbcrConversionComponents;
                VkSamplerYcbcrModelConversion  suggestedYcbcrModel;
                VkSamplerYcbcrRange            suggestedYcbcrRange;
                VkChromaLocation               suggestedXChromaOffset;
                VkChromaLocation               suggestedYChromaOffset;
            }
            
            struct VkImageFormatConstraintsInfoFUCHSIA {
                VkStructureType                       sType = VK_STRUCTURE_TYPE_IMAGE_FORMAT_CONSTRAINTS_INFO_FUCHSIA;
                const( void )*                        pNext;
                VkImageCreateInfo                     imageCreateInfo;
                VkFormatFeatureFlags                  requiredFormatFeatures;
                VkImageFormatConstraintsFlagsFUCHSIA  flags;
                uint64_t                              sysmemPixelFormat;
                uint32_t                              colorSpaceCount;
                const( VkSysmemColorSpaceFUCHSIA )*   pColorSpaces;
            }
            
            struct VkImageConstraintsInfoFUCHSIA {
                VkStructureType                                sType = VK_STRUCTURE_TYPE_IMAGE_CONSTRAINTS_INFO_FUCHSIA;
                const( void )*                                 pNext;
                uint32_t                                       formatConstraintsCount;
                const( VkImageFormatConstraintsInfoFUCHSIA )*  pFormatConstraints;
                VkBufferCollectionConstraintsInfoFUCHSIA       bufferCollectionConstraints;
                VkImageConstraintsInfoFlagsFUCHSIA             flags;
            }
            
            alias PFN_vkCreateBufferCollectionFUCHSIA                                      = VkResult  function( VkDevice device, const( VkBufferCollectionCreateInfoFUCHSIA )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkBufferCollectionFUCHSIA* pCollection );
            alias PFN_vkSetBufferCollectionImageConstraintsFUCHSIA                         = VkResult  function( VkDevice device, VkBufferCollectionFUCHSIA collection, const( VkImageConstraintsInfoFUCHSIA )* pImageConstraintsInfo );
            alias PFN_vkSetBufferCollectionBufferConstraintsFUCHSIA                        = VkResult  function( VkDevice device, VkBufferCollectionFUCHSIA collection, const( VkBufferConstraintsInfoFUCHSIA )* pBufferConstraintsInfo );
            alias PFN_vkDestroyBufferCollectionFUCHSIA                                     = void      function( VkDevice device, VkBufferCollectionFUCHSIA collection, const( VkAllocationCallbacks )* pAllocator );
            alias PFN_vkGetBufferCollectionPropertiesFUCHSIA                               = VkResult  function( VkDevice device, VkBufferCollectionFUCHSIA collection, VkBufferCollectionPropertiesFUCHSIA* pProperties );
        }

        // VK_QNX_screen_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, QNX_screen_surface )) {
            enum VK_QNX_screen_surface = 1;

            enum VK_QNX_SCREEN_SURFACE_SPEC_VERSION = 1;
            enum const( char )* VK_QNX_SCREEN_SURFACE_EXTENSION_NAME = "VK_QNX_screen_surface";
            
            alias VkScreenSurfaceCreateFlagsQNX = VkFlags;
            
            struct VkScreenSurfaceCreateInfoQNX {
                VkStructureType                sType = VK_STRUCTURE_TYPE_SCREEN_SURFACE_CREATE_INFO_QNX;
                const( void )*                 pNext;
                VkScreenSurfaceCreateFlagsQNX  flags;
                const( _screen_context )*      context;
                const( _screen_window )*       window;
            }
            
            alias PFN_vkCreateScreenSurfaceQNX                                             = VkResult  function( VkInstance instance, const( VkScreenSurfaceCreateInfoQNX )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
            alias PFN_vkGetPhysicalDeviceScreenPresentationSupportQNX                      = VkBool32  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, const( _screen_window )* window );
        }

        // VK_NV_displacement_micromap : types and function pointer type aliases
        else static if( __traits( isSame, extension, NV_displacement_micromap )) {
            enum VK_NV_displacement_micromap = 1;

            enum VK_NV_DISPLACEMENT_MICROMAP_SPEC_VERSION = 2;
            enum const( char )* VK_NV_DISPLACEMENT_MICROMAP_EXTENSION_NAME = "VK_NV_displacement_micromap";
            
            enum VkDisplacementMicromapFormatNV {
                VK_DISPLACEMENT_MICROMAP_FORMAT_64_TRIANGLES_64_BYTES_NV     = 1,
                VK_DISPLACEMENT_MICROMAP_FORMAT_256_TRIANGLES_128_BYTES_NV   = 2,
                VK_DISPLACEMENT_MICROMAP_FORMAT_1024_TRIANGLES_128_BYTES_NV  = 3,
                VK_DISPLACEMENT_MICROMAP_FORMAT_MAX_ENUM_NV                  = 0x7FFFFFFF
            }
            
            enum VK_DISPLACEMENT_MICROMAP_FORMAT_64_TRIANGLES_64_BYTES_NV    = VkDisplacementMicromapFormatNV.VK_DISPLACEMENT_MICROMAP_FORMAT_64_TRIANGLES_64_BYTES_NV;
            enum VK_DISPLACEMENT_MICROMAP_FORMAT_256_TRIANGLES_128_BYTES_NV  = VkDisplacementMicromapFormatNV.VK_DISPLACEMENT_MICROMAP_FORMAT_256_TRIANGLES_128_BYTES_NV;
            enum VK_DISPLACEMENT_MICROMAP_FORMAT_1024_TRIANGLES_128_BYTES_NV = VkDisplacementMicromapFormatNV.VK_DISPLACEMENT_MICROMAP_FORMAT_1024_TRIANGLES_128_BYTES_NV;
            enum VK_DISPLACEMENT_MICROMAP_FORMAT_MAX_ENUM_NV                 = VkDisplacementMicromapFormatNV.VK_DISPLACEMENT_MICROMAP_FORMAT_MAX_ENUM_NV;
            
            struct VkPhysicalDeviceDisplacementMicromapFeaturesNV {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_FEATURES_NV;
                void*            pNext;
                VkBool32         displacementMicromap;
            }
            
            struct VkPhysicalDeviceDisplacementMicromapPropertiesNV {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_PROPERTIES_NV;
                void*            pNext;
                uint32_t         maxDisplacementMicromapSubdivisionLevel;
            }
            
            struct VkAccelerationStructureTrianglesDisplacementMicromapNV {
                VkStructureType                sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_DISPLACEMENT_MICROMAP_NV;
                void*                          pNext;
                VkFormat                       displacementBiasAndScaleFormat;
                VkFormat                       displacementVectorFormat;
                VkDeviceOrHostAddressConstKHR  displacementBiasAndScaleBuffer;
                VkDeviceSize                   displacementBiasAndScaleStride;
                VkDeviceOrHostAddressConstKHR  displacementVectorBuffer;
                VkDeviceSize                   displacementVectorStride;
                VkDeviceOrHostAddressConstKHR  displacedMicromapPrimitiveFlags;
                VkDeviceSize                   displacedMicromapPrimitiveFlagsStride;
                VkIndexType                    indexType;
                VkDeviceOrHostAddressConstKHR  indexBuffer;
                VkDeviceSize                   indexStride;
                uint32_t                       baseTriangle;
                uint32_t                       usageCountsCount;
                const( VkMicromapUsageEXT )*   pUsageCounts;
                const( VkMicromapUsageEXT* )*  ppUsageCounts;
                VkMicromapEXT                  micromap;
            }
            
        }

        // VK_OHOS_external_memory : types and function pointer type aliases
        else static if( __traits( isSame, extension, OHOS_external_memory )) {
            enum VK_OHOS_external_memory = 1;

            enum VK_OHOS_EXTERNAL_MEMORY_SPEC_VERSION = 1;
            enum const( char )* VK_OHOS_EXTERNAL_MEMORY_EXTENSION_NAME = "VK_OHOS_external_memory";
            
            struct VkNativeBufferUsageOHOS {
                VkStructureType  sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_USAGE_OHOS;
                void*            pNext;
                uint64_t         OHOSNativeBufferUsage;
            }
            
            struct VkNativeBufferPropertiesOHOS {
                VkStructureType  sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_PROPERTIES_OHOS;
                void*            pNext;
                VkDeviceSize     allocationSize;
                uint32_t         memoryTypeBits;
            }
            
            struct VkNativeBufferFormatPropertiesOHOS {
                VkStructureType                sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_FORMAT_PROPERTIES_OHOS;
                void*                          pNext;
                VkFormat                       format;
                uint64_t                       externalFormat;
                VkFormatFeatureFlags           formatFeatures;
                VkComponentMapping             samplerYcbcrConversionComponents;
                VkSamplerYcbcrModelConversion  suggestedYcbcrModel;
                VkSamplerYcbcrRange            suggestedYcbcrRange;
                VkChromaLocation               suggestedXChromaOffset;
                VkChromaLocation               suggestedYChromaOffset;
            }
            
            struct VkImportNativeBufferInfoOHOS {
                VkStructureType            sType = VK_STRUCTURE_TYPE_IMPORT_NATIVE_BUFFER_INFO_OHOS;
                const( void )*             pNext;
                const( OH_NativeBuffer )*  buffer;
            }
            
            struct VkMemoryGetNativeBufferInfoOHOS {
                VkStructureType  sType = VK_STRUCTURE_TYPE_MEMORY_GET_NATIVE_BUFFER_INFO_OHOS;
                const( void )*   pNext;
                VkDeviceMemory   memory;
            }
            
            struct VkExternalFormatOHOS {
                VkStructureType  sType = VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_OHOS;
                void*            pNext;
                uint64_t         externalFormat;
            }
            
            alias PFN_vkGetNativeBufferPropertiesOHOS                                      = VkResult  function( VkDevice device, const( OH_NativeBuffer )* buffer, VkNativeBufferPropertiesOHOS* pProperties );
            alias PFN_vkGetMemoryNativeBufferOHOS                                          = VkResult  function( VkDevice device, const( VkMemoryGetNativeBufferInfoOHOS )* pInfo, OH_NativeBuffer pBuffer );
        }

        // VK_ANDROID_external_format_resolve : types and function pointer type aliases
        else static if( __traits( isSame, extension, ANDROID_external_format_resolve )) {
            enum VK_ANDROID_external_format_resolve = 1;

            enum VK_ANDROID_EXTERNAL_FORMAT_RESOLVE_SPEC_VERSION = 1;
            enum const( char )* VK_ANDROID_EXTERNAL_FORMAT_RESOLVE_EXTENSION_NAME = "VK_ANDROID_external_format_resolve";
            
            struct VkPhysicalDeviceExternalFormatResolveFeaturesANDROID {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FORMAT_RESOLVE_FEATURES_ANDROID;
                void*            pNext;
                VkBool32         externalFormatResolve;
            }
            
            struct VkPhysicalDeviceExternalFormatResolvePropertiesANDROID {
                VkStructureType   sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_FORMAT_RESOLVE_PROPERTIES_ANDROID;
                void*             pNext;
                VkBool32          nullColorAttachmentWithExternalFormatResolve;
                VkChromaLocation  externalFormatResolveChromaOffsetX;
                VkChromaLocation  externalFormatResolveChromaOffsetY;
            }
            
            struct VkAndroidHardwareBufferFormatResolvePropertiesANDROID {
                VkStructureType  sType = VK_STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_RESOLVE_PROPERTIES_ANDROID;
                void*            pNext;
                VkFormat         colorAttachmentFormat;
            }
            
        }

        // VK_AMDX_dense_geometry_format : types and function pointer type aliases
        else static if( __traits( isSame, extension, AMDX_dense_geometry_format )) {
            enum VK_AMDX_dense_geometry_format = 1;

            enum VK_AMDX_DENSE_GEOMETRY_FORMAT_SPEC_VERSION = 1;
            enum const( char )* VK_AMDX_DENSE_GEOMETRY_FORMAT_EXTENSION_NAME = "VK_AMDX_dense_geometry_format";
            enum VK_COMPRESSED_TRIANGLE_FORMAT_DGF1_BYTE_ALIGNMENT_AMDX = 128;
            enum VK_COMPRESSED_TRIANGLE_FORMAT_DGF1_BYTE_STRIDE_AMDX = 128;
            
            enum VkCompressedTriangleFormatAMDX {
                VK_COMPRESSED_TRIANGLE_FORMAT_DGF1_AMDX      = 0,
                VK_COMPRESSED_TRIANGLE_FORMAT_MAX_ENUM_AMDX  = 0x7FFFFFFF
            }
            
            enum VK_COMPRESSED_TRIANGLE_FORMAT_DGF1_AMDX     = VkCompressedTriangleFormatAMDX.VK_COMPRESSED_TRIANGLE_FORMAT_DGF1_AMDX;
            enum VK_COMPRESSED_TRIANGLE_FORMAT_MAX_ENUM_AMDX = VkCompressedTriangleFormatAMDX.VK_COMPRESSED_TRIANGLE_FORMAT_MAX_ENUM_AMDX;
            
            struct VkPhysicalDeviceDenseGeometryFormatFeaturesAMDX {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DENSE_GEOMETRY_FORMAT_FEATURES_AMDX;
                void*            pNext;
                VkBool32         denseGeometryFormat;
            }
            
            struct VkAccelerationStructureDenseGeometryFormatTrianglesDataAMDX {
                VkStructureType                 sType = VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_DENSE_GEOMETRY_FORMAT_TRIANGLES_DATA_AMDX;
                const( void )*                  pNext;
                VkDeviceOrHostAddressConstKHR   compressedData;
                VkDeviceSize                    dataSize;
                uint32_t                        numTriangles;
                uint32_t                        numVertices;
                uint32_t                        maxPrimitiveIndex;
                uint32_t                        maxGeometryIndex;
                VkCompressedTriangleFormatAMDX  format;
            }
            
        }

        // VK_QNX_external_memory_screen_buffer : types and function pointer type aliases
        else static if( __traits( isSame, extension, QNX_external_memory_screen_buffer )) {
            enum VK_QNX_external_memory_screen_buffer = 1;

            enum VK_QNX_EXTERNAL_MEMORY_SCREEN_BUFFER_SPEC_VERSION = 1;
            enum const( char )* VK_QNX_EXTERNAL_MEMORY_SCREEN_BUFFER_EXTENSION_NAME = "VK_QNX_external_memory_screen_buffer";
            
            struct VkScreenBufferPropertiesQNX {
                VkStructureType  sType = VK_STRUCTURE_TYPE_SCREEN_BUFFER_PROPERTIES_QNX;
                void*            pNext;
                VkDeviceSize     allocationSize;
                uint32_t         memoryTypeBits;
            }
            
            struct VkScreenBufferFormatPropertiesQNX {
                VkStructureType                sType = VK_STRUCTURE_TYPE_SCREEN_BUFFER_FORMAT_PROPERTIES_QNX;
                void*                          pNext;
                VkFormat                       format;
                uint64_t                       externalFormat;
                uint64_t                       screenUsage;
                VkFormatFeatureFlags           formatFeatures;
                VkComponentMapping             samplerYcbcrConversionComponents;
                VkSamplerYcbcrModelConversion  suggestedYcbcrModel;
                VkSamplerYcbcrRange            suggestedYcbcrRange;
                VkChromaLocation               suggestedXChromaOffset;
                VkChromaLocation               suggestedYChromaOffset;
            }
            
            struct VkImportScreenBufferInfoQNX {
                VkStructureType           sType = VK_STRUCTURE_TYPE_IMPORT_SCREEN_BUFFER_INFO_QNX;
                const( void )*            pNext;
                const( _screen_buffer )*  buffer;
            }
            
            struct VkExternalFormatQNX {
                VkStructureType  sType = VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_QNX;
                void*            pNext;
                uint64_t         externalFormat;
            }
            
            struct VkPhysicalDeviceExternalMemoryScreenBufferFeaturesQNX {
                VkStructureType  sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_MEMORY_SCREEN_BUFFER_FEATURES_QNX;
                void*            pNext;
                VkBool32         screenBufferImport;
            }
            
            alias PFN_vkGetScreenBufferPropertiesQNX                                       = VkResult  function( VkDevice device, const( _screen_buffer )* buffer, VkScreenBufferPropertiesQNX* pProperties );
        }

        // VK_OHOS_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, OHOS_surface )) {
            enum VK_OHOS_surface = 1;

            enum VK_OHOS_SURFACE_SPEC_VERSION = 1;
            enum const( char )* VK_OHOS_SURFACE_EXTENSION_NAME = "VK_OHOS_surface";
            
            alias VkSurfaceCreateFlagsOHOS = VkFlags;
            
            struct VkSurfaceCreateInfoOHOS {
                VkStructureType           sType = VK_STRUCTURE_TYPE_SURFACE_CREATE_INFO_OHOS;
                const( void )*            pNext;
                VkSurfaceCreateFlagsOHOS  flags;
                OHNativeWindow*           window;
            }
            
            alias PFN_vkCreateSurfaceOHOS                                                  = VkResult  function( VkInstance instance, const( VkSurfaceCreateInfoOHOS )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
        }

        // VK_EXT_external_memory_metal : types and function pointer type aliases
        else static if( __traits( isSame, extension, EXT_external_memory_metal )) {
            enum VK_EXT_external_memory_metal = 1;

            enum VK_EXT_EXTERNAL_MEMORY_METAL_SPEC_VERSION = 1;
            enum const( char )* VK_EXT_EXTERNAL_MEMORY_METAL_EXTENSION_NAME = "VK_EXT_external_memory_metal";
            
            struct VkImportMemoryMetalHandleInfoEXT {
                VkStructureType                     sType = VK_STRUCTURE_TYPE_IMPORT_MEMORY_METAL_HANDLE_INFO_EXT;
                const( void )*                      pNext;
                VkExternalMemoryHandleTypeFlagBits  handleType;
                void*                               handle;
            }
            
            struct VkMemoryMetalHandlePropertiesEXT {
                VkStructureType  sType = VK_STRUCTURE_TYPE_MEMORY_METAL_HANDLE_PROPERTIES_EXT;
                void*            pNext;
                uint32_t         memoryTypeBits;
            }
            
            struct VkMemoryGetMetalHandleInfoEXT {
                VkStructureType                     sType = VK_STRUCTURE_TYPE_MEMORY_GET_METAL_HANDLE_INFO_EXT;
                const( void )*                      pNext;
                VkDeviceMemory                      memory;
                VkExternalMemoryHandleTypeFlagBits  handleType;
            }
            
            alias PFN_vkGetMemoryMetalHandleEXT                                            = VkResult  function( VkDevice device, const( VkMemoryGetMetalHandleInfoEXT )* pGetMetalHandleInfo, void** pHandle );
            alias PFN_vkGetMemoryMetalHandlePropertiesEXT                                  = VkResult  function( VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, const( void )* pHandle, VkMemoryMetalHandlePropertiesEXT* pMemoryMetalHandleProperties );
        }

        // VK_SEC_ubm_surface : types and function pointer type aliases
        else static if( __traits( isSame, extension, SEC_ubm_surface )) {
            enum VK_SEC_ubm_surface = 1;

            enum VK_SEC_UBM_SURFACE_SPEC_VERSION = 1;
            enum const( char )* VK_SEC_UBM_SURFACE_EXTENSION_NAME = "VK_SEC_ubm_surface";
            
            alias VkUbmSurfaceCreateFlagsSEC = VkFlags;
            
            struct VkUbmSurfaceCreateInfoSEC {
                VkStructureType             sType = VK_STRUCTURE_TYPE_UBM_SURFACE_CREATE_INFO_SEC;
                const( void )*              pNext;
                VkUbmSurfaceCreateFlagsSEC  flags;
                const( ubm_device )*        device;
                const( ubm_surface )*       surface;
            }
            
            alias PFN_vkCreateUbmSurfaceSEC                                                = VkResult  function( VkInstance instance, const( VkUbmSurfaceCreateInfoSEC )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );
            alias PFN_vkGetPhysicalDeviceUbmPresentationSupportSEC                         = VkBool32  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, const( ubm_device )* device );
        }

        __gshared {

            // VK_KHR_xlib_surface : function pointer decelerations
            static if( __traits( isSame, extension, KHR_xlib_surface )) {
                PFN_vkCreateXlibSurfaceKHR                                               vkCreateXlibSurfaceKHR;
                PFN_vkGetPhysicalDeviceXlibPresentationSupportKHR                        vkGetPhysicalDeviceXlibPresentationSupportKHR;
            }

            // VK_KHR_xcb_surface : function pointer decelerations
            else static if( __traits( isSame, extension, KHR_xcb_surface )) {
                PFN_vkCreateXcbSurfaceKHR                                                vkCreateXcbSurfaceKHR;
                PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR                         vkGetPhysicalDeviceXcbPresentationSupportKHR;
            }

            // VK_KHR_wayland_surface : function pointer decelerations
            else static if( __traits( isSame, extension, KHR_wayland_surface )) {
                PFN_vkCreateWaylandSurfaceKHR                                            vkCreateWaylandSurfaceKHR;
                PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR                     vkGetPhysicalDeviceWaylandPresentationSupportKHR;
            }

            // VK_KHR_android_surface : function pointer decelerations
            else static if( __traits( isSame, extension, KHR_android_surface )) {
                PFN_vkCreateAndroidSurfaceKHR                                            vkCreateAndroidSurfaceKHR;
            }

            // VK_KHR_win32_surface : function pointer decelerations
            else static if( __traits( isSame, extension, KHR_win32_surface )) {
                PFN_vkCreateWin32SurfaceKHR                                              vkCreateWin32SurfaceKHR;
                PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR                       vkGetPhysicalDeviceWin32PresentationSupportKHR;
            }

            // VK_KHR_external_memory_win32 : function pointer decelerations
            else static if( __traits( isSame, extension, KHR_external_memory_win32 )) {
                PFN_vkGetMemoryWin32HandleKHR                                            vkGetMemoryWin32HandleKHR;
                PFN_vkGetMemoryWin32HandlePropertiesKHR                                  vkGetMemoryWin32HandlePropertiesKHR;
            }

            // VK_KHR_external_semaphore_win32 : function pointer decelerations
            else static if( __traits( isSame, extension, KHR_external_semaphore_win32 )) {
                PFN_vkImportSemaphoreWin32HandleKHR                                      vkImportSemaphoreWin32HandleKHR;
                PFN_vkGetSemaphoreWin32HandleKHR                                         vkGetSemaphoreWin32HandleKHR;
            }

            // VK_KHR_external_fence_win32 : function pointer decelerations
            else static if( __traits( isSame, extension, KHR_external_fence_win32 )) {
                PFN_vkImportFenceWin32HandleKHR                                          vkImportFenceWin32HandleKHR;
                PFN_vkGetFenceWin32HandleKHR                                             vkGetFenceWin32HandleKHR;
            }

            // VK_GGP_stream_descriptor_surface : function pointer decelerations
            else static if( __traits( isSame, extension, GGP_stream_descriptor_surface )) {
                PFN_vkCreateStreamDescriptorSurfaceGGP                                   vkCreateStreamDescriptorSurfaceGGP;
            }

            // VK_NV_external_memory_win32 : function pointer decelerations
            else static if( __traits( isSame, extension, NV_external_memory_win32 )) {
                PFN_vkGetMemoryWin32HandleNV                                             vkGetMemoryWin32HandleNV;
            }

            // VK_NN_vi_surface : function pointer decelerations
            else static if( __traits( isSame, extension, NN_vi_surface )) {
                PFN_vkCreateViSurfaceNN                                                  vkCreateViSurfaceNN;
            }

            // VK_EXT_acquire_xlib_display : function pointer decelerations
            else static if( __traits( isSame, extension, EXT_acquire_xlib_display )) {
                PFN_vkAcquireXlibDisplayEXT                                              vkAcquireXlibDisplayEXT;
                PFN_vkGetRandROutputDisplayEXT                                           vkGetRandROutputDisplayEXT;
            }

            // VK_MVK_ios_surface : function pointer decelerations
            else static if( __traits( isSame, extension, MVK_ios_surface )) {
                PFN_vkCreateIOSSurfaceMVK                                                vkCreateIOSSurfaceMVK;
            }

            // VK_MVK_macos_surface : function pointer decelerations
            else static if( __traits( isSame, extension, MVK_macos_surface )) {
                PFN_vkCreateMacOSSurfaceMVK                                              vkCreateMacOSSurfaceMVK;
            }

            // VK_ANDROID_external_memory_android_hardware_buffer : function pointer decelerations
            else static if( __traits( isSame, extension, ANDROID_external_memory_android_hardware_buffer )) {
                PFN_vkGetAndroidHardwareBufferPropertiesANDROID                          vkGetAndroidHardwareBufferPropertiesANDROID;
                PFN_vkGetMemoryAndroidHardwareBufferANDROID                              vkGetMemoryAndroidHardwareBufferANDROID;
            }

            // VK_AMDX_shader_enqueue : function pointer decelerations
            else static if( __traits( isSame, extension, AMDX_shader_enqueue )) {
                PFN_vkCreateExecutionGraphPipelinesAMDX                                  vkCreateExecutionGraphPipelinesAMDX;
                PFN_vkGetExecutionGraphPipelineScratchSizeAMDX                           vkGetExecutionGraphPipelineScratchSizeAMDX;
                PFN_vkGetExecutionGraphPipelineNodeIndexAMDX                             vkGetExecutionGraphPipelineNodeIndexAMDX;
                PFN_vkCmdInitializeGraphScratchMemoryAMDX                                vkCmdInitializeGraphScratchMemoryAMDX;
                PFN_vkCmdDispatchGraphAMDX                                               vkCmdDispatchGraphAMDX;
                PFN_vkCmdDispatchGraphIndirectAMDX                                       vkCmdDispatchGraphIndirectAMDX;
                PFN_vkCmdDispatchGraphIndirectCountAMDX                                  vkCmdDispatchGraphIndirectCountAMDX;
            }

            // VK_FUCHSIA_imagepipe_surface : function pointer decelerations
            else static if( __traits( isSame, extension, FUCHSIA_imagepipe_surface )) {
                PFN_vkCreateImagePipeSurfaceFUCHSIA                                      vkCreateImagePipeSurfaceFUCHSIA;
            }

            // VK_EXT_metal_surface : function pointer decelerations
            else static if( __traits( isSame, extension, EXT_metal_surface )) {
                PFN_vkCreateMetalSurfaceEXT                                              vkCreateMetalSurfaceEXT;
            }

            // VK_EXT_full_screen_exclusive : function pointer decelerations
            else static if( __traits( isSame, extension, EXT_full_screen_exclusive )) {
                PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT                           vkGetPhysicalDeviceSurfacePresentModes2EXT;
                PFN_vkAcquireFullScreenExclusiveModeEXT                                  vkAcquireFullScreenExclusiveModeEXT;
                PFN_vkReleaseFullScreenExclusiveModeEXT                                  vkReleaseFullScreenExclusiveModeEXT;
                PFN_vkGetDeviceGroupSurfacePresentModes2EXT                              vkGetDeviceGroupSurfacePresentModes2EXT;
            }

            // VK_NV_cuda_kernel_launch : function pointer decelerations
            else static if( __traits( isSame, extension, NV_cuda_kernel_launch )) {
                PFN_vkCreateCudaModuleNV                                                 vkCreateCudaModuleNV;
                PFN_vkGetCudaModuleCacheNV                                               vkGetCudaModuleCacheNV;
                PFN_vkCreateCudaFunctionNV                                               vkCreateCudaFunctionNV;
                PFN_vkDestroyCudaModuleNV                                                vkDestroyCudaModuleNV;
                PFN_vkDestroyCudaFunctionNV                                              vkDestroyCudaFunctionNV;
                PFN_vkCmdCudaLaunchKernelNV                                              vkCmdCudaLaunchKernelNV;
            }

            // VK_EXT_metal_objects : function pointer decelerations
            else static if( __traits( isSame, extension, EXT_metal_objects )) {
                PFN_vkExportMetalObjectsEXT                                              vkExportMetalObjectsEXT;
            }

            // VK_NV_acquire_winrt_display : function pointer decelerations
            else static if( __traits( isSame, extension, NV_acquire_winrt_display )) {
                PFN_vkAcquireWinrtDisplayNV                                              vkAcquireWinrtDisplayNV;
                PFN_vkGetWinrtDisplayNV                                                  vkGetWinrtDisplayNV;
            }

            // VK_EXT_directfb_surface : function pointer decelerations
            else static if( __traits( isSame, extension, EXT_directfb_surface )) {
                PFN_vkCreateDirectFBSurfaceEXT                                           vkCreateDirectFBSurfaceEXT;
                PFN_vkGetPhysicalDeviceDirectFBPresentationSupportEXT                    vkGetPhysicalDeviceDirectFBPresentationSupportEXT;
            }

            // VK_FUCHSIA_external_memory : function pointer decelerations
            else static if( __traits( isSame, extension, FUCHSIA_external_memory )) {
                PFN_vkGetMemoryZirconHandleFUCHSIA                                       vkGetMemoryZirconHandleFUCHSIA;
                PFN_vkGetMemoryZirconHandlePropertiesFUCHSIA                             vkGetMemoryZirconHandlePropertiesFUCHSIA;
            }

            // VK_FUCHSIA_external_semaphore : function pointer decelerations
            else static if( __traits( isSame, extension, FUCHSIA_external_semaphore )) {
                PFN_vkImportSemaphoreZirconHandleFUCHSIA                                 vkImportSemaphoreZirconHandleFUCHSIA;
                PFN_vkGetSemaphoreZirconHandleFUCHSIA                                    vkGetSemaphoreZirconHandleFUCHSIA;
            }

            // VK_FUCHSIA_buffer_collection : function pointer decelerations
            else static if( __traits( isSame, extension, FUCHSIA_buffer_collection )) {
                PFN_vkCreateBufferCollectionFUCHSIA                                      vkCreateBufferCollectionFUCHSIA;
                PFN_vkSetBufferCollectionImageConstraintsFUCHSIA                         vkSetBufferCollectionImageConstraintsFUCHSIA;
                PFN_vkSetBufferCollectionBufferConstraintsFUCHSIA                        vkSetBufferCollectionBufferConstraintsFUCHSIA;
                PFN_vkDestroyBufferCollectionFUCHSIA                                     vkDestroyBufferCollectionFUCHSIA;
                PFN_vkGetBufferCollectionPropertiesFUCHSIA                               vkGetBufferCollectionPropertiesFUCHSIA;
            }

            // VK_QNX_screen_surface : function pointer decelerations
            else static if( __traits( isSame, extension, QNX_screen_surface )) {
                PFN_vkCreateScreenSurfaceQNX                                             vkCreateScreenSurfaceQNX;
                PFN_vkGetPhysicalDeviceScreenPresentationSupportQNX                      vkGetPhysicalDeviceScreenPresentationSupportQNX;
            }

            // VK_OHOS_external_memory : function pointer decelerations
            else static if( __traits( isSame, extension, OHOS_external_memory )) {
                PFN_vkGetNativeBufferPropertiesOHOS                                      vkGetNativeBufferPropertiesOHOS;
                PFN_vkGetMemoryNativeBufferOHOS                                          vkGetMemoryNativeBufferOHOS;
            }

            // VK_QNX_external_memory_screen_buffer : function pointer decelerations
            else static if( __traits( isSame, extension, QNX_external_memory_screen_buffer )) {
                PFN_vkGetScreenBufferPropertiesQNX                                       vkGetScreenBufferPropertiesQNX;
            }

            // VK_OHOS_surface : function pointer decelerations
            else static if( __traits( isSame, extension, OHOS_surface )) {
                PFN_vkCreateSurfaceOHOS                                                  vkCreateSurfaceOHOS;
            }

            // VK_EXT_external_memory_metal : function pointer decelerations
            else static if( __traits( isSame, extension, EXT_external_memory_metal )) {
                PFN_vkGetMemoryMetalHandleEXT                                            vkGetMemoryMetalHandleEXT;
                PFN_vkGetMemoryMetalHandlePropertiesEXT                                  vkGetMemoryMetalHandlePropertiesEXT;
            }

            // VK_SEC_ubm_surface : function pointer decelerations
            else static if( __traits( isSame, extension, SEC_ubm_surface )) {
                PFN_vkCreateUbmSurfaceSEC                                                vkCreateUbmSurfaceSEC;
                PFN_vkGetPhysicalDeviceUbmPresentationSupportSEC                         vkGetPhysicalDeviceUbmPresentationSupportSEC;
            }
        }
    }

    // workaround for not being able to mixin two overloads with the same symbol name
    alias loadDeviceLevelFunctionsExt = loadDeviceLevelFunctionsExtI;
    alias loadDeviceLevelFunctionsExt = loadDeviceLevelFunctionsExtD;

    // backwards compatibility aliases
    alias loadInstanceLevelFunctions = loadInstanceLevelFunctionsExt;
    alias loadDeviceLevelFunctions = loadDeviceLevelFunctionsExt;
    alias DispatchDevice = DispatchDeviceExt;

    // compose loadInstanceLevelFunctionsExt function out of unextended
    // loadInstanceLevelFunctions and additional function pointers from extensions
    void loadInstanceLevelFunctionsExt( VkInstance instance ) {

        // first load all non platform related function pointers from implementation
        erupted.functions.loadInstanceLevelFunctions( instance );

        // 2. loop through alias sequence and mixin corresponding
        // instance level function pointer definitions
        static foreach( extension; noDuplicateExtensions ) {

            // VK_KHR_xlib_surface : load instance level function definitions
            static if( __traits( isSame, extension, KHR_xlib_surface )) {
                vkCreateXlibSurfaceKHR                                               = cast( PFN_vkCreateXlibSurfaceKHR                                               ) vkGetInstanceProcAddr( instance, "vkCreateXlibSurfaceKHR" );
                vkGetPhysicalDeviceXlibPresentationSupportKHR                        = cast( PFN_vkGetPhysicalDeviceXlibPresentationSupportKHR                        ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceXlibPresentationSupportKHR" );
            }

            // VK_KHR_xcb_surface : load instance level function definitions
            else static if( __traits( isSame, extension, KHR_xcb_surface )) {
                vkCreateXcbSurfaceKHR                                                = cast( PFN_vkCreateXcbSurfaceKHR                                                ) vkGetInstanceProcAddr( instance, "vkCreateXcbSurfaceKHR" );
                vkGetPhysicalDeviceXcbPresentationSupportKHR                         = cast( PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR                         ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceXcbPresentationSupportKHR" );
            }

            // VK_KHR_wayland_surface : load instance level function definitions
            else static if( __traits( isSame, extension, KHR_wayland_surface )) {
                vkCreateWaylandSurfaceKHR                                            = cast( PFN_vkCreateWaylandSurfaceKHR                                            ) vkGetInstanceProcAddr( instance, "vkCreateWaylandSurfaceKHR" );
                vkGetPhysicalDeviceWaylandPresentationSupportKHR                     = cast( PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR                     ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceWaylandPresentationSupportKHR" );
            }

            // VK_KHR_android_surface : load instance level function definitions
            else static if( __traits( isSame, extension, KHR_android_surface )) {
                vkCreateAndroidSurfaceKHR                                            = cast( PFN_vkCreateAndroidSurfaceKHR                                            ) vkGetInstanceProcAddr( instance, "vkCreateAndroidSurfaceKHR" );
            }

            // VK_KHR_win32_surface : load instance level function definitions
            else static if( __traits( isSame, extension, KHR_win32_surface )) {
                vkCreateWin32SurfaceKHR                                              = cast( PFN_vkCreateWin32SurfaceKHR                                              ) vkGetInstanceProcAddr( instance, "vkCreateWin32SurfaceKHR" );
                vkGetPhysicalDeviceWin32PresentationSupportKHR                       = cast( PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR                       ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceWin32PresentationSupportKHR" );
            }

            // VK_GGP_stream_descriptor_surface : load instance level function definitions
            else static if( __traits( isSame, extension, GGP_stream_descriptor_surface )) {
                vkCreateStreamDescriptorSurfaceGGP                                   = cast( PFN_vkCreateStreamDescriptorSurfaceGGP                                   ) vkGetInstanceProcAddr( instance, "vkCreateStreamDescriptorSurfaceGGP" );
            }

            // VK_NN_vi_surface : load instance level function definitions
            else static if( __traits( isSame, extension, NN_vi_surface )) {
                vkCreateViSurfaceNN                                                  = cast( PFN_vkCreateViSurfaceNN                                                  ) vkGetInstanceProcAddr( instance, "vkCreateViSurfaceNN" );
            }

            // VK_EXT_acquire_xlib_display : load instance level function definitions
            else static if( __traits( isSame, extension, EXT_acquire_xlib_display )) {
                vkAcquireXlibDisplayEXT                                              = cast( PFN_vkAcquireXlibDisplayEXT                                              ) vkGetInstanceProcAddr( instance, "vkAcquireXlibDisplayEXT" );
                vkGetRandROutputDisplayEXT                                           = cast( PFN_vkGetRandROutputDisplayEXT                                           ) vkGetInstanceProcAddr( instance, "vkGetRandROutputDisplayEXT" );
            }

            // VK_MVK_ios_surface : load instance level function definitions
            else static if( __traits( isSame, extension, MVK_ios_surface )) {
                vkCreateIOSSurfaceMVK                                                = cast( PFN_vkCreateIOSSurfaceMVK                                                ) vkGetInstanceProcAddr( instance, "vkCreateIOSSurfaceMVK" );
            }

            // VK_MVK_macos_surface : load instance level function definitions
            else static if( __traits( isSame, extension, MVK_macos_surface )) {
                vkCreateMacOSSurfaceMVK                                              = cast( PFN_vkCreateMacOSSurfaceMVK                                              ) vkGetInstanceProcAddr( instance, "vkCreateMacOSSurfaceMVK" );
            }

            // VK_FUCHSIA_imagepipe_surface : load instance level function definitions
            else static if( __traits( isSame, extension, FUCHSIA_imagepipe_surface )) {
                vkCreateImagePipeSurfaceFUCHSIA                                      = cast( PFN_vkCreateImagePipeSurfaceFUCHSIA                                      ) vkGetInstanceProcAddr( instance, "vkCreateImagePipeSurfaceFUCHSIA" );
            }

            // VK_EXT_metal_surface : load instance level function definitions
            else static if( __traits( isSame, extension, EXT_metal_surface )) {
                vkCreateMetalSurfaceEXT                                              = cast( PFN_vkCreateMetalSurfaceEXT                                              ) vkGetInstanceProcAddr( instance, "vkCreateMetalSurfaceEXT" );
            }

            // VK_EXT_full_screen_exclusive : load instance level function definitions
            else static if( __traits( isSame, extension, EXT_full_screen_exclusive )) {
                vkGetPhysicalDeviceSurfacePresentModes2EXT                           = cast( PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT                           ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSurfacePresentModes2EXT" );
            }

            // VK_NV_acquire_winrt_display : load instance level function definitions
            else static if( __traits( isSame, extension, NV_acquire_winrt_display )) {
                vkAcquireWinrtDisplayNV                                              = cast( PFN_vkAcquireWinrtDisplayNV                                              ) vkGetInstanceProcAddr( instance, "vkAcquireWinrtDisplayNV" );
                vkGetWinrtDisplayNV                                                  = cast( PFN_vkGetWinrtDisplayNV                                                  ) vkGetInstanceProcAddr( instance, "vkGetWinrtDisplayNV" );
            }

            // VK_EXT_directfb_surface : load instance level function definitions
            else static if( __traits( isSame, extension, EXT_directfb_surface )) {
                vkCreateDirectFBSurfaceEXT                                           = cast( PFN_vkCreateDirectFBSurfaceEXT                                           ) vkGetInstanceProcAddr( instance, "vkCreateDirectFBSurfaceEXT" );
                vkGetPhysicalDeviceDirectFBPresentationSupportEXT                    = cast( PFN_vkGetPhysicalDeviceDirectFBPresentationSupportEXT                    ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceDirectFBPresentationSupportEXT" );
            }

            // VK_QNX_screen_surface : load instance level function definitions
            else static if( __traits( isSame, extension, QNX_screen_surface )) {
                vkCreateScreenSurfaceQNX                                             = cast( PFN_vkCreateScreenSurfaceQNX                                             ) vkGetInstanceProcAddr( instance, "vkCreateScreenSurfaceQNX" );
                vkGetPhysicalDeviceScreenPresentationSupportQNX                      = cast( PFN_vkGetPhysicalDeviceScreenPresentationSupportQNX                      ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceScreenPresentationSupportQNX" );
            }

            // VK_OHOS_surface : load instance level function definitions
            else static if( __traits( isSame, extension, OHOS_surface )) {
                vkCreateSurfaceOHOS                                                  = cast( PFN_vkCreateSurfaceOHOS                                                  ) vkGetInstanceProcAddr( instance, "vkCreateSurfaceOHOS" );
            }

            // VK_SEC_ubm_surface : load instance level function definitions
            else static if( __traits( isSame, extension, SEC_ubm_surface )) {
                vkCreateUbmSurfaceSEC                                                = cast( PFN_vkCreateUbmSurfaceSEC                                                ) vkGetInstanceProcAddr( instance, "vkCreateUbmSurfaceSEC" );
                vkGetPhysicalDeviceUbmPresentationSupportSEC                         = cast( PFN_vkGetPhysicalDeviceUbmPresentationSupportSEC                         ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceUbmPresentationSupportSEC" );
            }
        }
    }

    // compose instance based loadDeviceLevelFunctionsExtI function out of unextended
    // loadDeviceLevelFunctions and additional function pointers from extensions
    // suffix I is required, as we cannot mixin mixin two overloads with the same symbol name (any more!)
    void loadDeviceLevelFunctionsExtI( VkInstance instance ) {

        // first load all non platform related function pointers from implementation
        erupted.functions.loadDeviceLevelFunctions( instance );

        // 3. loop through alias sequence and mixin corresponding
        // instance based device level function pointer definitions
        static foreach( extension; noDuplicateExtensions ) {

            // VK_KHR_external_memory_win32 : load instance based device level function definitions
            static if( __traits( isSame, extension, KHR_external_memory_win32 )) {
                vkGetMemoryWin32HandleKHR                                = cast( PFN_vkGetMemoryWin32HandleKHR                                ) vkGetInstanceProcAddr( instance, "vkGetMemoryWin32HandleKHR" );
                vkGetMemoryWin32HandlePropertiesKHR                      = cast( PFN_vkGetMemoryWin32HandlePropertiesKHR                      ) vkGetInstanceProcAddr( instance, "vkGetMemoryWin32HandlePropertiesKHR" );
            }

            // VK_KHR_external_semaphore_win32 : load instance based device level function definitions
            else static if( __traits( isSame, extension, KHR_external_semaphore_win32 )) {
                vkImportSemaphoreWin32HandleKHR                          = cast( PFN_vkImportSemaphoreWin32HandleKHR                          ) vkGetInstanceProcAddr( instance, "vkImportSemaphoreWin32HandleKHR" );
                vkGetSemaphoreWin32HandleKHR                             = cast( PFN_vkGetSemaphoreWin32HandleKHR                             ) vkGetInstanceProcAddr( instance, "vkGetSemaphoreWin32HandleKHR" );
            }

            // VK_KHR_external_fence_win32 : load instance based device level function definitions
            else static if( __traits( isSame, extension, KHR_external_fence_win32 )) {
                vkImportFenceWin32HandleKHR                              = cast( PFN_vkImportFenceWin32HandleKHR                              ) vkGetInstanceProcAddr( instance, "vkImportFenceWin32HandleKHR" );
                vkGetFenceWin32HandleKHR                                 = cast( PFN_vkGetFenceWin32HandleKHR                                 ) vkGetInstanceProcAddr( instance, "vkGetFenceWin32HandleKHR" );
            }

            // VK_NV_external_memory_win32 : load instance based device level function definitions
            else static if( __traits( isSame, extension, NV_external_memory_win32 )) {
                vkGetMemoryWin32HandleNV                                 = cast( PFN_vkGetMemoryWin32HandleNV                                 ) vkGetInstanceProcAddr( instance, "vkGetMemoryWin32HandleNV" );
            }

            // VK_ANDROID_external_memory_android_hardware_buffer : load instance based device level function definitions
            else static if( __traits( isSame, extension, ANDROID_external_memory_android_hardware_buffer )) {
                vkGetAndroidHardwareBufferPropertiesANDROID              = cast( PFN_vkGetAndroidHardwareBufferPropertiesANDROID              ) vkGetInstanceProcAddr( instance, "vkGetAndroidHardwareBufferPropertiesANDROID" );
                vkGetMemoryAndroidHardwareBufferANDROID                  = cast( PFN_vkGetMemoryAndroidHardwareBufferANDROID                  ) vkGetInstanceProcAddr( instance, "vkGetMemoryAndroidHardwareBufferANDROID" );
            }

            // VK_AMDX_shader_enqueue : load instance based device level function definitions
            else static if( __traits( isSame, extension, AMDX_shader_enqueue )) {
                vkCreateExecutionGraphPipelinesAMDX                      = cast( PFN_vkCreateExecutionGraphPipelinesAMDX                      ) vkGetInstanceProcAddr( instance, "vkCreateExecutionGraphPipelinesAMDX" );
                vkGetExecutionGraphPipelineScratchSizeAMDX               = cast( PFN_vkGetExecutionGraphPipelineScratchSizeAMDX               ) vkGetInstanceProcAddr( instance, "vkGetExecutionGraphPipelineScratchSizeAMDX" );
                vkGetExecutionGraphPipelineNodeIndexAMDX                 = cast( PFN_vkGetExecutionGraphPipelineNodeIndexAMDX                 ) vkGetInstanceProcAddr( instance, "vkGetExecutionGraphPipelineNodeIndexAMDX" );
                vkCmdInitializeGraphScratchMemoryAMDX                    = cast( PFN_vkCmdInitializeGraphScratchMemoryAMDX                    ) vkGetInstanceProcAddr( instance, "vkCmdInitializeGraphScratchMemoryAMDX" );
                vkCmdDispatchGraphAMDX                                   = cast( PFN_vkCmdDispatchGraphAMDX                                   ) vkGetInstanceProcAddr( instance, "vkCmdDispatchGraphAMDX" );
                vkCmdDispatchGraphIndirectAMDX                           = cast( PFN_vkCmdDispatchGraphIndirectAMDX                           ) vkGetInstanceProcAddr( instance, "vkCmdDispatchGraphIndirectAMDX" );
                vkCmdDispatchGraphIndirectCountAMDX                      = cast( PFN_vkCmdDispatchGraphIndirectCountAMDX                      ) vkGetInstanceProcAddr( instance, "vkCmdDispatchGraphIndirectCountAMDX" );
            }

            // VK_EXT_full_screen_exclusive : load instance based device level function definitions
            else static if( __traits( isSame, extension, EXT_full_screen_exclusive )) {
                vkAcquireFullScreenExclusiveModeEXT                      = cast( PFN_vkAcquireFullScreenExclusiveModeEXT                      ) vkGetInstanceProcAddr( instance, "vkAcquireFullScreenExclusiveModeEXT" );
                vkReleaseFullScreenExclusiveModeEXT                      = cast( PFN_vkReleaseFullScreenExclusiveModeEXT                      ) vkGetInstanceProcAddr( instance, "vkReleaseFullScreenExclusiveModeEXT" );
                vkGetDeviceGroupSurfacePresentModes2EXT                  = cast( PFN_vkGetDeviceGroupSurfacePresentModes2EXT                  ) vkGetInstanceProcAddr( instance, "vkGetDeviceGroupSurfacePresentModes2EXT" );
            }

            // VK_NV_cuda_kernel_launch : load instance based device level function definitions
            else static if( __traits( isSame, extension, NV_cuda_kernel_launch )) {
                vkCreateCudaModuleNV                                     = cast( PFN_vkCreateCudaModuleNV                                     ) vkGetInstanceProcAddr( instance, "vkCreateCudaModuleNV" );
                vkGetCudaModuleCacheNV                                   = cast( PFN_vkGetCudaModuleCacheNV                                   ) vkGetInstanceProcAddr( instance, "vkGetCudaModuleCacheNV" );
                vkCreateCudaFunctionNV                                   = cast( PFN_vkCreateCudaFunctionNV                                   ) vkGetInstanceProcAddr( instance, "vkCreateCudaFunctionNV" );
                vkDestroyCudaModuleNV                                    = cast( PFN_vkDestroyCudaModuleNV                                    ) vkGetInstanceProcAddr( instance, "vkDestroyCudaModuleNV" );
                vkDestroyCudaFunctionNV                                  = cast( PFN_vkDestroyCudaFunctionNV                                  ) vkGetInstanceProcAddr( instance, "vkDestroyCudaFunctionNV" );
                vkCmdCudaLaunchKernelNV                                  = cast( PFN_vkCmdCudaLaunchKernelNV                                  ) vkGetInstanceProcAddr( instance, "vkCmdCudaLaunchKernelNV" );
            }

            // VK_EXT_metal_objects : load instance based device level function definitions
            else static if( __traits( isSame, extension, EXT_metal_objects )) {
                vkExportMetalObjectsEXT                                  = cast( PFN_vkExportMetalObjectsEXT                                  ) vkGetInstanceProcAddr( instance, "vkExportMetalObjectsEXT" );
            }

            // VK_FUCHSIA_external_memory : load instance based device level function definitions
            else static if( __traits( isSame, extension, FUCHSIA_external_memory )) {
                vkGetMemoryZirconHandleFUCHSIA                           = cast( PFN_vkGetMemoryZirconHandleFUCHSIA                           ) vkGetInstanceProcAddr( instance, "vkGetMemoryZirconHandleFUCHSIA" );
                vkGetMemoryZirconHandlePropertiesFUCHSIA                 = cast( PFN_vkGetMemoryZirconHandlePropertiesFUCHSIA                 ) vkGetInstanceProcAddr( instance, "vkGetMemoryZirconHandlePropertiesFUCHSIA" );
            }

            // VK_FUCHSIA_external_semaphore : load instance based device level function definitions
            else static if( __traits( isSame, extension, FUCHSIA_external_semaphore )) {
                vkImportSemaphoreZirconHandleFUCHSIA                     = cast( PFN_vkImportSemaphoreZirconHandleFUCHSIA                     ) vkGetInstanceProcAddr( instance, "vkImportSemaphoreZirconHandleFUCHSIA" );
                vkGetSemaphoreZirconHandleFUCHSIA                        = cast( PFN_vkGetSemaphoreZirconHandleFUCHSIA                        ) vkGetInstanceProcAddr( instance, "vkGetSemaphoreZirconHandleFUCHSIA" );
            }

            // VK_FUCHSIA_buffer_collection : load instance based device level function definitions
            else static if( __traits( isSame, extension, FUCHSIA_buffer_collection )) {
                vkCreateBufferCollectionFUCHSIA                          = cast( PFN_vkCreateBufferCollectionFUCHSIA                          ) vkGetInstanceProcAddr( instance, "vkCreateBufferCollectionFUCHSIA" );
                vkSetBufferCollectionImageConstraintsFUCHSIA             = cast( PFN_vkSetBufferCollectionImageConstraintsFUCHSIA             ) vkGetInstanceProcAddr( instance, "vkSetBufferCollectionImageConstraintsFUCHSIA" );
                vkSetBufferCollectionBufferConstraintsFUCHSIA            = cast( PFN_vkSetBufferCollectionBufferConstraintsFUCHSIA            ) vkGetInstanceProcAddr( instance, "vkSetBufferCollectionBufferConstraintsFUCHSIA" );
                vkDestroyBufferCollectionFUCHSIA                         = cast( PFN_vkDestroyBufferCollectionFUCHSIA                         ) vkGetInstanceProcAddr( instance, "vkDestroyBufferCollectionFUCHSIA" );
                vkGetBufferCollectionPropertiesFUCHSIA                   = cast( PFN_vkGetBufferCollectionPropertiesFUCHSIA                   ) vkGetInstanceProcAddr( instance, "vkGetBufferCollectionPropertiesFUCHSIA" );
            }

            // VK_OHOS_external_memory : load instance based device level function definitions
            else static if( __traits( isSame, extension, OHOS_external_memory )) {
                vkGetNativeBufferPropertiesOHOS                          = cast( PFN_vkGetNativeBufferPropertiesOHOS                          ) vkGetInstanceProcAddr( instance, "vkGetNativeBufferPropertiesOHOS" );
                vkGetMemoryNativeBufferOHOS                              = cast( PFN_vkGetMemoryNativeBufferOHOS                              ) vkGetInstanceProcAddr( instance, "vkGetMemoryNativeBufferOHOS" );
            }

            // VK_QNX_external_memory_screen_buffer : load instance based device level function definitions
            else static if( __traits( isSame, extension, QNX_external_memory_screen_buffer )) {
                vkGetScreenBufferPropertiesQNX                           = cast( PFN_vkGetScreenBufferPropertiesQNX                           ) vkGetInstanceProcAddr( instance, "vkGetScreenBufferPropertiesQNX" );
            }

            // VK_EXT_external_memory_metal : load instance based device level function definitions
            else static if( __traits( isSame, extension, EXT_external_memory_metal )) {
                vkGetMemoryMetalHandleEXT                                = cast( PFN_vkGetMemoryMetalHandleEXT                                ) vkGetInstanceProcAddr( instance, "vkGetMemoryMetalHandleEXT" );
                vkGetMemoryMetalHandlePropertiesEXT                      = cast( PFN_vkGetMemoryMetalHandlePropertiesEXT                      ) vkGetInstanceProcAddr( instance, "vkGetMemoryMetalHandlePropertiesEXT" );
            }
        }
    }

    // compose device based loadDeviceLevelFunctionsExtD function out of unextended
    // loadDeviceLevelFunctions and additional function pointers from extensions
    // suffix D is required as, we cannot mixin mixin two overloads with the same symbol name (any more!)
    void loadDeviceLevelFunctionsExtD( VkDevice device ) {

        // first load all non platform related function pointers from implementation
        erupted.functions.loadDeviceLevelFunctions( device );

        // 4. loop through alias sequence and mixin corresponding
        // device based device level function pointer definitions
        static foreach( extension; noDuplicateExtensions ) {

            // VK_KHR_external_memory_win32 : load device based device level function definitions
            static if( __traits( isSame, extension, KHR_external_memory_win32 )) {
                vkGetMemoryWin32HandleKHR                                = cast( PFN_vkGetMemoryWin32HandleKHR                                ) vkGetDeviceProcAddr( device, "vkGetMemoryWin32HandleKHR" );
                vkGetMemoryWin32HandlePropertiesKHR                      = cast( PFN_vkGetMemoryWin32HandlePropertiesKHR                      ) vkGetDeviceProcAddr( device, "vkGetMemoryWin32HandlePropertiesKHR" );
            }

            // VK_KHR_external_semaphore_win32 : load device based device level function definitions
            else static if( __traits( isSame, extension, KHR_external_semaphore_win32 )) {
                vkImportSemaphoreWin32HandleKHR                          = cast( PFN_vkImportSemaphoreWin32HandleKHR                          ) vkGetDeviceProcAddr( device, "vkImportSemaphoreWin32HandleKHR" );
                vkGetSemaphoreWin32HandleKHR                             = cast( PFN_vkGetSemaphoreWin32HandleKHR                             ) vkGetDeviceProcAddr( device, "vkGetSemaphoreWin32HandleKHR" );
            }

            // VK_KHR_external_fence_win32 : load device based device level function definitions
            else static if( __traits( isSame, extension, KHR_external_fence_win32 )) {
                vkImportFenceWin32HandleKHR                              = cast( PFN_vkImportFenceWin32HandleKHR                              ) vkGetDeviceProcAddr( device, "vkImportFenceWin32HandleKHR" );
                vkGetFenceWin32HandleKHR                                 = cast( PFN_vkGetFenceWin32HandleKHR                                 ) vkGetDeviceProcAddr( device, "vkGetFenceWin32HandleKHR" );
            }

            // VK_NV_external_memory_win32 : load device based device level function definitions
            else static if( __traits( isSame, extension, NV_external_memory_win32 )) {
                vkGetMemoryWin32HandleNV                                 = cast( PFN_vkGetMemoryWin32HandleNV                                 ) vkGetDeviceProcAddr( device, "vkGetMemoryWin32HandleNV" );
            }

            // VK_ANDROID_external_memory_android_hardware_buffer : load device based device level function definitions
            else static if( __traits( isSame, extension, ANDROID_external_memory_android_hardware_buffer )) {
                vkGetAndroidHardwareBufferPropertiesANDROID              = cast( PFN_vkGetAndroidHardwareBufferPropertiesANDROID              ) vkGetDeviceProcAddr( device, "vkGetAndroidHardwareBufferPropertiesANDROID" );
                vkGetMemoryAndroidHardwareBufferANDROID                  = cast( PFN_vkGetMemoryAndroidHardwareBufferANDROID                  ) vkGetDeviceProcAddr( device, "vkGetMemoryAndroidHardwareBufferANDROID" );
            }

            // VK_AMDX_shader_enqueue : load device based device level function definitions
            else static if( __traits( isSame, extension, AMDX_shader_enqueue )) {
                vkCreateExecutionGraphPipelinesAMDX                      = cast( PFN_vkCreateExecutionGraphPipelinesAMDX                      ) vkGetDeviceProcAddr( device, "vkCreateExecutionGraphPipelinesAMDX" );
                vkGetExecutionGraphPipelineScratchSizeAMDX               = cast( PFN_vkGetExecutionGraphPipelineScratchSizeAMDX               ) vkGetDeviceProcAddr( device, "vkGetExecutionGraphPipelineScratchSizeAMDX" );
                vkGetExecutionGraphPipelineNodeIndexAMDX                 = cast( PFN_vkGetExecutionGraphPipelineNodeIndexAMDX                 ) vkGetDeviceProcAddr( device, "vkGetExecutionGraphPipelineNodeIndexAMDX" );
                vkCmdInitializeGraphScratchMemoryAMDX                    = cast( PFN_vkCmdInitializeGraphScratchMemoryAMDX                    ) vkGetDeviceProcAddr( device, "vkCmdInitializeGraphScratchMemoryAMDX" );
                vkCmdDispatchGraphAMDX                                   = cast( PFN_vkCmdDispatchGraphAMDX                                   ) vkGetDeviceProcAddr( device, "vkCmdDispatchGraphAMDX" );
                vkCmdDispatchGraphIndirectAMDX                           = cast( PFN_vkCmdDispatchGraphIndirectAMDX                           ) vkGetDeviceProcAddr( device, "vkCmdDispatchGraphIndirectAMDX" );
                vkCmdDispatchGraphIndirectCountAMDX                      = cast( PFN_vkCmdDispatchGraphIndirectCountAMDX                      ) vkGetDeviceProcAddr( device, "vkCmdDispatchGraphIndirectCountAMDX" );
            }

            // VK_EXT_full_screen_exclusive : load device based device level function definitions
            else static if( __traits( isSame, extension, EXT_full_screen_exclusive )) {
                vkAcquireFullScreenExclusiveModeEXT                      = cast( PFN_vkAcquireFullScreenExclusiveModeEXT                      ) vkGetDeviceProcAddr( device, "vkAcquireFullScreenExclusiveModeEXT" );
                vkReleaseFullScreenExclusiveModeEXT                      = cast( PFN_vkReleaseFullScreenExclusiveModeEXT                      ) vkGetDeviceProcAddr( device, "vkReleaseFullScreenExclusiveModeEXT" );
                vkGetDeviceGroupSurfacePresentModes2EXT                  = cast( PFN_vkGetDeviceGroupSurfacePresentModes2EXT                  ) vkGetDeviceProcAddr( device, "vkGetDeviceGroupSurfacePresentModes2EXT" );
            }

            // VK_NV_cuda_kernel_launch : load device based device level function definitions
            else static if( __traits( isSame, extension, NV_cuda_kernel_launch )) {
                vkCreateCudaModuleNV                                     = cast( PFN_vkCreateCudaModuleNV                                     ) vkGetDeviceProcAddr( device, "vkCreateCudaModuleNV" );
                vkGetCudaModuleCacheNV                                   = cast( PFN_vkGetCudaModuleCacheNV                                   ) vkGetDeviceProcAddr( device, "vkGetCudaModuleCacheNV" );
                vkCreateCudaFunctionNV                                   = cast( PFN_vkCreateCudaFunctionNV                                   ) vkGetDeviceProcAddr( device, "vkCreateCudaFunctionNV" );
                vkDestroyCudaModuleNV                                    = cast( PFN_vkDestroyCudaModuleNV                                    ) vkGetDeviceProcAddr( device, "vkDestroyCudaModuleNV" );
                vkDestroyCudaFunctionNV                                  = cast( PFN_vkDestroyCudaFunctionNV                                  ) vkGetDeviceProcAddr( device, "vkDestroyCudaFunctionNV" );
                vkCmdCudaLaunchKernelNV                                  = cast( PFN_vkCmdCudaLaunchKernelNV                                  ) vkGetDeviceProcAddr( device, "vkCmdCudaLaunchKernelNV" );
            }

            // VK_EXT_metal_objects : load device based device level function definitions
            else static if( __traits( isSame, extension, EXT_metal_objects )) {
                vkExportMetalObjectsEXT                                  = cast( PFN_vkExportMetalObjectsEXT                                  ) vkGetDeviceProcAddr( device, "vkExportMetalObjectsEXT" );
            }

            // VK_FUCHSIA_external_memory : load device based device level function definitions
            else static if( __traits( isSame, extension, FUCHSIA_external_memory )) {
                vkGetMemoryZirconHandleFUCHSIA                           = cast( PFN_vkGetMemoryZirconHandleFUCHSIA                           ) vkGetDeviceProcAddr( device, "vkGetMemoryZirconHandleFUCHSIA" );
                vkGetMemoryZirconHandlePropertiesFUCHSIA                 = cast( PFN_vkGetMemoryZirconHandlePropertiesFUCHSIA                 ) vkGetDeviceProcAddr( device, "vkGetMemoryZirconHandlePropertiesFUCHSIA" );
            }

            // VK_FUCHSIA_external_semaphore : load device based device level function definitions
            else static if( __traits( isSame, extension, FUCHSIA_external_semaphore )) {
                vkImportSemaphoreZirconHandleFUCHSIA                     = cast( PFN_vkImportSemaphoreZirconHandleFUCHSIA                     ) vkGetDeviceProcAddr( device, "vkImportSemaphoreZirconHandleFUCHSIA" );
                vkGetSemaphoreZirconHandleFUCHSIA                        = cast( PFN_vkGetSemaphoreZirconHandleFUCHSIA                        ) vkGetDeviceProcAddr( device, "vkGetSemaphoreZirconHandleFUCHSIA" );
            }

            // VK_FUCHSIA_buffer_collection : load device based device level function definitions
            else static if( __traits( isSame, extension, FUCHSIA_buffer_collection )) {
                vkCreateBufferCollectionFUCHSIA                          = cast( PFN_vkCreateBufferCollectionFUCHSIA                          ) vkGetDeviceProcAddr( device, "vkCreateBufferCollectionFUCHSIA" );
                vkSetBufferCollectionImageConstraintsFUCHSIA             = cast( PFN_vkSetBufferCollectionImageConstraintsFUCHSIA             ) vkGetDeviceProcAddr( device, "vkSetBufferCollectionImageConstraintsFUCHSIA" );
                vkSetBufferCollectionBufferConstraintsFUCHSIA            = cast( PFN_vkSetBufferCollectionBufferConstraintsFUCHSIA            ) vkGetDeviceProcAddr( device, "vkSetBufferCollectionBufferConstraintsFUCHSIA" );
                vkDestroyBufferCollectionFUCHSIA                         = cast( PFN_vkDestroyBufferCollectionFUCHSIA                         ) vkGetDeviceProcAddr( device, "vkDestroyBufferCollectionFUCHSIA" );
                vkGetBufferCollectionPropertiesFUCHSIA                   = cast( PFN_vkGetBufferCollectionPropertiesFUCHSIA                   ) vkGetDeviceProcAddr( device, "vkGetBufferCollectionPropertiesFUCHSIA" );
            }

            // VK_OHOS_external_memory : load device based device level function definitions
            else static if( __traits( isSame, extension, OHOS_external_memory )) {
                vkGetNativeBufferPropertiesOHOS                          = cast( PFN_vkGetNativeBufferPropertiesOHOS                          ) vkGetDeviceProcAddr( device, "vkGetNativeBufferPropertiesOHOS" );
                vkGetMemoryNativeBufferOHOS                              = cast( PFN_vkGetMemoryNativeBufferOHOS                              ) vkGetDeviceProcAddr( device, "vkGetMemoryNativeBufferOHOS" );
            }

            // VK_QNX_external_memory_screen_buffer : load device based device level function definitions
            else static if( __traits( isSame, extension, QNX_external_memory_screen_buffer )) {
                vkGetScreenBufferPropertiesQNX                           = cast( PFN_vkGetScreenBufferPropertiesQNX                           ) vkGetDeviceProcAddr( device, "vkGetScreenBufferPropertiesQNX" );
            }

            // VK_EXT_external_memory_metal : load device based device level function definitions
            else static if( __traits( isSame, extension, EXT_external_memory_metal )) {
                vkGetMemoryMetalHandleEXT                                = cast( PFN_vkGetMemoryMetalHandleEXT                                ) vkGetDeviceProcAddr( device, "vkGetMemoryMetalHandleEXT" );
                vkGetMemoryMetalHandlePropertiesEXT                      = cast( PFN_vkGetMemoryMetalHandlePropertiesEXT                      ) vkGetDeviceProcAddr( device, "vkGetMemoryMetalHandlePropertiesEXT" );
            }
        }
    }

    // compose extended dispatch device out of unextended original dispatch device with
    // extended, device based loadDeviceLevelFunctionsExt member function,
    // device and command buffer based function pointer decelerations
    struct DispatchDeviceExt {

        // use unextended dispatch device from module erupted.functions as member and alias this
        erupted.dispatch_device.DispatchDevice commonDispatchDevice;
        alias commonDispatchDevice this;

        // Constructor forwards parameter 'device' to 'loadDeviceLevelFunctionsExt'
        this( VkDevice device ) {
            loadDeviceLevelFunctionsExt( device );
        }

        // backwards compatibility alias
        alias loadDeviceLevelFunctions = loadDeviceLevelFunctionsExt;

        // compose device based loadDeviceLevelFunctionsExt member function out of unextended
        // loadDeviceLevelFunctions and additional member function pointers from extensions
        void loadDeviceLevelFunctionsExt( VkDevice device ) {

            // first load all non platform related member function pointers of wrapped commonDispatchDevice
            commonDispatchDevice.loadDeviceLevelFunctions( device );

            // 5. loop through alias sequence and mixin corresponding
            // device level member function pointer definitions of this wrapping DispatchDevice
            static foreach( extension; noDuplicateExtensions ) {

                // VK_KHR_external_memory_win32 : load dispatch device member function definitions
                static if( __traits( isSame, extension, KHR_external_memory_win32 )) {
                    vkGetMemoryWin32HandleKHR                                = cast( PFN_vkGetMemoryWin32HandleKHR                                ) vkGetDeviceProcAddr( device, "vkGetMemoryWin32HandleKHR" );
                    vkGetMemoryWin32HandlePropertiesKHR                      = cast( PFN_vkGetMemoryWin32HandlePropertiesKHR                      ) vkGetDeviceProcAddr( device, "vkGetMemoryWin32HandlePropertiesKHR" );
                }

                // VK_KHR_external_semaphore_win32 : load dispatch device member function definitions
                else static if( __traits( isSame, extension, KHR_external_semaphore_win32 )) {
                    vkImportSemaphoreWin32HandleKHR                          = cast( PFN_vkImportSemaphoreWin32HandleKHR                          ) vkGetDeviceProcAddr( device, "vkImportSemaphoreWin32HandleKHR" );
                    vkGetSemaphoreWin32HandleKHR                             = cast( PFN_vkGetSemaphoreWin32HandleKHR                             ) vkGetDeviceProcAddr( device, "vkGetSemaphoreWin32HandleKHR" );
                }

                // VK_KHR_external_fence_win32 : load dispatch device member function definitions
                else static if( __traits( isSame, extension, KHR_external_fence_win32 )) {
                    vkImportFenceWin32HandleKHR                              = cast( PFN_vkImportFenceWin32HandleKHR                              ) vkGetDeviceProcAddr( device, "vkImportFenceWin32HandleKHR" );
                    vkGetFenceWin32HandleKHR                                 = cast( PFN_vkGetFenceWin32HandleKHR                                 ) vkGetDeviceProcAddr( device, "vkGetFenceWin32HandleKHR" );
                }

                // VK_NV_external_memory_win32 : load dispatch device member function definitions
                else static if( __traits( isSame, extension, NV_external_memory_win32 )) {
                    vkGetMemoryWin32HandleNV                                 = cast( PFN_vkGetMemoryWin32HandleNV                                 ) vkGetDeviceProcAddr( device, "vkGetMemoryWin32HandleNV" );
                }

                // VK_ANDROID_external_memory_android_hardware_buffer : load dispatch device member function definitions
                else static if( __traits( isSame, extension, ANDROID_external_memory_android_hardware_buffer )) {
                    vkGetAndroidHardwareBufferPropertiesANDROID              = cast( PFN_vkGetAndroidHardwareBufferPropertiesANDROID              ) vkGetDeviceProcAddr( device, "vkGetAndroidHardwareBufferPropertiesANDROID" );
                    vkGetMemoryAndroidHardwareBufferANDROID                  = cast( PFN_vkGetMemoryAndroidHardwareBufferANDROID                  ) vkGetDeviceProcAddr( device, "vkGetMemoryAndroidHardwareBufferANDROID" );
                }

                // VK_AMDX_shader_enqueue : load dispatch device member function definitions
                else static if( __traits( isSame, extension, AMDX_shader_enqueue )) {
                    vkCreateExecutionGraphPipelinesAMDX                      = cast( PFN_vkCreateExecutionGraphPipelinesAMDX                      ) vkGetDeviceProcAddr( device, "vkCreateExecutionGraphPipelinesAMDX" );
                    vkGetExecutionGraphPipelineScratchSizeAMDX               = cast( PFN_vkGetExecutionGraphPipelineScratchSizeAMDX               ) vkGetDeviceProcAddr( device, "vkGetExecutionGraphPipelineScratchSizeAMDX" );
                    vkGetExecutionGraphPipelineNodeIndexAMDX                 = cast( PFN_vkGetExecutionGraphPipelineNodeIndexAMDX                 ) vkGetDeviceProcAddr( device, "vkGetExecutionGraphPipelineNodeIndexAMDX" );
                    vkCmdInitializeGraphScratchMemoryAMDX                    = cast( PFN_vkCmdInitializeGraphScratchMemoryAMDX                    ) vkGetDeviceProcAddr( device, "vkCmdInitializeGraphScratchMemoryAMDX" );
                    vkCmdDispatchGraphAMDX                                   = cast( PFN_vkCmdDispatchGraphAMDX                                   ) vkGetDeviceProcAddr( device, "vkCmdDispatchGraphAMDX" );
                    vkCmdDispatchGraphIndirectAMDX                           = cast( PFN_vkCmdDispatchGraphIndirectAMDX                           ) vkGetDeviceProcAddr( device, "vkCmdDispatchGraphIndirectAMDX" );
                    vkCmdDispatchGraphIndirectCountAMDX                      = cast( PFN_vkCmdDispatchGraphIndirectCountAMDX                      ) vkGetDeviceProcAddr( device, "vkCmdDispatchGraphIndirectCountAMDX" );
                }

                // VK_EXT_full_screen_exclusive : load dispatch device member function definitions
                else static if( __traits( isSame, extension, EXT_full_screen_exclusive )) {
                    vkAcquireFullScreenExclusiveModeEXT                      = cast( PFN_vkAcquireFullScreenExclusiveModeEXT                      ) vkGetDeviceProcAddr( device, "vkAcquireFullScreenExclusiveModeEXT" );
                    vkReleaseFullScreenExclusiveModeEXT                      = cast( PFN_vkReleaseFullScreenExclusiveModeEXT                      ) vkGetDeviceProcAddr( device, "vkReleaseFullScreenExclusiveModeEXT" );
                    vkGetDeviceGroupSurfacePresentModes2EXT                  = cast( PFN_vkGetDeviceGroupSurfacePresentModes2EXT                  ) vkGetDeviceProcAddr( device, "vkGetDeviceGroupSurfacePresentModes2EXT" );
                }

                // VK_NV_cuda_kernel_launch : load dispatch device member function definitions
                else static if( __traits( isSame, extension, NV_cuda_kernel_launch )) {
                    vkCreateCudaModuleNV                                     = cast( PFN_vkCreateCudaModuleNV                                     ) vkGetDeviceProcAddr( device, "vkCreateCudaModuleNV" );
                    vkGetCudaModuleCacheNV                                   = cast( PFN_vkGetCudaModuleCacheNV                                   ) vkGetDeviceProcAddr( device, "vkGetCudaModuleCacheNV" );
                    vkCreateCudaFunctionNV                                   = cast( PFN_vkCreateCudaFunctionNV                                   ) vkGetDeviceProcAddr( device, "vkCreateCudaFunctionNV" );
                    vkDestroyCudaModuleNV                                    = cast( PFN_vkDestroyCudaModuleNV                                    ) vkGetDeviceProcAddr( device, "vkDestroyCudaModuleNV" );
                    vkDestroyCudaFunctionNV                                  = cast( PFN_vkDestroyCudaFunctionNV                                  ) vkGetDeviceProcAddr( device, "vkDestroyCudaFunctionNV" );
                    vkCmdCudaLaunchKernelNV                                  = cast( PFN_vkCmdCudaLaunchKernelNV                                  ) vkGetDeviceProcAddr( device, "vkCmdCudaLaunchKernelNV" );
                }

                // VK_EXT_metal_objects : load dispatch device member function definitions
                else static if( __traits( isSame, extension, EXT_metal_objects )) {
                    vkExportMetalObjectsEXT                                  = cast( PFN_vkExportMetalObjectsEXT                                  ) vkGetDeviceProcAddr( device, "vkExportMetalObjectsEXT" );
                }

                // VK_FUCHSIA_external_memory : load dispatch device member function definitions
                else static if( __traits( isSame, extension, FUCHSIA_external_memory )) {
                    vkGetMemoryZirconHandleFUCHSIA                           = cast( PFN_vkGetMemoryZirconHandleFUCHSIA                           ) vkGetDeviceProcAddr( device, "vkGetMemoryZirconHandleFUCHSIA" );
                    vkGetMemoryZirconHandlePropertiesFUCHSIA                 = cast( PFN_vkGetMemoryZirconHandlePropertiesFUCHSIA                 ) vkGetDeviceProcAddr( device, "vkGetMemoryZirconHandlePropertiesFUCHSIA" );
                }

                // VK_FUCHSIA_external_semaphore : load dispatch device member function definitions
                else static if( __traits( isSame, extension, FUCHSIA_external_semaphore )) {
                    vkImportSemaphoreZirconHandleFUCHSIA                     = cast( PFN_vkImportSemaphoreZirconHandleFUCHSIA                     ) vkGetDeviceProcAddr( device, "vkImportSemaphoreZirconHandleFUCHSIA" );
                    vkGetSemaphoreZirconHandleFUCHSIA                        = cast( PFN_vkGetSemaphoreZirconHandleFUCHSIA                        ) vkGetDeviceProcAddr( device, "vkGetSemaphoreZirconHandleFUCHSIA" );
                }

                // VK_FUCHSIA_buffer_collection : load dispatch device member function definitions
                else static if( __traits( isSame, extension, FUCHSIA_buffer_collection )) {
                    vkCreateBufferCollectionFUCHSIA                          = cast( PFN_vkCreateBufferCollectionFUCHSIA                          ) vkGetDeviceProcAddr( device, "vkCreateBufferCollectionFUCHSIA" );
                    vkSetBufferCollectionImageConstraintsFUCHSIA             = cast( PFN_vkSetBufferCollectionImageConstraintsFUCHSIA             ) vkGetDeviceProcAddr( device, "vkSetBufferCollectionImageConstraintsFUCHSIA" );
                    vkSetBufferCollectionBufferConstraintsFUCHSIA            = cast( PFN_vkSetBufferCollectionBufferConstraintsFUCHSIA            ) vkGetDeviceProcAddr( device, "vkSetBufferCollectionBufferConstraintsFUCHSIA" );
                    vkDestroyBufferCollectionFUCHSIA                         = cast( PFN_vkDestroyBufferCollectionFUCHSIA                         ) vkGetDeviceProcAddr( device, "vkDestroyBufferCollectionFUCHSIA" );
                    vkGetBufferCollectionPropertiesFUCHSIA                   = cast( PFN_vkGetBufferCollectionPropertiesFUCHSIA                   ) vkGetDeviceProcAddr( device, "vkGetBufferCollectionPropertiesFUCHSIA" );
                }

                // VK_OHOS_external_memory : load dispatch device member function definitions
                else static if( __traits( isSame, extension, OHOS_external_memory )) {
                    vkGetNativeBufferPropertiesOHOS                          = cast( PFN_vkGetNativeBufferPropertiesOHOS                          ) vkGetDeviceProcAddr( device, "vkGetNativeBufferPropertiesOHOS" );
                    vkGetMemoryNativeBufferOHOS                              = cast( PFN_vkGetMemoryNativeBufferOHOS                              ) vkGetDeviceProcAddr( device, "vkGetMemoryNativeBufferOHOS" );
                }

                // VK_QNX_external_memory_screen_buffer : load dispatch device member function definitions
                else static if( __traits( isSame, extension, QNX_external_memory_screen_buffer )) {
                    vkGetScreenBufferPropertiesQNX                           = cast( PFN_vkGetScreenBufferPropertiesQNX                           ) vkGetDeviceProcAddr( device, "vkGetScreenBufferPropertiesQNX" );
                }

                // VK_EXT_external_memory_metal : load dispatch device member function definitions
                else static if( __traits( isSame, extension, EXT_external_memory_metal )) {
                    vkGetMemoryMetalHandleEXT                                = cast( PFN_vkGetMemoryMetalHandleEXT                                ) vkGetDeviceProcAddr( device, "vkGetMemoryMetalHandleEXT" );
                    vkGetMemoryMetalHandlePropertiesEXT                      = cast( PFN_vkGetMemoryMetalHandlePropertiesEXT                      ) vkGetDeviceProcAddr( device, "vkGetMemoryMetalHandlePropertiesEXT" );
                }
            }
        }

        // 6. loop through alias sequence and mixin corresponding convenience member functions
        // omitting device parameter of this wrapping DispatchDevice. Member vkDevice of commonDispatchDevice is used instead
        static foreach( extension; noDuplicateExtensions ) {

            // VK_KHR_external_memory_win32 : dispatch device convenience member functions
            static if( __traits( isSame, extension, KHR_external_memory_win32 )) {
                VkResult  GetMemoryWin32HandleKHR( const( VkMemoryGetWin32HandleInfoKHR )* pGetWin32HandleInfo, HANDLE* pHandle ) { return vkGetMemoryWin32HandleKHR( vkDevice, pGetWin32HandleInfo, pHandle ); }
                VkResult  GetMemoryWin32HandlePropertiesKHR( VkExternalMemoryHandleTypeFlagBits handleType, HANDLE handle, VkMemoryWin32HandlePropertiesKHR* pMemoryWin32HandleProperties ) { return vkGetMemoryWin32HandlePropertiesKHR( vkDevice, handleType, handle, pMemoryWin32HandleProperties ); }
            }

            // VK_KHR_external_semaphore_win32 : dispatch device convenience member functions
            else static if( __traits( isSame, extension, KHR_external_semaphore_win32 )) {
                VkResult  ImportSemaphoreWin32HandleKHR( const( VkImportSemaphoreWin32HandleInfoKHR )* pImportSemaphoreWin32HandleInfo ) { return vkImportSemaphoreWin32HandleKHR( vkDevice, pImportSemaphoreWin32HandleInfo ); }
                VkResult  GetSemaphoreWin32HandleKHR( const( VkSemaphoreGetWin32HandleInfoKHR )* pGetWin32HandleInfo, HANDLE* pHandle ) { return vkGetSemaphoreWin32HandleKHR( vkDevice, pGetWin32HandleInfo, pHandle ); }
            }

            // VK_KHR_external_fence_win32 : dispatch device convenience member functions
            else static if( __traits( isSame, extension, KHR_external_fence_win32 )) {
                VkResult  ImportFenceWin32HandleKHR( const( VkImportFenceWin32HandleInfoKHR )* pImportFenceWin32HandleInfo ) { return vkImportFenceWin32HandleKHR( vkDevice, pImportFenceWin32HandleInfo ); }
                VkResult  GetFenceWin32HandleKHR( const( VkFenceGetWin32HandleInfoKHR )* pGetWin32HandleInfo, HANDLE* pHandle ) { return vkGetFenceWin32HandleKHR( vkDevice, pGetWin32HandleInfo, pHandle ); }
            }

            // VK_NV_external_memory_win32 : dispatch device convenience member functions
            else static if( __traits( isSame, extension, NV_external_memory_win32 )) {
                VkResult  GetMemoryWin32HandleNV( VkDeviceMemory memory, VkExternalMemoryHandleTypeFlagsNV handleType, HANDLE* pHandle ) { return vkGetMemoryWin32HandleNV( vkDevice, memory, handleType, pHandle ); }
            }

            // VK_ANDROID_external_memory_android_hardware_buffer : dispatch device convenience member functions
            else static if( __traits( isSame, extension, ANDROID_external_memory_android_hardware_buffer )) {
                VkResult  GetAndroidHardwareBufferPropertiesANDROID( const( AHardwareBuffer )* buffer, VkAndroidHardwareBufferPropertiesANDROID* pProperties ) { return vkGetAndroidHardwareBufferPropertiesANDROID( vkDevice, buffer, pProperties ); }
                VkResult  GetMemoryAndroidHardwareBufferANDROID( const( VkMemoryGetAndroidHardwareBufferInfoANDROID )* pInfo, AHardwareBuffer pBuffer ) { return vkGetMemoryAndroidHardwareBufferANDROID( vkDevice, pInfo, pBuffer ); }
            }

            // VK_AMDX_shader_enqueue : dispatch device convenience member functions
            else static if( __traits( isSame, extension, AMDX_shader_enqueue )) {
                VkResult  CreateExecutionGraphPipelinesAMDX( VkPipelineCache pipelineCache, uint32_t createInfoCount, const( VkExecutionGraphPipelineCreateInfoAMDX )* pCreateInfos, VkPipeline* pPipelines ) { return vkCreateExecutionGraphPipelinesAMDX( vkDevice, pipelineCache, createInfoCount, pCreateInfos, pAllocator, pPipelines ); }
                VkResult  GetExecutionGraphPipelineScratchSizeAMDX( VkPipeline executionGraph, VkExecutionGraphPipelineScratchSizeAMDX* pSizeInfo ) { return vkGetExecutionGraphPipelineScratchSizeAMDX( vkDevice, executionGraph, pSizeInfo ); }
                VkResult  GetExecutionGraphPipelineNodeIndexAMDX( VkPipeline executionGraph, const( VkPipelineShaderStageNodeCreateInfoAMDX )* pNodeInfo, uint32_t* pNodeIndex ) { return vkGetExecutionGraphPipelineNodeIndexAMDX( vkDevice, executionGraph, pNodeInfo, pNodeIndex ); }
                void      CmdInitializeGraphScratchMemoryAMDX( VkPipeline executionGraph, VkDeviceAddress scratch, VkDeviceSize scratchSize ) { vkCmdInitializeGraphScratchMemoryAMDX( commandBuffer, executionGraph, scratch, scratchSize ); }
                void      CmdDispatchGraphAMDX( VkDeviceAddress scratch, VkDeviceSize scratchSize, const( VkDispatchGraphCountInfoAMDX )* pCountInfo ) { vkCmdDispatchGraphAMDX( commandBuffer, scratch, scratchSize, pCountInfo ); }
                void      CmdDispatchGraphIndirectAMDX( VkDeviceAddress scratch, VkDeviceSize scratchSize, const( VkDispatchGraphCountInfoAMDX )* pCountInfo ) { vkCmdDispatchGraphIndirectAMDX( commandBuffer, scratch, scratchSize, pCountInfo ); }
                void      CmdDispatchGraphIndirectCountAMDX( VkDeviceAddress scratch, VkDeviceSize scratchSize, VkDeviceAddress countInfo ) { vkCmdDispatchGraphIndirectCountAMDX( commandBuffer, scratch, scratchSize, countInfo ); }
            }

            // VK_EXT_full_screen_exclusive : dispatch device convenience member functions
            else static if( __traits( isSame, extension, EXT_full_screen_exclusive )) {
                VkResult  AcquireFullScreenExclusiveModeEXT( VkSwapchainKHR swapchain ) { return vkAcquireFullScreenExclusiveModeEXT( vkDevice, swapchain ); }
                VkResult  ReleaseFullScreenExclusiveModeEXT( VkSwapchainKHR swapchain ) { return vkReleaseFullScreenExclusiveModeEXT( vkDevice, swapchain ); }
                VkResult  GetDeviceGroupSurfacePresentModes2EXT( const( VkPhysicalDeviceSurfaceInfo2KHR )* pSurfaceInfo, VkDeviceGroupPresentModeFlagsKHR* pModes ) { return vkGetDeviceGroupSurfacePresentModes2EXT( vkDevice, pSurfaceInfo, pModes ); }
            }

            // VK_NV_cuda_kernel_launch : dispatch device convenience member functions
            else static if( __traits( isSame, extension, NV_cuda_kernel_launch )) {
                VkResult  CreateCudaModuleNV( const( VkCudaModuleCreateInfoNV )* pCreateInfo, VkCudaModuleNV* pModule ) { return vkCreateCudaModuleNV( vkDevice, pCreateInfo, pAllocator, pModule ); }
                VkResult  GetCudaModuleCacheNV( VkCudaModuleNV Module, size_t* pCacheSize, void* pCacheData ) { return vkGetCudaModuleCacheNV( vkDevice, Module, pCacheSize, pCacheData ); }
                VkResult  CreateCudaFunctionNV( const( VkCudaFunctionCreateInfoNV )* pCreateInfo, VkCudaFunctionNV* pFunction ) { return vkCreateCudaFunctionNV( vkDevice, pCreateInfo, pAllocator, pFunction ); }
                void      DestroyCudaModuleNV( VkCudaModuleNV Module ) { vkDestroyCudaModuleNV( vkDevice, Module, pAllocator ); }
                void      DestroyCudaFunctionNV( VkCudaFunctionNV Function ) { vkDestroyCudaFunctionNV( vkDevice, Function, pAllocator ); }
                void      CmdCudaLaunchKernelNV( const( VkCudaLaunchInfoNV )* pLaunchInfo ) { vkCmdCudaLaunchKernelNV( commandBuffer, pLaunchInfo ); }
            }

            // VK_EXT_metal_objects : dispatch device convenience member functions
            else static if( __traits( isSame, extension, EXT_metal_objects )) {
                void      ExportMetalObjectsEXT( VkExportMetalObjectsInfoEXT* pMetalObjectsInfo ) { vkExportMetalObjectsEXT( vkDevice, pMetalObjectsInfo ); }
            }

            // VK_FUCHSIA_external_memory : dispatch device convenience member functions
            else static if( __traits( isSame, extension, FUCHSIA_external_memory )) {
                VkResult  GetMemoryZirconHandleFUCHSIA( const( VkMemoryGetZirconHandleInfoFUCHSIA )* pGetZirconHandleInfo, zx_handle_t* pZirconHandle ) { return vkGetMemoryZirconHandleFUCHSIA( vkDevice, pGetZirconHandleInfo, pZirconHandle ); }
                VkResult  GetMemoryZirconHandlePropertiesFUCHSIA( VkExternalMemoryHandleTypeFlagBits handleType, zx_handle_t zirconHandle, VkMemoryZirconHandlePropertiesFUCHSIA* pMemoryZirconHandleProperties ) { return vkGetMemoryZirconHandlePropertiesFUCHSIA( vkDevice, handleType, zirconHandle, pMemoryZirconHandleProperties ); }
            }

            // VK_FUCHSIA_external_semaphore : dispatch device convenience member functions
            else static if( __traits( isSame, extension, FUCHSIA_external_semaphore )) {
                VkResult  ImportSemaphoreZirconHandleFUCHSIA( const( VkImportSemaphoreZirconHandleInfoFUCHSIA )* pImportSemaphoreZirconHandleInfo ) { return vkImportSemaphoreZirconHandleFUCHSIA( vkDevice, pImportSemaphoreZirconHandleInfo ); }
                VkResult  GetSemaphoreZirconHandleFUCHSIA( const( VkSemaphoreGetZirconHandleInfoFUCHSIA )* pGetZirconHandleInfo, zx_handle_t* pZirconHandle ) { return vkGetSemaphoreZirconHandleFUCHSIA( vkDevice, pGetZirconHandleInfo, pZirconHandle ); }
            }

            // VK_FUCHSIA_buffer_collection : dispatch device convenience member functions
            else static if( __traits( isSame, extension, FUCHSIA_buffer_collection )) {
                VkResult  CreateBufferCollectionFUCHSIA( const( VkBufferCollectionCreateInfoFUCHSIA )* pCreateInfo, VkBufferCollectionFUCHSIA* pCollection ) { return vkCreateBufferCollectionFUCHSIA( vkDevice, pCreateInfo, pAllocator, pCollection ); }
                VkResult  SetBufferCollectionImageConstraintsFUCHSIA( VkBufferCollectionFUCHSIA collection, const( VkImageConstraintsInfoFUCHSIA )* pImageConstraintsInfo ) { return vkSetBufferCollectionImageConstraintsFUCHSIA( vkDevice, collection, pImageConstraintsInfo ); }
                VkResult  SetBufferCollectionBufferConstraintsFUCHSIA( VkBufferCollectionFUCHSIA collection, const( VkBufferConstraintsInfoFUCHSIA )* pBufferConstraintsInfo ) { return vkSetBufferCollectionBufferConstraintsFUCHSIA( vkDevice, collection, pBufferConstraintsInfo ); }
                void      DestroyBufferCollectionFUCHSIA( VkBufferCollectionFUCHSIA collection ) { vkDestroyBufferCollectionFUCHSIA( vkDevice, collection, pAllocator ); }
                VkResult  GetBufferCollectionPropertiesFUCHSIA( VkBufferCollectionFUCHSIA collection, VkBufferCollectionPropertiesFUCHSIA* pProperties ) { return vkGetBufferCollectionPropertiesFUCHSIA( vkDevice, collection, pProperties ); }
            }

            // VK_OHOS_external_memory : dispatch device convenience member functions
            else static if( __traits( isSame, extension, OHOS_external_memory )) {
                VkResult  GetNativeBufferPropertiesOHOS( const( OH_NativeBuffer )* buffer, VkNativeBufferPropertiesOHOS* pProperties ) { return vkGetNativeBufferPropertiesOHOS( vkDevice, buffer, pProperties ); }
                VkResult  GetMemoryNativeBufferOHOS( const( VkMemoryGetNativeBufferInfoOHOS )* pInfo, OH_NativeBuffer pBuffer ) { return vkGetMemoryNativeBufferOHOS( vkDevice, pInfo, pBuffer ); }
            }

            // VK_QNX_external_memory_screen_buffer : dispatch device convenience member functions
            else static if( __traits( isSame, extension, QNX_external_memory_screen_buffer )) {
                VkResult  GetScreenBufferPropertiesQNX( const( _screen_buffer )* buffer, VkScreenBufferPropertiesQNX* pProperties ) { return vkGetScreenBufferPropertiesQNX( vkDevice, buffer, pProperties ); }
            }

            // VK_EXT_external_memory_metal : dispatch device convenience member functions
            else static if( __traits( isSame, extension, EXT_external_memory_metal )) {
                VkResult  GetMemoryMetalHandleEXT( const( VkMemoryGetMetalHandleInfoEXT )* pGetMetalHandleInfo, void** pHandle ) { return vkGetMemoryMetalHandleEXT( vkDevice, pGetMetalHandleInfo, pHandle ); }
                VkResult  GetMemoryMetalHandlePropertiesEXT( VkExternalMemoryHandleTypeFlagBits handleType, const( void )* pHandle, VkMemoryMetalHandlePropertiesEXT* pMemoryMetalHandleProperties ) { return vkGetMemoryMetalHandlePropertiesEXT( vkDevice, handleType, pHandle, pMemoryMetalHandleProperties ); }
            }
        }

        // 7. loop last time through alias sequence and mixin corresponding function pointer declarations
        static foreach( extension; noDuplicateExtensions ) {

            // VK_KHR_xlib_surface : dispatch device member function pointer decelerations
            static if( __traits( isSame, extension, KHR_xlib_surface )) {
                PFN_vkCreateXlibSurfaceKHR                                               vkCreateXlibSurfaceKHR;
                PFN_vkGetPhysicalDeviceXlibPresentationSupportKHR                        vkGetPhysicalDeviceXlibPresentationSupportKHR;
            }

            // VK_KHR_xcb_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, KHR_xcb_surface )) {
                PFN_vkCreateXcbSurfaceKHR                                                vkCreateXcbSurfaceKHR;
                PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR                         vkGetPhysicalDeviceXcbPresentationSupportKHR;
            }

            // VK_KHR_wayland_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, KHR_wayland_surface )) {
                PFN_vkCreateWaylandSurfaceKHR                                            vkCreateWaylandSurfaceKHR;
                PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR                     vkGetPhysicalDeviceWaylandPresentationSupportKHR;
            }

            // VK_KHR_android_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, KHR_android_surface )) {
                PFN_vkCreateAndroidSurfaceKHR                                            vkCreateAndroidSurfaceKHR;
            }

            // VK_KHR_win32_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, KHR_win32_surface )) {
                PFN_vkCreateWin32SurfaceKHR                                              vkCreateWin32SurfaceKHR;
                PFN_vkGetPhysicalDeviceWin32PresentationSupportKHR                       vkGetPhysicalDeviceWin32PresentationSupportKHR;
            }

            // VK_KHR_external_memory_win32 : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, KHR_external_memory_win32 )) {
                PFN_vkGetMemoryWin32HandleKHR                                            vkGetMemoryWin32HandleKHR;
                PFN_vkGetMemoryWin32HandlePropertiesKHR                                  vkGetMemoryWin32HandlePropertiesKHR;
            }

            // VK_KHR_external_semaphore_win32 : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, KHR_external_semaphore_win32 )) {
                PFN_vkImportSemaphoreWin32HandleKHR                                      vkImportSemaphoreWin32HandleKHR;
                PFN_vkGetSemaphoreWin32HandleKHR                                         vkGetSemaphoreWin32HandleKHR;
            }

            // VK_KHR_external_fence_win32 : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, KHR_external_fence_win32 )) {
                PFN_vkImportFenceWin32HandleKHR                                          vkImportFenceWin32HandleKHR;
                PFN_vkGetFenceWin32HandleKHR                                             vkGetFenceWin32HandleKHR;
            }

            // VK_GGP_stream_descriptor_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, GGP_stream_descriptor_surface )) {
                PFN_vkCreateStreamDescriptorSurfaceGGP                                   vkCreateStreamDescriptorSurfaceGGP;
            }

            // VK_NV_external_memory_win32 : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, NV_external_memory_win32 )) {
                PFN_vkGetMemoryWin32HandleNV                                             vkGetMemoryWin32HandleNV;
            }

            // VK_NN_vi_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, NN_vi_surface )) {
                PFN_vkCreateViSurfaceNN                                                  vkCreateViSurfaceNN;
            }

            // VK_EXT_acquire_xlib_display : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, EXT_acquire_xlib_display )) {
                PFN_vkAcquireXlibDisplayEXT                                              vkAcquireXlibDisplayEXT;
                PFN_vkGetRandROutputDisplayEXT                                           vkGetRandROutputDisplayEXT;
            }

            // VK_MVK_ios_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, MVK_ios_surface )) {
                PFN_vkCreateIOSSurfaceMVK                                                vkCreateIOSSurfaceMVK;
            }

            // VK_MVK_macos_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, MVK_macos_surface )) {
                PFN_vkCreateMacOSSurfaceMVK                                              vkCreateMacOSSurfaceMVK;
            }

            // VK_ANDROID_external_memory_android_hardware_buffer : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, ANDROID_external_memory_android_hardware_buffer )) {
                PFN_vkGetAndroidHardwareBufferPropertiesANDROID                          vkGetAndroidHardwareBufferPropertiesANDROID;
                PFN_vkGetMemoryAndroidHardwareBufferANDROID                              vkGetMemoryAndroidHardwareBufferANDROID;
            }

            // VK_AMDX_shader_enqueue : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, AMDX_shader_enqueue )) {
                PFN_vkCreateExecutionGraphPipelinesAMDX                                  vkCreateExecutionGraphPipelinesAMDX;
                PFN_vkGetExecutionGraphPipelineScratchSizeAMDX                           vkGetExecutionGraphPipelineScratchSizeAMDX;
                PFN_vkGetExecutionGraphPipelineNodeIndexAMDX                             vkGetExecutionGraphPipelineNodeIndexAMDX;
                PFN_vkCmdInitializeGraphScratchMemoryAMDX                                vkCmdInitializeGraphScratchMemoryAMDX;
                PFN_vkCmdDispatchGraphAMDX                                               vkCmdDispatchGraphAMDX;
                PFN_vkCmdDispatchGraphIndirectAMDX                                       vkCmdDispatchGraphIndirectAMDX;
                PFN_vkCmdDispatchGraphIndirectCountAMDX                                  vkCmdDispatchGraphIndirectCountAMDX;
            }

            // VK_FUCHSIA_imagepipe_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, FUCHSIA_imagepipe_surface )) {
                PFN_vkCreateImagePipeSurfaceFUCHSIA                                      vkCreateImagePipeSurfaceFUCHSIA;
            }

            // VK_EXT_metal_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, EXT_metal_surface )) {
                PFN_vkCreateMetalSurfaceEXT                                              vkCreateMetalSurfaceEXT;
            }

            // VK_EXT_full_screen_exclusive : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, EXT_full_screen_exclusive )) {
                PFN_vkGetPhysicalDeviceSurfacePresentModes2EXT                           vkGetPhysicalDeviceSurfacePresentModes2EXT;
                PFN_vkAcquireFullScreenExclusiveModeEXT                                  vkAcquireFullScreenExclusiveModeEXT;
                PFN_vkReleaseFullScreenExclusiveModeEXT                                  vkReleaseFullScreenExclusiveModeEXT;
                PFN_vkGetDeviceGroupSurfacePresentModes2EXT                              vkGetDeviceGroupSurfacePresentModes2EXT;
            }

            // VK_NV_cuda_kernel_launch : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, NV_cuda_kernel_launch )) {
                PFN_vkCreateCudaModuleNV                                                 vkCreateCudaModuleNV;
                PFN_vkGetCudaModuleCacheNV                                               vkGetCudaModuleCacheNV;
                PFN_vkCreateCudaFunctionNV                                               vkCreateCudaFunctionNV;
                PFN_vkDestroyCudaModuleNV                                                vkDestroyCudaModuleNV;
                PFN_vkDestroyCudaFunctionNV                                              vkDestroyCudaFunctionNV;
                PFN_vkCmdCudaLaunchKernelNV                                              vkCmdCudaLaunchKernelNV;
            }

            // VK_EXT_metal_objects : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, EXT_metal_objects )) {
                PFN_vkExportMetalObjectsEXT                                              vkExportMetalObjectsEXT;
            }

            // VK_NV_acquire_winrt_display : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, NV_acquire_winrt_display )) {
                PFN_vkAcquireWinrtDisplayNV                                              vkAcquireWinrtDisplayNV;
                PFN_vkGetWinrtDisplayNV                                                  vkGetWinrtDisplayNV;
            }

            // VK_EXT_directfb_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, EXT_directfb_surface )) {
                PFN_vkCreateDirectFBSurfaceEXT                                           vkCreateDirectFBSurfaceEXT;
                PFN_vkGetPhysicalDeviceDirectFBPresentationSupportEXT                    vkGetPhysicalDeviceDirectFBPresentationSupportEXT;
            }

            // VK_FUCHSIA_external_memory : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, FUCHSIA_external_memory )) {
                PFN_vkGetMemoryZirconHandleFUCHSIA                                       vkGetMemoryZirconHandleFUCHSIA;
                PFN_vkGetMemoryZirconHandlePropertiesFUCHSIA                             vkGetMemoryZirconHandlePropertiesFUCHSIA;
            }

            // VK_FUCHSIA_external_semaphore : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, FUCHSIA_external_semaphore )) {
                PFN_vkImportSemaphoreZirconHandleFUCHSIA                                 vkImportSemaphoreZirconHandleFUCHSIA;
                PFN_vkGetSemaphoreZirconHandleFUCHSIA                                    vkGetSemaphoreZirconHandleFUCHSIA;
            }

            // VK_FUCHSIA_buffer_collection : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, FUCHSIA_buffer_collection )) {
                PFN_vkCreateBufferCollectionFUCHSIA                                      vkCreateBufferCollectionFUCHSIA;
                PFN_vkSetBufferCollectionImageConstraintsFUCHSIA                         vkSetBufferCollectionImageConstraintsFUCHSIA;
                PFN_vkSetBufferCollectionBufferConstraintsFUCHSIA                        vkSetBufferCollectionBufferConstraintsFUCHSIA;
                PFN_vkDestroyBufferCollectionFUCHSIA                                     vkDestroyBufferCollectionFUCHSIA;
                PFN_vkGetBufferCollectionPropertiesFUCHSIA                               vkGetBufferCollectionPropertiesFUCHSIA;
            }

            // VK_QNX_screen_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, QNX_screen_surface )) {
                PFN_vkCreateScreenSurfaceQNX                                             vkCreateScreenSurfaceQNX;
                PFN_vkGetPhysicalDeviceScreenPresentationSupportQNX                      vkGetPhysicalDeviceScreenPresentationSupportQNX;
            }

            // VK_OHOS_external_memory : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, OHOS_external_memory )) {
                PFN_vkGetNativeBufferPropertiesOHOS                                      vkGetNativeBufferPropertiesOHOS;
                PFN_vkGetMemoryNativeBufferOHOS                                          vkGetMemoryNativeBufferOHOS;
            }

            // VK_QNX_external_memory_screen_buffer : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, QNX_external_memory_screen_buffer )) {
                PFN_vkGetScreenBufferPropertiesQNX                                       vkGetScreenBufferPropertiesQNX;
            }

            // VK_OHOS_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, OHOS_surface )) {
                PFN_vkCreateSurfaceOHOS                                                  vkCreateSurfaceOHOS;
            }

            // VK_EXT_external_memory_metal : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, EXT_external_memory_metal )) {
                PFN_vkGetMemoryMetalHandleEXT                                            vkGetMemoryMetalHandleEXT;
                PFN_vkGetMemoryMetalHandlePropertiesEXT                                  vkGetMemoryMetalHandlePropertiesEXT;
            }

            // VK_SEC_ubm_surface : dispatch device member function pointer decelerations
            else static if( __traits( isSame, extension, SEC_ubm_surface )) {
                PFN_vkCreateUbmSurfaceSEC                                                vkCreateUbmSurfaceSEC;
                PFN_vkGetPhysicalDeviceUbmPresentationSupportSEC                         vkGetPhysicalDeviceUbmPresentationSupportSEC;
            }
        }
    }
}
