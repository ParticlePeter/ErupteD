/**
 * Dlang vulkan function pointer prototypes, declarations and loader from vkGetInstanceProcAddr
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module erupted.functions;

public import erupted.types;

nothrow @nogc:


/// function type aliases
extern( System ) {

    // VK_BASE_VERSION_1_0
    alias PFN_vkCreateInstance                                                     = VkResult  function( const( VkInstanceCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkInstance* pInstance );
    alias PFN_vkDestroyInstance                                                    = void      function( VkInstance instance, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkEnumeratePhysicalDevices                                           = VkResult  function( VkInstance instance, uint32_t* pPhysicalDeviceCount, VkPhysicalDevice* pPhysicalDevices );
    alias PFN_vkGetPhysicalDeviceFeatures                                          = void      function( VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures* pFeatures );
    alias PFN_vkGetPhysicalDeviceFormatProperties                                  = void      function( VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties* pFormatProperties );
    alias PFN_vkGetPhysicalDeviceImageFormatProperties                             = VkResult  function( VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkImageFormatProperties* pImageFormatProperties );
    alias PFN_vkGetPhysicalDeviceProperties                                        = void      function( VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties* pProperties );
    alias PFN_vkGetPhysicalDeviceQueueFamilyProperties                             = void      function( VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties* pQueueFamilyProperties );
    alias PFN_vkGetPhysicalDeviceMemoryProperties                                  = void      function( VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties* pMemoryProperties );
    alias PFN_vkGetInstanceProcAddr                                                = PFN_vkVoidFunction  function( VkInstance instance, const( char )* pName );
    alias PFN_vkGetDeviceProcAddr                                                  = PFN_vkVoidFunction  function( VkDevice device, const( char )* pName );
    alias PFN_vkCreateDevice                                                       = VkResult  function( VkPhysicalDevice physicalDevice, const( VkDeviceCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkDevice* pDevice );
    alias PFN_vkDestroyDevice                                                      = void      function( VkDevice device, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkEnumerateInstanceExtensionProperties                               = VkResult  function( const( char )* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties );
    alias PFN_vkEnumerateDeviceExtensionProperties                                 = VkResult  function( VkPhysicalDevice physicalDevice, const( char )* pLayerName, uint32_t* pPropertyCount, VkExtensionProperties* pProperties );
    alias PFN_vkEnumerateInstanceLayerProperties                                   = VkResult  function( uint32_t* pPropertyCount, VkLayerProperties* pProperties );
    alias PFN_vkEnumerateDeviceLayerProperties                                     = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkLayerProperties* pProperties );
    alias PFN_vkGetDeviceQueue                                                     = void      function( VkDevice device, uint32_t queueFamilyIndex, uint32_t queueIndex, VkQueue* pQueue );
    alias PFN_vkQueueSubmit                                                        = VkResult  function( VkQueue queue, uint32_t submitCount, const( VkSubmitInfo )* pSubmits, VkFence fence );
    alias PFN_vkQueueWaitIdle                                                      = VkResult  function( VkQueue queue );
    alias PFN_vkDeviceWaitIdle                                                     = VkResult  function( VkDevice device );
    alias PFN_vkAllocateMemory                                                     = VkResult  function( VkDevice device, const( VkMemoryAllocateInfo )* pAllocateInfo, const( VkAllocationCallbacks )* pAllocator, VkDeviceMemory* pMemory );
    alias PFN_vkFreeMemory                                                         = void      function( VkDevice device, VkDeviceMemory memory, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkMapMemory                                                          = VkResult  function( VkDevice device, VkDeviceMemory memory, VkDeviceSize offset, VkDeviceSize size, VkMemoryMapFlags flags, void** ppData );
    alias PFN_vkUnmapMemory                                                        = void      function( VkDevice device, VkDeviceMemory memory );
    alias PFN_vkFlushMappedMemoryRanges                                            = VkResult  function( VkDevice device, uint32_t memoryRangeCount, const( VkMappedMemoryRange )* pMemoryRanges );
    alias PFN_vkInvalidateMappedMemoryRanges                                       = VkResult  function( VkDevice device, uint32_t memoryRangeCount, const( VkMappedMemoryRange )* pMemoryRanges );
    alias PFN_vkGetDeviceMemoryCommitment                                          = void      function( VkDevice device, VkDeviceMemory memory, VkDeviceSize* pCommittedMemoryInBytes );
    alias PFN_vkBindBufferMemory                                                   = VkResult  function( VkDevice device, VkBuffer buffer, VkDeviceMemory memory, VkDeviceSize memoryOffset );
    alias PFN_vkBindImageMemory                                                    = VkResult  function( VkDevice device, VkImage image, VkDeviceMemory memory, VkDeviceSize memoryOffset );
    alias PFN_vkGetBufferMemoryRequirements                                        = void      function( VkDevice device, VkBuffer buffer, VkMemoryRequirements* pMemoryRequirements );
    alias PFN_vkGetImageMemoryRequirements                                         = void      function( VkDevice device, VkImage image, VkMemoryRequirements* pMemoryRequirements );
    alias PFN_vkGetImageSparseMemoryRequirements                                   = void      function( VkDevice device, VkImage image, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements* pSparseMemoryRequirements );
    alias PFN_vkGetPhysicalDeviceSparseImageFormatProperties                       = void      function( VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkSampleCountFlagBits samples, VkImageUsageFlags usage, VkImageTiling tiling, uint32_t* pPropertyCount, VkSparseImageFormatProperties* pProperties );
    alias PFN_vkQueueBindSparse                                                    = VkResult  function( VkQueue queue, uint32_t bindInfoCount, const( VkBindSparseInfo )* pBindInfo, VkFence fence );
    alias PFN_vkCreateFence                                                        = VkResult  function( VkDevice device, const( VkFenceCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkFence* pFence );
    alias PFN_vkDestroyFence                                                       = void      function( VkDevice device, VkFence fence, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkResetFences                                                        = VkResult  function( VkDevice device, uint32_t fenceCount, const( VkFence )* pFences );
    alias PFN_vkGetFenceStatus                                                     = VkResult  function( VkDevice device, VkFence fence );
    alias PFN_vkWaitForFences                                                      = VkResult  function( VkDevice device, uint32_t fenceCount, const( VkFence )* pFences, VkBool32 waitAll, uint64_t timeout );
    alias PFN_vkCreateSemaphore                                                    = VkResult  function( VkDevice device, const( VkSemaphoreCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSemaphore* pSemaphore );
    alias PFN_vkDestroySemaphore                                                   = void      function( VkDevice device, VkSemaphore semaphore, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateQueryPool                                                    = VkResult  function( VkDevice device, const( VkQueryPoolCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkQueryPool* pQueryPool );
    alias PFN_vkDestroyQueryPool                                                   = void      function( VkDevice device, VkQueryPool queryPool, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetQueryPoolResults                                                = VkResult  function( VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, size_t dataSize, void* pData, VkDeviceSize stride, VkQueryResultFlags flags );
    alias PFN_vkCreateBuffer                                                       = VkResult  function( VkDevice device, const( VkBufferCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkBuffer* pBuffer );
    alias PFN_vkDestroyBuffer                                                      = void      function( VkDevice device, VkBuffer buffer, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateImage                                                        = VkResult  function( VkDevice device, const( VkImageCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkImage* pImage );
    alias PFN_vkDestroyImage                                                       = void      function( VkDevice device, VkImage image, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetImageSubresourceLayout                                          = void      function( VkDevice device, VkImage image, const( VkImageSubresource )* pSubresource, VkSubresourceLayout* pLayout );
    alias PFN_vkCreateImageView                                                    = VkResult  function( VkDevice device, const( VkImageViewCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkImageView* pView );
    alias PFN_vkDestroyImageView                                                   = void      function( VkDevice device, VkImageView imageView, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateCommandPool                                                  = VkResult  function( VkDevice device, const( VkCommandPoolCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkCommandPool* pCommandPool );
    alias PFN_vkDestroyCommandPool                                                 = void      function( VkDevice device, VkCommandPool commandPool, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkResetCommandPool                                                   = VkResult  function( VkDevice device, VkCommandPool commandPool, VkCommandPoolResetFlags flags );
    alias PFN_vkAllocateCommandBuffers                                             = VkResult  function( VkDevice device, const( VkCommandBufferAllocateInfo )* pAllocateInfo, VkCommandBuffer* pCommandBuffers );
    alias PFN_vkFreeCommandBuffers                                                 = void      function( VkDevice device, VkCommandPool commandPool, uint32_t commandBufferCount, const( VkCommandBuffer )* pCommandBuffers );
    alias PFN_vkBeginCommandBuffer                                                 = VkResult  function( VkCommandBuffer commandBuffer, const( VkCommandBufferBeginInfo )* pBeginInfo );
    alias PFN_vkEndCommandBuffer                                                   = VkResult  function( VkCommandBuffer commandBuffer );
    alias PFN_vkResetCommandBuffer                                                 = VkResult  function( VkCommandBuffer commandBuffer, VkCommandBufferResetFlags flags );
    alias PFN_vkCmdCopyBuffer                                                      = void      function( VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkBuffer dstBuffer, uint32_t regionCount, const( VkBufferCopy )* pRegions );
    alias PFN_vkCmdCopyImage                                                       = void      function( VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, const( VkImageCopy )* pRegions );
    alias PFN_vkCmdCopyBufferToImage                                               = void      function( VkCommandBuffer commandBuffer, VkBuffer srcBuffer, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, const( VkBufferImageCopy )* pRegions );
    alias PFN_vkCmdCopyImageToBuffer                                               = void      function( VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkBuffer dstBuffer, uint32_t regionCount, const( VkBufferImageCopy )* pRegions );
    alias PFN_vkCmdUpdateBuffer                                                    = void      function( VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize dataSize, const( void )* pData );
    alias PFN_vkCmdFillBuffer                                                      = void      function( VkCommandBuffer commandBuffer, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize size, uint32_t data );
    alias PFN_vkCmdPipelineBarrier                                                 = void      function( VkCommandBuffer commandBuffer, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, VkDependencyFlags dependencyFlags, uint32_t memoryBarrierCount, const( VkMemoryBarrier )* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, const( VkBufferMemoryBarrier )* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, const( VkImageMemoryBarrier )* pImageMemoryBarriers );
    alias PFN_vkCmdBeginQuery                                                      = void      function( VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags );
    alias PFN_vkCmdEndQuery                                                        = void      function( VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query );
    alias PFN_vkCmdResetQueryPool                                                  = void      function( VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount );
    alias PFN_vkCmdWriteTimestamp                                                  = void      function( VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkQueryPool queryPool, uint32_t query );
    alias PFN_vkCmdCopyQueryPoolResults                                            = void      function( VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, VkBuffer dstBuffer, VkDeviceSize dstOffset, VkDeviceSize stride, VkQueryResultFlags flags );
    alias PFN_vkCmdExecuteCommands                                                 = void      function( VkCommandBuffer commandBuffer, uint32_t commandBufferCount, const( VkCommandBuffer )* pCommandBuffers );

    // VK_COMPUTE_VERSION_1_0
    alias PFN_vkCreateEvent                                                        = VkResult  function( VkDevice device, const( VkEventCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkEvent* pEvent );
    alias PFN_vkDestroyEvent                                                       = void      function( VkDevice device, VkEvent event, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetEventStatus                                                     = VkResult  function( VkDevice device, VkEvent event );
    alias PFN_vkSetEvent                                                           = VkResult  function( VkDevice device, VkEvent event );
    alias PFN_vkResetEvent                                                         = VkResult  function( VkDevice device, VkEvent event );
    alias PFN_vkCreateBufferView                                                   = VkResult  function( VkDevice device, const( VkBufferViewCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkBufferView* pView );
    alias PFN_vkDestroyBufferView                                                  = void      function( VkDevice device, VkBufferView bufferView, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateShaderModule                                                 = VkResult  function( VkDevice device, const( VkShaderModuleCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkShaderModule* pShaderModule );
    alias PFN_vkDestroyShaderModule                                                = void      function( VkDevice device, VkShaderModule shaderModule, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreatePipelineCache                                                = VkResult  function( VkDevice device, const( VkPipelineCacheCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkPipelineCache* pPipelineCache );
    alias PFN_vkDestroyPipelineCache                                               = void      function( VkDevice device, VkPipelineCache pipelineCache, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetPipelineCacheData                                               = VkResult  function( VkDevice device, VkPipelineCache pipelineCache, size_t* pDataSize, void* pData );
    alias PFN_vkMergePipelineCaches                                                = VkResult  function( VkDevice device, VkPipelineCache dstCache, uint32_t srcCacheCount, const( VkPipelineCache )* pSrcCaches );
    alias PFN_vkCreateComputePipelines                                             = VkResult  function( VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, const( VkComputePipelineCreateInfo )* pCreateInfos, const( VkAllocationCallbacks )* pAllocator, VkPipeline* pPipelines );
    alias PFN_vkDestroyPipeline                                                    = void      function( VkDevice device, VkPipeline pipeline, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreatePipelineLayout                                               = VkResult  function( VkDevice device, const( VkPipelineLayoutCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkPipelineLayout* pPipelineLayout );
    alias PFN_vkDestroyPipelineLayout                                              = void      function( VkDevice device, VkPipelineLayout pipelineLayout, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateSampler                                                      = VkResult  function( VkDevice device, const( VkSamplerCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSampler* pSampler );
    alias PFN_vkDestroySampler                                                     = void      function( VkDevice device, VkSampler sampler, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateDescriptorSetLayout                                          = VkResult  function( VkDevice device, const( VkDescriptorSetLayoutCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkDescriptorSetLayout* pSetLayout );
    alias PFN_vkDestroyDescriptorSetLayout                                         = void      function( VkDevice device, VkDescriptorSetLayout descriptorSetLayout, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateDescriptorPool                                               = VkResult  function( VkDevice device, const( VkDescriptorPoolCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkDescriptorPool* pDescriptorPool );
    alias PFN_vkDestroyDescriptorPool                                              = void      function( VkDevice device, VkDescriptorPool descriptorPool, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkResetDescriptorPool                                                = VkResult  function( VkDevice device, VkDescriptorPool descriptorPool, VkDescriptorPoolResetFlags flags );
    alias PFN_vkAllocateDescriptorSets                                             = VkResult  function( VkDevice device, const( VkDescriptorSetAllocateInfo )* pAllocateInfo, VkDescriptorSet* pDescriptorSets );
    alias PFN_vkFreeDescriptorSets                                                 = VkResult  function( VkDevice device, VkDescriptorPool descriptorPool, uint32_t descriptorSetCount, const( VkDescriptorSet )* pDescriptorSets );
    alias PFN_vkUpdateDescriptorSets                                               = void      function( VkDevice device, uint32_t descriptorWriteCount, const( VkWriteDescriptorSet )* pDescriptorWrites, uint32_t descriptorCopyCount, const( VkCopyDescriptorSet )* pDescriptorCopies );
    alias PFN_vkCmdBindPipeline                                                    = void      function( VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline );
    alias PFN_vkCmdBindDescriptorSets                                              = void      function( VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t firstSet, uint32_t descriptorSetCount, const( VkDescriptorSet )* pDescriptorSets, uint32_t dynamicOffsetCount, const( uint32_t )* pDynamicOffsets );
    alias PFN_vkCmdClearColorImage                                                 = void      function( VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, const( VkClearColorValue )* pColor, uint32_t rangeCount, const( VkImageSubresourceRange )* pRanges );
    alias PFN_vkCmdDispatch                                                        = void      function( VkCommandBuffer commandBuffer, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ );
    alias PFN_vkCmdDispatchIndirect                                                = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset );
    alias PFN_vkCmdSetEvent                                                        = void      function( VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask );
    alias PFN_vkCmdResetEvent                                                      = void      function( VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags stageMask );
    alias PFN_vkCmdWaitEvents                                                      = void      function( VkCommandBuffer commandBuffer, uint32_t eventCount, const( VkEvent )* pEvents, VkPipelineStageFlags srcStageMask, VkPipelineStageFlags dstStageMask, uint32_t memoryBarrierCount, const( VkMemoryBarrier )* pMemoryBarriers, uint32_t bufferMemoryBarrierCount, const( VkBufferMemoryBarrier )* pBufferMemoryBarriers, uint32_t imageMemoryBarrierCount, const( VkImageMemoryBarrier )* pImageMemoryBarriers );
    alias PFN_vkCmdPushConstants                                                   = void      function( VkCommandBuffer commandBuffer, VkPipelineLayout layout, VkShaderStageFlags stageFlags, uint32_t offset, uint32_t size, const( void )* pValues );

    // VK_GRAPHICS_VERSION_1_0
    alias PFN_vkCreateGraphicsPipelines                                            = VkResult  function( VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, const( VkGraphicsPipelineCreateInfo )* pCreateInfos, const( VkAllocationCallbacks )* pAllocator, VkPipeline* pPipelines );
    alias PFN_vkCreateFramebuffer                                                  = VkResult  function( VkDevice device, const( VkFramebufferCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkFramebuffer* pFramebuffer );
    alias PFN_vkDestroyFramebuffer                                                 = void      function( VkDevice device, VkFramebuffer framebuffer, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateRenderPass                                                   = VkResult  function( VkDevice device, const( VkRenderPassCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkRenderPass* pRenderPass );
    alias PFN_vkDestroyRenderPass                                                  = void      function( VkDevice device, VkRenderPass renderPass, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetRenderAreaGranularity                                           = void      function( VkDevice device, VkRenderPass renderPass, VkExtent2D* pGranularity );
    alias PFN_vkCmdSetViewport                                                     = void      function( VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, const( VkViewport )* pViewports );
    alias PFN_vkCmdSetScissor                                                      = void      function( VkCommandBuffer commandBuffer, uint32_t firstScissor, uint32_t scissorCount, const( VkRect2D )* pScissors );
    alias PFN_vkCmdSetLineWidth                                                    = void      function( VkCommandBuffer commandBuffer, float lineWidth );
    alias PFN_vkCmdSetDepthBias                                                    = void      function( VkCommandBuffer commandBuffer, float depthBiasConstantFactor, float depthBiasClamp, float depthBiasSlopeFactor );
    alias PFN_vkCmdSetBlendConstants                                               = void      function( VkCommandBuffer commandBuffer, const( float )* blendConstants );
    alias PFN_vkCmdSetDepthBounds                                                  = void      function( VkCommandBuffer commandBuffer, float minDepthBounds, float maxDepthBounds );
    alias PFN_vkCmdSetStencilCompareMask                                           = void      function( VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t compareMask );
    alias PFN_vkCmdSetStencilWriteMask                                             = void      function( VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t writeMask );
    alias PFN_vkCmdSetStencilReference                                             = void      function( VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, uint32_t reference );
    alias PFN_vkCmdBindIndexBuffer                                                 = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkIndexType indexType );
    alias PFN_vkCmdBindVertexBuffers                                               = void      function( VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, const( VkBuffer )* pBuffers, const( VkDeviceSize )* pOffsets );
    alias PFN_vkCmdDraw                                                            = void      function( VkCommandBuffer commandBuffer, uint32_t vertexCount, uint32_t instanceCount, uint32_t firstVertex, uint32_t firstInstance );
    alias PFN_vkCmdDrawIndexed                                                     = void      function( VkCommandBuffer commandBuffer, uint32_t indexCount, uint32_t instanceCount, uint32_t firstIndex, int32_t vertexOffset, uint32_t firstInstance );
    alias PFN_vkCmdDrawIndirect                                                    = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride );
    alias PFN_vkCmdDrawIndexedIndirect                                             = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride );
    alias PFN_vkCmdBlitImage                                                       = void      function( VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, const( VkImageBlit )* pRegions, VkFilter filter );
    alias PFN_vkCmdClearDepthStencilImage                                          = void      function( VkCommandBuffer commandBuffer, VkImage image, VkImageLayout imageLayout, const( VkClearDepthStencilValue )* pDepthStencil, uint32_t rangeCount, const( VkImageSubresourceRange )* pRanges );
    alias PFN_vkCmdClearAttachments                                                = void      function( VkCommandBuffer commandBuffer, uint32_t attachmentCount, const( VkClearAttachment )* pAttachments, uint32_t rectCount, const( VkClearRect )* pRects );
    alias PFN_vkCmdResolveImage                                                    = void      function( VkCommandBuffer commandBuffer, VkImage srcImage, VkImageLayout srcImageLayout, VkImage dstImage, VkImageLayout dstImageLayout, uint32_t regionCount, const( VkImageResolve )* pRegions );
    alias PFN_vkCmdBeginRenderPass                                                 = void      function( VkCommandBuffer commandBuffer, const( VkRenderPassBeginInfo )* pRenderPassBegin, VkSubpassContents contents );
    alias PFN_vkCmdNextSubpass                                                     = void      function( VkCommandBuffer commandBuffer, VkSubpassContents contents );
    alias PFN_vkCmdEndRenderPass                                                   = void      function( VkCommandBuffer commandBuffer );

    // VK_BASE_VERSION_1_1
    alias PFN_vkEnumerateInstanceVersion                                           = VkResult  function( uint32_t* pApiVersion );
    alias PFN_vkBindBufferMemory2                                                  = VkResult  function( VkDevice device, uint32_t bindInfoCount, const( VkBindBufferMemoryInfo )* pBindInfos );
    alias PFN_vkBindImageMemory2                                                   = VkResult  function( VkDevice device, uint32_t bindInfoCount, const( VkBindImageMemoryInfo )* pBindInfos );
    alias PFN_vkGetDeviceGroupPeerMemoryFeatures                                   = void      function( VkDevice device, uint32_t heapIndex, uint32_t localDeviceIndex, uint32_t remoteDeviceIndex, VkPeerMemoryFeatureFlags* pPeerMemoryFeatures );
    alias PFN_vkCmdSetDeviceMask                                                   = void      function( VkCommandBuffer commandBuffer, uint32_t deviceMask );
    alias PFN_vkEnumeratePhysicalDeviceGroups                                      = VkResult  function( VkInstance instance, uint32_t* pPhysicalDeviceGroupCount, VkPhysicalDeviceGroupProperties* pPhysicalDeviceGroupProperties );
    alias PFN_vkGetImageMemoryRequirements2                                        = void      function( VkDevice device, const( VkImageMemoryRequirementsInfo2 )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkGetBufferMemoryRequirements2                                       = void      function( VkDevice device, const( VkBufferMemoryRequirementsInfo2 )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkGetImageSparseMemoryRequirements2                                  = void      function( VkDevice device, const( VkImageSparseMemoryRequirementsInfo2 )* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements );
    alias PFN_vkGetPhysicalDeviceFeatures2                                         = void      function( VkPhysicalDevice physicalDevice, VkPhysicalDeviceFeatures2* pFeatures );
    alias PFN_vkGetPhysicalDeviceProperties2                                       = void      function( VkPhysicalDevice physicalDevice, VkPhysicalDeviceProperties2* pProperties );
    alias PFN_vkGetPhysicalDeviceFormatProperties2                                 = void      function( VkPhysicalDevice physicalDevice, VkFormat format, VkFormatProperties2* pFormatProperties );
    alias PFN_vkGetPhysicalDeviceImageFormatProperties2                            = VkResult  function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceImageFormatInfo2 )* pImageFormatInfo, VkImageFormatProperties2* pImageFormatProperties );
    alias PFN_vkGetPhysicalDeviceQueueFamilyProperties2                            = void      function( VkPhysicalDevice physicalDevice, uint32_t* pQueueFamilyPropertyCount, VkQueueFamilyProperties2* pQueueFamilyProperties );
    alias PFN_vkGetPhysicalDeviceMemoryProperties2                                 = void      function( VkPhysicalDevice physicalDevice, VkPhysicalDeviceMemoryProperties2* pMemoryProperties );
    alias PFN_vkGetPhysicalDeviceSparseImageFormatProperties2                      = void      function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceSparseImageFormatInfo2 )* pFormatInfo, uint32_t* pPropertyCount, VkSparseImageFormatProperties2* pProperties );
    alias PFN_vkTrimCommandPool                                                    = void      function( VkDevice device, VkCommandPool commandPool, VkCommandPoolTrimFlags flags );
    alias PFN_vkGetDeviceQueue2                                                    = void      function( VkDevice device, const( VkDeviceQueueInfo2 )* pQueueInfo, VkQueue* pQueue );
    alias PFN_vkGetPhysicalDeviceExternalBufferProperties                          = void      function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceExternalBufferInfo )* pExternalBufferInfo, VkExternalBufferProperties* pExternalBufferProperties );
    alias PFN_vkGetPhysicalDeviceExternalFenceProperties                           = void      function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceExternalFenceInfo )* pExternalFenceInfo, VkExternalFenceProperties* pExternalFenceProperties );
    alias PFN_vkGetPhysicalDeviceExternalSemaphoreProperties                       = void      function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceExternalSemaphoreInfo )* pExternalSemaphoreInfo, VkExternalSemaphoreProperties* pExternalSemaphoreProperties );

    // VK_COMPUTE_VERSION_1_1
    alias PFN_vkCmdDispatchBase                                                    = void      function( VkCommandBuffer commandBuffer, uint32_t baseGroupX, uint32_t baseGroupY, uint32_t baseGroupZ, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ );
    alias PFN_vkCreateDescriptorUpdateTemplate                                     = VkResult  function( VkDevice device, const( VkDescriptorUpdateTemplateCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkDescriptorUpdateTemplate* pDescriptorUpdateTemplate );
    alias PFN_vkDestroyDescriptorUpdateTemplate                                    = void      function( VkDevice device, VkDescriptorUpdateTemplate descriptorUpdateTemplate, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkUpdateDescriptorSetWithTemplate                                    = void      function( VkDevice device, VkDescriptorSet descriptorSet, VkDescriptorUpdateTemplate descriptorUpdateTemplate, const( void )* pData );
    alias PFN_vkGetDescriptorSetLayoutSupport                                      = void      function( VkDevice device, const( VkDescriptorSetLayoutCreateInfo )* pCreateInfo, VkDescriptorSetLayoutSupport* pSupport );
    alias PFN_vkCreateSamplerYcbcrConversion                                       = VkResult  function( VkDevice device, const( VkSamplerYcbcrConversionCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSamplerYcbcrConversion* pYcbcrConversion );
    alias PFN_vkDestroySamplerYcbcrConversion                                      = void      function( VkDevice device, VkSamplerYcbcrConversion ycbcrConversion, const( VkAllocationCallbacks )* pAllocator );

    // VK_BASE_VERSION_1_2
    alias PFN_vkResetQueryPool                                                     = void      function( VkDevice device, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount );
    alias PFN_vkGetSemaphoreCounterValue                                           = VkResult  function( VkDevice device, VkSemaphore semaphore, uint64_t* pValue );
    alias PFN_vkWaitSemaphores                                                     = VkResult  function( VkDevice device, const( VkSemaphoreWaitInfo )* pWaitInfo, uint64_t timeout );
    alias PFN_vkSignalSemaphore                                                    = VkResult  function( VkDevice device, const( VkSemaphoreSignalInfo )* pSignalInfo );
    alias PFN_vkGetBufferDeviceAddress                                             = VkDeviceAddress  function( VkDevice device, const( VkBufferDeviceAddressInfo )* pInfo );
    alias PFN_vkGetBufferOpaqueCaptureAddress                                      = uint64_t  function( VkDevice device, const( VkBufferDeviceAddressInfo )* pInfo );
    alias PFN_vkGetDeviceMemoryOpaqueCaptureAddress                                = uint64_t  function( VkDevice device, const( VkDeviceMemoryOpaqueCaptureAddressInfo )* pInfo );

    // VK_GRAPHICS_VERSION_1_2
    alias PFN_vkCmdDrawIndirectCount                                               = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride );
    alias PFN_vkCmdDrawIndexedIndirectCount                                        = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride );
    alias PFN_vkCreateRenderPass2                                                  = VkResult  function( VkDevice device, const( VkRenderPassCreateInfo2 )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkRenderPass* pRenderPass );
    alias PFN_vkCmdBeginRenderPass2                                                = void      function( VkCommandBuffer commandBuffer, const( VkRenderPassBeginInfo )* pRenderPassBegin, const( VkSubpassBeginInfo )* pSubpassBeginInfo );
    alias PFN_vkCmdNextSubpass2                                                    = void      function( VkCommandBuffer commandBuffer, const( VkSubpassBeginInfo )* pSubpassBeginInfo, const( VkSubpassEndInfo )* pSubpassEndInfo );
    alias PFN_vkCmdEndRenderPass2                                                  = void      function( VkCommandBuffer commandBuffer, const( VkSubpassEndInfo )* pSubpassEndInfo );

    // VK_BASE_VERSION_1_3
    alias PFN_vkGetPhysicalDeviceToolProperties                                    = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pToolCount, VkPhysicalDeviceToolProperties* pToolProperties );
    alias PFN_vkCreatePrivateDataSlot                                              = VkResult  function( VkDevice device, const( VkPrivateDataSlotCreateInfo )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkPrivateDataSlot* pPrivateDataSlot );
    alias PFN_vkDestroyPrivateDataSlot                                             = void      function( VkDevice device, VkPrivateDataSlot privateDataSlot, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkSetPrivateData                                                     = VkResult  function( VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t data );
    alias PFN_vkGetPrivateData                                                     = void      function( VkDevice device, VkObjectType objectType, uint64_t objectHandle, VkPrivateDataSlot privateDataSlot, uint64_t* pData );
    alias PFN_vkCmdPipelineBarrier2                                                = void      function( VkCommandBuffer commandBuffer, const( VkDependencyInfo )* pDependencyInfo );
    alias PFN_vkCmdWriteTimestamp2                                                 = void      function( VkCommandBuffer commandBuffer, VkPipelineStageFlags2 stage, VkQueryPool queryPool, uint32_t query );
    alias PFN_vkQueueSubmit2                                                       = VkResult  function( VkQueue queue, uint32_t submitCount, const( VkSubmitInfo2 )* pSubmits, VkFence fence );
    alias PFN_vkCmdCopyBuffer2                                                     = void      function( VkCommandBuffer commandBuffer, const( VkCopyBufferInfo2 )* pCopyBufferInfo );
    alias PFN_vkCmdCopyImage2                                                      = void      function( VkCommandBuffer commandBuffer, const( VkCopyImageInfo2 )* pCopyImageInfo );
    alias PFN_vkCmdCopyBufferToImage2                                              = void      function( VkCommandBuffer commandBuffer, const( VkCopyBufferToImageInfo2 )* pCopyBufferToImageInfo );
    alias PFN_vkCmdCopyImageToBuffer2                                              = void      function( VkCommandBuffer commandBuffer, const( VkCopyImageToBufferInfo2 )* pCopyImageToBufferInfo );
    alias PFN_vkGetDeviceBufferMemoryRequirements                                  = void      function( VkDevice device, const( VkDeviceBufferMemoryRequirements )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkGetDeviceImageMemoryRequirements                                   = void      function( VkDevice device, const( VkDeviceImageMemoryRequirements )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkGetDeviceImageSparseMemoryRequirements                             = void      function( VkDevice device, const( VkDeviceImageMemoryRequirements )* pInfo, uint32_t* pSparseMemoryRequirementCount, VkSparseImageMemoryRequirements2* pSparseMemoryRequirements );

    // VK_COMPUTE_VERSION_1_3
    alias PFN_vkCmdSetEvent2                                                       = void      function( VkCommandBuffer commandBuffer, VkEvent event, const( VkDependencyInfo )* pDependencyInfo );
    alias PFN_vkCmdResetEvent2                                                     = void      function( VkCommandBuffer commandBuffer, VkEvent event, VkPipelineStageFlags2 stageMask );
    alias PFN_vkCmdWaitEvents2                                                     = void      function( VkCommandBuffer commandBuffer, uint32_t eventCount, const( VkEvent )* pEvents, const( VkDependencyInfo )* pDependencyInfos );

    // VK_GRAPHICS_VERSION_1_3
    alias PFN_vkCmdBlitImage2                                                      = void      function( VkCommandBuffer commandBuffer, const( VkBlitImageInfo2 )* pBlitImageInfo );
    alias PFN_vkCmdResolveImage2                                                   = void      function( VkCommandBuffer commandBuffer, const( VkResolveImageInfo2 )* pResolveImageInfo );
    alias PFN_vkCmdBeginRendering                                                  = void      function( VkCommandBuffer commandBuffer, const( VkRenderingInfo )* pRenderingInfo );
    alias PFN_vkCmdEndRendering                                                    = void      function( VkCommandBuffer commandBuffer );
    alias PFN_vkCmdSetCullMode                                                     = void      function( VkCommandBuffer commandBuffer, VkCullModeFlags cullMode );
    alias PFN_vkCmdSetFrontFace                                                    = void      function( VkCommandBuffer commandBuffer, VkFrontFace frontFace );
    alias PFN_vkCmdSetPrimitiveTopology                                            = void      function( VkCommandBuffer commandBuffer, VkPrimitiveTopology primitiveTopology );
    alias PFN_vkCmdSetViewportWithCount                                            = void      function( VkCommandBuffer commandBuffer, uint32_t viewportCount, const( VkViewport )* pViewports );
    alias PFN_vkCmdSetScissorWithCount                                             = void      function( VkCommandBuffer commandBuffer, uint32_t scissorCount, const( VkRect2D )* pScissors );
    alias PFN_vkCmdBindVertexBuffers2                                              = void      function( VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, const( VkBuffer )* pBuffers, const( VkDeviceSize )* pOffsets, const( VkDeviceSize )* pSizes, const( VkDeviceSize )* pStrides );
    alias PFN_vkCmdSetDepthTestEnable                                              = void      function( VkCommandBuffer commandBuffer, VkBool32 depthTestEnable );
    alias PFN_vkCmdSetDepthWriteEnable                                             = void      function( VkCommandBuffer commandBuffer, VkBool32 depthWriteEnable );
    alias PFN_vkCmdSetDepthCompareOp                                               = void      function( VkCommandBuffer commandBuffer, VkCompareOp depthCompareOp );
    alias PFN_vkCmdSetDepthBoundsTestEnable                                        = void      function( VkCommandBuffer commandBuffer, VkBool32 depthBoundsTestEnable );
    alias PFN_vkCmdSetStencilTestEnable                                            = void      function( VkCommandBuffer commandBuffer, VkBool32 stencilTestEnable );
    alias PFN_vkCmdSetStencilOp                                                    = void      function( VkCommandBuffer commandBuffer, VkStencilFaceFlags faceMask, VkStencilOp failOp, VkStencilOp passOp, VkStencilOp depthFailOp, VkCompareOp compareOp );
    alias PFN_vkCmdSetRasterizerDiscardEnable                                      = void      function( VkCommandBuffer commandBuffer, VkBool32 rasterizerDiscardEnable );
    alias PFN_vkCmdSetDepthBiasEnable                                              = void      function( VkCommandBuffer commandBuffer, VkBool32 depthBiasEnable );
    alias PFN_vkCmdSetPrimitiveRestartEnable                                       = void      function( VkCommandBuffer commandBuffer, VkBool32 primitiveRestartEnable );

    // VK_BASE_VERSION_1_4
    alias PFN_vkMapMemory2                                                         = VkResult  function( VkDevice device, const( VkMemoryMapInfo )* pMemoryMapInfo, void** ppData );
    alias PFN_vkUnmapMemory2                                                       = VkResult  function( VkDevice device, const( VkMemoryUnmapInfo )* pMemoryUnmapInfo );
    alias PFN_vkGetDeviceImageSubresourceLayout                                    = void      function( VkDevice device, const( VkDeviceImageSubresourceInfo )* pInfo, VkSubresourceLayout2* pLayout );
    alias PFN_vkGetImageSubresourceLayout2                                         = void      function( VkDevice device, VkImage image, const( VkImageSubresource2 )* pSubresource, VkSubresourceLayout2* pLayout );
    alias PFN_vkCopyMemoryToImage                                                  = VkResult  function( VkDevice device, const( VkCopyMemoryToImageInfo )* pCopyMemoryToImageInfo );
    alias PFN_vkCopyImageToMemory                                                  = VkResult  function( VkDevice device, const( VkCopyImageToMemoryInfo )* pCopyImageToMemoryInfo );
    alias PFN_vkCopyImageToImage                                                   = VkResult  function( VkDevice device, const( VkCopyImageToImageInfo )* pCopyImageToImageInfo );
    alias PFN_vkTransitionImageLayout                                              = VkResult  function( VkDevice device, uint32_t transitionCount, const( VkHostImageLayoutTransitionInfo )* pTransitions );

    // VK_COMPUTE_VERSION_1_4
    alias PFN_vkCmdPushDescriptorSet                                               = void      function( VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t set, uint32_t descriptorWriteCount, const( VkWriteDescriptorSet )* pDescriptorWrites );
    alias PFN_vkCmdPushDescriptorSetWithTemplate                                   = void      function( VkCommandBuffer commandBuffer, VkDescriptorUpdateTemplate descriptorUpdateTemplate, VkPipelineLayout layout, uint32_t set, const( void )* pData );
    alias PFN_vkCmdBindDescriptorSets2                                             = void      function( VkCommandBuffer commandBuffer, const( VkBindDescriptorSetsInfo )* pBindDescriptorSetsInfo );
    alias PFN_vkCmdPushConstants2                                                  = void      function( VkCommandBuffer commandBuffer, const( VkPushConstantsInfo )* pPushConstantsInfo );
    alias PFN_vkCmdPushDescriptorSet2                                              = void      function( VkCommandBuffer commandBuffer, const( VkPushDescriptorSetInfo )* pPushDescriptorSetInfo );
    alias PFN_vkCmdPushDescriptorSetWithTemplate2                                  = void      function( VkCommandBuffer commandBuffer, const( VkPushDescriptorSetWithTemplateInfo )* pPushDescriptorSetWithTemplateInfo );

    // VK_GRAPHICS_VERSION_1_4
    alias PFN_vkCmdSetLineStipple                                                  = void      function( VkCommandBuffer commandBuffer, uint32_t lineStippleFactor, uint16_t lineStipplePattern );
    alias PFN_vkCmdBindIndexBuffer2                                                = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkDeviceSize size, VkIndexType indexType );
    alias PFN_vkGetRenderingAreaGranularity                                        = void      function( VkDevice device, const( VkRenderingAreaInfo )* pRenderingAreaInfo, VkExtent2D* pGranularity );
    alias PFN_vkCmdSetRenderingAttachmentLocations                                 = void      function( VkCommandBuffer commandBuffer, const( VkRenderingAttachmentLocationInfo )* pLocationInfo );
    alias PFN_vkCmdSetRenderingInputAttachmentIndices                              = void      function( VkCommandBuffer commandBuffer, const( VkRenderingInputAttachmentIndexInfo )* pInputAttachmentIndexInfo );

    // VK_KHR_surface
    alias PFN_vkDestroySurfaceKHR                                                  = void      function( VkInstance instance, VkSurfaceKHR surface, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetPhysicalDeviceSurfaceSupportKHR                                 = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, VkSurfaceKHR surface, VkBool32* pSupported );
    alias PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR                            = VkResult  function( VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilitiesKHR* pSurfaceCapabilities );
    alias PFN_vkGetPhysicalDeviceSurfaceFormatsKHR                                 = VkResult  function( VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pSurfaceFormatCount, VkSurfaceFormatKHR* pSurfaceFormats );
    alias PFN_vkGetPhysicalDeviceSurfacePresentModesKHR                            = VkResult  function( VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pPresentModeCount, VkPresentModeKHR* pPresentModes );

    // VK_KHR_swapchain
    alias PFN_vkCreateSwapchainKHR                                                 = VkResult  function( VkDevice device, const( VkSwapchainCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSwapchainKHR* pSwapchain );
    alias PFN_vkDestroySwapchainKHR                                                = void      function( VkDevice device, VkSwapchainKHR swapchain, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetSwapchainImagesKHR                                              = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, uint32_t* pSwapchainImageCount, VkImage* pSwapchainImages );
    alias PFN_vkAcquireNextImageKHR                                                = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, uint64_t timeout, VkSemaphore semaphore, VkFence fence, uint32_t* pImageIndex );
    alias PFN_vkQueuePresentKHR                                                    = VkResult  function( VkQueue queue, const( VkPresentInfoKHR )* pPresentInfo );
    alias PFN_vkGetDeviceGroupPresentCapabilitiesKHR                               = VkResult  function( VkDevice device, VkDeviceGroupPresentCapabilitiesKHR* pDeviceGroupPresentCapabilities );
    alias PFN_vkGetDeviceGroupSurfacePresentModesKHR                               = VkResult  function( VkDevice device, VkSurfaceKHR surface, VkDeviceGroupPresentModeFlagsKHR* pModes );
    alias PFN_vkGetPhysicalDevicePresentRectanglesKHR                              = VkResult  function( VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, uint32_t* pRectCount, VkRect2D* pRects );
    alias PFN_vkAcquireNextImage2KHR                                               = VkResult  function( VkDevice device, const( VkAcquireNextImageInfoKHR )* pAcquireInfo, uint32_t* pImageIndex );

    // VK_KHR_display
    alias PFN_vkGetPhysicalDeviceDisplayPropertiesKHR                              = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPropertiesKHR* pProperties );
    alias PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR                         = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlanePropertiesKHR* pProperties );
    alias PFN_vkGetDisplayPlaneSupportedDisplaysKHR                                = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t planeIndex, uint32_t* pDisplayCount, VkDisplayKHR* pDisplays );
    alias PFN_vkGetDisplayModePropertiesKHR                                        = VkResult  function( VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModePropertiesKHR* pProperties );
    alias PFN_vkCreateDisplayModeKHR                                               = VkResult  function( VkPhysicalDevice physicalDevice, VkDisplayKHR display, const( VkDisplayModeCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkDisplayModeKHR* pMode );
    alias PFN_vkGetDisplayPlaneCapabilitiesKHR                                     = VkResult  function( VkPhysicalDevice physicalDevice, VkDisplayModeKHR mode, uint32_t planeIndex, VkDisplayPlaneCapabilitiesKHR* pCapabilities );
    alias PFN_vkCreateDisplayPlaneSurfaceKHR                                       = VkResult  function( VkInstance instance, const( VkDisplaySurfaceCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );

    // VK_KHR_display_swapchain
    alias PFN_vkCreateSharedSwapchainsKHR                                          = VkResult  function( VkDevice device, uint32_t swapchainCount, const( VkSwapchainCreateInfoKHR )* pCreateInfos, const( VkAllocationCallbacks )* pAllocator, VkSwapchainKHR* pSwapchains );

    // VK_KHR_video_queue
    alias PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR                              = VkResult  function( VkPhysicalDevice physicalDevice, const( VkVideoProfileInfoKHR )* pVideoProfile, VkVideoCapabilitiesKHR* pCapabilities );
    alias PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR                          = VkResult  function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceVideoFormatInfoKHR )* pVideoFormatInfo, uint32_t* pVideoFormatPropertyCount, VkVideoFormatPropertiesKHR* pVideoFormatProperties );
    alias PFN_vkCreateVideoSessionKHR                                              = VkResult  function( VkDevice device, const( VkVideoSessionCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkVideoSessionKHR* pVideoSession );
    alias PFN_vkDestroyVideoSessionKHR                                             = void      function( VkDevice device, VkVideoSessionKHR videoSession, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetVideoSessionMemoryRequirementsKHR                               = VkResult  function( VkDevice device, VkVideoSessionKHR videoSession, uint32_t* pMemoryRequirementsCount, VkVideoSessionMemoryRequirementsKHR* pMemoryRequirements );
    alias PFN_vkBindVideoSessionMemoryKHR                                          = VkResult  function( VkDevice device, VkVideoSessionKHR videoSession, uint32_t bindSessionMemoryInfoCount, const( VkBindVideoSessionMemoryInfoKHR )* pBindSessionMemoryInfos );
    alias PFN_vkCreateVideoSessionParametersKHR                                    = VkResult  function( VkDevice device, const( VkVideoSessionParametersCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkVideoSessionParametersKHR* pVideoSessionParameters );
    alias PFN_vkUpdateVideoSessionParametersKHR                                    = VkResult  function( VkDevice device, VkVideoSessionParametersKHR videoSessionParameters, const( VkVideoSessionParametersUpdateInfoKHR )* pUpdateInfo );
    alias PFN_vkDestroyVideoSessionParametersKHR                                   = void      function( VkDevice device, VkVideoSessionParametersKHR videoSessionParameters, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCmdBeginVideoCodingKHR                                             = void      function( VkCommandBuffer commandBuffer, const( VkVideoBeginCodingInfoKHR )* pBeginInfo );
    alias PFN_vkCmdEndVideoCodingKHR                                               = void      function( VkCommandBuffer commandBuffer, const( VkVideoEndCodingInfoKHR )* pEndCodingInfo );
    alias PFN_vkCmdControlVideoCodingKHR                                           = void      function( VkCommandBuffer commandBuffer, const( VkVideoCodingControlInfoKHR )* pCodingControlInfo );

    // VK_KHR_video_decode_queue
    alias PFN_vkCmdDecodeVideoKHR                                                  = void      function( VkCommandBuffer commandBuffer, const( VkVideoDecodeInfoKHR )* pDecodeInfo );

    // VK_KHR_external_memory_fd
    alias PFN_vkGetMemoryFdKHR                                                     = VkResult  function( VkDevice device, const( VkMemoryGetFdInfoKHR )* pGetFdInfo, int* pFd );
    alias PFN_vkGetMemoryFdPropertiesKHR                                           = VkResult  function( VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, int fd, VkMemoryFdPropertiesKHR* pMemoryFdProperties );

    // VK_KHR_external_semaphore_fd
    alias PFN_vkImportSemaphoreFdKHR                                               = VkResult  function( VkDevice device, const( VkImportSemaphoreFdInfoKHR )* pImportSemaphoreFdInfo );
    alias PFN_vkGetSemaphoreFdKHR                                                  = VkResult  function( VkDevice device, const( VkSemaphoreGetFdInfoKHR )* pGetFdInfo, int* pFd );

    // VK_KHR_shared_presentable_image
    alias PFN_vkGetSwapchainStatusKHR                                              = VkResult  function( VkDevice device, VkSwapchainKHR swapchain );

    // VK_KHR_external_fence_fd
    alias PFN_vkImportFenceFdKHR                                                   = VkResult  function( VkDevice device, const( VkImportFenceFdInfoKHR )* pImportFenceFdInfo );
    alias PFN_vkGetFenceFdKHR                                                      = VkResult  function( VkDevice device, const( VkFenceGetFdInfoKHR )* pGetFdInfo, int* pFd );

    // VK_KHR_performance_query
    alias PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR      = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, uint32_t* pCounterCount, VkPerformanceCounterKHR* pCounters, VkPerformanceCounterDescriptionKHR* pCounterDescriptions );
    alias PFN_vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR              = void      function( VkPhysicalDevice physicalDevice, const( VkQueryPoolPerformanceCreateInfoKHR )* pPerformanceQueryCreateInfo, uint32_t* pNumPasses );
    alias PFN_vkAcquireProfilingLockKHR                                            = VkResult  function( VkDevice device, const( VkAcquireProfilingLockInfoKHR )* pInfo );
    alias PFN_vkReleaseProfilingLockKHR                                            = void      function( VkDevice device );

    // VK_KHR_get_surface_capabilities2
    alias PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR                           = VkResult  function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceSurfaceInfo2KHR )* pSurfaceInfo, VkSurfaceCapabilities2KHR* pSurfaceCapabilities );
    alias PFN_vkGetPhysicalDeviceSurfaceFormats2KHR                                = VkResult  function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceSurfaceInfo2KHR )* pSurfaceInfo, uint32_t* pSurfaceFormatCount, VkSurfaceFormat2KHR* pSurfaceFormats );

    // VK_KHR_get_display_properties2
    alias PFN_vkGetPhysicalDeviceDisplayProperties2KHR                             = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayProperties2KHR* pProperties );
    alias PFN_vkGetPhysicalDeviceDisplayPlaneProperties2KHR                        = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkDisplayPlaneProperties2KHR* pProperties );
    alias PFN_vkGetDisplayModeProperties2KHR                                       = VkResult  function( VkPhysicalDevice physicalDevice, VkDisplayKHR display, uint32_t* pPropertyCount, VkDisplayModeProperties2KHR* pProperties );
    alias PFN_vkGetDisplayPlaneCapabilities2KHR                                    = VkResult  function( VkPhysicalDevice physicalDevice, const( VkDisplayPlaneInfo2KHR )* pDisplayPlaneInfo, VkDisplayPlaneCapabilities2KHR* pCapabilities );

    // VK_KHR_fragment_shading_rate
    alias PFN_vkGetPhysicalDeviceFragmentShadingRatesKHR                           = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pFragmentShadingRateCount, VkPhysicalDeviceFragmentShadingRateKHR* pFragmentShadingRates );
    alias PFN_vkCmdSetFragmentShadingRateKHR                                       = void      function( VkCommandBuffer commandBuffer, const( VkExtent2D )* pFragmentSize, const( VkFragmentShadingRateCombinerOpKHR )* combinerOps );

    // VK_KHR_present_wait
    alias PFN_vkWaitForPresentKHR                                                  = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, uint64_t presentId, uint64_t timeout );

    // VK_KHR_deferred_host_operations
    alias PFN_vkCreateDeferredOperationKHR                                         = VkResult  function( VkDevice device, const( VkAllocationCallbacks )* pAllocator, VkDeferredOperationKHR* pDeferredOperation );
    alias PFN_vkDestroyDeferredOperationKHR                                        = void      function( VkDevice device, VkDeferredOperationKHR operation, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetDeferredOperationMaxConcurrencyKHR                              = uint32_t  function( VkDevice device, VkDeferredOperationKHR operation );
    alias PFN_vkGetDeferredOperationResultKHR                                      = VkResult  function( VkDevice device, VkDeferredOperationKHR operation );
    alias PFN_vkDeferredOperationJoinKHR                                           = VkResult  function( VkDevice device, VkDeferredOperationKHR operation );

    // VK_KHR_pipeline_executable_properties
    alias PFN_vkGetPipelineExecutablePropertiesKHR                                 = VkResult  function( VkDevice device, const( VkPipelineInfoKHR )* pPipelineInfo, uint32_t* pExecutableCount, VkPipelineExecutablePropertiesKHR* pProperties );
    alias PFN_vkGetPipelineExecutableStatisticsKHR                                 = VkResult  function( VkDevice device, const( VkPipelineExecutableInfoKHR )* pExecutableInfo, uint32_t* pStatisticCount, VkPipelineExecutableStatisticKHR* pStatistics );
    alias PFN_vkGetPipelineExecutableInternalRepresentationsKHR                    = VkResult  function( VkDevice device, const( VkPipelineExecutableInfoKHR )* pExecutableInfo, uint32_t* pInternalRepresentationCount, VkPipelineExecutableInternalRepresentationKHR* pInternalRepresentations );

    // VK_KHR_video_encode_queue
    alias PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR              = VkResult  function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceVideoEncodeQualityLevelInfoKHR )* pQualityLevelInfo, VkVideoEncodeQualityLevelPropertiesKHR* pQualityLevelProperties );
    alias PFN_vkGetEncodedVideoSessionParametersKHR                                = VkResult  function( VkDevice device, const( VkVideoEncodeSessionParametersGetInfoKHR )* pVideoSessionParametersInfo, VkVideoEncodeSessionParametersFeedbackInfoKHR* pFeedbackInfo, size_t* pDataSize, void* pData );
    alias PFN_vkCmdEncodeVideoKHR                                                  = void      function( VkCommandBuffer commandBuffer, const( VkVideoEncodeInfoKHR )* pEncodeInfo );

    // VK_KHR_device_address_commands
    alias PFN_vkCmdBindIndexBuffer3KHR                                             = void      function( VkCommandBuffer commandBuffer, const( VkBindIndexBuffer3InfoKHR )* pInfo );
    alias PFN_vkCmdBindVertexBuffers3KHR                                           = void      function( VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, const( VkBindVertexBuffer3InfoKHR )* pBindingInfos );
    alias PFN_vkCmdDrawIndirect2KHR                                                = void      function( VkCommandBuffer commandBuffer, const( VkDrawIndirect2InfoKHR )* pInfo );
    alias PFN_vkCmdDrawIndexedIndirect2KHR                                         = void      function( VkCommandBuffer commandBuffer, const( VkDrawIndirect2InfoKHR )* pInfo );
    alias PFN_vkCmdDispatchIndirect2KHR                                            = void      function( VkCommandBuffer commandBuffer, const( VkDispatchIndirect2InfoKHR )* pInfo );
    alias PFN_vkCmdCopyMemoryKHR                                                   = void      function( VkCommandBuffer commandBuffer, const( VkCopyDeviceMemoryInfoKHR )* pCopyMemoryInfo );
    alias PFN_vkCmdCopyMemoryToImageKHR                                            = void      function( VkCommandBuffer commandBuffer, const( VkCopyDeviceMemoryImageInfoKHR )* pCopyMemoryInfo );
    alias PFN_vkCmdCopyImageToMemoryKHR                                            = void      function( VkCommandBuffer commandBuffer, const( VkCopyDeviceMemoryImageInfoKHR )* pCopyMemoryInfo );
    alias PFN_vkCmdUpdateMemoryKHR                                                 = void      function( VkCommandBuffer commandBuffer, const( VkDeviceAddressRangeKHR )* pDstRange, VkAddressCommandFlagsKHR dstFlags, VkDeviceSize dataSize, const( void )* pData );
    alias PFN_vkCmdFillMemoryKHR                                                   = void      function( VkCommandBuffer commandBuffer, const( VkDeviceAddressRangeKHR )* pDstRange, VkAddressCommandFlagsKHR dstFlags, uint32_t data );
    alias PFN_vkCmdCopyQueryPoolResultsToMemoryKHR                                 = void      function( VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t firstQuery, uint32_t queryCount, const( VkStridedDeviceAddressRangeKHR )* pDstRange, VkAddressCommandFlagsKHR dstFlags, VkQueryResultFlags queryResultFlags );
    alias PFN_vkCmdDrawIndirectCount2KHR                                           = void      function( VkCommandBuffer commandBuffer, const( VkDrawIndirectCount2InfoKHR )* pInfo );
    alias PFN_vkCmdDrawIndexedIndirectCount2KHR                                    = void      function( VkCommandBuffer commandBuffer, const( VkDrawIndirectCount2InfoKHR )* pInfo );
    alias PFN_vkCmdBeginConditionalRendering2EXT                                   = void      function( VkCommandBuffer commandBuffer, const( VkConditionalRenderingBeginInfo2EXT )* pConditionalRenderingBegin );
    alias PFN_vkCmdBindTransformFeedbackBuffers2EXT                                = void      function( VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, const( VkBindTransformFeedbackBuffer2InfoEXT )* pBindingInfos );
    alias PFN_vkCmdBeginTransformFeedback2EXT                                      = void      function( VkCommandBuffer commandBuffer, uint32_t firstCounterRange, uint32_t counterRangeCount, const( VkBindTransformFeedbackBuffer2InfoEXT )* pCounterInfos );
    alias PFN_vkCmdEndTransformFeedback2EXT                                        = void      function( VkCommandBuffer commandBuffer, uint32_t firstCounterRange, uint32_t counterRangeCount, const( VkBindTransformFeedbackBuffer2InfoEXT )* pCounterInfos );
    alias PFN_vkCmdDrawIndirectByteCount2EXT                                       = void      function( VkCommandBuffer commandBuffer, uint32_t instanceCount, uint32_t firstInstance, const( VkBindTransformFeedbackBuffer2InfoEXT )* pCounterInfo, uint32_t counterOffset, uint32_t vertexStride );
    alias PFN_vkCmdDrawMeshTasksIndirect2EXT                                       = void      function( VkCommandBuffer commandBuffer, const( VkDrawIndirect2InfoKHR )* pInfo );
    alias PFN_vkCmdDrawMeshTasksIndirectCount2EXT                                  = void      function( VkCommandBuffer commandBuffer, const( VkDrawIndirectCount2InfoKHR )* pInfo );
    alias PFN_vkCmdWriteMarkerToMemoryAMD                                          = void      function( VkCommandBuffer commandBuffer, const( VkMemoryMarkerInfoAMD )* pInfo );
    alias PFN_vkCreateAccelerationStructure2KHR                                    = VkResult  function( VkDevice device, const( VkAccelerationStructureCreateInfo2KHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkAccelerationStructureKHR* pAccelerationStructure );

    // VK_KHR_ray_tracing_maintenance1
    alias PFN_vkCmdTraceRaysIndirect2KHR                                           = void      function( VkCommandBuffer commandBuffer, VkDeviceAddress indirectDeviceAddress );

    // VK_KHR_present_wait2
    alias PFN_vkWaitForPresent2KHR                                                 = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, const( VkPresentWait2InfoKHR )* pPresentWait2Info );

    // VK_KHR_pipeline_binary
    alias PFN_vkCreatePipelineBinariesKHR                                          = VkResult  function( VkDevice device, const( VkPipelineBinaryCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkPipelineBinaryHandlesInfoKHR* pBinaries );
    alias PFN_vkDestroyPipelineBinaryKHR                                           = void      function( VkDevice device, VkPipelineBinaryKHR pipelineBinary, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetPipelineKeyKHR                                                  = VkResult  function( VkDevice device, const( VkPipelineCreateInfoKHR )* pPipelineCreateInfo, VkPipelineBinaryKeyKHR* pPipelineKey );
    alias PFN_vkGetPipelineBinaryDataKHR                                           = VkResult  function( VkDevice device, const( VkPipelineBinaryDataInfoKHR )* pInfo, VkPipelineBinaryKeyKHR* pPipelineBinaryKey, size_t* pPipelineBinaryDataSize, void* pPipelineBinaryData );
    alias PFN_vkReleaseCapturedPipelineDataKHR                                     = VkResult  function( VkDevice device, const( VkReleaseCapturedPipelineDataInfoKHR )* pInfo, const( VkAllocationCallbacks )* pAllocator );

    // VK_KHR_swapchain_maintenance1
    alias PFN_vkReleaseSwapchainImagesKHR                                          = VkResult  function( VkDevice device, const( VkReleaseSwapchainImagesInfoKHR )* pReleaseInfo );

    // VK_KHR_cooperative_matrix
    alias PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR                    = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkCooperativeMatrixPropertiesKHR* pProperties );

    // VK_KHR_calibrated_timestamps
    alias PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR                       = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pTimeDomainCount, VkTimeDomainKHR* pTimeDomains );
    alias PFN_vkGetCalibratedTimestampsKHR                                         = VkResult  function( VkDevice device, uint32_t timestampCount, const( VkCalibratedTimestampInfoKHR )* pTimestampInfos, uint64_t* pTimestamps, uint64_t* pMaxDeviation );

    // VK_KHR_maintenance6
    alias PFN_vkCmdSetDescriptorBufferOffsets2EXT                                  = void      function( VkCommandBuffer commandBuffer, const( VkSetDescriptorBufferOffsetsInfoEXT )* pSetDescriptorBufferOffsetsInfo );
    alias PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT                        = void      function( VkCommandBuffer commandBuffer, const( VkBindDescriptorBufferEmbeddedSamplersInfoEXT )* pBindDescriptorBufferEmbeddedSamplersInfo );

    // VK_KHR_copy_memory_indirect
    alias PFN_vkCmdCopyMemoryIndirectKHR                                           = void      function( VkCommandBuffer commandBuffer, const( VkCopyMemoryIndirectInfoKHR )* pCopyMemoryIndirectInfo );
    alias PFN_vkCmdCopyMemoryToImageIndirectKHR                                    = void      function( VkCommandBuffer commandBuffer, const( VkCopyMemoryToImageIndirectInfoKHR )* pCopyMemoryToImageIndirectInfo );

    // VK_KHR_device_fault
    alias PFN_vkGetDeviceFaultReportsKHR                                           = VkResult  function( VkDevice device, uint64_t timeout, uint32_t* pFaultCounts, VkDeviceFaultInfoKHR* pFaultInfo );
    alias PFN_vkGetDeviceFaultDebugInfoKHR                                         = VkResult  function( VkDevice device, VkDeviceFaultDebugInfoKHR* pDebugInfo );

    // VK_KHR_maintenance10
    alias PFN_vkCmdEndRendering2KHR                                                = void      function( VkCommandBuffer commandBuffer, const( VkRenderingEndInfoKHR )* pRenderingEndInfo );

    // VK_EXT_debug_report
    alias PFN_vkCreateDebugReportCallbackEXT                                       = VkResult  function( VkInstance instance, const( VkDebugReportCallbackCreateInfoEXT )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkDebugReportCallbackEXT* pCallback );
    alias PFN_vkDestroyDebugReportCallbackEXT                                      = void      function( VkInstance instance, VkDebugReportCallbackEXT callback, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkDebugReportMessageEXT                                              = void      function( VkInstance instance, VkDebugReportFlagsEXT flags, VkDebugReportObjectTypeEXT objectType, uint64_t object, size_t location, int32_t messageCode, const( char )* pLayerPrefix, const( char )* pMessage );

    // VK_EXT_debug_marker
    alias PFN_vkDebugMarkerSetObjectTagEXT                                         = VkResult  function( VkDevice device, const( VkDebugMarkerObjectTagInfoEXT )* pTagInfo );
    alias PFN_vkDebugMarkerSetObjectNameEXT                                        = VkResult  function( VkDevice device, const( VkDebugMarkerObjectNameInfoEXT )* pNameInfo );
    alias PFN_vkCmdDebugMarkerBeginEXT                                             = void      function( VkCommandBuffer commandBuffer, const( VkDebugMarkerMarkerInfoEXT )* pMarkerInfo );
    alias PFN_vkCmdDebugMarkerEndEXT                                               = void      function( VkCommandBuffer commandBuffer );
    alias PFN_vkCmdDebugMarkerInsertEXT                                            = void      function( VkCommandBuffer commandBuffer, const( VkDebugMarkerMarkerInfoEXT )* pMarkerInfo );

    // VK_EXT_transform_feedback
    alias PFN_vkCmdBindTransformFeedbackBuffersEXT                                 = void      function( VkCommandBuffer commandBuffer, uint32_t firstBinding, uint32_t bindingCount, const( VkBuffer )* pBuffers, const( VkDeviceSize )* pOffsets, const( VkDeviceSize )* pSizes );
    alias PFN_vkCmdBeginTransformFeedbackEXT                                       = void      function( VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, const( VkBuffer )* pCounterBuffers, const( VkDeviceSize )* pCounterBufferOffsets );
    alias PFN_vkCmdEndTransformFeedbackEXT                                         = void      function( VkCommandBuffer commandBuffer, uint32_t firstCounterBuffer, uint32_t counterBufferCount, const( VkBuffer )* pCounterBuffers, const( VkDeviceSize )* pCounterBufferOffsets );
    alias PFN_vkCmdBeginQueryIndexedEXT                                            = void      function( VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, VkQueryControlFlags flags, uint32_t index );
    alias PFN_vkCmdEndQueryIndexedEXT                                              = void      function( VkCommandBuffer commandBuffer, VkQueryPool queryPool, uint32_t query, uint32_t index );
    alias PFN_vkCmdDrawIndirectByteCountEXT                                        = void      function( VkCommandBuffer commandBuffer, uint32_t instanceCount, uint32_t firstInstance, VkBuffer counterBuffer, VkDeviceSize counterBufferOffset, uint32_t counterOffset, uint32_t vertexStride );

    // VK_NVX_binary_import
    alias PFN_vkCreateCuModuleNVX                                                  = VkResult  function( VkDevice device, const( VkCuModuleCreateInfoNVX )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkCuModuleNVX* pModule );
    alias PFN_vkCreateCuFunctionNVX                                                = VkResult  function( VkDevice device, const( VkCuFunctionCreateInfoNVX )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkCuFunctionNVX* pFunction );
    alias PFN_vkDestroyCuModuleNVX                                                 = void      function( VkDevice device, VkCuModuleNVX Module, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkDestroyCuFunctionNVX                                               = void      function( VkDevice device, VkCuFunctionNVX Function, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCmdCuLaunchKernelNVX                                               = void      function( VkCommandBuffer commandBuffer, const( VkCuLaunchInfoNVX )* pLaunchInfo );

    // VK_NVX_image_view_handle
    alias PFN_vkGetImageViewHandleNVX                                              = uint32_t  function( VkDevice device, const( VkImageViewHandleInfoNVX )* pInfo );
    alias PFN_vkGetImageViewHandle64NVX                                            = uint64_t  function( VkDevice device, const( VkImageViewHandleInfoNVX )* pInfo );
    alias PFN_vkGetImageViewAddressNVX                                             = VkResult  function( VkDevice device, VkImageView imageView, VkImageViewAddressPropertiesNVX* pProperties );
    alias PFN_vkGetDeviceCombinedImageSamplerIndexNVX                              = uint64_t  function( VkDevice device, uint64_t imageViewIndex, uint64_t samplerIndex );

    // VK_AMD_shader_info
    alias PFN_vkGetShaderInfoAMD                                                   = VkResult  function( VkDevice device, VkPipeline pipeline, VkShaderStageFlagBits shaderStage, VkShaderInfoTypeAMD infoType, size_t* pInfoSize, void* pInfo );

    // VK_NV_external_memory_capabilities
    alias PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV                   = VkResult  function( VkPhysicalDevice physicalDevice, VkFormat format, VkImageType type, VkImageTiling tiling, VkImageUsageFlags usage, VkImageCreateFlags flags, VkExternalMemoryHandleTypeFlagsNV externalHandleType, VkExternalImageFormatPropertiesNV* pExternalImageFormatProperties );

    // VK_EXT_conditional_rendering
    alias PFN_vkCmdBeginConditionalRenderingEXT                                    = void      function( VkCommandBuffer commandBuffer, const( VkConditionalRenderingBeginInfoEXT )* pConditionalRenderingBegin );
    alias PFN_vkCmdEndConditionalRenderingEXT                                      = void      function( VkCommandBuffer commandBuffer );

    // VK_NV_clip_space_w_scaling
    alias PFN_vkCmdSetViewportWScalingNV                                           = void      function( VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, const( VkViewportWScalingNV )* pViewportWScalings );

    // VK_EXT_direct_mode_display
    alias PFN_vkReleaseDisplayEXT                                                  = VkResult  function( VkPhysicalDevice physicalDevice, VkDisplayKHR display );

    // VK_EXT_display_surface_counter
    alias PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT                           = VkResult  function( VkPhysicalDevice physicalDevice, VkSurfaceKHR surface, VkSurfaceCapabilities2EXT* pSurfaceCapabilities );

    // VK_EXT_display_control
    alias PFN_vkDisplayPowerControlEXT                                             = VkResult  function( VkDevice device, VkDisplayKHR display, const( VkDisplayPowerInfoEXT )* pDisplayPowerInfo );
    alias PFN_vkRegisterDeviceEventEXT                                             = VkResult  function( VkDevice device, const( VkDeviceEventInfoEXT )* pDeviceEventInfo, const( VkAllocationCallbacks )* pAllocator, VkFence* pFence );
    alias PFN_vkRegisterDisplayEventEXT                                            = VkResult  function( VkDevice device, VkDisplayKHR display, const( VkDisplayEventInfoEXT )* pDisplayEventInfo, const( VkAllocationCallbacks )* pAllocator, VkFence* pFence );
    alias PFN_vkGetSwapchainCounterEXT                                             = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, VkSurfaceCounterFlagBitsEXT counter, uint64_t* pCounterValue );

    // VK_GOOGLE_display_timing
    alias PFN_vkGetRefreshCycleDurationGOOGLE                                      = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, VkRefreshCycleDurationGOOGLE* pDisplayTimingProperties );
    alias PFN_vkGetPastPresentationTimingGOOGLE                                    = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, uint32_t* pPresentationTimingCount, VkPastPresentationTimingGOOGLE* pPresentationTimings );

    // VK_EXT_discard_rectangles
    alias PFN_vkCmdSetDiscardRectangleEXT                                          = void      function( VkCommandBuffer commandBuffer, uint32_t firstDiscardRectangle, uint32_t discardRectangleCount, const( VkRect2D )* pDiscardRectangles );
    alias PFN_vkCmdSetDiscardRectangleEnableEXT                                    = void      function( VkCommandBuffer commandBuffer, VkBool32 discardRectangleEnable );
    alias PFN_vkCmdSetDiscardRectangleModeEXT                                      = void      function( VkCommandBuffer commandBuffer, VkDiscardRectangleModeEXT discardRectangleMode );

    // VK_EXT_hdr_metadata
    alias PFN_vkSetHdrMetadataEXT                                                  = void      function( VkDevice device, uint32_t swapchainCount, const( VkSwapchainKHR )* pSwapchains, const( VkHdrMetadataEXT )* pMetadata );

    // VK_EXT_debug_utils
    alias PFN_vkSetDebugUtilsObjectNameEXT                                         = VkResult  function( VkDevice device, const( VkDebugUtilsObjectNameInfoEXT )* pNameInfo );
    alias PFN_vkSetDebugUtilsObjectTagEXT                                          = VkResult  function( VkDevice device, const( VkDebugUtilsObjectTagInfoEXT )* pTagInfo );
    alias PFN_vkQueueBeginDebugUtilsLabelEXT                                       = void      function( VkQueue queue, const( VkDebugUtilsLabelEXT )* pLabelInfo );
    alias PFN_vkQueueEndDebugUtilsLabelEXT                                         = void      function( VkQueue queue );
    alias PFN_vkQueueInsertDebugUtilsLabelEXT                                      = void      function( VkQueue queue, const( VkDebugUtilsLabelEXT )* pLabelInfo );
    alias PFN_vkCmdBeginDebugUtilsLabelEXT                                         = void      function( VkCommandBuffer commandBuffer, const( VkDebugUtilsLabelEXT )* pLabelInfo );
    alias PFN_vkCmdEndDebugUtilsLabelEXT                                           = void      function( VkCommandBuffer commandBuffer );
    alias PFN_vkCmdInsertDebugUtilsLabelEXT                                        = void      function( VkCommandBuffer commandBuffer, const( VkDebugUtilsLabelEXT )* pLabelInfo );
    alias PFN_vkCreateDebugUtilsMessengerEXT                                       = VkResult  function( VkInstance instance, const( VkDebugUtilsMessengerCreateInfoEXT )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkDebugUtilsMessengerEXT* pMessenger );
    alias PFN_vkDestroyDebugUtilsMessengerEXT                                      = void      function( VkInstance instance, VkDebugUtilsMessengerEXT messenger, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkSubmitDebugUtilsMessageEXT                                         = void      function( VkInstance instance, VkDebugUtilsMessageSeverityFlagBitsEXT messageSeverity, VkDebugUtilsMessageTypeFlagsEXT messageTypes, const( VkDebugUtilsMessengerCallbackDataEXT )* pCallbackData );

    // VK_AMD_gpa_interface
    alias PFN_vkCreateGpaSessionAMD                                                = VkResult  function( VkDevice device, const( VkGpaSessionCreateInfoAMD )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkGpaSessionAMD* pGpaSession );
    alias PFN_vkDestroyGpaSessionAMD                                               = void      function( VkDevice device, VkGpaSessionAMD gpaSession, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkSetGpaDeviceClockModeAMD                                           = VkResult  function( VkDevice device, VkGpaDeviceClockModeInfoAMD* pInfo );
    alias PFN_vkGetGpaDeviceClockInfoAMD                                           = VkResult  function( VkDevice device, VkGpaDeviceGetClockInfoAMD* pInfo );
    alias PFN_vkCmdBeginGpaSessionAMD                                              = VkResult  function( VkCommandBuffer commandBuffer, VkGpaSessionAMD gpaSession );
    alias PFN_vkCmdEndGpaSessionAMD                                                = VkResult  function( VkCommandBuffer commandBuffer, VkGpaSessionAMD gpaSession );
    alias PFN_vkCmdBeginGpaSampleAMD                                               = VkResult  function( VkCommandBuffer commandBuffer, VkGpaSessionAMD gpaSession, const( VkGpaSampleBeginInfoAMD )* pGpaSampleBeginInfo, uint32_t* pSampleID );
    alias PFN_vkCmdEndGpaSampleAMD                                                 = void      function( VkCommandBuffer commandBuffer, VkGpaSessionAMD gpaSession, uint32_t sampleID );
    alias PFN_vkGetGpaSessionStatusAMD                                             = VkResult  function( VkDevice device, VkGpaSessionAMD gpaSession );
    alias PFN_vkGetGpaSessionResultsAMD                                            = VkResult  function( VkDevice device, VkGpaSessionAMD gpaSession, uint32_t sampleID, size_t* pSizeInBytes, void* pData );
    alias PFN_vkResetGpaSessionAMD                                                 = VkResult  function( VkDevice device, VkGpaSessionAMD gpaSession );
    alias PFN_vkCmdCopyGpaSessionResultsAMD                                        = void      function( VkCommandBuffer commandBuffer, VkGpaSessionAMD gpaSession );

    // VK_EXT_descriptor_heap
    alias PFN_vkWriteSamplerDescriptorsEXT                                         = VkResult  function( VkDevice device, uint32_t samplerCount, const( VkSamplerCreateInfo )* pSamplers, const( VkHostAddressRangeEXT )* pDescriptors );
    alias PFN_vkWriteResourceDescriptorsEXT                                        = VkResult  function( VkDevice device, uint32_t resourceCount, const( VkResourceDescriptorInfoEXT )* pResources, const( VkHostAddressRangeEXT )* pDescriptors );
    alias PFN_vkCmdBindSamplerHeapEXT                                              = void      function( VkCommandBuffer commandBuffer, const( VkBindHeapInfoEXT )* pBindInfo );
    alias PFN_vkCmdBindResourceHeapEXT                                             = void      function( VkCommandBuffer commandBuffer, const( VkBindHeapInfoEXT )* pBindInfo );
    alias PFN_vkCmdPushDataEXT                                                     = void      function( VkCommandBuffer commandBuffer, const( VkPushDataInfoEXT )* pPushDataInfo );
    alias PFN_vkGetImageOpaqueCaptureDataEXT                                       = VkResult  function( VkDevice device, uint32_t imageCount, const( VkImage )* pImages, VkHostAddressRangeEXT* pDatas );
    alias PFN_vkGetPhysicalDeviceDescriptorSizeEXT                                 = VkDeviceSize  function( VkPhysicalDevice physicalDevice, VkDescriptorType descriptorType );
    alias PFN_vkRegisterCustomBorderColorEXT                                       = VkResult  function( VkDevice device, const( VkSamplerCustomBorderColorCreateInfoEXT )* pBorderColor, VkBool32 requestIndex, uint32_t* pIndex );
    alias PFN_vkUnregisterCustomBorderColorEXT                                     = void      function( VkDevice device, uint32_t index );
    alias PFN_vkGetTensorOpaqueCaptureDataARM                                      = VkResult  function( VkDevice device, uint32_t tensorCount, const( VkTensorARM )* pTensors, VkHostAddressRangeEXT* pDatas );

    // VK_EXT_sample_locations
    alias PFN_vkCmdSetSampleLocationsEXT                                           = void      function( VkCommandBuffer commandBuffer, const( VkSampleLocationsInfoEXT )* pSampleLocationsInfo );
    alias PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT                          = void      function( VkPhysicalDevice physicalDevice, VkSampleCountFlagBits samples, VkMultisamplePropertiesEXT* pMultisampleProperties );

    // VK_EXT_image_drm_format_modifier
    alias PFN_vkGetImageDrmFormatModifierPropertiesEXT                             = VkResult  function( VkDevice device, VkImage image, VkImageDrmFormatModifierPropertiesEXT* pProperties );

    // VK_EXT_validation_cache
    alias PFN_vkCreateValidationCacheEXT                                           = VkResult  function( VkDevice device, const( VkValidationCacheCreateInfoEXT )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkValidationCacheEXT* pValidationCache );
    alias PFN_vkDestroyValidationCacheEXT                                          = void      function( VkDevice device, VkValidationCacheEXT validationCache, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkMergeValidationCachesEXT                                           = VkResult  function( VkDevice device, VkValidationCacheEXT dstCache, uint32_t srcCacheCount, const( VkValidationCacheEXT )* pSrcCaches );
    alias PFN_vkGetValidationCacheDataEXT                                          = VkResult  function( VkDevice device, VkValidationCacheEXT validationCache, size_t* pDataSize, void* pData );

    // VK_NV_shading_rate_image
    alias PFN_vkCmdBindShadingRateImageNV                                          = void      function( VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout );
    alias PFN_vkCmdSetViewportShadingRatePaletteNV                                 = void      function( VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, const( VkShadingRatePaletteNV )* pShadingRatePalettes );
    alias PFN_vkCmdSetCoarseSampleOrderNV                                          = void      function( VkCommandBuffer commandBuffer, VkCoarseSampleOrderTypeNV sampleOrderType, uint32_t customSampleOrderCount, const( VkCoarseSampleOrderCustomNV )* pCustomSampleOrders );

    // VK_NV_ray_tracing
    alias PFN_vkCreateAccelerationStructureNV                                      = VkResult  function( VkDevice device, const( VkAccelerationStructureCreateInfoNV )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkAccelerationStructureNV* pAccelerationStructure );
    alias PFN_vkDestroyAccelerationStructureNV                                     = void      function( VkDevice device, VkAccelerationStructureNV accelerationStructure, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetAccelerationStructureMemoryRequirementsNV                       = void      function( VkDevice device, const( VkAccelerationStructureMemoryRequirementsInfoNV )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkBindAccelerationStructureMemoryNV                                  = VkResult  function( VkDevice device, uint32_t bindInfoCount, const( VkBindAccelerationStructureMemoryInfoNV )* pBindInfos );
    alias PFN_vkCmdBuildAccelerationStructureNV                                    = void      function( VkCommandBuffer commandBuffer, const( VkAccelerationStructureInfoNV )* pInfo, VkBuffer instanceData, VkDeviceSize instanceOffset, VkBool32 update, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkBuffer scratch, VkDeviceSize scratchOffset );
    alias PFN_vkCmdCopyAccelerationStructureNV                                     = void      function( VkCommandBuffer commandBuffer, VkAccelerationStructureNV dst, VkAccelerationStructureNV src, VkCopyAccelerationStructureModeKHR mode );
    alias PFN_vkCmdTraceRaysNV                                                     = void      function( VkCommandBuffer commandBuffer, VkBuffer raygenShaderBindingTableBuffer, VkDeviceSize raygenShaderBindingOffset, VkBuffer missShaderBindingTableBuffer, VkDeviceSize missShaderBindingOffset, VkDeviceSize missShaderBindingStride, VkBuffer hitShaderBindingTableBuffer, VkDeviceSize hitShaderBindingOffset, VkDeviceSize hitShaderBindingStride, VkBuffer callableShaderBindingTableBuffer, VkDeviceSize callableShaderBindingOffset, VkDeviceSize callableShaderBindingStride, uint32_t width, uint32_t height, uint32_t depth );
    alias PFN_vkCreateRayTracingPipelinesNV                                        = VkResult  function( VkDevice device, VkPipelineCache pipelineCache, uint32_t createInfoCount, const( VkRayTracingPipelineCreateInfoNV )* pCreateInfos, const( VkAllocationCallbacks )* pAllocator, VkPipeline* pPipelines );
    alias PFN_vkGetRayTracingShaderGroupHandlesKHR                                 = VkResult  function( VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData );
    alias PFN_vkGetAccelerationStructureHandleNV                                   = VkResult  function( VkDevice device, VkAccelerationStructureNV accelerationStructure, size_t dataSize, void* pData );
    alias PFN_vkCmdWriteAccelerationStructuresPropertiesNV                         = void      function( VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, const( VkAccelerationStructureNV )* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery );
    alias PFN_vkCompileDeferredNV                                                  = VkResult  function( VkDevice device, VkPipeline pipeline, uint32_t shader );

    // VK_EXT_external_memory_host
    alias PFN_vkGetMemoryHostPointerPropertiesEXT                                  = VkResult  function( VkDevice device, VkExternalMemoryHandleTypeFlagBits handleType, const( void )* pHostPointer, VkMemoryHostPointerPropertiesEXT* pMemoryHostPointerProperties );

    // VK_AMD_buffer_marker
    alias PFN_vkCmdWriteBufferMarkerAMD                                            = void      function( VkCommandBuffer commandBuffer, VkPipelineStageFlagBits pipelineStage, VkBuffer dstBuffer, VkDeviceSize dstOffset, uint32_t marker );
    alias PFN_vkCmdWriteBufferMarker2AMD                                           = void      function( VkCommandBuffer commandBuffer, VkPipelineStageFlags2 stage, VkBuffer dstBuffer, VkDeviceSize dstOffset, uint32_t marker );

    // VK_NV_mesh_shader
    alias PFN_vkCmdDrawMeshTasksNV                                                 = void      function( VkCommandBuffer commandBuffer, uint32_t taskCount, uint32_t firstTask );
    alias PFN_vkCmdDrawMeshTasksIndirectNV                                         = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride );
    alias PFN_vkCmdDrawMeshTasksIndirectCountNV                                    = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride );

    // VK_NV_scissor_exclusive
    alias PFN_vkCmdSetExclusiveScissorEnableNV                                     = void      function( VkCommandBuffer commandBuffer, uint32_t firstExclusiveScissor, uint32_t exclusiveScissorCount, const( VkBool32 )* pExclusiveScissorEnables );
    alias PFN_vkCmdSetExclusiveScissorNV                                           = void      function( VkCommandBuffer commandBuffer, uint32_t firstExclusiveScissor, uint32_t exclusiveScissorCount, const( VkRect2D )* pExclusiveScissors );

    // VK_NV_device_diagnostic_checkpoints
    alias PFN_vkCmdSetCheckpointNV                                                 = void      function( VkCommandBuffer commandBuffer, const( void )* pCheckpointMarker );
    alias PFN_vkGetQueueCheckpointDataNV                                           = void      function( VkQueue queue, uint32_t* pCheckpointDataCount, VkCheckpointDataNV* pCheckpointData );
    alias PFN_vkGetQueueCheckpointData2NV                                          = void      function( VkQueue queue, uint32_t* pCheckpointDataCount, VkCheckpointData2NV* pCheckpointData );

    // VK_EXT_present_timing
    alias PFN_vkSetSwapchainPresentTimingQueueSizeEXT                              = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, uint32_t size );
    alias PFN_vkGetSwapchainTimingPropertiesEXT                                    = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, VkSwapchainTimingPropertiesEXT* pSwapchainTimingProperties, uint64_t* pSwapchainTimingPropertiesCounter );
    alias PFN_vkGetSwapchainTimeDomainPropertiesEXT                                = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, VkSwapchainTimeDomainPropertiesEXT* pSwapchainTimeDomainProperties, uint64_t* pTimeDomainsCounter );
    alias PFN_vkGetPastPresentationTimingEXT                                       = VkResult  function( VkDevice device, const( VkPastPresentationTimingInfoEXT )* pPastPresentationTimingInfo, VkPastPresentationTimingPropertiesEXT* pPastPresentationTimingProperties );

    // VK_INTEL_performance_query
    alias PFN_vkInitializePerformanceApiINTEL                                      = VkResult  function( VkDevice device, const( VkInitializePerformanceApiInfoINTEL )* pInitializeInfo );
    alias PFN_vkUninitializePerformanceApiINTEL                                    = void      function( VkDevice device );
    alias PFN_vkCmdSetPerformanceMarkerINTEL                                       = VkResult  function( VkCommandBuffer commandBuffer, const( VkPerformanceMarkerInfoINTEL )* pMarkerInfo );
    alias PFN_vkCmdSetPerformanceStreamMarkerINTEL                                 = VkResult  function( VkCommandBuffer commandBuffer, const( VkPerformanceStreamMarkerInfoINTEL )* pMarkerInfo );
    alias PFN_vkCmdSetPerformanceOverrideINTEL                                     = VkResult  function( VkCommandBuffer commandBuffer, const( VkPerformanceOverrideInfoINTEL )* pOverrideInfo );
    alias PFN_vkAcquirePerformanceConfigurationINTEL                               = VkResult  function( VkDevice device, const( VkPerformanceConfigurationAcquireInfoINTEL )* pAcquireInfo, VkPerformanceConfigurationINTEL* pConfiguration );
    alias PFN_vkReleasePerformanceConfigurationINTEL                               = VkResult  function( VkDevice device, VkPerformanceConfigurationINTEL configuration );
    alias PFN_vkQueueSetPerformanceConfigurationINTEL                              = VkResult  function( VkQueue queue, VkPerformanceConfigurationINTEL configuration );
    alias PFN_vkGetPerformanceParameterINTEL                                       = VkResult  function( VkDevice device, VkPerformanceParameterTypeINTEL parameter, VkPerformanceValueINTEL* pValue );

    // VK_AMD_display_native_hdr
    alias PFN_vkSetLocalDimmingAMD                                                 = void      function( VkDevice device, VkSwapchainKHR swapChain, VkBool32 localDimmingEnable );

    // VK_NV_cooperative_matrix
    alias PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV                     = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkCooperativeMatrixPropertiesNV* pProperties );

    // VK_NV_coverage_reduction_mode
    alias PFN_vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV    = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pCombinationCount, VkFramebufferMixedSamplesCombinationNV* pCombinations );

    // VK_EXT_headless_surface
    alias PFN_vkCreateHeadlessSurfaceEXT                                           = VkResult  function( VkInstance instance, const( VkHeadlessSurfaceCreateInfoEXT )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkSurfaceKHR* pSurface );

    // VK_NV_device_generated_commands
    alias PFN_vkGetGeneratedCommandsMemoryRequirementsNV                           = void      function( VkDevice device, const( VkGeneratedCommandsMemoryRequirementsInfoNV )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkCmdPreprocessGeneratedCommandsNV                                   = void      function( VkCommandBuffer commandBuffer, const( VkGeneratedCommandsInfoNV )* pGeneratedCommandsInfo );
    alias PFN_vkCmdExecuteGeneratedCommandsNV                                      = void      function( VkCommandBuffer commandBuffer, VkBool32 isPreprocessed, const( VkGeneratedCommandsInfoNV )* pGeneratedCommandsInfo );
    alias PFN_vkCmdBindPipelineShaderGroupNV                                       = void      function( VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline, uint32_t groupIndex );
    alias PFN_vkCreateIndirectCommandsLayoutNV                                     = VkResult  function( VkDevice device, const( VkIndirectCommandsLayoutCreateInfoNV )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkIndirectCommandsLayoutNV* pIndirectCommandsLayout );
    alias PFN_vkDestroyIndirectCommandsLayoutNV                                    = void      function( VkDevice device, VkIndirectCommandsLayoutNV indirectCommandsLayout, const( VkAllocationCallbacks )* pAllocator );

    // VK_EXT_depth_bias_control
    alias PFN_vkCmdSetDepthBias2EXT                                                = void      function( VkCommandBuffer commandBuffer, const( VkDepthBiasInfoEXT )* pDepthBiasInfo );

    // VK_EXT_acquire_drm_display
    alias PFN_vkAcquireDrmDisplayEXT                                               = VkResult  function( VkPhysicalDevice physicalDevice, int32_t drmFd, VkDisplayKHR display );
    alias PFN_vkGetDrmDisplayEXT                                                   = VkResult  function( VkPhysicalDevice physicalDevice, int32_t drmFd, uint32_t connectorId, VkDisplayKHR* display );

    // VK_QCOM_queue_perf_hint
    alias PFN_vkQueueSetPerfHintQCOM                                               = VkResult  function( VkQueue queue, const( VkPerfHintInfoQCOM )* pPerfHintInfo );

    // VK_QCOM_tile_shading
    alias PFN_vkCmdDispatchTileQCOM                                                = void      function( VkCommandBuffer commandBuffer, const( VkDispatchTileInfoQCOM )* pDispatchTileInfo );
    alias PFN_vkCmdBeginPerTileExecutionQCOM                                       = void      function( VkCommandBuffer commandBuffer, const( VkPerTileBeginInfoQCOM )* pPerTileBeginInfo );
    alias PFN_vkCmdEndPerTileExecutionQCOM                                         = void      function( VkCommandBuffer commandBuffer, const( VkPerTileEndInfoQCOM )* pPerTileEndInfo );

    // VK_NV_low_latency
    alias PFN_vkSetLatencySleepModeLegacyNV                                        = void      function( VkDevice device, VkBool32 lowLatencyMode, VkBool32 lowLatencyBoost, uint32_t minimumIntervalUs );
    alias PFN_vkLatencySleepLegacyNV                                               = void      function( VkDevice device, VkSemaphore signalSemaphore, uint64_t value );
    alias PFN_vkSetLatencyMarkerLegacyNV                                           = void      function( VkDevice device, uint64_t frameID, uint32_t marker );
    alias PFN_vkGetLatencyTimingsLegacyNV                                          = void      function( VkDevice device, void* pTimings );
    alias PFN_vkQueueNotifyOutOfBandLegacyNV                                       = void      function( VkQueue queue, uint32_t queueType );
    alias PFN_vkGetSleepStatusLegacyNV                                             = void      function( VkDevice device, VkBool32* pLowLatencyMode );
    alias PFN_vkShutdownLatencyDeviceLegacyNV                                      = void      function( VkDevice device );

    // VK_EXT_descriptor_buffer
    alias PFN_vkGetDescriptorSetLayoutSizeEXT                                      = void      function( VkDevice device, VkDescriptorSetLayout layout, VkDeviceSize* pLayoutSizeInBytes );
    alias PFN_vkGetDescriptorSetLayoutBindingOffsetEXT                             = void      function( VkDevice device, VkDescriptorSetLayout layout, uint32_t binding, VkDeviceSize* pOffset );
    alias PFN_vkGetDescriptorEXT                                                   = void      function( VkDevice device, const( VkDescriptorGetInfoEXT )* pDescriptorInfo, size_t dataSize, void* pDescriptor );
    alias PFN_vkCmdBindDescriptorBuffersEXT                                        = void      function( VkCommandBuffer commandBuffer, uint32_t bufferCount, const( VkDescriptorBufferBindingInfoEXT )* pBindingInfos );
    alias PFN_vkCmdSetDescriptorBufferOffsetsEXT                                   = void      function( VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t firstSet, uint32_t setCount, const( uint32_t )* pBufferIndices, const( VkDeviceSize )* pOffsets );
    alias PFN_vkCmdBindDescriptorBufferEmbeddedSamplersEXT                         = void      function( VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipelineLayout layout, uint32_t set );
    alias PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT                            = VkResult  function( VkDevice device, const( VkBufferCaptureDescriptorDataInfoEXT )* pInfo, void* pData );
    alias PFN_vkGetImageOpaqueCaptureDescriptorDataEXT                             = VkResult  function( VkDevice device, const( VkImageCaptureDescriptorDataInfoEXT )* pInfo, void* pData );
    alias PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT                         = VkResult  function( VkDevice device, const( VkImageViewCaptureDescriptorDataInfoEXT )* pInfo, void* pData );
    alias PFN_vkGetSamplerOpaqueCaptureDescriptorDataEXT                           = VkResult  function( VkDevice device, const( VkSamplerCaptureDescriptorDataInfoEXT )* pInfo, void* pData );
    alias PFN_vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT             = VkResult  function( VkDevice device, const( VkAccelerationStructureCaptureDescriptorDataInfoEXT )* pInfo, void* pData );

    // VK_NV_fragment_shading_rate_enums
    alias PFN_vkCmdSetFragmentShadingRateEnumNV                                    = void      function( VkCommandBuffer commandBuffer, VkFragmentShadingRateNV shadingRate, const( VkFragmentShadingRateCombinerOpKHR )* combinerOps );

    // VK_EXT_device_fault
    alias PFN_vkGetDeviceFaultInfoEXT                                              = VkResult  function( VkDevice device, VkDeviceFaultCountsEXT* pFaultCounts, VkDeviceFaultInfoEXT* pFaultInfo );

    // VK_EXT_vertex_input_dynamic_state
    alias PFN_vkCmdSetVertexInputEXT                                               = void      function( VkCommandBuffer commandBuffer, uint32_t vertexBindingDescriptionCount, const( VkVertexInputBindingDescription2EXT )* pVertexBindingDescriptions, uint32_t vertexAttributeDescriptionCount, const( VkVertexInputAttributeDescription2EXT )* pVertexAttributeDescriptions );

    // VK_HUAWEI_subpass_shading
    alias PFN_vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI                      = VkResult  function( VkDevice device, VkRenderPass renderpass, VkExtent2D* pMaxWorkgroupSize );
    alias PFN_vkCmdSubpassShadingHUAWEI                                            = void      function( VkCommandBuffer commandBuffer );

    // VK_HUAWEI_invocation_mask
    alias PFN_vkCmdBindInvocationMaskHUAWEI                                        = void      function( VkCommandBuffer commandBuffer, VkImageView imageView, VkImageLayout imageLayout );

    // VK_NV_external_memory_rdma
    alias PFN_vkGetMemoryRemoteAddressNV                                           = VkResult  function( VkDevice device, const( VkMemoryGetRemoteAddressInfoNV )* pMemoryGetRemoteAddressInfo, VkRemoteAddressNV* pAddress );

    // VK_EXT_pipeline_properties
    alias PFN_vkGetPipelinePropertiesEXT                                           = VkResult  function( VkDevice device, const( VkPipelineInfoKHR )* pPipelineInfo, VkBaseOutStructure* pPipelineProperties );

    // VK_EXT_extended_dynamic_state2
    alias PFN_vkCmdSetPatchControlPointsEXT                                        = void      function( VkCommandBuffer commandBuffer, uint32_t patchControlPoints );
    alias PFN_vkCmdSetLogicOpEXT                                                   = void      function( VkCommandBuffer commandBuffer, VkLogicOp logicOp );

    // VK_EXT_color_write_enable
    alias PFN_vkCmdSetColorWriteEnableEXT                                          = void      function( VkCommandBuffer commandBuffer, uint32_t attachmentCount, const( VkBool32 )* pColorWriteEnables );

    // VK_EXT_multi_draw
    alias PFN_vkCmdDrawMultiEXT                                                    = void      function( VkCommandBuffer commandBuffer, uint32_t drawCount, const( VkMultiDrawInfoEXT )* pVertexInfo, uint32_t instanceCount, uint32_t firstInstance, uint32_t stride );
    alias PFN_vkCmdDrawMultiIndexedEXT                                             = void      function( VkCommandBuffer commandBuffer, uint32_t drawCount, const( VkMultiDrawIndexedInfoEXT )* pIndexInfo, uint32_t instanceCount, uint32_t firstInstance, uint32_t stride, const( int32_t )* pVertexOffset );

    // VK_EXT_opacity_micromap
    alias PFN_vkCreateMicromapEXT                                                  = VkResult  function( VkDevice device, const( VkMicromapCreateInfoEXT )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkMicromapEXT* pMicromap );
    alias PFN_vkDestroyMicromapEXT                                                 = void      function( VkDevice device, VkMicromapEXT micromap, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCmdBuildMicromapsEXT                                               = void      function( VkCommandBuffer commandBuffer, uint32_t infoCount, const( VkMicromapBuildInfoEXT )* pInfos );
    alias PFN_vkBuildMicromapsEXT                                                  = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, uint32_t infoCount, const( VkMicromapBuildInfoEXT )* pInfos );
    alias PFN_vkCopyMicromapEXT                                                    = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, const( VkCopyMicromapInfoEXT )* pInfo );
    alias PFN_vkCopyMicromapToMemoryEXT                                            = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, const( VkCopyMicromapToMemoryInfoEXT )* pInfo );
    alias PFN_vkCopyMemoryToMicromapEXT                                            = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, const( VkCopyMemoryToMicromapInfoEXT )* pInfo );
    alias PFN_vkWriteMicromapsPropertiesEXT                                        = VkResult  function( VkDevice device, uint32_t micromapCount, const( VkMicromapEXT )* pMicromaps, VkQueryType queryType, size_t dataSize, void* pData, size_t stride );
    alias PFN_vkCmdCopyMicromapEXT                                                 = void      function( VkCommandBuffer commandBuffer, const( VkCopyMicromapInfoEXT )* pInfo );
    alias PFN_vkCmdCopyMicromapToMemoryEXT                                         = void      function( VkCommandBuffer commandBuffer, const( VkCopyMicromapToMemoryInfoEXT )* pInfo );
    alias PFN_vkCmdCopyMemoryToMicromapEXT                                         = void      function( VkCommandBuffer commandBuffer, const( VkCopyMemoryToMicromapInfoEXT )* pInfo );
    alias PFN_vkCmdWriteMicromapsPropertiesEXT                                     = void      function( VkCommandBuffer commandBuffer, uint32_t micromapCount, const( VkMicromapEXT )* pMicromaps, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery );
    alias PFN_vkGetDeviceMicromapCompatibilityEXT                                  = void      function( VkDevice device, const( VkMicromapVersionInfoEXT )* pVersionInfo, VkAccelerationStructureCompatibilityKHR* pCompatibility );
    alias PFN_vkGetMicromapBuildSizesEXT                                           = void      function( VkDevice device, VkAccelerationStructureBuildTypeKHR buildType, const( VkMicromapBuildInfoEXT )* pBuildInfo, VkMicromapBuildSizesInfoEXT* pSizeInfo );

    // VK_HUAWEI_cluster_culling_shader
    alias PFN_vkCmdDrawClusterHUAWEI                                               = void      function( VkCommandBuffer commandBuffer, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ );
    alias PFN_vkCmdDrawClusterIndirectHUAWEI                                       = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset );

    // VK_EXT_pageable_device_local_memory
    alias PFN_vkSetDeviceMemoryPriorityEXT                                         = void      function( VkDevice device, VkDeviceMemory memory, float priority );

    // VK_ARM_scheduling_controls
    alias PFN_vkCmdSetDispatchParametersARM                                        = void      function( VkCommandBuffer commandBuffer, const( VkDispatchParametersARM )* pDispatchParameters );

    // VK_VALVE_descriptor_set_host_mapping
    alias PFN_vkGetDescriptorSetLayoutHostMappingInfoVALVE                         = void      function( VkDevice device, const( VkDescriptorSetBindingReferenceVALVE )* pBindingReference, VkDescriptorSetLayoutHostMappingInfoVALVE* pHostMapping );
    alias PFN_vkGetDescriptorSetHostMappingVALVE                                   = void      function( VkDevice device, VkDescriptorSet descriptorSet, void** ppData );

    // VK_NV_copy_memory_indirect
    alias PFN_vkCmdCopyMemoryIndirectNV                                            = void      function( VkCommandBuffer commandBuffer, VkDeviceAddress copyBufferAddress, uint32_t copyCount, uint32_t stride );
    alias PFN_vkCmdCopyMemoryToImageIndirectNV                                     = void      function( VkCommandBuffer commandBuffer, VkDeviceAddress copyBufferAddress, uint32_t copyCount, uint32_t stride, VkImage dstImage, VkImageLayout dstImageLayout, const( VkImageSubresourceLayers )* pImageSubresources );

    // VK_NV_memory_decompression
    alias PFN_vkCmdDecompressMemoryNV                                              = void      function( VkCommandBuffer commandBuffer, uint32_t decompressRegionCount, const( VkDecompressMemoryRegionNV )* pDecompressMemoryRegions );
    alias PFN_vkCmdDecompressMemoryIndirectCountNV                                 = void      function( VkCommandBuffer commandBuffer, VkDeviceAddress indirectCommandsAddress, VkDeviceAddress indirectCommandsCountAddress, uint32_t stride );

    // VK_NV_device_generated_commands_compute
    alias PFN_vkGetPipelineIndirectMemoryRequirementsNV                            = void      function( VkDevice device, const( VkComputePipelineCreateInfo )* pCreateInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkCmdUpdatePipelineIndirectBufferNV                                  = void      function( VkCommandBuffer commandBuffer, VkPipelineBindPoint pipelineBindPoint, VkPipeline pipeline );
    alias PFN_vkGetPipelineIndirectDeviceAddressNV                                 = VkDeviceAddress  function( VkDevice device, const( VkPipelineIndirectDeviceAddressInfoNV )* pInfo );

    // VK_EXT_extended_dynamic_state3
    alias PFN_vkCmdSetDepthClampEnableEXT                                          = void      function( VkCommandBuffer commandBuffer, VkBool32 depthClampEnable );
    alias PFN_vkCmdSetPolygonModeEXT                                               = void      function( VkCommandBuffer commandBuffer, VkPolygonMode polygonMode );
    alias PFN_vkCmdSetRasterizationSamplesEXT                                      = void      function( VkCommandBuffer commandBuffer, VkSampleCountFlagBits rasterizationSamples );
    alias PFN_vkCmdSetSampleMaskEXT                                                = void      function( VkCommandBuffer commandBuffer, VkSampleCountFlagBits samples, const( VkSampleMask )* pSampleMask );
    alias PFN_vkCmdSetAlphaToCoverageEnableEXT                                     = void      function( VkCommandBuffer commandBuffer, VkBool32 alphaToCoverageEnable );
    alias PFN_vkCmdSetAlphaToOneEnableEXT                                          = void      function( VkCommandBuffer commandBuffer, VkBool32 alphaToOneEnable );
    alias PFN_vkCmdSetLogicOpEnableEXT                                             = void      function( VkCommandBuffer commandBuffer, VkBool32 logicOpEnable );
    alias PFN_vkCmdSetColorBlendEnableEXT                                          = void      function( VkCommandBuffer commandBuffer, uint32_t firstAttachment, uint32_t attachmentCount, const( VkBool32 )* pColorBlendEnables );
    alias PFN_vkCmdSetColorBlendEquationEXT                                        = void      function( VkCommandBuffer commandBuffer, uint32_t firstAttachment, uint32_t attachmentCount, const( VkColorBlendEquationEXT )* pColorBlendEquations );
    alias PFN_vkCmdSetColorWriteMaskEXT                                            = void      function( VkCommandBuffer commandBuffer, uint32_t firstAttachment, uint32_t attachmentCount, const( VkColorComponentFlags )* pColorWriteMasks );
    alias PFN_vkCmdSetTessellationDomainOriginEXT                                  = void      function( VkCommandBuffer commandBuffer, VkTessellationDomainOrigin domainOrigin );
    alias PFN_vkCmdSetRasterizationStreamEXT                                       = void      function( VkCommandBuffer commandBuffer, uint32_t rasterizationStream );
    alias PFN_vkCmdSetConservativeRasterizationModeEXT                             = void      function( VkCommandBuffer commandBuffer, VkConservativeRasterizationModeEXT conservativeRasterizationMode );
    alias PFN_vkCmdSetExtraPrimitiveOverestimationSizeEXT                          = void      function( VkCommandBuffer commandBuffer, float extraPrimitiveOverestimationSize );
    alias PFN_vkCmdSetDepthClipEnableEXT                                           = void      function( VkCommandBuffer commandBuffer, VkBool32 depthClipEnable );
    alias PFN_vkCmdSetSampleLocationsEnableEXT                                     = void      function( VkCommandBuffer commandBuffer, VkBool32 sampleLocationsEnable );
    alias PFN_vkCmdSetColorBlendAdvancedEXT                                        = void      function( VkCommandBuffer commandBuffer, uint32_t firstAttachment, uint32_t attachmentCount, const( VkColorBlendAdvancedEXT )* pColorBlendAdvanced );
    alias PFN_vkCmdSetProvokingVertexModeEXT                                       = void      function( VkCommandBuffer commandBuffer, VkProvokingVertexModeEXT provokingVertexMode );
    alias PFN_vkCmdSetLineRasterizationModeEXT                                     = void      function( VkCommandBuffer commandBuffer, VkLineRasterizationModeEXT lineRasterizationMode );
    alias PFN_vkCmdSetLineStippleEnableEXT                                         = void      function( VkCommandBuffer commandBuffer, VkBool32 stippledLineEnable );
    alias PFN_vkCmdSetDepthClipNegativeOneToOneEXT                                 = void      function( VkCommandBuffer commandBuffer, VkBool32 negativeOneToOne );
    alias PFN_vkCmdSetViewportWScalingEnableNV                                     = void      function( VkCommandBuffer commandBuffer, VkBool32 viewportWScalingEnable );
    alias PFN_vkCmdSetViewportSwizzleNV                                            = void      function( VkCommandBuffer commandBuffer, uint32_t firstViewport, uint32_t viewportCount, const( VkViewportSwizzleNV )* pViewportSwizzles );
    alias PFN_vkCmdSetCoverageToColorEnableNV                                      = void      function( VkCommandBuffer commandBuffer, VkBool32 coverageToColorEnable );
    alias PFN_vkCmdSetCoverageToColorLocationNV                                    = void      function( VkCommandBuffer commandBuffer, uint32_t coverageToColorLocation );
    alias PFN_vkCmdSetCoverageModulationModeNV                                     = void      function( VkCommandBuffer commandBuffer, VkCoverageModulationModeNV coverageModulationMode );
    alias PFN_vkCmdSetCoverageModulationTableEnableNV                              = void      function( VkCommandBuffer commandBuffer, VkBool32 coverageModulationTableEnable );
    alias PFN_vkCmdSetCoverageModulationTableNV                                    = void      function( VkCommandBuffer commandBuffer, uint32_t coverageModulationTableCount, const( float )* pCoverageModulationTable );
    alias PFN_vkCmdSetShadingRateImageEnableNV                                     = void      function( VkCommandBuffer commandBuffer, VkBool32 shadingRateImageEnable );
    alias PFN_vkCmdSetRepresentativeFragmentTestEnableNV                           = void      function( VkCommandBuffer commandBuffer, VkBool32 representativeFragmentTestEnable );
    alias PFN_vkCmdSetCoverageReductionModeNV                                      = void      function( VkCommandBuffer commandBuffer, VkCoverageReductionModeNV coverageReductionMode );

    // VK_ARM_tensors
    alias PFN_vkCreateTensorARM                                                    = VkResult  function( VkDevice device, const( VkTensorCreateInfoARM )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkTensorARM* pTensor );
    alias PFN_vkDestroyTensorARM                                                   = void      function( VkDevice device, VkTensorARM tensor, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateTensorViewARM                                                = VkResult  function( VkDevice device, const( VkTensorViewCreateInfoARM )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkTensorViewARM* pView );
    alias PFN_vkDestroyTensorViewARM                                               = void      function( VkDevice device, VkTensorViewARM tensorView, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetTensorMemoryRequirementsARM                                     = void      function( VkDevice device, const( VkTensorMemoryRequirementsInfoARM )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkBindTensorMemoryARM                                                = VkResult  function( VkDevice device, uint32_t bindInfoCount, const( VkBindTensorMemoryInfoARM )* pBindInfos );
    alias PFN_vkGetDeviceTensorMemoryRequirementsARM                               = void      function( VkDevice device, const( VkDeviceTensorMemoryRequirementsARM )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkCmdCopyTensorARM                                                   = void      function( VkCommandBuffer commandBuffer, const( VkCopyTensorInfoARM )* pCopyTensorInfo );
    alias PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM                       = void      function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceExternalTensorInfoARM )* pExternalTensorInfo, VkExternalTensorPropertiesARM* pExternalTensorProperties );
    alias PFN_vkGetTensorOpaqueCaptureDescriptorDataARM                            = VkResult  function( VkDevice device, const( VkTensorCaptureDescriptorDataInfoARM )* pInfo, void* pData );
    alias PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM                        = VkResult  function( VkDevice device, const( VkTensorViewCaptureDescriptorDataInfoARM )* pInfo, void* pData );

    // VK_EXT_shader_module_identifier
    alias PFN_vkGetShaderModuleIdentifierEXT                                       = void      function( VkDevice device, VkShaderModule shaderModule, VkShaderModuleIdentifierEXT* pIdentifier );
    alias PFN_vkGetShaderModuleCreateInfoIdentifierEXT                             = void      function( VkDevice device, const( VkShaderModuleCreateInfo )* pCreateInfo, VkShaderModuleIdentifierEXT* pIdentifier );

    // VK_NV_optical_flow
    alias PFN_vkGetPhysicalDeviceOpticalFlowImageFormatsNV                         = VkResult  function( VkPhysicalDevice physicalDevice, const( VkOpticalFlowImageFormatInfoNV )* pOpticalFlowImageFormatInfo, uint32_t* pFormatCount, VkOpticalFlowImageFormatPropertiesNV* pImageFormatProperties );
    alias PFN_vkCreateOpticalFlowSessionNV                                         = VkResult  function( VkDevice device, const( VkOpticalFlowSessionCreateInfoNV )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkOpticalFlowSessionNV* pSession );
    alias PFN_vkDestroyOpticalFlowSessionNV                                        = void      function( VkDevice device, VkOpticalFlowSessionNV session, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkBindOpticalFlowSessionImageNV                                      = VkResult  function( VkDevice device, VkOpticalFlowSessionNV session, VkOpticalFlowSessionBindingPointNV bindingPoint, VkImageView view, VkImageLayout layout );
    alias PFN_vkCmdOpticalFlowExecuteNV                                            = void      function( VkCommandBuffer commandBuffer, VkOpticalFlowSessionNV session, const( VkOpticalFlowExecuteInfoNV )* pExecuteInfo );

    // VK_AMD_anti_lag
    alias PFN_vkAntiLagUpdateAMD                                                   = void      function( VkDevice device, const( VkAntiLagDataAMD )* pData );

    // VK_EXT_shader_object
    alias PFN_vkCreateShadersEXT                                                   = VkResult  function( VkDevice device, uint32_t createInfoCount, const( VkShaderCreateInfoEXT )* pCreateInfos, const( VkAllocationCallbacks )* pAllocator, VkShaderEXT* pShaders );
    alias PFN_vkDestroyShaderEXT                                                   = void      function( VkDevice device, VkShaderEXT shader, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetShaderBinaryDataEXT                                             = VkResult  function( VkDevice device, VkShaderEXT shader, size_t* pDataSize, void* pData );
    alias PFN_vkCmdBindShadersEXT                                                  = void      function( VkCommandBuffer commandBuffer, uint32_t stageCount, const( VkShaderStageFlagBits )* pStages, const( VkShaderEXT )* pShaders );
    alias PFN_vkCmdSetDepthClampRangeEXT                                           = void      function( VkCommandBuffer commandBuffer, VkDepthClampModeEXT depthClampMode, const( VkDepthClampRangeEXT )* pDepthClampRange );

    // VK_QCOM_tile_properties
    alias PFN_vkGetFramebufferTilePropertiesQCOM                                   = VkResult  function( VkDevice device, VkFramebuffer framebuffer, uint32_t* pPropertiesCount, VkTilePropertiesQCOM* pProperties );
    alias PFN_vkGetDynamicRenderingTilePropertiesQCOM                              = VkResult  function( VkDevice device, const( VkRenderingInfo )* pRenderingInfo, VkTilePropertiesQCOM* pProperties );

    // VK_NV_cooperative_vector
    alias PFN_vkGetPhysicalDeviceCooperativeVectorPropertiesNV                     = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkCooperativeVectorPropertiesNV* pProperties );
    alias PFN_vkConvertCooperativeVectorMatrixNV                                   = VkResult  function( VkDevice device, const( VkConvertCooperativeVectorMatrixInfoNV )* pInfo );
    alias PFN_vkCmdConvertCooperativeVectorMatrixNV                                = void      function( VkCommandBuffer commandBuffer, uint32_t infoCount, const( VkConvertCooperativeVectorMatrixInfoNV )* pInfos );

    // VK_NV_low_latency2
    alias PFN_vkSetLatencySleepModeNV                                              = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, const( VkLatencySleepModeInfoNV )* pSleepModeInfo );
    alias PFN_vkLatencySleepNV                                                     = VkResult  function( VkDevice device, VkSwapchainKHR swapchain, const( VkLatencySleepInfoNV )* pSleepInfo );
    alias PFN_vkSetLatencyMarkerNV                                                 = void      function( VkDevice device, VkSwapchainKHR swapchain, const( VkSetLatencyMarkerInfoNV )* pLatencyMarkerInfo );
    alias PFN_vkGetLatencyTimingsNV                                                = void      function( VkDevice device, VkSwapchainKHR swapchain, VkGetLatencyMarkerInfoNV* pLatencyMarkerInfo );
    alias PFN_vkQueueNotifyOutOfBandNV                                             = void      function( VkQueue queue, const( VkOutOfBandQueueTypeInfoNV )* pQueueTypeInfo );

    // VK_ARM_data_graph
    alias PFN_vkCreateDataGraphPipelinesARM                                        = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, VkPipelineCache pipelineCache, uint32_t createInfoCount, const( VkDataGraphPipelineCreateInfoARM )* pCreateInfos, const( VkAllocationCallbacks )* pAllocator, VkPipeline* pPipelines );
    alias PFN_vkCreateDataGraphPipelineSessionARM                                  = VkResult  function( VkDevice device, const( VkDataGraphPipelineSessionCreateInfoARM )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkDataGraphPipelineSessionARM* pSession );
    alias PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM                = VkResult  function( VkDevice device, const( VkDataGraphPipelineSessionBindPointRequirementsInfoARM )* pInfo, uint32_t* pBindPointRequirementCount, VkDataGraphPipelineSessionBindPointRequirementARM* pBindPointRequirements );
    alias PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM                   = void      function( VkDevice device, const( VkDataGraphPipelineSessionMemoryRequirementsInfoARM )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkBindDataGraphPipelineSessionMemoryARM                              = VkResult  function( VkDevice device, uint32_t bindInfoCount, const( VkBindDataGraphPipelineSessionMemoryInfoARM )* pBindInfos );
    alias PFN_vkDestroyDataGraphPipelineSessionARM                                 = void      function( VkDevice device, VkDataGraphPipelineSessionARM session, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCmdDispatchDataGraphARM                                            = void      function( VkCommandBuffer commandBuffer, VkDataGraphPipelineSessionARM session, const( VkDataGraphPipelineDispatchInfoARM )* pInfo );
    alias PFN_vkGetDataGraphPipelineAvailablePropertiesARM                         = VkResult  function( VkDevice device, const( VkDataGraphPipelineInfoARM )* pPipelineInfo, uint32_t* pPropertiesCount, VkDataGraphPipelinePropertyARM* pProperties );
    alias PFN_vkGetDataGraphPipelinePropertiesARM                                  = VkResult  function( VkDevice device, const( VkDataGraphPipelineInfoARM )* pPipelineInfo, uint32_t propertiesCount, VkDataGraphPipelinePropertyQueryResultARM* pProperties );
    alias PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM                 = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, uint32_t* pQueueFamilyDataGraphPropertyCount, VkQueueFamilyDataGraphPropertiesARM* pQueueFamilyDataGraphProperties );
    alias PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM = void      function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM )* pQueueFamilyDataGraphProcessingEngineInfo, VkQueueFamilyDataGraphProcessingEnginePropertiesARM* pQueueFamilyDataGraphProcessingEngineProperties );

    // VK_ARM_data_graph_instruction_set_tosa
    alias PFN_vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM  = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, const( VkQueueFamilyDataGraphPropertiesARM )* pQueueFamilyDataGraphProperties, VkBaseOutStructure* pProperties );

    // VK_EXT_attachment_feedback_loop_dynamic_state
    alias PFN_vkCmdSetAttachmentFeedbackLoopEnableEXT                              = void      function( VkCommandBuffer commandBuffer, VkImageAspectFlags aspectMask );

    // VK_QCOM_tile_memory_heap
    alias PFN_vkCmdBindTileMemoryQCOM                                              = void      function( VkCommandBuffer commandBuffer, const( VkTileMemoryBindInfoQCOM )* pTileMemoryBindInfo );

    // VK_EXT_memory_decompression
    alias PFN_vkCmdDecompressMemoryEXT                                             = void      function( VkCommandBuffer commandBuffer, const( VkDecompressMemoryInfoEXT )* pDecompressMemoryInfoEXT );
    alias PFN_vkCmdDecompressMemoryIndirectCountEXT                                = void      function( VkCommandBuffer commandBuffer, VkMemoryDecompressionMethodFlagsEXT decompressionMethod, VkDeviceAddress indirectCommandsAddress, VkDeviceAddress indirectCommandsCountAddress, uint32_t maxDecompressionCount, uint32_t stride );

    // VK_NV_external_compute_queue
    alias PFN_vkCreateExternalComputeQueueNV                                       = VkResult  function( VkDevice device, const( VkExternalComputeQueueCreateInfoNV )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkExternalComputeQueueNV* pExternalQueue );
    alias PFN_vkDestroyExternalComputeQueueNV                                      = void      function( VkDevice device, VkExternalComputeQueueNV externalQueue, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkGetExternalComputeQueueDataNV                                      = void      function( VkExternalComputeQueueNV externalQueue, VkExternalComputeQueueDataParamsNV* params, void* pData );

    // VK_NV_cluster_acceleration_structure
    alias PFN_vkGetClusterAccelerationStructureBuildSizesNV                        = void      function( VkDevice device, const( VkClusterAccelerationStructureInputInfoNV )* pInfo, VkAccelerationStructureBuildSizesInfoKHR* pSizeInfo );
    alias PFN_vkCmdBuildClusterAccelerationStructureIndirectNV                     = void      function( VkCommandBuffer commandBuffer, const( VkClusterAccelerationStructureCommandsInfoNV )* pCommandInfos );

    // VK_NV_partitioned_acceleration_structure
    alias PFN_vkGetPartitionedAccelerationStructuresBuildSizesNV                   = void      function( VkDevice device, const( VkPartitionedAccelerationStructureInstancesInputNV )* pInfo, VkAccelerationStructureBuildSizesInfoKHR* pSizeInfo );
    alias PFN_vkCmdBuildPartitionedAccelerationStructuresNV                        = void      function( VkCommandBuffer commandBuffer, const( VkBuildPartitionedAccelerationStructureInfoNV )* pBuildInfo );

    // VK_EXT_device_generated_commands
    alias PFN_vkGetGeneratedCommandsMemoryRequirementsEXT                          = void      function( VkDevice device, const( VkGeneratedCommandsMemoryRequirementsInfoEXT )* pInfo, VkMemoryRequirements2* pMemoryRequirements );
    alias PFN_vkCmdPreprocessGeneratedCommandsEXT                                  = void      function( VkCommandBuffer commandBuffer, const( VkGeneratedCommandsInfoEXT )* pGeneratedCommandsInfo, VkCommandBuffer stateCommandBuffer );
    alias PFN_vkCmdExecuteGeneratedCommandsEXT                                     = void      function( VkCommandBuffer commandBuffer, VkBool32 isPreprocessed, const( VkGeneratedCommandsInfoEXT )* pGeneratedCommandsInfo );
    alias PFN_vkCreateIndirectCommandsLayoutEXT                                    = VkResult  function( VkDevice device, const( VkIndirectCommandsLayoutCreateInfoEXT )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkIndirectCommandsLayoutEXT* pIndirectCommandsLayout );
    alias PFN_vkDestroyIndirectCommandsLayoutEXT                                   = void      function( VkDevice device, VkIndirectCommandsLayoutEXT indirectCommandsLayout, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCreateIndirectExecutionSetEXT                                      = VkResult  function( VkDevice device, const( VkIndirectExecutionSetCreateInfoEXT )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkIndirectExecutionSetEXT* pIndirectExecutionSet );
    alias PFN_vkDestroyIndirectExecutionSetEXT                                     = void      function( VkDevice device, VkIndirectExecutionSetEXT indirectExecutionSet, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkUpdateIndirectExecutionSetPipelineEXT                              = void      function( VkDevice device, VkIndirectExecutionSetEXT indirectExecutionSet, uint32_t executionSetWriteCount, const( VkWriteIndirectExecutionSetPipelineEXT )* pExecutionSetWrites );
    alias PFN_vkUpdateIndirectExecutionSetShaderEXT                                = void      function( VkDevice device, VkIndirectExecutionSetEXT indirectExecutionSet, uint32_t executionSetWriteCount, const( VkWriteIndirectExecutionSetShaderEXT )* pExecutionSetWrites );

    // VK_NV_cooperative_matrix2
    alias PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV   = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pPropertyCount, VkCooperativeMatrixFlexibleDimensionsPropertiesNV* pProperties );

    // VK_ARM_performance_counters_by_region
    alias PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM   = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, uint32_t* pCounterCount, VkPerformanceCounterARM* pCounters, VkPerformanceCounterDescriptionARM* pCounterDescriptions );

    // VK_ARM_shader_instrumentation
    alias PFN_vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM             = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t* pDescriptionCount, VkShaderInstrumentationMetricDescriptionARM* pDescriptions );
    alias PFN_vkCreateShaderInstrumentationARM                                     = VkResult  function( VkDevice device, const( VkShaderInstrumentationCreateInfoARM )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkShaderInstrumentationARM* pInstrumentation );
    alias PFN_vkDestroyShaderInstrumentationARM                                    = void      function( VkDevice device, VkShaderInstrumentationARM instrumentation, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCmdBeginShaderInstrumentationARM                                   = void      function( VkCommandBuffer commandBuffer, VkShaderInstrumentationARM instrumentation );
    alias PFN_vkCmdEndShaderInstrumentationARM                                     = void      function( VkCommandBuffer commandBuffer );
    alias PFN_vkGetShaderInstrumentationValuesARM                                  = VkResult  function( VkDevice device, VkShaderInstrumentationARM instrumentation, uint32_t* pMetricBlockCount, void* pMetricValues, VkShaderInstrumentationValuesFlagsARM flags );
    alias PFN_vkClearShaderInstrumentationMetricsARM                               = void      function( VkDevice device, VkShaderInstrumentationARM instrumentation );

    // VK_EXT_custom_resolve
    alias PFN_vkCmdBeginCustomResolveEXT                                           = void      function( VkCommandBuffer commandBuffer, const( VkBeginCustomResolveInfoEXT )* pBeginCustomResolveInfo );

    // VK_ARM_data_graph_optical_flow
    alias PFN_vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM    = VkResult  function( VkPhysicalDevice physicalDevice, uint32_t queueFamilyIndex, const( VkQueueFamilyDataGraphPropertiesARM )* pQueueFamilyDataGraphProperties, const( VkDataGraphOpticalFlowImageFormatInfoARM )* pOpticalFlowImageFormatInfo, uint32_t* pFormatCount, VkDataGraphOpticalFlowImageFormatPropertiesARM* pImageFormatProperties );

    // VK_NV_compute_occupancy_priority
    alias PFN_vkCmdSetComputeOccupancyPriorityNV                                   = void      function( VkCommandBuffer commandBuffer, const( VkComputeOccupancyPriorityParametersNV )* pParameters );

    // VK_EXT_cooperative_matrix_maintenance1
    alias PFN_vkGetPhysicalDeviceCooperativeMatrixProperties2EXT                   = VkResult  function( VkPhysicalDevice physicalDevice, const( VkPhysicalDeviceCooperativeMatrixInfo2EXT )* pCooperativeMatrixInfo, uint32_t* pPropertyCount, VkCooperativeMatrixProperties2EXT* pProperties );

    // VK_EXT_primitive_restart_index
    alias PFN_vkCmdSetPrimitiveRestartIndexEXT                                     = void      function( VkCommandBuffer commandBuffer, uint32_t primitiveRestartIndex );

    // VK_KHR_acceleration_structure
    alias PFN_vkCreateAccelerationStructureKHR                                     = VkResult  function( VkDevice device, const( VkAccelerationStructureCreateInfoKHR )* pCreateInfo, const( VkAllocationCallbacks )* pAllocator, VkAccelerationStructureKHR* pAccelerationStructure );
    alias PFN_vkDestroyAccelerationStructureKHR                                    = void      function( VkDevice device, VkAccelerationStructureKHR accelerationStructure, const( VkAllocationCallbacks )* pAllocator );
    alias PFN_vkCmdBuildAccelerationStructuresKHR                                  = void      function( VkCommandBuffer commandBuffer, uint32_t infoCount, const( VkAccelerationStructureBuildGeometryInfoKHR )* pInfos, const( VkAccelerationStructureBuildRangeInfoKHR* )* ppBuildRangeInfos );
    alias PFN_vkCmdBuildAccelerationStructuresIndirectKHR                          = void      function( VkCommandBuffer commandBuffer, uint32_t infoCount, const( VkAccelerationStructureBuildGeometryInfoKHR )* pInfos, const( VkDeviceAddress )* pIndirectDeviceAddresses, const( uint32_t )* pIndirectStrides, const( uint32_t* )* ppMaxPrimitiveCounts );
    alias PFN_vkBuildAccelerationStructuresKHR                                     = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, uint32_t infoCount, const( VkAccelerationStructureBuildGeometryInfoKHR )* pInfos, const( VkAccelerationStructureBuildRangeInfoKHR* )* ppBuildRangeInfos );
    alias PFN_vkCopyAccelerationStructureKHR                                       = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, const( VkCopyAccelerationStructureInfoKHR )* pInfo );
    alias PFN_vkCopyAccelerationStructureToMemoryKHR                               = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, const( VkCopyAccelerationStructureToMemoryInfoKHR )* pInfo );
    alias PFN_vkCopyMemoryToAccelerationStructureKHR                               = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, const( VkCopyMemoryToAccelerationStructureInfoKHR )* pInfo );
    alias PFN_vkWriteAccelerationStructuresPropertiesKHR                           = VkResult  function( VkDevice device, uint32_t accelerationStructureCount, const( VkAccelerationStructureKHR )* pAccelerationStructures, VkQueryType queryType, size_t dataSize, void* pData, size_t stride );
    alias PFN_vkCmdCopyAccelerationStructureKHR                                    = void      function( VkCommandBuffer commandBuffer, const( VkCopyAccelerationStructureInfoKHR )* pInfo );
    alias PFN_vkCmdCopyAccelerationStructureToMemoryKHR                            = void      function( VkCommandBuffer commandBuffer, const( VkCopyAccelerationStructureToMemoryInfoKHR )* pInfo );
    alias PFN_vkCmdCopyMemoryToAccelerationStructureKHR                            = void      function( VkCommandBuffer commandBuffer, const( VkCopyMemoryToAccelerationStructureInfoKHR )* pInfo );
    alias PFN_vkGetAccelerationStructureDeviceAddressKHR                           = VkDeviceAddress  function( VkDevice device, const( VkAccelerationStructureDeviceAddressInfoKHR )* pInfo );
    alias PFN_vkCmdWriteAccelerationStructuresPropertiesKHR                        = void      function( VkCommandBuffer commandBuffer, uint32_t accelerationStructureCount, const( VkAccelerationStructureKHR )* pAccelerationStructures, VkQueryType queryType, VkQueryPool queryPool, uint32_t firstQuery );
    alias PFN_vkGetDeviceAccelerationStructureCompatibilityKHR                     = void      function( VkDevice device, const( VkAccelerationStructureVersionInfoKHR )* pVersionInfo, VkAccelerationStructureCompatibilityKHR* pCompatibility );
    alias PFN_vkGetAccelerationStructureBuildSizesKHR                              = void      function( VkDevice device, VkAccelerationStructureBuildTypeKHR buildType, const( VkAccelerationStructureBuildGeometryInfoKHR )* pBuildInfo, const( uint32_t )* pMaxPrimitiveCounts, VkAccelerationStructureBuildSizesInfoKHR* pSizeInfo );

    // VK_KHR_ray_tracing_pipeline
    alias PFN_vkCmdTraceRaysKHR                                                    = void      function( VkCommandBuffer commandBuffer, const( VkStridedDeviceAddressRegionKHR )* pRaygenShaderBindingTable, const( VkStridedDeviceAddressRegionKHR )* pMissShaderBindingTable, const( VkStridedDeviceAddressRegionKHR )* pHitShaderBindingTable, const( VkStridedDeviceAddressRegionKHR )* pCallableShaderBindingTable, uint32_t width, uint32_t height, uint32_t depth );
    alias PFN_vkCreateRayTracingPipelinesKHR                                       = VkResult  function( VkDevice device, VkDeferredOperationKHR deferredOperation, VkPipelineCache pipelineCache, uint32_t createInfoCount, const( VkRayTracingPipelineCreateInfoKHR )* pCreateInfos, const( VkAllocationCallbacks )* pAllocator, VkPipeline* pPipelines );
    alias PFN_vkGetRayTracingCaptureReplayShaderGroupHandlesKHR                    = VkResult  function( VkDevice device, VkPipeline pipeline, uint32_t firstGroup, uint32_t groupCount, size_t dataSize, void* pData );
    alias PFN_vkCmdTraceRaysIndirectKHR                                            = void      function( VkCommandBuffer commandBuffer, const( VkStridedDeviceAddressRegionKHR )* pRaygenShaderBindingTable, const( VkStridedDeviceAddressRegionKHR )* pMissShaderBindingTable, const( VkStridedDeviceAddressRegionKHR )* pHitShaderBindingTable, const( VkStridedDeviceAddressRegionKHR )* pCallableShaderBindingTable, VkDeviceAddress indirectDeviceAddress );
    alias PFN_vkGetRayTracingShaderGroupStackSizeKHR                               = VkDeviceSize  function( VkDevice device, VkPipeline pipeline, uint32_t group, VkShaderGroupShaderKHR groupShader );
    alias PFN_vkCmdSetRayTracingPipelineStackSizeKHR                               = void      function( VkCommandBuffer commandBuffer, uint32_t pipelineStackSize );

    // VK_EXT_mesh_shader
    alias PFN_vkCmdDrawMeshTasksEXT                                                = void      function( VkCommandBuffer commandBuffer, uint32_t groupCountX, uint32_t groupCountY, uint32_t groupCountZ );
    alias PFN_vkCmdDrawMeshTasksIndirectEXT                                        = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, uint32_t drawCount, uint32_t stride );
    alias PFN_vkCmdDrawMeshTasksIndirectCountEXT                                   = void      function( VkCommandBuffer commandBuffer, VkBuffer buffer, VkDeviceSize offset, VkBuffer countBuffer, VkDeviceSize countBufferOffset, uint32_t maxDrawCount, uint32_t stride );
}


/// function declarations
__gshared {

    // VK_BASE_VERSION_1_0
    PFN_vkCreateInstance                                                     vkCreateInstance;
    PFN_vkDestroyInstance                                                    vkDestroyInstance;
    PFN_vkEnumeratePhysicalDevices                                           vkEnumeratePhysicalDevices;
    PFN_vkGetPhysicalDeviceFeatures                                          vkGetPhysicalDeviceFeatures;
    PFN_vkGetPhysicalDeviceFormatProperties                                  vkGetPhysicalDeviceFormatProperties;
    PFN_vkGetPhysicalDeviceImageFormatProperties                             vkGetPhysicalDeviceImageFormatProperties;
    PFN_vkGetPhysicalDeviceProperties                                        vkGetPhysicalDeviceProperties;
    PFN_vkGetPhysicalDeviceQueueFamilyProperties                             vkGetPhysicalDeviceQueueFamilyProperties;
    PFN_vkGetPhysicalDeviceMemoryProperties                                  vkGetPhysicalDeviceMemoryProperties;
    PFN_vkGetInstanceProcAddr                                                vkGetInstanceProcAddr;
    PFN_vkGetDeviceProcAddr                                                  vkGetDeviceProcAddr;
    PFN_vkCreateDevice                                                       vkCreateDevice;
    PFN_vkDestroyDevice                                                      vkDestroyDevice;
    PFN_vkEnumerateInstanceExtensionProperties                               vkEnumerateInstanceExtensionProperties;
    PFN_vkEnumerateDeviceExtensionProperties                                 vkEnumerateDeviceExtensionProperties;
    PFN_vkEnumerateInstanceLayerProperties                                   vkEnumerateInstanceLayerProperties;
    PFN_vkEnumerateDeviceLayerProperties                                     vkEnumerateDeviceLayerProperties;
    PFN_vkGetDeviceQueue                                                     vkGetDeviceQueue;
    PFN_vkQueueSubmit                                                        vkQueueSubmit;
    PFN_vkQueueWaitIdle                                                      vkQueueWaitIdle;
    PFN_vkDeviceWaitIdle                                                     vkDeviceWaitIdle;
    PFN_vkAllocateMemory                                                     vkAllocateMemory;
    PFN_vkFreeMemory                                                         vkFreeMemory;
    PFN_vkMapMemory                                                          vkMapMemory;
    PFN_vkUnmapMemory                                                        vkUnmapMemory;
    PFN_vkFlushMappedMemoryRanges                                            vkFlushMappedMemoryRanges;
    PFN_vkInvalidateMappedMemoryRanges                                       vkInvalidateMappedMemoryRanges;
    PFN_vkGetDeviceMemoryCommitment                                          vkGetDeviceMemoryCommitment;
    PFN_vkBindBufferMemory                                                   vkBindBufferMemory;
    PFN_vkBindImageMemory                                                    vkBindImageMemory;
    PFN_vkGetBufferMemoryRequirements                                        vkGetBufferMemoryRequirements;
    PFN_vkGetImageMemoryRequirements                                         vkGetImageMemoryRequirements;
    PFN_vkGetImageSparseMemoryRequirements                                   vkGetImageSparseMemoryRequirements;
    PFN_vkGetPhysicalDeviceSparseImageFormatProperties                       vkGetPhysicalDeviceSparseImageFormatProperties;
    PFN_vkQueueBindSparse                                                    vkQueueBindSparse;
    PFN_vkCreateFence                                                        vkCreateFence;
    PFN_vkDestroyFence                                                       vkDestroyFence;
    PFN_vkResetFences                                                        vkResetFences;
    PFN_vkGetFenceStatus                                                     vkGetFenceStatus;
    PFN_vkWaitForFences                                                      vkWaitForFences;
    PFN_vkCreateSemaphore                                                    vkCreateSemaphore;
    PFN_vkDestroySemaphore                                                   vkDestroySemaphore;
    PFN_vkCreateQueryPool                                                    vkCreateQueryPool;
    PFN_vkDestroyQueryPool                                                   vkDestroyQueryPool;
    PFN_vkGetQueryPoolResults                                                vkGetQueryPoolResults;
    PFN_vkCreateBuffer                                                       vkCreateBuffer;
    PFN_vkDestroyBuffer                                                      vkDestroyBuffer;
    PFN_vkCreateImage                                                        vkCreateImage;
    PFN_vkDestroyImage                                                       vkDestroyImage;
    PFN_vkGetImageSubresourceLayout                                          vkGetImageSubresourceLayout;
    PFN_vkCreateImageView                                                    vkCreateImageView;
    PFN_vkDestroyImageView                                                   vkDestroyImageView;
    PFN_vkCreateCommandPool                                                  vkCreateCommandPool;
    PFN_vkDestroyCommandPool                                                 vkDestroyCommandPool;
    PFN_vkResetCommandPool                                                   vkResetCommandPool;
    PFN_vkAllocateCommandBuffers                                             vkAllocateCommandBuffers;
    PFN_vkFreeCommandBuffers                                                 vkFreeCommandBuffers;
    PFN_vkBeginCommandBuffer                                                 vkBeginCommandBuffer;
    PFN_vkEndCommandBuffer                                                   vkEndCommandBuffer;
    PFN_vkResetCommandBuffer                                                 vkResetCommandBuffer;
    PFN_vkCmdCopyBuffer                                                      vkCmdCopyBuffer;
    PFN_vkCmdCopyImage                                                       vkCmdCopyImage;
    PFN_vkCmdCopyBufferToImage                                               vkCmdCopyBufferToImage;
    PFN_vkCmdCopyImageToBuffer                                               vkCmdCopyImageToBuffer;
    PFN_vkCmdUpdateBuffer                                                    vkCmdUpdateBuffer;
    PFN_vkCmdFillBuffer                                                      vkCmdFillBuffer;
    PFN_vkCmdPipelineBarrier                                                 vkCmdPipelineBarrier;
    PFN_vkCmdBeginQuery                                                      vkCmdBeginQuery;
    PFN_vkCmdEndQuery                                                        vkCmdEndQuery;
    PFN_vkCmdResetQueryPool                                                  vkCmdResetQueryPool;
    PFN_vkCmdWriteTimestamp                                                  vkCmdWriteTimestamp;
    PFN_vkCmdCopyQueryPoolResults                                            vkCmdCopyQueryPoolResults;
    PFN_vkCmdExecuteCommands                                                 vkCmdExecuteCommands;

    // VK_COMPUTE_VERSION_1_0
    PFN_vkCreateEvent                                                        vkCreateEvent;
    PFN_vkDestroyEvent                                                       vkDestroyEvent;
    PFN_vkGetEventStatus                                                     vkGetEventStatus;
    PFN_vkSetEvent                                                           vkSetEvent;
    PFN_vkResetEvent                                                         vkResetEvent;
    PFN_vkCreateBufferView                                                   vkCreateBufferView;
    PFN_vkDestroyBufferView                                                  vkDestroyBufferView;
    PFN_vkCreateShaderModule                                                 vkCreateShaderModule;
    PFN_vkDestroyShaderModule                                                vkDestroyShaderModule;
    PFN_vkCreatePipelineCache                                                vkCreatePipelineCache;
    PFN_vkDestroyPipelineCache                                               vkDestroyPipelineCache;
    PFN_vkGetPipelineCacheData                                               vkGetPipelineCacheData;
    PFN_vkMergePipelineCaches                                                vkMergePipelineCaches;
    PFN_vkCreateComputePipelines                                             vkCreateComputePipelines;
    PFN_vkDestroyPipeline                                                    vkDestroyPipeline;
    PFN_vkCreatePipelineLayout                                               vkCreatePipelineLayout;
    PFN_vkDestroyPipelineLayout                                              vkDestroyPipelineLayout;
    PFN_vkCreateSampler                                                      vkCreateSampler;
    PFN_vkDestroySampler                                                     vkDestroySampler;
    PFN_vkCreateDescriptorSetLayout                                          vkCreateDescriptorSetLayout;
    PFN_vkDestroyDescriptorSetLayout                                         vkDestroyDescriptorSetLayout;
    PFN_vkCreateDescriptorPool                                               vkCreateDescriptorPool;
    PFN_vkDestroyDescriptorPool                                              vkDestroyDescriptorPool;
    PFN_vkResetDescriptorPool                                                vkResetDescriptorPool;
    PFN_vkAllocateDescriptorSets                                             vkAllocateDescriptorSets;
    PFN_vkFreeDescriptorSets                                                 vkFreeDescriptorSets;
    PFN_vkUpdateDescriptorSets                                               vkUpdateDescriptorSets;
    PFN_vkCmdBindPipeline                                                    vkCmdBindPipeline;
    PFN_vkCmdBindDescriptorSets                                              vkCmdBindDescriptorSets;
    PFN_vkCmdClearColorImage                                                 vkCmdClearColorImage;
    PFN_vkCmdDispatch                                                        vkCmdDispatch;
    PFN_vkCmdDispatchIndirect                                                vkCmdDispatchIndirect;
    PFN_vkCmdSetEvent                                                        vkCmdSetEvent;
    PFN_vkCmdResetEvent                                                      vkCmdResetEvent;
    PFN_vkCmdWaitEvents                                                      vkCmdWaitEvents;
    PFN_vkCmdPushConstants                                                   vkCmdPushConstants;

    // VK_GRAPHICS_VERSION_1_0
    PFN_vkCreateGraphicsPipelines                                            vkCreateGraphicsPipelines;
    PFN_vkCreateFramebuffer                                                  vkCreateFramebuffer;
    PFN_vkDestroyFramebuffer                                                 vkDestroyFramebuffer;
    PFN_vkCreateRenderPass                                                   vkCreateRenderPass;
    PFN_vkDestroyRenderPass                                                  vkDestroyRenderPass;
    PFN_vkGetRenderAreaGranularity                                           vkGetRenderAreaGranularity;
    PFN_vkCmdSetViewport                                                     vkCmdSetViewport;
    PFN_vkCmdSetScissor                                                      vkCmdSetScissor;
    PFN_vkCmdSetLineWidth                                                    vkCmdSetLineWidth;
    PFN_vkCmdSetDepthBias                                                    vkCmdSetDepthBias;
    PFN_vkCmdSetBlendConstants                                               vkCmdSetBlendConstants;
    PFN_vkCmdSetDepthBounds                                                  vkCmdSetDepthBounds;
    PFN_vkCmdSetStencilCompareMask                                           vkCmdSetStencilCompareMask;
    PFN_vkCmdSetStencilWriteMask                                             vkCmdSetStencilWriteMask;
    PFN_vkCmdSetStencilReference                                             vkCmdSetStencilReference;
    PFN_vkCmdBindIndexBuffer                                                 vkCmdBindIndexBuffer;
    PFN_vkCmdBindVertexBuffers                                               vkCmdBindVertexBuffers;
    PFN_vkCmdDraw                                                            vkCmdDraw;
    PFN_vkCmdDrawIndexed                                                     vkCmdDrawIndexed;
    PFN_vkCmdDrawIndirect                                                    vkCmdDrawIndirect;
    PFN_vkCmdDrawIndexedIndirect                                             vkCmdDrawIndexedIndirect;
    PFN_vkCmdBlitImage                                                       vkCmdBlitImage;
    PFN_vkCmdClearDepthStencilImage                                          vkCmdClearDepthStencilImage;
    PFN_vkCmdClearAttachments                                                vkCmdClearAttachments;
    PFN_vkCmdResolveImage                                                    vkCmdResolveImage;
    PFN_vkCmdBeginRenderPass                                                 vkCmdBeginRenderPass;
    PFN_vkCmdNextSubpass                                                     vkCmdNextSubpass;
    PFN_vkCmdEndRenderPass                                                   vkCmdEndRenderPass;

    // VK_BASE_VERSION_1_1
    PFN_vkEnumerateInstanceVersion                                           vkEnumerateInstanceVersion;
    PFN_vkBindBufferMemory2                                                  vkBindBufferMemory2;
    PFN_vkBindImageMemory2                                                   vkBindImageMemory2;
    PFN_vkGetDeviceGroupPeerMemoryFeatures                                   vkGetDeviceGroupPeerMemoryFeatures;
    PFN_vkCmdSetDeviceMask                                                   vkCmdSetDeviceMask;
    PFN_vkEnumeratePhysicalDeviceGroups                                      vkEnumeratePhysicalDeviceGroups;
    PFN_vkGetImageMemoryRequirements2                                        vkGetImageMemoryRequirements2;
    PFN_vkGetBufferMemoryRequirements2                                       vkGetBufferMemoryRequirements2;
    PFN_vkGetImageSparseMemoryRequirements2                                  vkGetImageSparseMemoryRequirements2;
    PFN_vkGetPhysicalDeviceFeatures2                                         vkGetPhysicalDeviceFeatures2;
    PFN_vkGetPhysicalDeviceProperties2                                       vkGetPhysicalDeviceProperties2;
    PFN_vkGetPhysicalDeviceFormatProperties2                                 vkGetPhysicalDeviceFormatProperties2;
    PFN_vkGetPhysicalDeviceImageFormatProperties2                            vkGetPhysicalDeviceImageFormatProperties2;
    PFN_vkGetPhysicalDeviceQueueFamilyProperties2                            vkGetPhysicalDeviceQueueFamilyProperties2;
    PFN_vkGetPhysicalDeviceMemoryProperties2                                 vkGetPhysicalDeviceMemoryProperties2;
    PFN_vkGetPhysicalDeviceSparseImageFormatProperties2                      vkGetPhysicalDeviceSparseImageFormatProperties2;
    PFN_vkTrimCommandPool                                                    vkTrimCommandPool;
    PFN_vkGetDeviceQueue2                                                    vkGetDeviceQueue2;
    PFN_vkGetPhysicalDeviceExternalBufferProperties                          vkGetPhysicalDeviceExternalBufferProperties;
    PFN_vkGetPhysicalDeviceExternalFenceProperties                           vkGetPhysicalDeviceExternalFenceProperties;
    PFN_vkGetPhysicalDeviceExternalSemaphoreProperties                       vkGetPhysicalDeviceExternalSemaphoreProperties;

    // VK_COMPUTE_VERSION_1_1
    PFN_vkCmdDispatchBase                                                    vkCmdDispatchBase;
    PFN_vkCreateDescriptorUpdateTemplate                                     vkCreateDescriptorUpdateTemplate;
    PFN_vkDestroyDescriptorUpdateTemplate                                    vkDestroyDescriptorUpdateTemplate;
    PFN_vkUpdateDescriptorSetWithTemplate                                    vkUpdateDescriptorSetWithTemplate;
    PFN_vkGetDescriptorSetLayoutSupport                                      vkGetDescriptorSetLayoutSupport;
    PFN_vkCreateSamplerYcbcrConversion                                       vkCreateSamplerYcbcrConversion;
    PFN_vkDestroySamplerYcbcrConversion                                      vkDestroySamplerYcbcrConversion;

    // VK_BASE_VERSION_1_2
    PFN_vkResetQueryPool                                                     vkResetQueryPool;
    PFN_vkGetSemaphoreCounterValue                                           vkGetSemaphoreCounterValue;
    PFN_vkWaitSemaphores                                                     vkWaitSemaphores;
    PFN_vkSignalSemaphore                                                    vkSignalSemaphore;
    PFN_vkGetBufferDeviceAddress                                             vkGetBufferDeviceAddress;
    PFN_vkGetBufferOpaqueCaptureAddress                                      vkGetBufferOpaqueCaptureAddress;
    PFN_vkGetDeviceMemoryOpaqueCaptureAddress                                vkGetDeviceMemoryOpaqueCaptureAddress;

    // VK_GRAPHICS_VERSION_1_2
    PFN_vkCmdDrawIndirectCount                                               vkCmdDrawIndirectCount;
    PFN_vkCmdDrawIndexedIndirectCount                                        vkCmdDrawIndexedIndirectCount;
    PFN_vkCreateRenderPass2                                                  vkCreateRenderPass2;
    PFN_vkCmdBeginRenderPass2                                                vkCmdBeginRenderPass2;
    PFN_vkCmdNextSubpass2                                                    vkCmdNextSubpass2;
    PFN_vkCmdEndRenderPass2                                                  vkCmdEndRenderPass2;

    // VK_BASE_VERSION_1_3
    PFN_vkGetPhysicalDeviceToolProperties                                    vkGetPhysicalDeviceToolProperties;
    PFN_vkCreatePrivateDataSlot                                              vkCreatePrivateDataSlot;
    PFN_vkDestroyPrivateDataSlot                                             vkDestroyPrivateDataSlot;
    PFN_vkSetPrivateData                                                     vkSetPrivateData;
    PFN_vkGetPrivateData                                                     vkGetPrivateData;
    PFN_vkCmdPipelineBarrier2                                                vkCmdPipelineBarrier2;
    PFN_vkCmdWriteTimestamp2                                                 vkCmdWriteTimestamp2;
    PFN_vkQueueSubmit2                                                       vkQueueSubmit2;
    PFN_vkCmdCopyBuffer2                                                     vkCmdCopyBuffer2;
    PFN_vkCmdCopyImage2                                                      vkCmdCopyImage2;
    PFN_vkCmdCopyBufferToImage2                                              vkCmdCopyBufferToImage2;
    PFN_vkCmdCopyImageToBuffer2                                              vkCmdCopyImageToBuffer2;
    PFN_vkGetDeviceBufferMemoryRequirements                                  vkGetDeviceBufferMemoryRequirements;
    PFN_vkGetDeviceImageMemoryRequirements                                   vkGetDeviceImageMemoryRequirements;
    PFN_vkGetDeviceImageSparseMemoryRequirements                             vkGetDeviceImageSparseMemoryRequirements;

    // VK_COMPUTE_VERSION_1_3
    PFN_vkCmdSetEvent2                                                       vkCmdSetEvent2;
    PFN_vkCmdResetEvent2                                                     vkCmdResetEvent2;
    PFN_vkCmdWaitEvents2                                                     vkCmdWaitEvents2;

    // VK_GRAPHICS_VERSION_1_3
    PFN_vkCmdBlitImage2                                                      vkCmdBlitImage2;
    PFN_vkCmdResolveImage2                                                   vkCmdResolveImage2;
    PFN_vkCmdBeginRendering                                                  vkCmdBeginRendering;
    PFN_vkCmdEndRendering                                                    vkCmdEndRendering;
    PFN_vkCmdSetCullMode                                                     vkCmdSetCullMode;
    PFN_vkCmdSetFrontFace                                                    vkCmdSetFrontFace;
    PFN_vkCmdSetPrimitiveTopology                                            vkCmdSetPrimitiveTopology;
    PFN_vkCmdSetViewportWithCount                                            vkCmdSetViewportWithCount;
    PFN_vkCmdSetScissorWithCount                                             vkCmdSetScissorWithCount;
    PFN_vkCmdBindVertexBuffers2                                              vkCmdBindVertexBuffers2;
    PFN_vkCmdSetDepthTestEnable                                              vkCmdSetDepthTestEnable;
    PFN_vkCmdSetDepthWriteEnable                                             vkCmdSetDepthWriteEnable;
    PFN_vkCmdSetDepthCompareOp                                               vkCmdSetDepthCompareOp;
    PFN_vkCmdSetDepthBoundsTestEnable                                        vkCmdSetDepthBoundsTestEnable;
    PFN_vkCmdSetStencilTestEnable                                            vkCmdSetStencilTestEnable;
    PFN_vkCmdSetStencilOp                                                    vkCmdSetStencilOp;
    PFN_vkCmdSetRasterizerDiscardEnable                                      vkCmdSetRasterizerDiscardEnable;
    PFN_vkCmdSetDepthBiasEnable                                              vkCmdSetDepthBiasEnable;
    PFN_vkCmdSetPrimitiveRestartEnable                                       vkCmdSetPrimitiveRestartEnable;

    // VK_BASE_VERSION_1_4
    PFN_vkMapMemory2                                                         vkMapMemory2;
    PFN_vkUnmapMemory2                                                       vkUnmapMemory2;
    PFN_vkGetDeviceImageSubresourceLayout                                    vkGetDeviceImageSubresourceLayout;
    PFN_vkGetImageSubresourceLayout2                                         vkGetImageSubresourceLayout2;
    PFN_vkCopyMemoryToImage                                                  vkCopyMemoryToImage;
    PFN_vkCopyImageToMemory                                                  vkCopyImageToMemory;
    PFN_vkCopyImageToImage                                                   vkCopyImageToImage;
    PFN_vkTransitionImageLayout                                              vkTransitionImageLayout;

    // VK_COMPUTE_VERSION_1_4
    PFN_vkCmdPushDescriptorSet                                               vkCmdPushDescriptorSet;
    PFN_vkCmdPushDescriptorSetWithTemplate                                   vkCmdPushDescriptorSetWithTemplate;
    PFN_vkCmdBindDescriptorSets2                                             vkCmdBindDescriptorSets2;
    PFN_vkCmdPushConstants2                                                  vkCmdPushConstants2;
    PFN_vkCmdPushDescriptorSet2                                              vkCmdPushDescriptorSet2;
    PFN_vkCmdPushDescriptorSetWithTemplate2                                  vkCmdPushDescriptorSetWithTemplate2;

    // VK_GRAPHICS_VERSION_1_4
    PFN_vkCmdSetLineStipple                                                  vkCmdSetLineStipple;
    PFN_vkCmdBindIndexBuffer2                                                vkCmdBindIndexBuffer2;
    PFN_vkGetRenderingAreaGranularity                                        vkGetRenderingAreaGranularity;
    PFN_vkCmdSetRenderingAttachmentLocations                                 vkCmdSetRenderingAttachmentLocations;
    PFN_vkCmdSetRenderingInputAttachmentIndices                              vkCmdSetRenderingInputAttachmentIndices;

    // VK_KHR_surface
    PFN_vkDestroySurfaceKHR                                                  vkDestroySurfaceKHR;
    PFN_vkGetPhysicalDeviceSurfaceSupportKHR                                 vkGetPhysicalDeviceSurfaceSupportKHR;
    PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR                            vkGetPhysicalDeviceSurfaceCapabilitiesKHR;
    PFN_vkGetPhysicalDeviceSurfaceFormatsKHR                                 vkGetPhysicalDeviceSurfaceFormatsKHR;
    PFN_vkGetPhysicalDeviceSurfacePresentModesKHR                            vkGetPhysicalDeviceSurfacePresentModesKHR;

    // VK_KHR_swapchain
    PFN_vkCreateSwapchainKHR                                                 vkCreateSwapchainKHR;
    PFN_vkDestroySwapchainKHR                                                vkDestroySwapchainKHR;
    PFN_vkGetSwapchainImagesKHR                                              vkGetSwapchainImagesKHR;
    PFN_vkAcquireNextImageKHR                                                vkAcquireNextImageKHR;
    PFN_vkQueuePresentKHR                                                    vkQueuePresentKHR;
    PFN_vkGetDeviceGroupPresentCapabilitiesKHR                               vkGetDeviceGroupPresentCapabilitiesKHR;
    PFN_vkGetDeviceGroupSurfacePresentModesKHR                               vkGetDeviceGroupSurfacePresentModesKHR;
    PFN_vkGetPhysicalDevicePresentRectanglesKHR                              vkGetPhysicalDevicePresentRectanglesKHR;
    PFN_vkAcquireNextImage2KHR                                               vkAcquireNextImage2KHR;

    // VK_KHR_display
    PFN_vkGetPhysicalDeviceDisplayPropertiesKHR                              vkGetPhysicalDeviceDisplayPropertiesKHR;
    PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR                         vkGetPhysicalDeviceDisplayPlanePropertiesKHR;
    PFN_vkGetDisplayPlaneSupportedDisplaysKHR                                vkGetDisplayPlaneSupportedDisplaysKHR;
    PFN_vkGetDisplayModePropertiesKHR                                        vkGetDisplayModePropertiesKHR;
    PFN_vkCreateDisplayModeKHR                                               vkCreateDisplayModeKHR;
    PFN_vkGetDisplayPlaneCapabilitiesKHR                                     vkGetDisplayPlaneCapabilitiesKHR;
    PFN_vkCreateDisplayPlaneSurfaceKHR                                       vkCreateDisplayPlaneSurfaceKHR;

    // VK_KHR_display_swapchain
    PFN_vkCreateSharedSwapchainsKHR                                          vkCreateSharedSwapchainsKHR;

    // VK_KHR_video_queue
    PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR                              vkGetPhysicalDeviceVideoCapabilitiesKHR;
    PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR                          vkGetPhysicalDeviceVideoFormatPropertiesKHR;
    PFN_vkCreateVideoSessionKHR                                              vkCreateVideoSessionKHR;
    PFN_vkDestroyVideoSessionKHR                                             vkDestroyVideoSessionKHR;
    PFN_vkGetVideoSessionMemoryRequirementsKHR                               vkGetVideoSessionMemoryRequirementsKHR;
    PFN_vkBindVideoSessionMemoryKHR                                          vkBindVideoSessionMemoryKHR;
    PFN_vkCreateVideoSessionParametersKHR                                    vkCreateVideoSessionParametersKHR;
    PFN_vkUpdateVideoSessionParametersKHR                                    vkUpdateVideoSessionParametersKHR;
    PFN_vkDestroyVideoSessionParametersKHR                                   vkDestroyVideoSessionParametersKHR;
    PFN_vkCmdBeginVideoCodingKHR                                             vkCmdBeginVideoCodingKHR;
    PFN_vkCmdEndVideoCodingKHR                                               vkCmdEndVideoCodingKHR;
    PFN_vkCmdControlVideoCodingKHR                                           vkCmdControlVideoCodingKHR;

    // VK_KHR_video_decode_queue
    PFN_vkCmdDecodeVideoKHR                                                  vkCmdDecodeVideoKHR;

    // VK_KHR_external_memory_fd
    PFN_vkGetMemoryFdKHR                                                     vkGetMemoryFdKHR;
    PFN_vkGetMemoryFdPropertiesKHR                                           vkGetMemoryFdPropertiesKHR;

    // VK_KHR_external_semaphore_fd
    PFN_vkImportSemaphoreFdKHR                                               vkImportSemaphoreFdKHR;
    PFN_vkGetSemaphoreFdKHR                                                  vkGetSemaphoreFdKHR;

    // VK_KHR_shared_presentable_image
    PFN_vkGetSwapchainStatusKHR                                              vkGetSwapchainStatusKHR;

    // VK_KHR_external_fence_fd
    PFN_vkImportFenceFdKHR                                                   vkImportFenceFdKHR;
    PFN_vkGetFenceFdKHR                                                      vkGetFenceFdKHR;

    // VK_KHR_performance_query
    PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR      vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR;
    PFN_vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR              vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR;
    PFN_vkAcquireProfilingLockKHR                                            vkAcquireProfilingLockKHR;
    PFN_vkReleaseProfilingLockKHR                                            vkReleaseProfilingLockKHR;

    // VK_KHR_get_surface_capabilities2
    PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR                           vkGetPhysicalDeviceSurfaceCapabilities2KHR;
    PFN_vkGetPhysicalDeviceSurfaceFormats2KHR                                vkGetPhysicalDeviceSurfaceFormats2KHR;

    // VK_KHR_get_display_properties2
    PFN_vkGetPhysicalDeviceDisplayProperties2KHR                             vkGetPhysicalDeviceDisplayProperties2KHR;
    PFN_vkGetPhysicalDeviceDisplayPlaneProperties2KHR                        vkGetPhysicalDeviceDisplayPlaneProperties2KHR;
    PFN_vkGetDisplayModeProperties2KHR                                       vkGetDisplayModeProperties2KHR;
    PFN_vkGetDisplayPlaneCapabilities2KHR                                    vkGetDisplayPlaneCapabilities2KHR;

    // VK_KHR_fragment_shading_rate
    PFN_vkGetPhysicalDeviceFragmentShadingRatesKHR                           vkGetPhysicalDeviceFragmentShadingRatesKHR;
    PFN_vkCmdSetFragmentShadingRateKHR                                       vkCmdSetFragmentShadingRateKHR;

    // VK_KHR_present_wait
    PFN_vkWaitForPresentKHR                                                  vkWaitForPresentKHR;

    // VK_KHR_deferred_host_operations
    PFN_vkCreateDeferredOperationKHR                                         vkCreateDeferredOperationKHR;
    PFN_vkDestroyDeferredOperationKHR                                        vkDestroyDeferredOperationKHR;
    PFN_vkGetDeferredOperationMaxConcurrencyKHR                              vkGetDeferredOperationMaxConcurrencyKHR;
    PFN_vkGetDeferredOperationResultKHR                                      vkGetDeferredOperationResultKHR;
    PFN_vkDeferredOperationJoinKHR                                           vkDeferredOperationJoinKHR;

    // VK_KHR_pipeline_executable_properties
    PFN_vkGetPipelineExecutablePropertiesKHR                                 vkGetPipelineExecutablePropertiesKHR;
    PFN_vkGetPipelineExecutableStatisticsKHR                                 vkGetPipelineExecutableStatisticsKHR;
    PFN_vkGetPipelineExecutableInternalRepresentationsKHR                    vkGetPipelineExecutableInternalRepresentationsKHR;

    // VK_KHR_video_encode_queue
    PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR              vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR;
    PFN_vkGetEncodedVideoSessionParametersKHR                                vkGetEncodedVideoSessionParametersKHR;
    PFN_vkCmdEncodeVideoKHR                                                  vkCmdEncodeVideoKHR;

    // VK_KHR_device_address_commands
    PFN_vkCmdBindIndexBuffer3KHR                                             vkCmdBindIndexBuffer3KHR;
    PFN_vkCmdBindVertexBuffers3KHR                                           vkCmdBindVertexBuffers3KHR;
    PFN_vkCmdDrawIndirect2KHR                                                vkCmdDrawIndirect2KHR;
    PFN_vkCmdDrawIndexedIndirect2KHR                                         vkCmdDrawIndexedIndirect2KHR;
    PFN_vkCmdDispatchIndirect2KHR                                            vkCmdDispatchIndirect2KHR;
    PFN_vkCmdCopyMemoryKHR                                                   vkCmdCopyMemoryKHR;
    PFN_vkCmdCopyMemoryToImageKHR                                            vkCmdCopyMemoryToImageKHR;
    PFN_vkCmdCopyImageToMemoryKHR                                            vkCmdCopyImageToMemoryKHR;
    PFN_vkCmdUpdateMemoryKHR                                                 vkCmdUpdateMemoryKHR;
    PFN_vkCmdFillMemoryKHR                                                   vkCmdFillMemoryKHR;
    PFN_vkCmdCopyQueryPoolResultsToMemoryKHR                                 vkCmdCopyQueryPoolResultsToMemoryKHR;
    PFN_vkCmdDrawIndirectCount2KHR                                           vkCmdDrawIndirectCount2KHR;
    PFN_vkCmdDrawIndexedIndirectCount2KHR                                    vkCmdDrawIndexedIndirectCount2KHR;
    PFN_vkCmdBeginConditionalRendering2EXT                                   vkCmdBeginConditionalRendering2EXT;
    PFN_vkCmdBindTransformFeedbackBuffers2EXT                                vkCmdBindTransformFeedbackBuffers2EXT;
    PFN_vkCmdBeginTransformFeedback2EXT                                      vkCmdBeginTransformFeedback2EXT;
    PFN_vkCmdEndTransformFeedback2EXT                                        vkCmdEndTransformFeedback2EXT;
    PFN_vkCmdDrawIndirectByteCount2EXT                                       vkCmdDrawIndirectByteCount2EXT;
    PFN_vkCmdDrawMeshTasksIndirect2EXT                                       vkCmdDrawMeshTasksIndirect2EXT;
    PFN_vkCmdDrawMeshTasksIndirectCount2EXT                                  vkCmdDrawMeshTasksIndirectCount2EXT;
    PFN_vkCmdWriteMarkerToMemoryAMD                                          vkCmdWriteMarkerToMemoryAMD;
    PFN_vkCreateAccelerationStructure2KHR                                    vkCreateAccelerationStructure2KHR;

    // VK_KHR_ray_tracing_maintenance1
    PFN_vkCmdTraceRaysIndirect2KHR                                           vkCmdTraceRaysIndirect2KHR;

    // VK_KHR_present_wait2
    PFN_vkWaitForPresent2KHR                                                 vkWaitForPresent2KHR;

    // VK_KHR_pipeline_binary
    PFN_vkCreatePipelineBinariesKHR                                          vkCreatePipelineBinariesKHR;
    PFN_vkDestroyPipelineBinaryKHR                                           vkDestroyPipelineBinaryKHR;
    PFN_vkGetPipelineKeyKHR                                                  vkGetPipelineKeyKHR;
    PFN_vkGetPipelineBinaryDataKHR                                           vkGetPipelineBinaryDataKHR;
    PFN_vkReleaseCapturedPipelineDataKHR                                     vkReleaseCapturedPipelineDataKHR;

    // VK_KHR_swapchain_maintenance1
    PFN_vkReleaseSwapchainImagesKHR                                          vkReleaseSwapchainImagesKHR;

    // VK_KHR_cooperative_matrix
    PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR                    vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR;

    // VK_KHR_calibrated_timestamps
    PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR                       vkGetPhysicalDeviceCalibrateableTimeDomainsKHR;
    PFN_vkGetCalibratedTimestampsKHR                                         vkGetCalibratedTimestampsKHR;

    // VK_KHR_maintenance6
    PFN_vkCmdSetDescriptorBufferOffsets2EXT                                  vkCmdSetDescriptorBufferOffsets2EXT;
    PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT                        vkCmdBindDescriptorBufferEmbeddedSamplers2EXT;

    // VK_KHR_copy_memory_indirect
    PFN_vkCmdCopyMemoryIndirectKHR                                           vkCmdCopyMemoryIndirectKHR;
    PFN_vkCmdCopyMemoryToImageIndirectKHR                                    vkCmdCopyMemoryToImageIndirectKHR;

    // VK_KHR_device_fault
    PFN_vkGetDeviceFaultReportsKHR                                           vkGetDeviceFaultReportsKHR;
    PFN_vkGetDeviceFaultDebugInfoKHR                                         vkGetDeviceFaultDebugInfoKHR;

    // VK_KHR_maintenance10
    PFN_vkCmdEndRendering2KHR                                                vkCmdEndRendering2KHR;

    // VK_EXT_debug_report
    PFN_vkCreateDebugReportCallbackEXT                                       vkCreateDebugReportCallbackEXT;
    PFN_vkDestroyDebugReportCallbackEXT                                      vkDestroyDebugReportCallbackEXT;
    PFN_vkDebugReportMessageEXT                                              vkDebugReportMessageEXT;

    // VK_EXT_debug_marker
    PFN_vkDebugMarkerSetObjectTagEXT                                         vkDebugMarkerSetObjectTagEXT;
    PFN_vkDebugMarkerSetObjectNameEXT                                        vkDebugMarkerSetObjectNameEXT;
    PFN_vkCmdDebugMarkerBeginEXT                                             vkCmdDebugMarkerBeginEXT;
    PFN_vkCmdDebugMarkerEndEXT                                               vkCmdDebugMarkerEndEXT;
    PFN_vkCmdDebugMarkerInsertEXT                                            vkCmdDebugMarkerInsertEXT;

    // VK_EXT_transform_feedback
    PFN_vkCmdBindTransformFeedbackBuffersEXT                                 vkCmdBindTransformFeedbackBuffersEXT;
    PFN_vkCmdBeginTransformFeedbackEXT                                       vkCmdBeginTransformFeedbackEXT;
    PFN_vkCmdEndTransformFeedbackEXT                                         vkCmdEndTransformFeedbackEXT;
    PFN_vkCmdBeginQueryIndexedEXT                                            vkCmdBeginQueryIndexedEXT;
    PFN_vkCmdEndQueryIndexedEXT                                              vkCmdEndQueryIndexedEXT;
    PFN_vkCmdDrawIndirectByteCountEXT                                        vkCmdDrawIndirectByteCountEXT;

    // VK_NVX_binary_import
    PFN_vkCreateCuModuleNVX                                                  vkCreateCuModuleNVX;
    PFN_vkCreateCuFunctionNVX                                                vkCreateCuFunctionNVX;
    PFN_vkDestroyCuModuleNVX                                                 vkDestroyCuModuleNVX;
    PFN_vkDestroyCuFunctionNVX                                               vkDestroyCuFunctionNVX;
    PFN_vkCmdCuLaunchKernelNVX                                               vkCmdCuLaunchKernelNVX;

    // VK_NVX_image_view_handle
    PFN_vkGetImageViewHandleNVX                                              vkGetImageViewHandleNVX;
    PFN_vkGetImageViewHandle64NVX                                            vkGetImageViewHandle64NVX;
    PFN_vkGetImageViewAddressNVX                                             vkGetImageViewAddressNVX;
    PFN_vkGetDeviceCombinedImageSamplerIndexNVX                              vkGetDeviceCombinedImageSamplerIndexNVX;

    // VK_AMD_shader_info
    PFN_vkGetShaderInfoAMD                                                   vkGetShaderInfoAMD;

    // VK_NV_external_memory_capabilities
    PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV                   vkGetPhysicalDeviceExternalImageFormatPropertiesNV;

    // VK_EXT_conditional_rendering
    PFN_vkCmdBeginConditionalRenderingEXT                                    vkCmdBeginConditionalRenderingEXT;
    PFN_vkCmdEndConditionalRenderingEXT                                      vkCmdEndConditionalRenderingEXT;

    // VK_NV_clip_space_w_scaling
    PFN_vkCmdSetViewportWScalingNV                                           vkCmdSetViewportWScalingNV;

    // VK_EXT_direct_mode_display
    PFN_vkReleaseDisplayEXT                                                  vkReleaseDisplayEXT;

    // VK_EXT_display_surface_counter
    PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT                           vkGetPhysicalDeviceSurfaceCapabilities2EXT;

    // VK_EXT_display_control
    PFN_vkDisplayPowerControlEXT                                             vkDisplayPowerControlEXT;
    PFN_vkRegisterDeviceEventEXT                                             vkRegisterDeviceEventEXT;
    PFN_vkRegisterDisplayEventEXT                                            vkRegisterDisplayEventEXT;
    PFN_vkGetSwapchainCounterEXT                                             vkGetSwapchainCounterEXT;

    // VK_GOOGLE_display_timing
    PFN_vkGetRefreshCycleDurationGOOGLE                                      vkGetRefreshCycleDurationGOOGLE;
    PFN_vkGetPastPresentationTimingGOOGLE                                    vkGetPastPresentationTimingGOOGLE;

    // VK_EXT_discard_rectangles
    PFN_vkCmdSetDiscardRectangleEXT                                          vkCmdSetDiscardRectangleEXT;
    PFN_vkCmdSetDiscardRectangleEnableEXT                                    vkCmdSetDiscardRectangleEnableEXT;
    PFN_vkCmdSetDiscardRectangleModeEXT                                      vkCmdSetDiscardRectangleModeEXT;

    // VK_EXT_hdr_metadata
    PFN_vkSetHdrMetadataEXT                                                  vkSetHdrMetadataEXT;

    // VK_EXT_debug_utils
    PFN_vkSetDebugUtilsObjectNameEXT                                         vkSetDebugUtilsObjectNameEXT;
    PFN_vkSetDebugUtilsObjectTagEXT                                          vkSetDebugUtilsObjectTagEXT;
    PFN_vkQueueBeginDebugUtilsLabelEXT                                       vkQueueBeginDebugUtilsLabelEXT;
    PFN_vkQueueEndDebugUtilsLabelEXT                                         vkQueueEndDebugUtilsLabelEXT;
    PFN_vkQueueInsertDebugUtilsLabelEXT                                      vkQueueInsertDebugUtilsLabelEXT;
    PFN_vkCmdBeginDebugUtilsLabelEXT                                         vkCmdBeginDebugUtilsLabelEXT;
    PFN_vkCmdEndDebugUtilsLabelEXT                                           vkCmdEndDebugUtilsLabelEXT;
    PFN_vkCmdInsertDebugUtilsLabelEXT                                        vkCmdInsertDebugUtilsLabelEXT;
    PFN_vkCreateDebugUtilsMessengerEXT                                       vkCreateDebugUtilsMessengerEXT;
    PFN_vkDestroyDebugUtilsMessengerEXT                                      vkDestroyDebugUtilsMessengerEXT;
    PFN_vkSubmitDebugUtilsMessageEXT                                         vkSubmitDebugUtilsMessageEXT;

    // VK_AMD_gpa_interface
    PFN_vkCreateGpaSessionAMD                                                vkCreateGpaSessionAMD;
    PFN_vkDestroyGpaSessionAMD                                               vkDestroyGpaSessionAMD;
    PFN_vkSetGpaDeviceClockModeAMD                                           vkSetGpaDeviceClockModeAMD;
    PFN_vkGetGpaDeviceClockInfoAMD                                           vkGetGpaDeviceClockInfoAMD;
    PFN_vkCmdBeginGpaSessionAMD                                              vkCmdBeginGpaSessionAMD;
    PFN_vkCmdEndGpaSessionAMD                                                vkCmdEndGpaSessionAMD;
    PFN_vkCmdBeginGpaSampleAMD                                               vkCmdBeginGpaSampleAMD;
    PFN_vkCmdEndGpaSampleAMD                                                 vkCmdEndGpaSampleAMD;
    PFN_vkGetGpaSessionStatusAMD                                             vkGetGpaSessionStatusAMD;
    PFN_vkGetGpaSessionResultsAMD                                            vkGetGpaSessionResultsAMD;
    PFN_vkResetGpaSessionAMD                                                 vkResetGpaSessionAMD;
    PFN_vkCmdCopyGpaSessionResultsAMD                                        vkCmdCopyGpaSessionResultsAMD;

    // VK_EXT_descriptor_heap
    PFN_vkWriteSamplerDescriptorsEXT                                         vkWriteSamplerDescriptorsEXT;
    PFN_vkWriteResourceDescriptorsEXT                                        vkWriteResourceDescriptorsEXT;
    PFN_vkCmdBindSamplerHeapEXT                                              vkCmdBindSamplerHeapEXT;
    PFN_vkCmdBindResourceHeapEXT                                             vkCmdBindResourceHeapEXT;
    PFN_vkCmdPushDataEXT                                                     vkCmdPushDataEXT;
    PFN_vkGetImageOpaqueCaptureDataEXT                                       vkGetImageOpaqueCaptureDataEXT;
    PFN_vkGetPhysicalDeviceDescriptorSizeEXT                                 vkGetPhysicalDeviceDescriptorSizeEXT;
    PFN_vkRegisterCustomBorderColorEXT                                       vkRegisterCustomBorderColorEXT;
    PFN_vkUnregisterCustomBorderColorEXT                                     vkUnregisterCustomBorderColorEXT;
    PFN_vkGetTensorOpaqueCaptureDataARM                                      vkGetTensorOpaqueCaptureDataARM;

    // VK_EXT_sample_locations
    PFN_vkCmdSetSampleLocationsEXT                                           vkCmdSetSampleLocationsEXT;
    PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT                          vkGetPhysicalDeviceMultisamplePropertiesEXT;

    // VK_EXT_image_drm_format_modifier
    PFN_vkGetImageDrmFormatModifierPropertiesEXT                             vkGetImageDrmFormatModifierPropertiesEXT;

    // VK_EXT_validation_cache
    PFN_vkCreateValidationCacheEXT                                           vkCreateValidationCacheEXT;
    PFN_vkDestroyValidationCacheEXT                                          vkDestroyValidationCacheEXT;
    PFN_vkMergeValidationCachesEXT                                           vkMergeValidationCachesEXT;
    PFN_vkGetValidationCacheDataEXT                                          vkGetValidationCacheDataEXT;

    // VK_NV_shading_rate_image
    PFN_vkCmdBindShadingRateImageNV                                          vkCmdBindShadingRateImageNV;
    PFN_vkCmdSetViewportShadingRatePaletteNV                                 vkCmdSetViewportShadingRatePaletteNV;
    PFN_vkCmdSetCoarseSampleOrderNV                                          vkCmdSetCoarseSampleOrderNV;

    // VK_NV_ray_tracing
    PFN_vkCreateAccelerationStructureNV                                      vkCreateAccelerationStructureNV;
    PFN_vkDestroyAccelerationStructureNV                                     vkDestroyAccelerationStructureNV;
    PFN_vkGetAccelerationStructureMemoryRequirementsNV                       vkGetAccelerationStructureMemoryRequirementsNV;
    PFN_vkBindAccelerationStructureMemoryNV                                  vkBindAccelerationStructureMemoryNV;
    PFN_vkCmdBuildAccelerationStructureNV                                    vkCmdBuildAccelerationStructureNV;
    PFN_vkCmdCopyAccelerationStructureNV                                     vkCmdCopyAccelerationStructureNV;
    PFN_vkCmdTraceRaysNV                                                     vkCmdTraceRaysNV;
    PFN_vkCreateRayTracingPipelinesNV                                        vkCreateRayTracingPipelinesNV;
    PFN_vkGetRayTracingShaderGroupHandlesKHR                                 vkGetRayTracingShaderGroupHandlesKHR;
    PFN_vkGetAccelerationStructureHandleNV                                   vkGetAccelerationStructureHandleNV;
    PFN_vkCmdWriteAccelerationStructuresPropertiesNV                         vkCmdWriteAccelerationStructuresPropertiesNV;
    PFN_vkCompileDeferredNV                                                  vkCompileDeferredNV;

    // VK_EXT_external_memory_host
    PFN_vkGetMemoryHostPointerPropertiesEXT                                  vkGetMemoryHostPointerPropertiesEXT;

    // VK_AMD_buffer_marker
    PFN_vkCmdWriteBufferMarkerAMD                                            vkCmdWriteBufferMarkerAMD;
    PFN_vkCmdWriteBufferMarker2AMD                                           vkCmdWriteBufferMarker2AMD;

    // VK_NV_mesh_shader
    PFN_vkCmdDrawMeshTasksNV                                                 vkCmdDrawMeshTasksNV;
    PFN_vkCmdDrawMeshTasksIndirectNV                                         vkCmdDrawMeshTasksIndirectNV;
    PFN_vkCmdDrawMeshTasksIndirectCountNV                                    vkCmdDrawMeshTasksIndirectCountNV;

    // VK_NV_scissor_exclusive
    PFN_vkCmdSetExclusiveScissorEnableNV                                     vkCmdSetExclusiveScissorEnableNV;
    PFN_vkCmdSetExclusiveScissorNV                                           vkCmdSetExclusiveScissorNV;

    // VK_NV_device_diagnostic_checkpoints
    PFN_vkCmdSetCheckpointNV                                                 vkCmdSetCheckpointNV;
    PFN_vkGetQueueCheckpointDataNV                                           vkGetQueueCheckpointDataNV;
    PFN_vkGetQueueCheckpointData2NV                                          vkGetQueueCheckpointData2NV;

    // VK_EXT_present_timing
    PFN_vkSetSwapchainPresentTimingQueueSizeEXT                              vkSetSwapchainPresentTimingQueueSizeEXT;
    PFN_vkGetSwapchainTimingPropertiesEXT                                    vkGetSwapchainTimingPropertiesEXT;
    PFN_vkGetSwapchainTimeDomainPropertiesEXT                                vkGetSwapchainTimeDomainPropertiesEXT;
    PFN_vkGetPastPresentationTimingEXT                                       vkGetPastPresentationTimingEXT;

    // VK_INTEL_performance_query
    PFN_vkInitializePerformanceApiINTEL                                      vkInitializePerformanceApiINTEL;
    PFN_vkUninitializePerformanceApiINTEL                                    vkUninitializePerformanceApiINTEL;
    PFN_vkCmdSetPerformanceMarkerINTEL                                       vkCmdSetPerformanceMarkerINTEL;
    PFN_vkCmdSetPerformanceStreamMarkerINTEL                                 vkCmdSetPerformanceStreamMarkerINTEL;
    PFN_vkCmdSetPerformanceOverrideINTEL                                     vkCmdSetPerformanceOverrideINTEL;
    PFN_vkAcquirePerformanceConfigurationINTEL                               vkAcquirePerformanceConfigurationINTEL;
    PFN_vkReleasePerformanceConfigurationINTEL                               vkReleasePerformanceConfigurationINTEL;
    PFN_vkQueueSetPerformanceConfigurationINTEL                              vkQueueSetPerformanceConfigurationINTEL;
    PFN_vkGetPerformanceParameterINTEL                                       vkGetPerformanceParameterINTEL;

    // VK_AMD_display_native_hdr
    PFN_vkSetLocalDimmingAMD                                                 vkSetLocalDimmingAMD;

    // VK_NV_cooperative_matrix
    PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV                     vkGetPhysicalDeviceCooperativeMatrixPropertiesNV;

    // VK_NV_coverage_reduction_mode
    PFN_vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV    vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV;

    // VK_EXT_headless_surface
    PFN_vkCreateHeadlessSurfaceEXT                                           vkCreateHeadlessSurfaceEXT;

    // VK_NV_device_generated_commands
    PFN_vkGetGeneratedCommandsMemoryRequirementsNV                           vkGetGeneratedCommandsMemoryRequirementsNV;
    PFN_vkCmdPreprocessGeneratedCommandsNV                                   vkCmdPreprocessGeneratedCommandsNV;
    PFN_vkCmdExecuteGeneratedCommandsNV                                      vkCmdExecuteGeneratedCommandsNV;
    PFN_vkCmdBindPipelineShaderGroupNV                                       vkCmdBindPipelineShaderGroupNV;
    PFN_vkCreateIndirectCommandsLayoutNV                                     vkCreateIndirectCommandsLayoutNV;
    PFN_vkDestroyIndirectCommandsLayoutNV                                    vkDestroyIndirectCommandsLayoutNV;

    // VK_EXT_depth_bias_control
    PFN_vkCmdSetDepthBias2EXT                                                vkCmdSetDepthBias2EXT;

    // VK_EXT_acquire_drm_display
    PFN_vkAcquireDrmDisplayEXT                                               vkAcquireDrmDisplayEXT;
    PFN_vkGetDrmDisplayEXT                                                   vkGetDrmDisplayEXT;

    // VK_QCOM_queue_perf_hint
    PFN_vkQueueSetPerfHintQCOM                                               vkQueueSetPerfHintQCOM;

    // VK_QCOM_tile_shading
    PFN_vkCmdDispatchTileQCOM                                                vkCmdDispatchTileQCOM;
    PFN_vkCmdBeginPerTileExecutionQCOM                                       vkCmdBeginPerTileExecutionQCOM;
    PFN_vkCmdEndPerTileExecutionQCOM                                         vkCmdEndPerTileExecutionQCOM;

    // VK_NV_low_latency
    PFN_vkSetLatencySleepModeLegacyNV                                        vkSetLatencySleepModeLegacyNV;
    PFN_vkLatencySleepLegacyNV                                               vkLatencySleepLegacyNV;
    PFN_vkSetLatencyMarkerLegacyNV                                           vkSetLatencyMarkerLegacyNV;
    PFN_vkGetLatencyTimingsLegacyNV                                          vkGetLatencyTimingsLegacyNV;
    PFN_vkQueueNotifyOutOfBandLegacyNV                                       vkQueueNotifyOutOfBandLegacyNV;
    PFN_vkGetSleepStatusLegacyNV                                             vkGetSleepStatusLegacyNV;
    PFN_vkShutdownLatencyDeviceLegacyNV                                      vkShutdownLatencyDeviceLegacyNV;

    // VK_EXT_descriptor_buffer
    PFN_vkGetDescriptorSetLayoutSizeEXT                                      vkGetDescriptorSetLayoutSizeEXT;
    PFN_vkGetDescriptorSetLayoutBindingOffsetEXT                             vkGetDescriptorSetLayoutBindingOffsetEXT;
    PFN_vkGetDescriptorEXT                                                   vkGetDescriptorEXT;
    PFN_vkCmdBindDescriptorBuffersEXT                                        vkCmdBindDescriptorBuffersEXT;
    PFN_vkCmdSetDescriptorBufferOffsetsEXT                                   vkCmdSetDescriptorBufferOffsetsEXT;
    PFN_vkCmdBindDescriptorBufferEmbeddedSamplersEXT                         vkCmdBindDescriptorBufferEmbeddedSamplersEXT;
    PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT                            vkGetBufferOpaqueCaptureDescriptorDataEXT;
    PFN_vkGetImageOpaqueCaptureDescriptorDataEXT                             vkGetImageOpaqueCaptureDescriptorDataEXT;
    PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT                         vkGetImageViewOpaqueCaptureDescriptorDataEXT;
    PFN_vkGetSamplerOpaqueCaptureDescriptorDataEXT                           vkGetSamplerOpaqueCaptureDescriptorDataEXT;
    PFN_vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT             vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT;

    // VK_NV_fragment_shading_rate_enums
    PFN_vkCmdSetFragmentShadingRateEnumNV                                    vkCmdSetFragmentShadingRateEnumNV;

    // VK_EXT_device_fault
    PFN_vkGetDeviceFaultInfoEXT                                              vkGetDeviceFaultInfoEXT;

    // VK_EXT_vertex_input_dynamic_state
    PFN_vkCmdSetVertexInputEXT                                               vkCmdSetVertexInputEXT;

    // VK_HUAWEI_subpass_shading
    PFN_vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI                      vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI;
    PFN_vkCmdSubpassShadingHUAWEI                                            vkCmdSubpassShadingHUAWEI;

    // VK_HUAWEI_invocation_mask
    PFN_vkCmdBindInvocationMaskHUAWEI                                        vkCmdBindInvocationMaskHUAWEI;

    // VK_NV_external_memory_rdma
    PFN_vkGetMemoryRemoteAddressNV                                           vkGetMemoryRemoteAddressNV;

    // VK_EXT_pipeline_properties
    PFN_vkGetPipelinePropertiesEXT                                           vkGetPipelinePropertiesEXT;

    // VK_EXT_extended_dynamic_state2
    PFN_vkCmdSetPatchControlPointsEXT                                        vkCmdSetPatchControlPointsEXT;
    PFN_vkCmdSetLogicOpEXT                                                   vkCmdSetLogicOpEXT;

    // VK_EXT_color_write_enable
    PFN_vkCmdSetColorWriteEnableEXT                                          vkCmdSetColorWriteEnableEXT;

    // VK_EXT_multi_draw
    PFN_vkCmdDrawMultiEXT                                                    vkCmdDrawMultiEXT;
    PFN_vkCmdDrawMultiIndexedEXT                                             vkCmdDrawMultiIndexedEXT;

    // VK_EXT_opacity_micromap
    PFN_vkCreateMicromapEXT                                                  vkCreateMicromapEXT;
    PFN_vkDestroyMicromapEXT                                                 vkDestroyMicromapEXT;
    PFN_vkCmdBuildMicromapsEXT                                               vkCmdBuildMicromapsEXT;
    PFN_vkBuildMicromapsEXT                                                  vkBuildMicromapsEXT;
    PFN_vkCopyMicromapEXT                                                    vkCopyMicromapEXT;
    PFN_vkCopyMicromapToMemoryEXT                                            vkCopyMicromapToMemoryEXT;
    PFN_vkCopyMemoryToMicromapEXT                                            vkCopyMemoryToMicromapEXT;
    PFN_vkWriteMicromapsPropertiesEXT                                        vkWriteMicromapsPropertiesEXT;
    PFN_vkCmdCopyMicromapEXT                                                 vkCmdCopyMicromapEXT;
    PFN_vkCmdCopyMicromapToMemoryEXT                                         vkCmdCopyMicromapToMemoryEXT;
    PFN_vkCmdCopyMemoryToMicromapEXT                                         vkCmdCopyMemoryToMicromapEXT;
    PFN_vkCmdWriteMicromapsPropertiesEXT                                     vkCmdWriteMicromapsPropertiesEXT;
    PFN_vkGetDeviceMicromapCompatibilityEXT                                  vkGetDeviceMicromapCompatibilityEXT;
    PFN_vkGetMicromapBuildSizesEXT                                           vkGetMicromapBuildSizesEXT;

    // VK_HUAWEI_cluster_culling_shader
    PFN_vkCmdDrawClusterHUAWEI                                               vkCmdDrawClusterHUAWEI;
    PFN_vkCmdDrawClusterIndirectHUAWEI                                       vkCmdDrawClusterIndirectHUAWEI;

    // VK_EXT_pageable_device_local_memory
    PFN_vkSetDeviceMemoryPriorityEXT                                         vkSetDeviceMemoryPriorityEXT;

    // VK_ARM_scheduling_controls
    PFN_vkCmdSetDispatchParametersARM                                        vkCmdSetDispatchParametersARM;

    // VK_VALVE_descriptor_set_host_mapping
    PFN_vkGetDescriptorSetLayoutHostMappingInfoVALVE                         vkGetDescriptorSetLayoutHostMappingInfoVALVE;
    PFN_vkGetDescriptorSetHostMappingVALVE                                   vkGetDescriptorSetHostMappingVALVE;

    // VK_NV_copy_memory_indirect
    PFN_vkCmdCopyMemoryIndirectNV                                            vkCmdCopyMemoryIndirectNV;
    PFN_vkCmdCopyMemoryToImageIndirectNV                                     vkCmdCopyMemoryToImageIndirectNV;

    // VK_NV_memory_decompression
    PFN_vkCmdDecompressMemoryNV                                              vkCmdDecompressMemoryNV;
    PFN_vkCmdDecompressMemoryIndirectCountNV                                 vkCmdDecompressMemoryIndirectCountNV;

    // VK_NV_device_generated_commands_compute
    PFN_vkGetPipelineIndirectMemoryRequirementsNV                            vkGetPipelineIndirectMemoryRequirementsNV;
    PFN_vkCmdUpdatePipelineIndirectBufferNV                                  vkCmdUpdatePipelineIndirectBufferNV;
    PFN_vkGetPipelineIndirectDeviceAddressNV                                 vkGetPipelineIndirectDeviceAddressNV;

    // VK_EXT_extended_dynamic_state3
    PFN_vkCmdSetDepthClampEnableEXT                                          vkCmdSetDepthClampEnableEXT;
    PFN_vkCmdSetPolygonModeEXT                                               vkCmdSetPolygonModeEXT;
    PFN_vkCmdSetRasterizationSamplesEXT                                      vkCmdSetRasterizationSamplesEXT;
    PFN_vkCmdSetSampleMaskEXT                                                vkCmdSetSampleMaskEXT;
    PFN_vkCmdSetAlphaToCoverageEnableEXT                                     vkCmdSetAlphaToCoverageEnableEXT;
    PFN_vkCmdSetAlphaToOneEnableEXT                                          vkCmdSetAlphaToOneEnableEXT;
    PFN_vkCmdSetLogicOpEnableEXT                                             vkCmdSetLogicOpEnableEXT;
    PFN_vkCmdSetColorBlendEnableEXT                                          vkCmdSetColorBlendEnableEXT;
    PFN_vkCmdSetColorBlendEquationEXT                                        vkCmdSetColorBlendEquationEXT;
    PFN_vkCmdSetColorWriteMaskEXT                                            vkCmdSetColorWriteMaskEXT;
    PFN_vkCmdSetTessellationDomainOriginEXT                                  vkCmdSetTessellationDomainOriginEXT;
    PFN_vkCmdSetRasterizationStreamEXT                                       vkCmdSetRasterizationStreamEXT;
    PFN_vkCmdSetConservativeRasterizationModeEXT                             vkCmdSetConservativeRasterizationModeEXT;
    PFN_vkCmdSetExtraPrimitiveOverestimationSizeEXT                          vkCmdSetExtraPrimitiveOverestimationSizeEXT;
    PFN_vkCmdSetDepthClipEnableEXT                                           vkCmdSetDepthClipEnableEXT;
    PFN_vkCmdSetSampleLocationsEnableEXT                                     vkCmdSetSampleLocationsEnableEXT;
    PFN_vkCmdSetColorBlendAdvancedEXT                                        vkCmdSetColorBlendAdvancedEXT;
    PFN_vkCmdSetProvokingVertexModeEXT                                       vkCmdSetProvokingVertexModeEXT;
    PFN_vkCmdSetLineRasterizationModeEXT                                     vkCmdSetLineRasterizationModeEXT;
    PFN_vkCmdSetLineStippleEnableEXT                                         vkCmdSetLineStippleEnableEXT;
    PFN_vkCmdSetDepthClipNegativeOneToOneEXT                                 vkCmdSetDepthClipNegativeOneToOneEXT;
    PFN_vkCmdSetViewportWScalingEnableNV                                     vkCmdSetViewportWScalingEnableNV;
    PFN_vkCmdSetViewportSwizzleNV                                            vkCmdSetViewportSwizzleNV;
    PFN_vkCmdSetCoverageToColorEnableNV                                      vkCmdSetCoverageToColorEnableNV;
    PFN_vkCmdSetCoverageToColorLocationNV                                    vkCmdSetCoverageToColorLocationNV;
    PFN_vkCmdSetCoverageModulationModeNV                                     vkCmdSetCoverageModulationModeNV;
    PFN_vkCmdSetCoverageModulationTableEnableNV                              vkCmdSetCoverageModulationTableEnableNV;
    PFN_vkCmdSetCoverageModulationTableNV                                    vkCmdSetCoverageModulationTableNV;
    PFN_vkCmdSetShadingRateImageEnableNV                                     vkCmdSetShadingRateImageEnableNV;
    PFN_vkCmdSetRepresentativeFragmentTestEnableNV                           vkCmdSetRepresentativeFragmentTestEnableNV;
    PFN_vkCmdSetCoverageReductionModeNV                                      vkCmdSetCoverageReductionModeNV;

    // VK_ARM_tensors
    PFN_vkCreateTensorARM                                                    vkCreateTensorARM;
    PFN_vkDestroyTensorARM                                                   vkDestroyTensorARM;
    PFN_vkCreateTensorViewARM                                                vkCreateTensorViewARM;
    PFN_vkDestroyTensorViewARM                                               vkDestroyTensorViewARM;
    PFN_vkGetTensorMemoryRequirementsARM                                     vkGetTensorMemoryRequirementsARM;
    PFN_vkBindTensorMemoryARM                                                vkBindTensorMemoryARM;
    PFN_vkGetDeviceTensorMemoryRequirementsARM                               vkGetDeviceTensorMemoryRequirementsARM;
    PFN_vkCmdCopyTensorARM                                                   vkCmdCopyTensorARM;
    PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM                       vkGetPhysicalDeviceExternalTensorPropertiesARM;
    PFN_vkGetTensorOpaqueCaptureDescriptorDataARM                            vkGetTensorOpaqueCaptureDescriptorDataARM;
    PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM                        vkGetTensorViewOpaqueCaptureDescriptorDataARM;

    // VK_EXT_shader_module_identifier
    PFN_vkGetShaderModuleIdentifierEXT                                       vkGetShaderModuleIdentifierEXT;
    PFN_vkGetShaderModuleCreateInfoIdentifierEXT                             vkGetShaderModuleCreateInfoIdentifierEXT;

    // VK_NV_optical_flow
    PFN_vkGetPhysicalDeviceOpticalFlowImageFormatsNV                         vkGetPhysicalDeviceOpticalFlowImageFormatsNV;
    PFN_vkCreateOpticalFlowSessionNV                                         vkCreateOpticalFlowSessionNV;
    PFN_vkDestroyOpticalFlowSessionNV                                        vkDestroyOpticalFlowSessionNV;
    PFN_vkBindOpticalFlowSessionImageNV                                      vkBindOpticalFlowSessionImageNV;
    PFN_vkCmdOpticalFlowExecuteNV                                            vkCmdOpticalFlowExecuteNV;

    // VK_AMD_anti_lag
    PFN_vkAntiLagUpdateAMD                                                   vkAntiLagUpdateAMD;

    // VK_EXT_shader_object
    PFN_vkCreateShadersEXT                                                   vkCreateShadersEXT;
    PFN_vkDestroyShaderEXT                                                   vkDestroyShaderEXT;
    PFN_vkGetShaderBinaryDataEXT                                             vkGetShaderBinaryDataEXT;
    PFN_vkCmdBindShadersEXT                                                  vkCmdBindShadersEXT;
    PFN_vkCmdSetDepthClampRangeEXT                                           vkCmdSetDepthClampRangeEXT;

    // VK_QCOM_tile_properties
    PFN_vkGetFramebufferTilePropertiesQCOM                                   vkGetFramebufferTilePropertiesQCOM;
    PFN_vkGetDynamicRenderingTilePropertiesQCOM                              vkGetDynamicRenderingTilePropertiesQCOM;

    // VK_NV_cooperative_vector
    PFN_vkGetPhysicalDeviceCooperativeVectorPropertiesNV                     vkGetPhysicalDeviceCooperativeVectorPropertiesNV;
    PFN_vkConvertCooperativeVectorMatrixNV                                   vkConvertCooperativeVectorMatrixNV;
    PFN_vkCmdConvertCooperativeVectorMatrixNV                                vkCmdConvertCooperativeVectorMatrixNV;

    // VK_NV_low_latency2
    PFN_vkSetLatencySleepModeNV                                              vkSetLatencySleepModeNV;
    PFN_vkLatencySleepNV                                                     vkLatencySleepNV;
    PFN_vkSetLatencyMarkerNV                                                 vkSetLatencyMarkerNV;
    PFN_vkGetLatencyTimingsNV                                                vkGetLatencyTimingsNV;
    PFN_vkQueueNotifyOutOfBandNV                                             vkQueueNotifyOutOfBandNV;

    // VK_ARM_data_graph
    PFN_vkCreateDataGraphPipelinesARM                                        vkCreateDataGraphPipelinesARM;
    PFN_vkCreateDataGraphPipelineSessionARM                                  vkCreateDataGraphPipelineSessionARM;
    PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM                vkGetDataGraphPipelineSessionBindPointRequirementsARM;
    PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM                   vkGetDataGraphPipelineSessionMemoryRequirementsARM;
    PFN_vkBindDataGraphPipelineSessionMemoryARM                              vkBindDataGraphPipelineSessionMemoryARM;
    PFN_vkDestroyDataGraphPipelineSessionARM                                 vkDestroyDataGraphPipelineSessionARM;
    PFN_vkCmdDispatchDataGraphARM                                            vkCmdDispatchDataGraphARM;
    PFN_vkGetDataGraphPipelineAvailablePropertiesARM                         vkGetDataGraphPipelineAvailablePropertiesARM;
    PFN_vkGetDataGraphPipelinePropertiesARM                                  vkGetDataGraphPipelinePropertiesARM;
    PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM                 vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM;
    PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM;

    // VK_ARM_data_graph_instruction_set_tosa
    PFN_vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM  vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM;

    // VK_EXT_attachment_feedback_loop_dynamic_state
    PFN_vkCmdSetAttachmentFeedbackLoopEnableEXT                              vkCmdSetAttachmentFeedbackLoopEnableEXT;

    // VK_QCOM_tile_memory_heap
    PFN_vkCmdBindTileMemoryQCOM                                              vkCmdBindTileMemoryQCOM;

    // VK_EXT_memory_decompression
    PFN_vkCmdDecompressMemoryEXT                                             vkCmdDecompressMemoryEXT;
    PFN_vkCmdDecompressMemoryIndirectCountEXT                                vkCmdDecompressMemoryIndirectCountEXT;

    // VK_NV_external_compute_queue
    PFN_vkCreateExternalComputeQueueNV                                       vkCreateExternalComputeQueueNV;
    PFN_vkDestroyExternalComputeQueueNV                                      vkDestroyExternalComputeQueueNV;
    PFN_vkGetExternalComputeQueueDataNV                                      vkGetExternalComputeQueueDataNV;

    // VK_NV_cluster_acceleration_structure
    PFN_vkGetClusterAccelerationStructureBuildSizesNV                        vkGetClusterAccelerationStructureBuildSizesNV;
    PFN_vkCmdBuildClusterAccelerationStructureIndirectNV                     vkCmdBuildClusterAccelerationStructureIndirectNV;

    // VK_NV_partitioned_acceleration_structure
    PFN_vkGetPartitionedAccelerationStructuresBuildSizesNV                   vkGetPartitionedAccelerationStructuresBuildSizesNV;
    PFN_vkCmdBuildPartitionedAccelerationStructuresNV                        vkCmdBuildPartitionedAccelerationStructuresNV;

    // VK_EXT_device_generated_commands
    PFN_vkGetGeneratedCommandsMemoryRequirementsEXT                          vkGetGeneratedCommandsMemoryRequirementsEXT;
    PFN_vkCmdPreprocessGeneratedCommandsEXT                                  vkCmdPreprocessGeneratedCommandsEXT;
    PFN_vkCmdExecuteGeneratedCommandsEXT                                     vkCmdExecuteGeneratedCommandsEXT;
    PFN_vkCreateIndirectCommandsLayoutEXT                                    vkCreateIndirectCommandsLayoutEXT;
    PFN_vkDestroyIndirectCommandsLayoutEXT                                   vkDestroyIndirectCommandsLayoutEXT;
    PFN_vkCreateIndirectExecutionSetEXT                                      vkCreateIndirectExecutionSetEXT;
    PFN_vkDestroyIndirectExecutionSetEXT                                     vkDestroyIndirectExecutionSetEXT;
    PFN_vkUpdateIndirectExecutionSetPipelineEXT                              vkUpdateIndirectExecutionSetPipelineEXT;
    PFN_vkUpdateIndirectExecutionSetShaderEXT                                vkUpdateIndirectExecutionSetShaderEXT;

    // VK_NV_cooperative_matrix2
    PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV   vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV;

    // VK_ARM_performance_counters_by_region
    PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM   vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM;

    // VK_ARM_shader_instrumentation
    PFN_vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM             vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM;
    PFN_vkCreateShaderInstrumentationARM                                     vkCreateShaderInstrumentationARM;
    PFN_vkDestroyShaderInstrumentationARM                                    vkDestroyShaderInstrumentationARM;
    PFN_vkCmdBeginShaderInstrumentationARM                                   vkCmdBeginShaderInstrumentationARM;
    PFN_vkCmdEndShaderInstrumentationARM                                     vkCmdEndShaderInstrumentationARM;
    PFN_vkGetShaderInstrumentationValuesARM                                  vkGetShaderInstrumentationValuesARM;
    PFN_vkClearShaderInstrumentationMetricsARM                               vkClearShaderInstrumentationMetricsARM;

    // VK_EXT_custom_resolve
    PFN_vkCmdBeginCustomResolveEXT                                           vkCmdBeginCustomResolveEXT;

    // VK_ARM_data_graph_optical_flow
    PFN_vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM    vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM;

    // VK_NV_compute_occupancy_priority
    PFN_vkCmdSetComputeOccupancyPriorityNV                                   vkCmdSetComputeOccupancyPriorityNV;

    // VK_EXT_cooperative_matrix_maintenance1
    PFN_vkGetPhysicalDeviceCooperativeMatrixProperties2EXT                   vkGetPhysicalDeviceCooperativeMatrixProperties2EXT;

    // VK_EXT_primitive_restart_index
    PFN_vkCmdSetPrimitiveRestartIndexEXT                                     vkCmdSetPrimitiveRestartIndexEXT;

    // VK_KHR_acceleration_structure
    PFN_vkCreateAccelerationStructureKHR                                     vkCreateAccelerationStructureKHR;
    PFN_vkDestroyAccelerationStructureKHR                                    vkDestroyAccelerationStructureKHR;
    PFN_vkCmdBuildAccelerationStructuresKHR                                  vkCmdBuildAccelerationStructuresKHR;
    PFN_vkCmdBuildAccelerationStructuresIndirectKHR                          vkCmdBuildAccelerationStructuresIndirectKHR;
    PFN_vkBuildAccelerationStructuresKHR                                     vkBuildAccelerationStructuresKHR;
    PFN_vkCopyAccelerationStructureKHR                                       vkCopyAccelerationStructureKHR;
    PFN_vkCopyAccelerationStructureToMemoryKHR                               vkCopyAccelerationStructureToMemoryKHR;
    PFN_vkCopyMemoryToAccelerationStructureKHR                               vkCopyMemoryToAccelerationStructureKHR;
    PFN_vkWriteAccelerationStructuresPropertiesKHR                           vkWriteAccelerationStructuresPropertiesKHR;
    PFN_vkCmdCopyAccelerationStructureKHR                                    vkCmdCopyAccelerationStructureKHR;
    PFN_vkCmdCopyAccelerationStructureToMemoryKHR                            vkCmdCopyAccelerationStructureToMemoryKHR;
    PFN_vkCmdCopyMemoryToAccelerationStructureKHR                            vkCmdCopyMemoryToAccelerationStructureKHR;
    PFN_vkGetAccelerationStructureDeviceAddressKHR                           vkGetAccelerationStructureDeviceAddressKHR;
    PFN_vkCmdWriteAccelerationStructuresPropertiesKHR                        vkCmdWriteAccelerationStructuresPropertiesKHR;
    PFN_vkGetDeviceAccelerationStructureCompatibilityKHR                     vkGetDeviceAccelerationStructureCompatibilityKHR;
    PFN_vkGetAccelerationStructureBuildSizesKHR                              vkGetAccelerationStructureBuildSizesKHR;

    // VK_KHR_ray_tracing_pipeline
    PFN_vkCmdTraceRaysKHR                                                    vkCmdTraceRaysKHR;
    PFN_vkCreateRayTracingPipelinesKHR                                       vkCreateRayTracingPipelinesKHR;
    PFN_vkGetRayTracingCaptureReplayShaderGroupHandlesKHR                    vkGetRayTracingCaptureReplayShaderGroupHandlesKHR;
    PFN_vkCmdTraceRaysIndirectKHR                                            vkCmdTraceRaysIndirectKHR;
    PFN_vkGetRayTracingShaderGroupStackSizeKHR                               vkGetRayTracingShaderGroupStackSizeKHR;
    PFN_vkCmdSetRayTracingPipelineStackSizeKHR                               vkCmdSetRayTracingPipelineStackSizeKHR;

    // VK_EXT_mesh_shader
    PFN_vkCmdDrawMeshTasksEXT                                                vkCmdDrawMeshTasksEXT;
    PFN_vkCmdDrawMeshTasksIndirectEXT                                        vkCmdDrawMeshTasksIndirectEXT;
    PFN_vkCmdDrawMeshTasksIndirectCountEXT                                   vkCmdDrawMeshTasksIndirectCountEXT;

    // VK_KHR_dynamic_rendering
    alias vkCmdBeginRenderingKHR                                                     = vkCmdBeginRendering;
    alias vkCmdEndRenderingKHR                                                       = vkCmdEndRendering;

    // VK_KHR_get_physical_device_properties2
    alias vkGetPhysicalDeviceFeatures2KHR                                            = vkGetPhysicalDeviceFeatures2;
    alias vkGetPhysicalDeviceProperties2KHR                                          = vkGetPhysicalDeviceProperties2;
    alias vkGetPhysicalDeviceFormatProperties2KHR                                    = vkGetPhysicalDeviceFormatProperties2;
    alias vkGetPhysicalDeviceImageFormatProperties2KHR                               = vkGetPhysicalDeviceImageFormatProperties2;
    alias vkGetPhysicalDeviceQueueFamilyProperties2KHR                               = vkGetPhysicalDeviceQueueFamilyProperties2;
    alias vkGetPhysicalDeviceMemoryProperties2KHR                                    = vkGetPhysicalDeviceMemoryProperties2;
    alias vkGetPhysicalDeviceSparseImageFormatProperties2KHR                         = vkGetPhysicalDeviceSparseImageFormatProperties2;

    // VK_KHR_device_group
    alias vkGetDeviceGroupPeerMemoryFeaturesKHR                                      = vkGetDeviceGroupPeerMemoryFeatures;
    alias vkCmdSetDeviceMaskKHR                                                      = vkCmdSetDeviceMask;
    alias vkCmdDispatchBaseKHR                                                       = vkCmdDispatchBase;

    // VK_KHR_maintenance1
    alias vkTrimCommandPoolKHR                                                       = vkTrimCommandPool;

    // VK_KHR_device_group_creation
    alias vkEnumeratePhysicalDeviceGroupsKHR                                         = vkEnumeratePhysicalDeviceGroups;

    // VK_KHR_external_memory_capabilities
    alias vkGetPhysicalDeviceExternalBufferPropertiesKHR                             = vkGetPhysicalDeviceExternalBufferProperties;

    // VK_KHR_external_semaphore_capabilities
    alias vkGetPhysicalDeviceExternalSemaphorePropertiesKHR                          = vkGetPhysicalDeviceExternalSemaphoreProperties;

    // VK_KHR_push_descriptor
    alias vkCmdPushDescriptorSetKHR                                                  = vkCmdPushDescriptorSet;
    alias vkCmdPushDescriptorSetWithTemplateKHR                                      = vkCmdPushDescriptorSetWithTemplate;

    // VK_KHR_descriptor_update_template
    alias vkCreateDescriptorUpdateTemplateKHR                                        = vkCreateDescriptorUpdateTemplate;
    alias vkDestroyDescriptorUpdateTemplateKHR                                       = vkDestroyDescriptorUpdateTemplate;
    alias vkUpdateDescriptorSetWithTemplateKHR                                       = vkUpdateDescriptorSetWithTemplate;

    // VK_KHR_create_renderpass2
    alias vkCreateRenderPass2KHR                                                     = vkCreateRenderPass2;
    alias vkCmdBeginRenderPass2KHR                                                   = vkCmdBeginRenderPass2;
    alias vkCmdNextSubpass2KHR                                                       = vkCmdNextSubpass2;
    alias vkCmdEndRenderPass2KHR                                                     = vkCmdEndRenderPass2;

    // VK_KHR_external_fence_capabilities
    alias vkGetPhysicalDeviceExternalFencePropertiesKHR                              = vkGetPhysicalDeviceExternalFenceProperties;

    // VK_KHR_get_memory_requirements2
    alias vkGetImageMemoryRequirements2KHR                                           = vkGetImageMemoryRequirements2;
    alias vkGetBufferMemoryRequirements2KHR                                          = vkGetBufferMemoryRequirements2;
    alias vkGetImageSparseMemoryRequirements2KHR                                     = vkGetImageSparseMemoryRequirements2;

    // VK_KHR_sampler_ycbcr_conversion
    alias vkCreateSamplerYcbcrConversionKHR                                          = vkCreateSamplerYcbcrConversion;
    alias vkDestroySamplerYcbcrConversionKHR                                         = vkDestroySamplerYcbcrConversion;

    // VK_KHR_bind_memory2
    alias vkBindBufferMemory2KHR                                                     = vkBindBufferMemory2;
    alias vkBindImageMemory2KHR                                                      = vkBindImageMemory2;

    // VK_KHR_maintenance3
    alias vkGetDescriptorSetLayoutSupportKHR                                         = vkGetDescriptorSetLayoutSupport;

    // VK_KHR_draw_indirect_count
    alias vkCmdDrawIndirectCountKHR                                                  = vkCmdDrawIndirectCount;
    alias vkCmdDrawIndexedIndirectCountKHR                                           = vkCmdDrawIndexedIndirectCount;

    // VK_KHR_timeline_semaphore
    alias vkGetSemaphoreCounterValueKHR                                              = vkGetSemaphoreCounterValue;
    alias vkWaitSemaphoresKHR                                                        = vkWaitSemaphores;
    alias vkSignalSemaphoreKHR                                                       = vkSignalSemaphore;

    // VK_KHR_dynamic_rendering_local_read
    alias vkCmdSetRenderingAttachmentLocationsKHR                                    = vkCmdSetRenderingAttachmentLocations;
    alias vkCmdSetRenderingInputAttachmentIndicesKHR                                 = vkCmdSetRenderingInputAttachmentIndices;

    // VK_KHR_buffer_device_address
    alias vkGetBufferDeviceAddressKHR                                                = vkGetBufferDeviceAddress;
    alias vkGetBufferOpaqueCaptureAddressKHR                                         = vkGetBufferOpaqueCaptureAddress;
    alias vkGetDeviceMemoryOpaqueCaptureAddressKHR                                   = vkGetDeviceMemoryOpaqueCaptureAddress;

    // VK_KHR_map_memory2
    alias vkMapMemory2KHR                                                            = vkMapMemory2;
    alias vkUnmapMemory2KHR                                                          = vkUnmapMemory2;

    // VK_KHR_synchronization2
    alias vkCmdSetEvent2KHR                                                          = vkCmdSetEvent2;
    alias vkCmdResetEvent2KHR                                                        = vkCmdResetEvent2;
    alias vkCmdWaitEvents2KHR                                                        = vkCmdWaitEvents2;
    alias vkCmdPipelineBarrier2KHR                                                   = vkCmdPipelineBarrier2;
    alias vkCmdWriteTimestamp2KHR                                                    = vkCmdWriteTimestamp2;
    alias vkQueueSubmit2KHR                                                          = vkQueueSubmit2;

    // VK_KHR_copy_commands2
    alias vkCmdCopyBuffer2KHR                                                        = vkCmdCopyBuffer2;
    alias vkCmdCopyImage2KHR                                                         = vkCmdCopyImage2;
    alias vkCmdCopyBufferToImage2KHR                                                 = vkCmdCopyBufferToImage2;
    alias vkCmdCopyImageToBuffer2KHR                                                 = vkCmdCopyImageToBuffer2;
    alias vkCmdBlitImage2KHR                                                         = vkCmdBlitImage2;
    alias vkCmdResolveImage2KHR                                                      = vkCmdResolveImage2;

    // VK_KHR_maintenance4
    alias vkGetDeviceBufferMemoryRequirementsKHR                                     = vkGetDeviceBufferMemoryRequirements;
    alias vkGetDeviceImageMemoryRequirementsKHR                                      = vkGetDeviceImageMemoryRequirements;
    alias vkGetDeviceImageSparseMemoryRequirementsKHR                                = vkGetDeviceImageSparseMemoryRequirements;

    // VK_KHR_maintenance5
    alias vkCmdBindIndexBuffer2KHR                                                   = vkCmdBindIndexBuffer2;
    alias vkGetRenderingAreaGranularityKHR                                           = vkGetRenderingAreaGranularity;
    alias vkGetDeviceImageSubresourceLayoutKHR                                       = vkGetDeviceImageSubresourceLayout;
    alias vkGetImageSubresourceLayout2KHR                                            = vkGetImageSubresourceLayout2;

    // VK_KHR_line_rasterization
    alias vkCmdSetLineStippleKHR                                                     = vkCmdSetLineStipple;

    // VK_KHR_maintenance6
    alias vkCmdBindDescriptorSets2KHR                                                = vkCmdBindDescriptorSets2;
    alias vkCmdPushConstants2KHR                                                     = vkCmdPushConstants2;
    alias vkCmdPushDescriptorSet2KHR                                                 = vkCmdPushDescriptorSet2;
    alias vkCmdPushDescriptorSetWithTemplate2KHR                                     = vkCmdPushDescriptorSetWithTemplate2;

    // VK_AMD_draw_indirect_count
    alias vkCmdDrawIndirectCountAMD                                                  = vkCmdDrawIndirectCount;
    alias vkCmdDrawIndexedIndirectCountAMD                                           = vkCmdDrawIndexedIndirectCount;

    // VK_NV_ray_tracing
    alias vkGetRayTracingShaderGroupHandlesNV                                        = vkGetRayTracingShaderGroupHandlesKHR;

    // VK_EXT_calibrated_timestamps
    alias vkGetPhysicalDeviceCalibrateableTimeDomainsEXT                             = vkGetPhysicalDeviceCalibrateableTimeDomainsKHR;
    alias vkGetCalibratedTimestampsEXT                                               = vkGetCalibratedTimestampsKHR;

    // VK_EXT_buffer_device_address
    alias vkGetBufferDeviceAddressEXT                                                = vkGetBufferDeviceAddress;

    // VK_EXT_tooling_info
    alias vkGetPhysicalDeviceToolPropertiesEXT                                       = vkGetPhysicalDeviceToolProperties;

    // VK_EXT_line_rasterization
    alias vkCmdSetLineStippleEXT                                                     = vkCmdSetLineStipple;

    // VK_EXT_host_query_reset
    alias vkResetQueryPoolEXT                                                        = vkResetQueryPool;

    // VK_EXT_extended_dynamic_state
    alias vkCmdSetCullModeEXT                                                        = vkCmdSetCullMode;
    alias vkCmdSetFrontFaceEXT                                                       = vkCmdSetFrontFace;
    alias vkCmdSetPrimitiveTopologyEXT                                               = vkCmdSetPrimitiveTopology;
    alias vkCmdSetViewportWithCountEXT                                               = vkCmdSetViewportWithCount;
    alias vkCmdSetScissorWithCountEXT                                                = vkCmdSetScissorWithCount;
    alias vkCmdBindVertexBuffers2EXT                                                 = vkCmdBindVertexBuffers2;
    alias vkCmdSetDepthTestEnableEXT                                                 = vkCmdSetDepthTestEnable;
    alias vkCmdSetDepthWriteEnableEXT                                                = vkCmdSetDepthWriteEnable;
    alias vkCmdSetDepthCompareOpEXT                                                  = vkCmdSetDepthCompareOp;
    alias vkCmdSetDepthBoundsTestEnableEXT                                           = vkCmdSetDepthBoundsTestEnable;
    alias vkCmdSetStencilTestEnableEXT                                               = vkCmdSetStencilTestEnable;
    alias vkCmdSetStencilOpEXT                                                       = vkCmdSetStencilOp;

    // VK_EXT_host_image_copy
    alias vkCopyMemoryToImageEXT                                                     = vkCopyMemoryToImage;
    alias vkCopyImageToMemoryEXT                                                     = vkCopyImageToMemory;
    alias vkCopyImageToImageEXT                                                      = vkCopyImageToImage;
    alias vkTransitionImageLayoutEXT                                                 = vkTransitionImageLayout;
    alias vkGetImageSubresourceLayout2EXT                                            = vkGetImageSubresourceLayout2;

    // VK_EXT_swapchain_maintenance1
    alias vkReleaseSwapchainImagesEXT                                                = vkReleaseSwapchainImagesKHR;

    // VK_EXT_private_data
    alias vkCreatePrivateDataSlotEXT                                                 = vkCreatePrivateDataSlot;
    alias vkDestroyPrivateDataSlotEXT                                                = vkDestroyPrivateDataSlot;
    alias vkSetPrivateDataEXT                                                        = vkSetPrivateData;
    alias vkGetPrivateDataEXT                                                        = vkGetPrivateData;

    // VK_EXT_extended_dynamic_state2
    alias vkCmdSetRasterizerDiscardEnableEXT                                         = vkCmdSetRasterizerDiscardEnable;
    alias vkCmdSetDepthBiasEnableEXT                                                 = vkCmdSetDepthBiasEnable;
    alias vkCmdSetPrimitiveRestartEnableEXT                                          = vkCmdSetPrimitiveRestartEnable;

    // VK_EXT_fragment_density_map_offset
    alias vkCmdEndRendering2EXT                                                      = vkCmdEndRendering2KHR;
}


/// sets vkCreateInstance function pointer and acquires basic functions to retrieve information about the implementation
/// and create an instance: vkEnumerateInstanceExtensionProperties, vkEnumerateInstanceLayerProperties, vkCreateInstance
void loadGlobalLevelFunctions( PFN_vkGetInstanceProcAddr getInstanceProcAddr ) {
    vkGetInstanceProcAddr = getInstanceProcAddr;

    // VK_BASE_VERSION_1_0
    vkCreateInstance                       = cast( PFN_vkCreateInstance                       ) vkGetInstanceProcAddr( null, "vkCreateInstance" );
    vkEnumerateInstanceExtensionProperties = cast( PFN_vkEnumerateInstanceExtensionProperties ) vkGetInstanceProcAddr( null, "vkEnumerateInstanceExtensionProperties" );
    vkEnumerateInstanceLayerProperties     = cast( PFN_vkEnumerateInstanceLayerProperties     ) vkGetInstanceProcAddr( null, "vkEnumerateInstanceLayerProperties" );

    // VK_BASE_VERSION_1_1
    vkEnumerateInstanceVersion             = cast( PFN_vkEnumerateInstanceVersion             ) vkGetInstanceProcAddr( null, "vkEnumerateInstanceVersion" );

    // VK_NV_external_compute_queue
    vkGetExternalComputeQueueDataNV        = cast( PFN_vkGetExternalComputeQueueDataNV        ) vkGetInstanceProcAddr( null, "vkGetExternalComputeQueueDataNV" );
}


/// with a valid VkInstance call this function to retrieve additional VkInstance, VkPhysicalDevice, ... related functions
void loadInstanceLevelFunctions( VkInstance instance ) {
    assert( vkGetInstanceProcAddr !is null, "Function pointer vkGetInstanceProcAddr is null!\nCall loadGlobalLevelFunctions -> loadInstanceLevelFunctions" );

    // VK_BASE_VERSION_1_0
    vkDestroyInstance                                                    = cast( PFN_vkDestroyInstance                                                    ) vkGetInstanceProcAddr( instance, "vkDestroyInstance" );
    vkEnumeratePhysicalDevices                                           = cast( PFN_vkEnumeratePhysicalDevices                                           ) vkGetInstanceProcAddr( instance, "vkEnumeratePhysicalDevices" );
    vkGetPhysicalDeviceFeatures                                          = cast( PFN_vkGetPhysicalDeviceFeatures                                          ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceFeatures" );
    vkGetPhysicalDeviceFormatProperties                                  = cast( PFN_vkGetPhysicalDeviceFormatProperties                                  ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceFormatProperties" );
    vkGetPhysicalDeviceImageFormatProperties                             = cast( PFN_vkGetPhysicalDeviceImageFormatProperties                             ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceImageFormatProperties" );
    vkGetPhysicalDeviceProperties                                        = cast( PFN_vkGetPhysicalDeviceProperties                                        ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceProperties" );
    vkGetPhysicalDeviceQueueFamilyProperties                             = cast( PFN_vkGetPhysicalDeviceQueueFamilyProperties                             ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceQueueFamilyProperties" );
    vkGetPhysicalDeviceMemoryProperties                                  = cast( PFN_vkGetPhysicalDeviceMemoryProperties                                  ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceMemoryProperties" );
    vkGetDeviceProcAddr                                                  = cast( PFN_vkGetDeviceProcAddr                                                  ) vkGetInstanceProcAddr( instance, "vkGetDeviceProcAddr" );
    vkCreateDevice                                                       = cast( PFN_vkCreateDevice                                                       ) vkGetInstanceProcAddr( instance, "vkCreateDevice" );
    vkEnumerateDeviceExtensionProperties                                 = cast( PFN_vkEnumerateDeviceExtensionProperties                                 ) vkGetInstanceProcAddr( instance, "vkEnumerateDeviceExtensionProperties" );
    vkEnumerateDeviceLayerProperties                                     = cast( PFN_vkEnumerateDeviceLayerProperties                                     ) vkGetInstanceProcAddr( instance, "vkEnumerateDeviceLayerProperties" );
    vkGetPhysicalDeviceSparseImageFormatProperties                       = cast( PFN_vkGetPhysicalDeviceSparseImageFormatProperties                       ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSparseImageFormatProperties" );

    // VK_BASE_VERSION_1_1
    vkEnumeratePhysicalDeviceGroups                                      = cast( PFN_vkEnumeratePhysicalDeviceGroups                                      ) vkGetInstanceProcAddr( instance, "vkEnumeratePhysicalDeviceGroups" );
    vkGetPhysicalDeviceFeatures2                                         = cast( PFN_vkGetPhysicalDeviceFeatures2                                         ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceFeatures2" );
    vkGetPhysicalDeviceProperties2                                       = cast( PFN_vkGetPhysicalDeviceProperties2                                       ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceProperties2" );
    vkGetPhysicalDeviceFormatProperties2                                 = cast( PFN_vkGetPhysicalDeviceFormatProperties2                                 ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceFormatProperties2" );
    vkGetPhysicalDeviceImageFormatProperties2                            = cast( PFN_vkGetPhysicalDeviceImageFormatProperties2                            ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceImageFormatProperties2" );
    vkGetPhysicalDeviceQueueFamilyProperties2                            = cast( PFN_vkGetPhysicalDeviceQueueFamilyProperties2                            ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceQueueFamilyProperties2" );
    vkGetPhysicalDeviceMemoryProperties2                                 = cast( PFN_vkGetPhysicalDeviceMemoryProperties2                                 ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceMemoryProperties2" );
    vkGetPhysicalDeviceSparseImageFormatProperties2                      = cast( PFN_vkGetPhysicalDeviceSparseImageFormatProperties2                      ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSparseImageFormatProperties2" );
    vkGetPhysicalDeviceExternalBufferProperties                          = cast( PFN_vkGetPhysicalDeviceExternalBufferProperties                          ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceExternalBufferProperties" );
    vkGetPhysicalDeviceExternalFenceProperties                           = cast( PFN_vkGetPhysicalDeviceExternalFenceProperties                           ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceExternalFenceProperties" );
    vkGetPhysicalDeviceExternalSemaphoreProperties                       = cast( PFN_vkGetPhysicalDeviceExternalSemaphoreProperties                       ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceExternalSemaphoreProperties" );

    // VK_BASE_VERSION_1_3
    vkGetPhysicalDeviceToolProperties                                    = cast( PFN_vkGetPhysicalDeviceToolProperties                                    ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceToolProperties" );

    // VK_KHR_surface
    vkDestroySurfaceKHR                                                  = cast( PFN_vkDestroySurfaceKHR                                                  ) vkGetInstanceProcAddr( instance, "vkDestroySurfaceKHR" );
    vkGetPhysicalDeviceSurfaceSupportKHR                                 = cast( PFN_vkGetPhysicalDeviceSurfaceSupportKHR                                 ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSurfaceSupportKHR" );
    vkGetPhysicalDeviceSurfaceCapabilitiesKHR                            = cast( PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR                            ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR" );
    vkGetPhysicalDeviceSurfaceFormatsKHR                                 = cast( PFN_vkGetPhysicalDeviceSurfaceFormatsKHR                                 ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSurfaceFormatsKHR" );
    vkGetPhysicalDeviceSurfacePresentModesKHR                            = cast( PFN_vkGetPhysicalDeviceSurfacePresentModesKHR                            ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSurfacePresentModesKHR" );

    // VK_KHR_swapchain
    vkGetPhysicalDevicePresentRectanglesKHR                              = cast( PFN_vkGetPhysicalDevicePresentRectanglesKHR                              ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDevicePresentRectanglesKHR" );

    // VK_KHR_display
    vkGetPhysicalDeviceDisplayPropertiesKHR                              = cast( PFN_vkGetPhysicalDeviceDisplayPropertiesKHR                              ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceDisplayPropertiesKHR" );
    vkGetPhysicalDeviceDisplayPlanePropertiesKHR                         = cast( PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR                         ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR" );
    vkGetDisplayPlaneSupportedDisplaysKHR                                = cast( PFN_vkGetDisplayPlaneSupportedDisplaysKHR                                ) vkGetInstanceProcAddr( instance, "vkGetDisplayPlaneSupportedDisplaysKHR" );
    vkGetDisplayModePropertiesKHR                                        = cast( PFN_vkGetDisplayModePropertiesKHR                                        ) vkGetInstanceProcAddr( instance, "vkGetDisplayModePropertiesKHR" );
    vkCreateDisplayModeKHR                                               = cast( PFN_vkCreateDisplayModeKHR                                               ) vkGetInstanceProcAddr( instance, "vkCreateDisplayModeKHR" );
    vkGetDisplayPlaneCapabilitiesKHR                                     = cast( PFN_vkGetDisplayPlaneCapabilitiesKHR                                     ) vkGetInstanceProcAddr( instance, "vkGetDisplayPlaneCapabilitiesKHR" );
    vkCreateDisplayPlaneSurfaceKHR                                       = cast( PFN_vkCreateDisplayPlaneSurfaceKHR                                       ) vkGetInstanceProcAddr( instance, "vkCreateDisplayPlaneSurfaceKHR" );

    // VK_KHR_video_queue
    vkGetPhysicalDeviceVideoCapabilitiesKHR                              = cast( PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR                              ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceVideoCapabilitiesKHR" );
    vkGetPhysicalDeviceVideoFormatPropertiesKHR                          = cast( PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR                          ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceVideoFormatPropertiesKHR" );

    // VK_KHR_performance_query
    vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR      = cast( PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR      ) vkGetInstanceProcAddr( instance, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR" );
    vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR              = cast( PFN_vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR              ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR" );

    // VK_KHR_get_surface_capabilities2
    vkGetPhysicalDeviceSurfaceCapabilities2KHR                           = cast( PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR                           ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSurfaceCapabilities2KHR" );
    vkGetPhysicalDeviceSurfaceFormats2KHR                                = cast( PFN_vkGetPhysicalDeviceSurfaceFormats2KHR                                ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSurfaceFormats2KHR" );

    // VK_KHR_get_display_properties2
    vkGetPhysicalDeviceDisplayProperties2KHR                             = cast( PFN_vkGetPhysicalDeviceDisplayProperties2KHR                             ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceDisplayProperties2KHR" );
    vkGetPhysicalDeviceDisplayPlaneProperties2KHR                        = cast( PFN_vkGetPhysicalDeviceDisplayPlaneProperties2KHR                        ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceDisplayPlaneProperties2KHR" );
    vkGetDisplayModeProperties2KHR                                       = cast( PFN_vkGetDisplayModeProperties2KHR                                       ) vkGetInstanceProcAddr( instance, "vkGetDisplayModeProperties2KHR" );
    vkGetDisplayPlaneCapabilities2KHR                                    = cast( PFN_vkGetDisplayPlaneCapabilities2KHR                                    ) vkGetInstanceProcAddr( instance, "vkGetDisplayPlaneCapabilities2KHR" );

    // VK_KHR_fragment_shading_rate
    vkGetPhysicalDeviceFragmentShadingRatesKHR                           = cast( PFN_vkGetPhysicalDeviceFragmentShadingRatesKHR                           ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceFragmentShadingRatesKHR" );

    // VK_KHR_video_encode_queue
    vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR              = cast( PFN_vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR              ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR" );

    // VK_KHR_cooperative_matrix
    vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR                    = cast( PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR                    ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR" );

    // VK_KHR_calibrated_timestamps
    vkGetPhysicalDeviceCalibrateableTimeDomainsKHR                       = cast( PFN_vkGetPhysicalDeviceCalibrateableTimeDomainsKHR                       ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR" );

    // VK_EXT_debug_report
    vkCreateDebugReportCallbackEXT                                       = cast( PFN_vkCreateDebugReportCallbackEXT                                       ) vkGetInstanceProcAddr( instance, "vkCreateDebugReportCallbackEXT" );
    vkDestroyDebugReportCallbackEXT                                      = cast( PFN_vkDestroyDebugReportCallbackEXT                                      ) vkGetInstanceProcAddr( instance, "vkDestroyDebugReportCallbackEXT" );
    vkDebugReportMessageEXT                                              = cast( PFN_vkDebugReportMessageEXT                                              ) vkGetInstanceProcAddr( instance, "vkDebugReportMessageEXT" );

    // VK_NV_external_memory_capabilities
    vkGetPhysicalDeviceExternalImageFormatPropertiesNV                   = cast( PFN_vkGetPhysicalDeviceExternalImageFormatPropertiesNV                   ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceExternalImageFormatPropertiesNV" );

    // VK_EXT_direct_mode_display
    vkReleaseDisplayEXT                                                  = cast( PFN_vkReleaseDisplayEXT                                                  ) vkGetInstanceProcAddr( instance, "vkReleaseDisplayEXT" );

    // VK_EXT_display_surface_counter
    vkGetPhysicalDeviceSurfaceCapabilities2EXT                           = cast( PFN_vkGetPhysicalDeviceSurfaceCapabilities2EXT                           ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSurfaceCapabilities2EXT" );

    // VK_EXT_debug_utils
    vkCreateDebugUtilsMessengerEXT                                       = cast( PFN_vkCreateDebugUtilsMessengerEXT                                       ) vkGetInstanceProcAddr( instance, "vkCreateDebugUtilsMessengerEXT" );
    vkDestroyDebugUtilsMessengerEXT                                      = cast( PFN_vkDestroyDebugUtilsMessengerEXT                                      ) vkGetInstanceProcAddr( instance, "vkDestroyDebugUtilsMessengerEXT" );
    vkSubmitDebugUtilsMessageEXT                                         = cast( PFN_vkSubmitDebugUtilsMessageEXT                                         ) vkGetInstanceProcAddr( instance, "vkSubmitDebugUtilsMessageEXT" );

    // VK_EXT_descriptor_heap
    vkGetPhysicalDeviceDescriptorSizeEXT                                 = cast( PFN_vkGetPhysicalDeviceDescriptorSizeEXT                                 ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceDescriptorSizeEXT" );

    // VK_EXT_sample_locations
    vkGetPhysicalDeviceMultisamplePropertiesEXT                          = cast( PFN_vkGetPhysicalDeviceMultisamplePropertiesEXT                          ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceMultisamplePropertiesEXT" );

    // VK_NV_cooperative_matrix
    vkGetPhysicalDeviceCooperativeMatrixPropertiesNV                     = cast( PFN_vkGetPhysicalDeviceCooperativeMatrixPropertiesNV                     ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV" );

    // VK_NV_coverage_reduction_mode
    vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV    = cast( PFN_vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV    ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV" );

    // VK_EXT_headless_surface
    vkCreateHeadlessSurfaceEXT                                           = cast( PFN_vkCreateHeadlessSurfaceEXT                                           ) vkGetInstanceProcAddr( instance, "vkCreateHeadlessSurfaceEXT" );

    // VK_EXT_acquire_drm_display
    vkAcquireDrmDisplayEXT                                               = cast( PFN_vkAcquireDrmDisplayEXT                                               ) vkGetInstanceProcAddr( instance, "vkAcquireDrmDisplayEXT" );
    vkGetDrmDisplayEXT                                                   = cast( PFN_vkGetDrmDisplayEXT                                                   ) vkGetInstanceProcAddr( instance, "vkGetDrmDisplayEXT" );

    // VK_ARM_tensors
    vkGetPhysicalDeviceExternalTensorPropertiesARM                       = cast( PFN_vkGetPhysicalDeviceExternalTensorPropertiesARM                       ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceExternalTensorPropertiesARM" );

    // VK_NV_optical_flow
    vkGetPhysicalDeviceOpticalFlowImageFormatsNV                         = cast( PFN_vkGetPhysicalDeviceOpticalFlowImageFormatsNV                         ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceOpticalFlowImageFormatsNV" );

    // VK_NV_cooperative_vector
    vkGetPhysicalDeviceCooperativeVectorPropertiesNV                     = cast( PFN_vkGetPhysicalDeviceCooperativeVectorPropertiesNV                     ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceCooperativeVectorPropertiesNV" );

    // VK_ARM_data_graph
    vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM                 = cast( PFN_vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM                 ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM" );
    vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM = cast( PFN_vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM" );

    // VK_ARM_data_graph_instruction_set_tosa
    vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM  = cast( PFN_vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM  ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceQueueFamilyDataGraphEngineOperationPropertiesARM" );

    // VK_NV_cooperative_matrix2
    vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV   = cast( PFN_vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV   ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV" );

    // VK_ARM_performance_counters_by_region
    vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM   = cast( PFN_vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM   ) vkGetInstanceProcAddr( instance, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM" );

    // VK_ARM_shader_instrumentation
    vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM             = cast( PFN_vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM             ) vkGetInstanceProcAddr( instance, "vkEnumeratePhysicalDeviceShaderInstrumentationMetricsARM" );

    // VK_ARM_data_graph_optical_flow
    vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM    = cast( PFN_vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM    ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceQueueFamilyDataGraphOpticalFlowImageFormatsARM" );

    // VK_EXT_cooperative_matrix_maintenance1
    vkGetPhysicalDeviceCooperativeMatrixProperties2EXT                   = cast( PFN_vkGetPhysicalDeviceCooperativeMatrixProperties2EXT                   ) vkGetInstanceProcAddr( instance, "vkGetPhysicalDeviceCooperativeMatrixProperties2EXT" );
}


/// with a valid VkInstance call this function to retrieve VkDevice, VkQueue and VkCommandBuffer related functions
/// the functions call indirectly through the VkInstance and will be internally dispatched by the implementation
/// use loadDeviceLevelFunctions( VkDevice device ) bellow to avoid this indirection and get the pointers directly form a VkDevice
void loadDeviceLevelFunctions( VkInstance instance ) {
    assert( vkGetInstanceProcAddr !is null, "Function pointer vkGetInstanceProcAddr is null!\nCall loadGlobalLevelFunctions -> loadDeviceLevelFunctions( instance )" );

    // VK_BASE_VERSION_1_0
    vkDestroyDevice                                          = cast( PFN_vkDestroyDevice                                          ) vkGetInstanceProcAddr( instance, "vkDestroyDevice" );
    vkGetDeviceQueue                                         = cast( PFN_vkGetDeviceQueue                                         ) vkGetInstanceProcAddr( instance, "vkGetDeviceQueue" );
    vkQueueSubmit                                            = cast( PFN_vkQueueSubmit                                            ) vkGetInstanceProcAddr( instance, "vkQueueSubmit" );
    vkQueueWaitIdle                                          = cast( PFN_vkQueueWaitIdle                                          ) vkGetInstanceProcAddr( instance, "vkQueueWaitIdle" );
    vkDeviceWaitIdle                                         = cast( PFN_vkDeviceWaitIdle                                         ) vkGetInstanceProcAddr( instance, "vkDeviceWaitIdle" );
    vkAllocateMemory                                         = cast( PFN_vkAllocateMemory                                         ) vkGetInstanceProcAddr( instance, "vkAllocateMemory" );
    vkFreeMemory                                             = cast( PFN_vkFreeMemory                                             ) vkGetInstanceProcAddr( instance, "vkFreeMemory" );
    vkMapMemory                                              = cast( PFN_vkMapMemory                                              ) vkGetInstanceProcAddr( instance, "vkMapMemory" );
    vkUnmapMemory                                            = cast( PFN_vkUnmapMemory                                            ) vkGetInstanceProcAddr( instance, "vkUnmapMemory" );
    vkFlushMappedMemoryRanges                                = cast( PFN_vkFlushMappedMemoryRanges                                ) vkGetInstanceProcAddr( instance, "vkFlushMappedMemoryRanges" );
    vkInvalidateMappedMemoryRanges                           = cast( PFN_vkInvalidateMappedMemoryRanges                           ) vkGetInstanceProcAddr( instance, "vkInvalidateMappedMemoryRanges" );
    vkGetDeviceMemoryCommitment                              = cast( PFN_vkGetDeviceMemoryCommitment                              ) vkGetInstanceProcAddr( instance, "vkGetDeviceMemoryCommitment" );
    vkBindBufferMemory                                       = cast( PFN_vkBindBufferMemory                                       ) vkGetInstanceProcAddr( instance, "vkBindBufferMemory" );
    vkBindImageMemory                                        = cast( PFN_vkBindImageMemory                                        ) vkGetInstanceProcAddr( instance, "vkBindImageMemory" );
    vkGetBufferMemoryRequirements                            = cast( PFN_vkGetBufferMemoryRequirements                            ) vkGetInstanceProcAddr( instance, "vkGetBufferMemoryRequirements" );
    vkGetImageMemoryRequirements                             = cast( PFN_vkGetImageMemoryRequirements                             ) vkGetInstanceProcAddr( instance, "vkGetImageMemoryRequirements" );
    vkGetImageSparseMemoryRequirements                       = cast( PFN_vkGetImageSparseMemoryRequirements                       ) vkGetInstanceProcAddr( instance, "vkGetImageSparseMemoryRequirements" );
    vkQueueBindSparse                                        = cast( PFN_vkQueueBindSparse                                        ) vkGetInstanceProcAddr( instance, "vkQueueBindSparse" );
    vkCreateFence                                            = cast( PFN_vkCreateFence                                            ) vkGetInstanceProcAddr( instance, "vkCreateFence" );
    vkDestroyFence                                           = cast( PFN_vkDestroyFence                                           ) vkGetInstanceProcAddr( instance, "vkDestroyFence" );
    vkResetFences                                            = cast( PFN_vkResetFences                                            ) vkGetInstanceProcAddr( instance, "vkResetFences" );
    vkGetFenceStatus                                         = cast( PFN_vkGetFenceStatus                                         ) vkGetInstanceProcAddr( instance, "vkGetFenceStatus" );
    vkWaitForFences                                          = cast( PFN_vkWaitForFences                                          ) vkGetInstanceProcAddr( instance, "vkWaitForFences" );
    vkCreateSemaphore                                        = cast( PFN_vkCreateSemaphore                                        ) vkGetInstanceProcAddr( instance, "vkCreateSemaphore" );
    vkDestroySemaphore                                       = cast( PFN_vkDestroySemaphore                                       ) vkGetInstanceProcAddr( instance, "vkDestroySemaphore" );
    vkCreateQueryPool                                        = cast( PFN_vkCreateQueryPool                                        ) vkGetInstanceProcAddr( instance, "vkCreateQueryPool" );
    vkDestroyQueryPool                                       = cast( PFN_vkDestroyQueryPool                                       ) vkGetInstanceProcAddr( instance, "vkDestroyQueryPool" );
    vkGetQueryPoolResults                                    = cast( PFN_vkGetQueryPoolResults                                    ) vkGetInstanceProcAddr( instance, "vkGetQueryPoolResults" );
    vkCreateBuffer                                           = cast( PFN_vkCreateBuffer                                           ) vkGetInstanceProcAddr( instance, "vkCreateBuffer" );
    vkDestroyBuffer                                          = cast( PFN_vkDestroyBuffer                                          ) vkGetInstanceProcAddr( instance, "vkDestroyBuffer" );
    vkCreateImage                                            = cast( PFN_vkCreateImage                                            ) vkGetInstanceProcAddr( instance, "vkCreateImage" );
    vkDestroyImage                                           = cast( PFN_vkDestroyImage                                           ) vkGetInstanceProcAddr( instance, "vkDestroyImage" );
    vkGetImageSubresourceLayout                              = cast( PFN_vkGetImageSubresourceLayout                              ) vkGetInstanceProcAddr( instance, "vkGetImageSubresourceLayout" );
    vkCreateImageView                                        = cast( PFN_vkCreateImageView                                        ) vkGetInstanceProcAddr( instance, "vkCreateImageView" );
    vkDestroyImageView                                       = cast( PFN_vkDestroyImageView                                       ) vkGetInstanceProcAddr( instance, "vkDestroyImageView" );
    vkCreateCommandPool                                      = cast( PFN_vkCreateCommandPool                                      ) vkGetInstanceProcAddr( instance, "vkCreateCommandPool" );
    vkDestroyCommandPool                                     = cast( PFN_vkDestroyCommandPool                                     ) vkGetInstanceProcAddr( instance, "vkDestroyCommandPool" );
    vkResetCommandPool                                       = cast( PFN_vkResetCommandPool                                       ) vkGetInstanceProcAddr( instance, "vkResetCommandPool" );
    vkAllocateCommandBuffers                                 = cast( PFN_vkAllocateCommandBuffers                                 ) vkGetInstanceProcAddr( instance, "vkAllocateCommandBuffers" );
    vkFreeCommandBuffers                                     = cast( PFN_vkFreeCommandBuffers                                     ) vkGetInstanceProcAddr( instance, "vkFreeCommandBuffers" );
    vkBeginCommandBuffer                                     = cast( PFN_vkBeginCommandBuffer                                     ) vkGetInstanceProcAddr( instance, "vkBeginCommandBuffer" );
    vkEndCommandBuffer                                       = cast( PFN_vkEndCommandBuffer                                       ) vkGetInstanceProcAddr( instance, "vkEndCommandBuffer" );
    vkResetCommandBuffer                                     = cast( PFN_vkResetCommandBuffer                                     ) vkGetInstanceProcAddr( instance, "vkResetCommandBuffer" );
    vkCmdCopyBuffer                                          = cast( PFN_vkCmdCopyBuffer                                          ) vkGetInstanceProcAddr( instance, "vkCmdCopyBuffer" );
    vkCmdCopyImage                                           = cast( PFN_vkCmdCopyImage                                           ) vkGetInstanceProcAddr( instance, "vkCmdCopyImage" );
    vkCmdCopyBufferToImage                                   = cast( PFN_vkCmdCopyBufferToImage                                   ) vkGetInstanceProcAddr( instance, "vkCmdCopyBufferToImage" );
    vkCmdCopyImageToBuffer                                   = cast( PFN_vkCmdCopyImageToBuffer                                   ) vkGetInstanceProcAddr( instance, "vkCmdCopyImageToBuffer" );
    vkCmdUpdateBuffer                                        = cast( PFN_vkCmdUpdateBuffer                                        ) vkGetInstanceProcAddr( instance, "vkCmdUpdateBuffer" );
    vkCmdFillBuffer                                          = cast( PFN_vkCmdFillBuffer                                          ) vkGetInstanceProcAddr( instance, "vkCmdFillBuffer" );
    vkCmdPipelineBarrier                                     = cast( PFN_vkCmdPipelineBarrier                                     ) vkGetInstanceProcAddr( instance, "vkCmdPipelineBarrier" );
    vkCmdBeginQuery                                          = cast( PFN_vkCmdBeginQuery                                          ) vkGetInstanceProcAddr( instance, "vkCmdBeginQuery" );
    vkCmdEndQuery                                            = cast( PFN_vkCmdEndQuery                                            ) vkGetInstanceProcAddr( instance, "vkCmdEndQuery" );
    vkCmdResetQueryPool                                      = cast( PFN_vkCmdResetQueryPool                                      ) vkGetInstanceProcAddr( instance, "vkCmdResetQueryPool" );
    vkCmdWriteTimestamp                                      = cast( PFN_vkCmdWriteTimestamp                                      ) vkGetInstanceProcAddr( instance, "vkCmdWriteTimestamp" );
    vkCmdCopyQueryPoolResults                                = cast( PFN_vkCmdCopyQueryPoolResults                                ) vkGetInstanceProcAddr( instance, "vkCmdCopyQueryPoolResults" );
    vkCmdExecuteCommands                                     = cast( PFN_vkCmdExecuteCommands                                     ) vkGetInstanceProcAddr( instance, "vkCmdExecuteCommands" );

    // VK_COMPUTE_VERSION_1_0
    vkCreateEvent                                            = cast( PFN_vkCreateEvent                                            ) vkGetInstanceProcAddr( instance, "vkCreateEvent" );
    vkDestroyEvent                                           = cast( PFN_vkDestroyEvent                                           ) vkGetInstanceProcAddr( instance, "vkDestroyEvent" );
    vkGetEventStatus                                         = cast( PFN_vkGetEventStatus                                         ) vkGetInstanceProcAddr( instance, "vkGetEventStatus" );
    vkSetEvent                                               = cast( PFN_vkSetEvent                                               ) vkGetInstanceProcAddr( instance, "vkSetEvent" );
    vkResetEvent                                             = cast( PFN_vkResetEvent                                             ) vkGetInstanceProcAddr( instance, "vkResetEvent" );
    vkCreateBufferView                                       = cast( PFN_vkCreateBufferView                                       ) vkGetInstanceProcAddr( instance, "vkCreateBufferView" );
    vkDestroyBufferView                                      = cast( PFN_vkDestroyBufferView                                      ) vkGetInstanceProcAddr( instance, "vkDestroyBufferView" );
    vkCreateShaderModule                                     = cast( PFN_vkCreateShaderModule                                     ) vkGetInstanceProcAddr( instance, "vkCreateShaderModule" );
    vkDestroyShaderModule                                    = cast( PFN_vkDestroyShaderModule                                    ) vkGetInstanceProcAddr( instance, "vkDestroyShaderModule" );
    vkCreatePipelineCache                                    = cast( PFN_vkCreatePipelineCache                                    ) vkGetInstanceProcAddr( instance, "vkCreatePipelineCache" );
    vkDestroyPipelineCache                                   = cast( PFN_vkDestroyPipelineCache                                   ) vkGetInstanceProcAddr( instance, "vkDestroyPipelineCache" );
    vkGetPipelineCacheData                                   = cast( PFN_vkGetPipelineCacheData                                   ) vkGetInstanceProcAddr( instance, "vkGetPipelineCacheData" );
    vkMergePipelineCaches                                    = cast( PFN_vkMergePipelineCaches                                    ) vkGetInstanceProcAddr( instance, "vkMergePipelineCaches" );
    vkCreateComputePipelines                                 = cast( PFN_vkCreateComputePipelines                                 ) vkGetInstanceProcAddr( instance, "vkCreateComputePipelines" );
    vkDestroyPipeline                                        = cast( PFN_vkDestroyPipeline                                        ) vkGetInstanceProcAddr( instance, "vkDestroyPipeline" );
    vkCreatePipelineLayout                                   = cast( PFN_vkCreatePipelineLayout                                   ) vkGetInstanceProcAddr( instance, "vkCreatePipelineLayout" );
    vkDestroyPipelineLayout                                  = cast( PFN_vkDestroyPipelineLayout                                  ) vkGetInstanceProcAddr( instance, "vkDestroyPipelineLayout" );
    vkCreateSampler                                          = cast( PFN_vkCreateSampler                                          ) vkGetInstanceProcAddr( instance, "vkCreateSampler" );
    vkDestroySampler                                         = cast( PFN_vkDestroySampler                                         ) vkGetInstanceProcAddr( instance, "vkDestroySampler" );
    vkCreateDescriptorSetLayout                              = cast( PFN_vkCreateDescriptorSetLayout                              ) vkGetInstanceProcAddr( instance, "vkCreateDescriptorSetLayout" );
    vkDestroyDescriptorSetLayout                             = cast( PFN_vkDestroyDescriptorSetLayout                             ) vkGetInstanceProcAddr( instance, "vkDestroyDescriptorSetLayout" );
    vkCreateDescriptorPool                                   = cast( PFN_vkCreateDescriptorPool                                   ) vkGetInstanceProcAddr( instance, "vkCreateDescriptorPool" );
    vkDestroyDescriptorPool                                  = cast( PFN_vkDestroyDescriptorPool                                  ) vkGetInstanceProcAddr( instance, "vkDestroyDescriptorPool" );
    vkResetDescriptorPool                                    = cast( PFN_vkResetDescriptorPool                                    ) vkGetInstanceProcAddr( instance, "vkResetDescriptorPool" );
    vkAllocateDescriptorSets                                 = cast( PFN_vkAllocateDescriptorSets                                 ) vkGetInstanceProcAddr( instance, "vkAllocateDescriptorSets" );
    vkFreeDescriptorSets                                     = cast( PFN_vkFreeDescriptorSets                                     ) vkGetInstanceProcAddr( instance, "vkFreeDescriptorSets" );
    vkUpdateDescriptorSets                                   = cast( PFN_vkUpdateDescriptorSets                                   ) vkGetInstanceProcAddr( instance, "vkUpdateDescriptorSets" );
    vkCmdBindPipeline                                        = cast( PFN_vkCmdBindPipeline                                        ) vkGetInstanceProcAddr( instance, "vkCmdBindPipeline" );
    vkCmdBindDescriptorSets                                  = cast( PFN_vkCmdBindDescriptorSets                                  ) vkGetInstanceProcAddr( instance, "vkCmdBindDescriptorSets" );
    vkCmdClearColorImage                                     = cast( PFN_vkCmdClearColorImage                                     ) vkGetInstanceProcAddr( instance, "vkCmdClearColorImage" );
    vkCmdDispatch                                            = cast( PFN_vkCmdDispatch                                            ) vkGetInstanceProcAddr( instance, "vkCmdDispatch" );
    vkCmdDispatchIndirect                                    = cast( PFN_vkCmdDispatchIndirect                                    ) vkGetInstanceProcAddr( instance, "vkCmdDispatchIndirect" );
    vkCmdSetEvent                                            = cast( PFN_vkCmdSetEvent                                            ) vkGetInstanceProcAddr( instance, "vkCmdSetEvent" );
    vkCmdResetEvent                                          = cast( PFN_vkCmdResetEvent                                          ) vkGetInstanceProcAddr( instance, "vkCmdResetEvent" );
    vkCmdWaitEvents                                          = cast( PFN_vkCmdWaitEvents                                          ) vkGetInstanceProcAddr( instance, "vkCmdWaitEvents" );
    vkCmdPushConstants                                       = cast( PFN_vkCmdPushConstants                                       ) vkGetInstanceProcAddr( instance, "vkCmdPushConstants" );

    // VK_GRAPHICS_VERSION_1_0
    vkCreateGraphicsPipelines                                = cast( PFN_vkCreateGraphicsPipelines                                ) vkGetInstanceProcAddr( instance, "vkCreateGraphicsPipelines" );
    vkCreateFramebuffer                                      = cast( PFN_vkCreateFramebuffer                                      ) vkGetInstanceProcAddr( instance, "vkCreateFramebuffer" );
    vkDestroyFramebuffer                                     = cast( PFN_vkDestroyFramebuffer                                     ) vkGetInstanceProcAddr( instance, "vkDestroyFramebuffer" );
    vkCreateRenderPass                                       = cast( PFN_vkCreateRenderPass                                       ) vkGetInstanceProcAddr( instance, "vkCreateRenderPass" );
    vkDestroyRenderPass                                      = cast( PFN_vkDestroyRenderPass                                      ) vkGetInstanceProcAddr( instance, "vkDestroyRenderPass" );
    vkGetRenderAreaGranularity                               = cast( PFN_vkGetRenderAreaGranularity                               ) vkGetInstanceProcAddr( instance, "vkGetRenderAreaGranularity" );
    vkCmdSetViewport                                         = cast( PFN_vkCmdSetViewport                                         ) vkGetInstanceProcAddr( instance, "vkCmdSetViewport" );
    vkCmdSetScissor                                          = cast( PFN_vkCmdSetScissor                                          ) vkGetInstanceProcAddr( instance, "vkCmdSetScissor" );
    vkCmdSetLineWidth                                        = cast( PFN_vkCmdSetLineWidth                                        ) vkGetInstanceProcAddr( instance, "vkCmdSetLineWidth" );
    vkCmdSetDepthBias                                        = cast( PFN_vkCmdSetDepthBias                                        ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthBias" );
    vkCmdSetBlendConstants                                   = cast( PFN_vkCmdSetBlendConstants                                   ) vkGetInstanceProcAddr( instance, "vkCmdSetBlendConstants" );
    vkCmdSetDepthBounds                                      = cast( PFN_vkCmdSetDepthBounds                                      ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthBounds" );
    vkCmdSetStencilCompareMask                               = cast( PFN_vkCmdSetStencilCompareMask                               ) vkGetInstanceProcAddr( instance, "vkCmdSetStencilCompareMask" );
    vkCmdSetStencilWriteMask                                 = cast( PFN_vkCmdSetStencilWriteMask                                 ) vkGetInstanceProcAddr( instance, "vkCmdSetStencilWriteMask" );
    vkCmdSetStencilReference                                 = cast( PFN_vkCmdSetStencilReference                                 ) vkGetInstanceProcAddr( instance, "vkCmdSetStencilReference" );
    vkCmdBindIndexBuffer                                     = cast( PFN_vkCmdBindIndexBuffer                                     ) vkGetInstanceProcAddr( instance, "vkCmdBindIndexBuffer" );
    vkCmdBindVertexBuffers                                   = cast( PFN_vkCmdBindVertexBuffers                                   ) vkGetInstanceProcAddr( instance, "vkCmdBindVertexBuffers" );
    vkCmdDraw                                                = cast( PFN_vkCmdDraw                                                ) vkGetInstanceProcAddr( instance, "vkCmdDraw" );
    vkCmdDrawIndexed                                         = cast( PFN_vkCmdDrawIndexed                                         ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndexed" );
    vkCmdDrawIndirect                                        = cast( PFN_vkCmdDrawIndirect                                        ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndirect" );
    vkCmdDrawIndexedIndirect                                 = cast( PFN_vkCmdDrawIndexedIndirect                                 ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndexedIndirect" );
    vkCmdBlitImage                                           = cast( PFN_vkCmdBlitImage                                           ) vkGetInstanceProcAddr( instance, "vkCmdBlitImage" );
    vkCmdClearDepthStencilImage                              = cast( PFN_vkCmdClearDepthStencilImage                              ) vkGetInstanceProcAddr( instance, "vkCmdClearDepthStencilImage" );
    vkCmdClearAttachments                                    = cast( PFN_vkCmdClearAttachments                                    ) vkGetInstanceProcAddr( instance, "vkCmdClearAttachments" );
    vkCmdResolveImage                                        = cast( PFN_vkCmdResolveImage                                        ) vkGetInstanceProcAddr( instance, "vkCmdResolveImage" );
    vkCmdBeginRenderPass                                     = cast( PFN_vkCmdBeginRenderPass                                     ) vkGetInstanceProcAddr( instance, "vkCmdBeginRenderPass" );
    vkCmdNextSubpass                                         = cast( PFN_vkCmdNextSubpass                                         ) vkGetInstanceProcAddr( instance, "vkCmdNextSubpass" );
    vkCmdEndRenderPass                                       = cast( PFN_vkCmdEndRenderPass                                       ) vkGetInstanceProcAddr( instance, "vkCmdEndRenderPass" );

    // VK_BASE_VERSION_1_1
    vkBindBufferMemory2                                      = cast( PFN_vkBindBufferMemory2                                      ) vkGetInstanceProcAddr( instance, "vkBindBufferMemory2" );
    vkBindImageMemory2                                       = cast( PFN_vkBindImageMemory2                                       ) vkGetInstanceProcAddr( instance, "vkBindImageMemory2" );
    vkGetDeviceGroupPeerMemoryFeatures                       = cast( PFN_vkGetDeviceGroupPeerMemoryFeatures                       ) vkGetInstanceProcAddr( instance, "vkGetDeviceGroupPeerMemoryFeatures" );
    vkCmdSetDeviceMask                                       = cast( PFN_vkCmdSetDeviceMask                                       ) vkGetInstanceProcAddr( instance, "vkCmdSetDeviceMask" );
    vkGetImageMemoryRequirements2                            = cast( PFN_vkGetImageMemoryRequirements2                            ) vkGetInstanceProcAddr( instance, "vkGetImageMemoryRequirements2" );
    vkGetBufferMemoryRequirements2                           = cast( PFN_vkGetBufferMemoryRequirements2                           ) vkGetInstanceProcAddr( instance, "vkGetBufferMemoryRequirements2" );
    vkGetImageSparseMemoryRequirements2                      = cast( PFN_vkGetImageSparseMemoryRequirements2                      ) vkGetInstanceProcAddr( instance, "vkGetImageSparseMemoryRequirements2" );
    vkTrimCommandPool                                        = cast( PFN_vkTrimCommandPool                                        ) vkGetInstanceProcAddr( instance, "vkTrimCommandPool" );
    vkGetDeviceQueue2                                        = cast( PFN_vkGetDeviceQueue2                                        ) vkGetInstanceProcAddr( instance, "vkGetDeviceQueue2" );

    // VK_COMPUTE_VERSION_1_1
    vkCmdDispatchBase                                        = cast( PFN_vkCmdDispatchBase                                        ) vkGetInstanceProcAddr( instance, "vkCmdDispatchBase" );
    vkCreateDescriptorUpdateTemplate                         = cast( PFN_vkCreateDescriptorUpdateTemplate                         ) vkGetInstanceProcAddr( instance, "vkCreateDescriptorUpdateTemplate" );
    vkDestroyDescriptorUpdateTemplate                        = cast( PFN_vkDestroyDescriptorUpdateTemplate                        ) vkGetInstanceProcAddr( instance, "vkDestroyDescriptorUpdateTemplate" );
    vkUpdateDescriptorSetWithTemplate                        = cast( PFN_vkUpdateDescriptorSetWithTemplate                        ) vkGetInstanceProcAddr( instance, "vkUpdateDescriptorSetWithTemplate" );
    vkGetDescriptorSetLayoutSupport                          = cast( PFN_vkGetDescriptorSetLayoutSupport                          ) vkGetInstanceProcAddr( instance, "vkGetDescriptorSetLayoutSupport" );
    vkCreateSamplerYcbcrConversion                           = cast( PFN_vkCreateSamplerYcbcrConversion                           ) vkGetInstanceProcAddr( instance, "vkCreateSamplerYcbcrConversion" );
    vkDestroySamplerYcbcrConversion                          = cast( PFN_vkDestroySamplerYcbcrConversion                          ) vkGetInstanceProcAddr( instance, "vkDestroySamplerYcbcrConversion" );

    // VK_BASE_VERSION_1_2
    vkResetQueryPool                                         = cast( PFN_vkResetQueryPool                                         ) vkGetInstanceProcAddr( instance, "vkResetQueryPool" );
    vkGetSemaphoreCounterValue                               = cast( PFN_vkGetSemaphoreCounterValue                               ) vkGetInstanceProcAddr( instance, "vkGetSemaphoreCounterValue" );
    vkWaitSemaphores                                         = cast( PFN_vkWaitSemaphores                                         ) vkGetInstanceProcAddr( instance, "vkWaitSemaphores" );
    vkSignalSemaphore                                        = cast( PFN_vkSignalSemaphore                                        ) vkGetInstanceProcAddr( instance, "vkSignalSemaphore" );
    vkGetBufferDeviceAddress                                 = cast( PFN_vkGetBufferDeviceAddress                                 ) vkGetInstanceProcAddr( instance, "vkGetBufferDeviceAddress" );
    vkGetBufferOpaqueCaptureAddress                          = cast( PFN_vkGetBufferOpaqueCaptureAddress                          ) vkGetInstanceProcAddr( instance, "vkGetBufferOpaqueCaptureAddress" );
    vkGetDeviceMemoryOpaqueCaptureAddress                    = cast( PFN_vkGetDeviceMemoryOpaqueCaptureAddress                    ) vkGetInstanceProcAddr( instance, "vkGetDeviceMemoryOpaqueCaptureAddress" );

    // VK_GRAPHICS_VERSION_1_2
    vkCmdDrawIndirectCount                                   = cast( PFN_vkCmdDrawIndirectCount                                   ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndirectCount" );
    vkCmdDrawIndexedIndirectCount                            = cast( PFN_vkCmdDrawIndexedIndirectCount                            ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndexedIndirectCount" );
    vkCreateRenderPass2                                      = cast( PFN_vkCreateRenderPass2                                      ) vkGetInstanceProcAddr( instance, "vkCreateRenderPass2" );
    vkCmdBeginRenderPass2                                    = cast( PFN_vkCmdBeginRenderPass2                                    ) vkGetInstanceProcAddr( instance, "vkCmdBeginRenderPass2" );
    vkCmdNextSubpass2                                        = cast( PFN_vkCmdNextSubpass2                                        ) vkGetInstanceProcAddr( instance, "vkCmdNextSubpass2" );
    vkCmdEndRenderPass2                                      = cast( PFN_vkCmdEndRenderPass2                                      ) vkGetInstanceProcAddr( instance, "vkCmdEndRenderPass2" );

    // VK_BASE_VERSION_1_3
    vkCreatePrivateDataSlot                                  = cast( PFN_vkCreatePrivateDataSlot                                  ) vkGetInstanceProcAddr( instance, "vkCreatePrivateDataSlot" );
    vkDestroyPrivateDataSlot                                 = cast( PFN_vkDestroyPrivateDataSlot                                 ) vkGetInstanceProcAddr( instance, "vkDestroyPrivateDataSlot" );
    vkSetPrivateData                                         = cast( PFN_vkSetPrivateData                                         ) vkGetInstanceProcAddr( instance, "vkSetPrivateData" );
    vkGetPrivateData                                         = cast( PFN_vkGetPrivateData                                         ) vkGetInstanceProcAddr( instance, "vkGetPrivateData" );
    vkCmdPipelineBarrier2                                    = cast( PFN_vkCmdPipelineBarrier2                                    ) vkGetInstanceProcAddr( instance, "vkCmdPipelineBarrier2" );
    vkCmdWriteTimestamp2                                     = cast( PFN_vkCmdWriteTimestamp2                                     ) vkGetInstanceProcAddr( instance, "vkCmdWriteTimestamp2" );
    vkQueueSubmit2                                           = cast( PFN_vkQueueSubmit2                                           ) vkGetInstanceProcAddr( instance, "vkQueueSubmit2" );
    vkCmdCopyBuffer2                                         = cast( PFN_vkCmdCopyBuffer2                                         ) vkGetInstanceProcAddr( instance, "vkCmdCopyBuffer2" );
    vkCmdCopyImage2                                          = cast( PFN_vkCmdCopyImage2                                          ) vkGetInstanceProcAddr( instance, "vkCmdCopyImage2" );
    vkCmdCopyBufferToImage2                                  = cast( PFN_vkCmdCopyBufferToImage2                                  ) vkGetInstanceProcAddr( instance, "vkCmdCopyBufferToImage2" );
    vkCmdCopyImageToBuffer2                                  = cast( PFN_vkCmdCopyImageToBuffer2                                  ) vkGetInstanceProcAddr( instance, "vkCmdCopyImageToBuffer2" );
    vkGetDeviceBufferMemoryRequirements                      = cast( PFN_vkGetDeviceBufferMemoryRequirements                      ) vkGetInstanceProcAddr( instance, "vkGetDeviceBufferMemoryRequirements" );
    vkGetDeviceImageMemoryRequirements                       = cast( PFN_vkGetDeviceImageMemoryRequirements                       ) vkGetInstanceProcAddr( instance, "vkGetDeviceImageMemoryRequirements" );
    vkGetDeviceImageSparseMemoryRequirements                 = cast( PFN_vkGetDeviceImageSparseMemoryRequirements                 ) vkGetInstanceProcAddr( instance, "vkGetDeviceImageSparseMemoryRequirements" );

    // VK_COMPUTE_VERSION_1_3
    vkCmdSetEvent2                                           = cast( PFN_vkCmdSetEvent2                                           ) vkGetInstanceProcAddr( instance, "vkCmdSetEvent2" );
    vkCmdResetEvent2                                         = cast( PFN_vkCmdResetEvent2                                         ) vkGetInstanceProcAddr( instance, "vkCmdResetEvent2" );
    vkCmdWaitEvents2                                         = cast( PFN_vkCmdWaitEvents2                                         ) vkGetInstanceProcAddr( instance, "vkCmdWaitEvents2" );

    // VK_GRAPHICS_VERSION_1_3
    vkCmdBlitImage2                                          = cast( PFN_vkCmdBlitImage2                                          ) vkGetInstanceProcAddr( instance, "vkCmdBlitImage2" );
    vkCmdResolveImage2                                       = cast( PFN_vkCmdResolveImage2                                       ) vkGetInstanceProcAddr( instance, "vkCmdResolveImage2" );
    vkCmdBeginRendering                                      = cast( PFN_vkCmdBeginRendering                                      ) vkGetInstanceProcAddr( instance, "vkCmdBeginRendering" );
    vkCmdEndRendering                                        = cast( PFN_vkCmdEndRendering                                        ) vkGetInstanceProcAddr( instance, "vkCmdEndRendering" );
    vkCmdSetCullMode                                         = cast( PFN_vkCmdSetCullMode                                         ) vkGetInstanceProcAddr( instance, "vkCmdSetCullMode" );
    vkCmdSetFrontFace                                        = cast( PFN_vkCmdSetFrontFace                                        ) vkGetInstanceProcAddr( instance, "vkCmdSetFrontFace" );
    vkCmdSetPrimitiveTopology                                = cast( PFN_vkCmdSetPrimitiveTopology                                ) vkGetInstanceProcAddr( instance, "vkCmdSetPrimitiveTopology" );
    vkCmdSetViewportWithCount                                = cast( PFN_vkCmdSetViewportWithCount                                ) vkGetInstanceProcAddr( instance, "vkCmdSetViewportWithCount" );
    vkCmdSetScissorWithCount                                 = cast( PFN_vkCmdSetScissorWithCount                                 ) vkGetInstanceProcAddr( instance, "vkCmdSetScissorWithCount" );
    vkCmdBindVertexBuffers2                                  = cast( PFN_vkCmdBindVertexBuffers2                                  ) vkGetInstanceProcAddr( instance, "vkCmdBindVertexBuffers2" );
    vkCmdSetDepthTestEnable                                  = cast( PFN_vkCmdSetDepthTestEnable                                  ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthTestEnable" );
    vkCmdSetDepthWriteEnable                                 = cast( PFN_vkCmdSetDepthWriteEnable                                 ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthWriteEnable" );
    vkCmdSetDepthCompareOp                                   = cast( PFN_vkCmdSetDepthCompareOp                                   ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthCompareOp" );
    vkCmdSetDepthBoundsTestEnable                            = cast( PFN_vkCmdSetDepthBoundsTestEnable                            ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthBoundsTestEnable" );
    vkCmdSetStencilTestEnable                                = cast( PFN_vkCmdSetStencilTestEnable                                ) vkGetInstanceProcAddr( instance, "vkCmdSetStencilTestEnable" );
    vkCmdSetStencilOp                                        = cast( PFN_vkCmdSetStencilOp                                        ) vkGetInstanceProcAddr( instance, "vkCmdSetStencilOp" );
    vkCmdSetRasterizerDiscardEnable                          = cast( PFN_vkCmdSetRasterizerDiscardEnable                          ) vkGetInstanceProcAddr( instance, "vkCmdSetRasterizerDiscardEnable" );
    vkCmdSetDepthBiasEnable                                  = cast( PFN_vkCmdSetDepthBiasEnable                                  ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthBiasEnable" );
    vkCmdSetPrimitiveRestartEnable                           = cast( PFN_vkCmdSetPrimitiveRestartEnable                           ) vkGetInstanceProcAddr( instance, "vkCmdSetPrimitiveRestartEnable" );

    // VK_BASE_VERSION_1_4
    vkMapMemory2                                             = cast( PFN_vkMapMemory2                                             ) vkGetInstanceProcAddr( instance, "vkMapMemory2" );
    vkUnmapMemory2                                           = cast( PFN_vkUnmapMemory2                                           ) vkGetInstanceProcAddr( instance, "vkUnmapMemory2" );
    vkGetDeviceImageSubresourceLayout                        = cast( PFN_vkGetDeviceImageSubresourceLayout                        ) vkGetInstanceProcAddr( instance, "vkGetDeviceImageSubresourceLayout" );
    vkGetImageSubresourceLayout2                             = cast( PFN_vkGetImageSubresourceLayout2                             ) vkGetInstanceProcAddr( instance, "vkGetImageSubresourceLayout2" );
    vkCopyMemoryToImage                                      = cast( PFN_vkCopyMemoryToImage                                      ) vkGetInstanceProcAddr( instance, "vkCopyMemoryToImage" );
    vkCopyImageToMemory                                      = cast( PFN_vkCopyImageToMemory                                      ) vkGetInstanceProcAddr( instance, "vkCopyImageToMemory" );
    vkCopyImageToImage                                       = cast( PFN_vkCopyImageToImage                                       ) vkGetInstanceProcAddr( instance, "vkCopyImageToImage" );
    vkTransitionImageLayout                                  = cast( PFN_vkTransitionImageLayout                                  ) vkGetInstanceProcAddr( instance, "vkTransitionImageLayout" );

    // VK_COMPUTE_VERSION_1_4
    vkCmdPushDescriptorSet                                   = cast( PFN_vkCmdPushDescriptorSet                                   ) vkGetInstanceProcAddr( instance, "vkCmdPushDescriptorSet" );
    vkCmdPushDescriptorSetWithTemplate                       = cast( PFN_vkCmdPushDescriptorSetWithTemplate                       ) vkGetInstanceProcAddr( instance, "vkCmdPushDescriptorSetWithTemplate" );
    vkCmdBindDescriptorSets2                                 = cast( PFN_vkCmdBindDescriptorSets2                                 ) vkGetInstanceProcAddr( instance, "vkCmdBindDescriptorSets2" );
    vkCmdPushConstants2                                      = cast( PFN_vkCmdPushConstants2                                      ) vkGetInstanceProcAddr( instance, "vkCmdPushConstants2" );
    vkCmdPushDescriptorSet2                                  = cast( PFN_vkCmdPushDescriptorSet2                                  ) vkGetInstanceProcAddr( instance, "vkCmdPushDescriptorSet2" );
    vkCmdPushDescriptorSetWithTemplate2                      = cast( PFN_vkCmdPushDescriptorSetWithTemplate2                      ) vkGetInstanceProcAddr( instance, "vkCmdPushDescriptorSetWithTemplate2" );

    // VK_GRAPHICS_VERSION_1_4
    vkCmdSetLineStipple                                      = cast( PFN_vkCmdSetLineStipple                                      ) vkGetInstanceProcAddr( instance, "vkCmdSetLineStipple" );
    vkCmdBindIndexBuffer2                                    = cast( PFN_vkCmdBindIndexBuffer2                                    ) vkGetInstanceProcAddr( instance, "vkCmdBindIndexBuffer2" );
    vkGetRenderingAreaGranularity                            = cast( PFN_vkGetRenderingAreaGranularity                            ) vkGetInstanceProcAddr( instance, "vkGetRenderingAreaGranularity" );
    vkCmdSetRenderingAttachmentLocations                     = cast( PFN_vkCmdSetRenderingAttachmentLocations                     ) vkGetInstanceProcAddr( instance, "vkCmdSetRenderingAttachmentLocations" );
    vkCmdSetRenderingInputAttachmentIndices                  = cast( PFN_vkCmdSetRenderingInputAttachmentIndices                  ) vkGetInstanceProcAddr( instance, "vkCmdSetRenderingInputAttachmentIndices" );

    // VK_KHR_swapchain
    vkCreateSwapchainKHR                                     = cast( PFN_vkCreateSwapchainKHR                                     ) vkGetInstanceProcAddr( instance, "vkCreateSwapchainKHR" );
    vkDestroySwapchainKHR                                    = cast( PFN_vkDestroySwapchainKHR                                    ) vkGetInstanceProcAddr( instance, "vkDestroySwapchainKHR" );
    vkGetSwapchainImagesKHR                                  = cast( PFN_vkGetSwapchainImagesKHR                                  ) vkGetInstanceProcAddr( instance, "vkGetSwapchainImagesKHR" );
    vkAcquireNextImageKHR                                    = cast( PFN_vkAcquireNextImageKHR                                    ) vkGetInstanceProcAddr( instance, "vkAcquireNextImageKHR" );
    vkQueuePresentKHR                                        = cast( PFN_vkQueuePresentKHR                                        ) vkGetInstanceProcAddr( instance, "vkQueuePresentKHR" );
    vkGetDeviceGroupPresentCapabilitiesKHR                   = cast( PFN_vkGetDeviceGroupPresentCapabilitiesKHR                   ) vkGetInstanceProcAddr( instance, "vkGetDeviceGroupPresentCapabilitiesKHR" );
    vkGetDeviceGroupSurfacePresentModesKHR                   = cast( PFN_vkGetDeviceGroupSurfacePresentModesKHR                   ) vkGetInstanceProcAddr( instance, "vkGetDeviceGroupSurfacePresentModesKHR" );
    vkAcquireNextImage2KHR                                   = cast( PFN_vkAcquireNextImage2KHR                                   ) vkGetInstanceProcAddr( instance, "vkAcquireNextImage2KHR" );

    // VK_KHR_display_swapchain
    vkCreateSharedSwapchainsKHR                              = cast( PFN_vkCreateSharedSwapchainsKHR                              ) vkGetInstanceProcAddr( instance, "vkCreateSharedSwapchainsKHR" );

    // VK_KHR_video_queue
    vkCreateVideoSessionKHR                                  = cast( PFN_vkCreateVideoSessionKHR                                  ) vkGetInstanceProcAddr( instance, "vkCreateVideoSessionKHR" );
    vkDestroyVideoSessionKHR                                 = cast( PFN_vkDestroyVideoSessionKHR                                 ) vkGetInstanceProcAddr( instance, "vkDestroyVideoSessionKHR" );
    vkGetVideoSessionMemoryRequirementsKHR                   = cast( PFN_vkGetVideoSessionMemoryRequirementsKHR                   ) vkGetInstanceProcAddr( instance, "vkGetVideoSessionMemoryRequirementsKHR" );
    vkBindVideoSessionMemoryKHR                              = cast( PFN_vkBindVideoSessionMemoryKHR                              ) vkGetInstanceProcAddr( instance, "vkBindVideoSessionMemoryKHR" );
    vkCreateVideoSessionParametersKHR                        = cast( PFN_vkCreateVideoSessionParametersKHR                        ) vkGetInstanceProcAddr( instance, "vkCreateVideoSessionParametersKHR" );
    vkUpdateVideoSessionParametersKHR                        = cast( PFN_vkUpdateVideoSessionParametersKHR                        ) vkGetInstanceProcAddr( instance, "vkUpdateVideoSessionParametersKHR" );
    vkDestroyVideoSessionParametersKHR                       = cast( PFN_vkDestroyVideoSessionParametersKHR                       ) vkGetInstanceProcAddr( instance, "vkDestroyVideoSessionParametersKHR" );
    vkCmdBeginVideoCodingKHR                                 = cast( PFN_vkCmdBeginVideoCodingKHR                                 ) vkGetInstanceProcAddr( instance, "vkCmdBeginVideoCodingKHR" );
    vkCmdEndVideoCodingKHR                                   = cast( PFN_vkCmdEndVideoCodingKHR                                   ) vkGetInstanceProcAddr( instance, "vkCmdEndVideoCodingKHR" );
    vkCmdControlVideoCodingKHR                               = cast( PFN_vkCmdControlVideoCodingKHR                               ) vkGetInstanceProcAddr( instance, "vkCmdControlVideoCodingKHR" );

    // VK_KHR_video_decode_queue
    vkCmdDecodeVideoKHR                                      = cast( PFN_vkCmdDecodeVideoKHR                                      ) vkGetInstanceProcAddr( instance, "vkCmdDecodeVideoKHR" );

    // VK_KHR_external_memory_fd
    vkGetMemoryFdKHR                                         = cast( PFN_vkGetMemoryFdKHR                                         ) vkGetInstanceProcAddr( instance, "vkGetMemoryFdKHR" );
    vkGetMemoryFdPropertiesKHR                               = cast( PFN_vkGetMemoryFdPropertiesKHR                               ) vkGetInstanceProcAddr( instance, "vkGetMemoryFdPropertiesKHR" );

    // VK_KHR_external_semaphore_fd
    vkImportSemaphoreFdKHR                                   = cast( PFN_vkImportSemaphoreFdKHR                                   ) vkGetInstanceProcAddr( instance, "vkImportSemaphoreFdKHR" );
    vkGetSemaphoreFdKHR                                      = cast( PFN_vkGetSemaphoreFdKHR                                      ) vkGetInstanceProcAddr( instance, "vkGetSemaphoreFdKHR" );

    // VK_KHR_shared_presentable_image
    vkGetSwapchainStatusKHR                                  = cast( PFN_vkGetSwapchainStatusKHR                                  ) vkGetInstanceProcAddr( instance, "vkGetSwapchainStatusKHR" );

    // VK_KHR_external_fence_fd
    vkImportFenceFdKHR                                       = cast( PFN_vkImportFenceFdKHR                                       ) vkGetInstanceProcAddr( instance, "vkImportFenceFdKHR" );
    vkGetFenceFdKHR                                          = cast( PFN_vkGetFenceFdKHR                                          ) vkGetInstanceProcAddr( instance, "vkGetFenceFdKHR" );

    // VK_KHR_performance_query
    vkAcquireProfilingLockKHR                                = cast( PFN_vkAcquireProfilingLockKHR                                ) vkGetInstanceProcAddr( instance, "vkAcquireProfilingLockKHR" );
    vkReleaseProfilingLockKHR                                = cast( PFN_vkReleaseProfilingLockKHR                                ) vkGetInstanceProcAddr( instance, "vkReleaseProfilingLockKHR" );

    // VK_KHR_fragment_shading_rate
    vkCmdSetFragmentShadingRateKHR                           = cast( PFN_vkCmdSetFragmentShadingRateKHR                           ) vkGetInstanceProcAddr( instance, "vkCmdSetFragmentShadingRateKHR" );

    // VK_KHR_present_wait
    vkWaitForPresentKHR                                      = cast( PFN_vkWaitForPresentKHR                                      ) vkGetInstanceProcAddr( instance, "vkWaitForPresentKHR" );

    // VK_KHR_deferred_host_operations
    vkCreateDeferredOperationKHR                             = cast( PFN_vkCreateDeferredOperationKHR                             ) vkGetInstanceProcAddr( instance, "vkCreateDeferredOperationKHR" );
    vkDestroyDeferredOperationKHR                            = cast( PFN_vkDestroyDeferredOperationKHR                            ) vkGetInstanceProcAddr( instance, "vkDestroyDeferredOperationKHR" );
    vkGetDeferredOperationMaxConcurrencyKHR                  = cast( PFN_vkGetDeferredOperationMaxConcurrencyKHR                  ) vkGetInstanceProcAddr( instance, "vkGetDeferredOperationMaxConcurrencyKHR" );
    vkGetDeferredOperationResultKHR                          = cast( PFN_vkGetDeferredOperationResultKHR                          ) vkGetInstanceProcAddr( instance, "vkGetDeferredOperationResultKHR" );
    vkDeferredOperationJoinKHR                               = cast( PFN_vkDeferredOperationJoinKHR                               ) vkGetInstanceProcAddr( instance, "vkDeferredOperationJoinKHR" );

    // VK_KHR_pipeline_executable_properties
    vkGetPipelineExecutablePropertiesKHR                     = cast( PFN_vkGetPipelineExecutablePropertiesKHR                     ) vkGetInstanceProcAddr( instance, "vkGetPipelineExecutablePropertiesKHR" );
    vkGetPipelineExecutableStatisticsKHR                     = cast( PFN_vkGetPipelineExecutableStatisticsKHR                     ) vkGetInstanceProcAddr( instance, "vkGetPipelineExecutableStatisticsKHR" );
    vkGetPipelineExecutableInternalRepresentationsKHR        = cast( PFN_vkGetPipelineExecutableInternalRepresentationsKHR        ) vkGetInstanceProcAddr( instance, "vkGetPipelineExecutableInternalRepresentationsKHR" );

    // VK_KHR_video_encode_queue
    vkGetEncodedVideoSessionParametersKHR                    = cast( PFN_vkGetEncodedVideoSessionParametersKHR                    ) vkGetInstanceProcAddr( instance, "vkGetEncodedVideoSessionParametersKHR" );
    vkCmdEncodeVideoKHR                                      = cast( PFN_vkCmdEncodeVideoKHR                                      ) vkGetInstanceProcAddr( instance, "vkCmdEncodeVideoKHR" );

    // VK_KHR_device_address_commands
    vkCmdBindIndexBuffer3KHR                                 = cast( PFN_vkCmdBindIndexBuffer3KHR                                 ) vkGetInstanceProcAddr( instance, "vkCmdBindIndexBuffer3KHR" );
    vkCmdBindVertexBuffers3KHR                               = cast( PFN_vkCmdBindVertexBuffers3KHR                               ) vkGetInstanceProcAddr( instance, "vkCmdBindVertexBuffers3KHR" );
    vkCmdDrawIndirect2KHR                                    = cast( PFN_vkCmdDrawIndirect2KHR                                    ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndirect2KHR" );
    vkCmdDrawIndexedIndirect2KHR                             = cast( PFN_vkCmdDrawIndexedIndirect2KHR                             ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndexedIndirect2KHR" );
    vkCmdDispatchIndirect2KHR                                = cast( PFN_vkCmdDispatchIndirect2KHR                                ) vkGetInstanceProcAddr( instance, "vkCmdDispatchIndirect2KHR" );
    vkCmdCopyMemoryKHR                                       = cast( PFN_vkCmdCopyMemoryKHR                                       ) vkGetInstanceProcAddr( instance, "vkCmdCopyMemoryKHR" );
    vkCmdCopyMemoryToImageKHR                                = cast( PFN_vkCmdCopyMemoryToImageKHR                                ) vkGetInstanceProcAddr( instance, "vkCmdCopyMemoryToImageKHR" );
    vkCmdCopyImageToMemoryKHR                                = cast( PFN_vkCmdCopyImageToMemoryKHR                                ) vkGetInstanceProcAddr( instance, "vkCmdCopyImageToMemoryKHR" );
    vkCmdUpdateMemoryKHR                                     = cast( PFN_vkCmdUpdateMemoryKHR                                     ) vkGetInstanceProcAddr( instance, "vkCmdUpdateMemoryKHR" );
    vkCmdFillMemoryKHR                                       = cast( PFN_vkCmdFillMemoryKHR                                       ) vkGetInstanceProcAddr( instance, "vkCmdFillMemoryKHR" );
    vkCmdCopyQueryPoolResultsToMemoryKHR                     = cast( PFN_vkCmdCopyQueryPoolResultsToMemoryKHR                     ) vkGetInstanceProcAddr( instance, "vkCmdCopyQueryPoolResultsToMemoryKHR" );
    vkCmdDrawIndirectCount2KHR                               = cast( PFN_vkCmdDrawIndirectCount2KHR                               ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndirectCount2KHR" );
    vkCmdDrawIndexedIndirectCount2KHR                        = cast( PFN_vkCmdDrawIndexedIndirectCount2KHR                        ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndexedIndirectCount2KHR" );
    vkCmdBeginConditionalRendering2EXT                       = cast( PFN_vkCmdBeginConditionalRendering2EXT                       ) vkGetInstanceProcAddr( instance, "vkCmdBeginConditionalRendering2EXT" );
    vkCmdBindTransformFeedbackBuffers2EXT                    = cast( PFN_vkCmdBindTransformFeedbackBuffers2EXT                    ) vkGetInstanceProcAddr( instance, "vkCmdBindTransformFeedbackBuffers2EXT" );
    vkCmdBeginTransformFeedback2EXT                          = cast( PFN_vkCmdBeginTransformFeedback2EXT                          ) vkGetInstanceProcAddr( instance, "vkCmdBeginTransformFeedback2EXT" );
    vkCmdEndTransformFeedback2EXT                            = cast( PFN_vkCmdEndTransformFeedback2EXT                            ) vkGetInstanceProcAddr( instance, "vkCmdEndTransformFeedback2EXT" );
    vkCmdDrawIndirectByteCount2EXT                           = cast( PFN_vkCmdDrawIndirectByteCount2EXT                           ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndirectByteCount2EXT" );
    vkCmdDrawMeshTasksIndirect2EXT                           = cast( PFN_vkCmdDrawMeshTasksIndirect2EXT                           ) vkGetInstanceProcAddr( instance, "vkCmdDrawMeshTasksIndirect2EXT" );
    vkCmdDrawMeshTasksIndirectCount2EXT                      = cast( PFN_vkCmdDrawMeshTasksIndirectCount2EXT                      ) vkGetInstanceProcAddr( instance, "vkCmdDrawMeshTasksIndirectCount2EXT" );
    vkCmdWriteMarkerToMemoryAMD                              = cast( PFN_vkCmdWriteMarkerToMemoryAMD                              ) vkGetInstanceProcAddr( instance, "vkCmdWriteMarkerToMemoryAMD" );
    vkCreateAccelerationStructure2KHR                        = cast( PFN_vkCreateAccelerationStructure2KHR                        ) vkGetInstanceProcAddr( instance, "vkCreateAccelerationStructure2KHR" );

    // VK_KHR_ray_tracing_maintenance1
    vkCmdTraceRaysIndirect2KHR                               = cast( PFN_vkCmdTraceRaysIndirect2KHR                               ) vkGetInstanceProcAddr( instance, "vkCmdTraceRaysIndirect2KHR" );

    // VK_KHR_present_wait2
    vkWaitForPresent2KHR                                     = cast( PFN_vkWaitForPresent2KHR                                     ) vkGetInstanceProcAddr( instance, "vkWaitForPresent2KHR" );

    // VK_KHR_pipeline_binary
    vkCreatePipelineBinariesKHR                              = cast( PFN_vkCreatePipelineBinariesKHR                              ) vkGetInstanceProcAddr( instance, "vkCreatePipelineBinariesKHR" );
    vkDestroyPipelineBinaryKHR                               = cast( PFN_vkDestroyPipelineBinaryKHR                               ) vkGetInstanceProcAddr( instance, "vkDestroyPipelineBinaryKHR" );
    vkGetPipelineKeyKHR                                      = cast( PFN_vkGetPipelineKeyKHR                                      ) vkGetInstanceProcAddr( instance, "vkGetPipelineKeyKHR" );
    vkGetPipelineBinaryDataKHR                               = cast( PFN_vkGetPipelineBinaryDataKHR                               ) vkGetInstanceProcAddr( instance, "vkGetPipelineBinaryDataKHR" );
    vkReleaseCapturedPipelineDataKHR                         = cast( PFN_vkReleaseCapturedPipelineDataKHR                         ) vkGetInstanceProcAddr( instance, "vkReleaseCapturedPipelineDataKHR" );

    // VK_KHR_swapchain_maintenance1
    vkReleaseSwapchainImagesKHR                              = cast( PFN_vkReleaseSwapchainImagesKHR                              ) vkGetInstanceProcAddr( instance, "vkReleaseSwapchainImagesKHR" );

    // VK_KHR_calibrated_timestamps
    vkGetCalibratedTimestampsKHR                             = cast( PFN_vkGetCalibratedTimestampsKHR                             ) vkGetInstanceProcAddr( instance, "vkGetCalibratedTimestampsKHR" );

    // VK_KHR_maintenance6
    vkCmdSetDescriptorBufferOffsets2EXT                      = cast( PFN_vkCmdSetDescriptorBufferOffsets2EXT                      ) vkGetInstanceProcAddr( instance, "vkCmdSetDescriptorBufferOffsets2EXT" );
    vkCmdBindDescriptorBufferEmbeddedSamplers2EXT            = cast( PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT            ) vkGetInstanceProcAddr( instance, "vkCmdBindDescriptorBufferEmbeddedSamplers2EXT" );

    // VK_KHR_copy_memory_indirect
    vkCmdCopyMemoryIndirectKHR                               = cast( PFN_vkCmdCopyMemoryIndirectKHR                               ) vkGetInstanceProcAddr( instance, "vkCmdCopyMemoryIndirectKHR" );
    vkCmdCopyMemoryToImageIndirectKHR                        = cast( PFN_vkCmdCopyMemoryToImageIndirectKHR                        ) vkGetInstanceProcAddr( instance, "vkCmdCopyMemoryToImageIndirectKHR" );

    // VK_KHR_device_fault
    vkGetDeviceFaultReportsKHR                               = cast( PFN_vkGetDeviceFaultReportsKHR                               ) vkGetInstanceProcAddr( instance, "vkGetDeviceFaultReportsKHR" );
    vkGetDeviceFaultDebugInfoKHR                             = cast( PFN_vkGetDeviceFaultDebugInfoKHR                             ) vkGetInstanceProcAddr( instance, "vkGetDeviceFaultDebugInfoKHR" );

    // VK_KHR_maintenance10
    vkCmdEndRendering2KHR                                    = cast( PFN_vkCmdEndRendering2KHR                                    ) vkGetInstanceProcAddr( instance, "vkCmdEndRendering2KHR" );

    // VK_EXT_debug_marker
    vkDebugMarkerSetObjectTagEXT                             = cast( PFN_vkDebugMarkerSetObjectTagEXT                             ) vkGetInstanceProcAddr( instance, "vkDebugMarkerSetObjectTagEXT" );
    vkDebugMarkerSetObjectNameEXT                            = cast( PFN_vkDebugMarkerSetObjectNameEXT                            ) vkGetInstanceProcAddr( instance, "vkDebugMarkerSetObjectNameEXT" );
    vkCmdDebugMarkerBeginEXT                                 = cast( PFN_vkCmdDebugMarkerBeginEXT                                 ) vkGetInstanceProcAddr( instance, "vkCmdDebugMarkerBeginEXT" );
    vkCmdDebugMarkerEndEXT                                   = cast( PFN_vkCmdDebugMarkerEndEXT                                   ) vkGetInstanceProcAddr( instance, "vkCmdDebugMarkerEndEXT" );
    vkCmdDebugMarkerInsertEXT                                = cast( PFN_vkCmdDebugMarkerInsertEXT                                ) vkGetInstanceProcAddr( instance, "vkCmdDebugMarkerInsertEXT" );

    // VK_EXT_transform_feedback
    vkCmdBindTransformFeedbackBuffersEXT                     = cast( PFN_vkCmdBindTransformFeedbackBuffersEXT                     ) vkGetInstanceProcAddr( instance, "vkCmdBindTransformFeedbackBuffersEXT" );
    vkCmdBeginTransformFeedbackEXT                           = cast( PFN_vkCmdBeginTransformFeedbackEXT                           ) vkGetInstanceProcAddr( instance, "vkCmdBeginTransformFeedbackEXT" );
    vkCmdEndTransformFeedbackEXT                             = cast( PFN_vkCmdEndTransformFeedbackEXT                             ) vkGetInstanceProcAddr( instance, "vkCmdEndTransformFeedbackEXT" );
    vkCmdBeginQueryIndexedEXT                                = cast( PFN_vkCmdBeginQueryIndexedEXT                                ) vkGetInstanceProcAddr( instance, "vkCmdBeginQueryIndexedEXT" );
    vkCmdEndQueryIndexedEXT                                  = cast( PFN_vkCmdEndQueryIndexedEXT                                  ) vkGetInstanceProcAddr( instance, "vkCmdEndQueryIndexedEXT" );
    vkCmdDrawIndirectByteCountEXT                            = cast( PFN_vkCmdDrawIndirectByteCountEXT                            ) vkGetInstanceProcAddr( instance, "vkCmdDrawIndirectByteCountEXT" );

    // VK_NVX_binary_import
    vkCreateCuModuleNVX                                      = cast( PFN_vkCreateCuModuleNVX                                      ) vkGetInstanceProcAddr( instance, "vkCreateCuModuleNVX" );
    vkCreateCuFunctionNVX                                    = cast( PFN_vkCreateCuFunctionNVX                                    ) vkGetInstanceProcAddr( instance, "vkCreateCuFunctionNVX" );
    vkDestroyCuModuleNVX                                     = cast( PFN_vkDestroyCuModuleNVX                                     ) vkGetInstanceProcAddr( instance, "vkDestroyCuModuleNVX" );
    vkDestroyCuFunctionNVX                                   = cast( PFN_vkDestroyCuFunctionNVX                                   ) vkGetInstanceProcAddr( instance, "vkDestroyCuFunctionNVX" );
    vkCmdCuLaunchKernelNVX                                   = cast( PFN_vkCmdCuLaunchKernelNVX                                   ) vkGetInstanceProcAddr( instance, "vkCmdCuLaunchKernelNVX" );

    // VK_NVX_image_view_handle
    vkGetImageViewHandleNVX                                  = cast( PFN_vkGetImageViewHandleNVX                                  ) vkGetInstanceProcAddr( instance, "vkGetImageViewHandleNVX" );
    vkGetImageViewHandle64NVX                                = cast( PFN_vkGetImageViewHandle64NVX                                ) vkGetInstanceProcAddr( instance, "vkGetImageViewHandle64NVX" );
    vkGetImageViewAddressNVX                                 = cast( PFN_vkGetImageViewAddressNVX                                 ) vkGetInstanceProcAddr( instance, "vkGetImageViewAddressNVX" );
    vkGetDeviceCombinedImageSamplerIndexNVX                  = cast( PFN_vkGetDeviceCombinedImageSamplerIndexNVX                  ) vkGetInstanceProcAddr( instance, "vkGetDeviceCombinedImageSamplerIndexNVX" );

    // VK_AMD_shader_info
    vkGetShaderInfoAMD                                       = cast( PFN_vkGetShaderInfoAMD                                       ) vkGetInstanceProcAddr( instance, "vkGetShaderInfoAMD" );

    // VK_EXT_conditional_rendering
    vkCmdBeginConditionalRenderingEXT                        = cast( PFN_vkCmdBeginConditionalRenderingEXT                        ) vkGetInstanceProcAddr( instance, "vkCmdBeginConditionalRenderingEXT" );
    vkCmdEndConditionalRenderingEXT                          = cast( PFN_vkCmdEndConditionalRenderingEXT                          ) vkGetInstanceProcAddr( instance, "vkCmdEndConditionalRenderingEXT" );

    // VK_NV_clip_space_w_scaling
    vkCmdSetViewportWScalingNV                               = cast( PFN_vkCmdSetViewportWScalingNV                               ) vkGetInstanceProcAddr( instance, "vkCmdSetViewportWScalingNV" );

    // VK_EXT_display_control
    vkDisplayPowerControlEXT                                 = cast( PFN_vkDisplayPowerControlEXT                                 ) vkGetInstanceProcAddr( instance, "vkDisplayPowerControlEXT" );
    vkRegisterDeviceEventEXT                                 = cast( PFN_vkRegisterDeviceEventEXT                                 ) vkGetInstanceProcAddr( instance, "vkRegisterDeviceEventEXT" );
    vkRegisterDisplayEventEXT                                = cast( PFN_vkRegisterDisplayEventEXT                                ) vkGetInstanceProcAddr( instance, "vkRegisterDisplayEventEXT" );
    vkGetSwapchainCounterEXT                                 = cast( PFN_vkGetSwapchainCounterEXT                                 ) vkGetInstanceProcAddr( instance, "vkGetSwapchainCounterEXT" );

    // VK_GOOGLE_display_timing
    vkGetRefreshCycleDurationGOOGLE                          = cast( PFN_vkGetRefreshCycleDurationGOOGLE                          ) vkGetInstanceProcAddr( instance, "vkGetRefreshCycleDurationGOOGLE" );
    vkGetPastPresentationTimingGOOGLE                        = cast( PFN_vkGetPastPresentationTimingGOOGLE                        ) vkGetInstanceProcAddr( instance, "vkGetPastPresentationTimingGOOGLE" );

    // VK_EXT_discard_rectangles
    vkCmdSetDiscardRectangleEXT                              = cast( PFN_vkCmdSetDiscardRectangleEXT                              ) vkGetInstanceProcAddr( instance, "vkCmdSetDiscardRectangleEXT" );
    vkCmdSetDiscardRectangleEnableEXT                        = cast( PFN_vkCmdSetDiscardRectangleEnableEXT                        ) vkGetInstanceProcAddr( instance, "vkCmdSetDiscardRectangleEnableEXT" );
    vkCmdSetDiscardRectangleModeEXT                          = cast( PFN_vkCmdSetDiscardRectangleModeEXT                          ) vkGetInstanceProcAddr( instance, "vkCmdSetDiscardRectangleModeEXT" );

    // VK_EXT_hdr_metadata
    vkSetHdrMetadataEXT                                      = cast( PFN_vkSetHdrMetadataEXT                                      ) vkGetInstanceProcAddr( instance, "vkSetHdrMetadataEXT" );

    // VK_EXT_debug_utils
    vkSetDebugUtilsObjectNameEXT                             = cast( PFN_vkSetDebugUtilsObjectNameEXT                             ) vkGetInstanceProcAddr( instance, "vkSetDebugUtilsObjectNameEXT" );
    vkSetDebugUtilsObjectTagEXT                              = cast( PFN_vkSetDebugUtilsObjectTagEXT                              ) vkGetInstanceProcAddr( instance, "vkSetDebugUtilsObjectTagEXT" );
    vkQueueBeginDebugUtilsLabelEXT                           = cast( PFN_vkQueueBeginDebugUtilsLabelEXT                           ) vkGetInstanceProcAddr( instance, "vkQueueBeginDebugUtilsLabelEXT" );
    vkQueueEndDebugUtilsLabelEXT                             = cast( PFN_vkQueueEndDebugUtilsLabelEXT                             ) vkGetInstanceProcAddr( instance, "vkQueueEndDebugUtilsLabelEXT" );
    vkQueueInsertDebugUtilsLabelEXT                          = cast( PFN_vkQueueInsertDebugUtilsLabelEXT                          ) vkGetInstanceProcAddr( instance, "vkQueueInsertDebugUtilsLabelEXT" );
    vkCmdBeginDebugUtilsLabelEXT                             = cast( PFN_vkCmdBeginDebugUtilsLabelEXT                             ) vkGetInstanceProcAddr( instance, "vkCmdBeginDebugUtilsLabelEXT" );
    vkCmdEndDebugUtilsLabelEXT                               = cast( PFN_vkCmdEndDebugUtilsLabelEXT                               ) vkGetInstanceProcAddr( instance, "vkCmdEndDebugUtilsLabelEXT" );
    vkCmdInsertDebugUtilsLabelEXT                            = cast( PFN_vkCmdInsertDebugUtilsLabelEXT                            ) vkGetInstanceProcAddr( instance, "vkCmdInsertDebugUtilsLabelEXT" );

    // VK_AMD_gpa_interface
    vkCreateGpaSessionAMD                                    = cast( PFN_vkCreateGpaSessionAMD                                    ) vkGetInstanceProcAddr( instance, "vkCreateGpaSessionAMD" );
    vkDestroyGpaSessionAMD                                   = cast( PFN_vkDestroyGpaSessionAMD                                   ) vkGetInstanceProcAddr( instance, "vkDestroyGpaSessionAMD" );
    vkSetGpaDeviceClockModeAMD                               = cast( PFN_vkSetGpaDeviceClockModeAMD                               ) vkGetInstanceProcAddr( instance, "vkSetGpaDeviceClockModeAMD" );
    vkGetGpaDeviceClockInfoAMD                               = cast( PFN_vkGetGpaDeviceClockInfoAMD                               ) vkGetInstanceProcAddr( instance, "vkGetGpaDeviceClockInfoAMD" );
    vkCmdBeginGpaSessionAMD                                  = cast( PFN_vkCmdBeginGpaSessionAMD                                  ) vkGetInstanceProcAddr( instance, "vkCmdBeginGpaSessionAMD" );
    vkCmdEndGpaSessionAMD                                    = cast( PFN_vkCmdEndGpaSessionAMD                                    ) vkGetInstanceProcAddr( instance, "vkCmdEndGpaSessionAMD" );
    vkCmdBeginGpaSampleAMD                                   = cast( PFN_vkCmdBeginGpaSampleAMD                                   ) vkGetInstanceProcAddr( instance, "vkCmdBeginGpaSampleAMD" );
    vkCmdEndGpaSampleAMD                                     = cast( PFN_vkCmdEndGpaSampleAMD                                     ) vkGetInstanceProcAddr( instance, "vkCmdEndGpaSampleAMD" );
    vkGetGpaSessionStatusAMD                                 = cast( PFN_vkGetGpaSessionStatusAMD                                 ) vkGetInstanceProcAddr( instance, "vkGetGpaSessionStatusAMD" );
    vkGetGpaSessionResultsAMD                                = cast( PFN_vkGetGpaSessionResultsAMD                                ) vkGetInstanceProcAddr( instance, "vkGetGpaSessionResultsAMD" );
    vkResetGpaSessionAMD                                     = cast( PFN_vkResetGpaSessionAMD                                     ) vkGetInstanceProcAddr( instance, "vkResetGpaSessionAMD" );
    vkCmdCopyGpaSessionResultsAMD                            = cast( PFN_vkCmdCopyGpaSessionResultsAMD                            ) vkGetInstanceProcAddr( instance, "vkCmdCopyGpaSessionResultsAMD" );

    // VK_EXT_descriptor_heap
    vkWriteSamplerDescriptorsEXT                             = cast( PFN_vkWriteSamplerDescriptorsEXT                             ) vkGetInstanceProcAddr( instance, "vkWriteSamplerDescriptorsEXT" );
    vkWriteResourceDescriptorsEXT                            = cast( PFN_vkWriteResourceDescriptorsEXT                            ) vkGetInstanceProcAddr( instance, "vkWriteResourceDescriptorsEXT" );
    vkCmdBindSamplerHeapEXT                                  = cast( PFN_vkCmdBindSamplerHeapEXT                                  ) vkGetInstanceProcAddr( instance, "vkCmdBindSamplerHeapEXT" );
    vkCmdBindResourceHeapEXT                                 = cast( PFN_vkCmdBindResourceHeapEXT                                 ) vkGetInstanceProcAddr( instance, "vkCmdBindResourceHeapEXT" );
    vkCmdPushDataEXT                                         = cast( PFN_vkCmdPushDataEXT                                         ) vkGetInstanceProcAddr( instance, "vkCmdPushDataEXT" );
    vkGetImageOpaqueCaptureDataEXT                           = cast( PFN_vkGetImageOpaqueCaptureDataEXT                           ) vkGetInstanceProcAddr( instance, "vkGetImageOpaqueCaptureDataEXT" );
    vkRegisterCustomBorderColorEXT                           = cast( PFN_vkRegisterCustomBorderColorEXT                           ) vkGetInstanceProcAddr( instance, "vkRegisterCustomBorderColorEXT" );
    vkUnregisterCustomBorderColorEXT                         = cast( PFN_vkUnregisterCustomBorderColorEXT                         ) vkGetInstanceProcAddr( instance, "vkUnregisterCustomBorderColorEXT" );
    vkGetTensorOpaqueCaptureDataARM                          = cast( PFN_vkGetTensorOpaqueCaptureDataARM                          ) vkGetInstanceProcAddr( instance, "vkGetTensorOpaqueCaptureDataARM" );

    // VK_EXT_sample_locations
    vkCmdSetSampleLocationsEXT                               = cast( PFN_vkCmdSetSampleLocationsEXT                               ) vkGetInstanceProcAddr( instance, "vkCmdSetSampleLocationsEXT" );

    // VK_EXT_image_drm_format_modifier
    vkGetImageDrmFormatModifierPropertiesEXT                 = cast( PFN_vkGetImageDrmFormatModifierPropertiesEXT                 ) vkGetInstanceProcAddr( instance, "vkGetImageDrmFormatModifierPropertiesEXT" );

    // VK_EXT_validation_cache
    vkCreateValidationCacheEXT                               = cast( PFN_vkCreateValidationCacheEXT                               ) vkGetInstanceProcAddr( instance, "vkCreateValidationCacheEXT" );
    vkDestroyValidationCacheEXT                              = cast( PFN_vkDestroyValidationCacheEXT                              ) vkGetInstanceProcAddr( instance, "vkDestroyValidationCacheEXT" );
    vkMergeValidationCachesEXT                               = cast( PFN_vkMergeValidationCachesEXT                               ) vkGetInstanceProcAddr( instance, "vkMergeValidationCachesEXT" );
    vkGetValidationCacheDataEXT                              = cast( PFN_vkGetValidationCacheDataEXT                              ) vkGetInstanceProcAddr( instance, "vkGetValidationCacheDataEXT" );

    // VK_NV_shading_rate_image
    vkCmdBindShadingRateImageNV                              = cast( PFN_vkCmdBindShadingRateImageNV                              ) vkGetInstanceProcAddr( instance, "vkCmdBindShadingRateImageNV" );
    vkCmdSetViewportShadingRatePaletteNV                     = cast( PFN_vkCmdSetViewportShadingRatePaletteNV                     ) vkGetInstanceProcAddr( instance, "vkCmdSetViewportShadingRatePaletteNV" );
    vkCmdSetCoarseSampleOrderNV                              = cast( PFN_vkCmdSetCoarseSampleOrderNV                              ) vkGetInstanceProcAddr( instance, "vkCmdSetCoarseSampleOrderNV" );

    // VK_NV_ray_tracing
    vkCreateAccelerationStructureNV                          = cast( PFN_vkCreateAccelerationStructureNV                          ) vkGetInstanceProcAddr( instance, "vkCreateAccelerationStructureNV" );
    vkDestroyAccelerationStructureNV                         = cast( PFN_vkDestroyAccelerationStructureNV                         ) vkGetInstanceProcAddr( instance, "vkDestroyAccelerationStructureNV" );
    vkGetAccelerationStructureMemoryRequirementsNV           = cast( PFN_vkGetAccelerationStructureMemoryRequirementsNV           ) vkGetInstanceProcAddr( instance, "vkGetAccelerationStructureMemoryRequirementsNV" );
    vkBindAccelerationStructureMemoryNV                      = cast( PFN_vkBindAccelerationStructureMemoryNV                      ) vkGetInstanceProcAddr( instance, "vkBindAccelerationStructureMemoryNV" );
    vkCmdBuildAccelerationStructureNV                        = cast( PFN_vkCmdBuildAccelerationStructureNV                        ) vkGetInstanceProcAddr( instance, "vkCmdBuildAccelerationStructureNV" );
    vkCmdCopyAccelerationStructureNV                         = cast( PFN_vkCmdCopyAccelerationStructureNV                         ) vkGetInstanceProcAddr( instance, "vkCmdCopyAccelerationStructureNV" );
    vkCmdTraceRaysNV                                         = cast( PFN_vkCmdTraceRaysNV                                         ) vkGetInstanceProcAddr( instance, "vkCmdTraceRaysNV" );
    vkCreateRayTracingPipelinesNV                            = cast( PFN_vkCreateRayTracingPipelinesNV                            ) vkGetInstanceProcAddr( instance, "vkCreateRayTracingPipelinesNV" );
    vkGetRayTracingShaderGroupHandlesKHR                     = cast( PFN_vkGetRayTracingShaderGroupHandlesKHR                     ) vkGetInstanceProcAddr( instance, "vkGetRayTracingShaderGroupHandlesKHR" );
    vkGetAccelerationStructureHandleNV                       = cast( PFN_vkGetAccelerationStructureHandleNV                       ) vkGetInstanceProcAddr( instance, "vkGetAccelerationStructureHandleNV" );
    vkCmdWriteAccelerationStructuresPropertiesNV             = cast( PFN_vkCmdWriteAccelerationStructuresPropertiesNV             ) vkGetInstanceProcAddr( instance, "vkCmdWriteAccelerationStructuresPropertiesNV" );
    vkCompileDeferredNV                                      = cast( PFN_vkCompileDeferredNV                                      ) vkGetInstanceProcAddr( instance, "vkCompileDeferredNV" );

    // VK_EXT_external_memory_host
    vkGetMemoryHostPointerPropertiesEXT                      = cast( PFN_vkGetMemoryHostPointerPropertiesEXT                      ) vkGetInstanceProcAddr( instance, "vkGetMemoryHostPointerPropertiesEXT" );

    // VK_AMD_buffer_marker
    vkCmdWriteBufferMarkerAMD                                = cast( PFN_vkCmdWriteBufferMarkerAMD                                ) vkGetInstanceProcAddr( instance, "vkCmdWriteBufferMarkerAMD" );
    vkCmdWriteBufferMarker2AMD                               = cast( PFN_vkCmdWriteBufferMarker2AMD                               ) vkGetInstanceProcAddr( instance, "vkCmdWriteBufferMarker2AMD" );

    // VK_NV_mesh_shader
    vkCmdDrawMeshTasksNV                                     = cast( PFN_vkCmdDrawMeshTasksNV                                     ) vkGetInstanceProcAddr( instance, "vkCmdDrawMeshTasksNV" );
    vkCmdDrawMeshTasksIndirectNV                             = cast( PFN_vkCmdDrawMeshTasksIndirectNV                             ) vkGetInstanceProcAddr( instance, "vkCmdDrawMeshTasksIndirectNV" );
    vkCmdDrawMeshTasksIndirectCountNV                        = cast( PFN_vkCmdDrawMeshTasksIndirectCountNV                        ) vkGetInstanceProcAddr( instance, "vkCmdDrawMeshTasksIndirectCountNV" );

    // VK_NV_scissor_exclusive
    vkCmdSetExclusiveScissorEnableNV                         = cast( PFN_vkCmdSetExclusiveScissorEnableNV                         ) vkGetInstanceProcAddr( instance, "vkCmdSetExclusiveScissorEnableNV" );
    vkCmdSetExclusiveScissorNV                               = cast( PFN_vkCmdSetExclusiveScissorNV                               ) vkGetInstanceProcAddr( instance, "vkCmdSetExclusiveScissorNV" );

    // VK_NV_device_diagnostic_checkpoints
    vkCmdSetCheckpointNV                                     = cast( PFN_vkCmdSetCheckpointNV                                     ) vkGetInstanceProcAddr( instance, "vkCmdSetCheckpointNV" );
    vkGetQueueCheckpointDataNV                               = cast( PFN_vkGetQueueCheckpointDataNV                               ) vkGetInstanceProcAddr( instance, "vkGetQueueCheckpointDataNV" );
    vkGetQueueCheckpointData2NV                              = cast( PFN_vkGetQueueCheckpointData2NV                              ) vkGetInstanceProcAddr( instance, "vkGetQueueCheckpointData2NV" );

    // VK_EXT_present_timing
    vkSetSwapchainPresentTimingQueueSizeEXT                  = cast( PFN_vkSetSwapchainPresentTimingQueueSizeEXT                  ) vkGetInstanceProcAddr( instance, "vkSetSwapchainPresentTimingQueueSizeEXT" );
    vkGetSwapchainTimingPropertiesEXT                        = cast( PFN_vkGetSwapchainTimingPropertiesEXT                        ) vkGetInstanceProcAddr( instance, "vkGetSwapchainTimingPropertiesEXT" );
    vkGetSwapchainTimeDomainPropertiesEXT                    = cast( PFN_vkGetSwapchainTimeDomainPropertiesEXT                    ) vkGetInstanceProcAddr( instance, "vkGetSwapchainTimeDomainPropertiesEXT" );
    vkGetPastPresentationTimingEXT                           = cast( PFN_vkGetPastPresentationTimingEXT                           ) vkGetInstanceProcAddr( instance, "vkGetPastPresentationTimingEXT" );

    // VK_INTEL_performance_query
    vkInitializePerformanceApiINTEL                          = cast( PFN_vkInitializePerformanceApiINTEL                          ) vkGetInstanceProcAddr( instance, "vkInitializePerformanceApiINTEL" );
    vkUninitializePerformanceApiINTEL                        = cast( PFN_vkUninitializePerformanceApiINTEL                        ) vkGetInstanceProcAddr( instance, "vkUninitializePerformanceApiINTEL" );
    vkCmdSetPerformanceMarkerINTEL                           = cast( PFN_vkCmdSetPerformanceMarkerINTEL                           ) vkGetInstanceProcAddr( instance, "vkCmdSetPerformanceMarkerINTEL" );
    vkCmdSetPerformanceStreamMarkerINTEL                     = cast( PFN_vkCmdSetPerformanceStreamMarkerINTEL                     ) vkGetInstanceProcAddr( instance, "vkCmdSetPerformanceStreamMarkerINTEL" );
    vkCmdSetPerformanceOverrideINTEL                         = cast( PFN_vkCmdSetPerformanceOverrideINTEL                         ) vkGetInstanceProcAddr( instance, "vkCmdSetPerformanceOverrideINTEL" );
    vkAcquirePerformanceConfigurationINTEL                   = cast( PFN_vkAcquirePerformanceConfigurationINTEL                   ) vkGetInstanceProcAddr( instance, "vkAcquirePerformanceConfigurationINTEL" );
    vkReleasePerformanceConfigurationINTEL                   = cast( PFN_vkReleasePerformanceConfigurationINTEL                   ) vkGetInstanceProcAddr( instance, "vkReleasePerformanceConfigurationINTEL" );
    vkQueueSetPerformanceConfigurationINTEL                  = cast( PFN_vkQueueSetPerformanceConfigurationINTEL                  ) vkGetInstanceProcAddr( instance, "vkQueueSetPerformanceConfigurationINTEL" );
    vkGetPerformanceParameterINTEL                           = cast( PFN_vkGetPerformanceParameterINTEL                           ) vkGetInstanceProcAddr( instance, "vkGetPerformanceParameterINTEL" );

    // VK_AMD_display_native_hdr
    vkSetLocalDimmingAMD                                     = cast( PFN_vkSetLocalDimmingAMD                                     ) vkGetInstanceProcAddr( instance, "vkSetLocalDimmingAMD" );

    // VK_NV_device_generated_commands
    vkGetGeneratedCommandsMemoryRequirementsNV               = cast( PFN_vkGetGeneratedCommandsMemoryRequirementsNV               ) vkGetInstanceProcAddr( instance, "vkGetGeneratedCommandsMemoryRequirementsNV" );
    vkCmdPreprocessGeneratedCommandsNV                       = cast( PFN_vkCmdPreprocessGeneratedCommandsNV                       ) vkGetInstanceProcAddr( instance, "vkCmdPreprocessGeneratedCommandsNV" );
    vkCmdExecuteGeneratedCommandsNV                          = cast( PFN_vkCmdExecuteGeneratedCommandsNV                          ) vkGetInstanceProcAddr( instance, "vkCmdExecuteGeneratedCommandsNV" );
    vkCmdBindPipelineShaderGroupNV                           = cast( PFN_vkCmdBindPipelineShaderGroupNV                           ) vkGetInstanceProcAddr( instance, "vkCmdBindPipelineShaderGroupNV" );
    vkCreateIndirectCommandsLayoutNV                         = cast( PFN_vkCreateIndirectCommandsLayoutNV                         ) vkGetInstanceProcAddr( instance, "vkCreateIndirectCommandsLayoutNV" );
    vkDestroyIndirectCommandsLayoutNV                        = cast( PFN_vkDestroyIndirectCommandsLayoutNV                        ) vkGetInstanceProcAddr( instance, "vkDestroyIndirectCommandsLayoutNV" );

    // VK_EXT_depth_bias_control
    vkCmdSetDepthBias2EXT                                    = cast( PFN_vkCmdSetDepthBias2EXT                                    ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthBias2EXT" );

    // VK_QCOM_queue_perf_hint
    vkQueueSetPerfHintQCOM                                   = cast( PFN_vkQueueSetPerfHintQCOM                                   ) vkGetInstanceProcAddr( instance, "vkQueueSetPerfHintQCOM" );

    // VK_QCOM_tile_shading
    vkCmdDispatchTileQCOM                                    = cast( PFN_vkCmdDispatchTileQCOM                                    ) vkGetInstanceProcAddr( instance, "vkCmdDispatchTileQCOM" );
    vkCmdBeginPerTileExecutionQCOM                           = cast( PFN_vkCmdBeginPerTileExecutionQCOM                           ) vkGetInstanceProcAddr( instance, "vkCmdBeginPerTileExecutionQCOM" );
    vkCmdEndPerTileExecutionQCOM                             = cast( PFN_vkCmdEndPerTileExecutionQCOM                             ) vkGetInstanceProcAddr( instance, "vkCmdEndPerTileExecutionQCOM" );

    // VK_NV_low_latency
    vkSetLatencySleepModeLegacyNV                            = cast( PFN_vkSetLatencySleepModeLegacyNV                            ) vkGetInstanceProcAddr( instance, "vkSetLatencySleepModeLegacyNV" );
    vkLatencySleepLegacyNV                                   = cast( PFN_vkLatencySleepLegacyNV                                   ) vkGetInstanceProcAddr( instance, "vkLatencySleepLegacyNV" );
    vkSetLatencyMarkerLegacyNV                               = cast( PFN_vkSetLatencyMarkerLegacyNV                               ) vkGetInstanceProcAddr( instance, "vkSetLatencyMarkerLegacyNV" );
    vkGetLatencyTimingsLegacyNV                              = cast( PFN_vkGetLatencyTimingsLegacyNV                              ) vkGetInstanceProcAddr( instance, "vkGetLatencyTimingsLegacyNV" );
    vkQueueNotifyOutOfBandLegacyNV                           = cast( PFN_vkQueueNotifyOutOfBandLegacyNV                           ) vkGetInstanceProcAddr( instance, "vkQueueNotifyOutOfBandLegacyNV" );
    vkGetSleepStatusLegacyNV                                 = cast( PFN_vkGetSleepStatusLegacyNV                                 ) vkGetInstanceProcAddr( instance, "vkGetSleepStatusLegacyNV" );
    vkShutdownLatencyDeviceLegacyNV                          = cast( PFN_vkShutdownLatencyDeviceLegacyNV                          ) vkGetInstanceProcAddr( instance, "vkShutdownLatencyDeviceLegacyNV" );

    // VK_EXT_descriptor_buffer
    vkGetDescriptorSetLayoutSizeEXT                          = cast( PFN_vkGetDescriptorSetLayoutSizeEXT                          ) vkGetInstanceProcAddr( instance, "vkGetDescriptorSetLayoutSizeEXT" );
    vkGetDescriptorSetLayoutBindingOffsetEXT                 = cast( PFN_vkGetDescriptorSetLayoutBindingOffsetEXT                 ) vkGetInstanceProcAddr( instance, "vkGetDescriptorSetLayoutBindingOffsetEXT" );
    vkGetDescriptorEXT                                       = cast( PFN_vkGetDescriptorEXT                                       ) vkGetInstanceProcAddr( instance, "vkGetDescriptorEXT" );
    vkCmdBindDescriptorBuffersEXT                            = cast( PFN_vkCmdBindDescriptorBuffersEXT                            ) vkGetInstanceProcAddr( instance, "vkCmdBindDescriptorBuffersEXT" );
    vkCmdSetDescriptorBufferOffsetsEXT                       = cast( PFN_vkCmdSetDescriptorBufferOffsetsEXT                       ) vkGetInstanceProcAddr( instance, "vkCmdSetDescriptorBufferOffsetsEXT" );
    vkCmdBindDescriptorBufferEmbeddedSamplersEXT             = cast( PFN_vkCmdBindDescriptorBufferEmbeddedSamplersEXT             ) vkGetInstanceProcAddr( instance, "vkCmdBindDescriptorBufferEmbeddedSamplersEXT" );
    vkGetBufferOpaqueCaptureDescriptorDataEXT                = cast( PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT                ) vkGetInstanceProcAddr( instance, "vkGetBufferOpaqueCaptureDescriptorDataEXT" );
    vkGetImageOpaqueCaptureDescriptorDataEXT                 = cast( PFN_vkGetImageOpaqueCaptureDescriptorDataEXT                 ) vkGetInstanceProcAddr( instance, "vkGetImageOpaqueCaptureDescriptorDataEXT" );
    vkGetImageViewOpaqueCaptureDescriptorDataEXT             = cast( PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT             ) vkGetInstanceProcAddr( instance, "vkGetImageViewOpaqueCaptureDescriptorDataEXT" );
    vkGetSamplerOpaqueCaptureDescriptorDataEXT               = cast( PFN_vkGetSamplerOpaqueCaptureDescriptorDataEXT               ) vkGetInstanceProcAddr( instance, "vkGetSamplerOpaqueCaptureDescriptorDataEXT" );
    vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT = cast( PFN_vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT ) vkGetInstanceProcAddr( instance, "vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT" );

    // VK_NV_fragment_shading_rate_enums
    vkCmdSetFragmentShadingRateEnumNV                        = cast( PFN_vkCmdSetFragmentShadingRateEnumNV                        ) vkGetInstanceProcAddr( instance, "vkCmdSetFragmentShadingRateEnumNV" );

    // VK_EXT_device_fault
    vkGetDeviceFaultInfoEXT                                  = cast( PFN_vkGetDeviceFaultInfoEXT                                  ) vkGetInstanceProcAddr( instance, "vkGetDeviceFaultInfoEXT" );

    // VK_EXT_vertex_input_dynamic_state
    vkCmdSetVertexInputEXT                                   = cast( PFN_vkCmdSetVertexInputEXT                                   ) vkGetInstanceProcAddr( instance, "vkCmdSetVertexInputEXT" );

    // VK_HUAWEI_subpass_shading
    vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI          = cast( PFN_vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI          ) vkGetInstanceProcAddr( instance, "vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI" );
    vkCmdSubpassShadingHUAWEI                                = cast( PFN_vkCmdSubpassShadingHUAWEI                                ) vkGetInstanceProcAddr( instance, "vkCmdSubpassShadingHUAWEI" );

    // VK_HUAWEI_invocation_mask
    vkCmdBindInvocationMaskHUAWEI                            = cast( PFN_vkCmdBindInvocationMaskHUAWEI                            ) vkGetInstanceProcAddr( instance, "vkCmdBindInvocationMaskHUAWEI" );

    // VK_NV_external_memory_rdma
    vkGetMemoryRemoteAddressNV                               = cast( PFN_vkGetMemoryRemoteAddressNV                               ) vkGetInstanceProcAddr( instance, "vkGetMemoryRemoteAddressNV" );

    // VK_EXT_pipeline_properties
    vkGetPipelinePropertiesEXT                               = cast( PFN_vkGetPipelinePropertiesEXT                               ) vkGetInstanceProcAddr( instance, "vkGetPipelinePropertiesEXT" );

    // VK_EXT_extended_dynamic_state2
    vkCmdSetPatchControlPointsEXT                            = cast( PFN_vkCmdSetPatchControlPointsEXT                            ) vkGetInstanceProcAddr( instance, "vkCmdSetPatchControlPointsEXT" );
    vkCmdSetLogicOpEXT                                       = cast( PFN_vkCmdSetLogicOpEXT                                       ) vkGetInstanceProcAddr( instance, "vkCmdSetLogicOpEXT" );

    // VK_EXT_color_write_enable
    vkCmdSetColorWriteEnableEXT                              = cast( PFN_vkCmdSetColorWriteEnableEXT                              ) vkGetInstanceProcAddr( instance, "vkCmdSetColorWriteEnableEXT" );

    // VK_EXT_multi_draw
    vkCmdDrawMultiEXT                                        = cast( PFN_vkCmdDrawMultiEXT                                        ) vkGetInstanceProcAddr( instance, "vkCmdDrawMultiEXT" );
    vkCmdDrawMultiIndexedEXT                                 = cast( PFN_vkCmdDrawMultiIndexedEXT                                 ) vkGetInstanceProcAddr( instance, "vkCmdDrawMultiIndexedEXT" );

    // VK_EXT_opacity_micromap
    vkCreateMicromapEXT                                      = cast( PFN_vkCreateMicromapEXT                                      ) vkGetInstanceProcAddr( instance, "vkCreateMicromapEXT" );
    vkDestroyMicromapEXT                                     = cast( PFN_vkDestroyMicromapEXT                                     ) vkGetInstanceProcAddr( instance, "vkDestroyMicromapEXT" );
    vkCmdBuildMicromapsEXT                                   = cast( PFN_vkCmdBuildMicromapsEXT                                   ) vkGetInstanceProcAddr( instance, "vkCmdBuildMicromapsEXT" );
    vkBuildMicromapsEXT                                      = cast( PFN_vkBuildMicromapsEXT                                      ) vkGetInstanceProcAddr( instance, "vkBuildMicromapsEXT" );
    vkCopyMicromapEXT                                        = cast( PFN_vkCopyMicromapEXT                                        ) vkGetInstanceProcAddr( instance, "vkCopyMicromapEXT" );
    vkCopyMicromapToMemoryEXT                                = cast( PFN_vkCopyMicromapToMemoryEXT                                ) vkGetInstanceProcAddr( instance, "vkCopyMicromapToMemoryEXT" );
    vkCopyMemoryToMicromapEXT                                = cast( PFN_vkCopyMemoryToMicromapEXT                                ) vkGetInstanceProcAddr( instance, "vkCopyMemoryToMicromapEXT" );
    vkWriteMicromapsPropertiesEXT                            = cast( PFN_vkWriteMicromapsPropertiesEXT                            ) vkGetInstanceProcAddr( instance, "vkWriteMicromapsPropertiesEXT" );
    vkCmdCopyMicromapEXT                                     = cast( PFN_vkCmdCopyMicromapEXT                                     ) vkGetInstanceProcAddr( instance, "vkCmdCopyMicromapEXT" );
    vkCmdCopyMicromapToMemoryEXT                             = cast( PFN_vkCmdCopyMicromapToMemoryEXT                             ) vkGetInstanceProcAddr( instance, "vkCmdCopyMicromapToMemoryEXT" );
    vkCmdCopyMemoryToMicromapEXT                             = cast( PFN_vkCmdCopyMemoryToMicromapEXT                             ) vkGetInstanceProcAddr( instance, "vkCmdCopyMemoryToMicromapEXT" );
    vkCmdWriteMicromapsPropertiesEXT                         = cast( PFN_vkCmdWriteMicromapsPropertiesEXT                         ) vkGetInstanceProcAddr( instance, "vkCmdWriteMicromapsPropertiesEXT" );
    vkGetDeviceMicromapCompatibilityEXT                      = cast( PFN_vkGetDeviceMicromapCompatibilityEXT                      ) vkGetInstanceProcAddr( instance, "vkGetDeviceMicromapCompatibilityEXT" );
    vkGetMicromapBuildSizesEXT                               = cast( PFN_vkGetMicromapBuildSizesEXT                               ) vkGetInstanceProcAddr( instance, "vkGetMicromapBuildSizesEXT" );

    // VK_HUAWEI_cluster_culling_shader
    vkCmdDrawClusterHUAWEI                                   = cast( PFN_vkCmdDrawClusterHUAWEI                                   ) vkGetInstanceProcAddr( instance, "vkCmdDrawClusterHUAWEI" );
    vkCmdDrawClusterIndirectHUAWEI                           = cast( PFN_vkCmdDrawClusterIndirectHUAWEI                           ) vkGetInstanceProcAddr( instance, "vkCmdDrawClusterIndirectHUAWEI" );

    // VK_EXT_pageable_device_local_memory
    vkSetDeviceMemoryPriorityEXT                             = cast( PFN_vkSetDeviceMemoryPriorityEXT                             ) vkGetInstanceProcAddr( instance, "vkSetDeviceMemoryPriorityEXT" );

    // VK_ARM_scheduling_controls
    vkCmdSetDispatchParametersARM                            = cast( PFN_vkCmdSetDispatchParametersARM                            ) vkGetInstanceProcAddr( instance, "vkCmdSetDispatchParametersARM" );

    // VK_VALVE_descriptor_set_host_mapping
    vkGetDescriptorSetLayoutHostMappingInfoVALVE             = cast( PFN_vkGetDescriptorSetLayoutHostMappingInfoVALVE             ) vkGetInstanceProcAddr( instance, "vkGetDescriptorSetLayoutHostMappingInfoVALVE" );
    vkGetDescriptorSetHostMappingVALVE                       = cast( PFN_vkGetDescriptorSetHostMappingVALVE                       ) vkGetInstanceProcAddr( instance, "vkGetDescriptorSetHostMappingVALVE" );

    // VK_NV_copy_memory_indirect
    vkCmdCopyMemoryIndirectNV                                = cast( PFN_vkCmdCopyMemoryIndirectNV                                ) vkGetInstanceProcAddr( instance, "vkCmdCopyMemoryIndirectNV" );
    vkCmdCopyMemoryToImageIndirectNV                         = cast( PFN_vkCmdCopyMemoryToImageIndirectNV                         ) vkGetInstanceProcAddr( instance, "vkCmdCopyMemoryToImageIndirectNV" );

    // VK_NV_memory_decompression
    vkCmdDecompressMemoryNV                                  = cast( PFN_vkCmdDecompressMemoryNV                                  ) vkGetInstanceProcAddr( instance, "vkCmdDecompressMemoryNV" );
    vkCmdDecompressMemoryIndirectCountNV                     = cast( PFN_vkCmdDecompressMemoryIndirectCountNV                     ) vkGetInstanceProcAddr( instance, "vkCmdDecompressMemoryIndirectCountNV" );

    // VK_NV_device_generated_commands_compute
    vkGetPipelineIndirectMemoryRequirementsNV                = cast( PFN_vkGetPipelineIndirectMemoryRequirementsNV                ) vkGetInstanceProcAddr( instance, "vkGetPipelineIndirectMemoryRequirementsNV" );
    vkCmdUpdatePipelineIndirectBufferNV                      = cast( PFN_vkCmdUpdatePipelineIndirectBufferNV                      ) vkGetInstanceProcAddr( instance, "vkCmdUpdatePipelineIndirectBufferNV" );
    vkGetPipelineIndirectDeviceAddressNV                     = cast( PFN_vkGetPipelineIndirectDeviceAddressNV                     ) vkGetInstanceProcAddr( instance, "vkGetPipelineIndirectDeviceAddressNV" );

    // VK_EXT_extended_dynamic_state3
    vkCmdSetDepthClampEnableEXT                              = cast( PFN_vkCmdSetDepthClampEnableEXT                              ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthClampEnableEXT" );
    vkCmdSetPolygonModeEXT                                   = cast( PFN_vkCmdSetPolygonModeEXT                                   ) vkGetInstanceProcAddr( instance, "vkCmdSetPolygonModeEXT" );
    vkCmdSetRasterizationSamplesEXT                          = cast( PFN_vkCmdSetRasterizationSamplesEXT                          ) vkGetInstanceProcAddr( instance, "vkCmdSetRasterizationSamplesEXT" );
    vkCmdSetSampleMaskEXT                                    = cast( PFN_vkCmdSetSampleMaskEXT                                    ) vkGetInstanceProcAddr( instance, "vkCmdSetSampleMaskEXT" );
    vkCmdSetAlphaToCoverageEnableEXT                         = cast( PFN_vkCmdSetAlphaToCoverageEnableEXT                         ) vkGetInstanceProcAddr( instance, "vkCmdSetAlphaToCoverageEnableEXT" );
    vkCmdSetAlphaToOneEnableEXT                              = cast( PFN_vkCmdSetAlphaToOneEnableEXT                              ) vkGetInstanceProcAddr( instance, "vkCmdSetAlphaToOneEnableEXT" );
    vkCmdSetLogicOpEnableEXT                                 = cast( PFN_vkCmdSetLogicOpEnableEXT                                 ) vkGetInstanceProcAddr( instance, "vkCmdSetLogicOpEnableEXT" );
    vkCmdSetColorBlendEnableEXT                              = cast( PFN_vkCmdSetColorBlendEnableEXT                              ) vkGetInstanceProcAddr( instance, "vkCmdSetColorBlendEnableEXT" );
    vkCmdSetColorBlendEquationEXT                            = cast( PFN_vkCmdSetColorBlendEquationEXT                            ) vkGetInstanceProcAddr( instance, "vkCmdSetColorBlendEquationEXT" );
    vkCmdSetColorWriteMaskEXT                                = cast( PFN_vkCmdSetColorWriteMaskEXT                                ) vkGetInstanceProcAddr( instance, "vkCmdSetColorWriteMaskEXT" );
    vkCmdSetTessellationDomainOriginEXT                      = cast( PFN_vkCmdSetTessellationDomainOriginEXT                      ) vkGetInstanceProcAddr( instance, "vkCmdSetTessellationDomainOriginEXT" );
    vkCmdSetRasterizationStreamEXT                           = cast( PFN_vkCmdSetRasterizationStreamEXT                           ) vkGetInstanceProcAddr( instance, "vkCmdSetRasterizationStreamEXT" );
    vkCmdSetConservativeRasterizationModeEXT                 = cast( PFN_vkCmdSetConservativeRasterizationModeEXT                 ) vkGetInstanceProcAddr( instance, "vkCmdSetConservativeRasterizationModeEXT" );
    vkCmdSetExtraPrimitiveOverestimationSizeEXT              = cast( PFN_vkCmdSetExtraPrimitiveOverestimationSizeEXT              ) vkGetInstanceProcAddr( instance, "vkCmdSetExtraPrimitiveOverestimationSizeEXT" );
    vkCmdSetDepthClipEnableEXT                               = cast( PFN_vkCmdSetDepthClipEnableEXT                               ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthClipEnableEXT" );
    vkCmdSetSampleLocationsEnableEXT                         = cast( PFN_vkCmdSetSampleLocationsEnableEXT                         ) vkGetInstanceProcAddr( instance, "vkCmdSetSampleLocationsEnableEXT" );
    vkCmdSetColorBlendAdvancedEXT                            = cast( PFN_vkCmdSetColorBlendAdvancedEXT                            ) vkGetInstanceProcAddr( instance, "vkCmdSetColorBlendAdvancedEXT" );
    vkCmdSetProvokingVertexModeEXT                           = cast( PFN_vkCmdSetProvokingVertexModeEXT                           ) vkGetInstanceProcAddr( instance, "vkCmdSetProvokingVertexModeEXT" );
    vkCmdSetLineRasterizationModeEXT                         = cast( PFN_vkCmdSetLineRasterizationModeEXT                         ) vkGetInstanceProcAddr( instance, "vkCmdSetLineRasterizationModeEXT" );
    vkCmdSetLineStippleEnableEXT                             = cast( PFN_vkCmdSetLineStippleEnableEXT                             ) vkGetInstanceProcAddr( instance, "vkCmdSetLineStippleEnableEXT" );
    vkCmdSetDepthClipNegativeOneToOneEXT                     = cast( PFN_vkCmdSetDepthClipNegativeOneToOneEXT                     ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthClipNegativeOneToOneEXT" );
    vkCmdSetViewportWScalingEnableNV                         = cast( PFN_vkCmdSetViewportWScalingEnableNV                         ) vkGetInstanceProcAddr( instance, "vkCmdSetViewportWScalingEnableNV" );
    vkCmdSetViewportSwizzleNV                                = cast( PFN_vkCmdSetViewportSwizzleNV                                ) vkGetInstanceProcAddr( instance, "vkCmdSetViewportSwizzleNV" );
    vkCmdSetCoverageToColorEnableNV                          = cast( PFN_vkCmdSetCoverageToColorEnableNV                          ) vkGetInstanceProcAddr( instance, "vkCmdSetCoverageToColorEnableNV" );
    vkCmdSetCoverageToColorLocationNV                        = cast( PFN_vkCmdSetCoverageToColorLocationNV                        ) vkGetInstanceProcAddr( instance, "vkCmdSetCoverageToColorLocationNV" );
    vkCmdSetCoverageModulationModeNV                         = cast( PFN_vkCmdSetCoverageModulationModeNV                         ) vkGetInstanceProcAddr( instance, "vkCmdSetCoverageModulationModeNV" );
    vkCmdSetCoverageModulationTableEnableNV                  = cast( PFN_vkCmdSetCoverageModulationTableEnableNV                  ) vkGetInstanceProcAddr( instance, "vkCmdSetCoverageModulationTableEnableNV" );
    vkCmdSetCoverageModulationTableNV                        = cast( PFN_vkCmdSetCoverageModulationTableNV                        ) vkGetInstanceProcAddr( instance, "vkCmdSetCoverageModulationTableNV" );
    vkCmdSetShadingRateImageEnableNV                         = cast( PFN_vkCmdSetShadingRateImageEnableNV                         ) vkGetInstanceProcAddr( instance, "vkCmdSetShadingRateImageEnableNV" );
    vkCmdSetRepresentativeFragmentTestEnableNV               = cast( PFN_vkCmdSetRepresentativeFragmentTestEnableNV               ) vkGetInstanceProcAddr( instance, "vkCmdSetRepresentativeFragmentTestEnableNV" );
    vkCmdSetCoverageReductionModeNV                          = cast( PFN_vkCmdSetCoverageReductionModeNV                          ) vkGetInstanceProcAddr( instance, "vkCmdSetCoverageReductionModeNV" );

    // VK_ARM_tensors
    vkCreateTensorARM                                        = cast( PFN_vkCreateTensorARM                                        ) vkGetInstanceProcAddr( instance, "vkCreateTensorARM" );
    vkDestroyTensorARM                                       = cast( PFN_vkDestroyTensorARM                                       ) vkGetInstanceProcAddr( instance, "vkDestroyTensorARM" );
    vkCreateTensorViewARM                                    = cast( PFN_vkCreateTensorViewARM                                    ) vkGetInstanceProcAddr( instance, "vkCreateTensorViewARM" );
    vkDestroyTensorViewARM                                   = cast( PFN_vkDestroyTensorViewARM                                   ) vkGetInstanceProcAddr( instance, "vkDestroyTensorViewARM" );
    vkGetTensorMemoryRequirementsARM                         = cast( PFN_vkGetTensorMemoryRequirementsARM                         ) vkGetInstanceProcAddr( instance, "vkGetTensorMemoryRequirementsARM" );
    vkBindTensorMemoryARM                                    = cast( PFN_vkBindTensorMemoryARM                                    ) vkGetInstanceProcAddr( instance, "vkBindTensorMemoryARM" );
    vkGetDeviceTensorMemoryRequirementsARM                   = cast( PFN_vkGetDeviceTensorMemoryRequirementsARM                   ) vkGetInstanceProcAddr( instance, "vkGetDeviceTensorMemoryRequirementsARM" );
    vkCmdCopyTensorARM                                       = cast( PFN_vkCmdCopyTensorARM                                       ) vkGetInstanceProcAddr( instance, "vkCmdCopyTensorARM" );
    vkGetTensorOpaqueCaptureDescriptorDataARM                = cast( PFN_vkGetTensorOpaqueCaptureDescriptorDataARM                ) vkGetInstanceProcAddr( instance, "vkGetTensorOpaqueCaptureDescriptorDataARM" );
    vkGetTensorViewOpaqueCaptureDescriptorDataARM            = cast( PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM            ) vkGetInstanceProcAddr( instance, "vkGetTensorViewOpaqueCaptureDescriptorDataARM" );

    // VK_EXT_shader_module_identifier
    vkGetShaderModuleIdentifierEXT                           = cast( PFN_vkGetShaderModuleIdentifierEXT                           ) vkGetInstanceProcAddr( instance, "vkGetShaderModuleIdentifierEXT" );
    vkGetShaderModuleCreateInfoIdentifierEXT                 = cast( PFN_vkGetShaderModuleCreateInfoIdentifierEXT                 ) vkGetInstanceProcAddr( instance, "vkGetShaderModuleCreateInfoIdentifierEXT" );

    // VK_NV_optical_flow
    vkCreateOpticalFlowSessionNV                             = cast( PFN_vkCreateOpticalFlowSessionNV                             ) vkGetInstanceProcAddr( instance, "vkCreateOpticalFlowSessionNV" );
    vkDestroyOpticalFlowSessionNV                            = cast( PFN_vkDestroyOpticalFlowSessionNV                            ) vkGetInstanceProcAddr( instance, "vkDestroyOpticalFlowSessionNV" );
    vkBindOpticalFlowSessionImageNV                          = cast( PFN_vkBindOpticalFlowSessionImageNV                          ) vkGetInstanceProcAddr( instance, "vkBindOpticalFlowSessionImageNV" );
    vkCmdOpticalFlowExecuteNV                                = cast( PFN_vkCmdOpticalFlowExecuteNV                                ) vkGetInstanceProcAddr( instance, "vkCmdOpticalFlowExecuteNV" );

    // VK_AMD_anti_lag
    vkAntiLagUpdateAMD                                       = cast( PFN_vkAntiLagUpdateAMD                                       ) vkGetInstanceProcAddr( instance, "vkAntiLagUpdateAMD" );

    // VK_EXT_shader_object
    vkCreateShadersEXT                                       = cast( PFN_vkCreateShadersEXT                                       ) vkGetInstanceProcAddr( instance, "vkCreateShadersEXT" );
    vkDestroyShaderEXT                                       = cast( PFN_vkDestroyShaderEXT                                       ) vkGetInstanceProcAddr( instance, "vkDestroyShaderEXT" );
    vkGetShaderBinaryDataEXT                                 = cast( PFN_vkGetShaderBinaryDataEXT                                 ) vkGetInstanceProcAddr( instance, "vkGetShaderBinaryDataEXT" );
    vkCmdBindShadersEXT                                      = cast( PFN_vkCmdBindShadersEXT                                      ) vkGetInstanceProcAddr( instance, "vkCmdBindShadersEXT" );
    vkCmdSetDepthClampRangeEXT                               = cast( PFN_vkCmdSetDepthClampRangeEXT                               ) vkGetInstanceProcAddr( instance, "vkCmdSetDepthClampRangeEXT" );

    // VK_QCOM_tile_properties
    vkGetFramebufferTilePropertiesQCOM                       = cast( PFN_vkGetFramebufferTilePropertiesQCOM                       ) vkGetInstanceProcAddr( instance, "vkGetFramebufferTilePropertiesQCOM" );
    vkGetDynamicRenderingTilePropertiesQCOM                  = cast( PFN_vkGetDynamicRenderingTilePropertiesQCOM                  ) vkGetInstanceProcAddr( instance, "vkGetDynamicRenderingTilePropertiesQCOM" );

    // VK_NV_cooperative_vector
    vkConvertCooperativeVectorMatrixNV                       = cast( PFN_vkConvertCooperativeVectorMatrixNV                       ) vkGetInstanceProcAddr( instance, "vkConvertCooperativeVectorMatrixNV" );
    vkCmdConvertCooperativeVectorMatrixNV                    = cast( PFN_vkCmdConvertCooperativeVectorMatrixNV                    ) vkGetInstanceProcAddr( instance, "vkCmdConvertCooperativeVectorMatrixNV" );

    // VK_NV_low_latency2
    vkSetLatencySleepModeNV                                  = cast( PFN_vkSetLatencySleepModeNV                                  ) vkGetInstanceProcAddr( instance, "vkSetLatencySleepModeNV" );
    vkLatencySleepNV                                         = cast( PFN_vkLatencySleepNV                                         ) vkGetInstanceProcAddr( instance, "vkLatencySleepNV" );
    vkSetLatencyMarkerNV                                     = cast( PFN_vkSetLatencyMarkerNV                                     ) vkGetInstanceProcAddr( instance, "vkSetLatencyMarkerNV" );
    vkGetLatencyTimingsNV                                    = cast( PFN_vkGetLatencyTimingsNV                                    ) vkGetInstanceProcAddr( instance, "vkGetLatencyTimingsNV" );
    vkQueueNotifyOutOfBandNV                                 = cast( PFN_vkQueueNotifyOutOfBandNV                                 ) vkGetInstanceProcAddr( instance, "vkQueueNotifyOutOfBandNV" );

    // VK_ARM_data_graph
    vkCreateDataGraphPipelinesARM                            = cast( PFN_vkCreateDataGraphPipelinesARM                            ) vkGetInstanceProcAddr( instance, "vkCreateDataGraphPipelinesARM" );
    vkCreateDataGraphPipelineSessionARM                      = cast( PFN_vkCreateDataGraphPipelineSessionARM                      ) vkGetInstanceProcAddr( instance, "vkCreateDataGraphPipelineSessionARM" );
    vkGetDataGraphPipelineSessionBindPointRequirementsARM    = cast( PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM    ) vkGetInstanceProcAddr( instance, "vkGetDataGraphPipelineSessionBindPointRequirementsARM" );
    vkGetDataGraphPipelineSessionMemoryRequirementsARM       = cast( PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM       ) vkGetInstanceProcAddr( instance, "vkGetDataGraphPipelineSessionMemoryRequirementsARM" );
    vkBindDataGraphPipelineSessionMemoryARM                  = cast( PFN_vkBindDataGraphPipelineSessionMemoryARM                  ) vkGetInstanceProcAddr( instance, "vkBindDataGraphPipelineSessionMemoryARM" );
    vkDestroyDataGraphPipelineSessionARM                     = cast( PFN_vkDestroyDataGraphPipelineSessionARM                     ) vkGetInstanceProcAddr( instance, "vkDestroyDataGraphPipelineSessionARM" );
    vkCmdDispatchDataGraphARM                                = cast( PFN_vkCmdDispatchDataGraphARM                                ) vkGetInstanceProcAddr( instance, "vkCmdDispatchDataGraphARM" );
    vkGetDataGraphPipelineAvailablePropertiesARM             = cast( PFN_vkGetDataGraphPipelineAvailablePropertiesARM             ) vkGetInstanceProcAddr( instance, "vkGetDataGraphPipelineAvailablePropertiesARM" );
    vkGetDataGraphPipelinePropertiesARM                      = cast( PFN_vkGetDataGraphPipelinePropertiesARM                      ) vkGetInstanceProcAddr( instance, "vkGetDataGraphPipelinePropertiesARM" );

    // VK_EXT_attachment_feedback_loop_dynamic_state
    vkCmdSetAttachmentFeedbackLoopEnableEXT                  = cast( PFN_vkCmdSetAttachmentFeedbackLoopEnableEXT                  ) vkGetInstanceProcAddr( instance, "vkCmdSetAttachmentFeedbackLoopEnableEXT" );

    // VK_QCOM_tile_memory_heap
    vkCmdBindTileMemoryQCOM                                  = cast( PFN_vkCmdBindTileMemoryQCOM                                  ) vkGetInstanceProcAddr( instance, "vkCmdBindTileMemoryQCOM" );

    // VK_EXT_memory_decompression
    vkCmdDecompressMemoryEXT                                 = cast( PFN_vkCmdDecompressMemoryEXT                                 ) vkGetInstanceProcAddr( instance, "vkCmdDecompressMemoryEXT" );
    vkCmdDecompressMemoryIndirectCountEXT                    = cast( PFN_vkCmdDecompressMemoryIndirectCountEXT                    ) vkGetInstanceProcAddr( instance, "vkCmdDecompressMemoryIndirectCountEXT" );

    // VK_NV_external_compute_queue
    vkCreateExternalComputeQueueNV                           = cast( PFN_vkCreateExternalComputeQueueNV                           ) vkGetInstanceProcAddr( instance, "vkCreateExternalComputeQueueNV" );
    vkDestroyExternalComputeQueueNV                          = cast( PFN_vkDestroyExternalComputeQueueNV                          ) vkGetInstanceProcAddr( instance, "vkDestroyExternalComputeQueueNV" );

    // VK_NV_cluster_acceleration_structure
    vkGetClusterAccelerationStructureBuildSizesNV            = cast( PFN_vkGetClusterAccelerationStructureBuildSizesNV            ) vkGetInstanceProcAddr( instance, "vkGetClusterAccelerationStructureBuildSizesNV" );
    vkCmdBuildClusterAccelerationStructureIndirectNV         = cast( PFN_vkCmdBuildClusterAccelerationStructureIndirectNV         ) vkGetInstanceProcAddr( instance, "vkCmdBuildClusterAccelerationStructureIndirectNV" );

    // VK_NV_partitioned_acceleration_structure
    vkGetPartitionedAccelerationStructuresBuildSizesNV       = cast( PFN_vkGetPartitionedAccelerationStructuresBuildSizesNV       ) vkGetInstanceProcAddr( instance, "vkGetPartitionedAccelerationStructuresBuildSizesNV" );
    vkCmdBuildPartitionedAccelerationStructuresNV            = cast( PFN_vkCmdBuildPartitionedAccelerationStructuresNV            ) vkGetInstanceProcAddr( instance, "vkCmdBuildPartitionedAccelerationStructuresNV" );

    // VK_EXT_device_generated_commands
    vkGetGeneratedCommandsMemoryRequirementsEXT              = cast( PFN_vkGetGeneratedCommandsMemoryRequirementsEXT              ) vkGetInstanceProcAddr( instance, "vkGetGeneratedCommandsMemoryRequirementsEXT" );
    vkCmdPreprocessGeneratedCommandsEXT                      = cast( PFN_vkCmdPreprocessGeneratedCommandsEXT                      ) vkGetInstanceProcAddr( instance, "vkCmdPreprocessGeneratedCommandsEXT" );
    vkCmdExecuteGeneratedCommandsEXT                         = cast( PFN_vkCmdExecuteGeneratedCommandsEXT                         ) vkGetInstanceProcAddr( instance, "vkCmdExecuteGeneratedCommandsEXT" );
    vkCreateIndirectCommandsLayoutEXT                        = cast( PFN_vkCreateIndirectCommandsLayoutEXT                        ) vkGetInstanceProcAddr( instance, "vkCreateIndirectCommandsLayoutEXT" );
    vkDestroyIndirectCommandsLayoutEXT                       = cast( PFN_vkDestroyIndirectCommandsLayoutEXT                       ) vkGetInstanceProcAddr( instance, "vkDestroyIndirectCommandsLayoutEXT" );
    vkCreateIndirectExecutionSetEXT                          = cast( PFN_vkCreateIndirectExecutionSetEXT                          ) vkGetInstanceProcAddr( instance, "vkCreateIndirectExecutionSetEXT" );
    vkDestroyIndirectExecutionSetEXT                         = cast( PFN_vkDestroyIndirectExecutionSetEXT                         ) vkGetInstanceProcAddr( instance, "vkDestroyIndirectExecutionSetEXT" );
    vkUpdateIndirectExecutionSetPipelineEXT                  = cast( PFN_vkUpdateIndirectExecutionSetPipelineEXT                  ) vkGetInstanceProcAddr( instance, "vkUpdateIndirectExecutionSetPipelineEXT" );
    vkUpdateIndirectExecutionSetShaderEXT                    = cast( PFN_vkUpdateIndirectExecutionSetShaderEXT                    ) vkGetInstanceProcAddr( instance, "vkUpdateIndirectExecutionSetShaderEXT" );

    // VK_ARM_shader_instrumentation
    vkCreateShaderInstrumentationARM                         = cast( PFN_vkCreateShaderInstrumentationARM                         ) vkGetInstanceProcAddr( instance, "vkCreateShaderInstrumentationARM" );
    vkDestroyShaderInstrumentationARM                        = cast( PFN_vkDestroyShaderInstrumentationARM                        ) vkGetInstanceProcAddr( instance, "vkDestroyShaderInstrumentationARM" );
    vkCmdBeginShaderInstrumentationARM                       = cast( PFN_vkCmdBeginShaderInstrumentationARM                       ) vkGetInstanceProcAddr( instance, "vkCmdBeginShaderInstrumentationARM" );
    vkCmdEndShaderInstrumentationARM                         = cast( PFN_vkCmdEndShaderInstrumentationARM                         ) vkGetInstanceProcAddr( instance, "vkCmdEndShaderInstrumentationARM" );
    vkGetShaderInstrumentationValuesARM                      = cast( PFN_vkGetShaderInstrumentationValuesARM                      ) vkGetInstanceProcAddr( instance, "vkGetShaderInstrumentationValuesARM" );
    vkClearShaderInstrumentationMetricsARM                   = cast( PFN_vkClearShaderInstrumentationMetricsARM                   ) vkGetInstanceProcAddr( instance, "vkClearShaderInstrumentationMetricsARM" );

    // VK_EXT_custom_resolve
    vkCmdBeginCustomResolveEXT                               = cast( PFN_vkCmdBeginCustomResolveEXT                               ) vkGetInstanceProcAddr( instance, "vkCmdBeginCustomResolveEXT" );

    // VK_NV_compute_occupancy_priority
    vkCmdSetComputeOccupancyPriorityNV                       = cast( PFN_vkCmdSetComputeOccupancyPriorityNV                       ) vkGetInstanceProcAddr( instance, "vkCmdSetComputeOccupancyPriorityNV" );

    // VK_EXT_primitive_restart_index
    vkCmdSetPrimitiveRestartIndexEXT                         = cast( PFN_vkCmdSetPrimitiveRestartIndexEXT                         ) vkGetInstanceProcAddr( instance, "vkCmdSetPrimitiveRestartIndexEXT" );

    // VK_KHR_acceleration_structure
    vkCreateAccelerationStructureKHR                         = cast( PFN_vkCreateAccelerationStructureKHR                         ) vkGetInstanceProcAddr( instance, "vkCreateAccelerationStructureKHR" );
    vkDestroyAccelerationStructureKHR                        = cast( PFN_vkDestroyAccelerationStructureKHR                        ) vkGetInstanceProcAddr( instance, "vkDestroyAccelerationStructureKHR" );
    vkCmdBuildAccelerationStructuresKHR                      = cast( PFN_vkCmdBuildAccelerationStructuresKHR                      ) vkGetInstanceProcAddr( instance, "vkCmdBuildAccelerationStructuresKHR" );
    vkCmdBuildAccelerationStructuresIndirectKHR              = cast( PFN_vkCmdBuildAccelerationStructuresIndirectKHR              ) vkGetInstanceProcAddr( instance, "vkCmdBuildAccelerationStructuresIndirectKHR" );
    vkBuildAccelerationStructuresKHR                         = cast( PFN_vkBuildAccelerationStructuresKHR                         ) vkGetInstanceProcAddr( instance, "vkBuildAccelerationStructuresKHR" );
    vkCopyAccelerationStructureKHR                           = cast( PFN_vkCopyAccelerationStructureKHR                           ) vkGetInstanceProcAddr( instance, "vkCopyAccelerationStructureKHR" );
    vkCopyAccelerationStructureToMemoryKHR                   = cast( PFN_vkCopyAccelerationStructureToMemoryKHR                   ) vkGetInstanceProcAddr( instance, "vkCopyAccelerationStructureToMemoryKHR" );
    vkCopyMemoryToAccelerationStructureKHR                   = cast( PFN_vkCopyMemoryToAccelerationStructureKHR                   ) vkGetInstanceProcAddr( instance, "vkCopyMemoryToAccelerationStructureKHR" );
    vkWriteAccelerationStructuresPropertiesKHR               = cast( PFN_vkWriteAccelerationStructuresPropertiesKHR               ) vkGetInstanceProcAddr( instance, "vkWriteAccelerationStructuresPropertiesKHR" );
    vkCmdCopyAccelerationStructureKHR                        = cast( PFN_vkCmdCopyAccelerationStructureKHR                        ) vkGetInstanceProcAddr( instance, "vkCmdCopyAccelerationStructureKHR" );
    vkCmdCopyAccelerationStructureToMemoryKHR                = cast( PFN_vkCmdCopyAccelerationStructureToMemoryKHR                ) vkGetInstanceProcAddr( instance, "vkCmdCopyAccelerationStructureToMemoryKHR" );
    vkCmdCopyMemoryToAccelerationStructureKHR                = cast( PFN_vkCmdCopyMemoryToAccelerationStructureKHR                ) vkGetInstanceProcAddr( instance, "vkCmdCopyMemoryToAccelerationStructureKHR" );
    vkGetAccelerationStructureDeviceAddressKHR               = cast( PFN_vkGetAccelerationStructureDeviceAddressKHR               ) vkGetInstanceProcAddr( instance, "vkGetAccelerationStructureDeviceAddressKHR" );
    vkCmdWriteAccelerationStructuresPropertiesKHR            = cast( PFN_vkCmdWriteAccelerationStructuresPropertiesKHR            ) vkGetInstanceProcAddr( instance, "vkCmdWriteAccelerationStructuresPropertiesKHR" );
    vkGetDeviceAccelerationStructureCompatibilityKHR         = cast( PFN_vkGetDeviceAccelerationStructureCompatibilityKHR         ) vkGetInstanceProcAddr( instance, "vkGetDeviceAccelerationStructureCompatibilityKHR" );
    vkGetAccelerationStructureBuildSizesKHR                  = cast( PFN_vkGetAccelerationStructureBuildSizesKHR                  ) vkGetInstanceProcAddr( instance, "vkGetAccelerationStructureBuildSizesKHR" );

    // VK_KHR_ray_tracing_pipeline
    vkCmdTraceRaysKHR                                        = cast( PFN_vkCmdTraceRaysKHR                                        ) vkGetInstanceProcAddr( instance, "vkCmdTraceRaysKHR" );
    vkCreateRayTracingPipelinesKHR                           = cast( PFN_vkCreateRayTracingPipelinesKHR                           ) vkGetInstanceProcAddr( instance, "vkCreateRayTracingPipelinesKHR" );
    vkGetRayTracingCaptureReplayShaderGroupHandlesKHR        = cast( PFN_vkGetRayTracingCaptureReplayShaderGroupHandlesKHR        ) vkGetInstanceProcAddr( instance, "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR" );
    vkCmdTraceRaysIndirectKHR                                = cast( PFN_vkCmdTraceRaysIndirectKHR                                ) vkGetInstanceProcAddr( instance, "vkCmdTraceRaysIndirectKHR" );
    vkGetRayTracingShaderGroupStackSizeKHR                   = cast( PFN_vkGetRayTracingShaderGroupStackSizeKHR                   ) vkGetInstanceProcAddr( instance, "vkGetRayTracingShaderGroupStackSizeKHR" );
    vkCmdSetRayTracingPipelineStackSizeKHR                   = cast( PFN_vkCmdSetRayTracingPipelineStackSizeKHR                   ) vkGetInstanceProcAddr( instance, "vkCmdSetRayTracingPipelineStackSizeKHR" );

    // VK_EXT_mesh_shader
    vkCmdDrawMeshTasksEXT                                    = cast( PFN_vkCmdDrawMeshTasksEXT                                    ) vkGetInstanceProcAddr( instance, "vkCmdDrawMeshTasksEXT" );
    vkCmdDrawMeshTasksIndirectEXT                            = cast( PFN_vkCmdDrawMeshTasksIndirectEXT                            ) vkGetInstanceProcAddr( instance, "vkCmdDrawMeshTasksIndirectEXT" );
    vkCmdDrawMeshTasksIndirectCountEXT                       = cast( PFN_vkCmdDrawMeshTasksIndirectCountEXT                       ) vkGetInstanceProcAddr( instance, "vkCmdDrawMeshTasksIndirectCountEXT" );
}


/// with a valid VkDevice call this function to retrieve VkDevice, VkQueue and VkCommandBuffer related functions
/// the functions call directly VkDevice and related resources and can be retrieved for one and only one VkDevice
/// calling this function again with another VkDevices will overwrite the __gshared functions retrieved previously
/// see module erupted.dispatch_device if multiple VkDevices will be used
void loadDeviceLevelFunctions( VkDevice device ) {
    assert( vkGetDeviceProcAddr !is null, "Function pointer vkGetDeviceProcAddr is null!\nCall loadGlobalLevelFunctions -> loadInstanceLevelFunctions -> loadDeviceLevelFunctions( device )" );

    // VK_BASE_VERSION_1_0
    vkDestroyDevice                                          = cast( PFN_vkDestroyDevice                                          ) vkGetDeviceProcAddr( device, "vkDestroyDevice" );
    vkGetDeviceQueue                                         = cast( PFN_vkGetDeviceQueue                                         ) vkGetDeviceProcAddr( device, "vkGetDeviceQueue" );
    vkQueueSubmit                                            = cast( PFN_vkQueueSubmit                                            ) vkGetDeviceProcAddr( device, "vkQueueSubmit" );
    vkQueueWaitIdle                                          = cast( PFN_vkQueueWaitIdle                                          ) vkGetDeviceProcAddr( device, "vkQueueWaitIdle" );
    vkDeviceWaitIdle                                         = cast( PFN_vkDeviceWaitIdle                                         ) vkGetDeviceProcAddr( device, "vkDeviceWaitIdle" );
    vkAllocateMemory                                         = cast( PFN_vkAllocateMemory                                         ) vkGetDeviceProcAddr( device, "vkAllocateMemory" );
    vkFreeMemory                                             = cast( PFN_vkFreeMemory                                             ) vkGetDeviceProcAddr( device, "vkFreeMemory" );
    vkMapMemory                                              = cast( PFN_vkMapMemory                                              ) vkGetDeviceProcAddr( device, "vkMapMemory" );
    vkUnmapMemory                                            = cast( PFN_vkUnmapMemory                                            ) vkGetDeviceProcAddr( device, "vkUnmapMemory" );
    vkFlushMappedMemoryRanges                                = cast( PFN_vkFlushMappedMemoryRanges                                ) vkGetDeviceProcAddr( device, "vkFlushMappedMemoryRanges" );
    vkInvalidateMappedMemoryRanges                           = cast( PFN_vkInvalidateMappedMemoryRanges                           ) vkGetDeviceProcAddr( device, "vkInvalidateMappedMemoryRanges" );
    vkGetDeviceMemoryCommitment                              = cast( PFN_vkGetDeviceMemoryCommitment                              ) vkGetDeviceProcAddr( device, "vkGetDeviceMemoryCommitment" );
    vkBindBufferMemory                                       = cast( PFN_vkBindBufferMemory                                       ) vkGetDeviceProcAddr( device, "vkBindBufferMemory" );
    vkBindImageMemory                                        = cast( PFN_vkBindImageMemory                                        ) vkGetDeviceProcAddr( device, "vkBindImageMemory" );
    vkGetBufferMemoryRequirements                            = cast( PFN_vkGetBufferMemoryRequirements                            ) vkGetDeviceProcAddr( device, "vkGetBufferMemoryRequirements" );
    vkGetImageMemoryRequirements                             = cast( PFN_vkGetImageMemoryRequirements                             ) vkGetDeviceProcAddr( device, "vkGetImageMemoryRequirements" );
    vkGetImageSparseMemoryRequirements                       = cast( PFN_vkGetImageSparseMemoryRequirements                       ) vkGetDeviceProcAddr( device, "vkGetImageSparseMemoryRequirements" );
    vkQueueBindSparse                                        = cast( PFN_vkQueueBindSparse                                        ) vkGetDeviceProcAddr( device, "vkQueueBindSparse" );
    vkCreateFence                                            = cast( PFN_vkCreateFence                                            ) vkGetDeviceProcAddr( device, "vkCreateFence" );
    vkDestroyFence                                           = cast( PFN_vkDestroyFence                                           ) vkGetDeviceProcAddr( device, "vkDestroyFence" );
    vkResetFences                                            = cast( PFN_vkResetFences                                            ) vkGetDeviceProcAddr( device, "vkResetFences" );
    vkGetFenceStatus                                         = cast( PFN_vkGetFenceStatus                                         ) vkGetDeviceProcAddr( device, "vkGetFenceStatus" );
    vkWaitForFences                                          = cast( PFN_vkWaitForFences                                          ) vkGetDeviceProcAddr( device, "vkWaitForFences" );
    vkCreateSemaphore                                        = cast( PFN_vkCreateSemaphore                                        ) vkGetDeviceProcAddr( device, "vkCreateSemaphore" );
    vkDestroySemaphore                                       = cast( PFN_vkDestroySemaphore                                       ) vkGetDeviceProcAddr( device, "vkDestroySemaphore" );
    vkCreateQueryPool                                        = cast( PFN_vkCreateQueryPool                                        ) vkGetDeviceProcAddr( device, "vkCreateQueryPool" );
    vkDestroyQueryPool                                       = cast( PFN_vkDestroyQueryPool                                       ) vkGetDeviceProcAddr( device, "vkDestroyQueryPool" );
    vkGetQueryPoolResults                                    = cast( PFN_vkGetQueryPoolResults                                    ) vkGetDeviceProcAddr( device, "vkGetQueryPoolResults" );
    vkCreateBuffer                                           = cast( PFN_vkCreateBuffer                                           ) vkGetDeviceProcAddr( device, "vkCreateBuffer" );
    vkDestroyBuffer                                          = cast( PFN_vkDestroyBuffer                                          ) vkGetDeviceProcAddr( device, "vkDestroyBuffer" );
    vkCreateImage                                            = cast( PFN_vkCreateImage                                            ) vkGetDeviceProcAddr( device, "vkCreateImage" );
    vkDestroyImage                                           = cast( PFN_vkDestroyImage                                           ) vkGetDeviceProcAddr( device, "vkDestroyImage" );
    vkGetImageSubresourceLayout                              = cast( PFN_vkGetImageSubresourceLayout                              ) vkGetDeviceProcAddr( device, "vkGetImageSubresourceLayout" );
    vkCreateImageView                                        = cast( PFN_vkCreateImageView                                        ) vkGetDeviceProcAddr( device, "vkCreateImageView" );
    vkDestroyImageView                                       = cast( PFN_vkDestroyImageView                                       ) vkGetDeviceProcAddr( device, "vkDestroyImageView" );
    vkCreateCommandPool                                      = cast( PFN_vkCreateCommandPool                                      ) vkGetDeviceProcAddr( device, "vkCreateCommandPool" );
    vkDestroyCommandPool                                     = cast( PFN_vkDestroyCommandPool                                     ) vkGetDeviceProcAddr( device, "vkDestroyCommandPool" );
    vkResetCommandPool                                       = cast( PFN_vkResetCommandPool                                       ) vkGetDeviceProcAddr( device, "vkResetCommandPool" );
    vkAllocateCommandBuffers                                 = cast( PFN_vkAllocateCommandBuffers                                 ) vkGetDeviceProcAddr( device, "vkAllocateCommandBuffers" );
    vkFreeCommandBuffers                                     = cast( PFN_vkFreeCommandBuffers                                     ) vkGetDeviceProcAddr( device, "vkFreeCommandBuffers" );
    vkBeginCommandBuffer                                     = cast( PFN_vkBeginCommandBuffer                                     ) vkGetDeviceProcAddr( device, "vkBeginCommandBuffer" );
    vkEndCommandBuffer                                       = cast( PFN_vkEndCommandBuffer                                       ) vkGetDeviceProcAddr( device, "vkEndCommandBuffer" );
    vkResetCommandBuffer                                     = cast( PFN_vkResetCommandBuffer                                     ) vkGetDeviceProcAddr( device, "vkResetCommandBuffer" );
    vkCmdCopyBuffer                                          = cast( PFN_vkCmdCopyBuffer                                          ) vkGetDeviceProcAddr( device, "vkCmdCopyBuffer" );
    vkCmdCopyImage                                           = cast( PFN_vkCmdCopyImage                                           ) vkGetDeviceProcAddr( device, "vkCmdCopyImage" );
    vkCmdCopyBufferToImage                                   = cast( PFN_vkCmdCopyBufferToImage                                   ) vkGetDeviceProcAddr( device, "vkCmdCopyBufferToImage" );
    vkCmdCopyImageToBuffer                                   = cast( PFN_vkCmdCopyImageToBuffer                                   ) vkGetDeviceProcAddr( device, "vkCmdCopyImageToBuffer" );
    vkCmdUpdateBuffer                                        = cast( PFN_vkCmdUpdateBuffer                                        ) vkGetDeviceProcAddr( device, "vkCmdUpdateBuffer" );
    vkCmdFillBuffer                                          = cast( PFN_vkCmdFillBuffer                                          ) vkGetDeviceProcAddr( device, "vkCmdFillBuffer" );
    vkCmdPipelineBarrier                                     = cast( PFN_vkCmdPipelineBarrier                                     ) vkGetDeviceProcAddr( device, "vkCmdPipelineBarrier" );
    vkCmdBeginQuery                                          = cast( PFN_vkCmdBeginQuery                                          ) vkGetDeviceProcAddr( device, "vkCmdBeginQuery" );
    vkCmdEndQuery                                            = cast( PFN_vkCmdEndQuery                                            ) vkGetDeviceProcAddr( device, "vkCmdEndQuery" );
    vkCmdResetQueryPool                                      = cast( PFN_vkCmdResetQueryPool                                      ) vkGetDeviceProcAddr( device, "vkCmdResetQueryPool" );
    vkCmdWriteTimestamp                                      = cast( PFN_vkCmdWriteTimestamp                                      ) vkGetDeviceProcAddr( device, "vkCmdWriteTimestamp" );
    vkCmdCopyQueryPoolResults                                = cast( PFN_vkCmdCopyQueryPoolResults                                ) vkGetDeviceProcAddr( device, "vkCmdCopyQueryPoolResults" );
    vkCmdExecuteCommands                                     = cast( PFN_vkCmdExecuteCommands                                     ) vkGetDeviceProcAddr( device, "vkCmdExecuteCommands" );

    // VK_COMPUTE_VERSION_1_0
    vkCreateEvent                                            = cast( PFN_vkCreateEvent                                            ) vkGetDeviceProcAddr( device, "vkCreateEvent" );
    vkDestroyEvent                                           = cast( PFN_vkDestroyEvent                                           ) vkGetDeviceProcAddr( device, "vkDestroyEvent" );
    vkGetEventStatus                                         = cast( PFN_vkGetEventStatus                                         ) vkGetDeviceProcAddr( device, "vkGetEventStatus" );
    vkSetEvent                                               = cast( PFN_vkSetEvent                                               ) vkGetDeviceProcAddr( device, "vkSetEvent" );
    vkResetEvent                                             = cast( PFN_vkResetEvent                                             ) vkGetDeviceProcAddr( device, "vkResetEvent" );
    vkCreateBufferView                                       = cast( PFN_vkCreateBufferView                                       ) vkGetDeviceProcAddr( device, "vkCreateBufferView" );
    vkDestroyBufferView                                      = cast( PFN_vkDestroyBufferView                                      ) vkGetDeviceProcAddr( device, "vkDestroyBufferView" );
    vkCreateShaderModule                                     = cast( PFN_vkCreateShaderModule                                     ) vkGetDeviceProcAddr( device, "vkCreateShaderModule" );
    vkDestroyShaderModule                                    = cast( PFN_vkDestroyShaderModule                                    ) vkGetDeviceProcAddr( device, "vkDestroyShaderModule" );
    vkCreatePipelineCache                                    = cast( PFN_vkCreatePipelineCache                                    ) vkGetDeviceProcAddr( device, "vkCreatePipelineCache" );
    vkDestroyPipelineCache                                   = cast( PFN_vkDestroyPipelineCache                                   ) vkGetDeviceProcAddr( device, "vkDestroyPipelineCache" );
    vkGetPipelineCacheData                                   = cast( PFN_vkGetPipelineCacheData                                   ) vkGetDeviceProcAddr( device, "vkGetPipelineCacheData" );
    vkMergePipelineCaches                                    = cast( PFN_vkMergePipelineCaches                                    ) vkGetDeviceProcAddr( device, "vkMergePipelineCaches" );
    vkCreateComputePipelines                                 = cast( PFN_vkCreateComputePipelines                                 ) vkGetDeviceProcAddr( device, "vkCreateComputePipelines" );
    vkDestroyPipeline                                        = cast( PFN_vkDestroyPipeline                                        ) vkGetDeviceProcAddr( device, "vkDestroyPipeline" );
    vkCreatePipelineLayout                                   = cast( PFN_vkCreatePipelineLayout                                   ) vkGetDeviceProcAddr( device, "vkCreatePipelineLayout" );
    vkDestroyPipelineLayout                                  = cast( PFN_vkDestroyPipelineLayout                                  ) vkGetDeviceProcAddr( device, "vkDestroyPipelineLayout" );
    vkCreateSampler                                          = cast( PFN_vkCreateSampler                                          ) vkGetDeviceProcAddr( device, "vkCreateSampler" );
    vkDestroySampler                                         = cast( PFN_vkDestroySampler                                         ) vkGetDeviceProcAddr( device, "vkDestroySampler" );
    vkCreateDescriptorSetLayout                              = cast( PFN_vkCreateDescriptorSetLayout                              ) vkGetDeviceProcAddr( device, "vkCreateDescriptorSetLayout" );
    vkDestroyDescriptorSetLayout                             = cast( PFN_vkDestroyDescriptorSetLayout                             ) vkGetDeviceProcAddr( device, "vkDestroyDescriptorSetLayout" );
    vkCreateDescriptorPool                                   = cast( PFN_vkCreateDescriptorPool                                   ) vkGetDeviceProcAddr( device, "vkCreateDescriptorPool" );
    vkDestroyDescriptorPool                                  = cast( PFN_vkDestroyDescriptorPool                                  ) vkGetDeviceProcAddr( device, "vkDestroyDescriptorPool" );
    vkResetDescriptorPool                                    = cast( PFN_vkResetDescriptorPool                                    ) vkGetDeviceProcAddr( device, "vkResetDescriptorPool" );
    vkAllocateDescriptorSets                                 = cast( PFN_vkAllocateDescriptorSets                                 ) vkGetDeviceProcAddr( device, "vkAllocateDescriptorSets" );
    vkFreeDescriptorSets                                     = cast( PFN_vkFreeDescriptorSets                                     ) vkGetDeviceProcAddr( device, "vkFreeDescriptorSets" );
    vkUpdateDescriptorSets                                   = cast( PFN_vkUpdateDescriptorSets                                   ) vkGetDeviceProcAddr( device, "vkUpdateDescriptorSets" );
    vkCmdBindPipeline                                        = cast( PFN_vkCmdBindPipeline                                        ) vkGetDeviceProcAddr( device, "vkCmdBindPipeline" );
    vkCmdBindDescriptorSets                                  = cast( PFN_vkCmdBindDescriptorSets                                  ) vkGetDeviceProcAddr( device, "vkCmdBindDescriptorSets" );
    vkCmdClearColorImage                                     = cast( PFN_vkCmdClearColorImage                                     ) vkGetDeviceProcAddr( device, "vkCmdClearColorImage" );
    vkCmdDispatch                                            = cast( PFN_vkCmdDispatch                                            ) vkGetDeviceProcAddr( device, "vkCmdDispatch" );
    vkCmdDispatchIndirect                                    = cast( PFN_vkCmdDispatchIndirect                                    ) vkGetDeviceProcAddr( device, "vkCmdDispatchIndirect" );
    vkCmdSetEvent                                            = cast( PFN_vkCmdSetEvent                                            ) vkGetDeviceProcAddr( device, "vkCmdSetEvent" );
    vkCmdResetEvent                                          = cast( PFN_vkCmdResetEvent                                          ) vkGetDeviceProcAddr( device, "vkCmdResetEvent" );
    vkCmdWaitEvents                                          = cast( PFN_vkCmdWaitEvents                                          ) vkGetDeviceProcAddr( device, "vkCmdWaitEvents" );
    vkCmdPushConstants                                       = cast( PFN_vkCmdPushConstants                                       ) vkGetDeviceProcAddr( device, "vkCmdPushConstants" );

    // VK_GRAPHICS_VERSION_1_0
    vkCreateGraphicsPipelines                                = cast( PFN_vkCreateGraphicsPipelines                                ) vkGetDeviceProcAddr( device, "vkCreateGraphicsPipelines" );
    vkCreateFramebuffer                                      = cast( PFN_vkCreateFramebuffer                                      ) vkGetDeviceProcAddr( device, "vkCreateFramebuffer" );
    vkDestroyFramebuffer                                     = cast( PFN_vkDestroyFramebuffer                                     ) vkGetDeviceProcAddr( device, "vkDestroyFramebuffer" );
    vkCreateRenderPass                                       = cast( PFN_vkCreateRenderPass                                       ) vkGetDeviceProcAddr( device, "vkCreateRenderPass" );
    vkDestroyRenderPass                                      = cast( PFN_vkDestroyRenderPass                                      ) vkGetDeviceProcAddr( device, "vkDestroyRenderPass" );
    vkGetRenderAreaGranularity                               = cast( PFN_vkGetRenderAreaGranularity                               ) vkGetDeviceProcAddr( device, "vkGetRenderAreaGranularity" );
    vkCmdSetViewport                                         = cast( PFN_vkCmdSetViewport                                         ) vkGetDeviceProcAddr( device, "vkCmdSetViewport" );
    vkCmdSetScissor                                          = cast( PFN_vkCmdSetScissor                                          ) vkGetDeviceProcAddr( device, "vkCmdSetScissor" );
    vkCmdSetLineWidth                                        = cast( PFN_vkCmdSetLineWidth                                        ) vkGetDeviceProcAddr( device, "vkCmdSetLineWidth" );
    vkCmdSetDepthBias                                        = cast( PFN_vkCmdSetDepthBias                                        ) vkGetDeviceProcAddr( device, "vkCmdSetDepthBias" );
    vkCmdSetBlendConstants                                   = cast( PFN_vkCmdSetBlendConstants                                   ) vkGetDeviceProcAddr( device, "vkCmdSetBlendConstants" );
    vkCmdSetDepthBounds                                      = cast( PFN_vkCmdSetDepthBounds                                      ) vkGetDeviceProcAddr( device, "vkCmdSetDepthBounds" );
    vkCmdSetStencilCompareMask                               = cast( PFN_vkCmdSetStencilCompareMask                               ) vkGetDeviceProcAddr( device, "vkCmdSetStencilCompareMask" );
    vkCmdSetStencilWriteMask                                 = cast( PFN_vkCmdSetStencilWriteMask                                 ) vkGetDeviceProcAddr( device, "vkCmdSetStencilWriteMask" );
    vkCmdSetStencilReference                                 = cast( PFN_vkCmdSetStencilReference                                 ) vkGetDeviceProcAddr( device, "vkCmdSetStencilReference" );
    vkCmdBindIndexBuffer                                     = cast( PFN_vkCmdBindIndexBuffer                                     ) vkGetDeviceProcAddr( device, "vkCmdBindIndexBuffer" );
    vkCmdBindVertexBuffers                                   = cast( PFN_vkCmdBindVertexBuffers                                   ) vkGetDeviceProcAddr( device, "vkCmdBindVertexBuffers" );
    vkCmdDraw                                                = cast( PFN_vkCmdDraw                                                ) vkGetDeviceProcAddr( device, "vkCmdDraw" );
    vkCmdDrawIndexed                                         = cast( PFN_vkCmdDrawIndexed                                         ) vkGetDeviceProcAddr( device, "vkCmdDrawIndexed" );
    vkCmdDrawIndirect                                        = cast( PFN_vkCmdDrawIndirect                                        ) vkGetDeviceProcAddr( device, "vkCmdDrawIndirect" );
    vkCmdDrawIndexedIndirect                                 = cast( PFN_vkCmdDrawIndexedIndirect                                 ) vkGetDeviceProcAddr( device, "vkCmdDrawIndexedIndirect" );
    vkCmdBlitImage                                           = cast( PFN_vkCmdBlitImage                                           ) vkGetDeviceProcAddr( device, "vkCmdBlitImage" );
    vkCmdClearDepthStencilImage                              = cast( PFN_vkCmdClearDepthStencilImage                              ) vkGetDeviceProcAddr( device, "vkCmdClearDepthStencilImage" );
    vkCmdClearAttachments                                    = cast( PFN_vkCmdClearAttachments                                    ) vkGetDeviceProcAddr( device, "vkCmdClearAttachments" );
    vkCmdResolveImage                                        = cast( PFN_vkCmdResolveImage                                        ) vkGetDeviceProcAddr( device, "vkCmdResolveImage" );
    vkCmdBeginRenderPass                                     = cast( PFN_vkCmdBeginRenderPass                                     ) vkGetDeviceProcAddr( device, "vkCmdBeginRenderPass" );
    vkCmdNextSubpass                                         = cast( PFN_vkCmdNextSubpass                                         ) vkGetDeviceProcAddr( device, "vkCmdNextSubpass" );
    vkCmdEndRenderPass                                       = cast( PFN_vkCmdEndRenderPass                                       ) vkGetDeviceProcAddr( device, "vkCmdEndRenderPass" );

    // VK_BASE_VERSION_1_1
    vkBindBufferMemory2                                      = cast( PFN_vkBindBufferMemory2                                      ) vkGetDeviceProcAddr( device, "vkBindBufferMemory2" );
    vkBindImageMemory2                                       = cast( PFN_vkBindImageMemory2                                       ) vkGetDeviceProcAddr( device, "vkBindImageMemory2" );
    vkGetDeviceGroupPeerMemoryFeatures                       = cast( PFN_vkGetDeviceGroupPeerMemoryFeatures                       ) vkGetDeviceProcAddr( device, "vkGetDeviceGroupPeerMemoryFeatures" );
    vkCmdSetDeviceMask                                       = cast( PFN_vkCmdSetDeviceMask                                       ) vkGetDeviceProcAddr( device, "vkCmdSetDeviceMask" );
    vkGetImageMemoryRequirements2                            = cast( PFN_vkGetImageMemoryRequirements2                            ) vkGetDeviceProcAddr( device, "vkGetImageMemoryRequirements2" );
    vkGetBufferMemoryRequirements2                           = cast( PFN_vkGetBufferMemoryRequirements2                           ) vkGetDeviceProcAddr( device, "vkGetBufferMemoryRequirements2" );
    vkGetImageSparseMemoryRequirements2                      = cast( PFN_vkGetImageSparseMemoryRequirements2                      ) vkGetDeviceProcAddr( device, "vkGetImageSparseMemoryRequirements2" );
    vkTrimCommandPool                                        = cast( PFN_vkTrimCommandPool                                        ) vkGetDeviceProcAddr( device, "vkTrimCommandPool" );
    vkGetDeviceQueue2                                        = cast( PFN_vkGetDeviceQueue2                                        ) vkGetDeviceProcAddr( device, "vkGetDeviceQueue2" );

    // VK_COMPUTE_VERSION_1_1
    vkCmdDispatchBase                                        = cast( PFN_vkCmdDispatchBase                                        ) vkGetDeviceProcAddr( device, "vkCmdDispatchBase" );
    vkCreateDescriptorUpdateTemplate                         = cast( PFN_vkCreateDescriptorUpdateTemplate                         ) vkGetDeviceProcAddr( device, "vkCreateDescriptorUpdateTemplate" );
    vkDestroyDescriptorUpdateTemplate                        = cast( PFN_vkDestroyDescriptorUpdateTemplate                        ) vkGetDeviceProcAddr( device, "vkDestroyDescriptorUpdateTemplate" );
    vkUpdateDescriptorSetWithTemplate                        = cast( PFN_vkUpdateDescriptorSetWithTemplate                        ) vkGetDeviceProcAddr( device, "vkUpdateDescriptorSetWithTemplate" );
    vkGetDescriptorSetLayoutSupport                          = cast( PFN_vkGetDescriptorSetLayoutSupport                          ) vkGetDeviceProcAddr( device, "vkGetDescriptorSetLayoutSupport" );
    vkCreateSamplerYcbcrConversion                           = cast( PFN_vkCreateSamplerYcbcrConversion                           ) vkGetDeviceProcAddr( device, "vkCreateSamplerYcbcrConversion" );
    vkDestroySamplerYcbcrConversion                          = cast( PFN_vkDestroySamplerYcbcrConversion                          ) vkGetDeviceProcAddr( device, "vkDestroySamplerYcbcrConversion" );

    // VK_BASE_VERSION_1_2
    vkResetQueryPool                                         = cast( PFN_vkResetQueryPool                                         ) vkGetDeviceProcAddr( device, "vkResetQueryPool" );
    vkGetSemaphoreCounterValue                               = cast( PFN_vkGetSemaphoreCounterValue                               ) vkGetDeviceProcAddr( device, "vkGetSemaphoreCounterValue" );
    vkWaitSemaphores                                         = cast( PFN_vkWaitSemaphores                                         ) vkGetDeviceProcAddr( device, "vkWaitSemaphores" );
    vkSignalSemaphore                                        = cast( PFN_vkSignalSemaphore                                        ) vkGetDeviceProcAddr( device, "vkSignalSemaphore" );
    vkGetBufferDeviceAddress                                 = cast( PFN_vkGetBufferDeviceAddress                                 ) vkGetDeviceProcAddr( device, "vkGetBufferDeviceAddress" );
    vkGetBufferOpaqueCaptureAddress                          = cast( PFN_vkGetBufferOpaqueCaptureAddress                          ) vkGetDeviceProcAddr( device, "vkGetBufferOpaqueCaptureAddress" );
    vkGetDeviceMemoryOpaqueCaptureAddress                    = cast( PFN_vkGetDeviceMemoryOpaqueCaptureAddress                    ) vkGetDeviceProcAddr( device, "vkGetDeviceMemoryOpaqueCaptureAddress" );

    // VK_GRAPHICS_VERSION_1_2
    vkCmdDrawIndirectCount                                   = cast( PFN_vkCmdDrawIndirectCount                                   ) vkGetDeviceProcAddr( device, "vkCmdDrawIndirectCount" );
    vkCmdDrawIndexedIndirectCount                            = cast( PFN_vkCmdDrawIndexedIndirectCount                            ) vkGetDeviceProcAddr( device, "vkCmdDrawIndexedIndirectCount" );
    vkCreateRenderPass2                                      = cast( PFN_vkCreateRenderPass2                                      ) vkGetDeviceProcAddr( device, "vkCreateRenderPass2" );
    vkCmdBeginRenderPass2                                    = cast( PFN_vkCmdBeginRenderPass2                                    ) vkGetDeviceProcAddr( device, "vkCmdBeginRenderPass2" );
    vkCmdNextSubpass2                                        = cast( PFN_vkCmdNextSubpass2                                        ) vkGetDeviceProcAddr( device, "vkCmdNextSubpass2" );
    vkCmdEndRenderPass2                                      = cast( PFN_vkCmdEndRenderPass2                                      ) vkGetDeviceProcAddr( device, "vkCmdEndRenderPass2" );

    // VK_BASE_VERSION_1_3
    vkCreatePrivateDataSlot                                  = cast( PFN_vkCreatePrivateDataSlot                                  ) vkGetDeviceProcAddr( device, "vkCreatePrivateDataSlot" );
    vkDestroyPrivateDataSlot                                 = cast( PFN_vkDestroyPrivateDataSlot                                 ) vkGetDeviceProcAddr( device, "vkDestroyPrivateDataSlot" );
    vkSetPrivateData                                         = cast( PFN_vkSetPrivateData                                         ) vkGetDeviceProcAddr( device, "vkSetPrivateData" );
    vkGetPrivateData                                         = cast( PFN_vkGetPrivateData                                         ) vkGetDeviceProcAddr( device, "vkGetPrivateData" );
    vkCmdPipelineBarrier2                                    = cast( PFN_vkCmdPipelineBarrier2                                    ) vkGetDeviceProcAddr( device, "vkCmdPipelineBarrier2" );
    vkCmdWriteTimestamp2                                     = cast( PFN_vkCmdWriteTimestamp2                                     ) vkGetDeviceProcAddr( device, "vkCmdWriteTimestamp2" );
    vkQueueSubmit2                                           = cast( PFN_vkQueueSubmit2                                           ) vkGetDeviceProcAddr( device, "vkQueueSubmit2" );
    vkCmdCopyBuffer2                                         = cast( PFN_vkCmdCopyBuffer2                                         ) vkGetDeviceProcAddr( device, "vkCmdCopyBuffer2" );
    vkCmdCopyImage2                                          = cast( PFN_vkCmdCopyImage2                                          ) vkGetDeviceProcAddr( device, "vkCmdCopyImage2" );
    vkCmdCopyBufferToImage2                                  = cast( PFN_vkCmdCopyBufferToImage2                                  ) vkGetDeviceProcAddr( device, "vkCmdCopyBufferToImage2" );
    vkCmdCopyImageToBuffer2                                  = cast( PFN_vkCmdCopyImageToBuffer2                                  ) vkGetDeviceProcAddr( device, "vkCmdCopyImageToBuffer2" );
    vkGetDeviceBufferMemoryRequirements                      = cast( PFN_vkGetDeviceBufferMemoryRequirements                      ) vkGetDeviceProcAddr( device, "vkGetDeviceBufferMemoryRequirements" );
    vkGetDeviceImageMemoryRequirements                       = cast( PFN_vkGetDeviceImageMemoryRequirements                       ) vkGetDeviceProcAddr( device, "vkGetDeviceImageMemoryRequirements" );
    vkGetDeviceImageSparseMemoryRequirements                 = cast( PFN_vkGetDeviceImageSparseMemoryRequirements                 ) vkGetDeviceProcAddr( device, "vkGetDeviceImageSparseMemoryRequirements" );

    // VK_COMPUTE_VERSION_1_3
    vkCmdSetEvent2                                           = cast( PFN_vkCmdSetEvent2                                           ) vkGetDeviceProcAddr( device, "vkCmdSetEvent2" );
    vkCmdResetEvent2                                         = cast( PFN_vkCmdResetEvent2                                         ) vkGetDeviceProcAddr( device, "vkCmdResetEvent2" );
    vkCmdWaitEvents2                                         = cast( PFN_vkCmdWaitEvents2                                         ) vkGetDeviceProcAddr( device, "vkCmdWaitEvents2" );

    // VK_GRAPHICS_VERSION_1_3
    vkCmdBlitImage2                                          = cast( PFN_vkCmdBlitImage2                                          ) vkGetDeviceProcAddr( device, "vkCmdBlitImage2" );
    vkCmdResolveImage2                                       = cast( PFN_vkCmdResolveImage2                                       ) vkGetDeviceProcAddr( device, "vkCmdResolveImage2" );
    vkCmdBeginRendering                                      = cast( PFN_vkCmdBeginRendering                                      ) vkGetDeviceProcAddr( device, "vkCmdBeginRendering" );
    vkCmdEndRendering                                        = cast( PFN_vkCmdEndRendering                                        ) vkGetDeviceProcAddr( device, "vkCmdEndRendering" );
    vkCmdSetCullMode                                         = cast( PFN_vkCmdSetCullMode                                         ) vkGetDeviceProcAddr( device, "vkCmdSetCullMode" );
    vkCmdSetFrontFace                                        = cast( PFN_vkCmdSetFrontFace                                        ) vkGetDeviceProcAddr( device, "vkCmdSetFrontFace" );
    vkCmdSetPrimitiveTopology                                = cast( PFN_vkCmdSetPrimitiveTopology                                ) vkGetDeviceProcAddr( device, "vkCmdSetPrimitiveTopology" );
    vkCmdSetViewportWithCount                                = cast( PFN_vkCmdSetViewportWithCount                                ) vkGetDeviceProcAddr( device, "vkCmdSetViewportWithCount" );
    vkCmdSetScissorWithCount                                 = cast( PFN_vkCmdSetScissorWithCount                                 ) vkGetDeviceProcAddr( device, "vkCmdSetScissorWithCount" );
    vkCmdBindVertexBuffers2                                  = cast( PFN_vkCmdBindVertexBuffers2                                  ) vkGetDeviceProcAddr( device, "vkCmdBindVertexBuffers2" );
    vkCmdSetDepthTestEnable                                  = cast( PFN_vkCmdSetDepthTestEnable                                  ) vkGetDeviceProcAddr( device, "vkCmdSetDepthTestEnable" );
    vkCmdSetDepthWriteEnable                                 = cast( PFN_vkCmdSetDepthWriteEnable                                 ) vkGetDeviceProcAddr( device, "vkCmdSetDepthWriteEnable" );
    vkCmdSetDepthCompareOp                                   = cast( PFN_vkCmdSetDepthCompareOp                                   ) vkGetDeviceProcAddr( device, "vkCmdSetDepthCompareOp" );
    vkCmdSetDepthBoundsTestEnable                            = cast( PFN_vkCmdSetDepthBoundsTestEnable                            ) vkGetDeviceProcAddr( device, "vkCmdSetDepthBoundsTestEnable" );
    vkCmdSetStencilTestEnable                                = cast( PFN_vkCmdSetStencilTestEnable                                ) vkGetDeviceProcAddr( device, "vkCmdSetStencilTestEnable" );
    vkCmdSetStencilOp                                        = cast( PFN_vkCmdSetStencilOp                                        ) vkGetDeviceProcAddr( device, "vkCmdSetStencilOp" );
    vkCmdSetRasterizerDiscardEnable                          = cast( PFN_vkCmdSetRasterizerDiscardEnable                          ) vkGetDeviceProcAddr( device, "vkCmdSetRasterizerDiscardEnable" );
    vkCmdSetDepthBiasEnable                                  = cast( PFN_vkCmdSetDepthBiasEnable                                  ) vkGetDeviceProcAddr( device, "vkCmdSetDepthBiasEnable" );
    vkCmdSetPrimitiveRestartEnable                           = cast( PFN_vkCmdSetPrimitiveRestartEnable                           ) vkGetDeviceProcAddr( device, "vkCmdSetPrimitiveRestartEnable" );

    // VK_BASE_VERSION_1_4
    vkMapMemory2                                             = cast( PFN_vkMapMemory2                                             ) vkGetDeviceProcAddr( device, "vkMapMemory2" );
    vkUnmapMemory2                                           = cast( PFN_vkUnmapMemory2                                           ) vkGetDeviceProcAddr( device, "vkUnmapMemory2" );
    vkGetDeviceImageSubresourceLayout                        = cast( PFN_vkGetDeviceImageSubresourceLayout                        ) vkGetDeviceProcAddr( device, "vkGetDeviceImageSubresourceLayout" );
    vkGetImageSubresourceLayout2                             = cast( PFN_vkGetImageSubresourceLayout2                             ) vkGetDeviceProcAddr( device, "vkGetImageSubresourceLayout2" );
    vkCopyMemoryToImage                                      = cast( PFN_vkCopyMemoryToImage                                      ) vkGetDeviceProcAddr( device, "vkCopyMemoryToImage" );
    vkCopyImageToMemory                                      = cast( PFN_vkCopyImageToMemory                                      ) vkGetDeviceProcAddr( device, "vkCopyImageToMemory" );
    vkCopyImageToImage                                       = cast( PFN_vkCopyImageToImage                                       ) vkGetDeviceProcAddr( device, "vkCopyImageToImage" );
    vkTransitionImageLayout                                  = cast( PFN_vkTransitionImageLayout                                  ) vkGetDeviceProcAddr( device, "vkTransitionImageLayout" );

    // VK_COMPUTE_VERSION_1_4
    vkCmdPushDescriptorSet                                   = cast( PFN_vkCmdPushDescriptorSet                                   ) vkGetDeviceProcAddr( device, "vkCmdPushDescriptorSet" );
    vkCmdPushDescriptorSetWithTemplate                       = cast( PFN_vkCmdPushDescriptorSetWithTemplate                       ) vkGetDeviceProcAddr( device, "vkCmdPushDescriptorSetWithTemplate" );
    vkCmdBindDescriptorSets2                                 = cast( PFN_vkCmdBindDescriptorSets2                                 ) vkGetDeviceProcAddr( device, "vkCmdBindDescriptorSets2" );
    vkCmdPushConstants2                                      = cast( PFN_vkCmdPushConstants2                                      ) vkGetDeviceProcAddr( device, "vkCmdPushConstants2" );
    vkCmdPushDescriptorSet2                                  = cast( PFN_vkCmdPushDescriptorSet2                                  ) vkGetDeviceProcAddr( device, "vkCmdPushDescriptorSet2" );
    vkCmdPushDescriptorSetWithTemplate2                      = cast( PFN_vkCmdPushDescriptorSetWithTemplate2                      ) vkGetDeviceProcAddr( device, "vkCmdPushDescriptorSetWithTemplate2" );

    // VK_GRAPHICS_VERSION_1_4
    vkCmdSetLineStipple                                      = cast( PFN_vkCmdSetLineStipple                                      ) vkGetDeviceProcAddr( device, "vkCmdSetLineStipple" );
    vkCmdBindIndexBuffer2                                    = cast( PFN_vkCmdBindIndexBuffer2                                    ) vkGetDeviceProcAddr( device, "vkCmdBindIndexBuffer2" );
    vkGetRenderingAreaGranularity                            = cast( PFN_vkGetRenderingAreaGranularity                            ) vkGetDeviceProcAddr( device, "vkGetRenderingAreaGranularity" );
    vkCmdSetRenderingAttachmentLocations                     = cast( PFN_vkCmdSetRenderingAttachmentLocations                     ) vkGetDeviceProcAddr( device, "vkCmdSetRenderingAttachmentLocations" );
    vkCmdSetRenderingInputAttachmentIndices                  = cast( PFN_vkCmdSetRenderingInputAttachmentIndices                  ) vkGetDeviceProcAddr( device, "vkCmdSetRenderingInputAttachmentIndices" );

    // VK_KHR_swapchain
    vkCreateSwapchainKHR                                     = cast( PFN_vkCreateSwapchainKHR                                     ) vkGetDeviceProcAddr( device, "vkCreateSwapchainKHR" );
    vkDestroySwapchainKHR                                    = cast( PFN_vkDestroySwapchainKHR                                    ) vkGetDeviceProcAddr( device, "vkDestroySwapchainKHR" );
    vkGetSwapchainImagesKHR                                  = cast( PFN_vkGetSwapchainImagesKHR                                  ) vkGetDeviceProcAddr( device, "vkGetSwapchainImagesKHR" );
    vkAcquireNextImageKHR                                    = cast( PFN_vkAcquireNextImageKHR                                    ) vkGetDeviceProcAddr( device, "vkAcquireNextImageKHR" );
    vkQueuePresentKHR                                        = cast( PFN_vkQueuePresentKHR                                        ) vkGetDeviceProcAddr( device, "vkQueuePresentKHR" );
    vkGetDeviceGroupPresentCapabilitiesKHR                   = cast( PFN_vkGetDeviceGroupPresentCapabilitiesKHR                   ) vkGetDeviceProcAddr( device, "vkGetDeviceGroupPresentCapabilitiesKHR" );
    vkGetDeviceGroupSurfacePresentModesKHR                   = cast( PFN_vkGetDeviceGroupSurfacePresentModesKHR                   ) vkGetDeviceProcAddr( device, "vkGetDeviceGroupSurfacePresentModesKHR" );
    vkAcquireNextImage2KHR                                   = cast( PFN_vkAcquireNextImage2KHR                                   ) vkGetDeviceProcAddr( device, "vkAcquireNextImage2KHR" );

    // VK_KHR_display_swapchain
    vkCreateSharedSwapchainsKHR                              = cast( PFN_vkCreateSharedSwapchainsKHR                              ) vkGetDeviceProcAddr( device, "vkCreateSharedSwapchainsKHR" );

    // VK_KHR_video_queue
    vkCreateVideoSessionKHR                                  = cast( PFN_vkCreateVideoSessionKHR                                  ) vkGetDeviceProcAddr( device, "vkCreateVideoSessionKHR" );
    vkDestroyVideoSessionKHR                                 = cast( PFN_vkDestroyVideoSessionKHR                                 ) vkGetDeviceProcAddr( device, "vkDestroyVideoSessionKHR" );
    vkGetVideoSessionMemoryRequirementsKHR                   = cast( PFN_vkGetVideoSessionMemoryRequirementsKHR                   ) vkGetDeviceProcAddr( device, "vkGetVideoSessionMemoryRequirementsKHR" );
    vkBindVideoSessionMemoryKHR                              = cast( PFN_vkBindVideoSessionMemoryKHR                              ) vkGetDeviceProcAddr( device, "vkBindVideoSessionMemoryKHR" );
    vkCreateVideoSessionParametersKHR                        = cast( PFN_vkCreateVideoSessionParametersKHR                        ) vkGetDeviceProcAddr( device, "vkCreateVideoSessionParametersKHR" );
    vkUpdateVideoSessionParametersKHR                        = cast( PFN_vkUpdateVideoSessionParametersKHR                        ) vkGetDeviceProcAddr( device, "vkUpdateVideoSessionParametersKHR" );
    vkDestroyVideoSessionParametersKHR                       = cast( PFN_vkDestroyVideoSessionParametersKHR                       ) vkGetDeviceProcAddr( device, "vkDestroyVideoSessionParametersKHR" );
    vkCmdBeginVideoCodingKHR                                 = cast( PFN_vkCmdBeginVideoCodingKHR                                 ) vkGetDeviceProcAddr( device, "vkCmdBeginVideoCodingKHR" );
    vkCmdEndVideoCodingKHR                                   = cast( PFN_vkCmdEndVideoCodingKHR                                   ) vkGetDeviceProcAddr( device, "vkCmdEndVideoCodingKHR" );
    vkCmdControlVideoCodingKHR                               = cast( PFN_vkCmdControlVideoCodingKHR                               ) vkGetDeviceProcAddr( device, "vkCmdControlVideoCodingKHR" );

    // VK_KHR_video_decode_queue
    vkCmdDecodeVideoKHR                                      = cast( PFN_vkCmdDecodeVideoKHR                                      ) vkGetDeviceProcAddr( device, "vkCmdDecodeVideoKHR" );

    // VK_KHR_external_memory_fd
    vkGetMemoryFdKHR                                         = cast( PFN_vkGetMemoryFdKHR                                         ) vkGetDeviceProcAddr( device, "vkGetMemoryFdKHR" );
    vkGetMemoryFdPropertiesKHR                               = cast( PFN_vkGetMemoryFdPropertiesKHR                               ) vkGetDeviceProcAddr( device, "vkGetMemoryFdPropertiesKHR" );

    // VK_KHR_external_semaphore_fd
    vkImportSemaphoreFdKHR                                   = cast( PFN_vkImportSemaphoreFdKHR                                   ) vkGetDeviceProcAddr( device, "vkImportSemaphoreFdKHR" );
    vkGetSemaphoreFdKHR                                      = cast( PFN_vkGetSemaphoreFdKHR                                      ) vkGetDeviceProcAddr( device, "vkGetSemaphoreFdKHR" );

    // VK_KHR_shared_presentable_image
    vkGetSwapchainStatusKHR                                  = cast( PFN_vkGetSwapchainStatusKHR                                  ) vkGetDeviceProcAddr( device, "vkGetSwapchainStatusKHR" );

    // VK_KHR_external_fence_fd
    vkImportFenceFdKHR                                       = cast( PFN_vkImportFenceFdKHR                                       ) vkGetDeviceProcAddr( device, "vkImportFenceFdKHR" );
    vkGetFenceFdKHR                                          = cast( PFN_vkGetFenceFdKHR                                          ) vkGetDeviceProcAddr( device, "vkGetFenceFdKHR" );

    // VK_KHR_performance_query
    vkAcquireProfilingLockKHR                                = cast( PFN_vkAcquireProfilingLockKHR                                ) vkGetDeviceProcAddr( device, "vkAcquireProfilingLockKHR" );
    vkReleaseProfilingLockKHR                                = cast( PFN_vkReleaseProfilingLockKHR                                ) vkGetDeviceProcAddr( device, "vkReleaseProfilingLockKHR" );

    // VK_KHR_fragment_shading_rate
    vkCmdSetFragmentShadingRateKHR                           = cast( PFN_vkCmdSetFragmentShadingRateKHR                           ) vkGetDeviceProcAddr( device, "vkCmdSetFragmentShadingRateKHR" );

    // VK_KHR_present_wait
    vkWaitForPresentKHR                                      = cast( PFN_vkWaitForPresentKHR                                      ) vkGetDeviceProcAddr( device, "vkWaitForPresentKHR" );

    // VK_KHR_deferred_host_operations
    vkCreateDeferredOperationKHR                             = cast( PFN_vkCreateDeferredOperationKHR                             ) vkGetDeviceProcAddr( device, "vkCreateDeferredOperationKHR" );
    vkDestroyDeferredOperationKHR                            = cast( PFN_vkDestroyDeferredOperationKHR                            ) vkGetDeviceProcAddr( device, "vkDestroyDeferredOperationKHR" );
    vkGetDeferredOperationMaxConcurrencyKHR                  = cast( PFN_vkGetDeferredOperationMaxConcurrencyKHR                  ) vkGetDeviceProcAddr( device, "vkGetDeferredOperationMaxConcurrencyKHR" );
    vkGetDeferredOperationResultKHR                          = cast( PFN_vkGetDeferredOperationResultKHR                          ) vkGetDeviceProcAddr( device, "vkGetDeferredOperationResultKHR" );
    vkDeferredOperationJoinKHR                               = cast( PFN_vkDeferredOperationJoinKHR                               ) vkGetDeviceProcAddr( device, "vkDeferredOperationJoinKHR" );

    // VK_KHR_pipeline_executable_properties
    vkGetPipelineExecutablePropertiesKHR                     = cast( PFN_vkGetPipelineExecutablePropertiesKHR                     ) vkGetDeviceProcAddr( device, "vkGetPipelineExecutablePropertiesKHR" );
    vkGetPipelineExecutableStatisticsKHR                     = cast( PFN_vkGetPipelineExecutableStatisticsKHR                     ) vkGetDeviceProcAddr( device, "vkGetPipelineExecutableStatisticsKHR" );
    vkGetPipelineExecutableInternalRepresentationsKHR        = cast( PFN_vkGetPipelineExecutableInternalRepresentationsKHR        ) vkGetDeviceProcAddr( device, "vkGetPipelineExecutableInternalRepresentationsKHR" );

    // VK_KHR_video_encode_queue
    vkGetEncodedVideoSessionParametersKHR                    = cast( PFN_vkGetEncodedVideoSessionParametersKHR                    ) vkGetDeviceProcAddr( device, "vkGetEncodedVideoSessionParametersKHR" );
    vkCmdEncodeVideoKHR                                      = cast( PFN_vkCmdEncodeVideoKHR                                      ) vkGetDeviceProcAddr( device, "vkCmdEncodeVideoKHR" );

    // VK_KHR_device_address_commands
    vkCmdBindIndexBuffer3KHR                                 = cast( PFN_vkCmdBindIndexBuffer3KHR                                 ) vkGetDeviceProcAddr( device, "vkCmdBindIndexBuffer3KHR" );
    vkCmdBindVertexBuffers3KHR                               = cast( PFN_vkCmdBindVertexBuffers3KHR                               ) vkGetDeviceProcAddr( device, "vkCmdBindVertexBuffers3KHR" );
    vkCmdDrawIndirect2KHR                                    = cast( PFN_vkCmdDrawIndirect2KHR                                    ) vkGetDeviceProcAddr( device, "vkCmdDrawIndirect2KHR" );
    vkCmdDrawIndexedIndirect2KHR                             = cast( PFN_vkCmdDrawIndexedIndirect2KHR                             ) vkGetDeviceProcAddr( device, "vkCmdDrawIndexedIndirect2KHR" );
    vkCmdDispatchIndirect2KHR                                = cast( PFN_vkCmdDispatchIndirect2KHR                                ) vkGetDeviceProcAddr( device, "vkCmdDispatchIndirect2KHR" );
    vkCmdCopyMemoryKHR                                       = cast( PFN_vkCmdCopyMemoryKHR                                       ) vkGetDeviceProcAddr( device, "vkCmdCopyMemoryKHR" );
    vkCmdCopyMemoryToImageKHR                                = cast( PFN_vkCmdCopyMemoryToImageKHR                                ) vkGetDeviceProcAddr( device, "vkCmdCopyMemoryToImageKHR" );
    vkCmdCopyImageToMemoryKHR                                = cast( PFN_vkCmdCopyImageToMemoryKHR                                ) vkGetDeviceProcAddr( device, "vkCmdCopyImageToMemoryKHR" );
    vkCmdUpdateMemoryKHR                                     = cast( PFN_vkCmdUpdateMemoryKHR                                     ) vkGetDeviceProcAddr( device, "vkCmdUpdateMemoryKHR" );
    vkCmdFillMemoryKHR                                       = cast( PFN_vkCmdFillMemoryKHR                                       ) vkGetDeviceProcAddr( device, "vkCmdFillMemoryKHR" );
    vkCmdCopyQueryPoolResultsToMemoryKHR                     = cast( PFN_vkCmdCopyQueryPoolResultsToMemoryKHR                     ) vkGetDeviceProcAddr( device, "vkCmdCopyQueryPoolResultsToMemoryKHR" );
    vkCmdDrawIndirectCount2KHR                               = cast( PFN_vkCmdDrawIndirectCount2KHR                               ) vkGetDeviceProcAddr( device, "vkCmdDrawIndirectCount2KHR" );
    vkCmdDrawIndexedIndirectCount2KHR                        = cast( PFN_vkCmdDrawIndexedIndirectCount2KHR                        ) vkGetDeviceProcAddr( device, "vkCmdDrawIndexedIndirectCount2KHR" );
    vkCmdBeginConditionalRendering2EXT                       = cast( PFN_vkCmdBeginConditionalRendering2EXT                       ) vkGetDeviceProcAddr( device, "vkCmdBeginConditionalRendering2EXT" );
    vkCmdBindTransformFeedbackBuffers2EXT                    = cast( PFN_vkCmdBindTransformFeedbackBuffers2EXT                    ) vkGetDeviceProcAddr( device, "vkCmdBindTransformFeedbackBuffers2EXT" );
    vkCmdBeginTransformFeedback2EXT                          = cast( PFN_vkCmdBeginTransformFeedback2EXT                          ) vkGetDeviceProcAddr( device, "vkCmdBeginTransformFeedback2EXT" );
    vkCmdEndTransformFeedback2EXT                            = cast( PFN_vkCmdEndTransformFeedback2EXT                            ) vkGetDeviceProcAddr( device, "vkCmdEndTransformFeedback2EXT" );
    vkCmdDrawIndirectByteCount2EXT                           = cast( PFN_vkCmdDrawIndirectByteCount2EXT                           ) vkGetDeviceProcAddr( device, "vkCmdDrawIndirectByteCount2EXT" );
    vkCmdDrawMeshTasksIndirect2EXT                           = cast( PFN_vkCmdDrawMeshTasksIndirect2EXT                           ) vkGetDeviceProcAddr( device, "vkCmdDrawMeshTasksIndirect2EXT" );
    vkCmdDrawMeshTasksIndirectCount2EXT                      = cast( PFN_vkCmdDrawMeshTasksIndirectCount2EXT                      ) vkGetDeviceProcAddr( device, "vkCmdDrawMeshTasksIndirectCount2EXT" );
    vkCmdWriteMarkerToMemoryAMD                              = cast( PFN_vkCmdWriteMarkerToMemoryAMD                              ) vkGetDeviceProcAddr( device, "vkCmdWriteMarkerToMemoryAMD" );
    vkCreateAccelerationStructure2KHR                        = cast( PFN_vkCreateAccelerationStructure2KHR                        ) vkGetDeviceProcAddr( device, "vkCreateAccelerationStructure2KHR" );

    // VK_KHR_ray_tracing_maintenance1
    vkCmdTraceRaysIndirect2KHR                               = cast( PFN_vkCmdTraceRaysIndirect2KHR                               ) vkGetDeviceProcAddr( device, "vkCmdTraceRaysIndirect2KHR" );

    // VK_KHR_present_wait2
    vkWaitForPresent2KHR                                     = cast( PFN_vkWaitForPresent2KHR                                     ) vkGetDeviceProcAddr( device, "vkWaitForPresent2KHR" );

    // VK_KHR_pipeline_binary
    vkCreatePipelineBinariesKHR                              = cast( PFN_vkCreatePipelineBinariesKHR                              ) vkGetDeviceProcAddr( device, "vkCreatePipelineBinariesKHR" );
    vkDestroyPipelineBinaryKHR                               = cast( PFN_vkDestroyPipelineBinaryKHR                               ) vkGetDeviceProcAddr( device, "vkDestroyPipelineBinaryKHR" );
    vkGetPipelineKeyKHR                                      = cast( PFN_vkGetPipelineKeyKHR                                      ) vkGetDeviceProcAddr( device, "vkGetPipelineKeyKHR" );
    vkGetPipelineBinaryDataKHR                               = cast( PFN_vkGetPipelineBinaryDataKHR                               ) vkGetDeviceProcAddr( device, "vkGetPipelineBinaryDataKHR" );
    vkReleaseCapturedPipelineDataKHR                         = cast( PFN_vkReleaseCapturedPipelineDataKHR                         ) vkGetDeviceProcAddr( device, "vkReleaseCapturedPipelineDataKHR" );

    // VK_KHR_swapchain_maintenance1
    vkReleaseSwapchainImagesKHR                              = cast( PFN_vkReleaseSwapchainImagesKHR                              ) vkGetDeviceProcAddr( device, "vkReleaseSwapchainImagesKHR" );

    // VK_KHR_calibrated_timestamps
    vkGetCalibratedTimestampsKHR                             = cast( PFN_vkGetCalibratedTimestampsKHR                             ) vkGetDeviceProcAddr( device, "vkGetCalibratedTimestampsKHR" );

    // VK_KHR_maintenance6
    vkCmdSetDescriptorBufferOffsets2EXT                      = cast( PFN_vkCmdSetDescriptorBufferOffsets2EXT                      ) vkGetDeviceProcAddr( device, "vkCmdSetDescriptorBufferOffsets2EXT" );
    vkCmdBindDescriptorBufferEmbeddedSamplers2EXT            = cast( PFN_vkCmdBindDescriptorBufferEmbeddedSamplers2EXT            ) vkGetDeviceProcAddr( device, "vkCmdBindDescriptorBufferEmbeddedSamplers2EXT" );

    // VK_KHR_copy_memory_indirect
    vkCmdCopyMemoryIndirectKHR                               = cast( PFN_vkCmdCopyMemoryIndirectKHR                               ) vkGetDeviceProcAddr( device, "vkCmdCopyMemoryIndirectKHR" );
    vkCmdCopyMemoryToImageIndirectKHR                        = cast( PFN_vkCmdCopyMemoryToImageIndirectKHR                        ) vkGetDeviceProcAddr( device, "vkCmdCopyMemoryToImageIndirectKHR" );

    // VK_KHR_device_fault
    vkGetDeviceFaultReportsKHR                               = cast( PFN_vkGetDeviceFaultReportsKHR                               ) vkGetDeviceProcAddr( device, "vkGetDeviceFaultReportsKHR" );
    vkGetDeviceFaultDebugInfoKHR                             = cast( PFN_vkGetDeviceFaultDebugInfoKHR                             ) vkGetDeviceProcAddr( device, "vkGetDeviceFaultDebugInfoKHR" );

    // VK_KHR_maintenance10
    vkCmdEndRendering2KHR                                    = cast( PFN_vkCmdEndRendering2KHR                                    ) vkGetDeviceProcAddr( device, "vkCmdEndRendering2KHR" );

    // VK_EXT_debug_marker
    vkDebugMarkerSetObjectTagEXT                             = cast( PFN_vkDebugMarkerSetObjectTagEXT                             ) vkGetDeviceProcAddr( device, "vkDebugMarkerSetObjectTagEXT" );
    vkDebugMarkerSetObjectNameEXT                            = cast( PFN_vkDebugMarkerSetObjectNameEXT                            ) vkGetDeviceProcAddr( device, "vkDebugMarkerSetObjectNameEXT" );
    vkCmdDebugMarkerBeginEXT                                 = cast( PFN_vkCmdDebugMarkerBeginEXT                                 ) vkGetDeviceProcAddr( device, "vkCmdDebugMarkerBeginEXT" );
    vkCmdDebugMarkerEndEXT                                   = cast( PFN_vkCmdDebugMarkerEndEXT                                   ) vkGetDeviceProcAddr( device, "vkCmdDebugMarkerEndEXT" );
    vkCmdDebugMarkerInsertEXT                                = cast( PFN_vkCmdDebugMarkerInsertEXT                                ) vkGetDeviceProcAddr( device, "vkCmdDebugMarkerInsertEXT" );

    // VK_EXT_transform_feedback
    vkCmdBindTransformFeedbackBuffersEXT                     = cast( PFN_vkCmdBindTransformFeedbackBuffersEXT                     ) vkGetDeviceProcAddr( device, "vkCmdBindTransformFeedbackBuffersEXT" );
    vkCmdBeginTransformFeedbackEXT                           = cast( PFN_vkCmdBeginTransformFeedbackEXT                           ) vkGetDeviceProcAddr( device, "vkCmdBeginTransformFeedbackEXT" );
    vkCmdEndTransformFeedbackEXT                             = cast( PFN_vkCmdEndTransformFeedbackEXT                             ) vkGetDeviceProcAddr( device, "vkCmdEndTransformFeedbackEXT" );
    vkCmdBeginQueryIndexedEXT                                = cast( PFN_vkCmdBeginQueryIndexedEXT                                ) vkGetDeviceProcAddr( device, "vkCmdBeginQueryIndexedEXT" );
    vkCmdEndQueryIndexedEXT                                  = cast( PFN_vkCmdEndQueryIndexedEXT                                  ) vkGetDeviceProcAddr( device, "vkCmdEndQueryIndexedEXT" );
    vkCmdDrawIndirectByteCountEXT                            = cast( PFN_vkCmdDrawIndirectByteCountEXT                            ) vkGetDeviceProcAddr( device, "vkCmdDrawIndirectByteCountEXT" );

    // VK_NVX_binary_import
    vkCreateCuModuleNVX                                      = cast( PFN_vkCreateCuModuleNVX                                      ) vkGetDeviceProcAddr( device, "vkCreateCuModuleNVX" );
    vkCreateCuFunctionNVX                                    = cast( PFN_vkCreateCuFunctionNVX                                    ) vkGetDeviceProcAddr( device, "vkCreateCuFunctionNVX" );
    vkDestroyCuModuleNVX                                     = cast( PFN_vkDestroyCuModuleNVX                                     ) vkGetDeviceProcAddr( device, "vkDestroyCuModuleNVX" );
    vkDestroyCuFunctionNVX                                   = cast( PFN_vkDestroyCuFunctionNVX                                   ) vkGetDeviceProcAddr( device, "vkDestroyCuFunctionNVX" );
    vkCmdCuLaunchKernelNVX                                   = cast( PFN_vkCmdCuLaunchKernelNVX                                   ) vkGetDeviceProcAddr( device, "vkCmdCuLaunchKernelNVX" );

    // VK_NVX_image_view_handle
    vkGetImageViewHandleNVX                                  = cast( PFN_vkGetImageViewHandleNVX                                  ) vkGetDeviceProcAddr( device, "vkGetImageViewHandleNVX" );
    vkGetImageViewHandle64NVX                                = cast( PFN_vkGetImageViewHandle64NVX                                ) vkGetDeviceProcAddr( device, "vkGetImageViewHandle64NVX" );
    vkGetImageViewAddressNVX                                 = cast( PFN_vkGetImageViewAddressNVX                                 ) vkGetDeviceProcAddr( device, "vkGetImageViewAddressNVX" );
    vkGetDeviceCombinedImageSamplerIndexNVX                  = cast( PFN_vkGetDeviceCombinedImageSamplerIndexNVX                  ) vkGetDeviceProcAddr( device, "vkGetDeviceCombinedImageSamplerIndexNVX" );

    // VK_AMD_shader_info
    vkGetShaderInfoAMD                                       = cast( PFN_vkGetShaderInfoAMD                                       ) vkGetDeviceProcAddr( device, "vkGetShaderInfoAMD" );

    // VK_EXT_conditional_rendering
    vkCmdBeginConditionalRenderingEXT                        = cast( PFN_vkCmdBeginConditionalRenderingEXT                        ) vkGetDeviceProcAddr( device, "vkCmdBeginConditionalRenderingEXT" );
    vkCmdEndConditionalRenderingEXT                          = cast( PFN_vkCmdEndConditionalRenderingEXT                          ) vkGetDeviceProcAddr( device, "vkCmdEndConditionalRenderingEXT" );

    // VK_NV_clip_space_w_scaling
    vkCmdSetViewportWScalingNV                               = cast( PFN_vkCmdSetViewportWScalingNV                               ) vkGetDeviceProcAddr( device, "vkCmdSetViewportWScalingNV" );

    // VK_EXT_display_control
    vkDisplayPowerControlEXT                                 = cast( PFN_vkDisplayPowerControlEXT                                 ) vkGetDeviceProcAddr( device, "vkDisplayPowerControlEXT" );
    vkRegisterDeviceEventEXT                                 = cast( PFN_vkRegisterDeviceEventEXT                                 ) vkGetDeviceProcAddr( device, "vkRegisterDeviceEventEXT" );
    vkRegisterDisplayEventEXT                                = cast( PFN_vkRegisterDisplayEventEXT                                ) vkGetDeviceProcAddr( device, "vkRegisterDisplayEventEXT" );
    vkGetSwapchainCounterEXT                                 = cast( PFN_vkGetSwapchainCounterEXT                                 ) vkGetDeviceProcAddr( device, "vkGetSwapchainCounterEXT" );

    // VK_GOOGLE_display_timing
    vkGetRefreshCycleDurationGOOGLE                          = cast( PFN_vkGetRefreshCycleDurationGOOGLE                          ) vkGetDeviceProcAddr( device, "vkGetRefreshCycleDurationGOOGLE" );
    vkGetPastPresentationTimingGOOGLE                        = cast( PFN_vkGetPastPresentationTimingGOOGLE                        ) vkGetDeviceProcAddr( device, "vkGetPastPresentationTimingGOOGLE" );

    // VK_EXT_discard_rectangles
    vkCmdSetDiscardRectangleEXT                              = cast( PFN_vkCmdSetDiscardRectangleEXT                              ) vkGetDeviceProcAddr( device, "vkCmdSetDiscardRectangleEXT" );
    vkCmdSetDiscardRectangleEnableEXT                        = cast( PFN_vkCmdSetDiscardRectangleEnableEXT                        ) vkGetDeviceProcAddr( device, "vkCmdSetDiscardRectangleEnableEXT" );
    vkCmdSetDiscardRectangleModeEXT                          = cast( PFN_vkCmdSetDiscardRectangleModeEXT                          ) vkGetDeviceProcAddr( device, "vkCmdSetDiscardRectangleModeEXT" );

    // VK_EXT_hdr_metadata
    vkSetHdrMetadataEXT                                      = cast( PFN_vkSetHdrMetadataEXT                                      ) vkGetDeviceProcAddr( device, "vkSetHdrMetadataEXT" );

    // VK_EXT_debug_utils
    vkSetDebugUtilsObjectNameEXT                             = cast( PFN_vkSetDebugUtilsObjectNameEXT                             ) vkGetDeviceProcAddr( device, "vkSetDebugUtilsObjectNameEXT" );
    vkSetDebugUtilsObjectTagEXT                              = cast( PFN_vkSetDebugUtilsObjectTagEXT                              ) vkGetDeviceProcAddr( device, "vkSetDebugUtilsObjectTagEXT" );
    vkQueueBeginDebugUtilsLabelEXT                           = cast( PFN_vkQueueBeginDebugUtilsLabelEXT                           ) vkGetDeviceProcAddr( device, "vkQueueBeginDebugUtilsLabelEXT" );
    vkQueueEndDebugUtilsLabelEXT                             = cast( PFN_vkQueueEndDebugUtilsLabelEXT                             ) vkGetDeviceProcAddr( device, "vkQueueEndDebugUtilsLabelEXT" );
    vkQueueInsertDebugUtilsLabelEXT                          = cast( PFN_vkQueueInsertDebugUtilsLabelEXT                          ) vkGetDeviceProcAddr( device, "vkQueueInsertDebugUtilsLabelEXT" );
    vkCmdBeginDebugUtilsLabelEXT                             = cast( PFN_vkCmdBeginDebugUtilsLabelEXT                             ) vkGetDeviceProcAddr( device, "vkCmdBeginDebugUtilsLabelEXT" );
    vkCmdEndDebugUtilsLabelEXT                               = cast( PFN_vkCmdEndDebugUtilsLabelEXT                               ) vkGetDeviceProcAddr( device, "vkCmdEndDebugUtilsLabelEXT" );
    vkCmdInsertDebugUtilsLabelEXT                            = cast( PFN_vkCmdInsertDebugUtilsLabelEXT                            ) vkGetDeviceProcAddr( device, "vkCmdInsertDebugUtilsLabelEXT" );

    // VK_AMD_gpa_interface
    vkCreateGpaSessionAMD                                    = cast( PFN_vkCreateGpaSessionAMD                                    ) vkGetDeviceProcAddr( device, "vkCreateGpaSessionAMD" );
    vkDestroyGpaSessionAMD                                   = cast( PFN_vkDestroyGpaSessionAMD                                   ) vkGetDeviceProcAddr( device, "vkDestroyGpaSessionAMD" );
    vkSetGpaDeviceClockModeAMD                               = cast( PFN_vkSetGpaDeviceClockModeAMD                               ) vkGetDeviceProcAddr( device, "vkSetGpaDeviceClockModeAMD" );
    vkGetGpaDeviceClockInfoAMD                               = cast( PFN_vkGetGpaDeviceClockInfoAMD                               ) vkGetDeviceProcAddr( device, "vkGetGpaDeviceClockInfoAMD" );
    vkCmdBeginGpaSessionAMD                                  = cast( PFN_vkCmdBeginGpaSessionAMD                                  ) vkGetDeviceProcAddr( device, "vkCmdBeginGpaSessionAMD" );
    vkCmdEndGpaSessionAMD                                    = cast( PFN_vkCmdEndGpaSessionAMD                                    ) vkGetDeviceProcAddr( device, "vkCmdEndGpaSessionAMD" );
    vkCmdBeginGpaSampleAMD                                   = cast( PFN_vkCmdBeginGpaSampleAMD                                   ) vkGetDeviceProcAddr( device, "vkCmdBeginGpaSampleAMD" );
    vkCmdEndGpaSampleAMD                                     = cast( PFN_vkCmdEndGpaSampleAMD                                     ) vkGetDeviceProcAddr( device, "vkCmdEndGpaSampleAMD" );
    vkGetGpaSessionStatusAMD                                 = cast( PFN_vkGetGpaSessionStatusAMD                                 ) vkGetDeviceProcAddr( device, "vkGetGpaSessionStatusAMD" );
    vkGetGpaSessionResultsAMD                                = cast( PFN_vkGetGpaSessionResultsAMD                                ) vkGetDeviceProcAddr( device, "vkGetGpaSessionResultsAMD" );
    vkResetGpaSessionAMD                                     = cast( PFN_vkResetGpaSessionAMD                                     ) vkGetDeviceProcAddr( device, "vkResetGpaSessionAMD" );
    vkCmdCopyGpaSessionResultsAMD                            = cast( PFN_vkCmdCopyGpaSessionResultsAMD                            ) vkGetDeviceProcAddr( device, "vkCmdCopyGpaSessionResultsAMD" );

    // VK_EXT_descriptor_heap
    vkWriteSamplerDescriptorsEXT                             = cast( PFN_vkWriteSamplerDescriptorsEXT                             ) vkGetDeviceProcAddr( device, "vkWriteSamplerDescriptorsEXT" );
    vkWriteResourceDescriptorsEXT                            = cast( PFN_vkWriteResourceDescriptorsEXT                            ) vkGetDeviceProcAddr( device, "vkWriteResourceDescriptorsEXT" );
    vkCmdBindSamplerHeapEXT                                  = cast( PFN_vkCmdBindSamplerHeapEXT                                  ) vkGetDeviceProcAddr( device, "vkCmdBindSamplerHeapEXT" );
    vkCmdBindResourceHeapEXT                                 = cast( PFN_vkCmdBindResourceHeapEXT                                 ) vkGetDeviceProcAddr( device, "vkCmdBindResourceHeapEXT" );
    vkCmdPushDataEXT                                         = cast( PFN_vkCmdPushDataEXT                                         ) vkGetDeviceProcAddr( device, "vkCmdPushDataEXT" );
    vkGetImageOpaqueCaptureDataEXT                           = cast( PFN_vkGetImageOpaqueCaptureDataEXT                           ) vkGetDeviceProcAddr( device, "vkGetImageOpaqueCaptureDataEXT" );
    vkRegisterCustomBorderColorEXT                           = cast( PFN_vkRegisterCustomBorderColorEXT                           ) vkGetDeviceProcAddr( device, "vkRegisterCustomBorderColorEXT" );
    vkUnregisterCustomBorderColorEXT                         = cast( PFN_vkUnregisterCustomBorderColorEXT                         ) vkGetDeviceProcAddr( device, "vkUnregisterCustomBorderColorEXT" );
    vkGetTensorOpaqueCaptureDataARM                          = cast( PFN_vkGetTensorOpaqueCaptureDataARM                          ) vkGetDeviceProcAddr( device, "vkGetTensorOpaqueCaptureDataARM" );

    // VK_EXT_sample_locations
    vkCmdSetSampleLocationsEXT                               = cast( PFN_vkCmdSetSampleLocationsEXT                               ) vkGetDeviceProcAddr( device, "vkCmdSetSampleLocationsEXT" );

    // VK_EXT_image_drm_format_modifier
    vkGetImageDrmFormatModifierPropertiesEXT                 = cast( PFN_vkGetImageDrmFormatModifierPropertiesEXT                 ) vkGetDeviceProcAddr( device, "vkGetImageDrmFormatModifierPropertiesEXT" );

    // VK_EXT_validation_cache
    vkCreateValidationCacheEXT                               = cast( PFN_vkCreateValidationCacheEXT                               ) vkGetDeviceProcAddr( device, "vkCreateValidationCacheEXT" );
    vkDestroyValidationCacheEXT                              = cast( PFN_vkDestroyValidationCacheEXT                              ) vkGetDeviceProcAddr( device, "vkDestroyValidationCacheEXT" );
    vkMergeValidationCachesEXT                               = cast( PFN_vkMergeValidationCachesEXT                               ) vkGetDeviceProcAddr( device, "vkMergeValidationCachesEXT" );
    vkGetValidationCacheDataEXT                              = cast( PFN_vkGetValidationCacheDataEXT                              ) vkGetDeviceProcAddr( device, "vkGetValidationCacheDataEXT" );

    // VK_NV_shading_rate_image
    vkCmdBindShadingRateImageNV                              = cast( PFN_vkCmdBindShadingRateImageNV                              ) vkGetDeviceProcAddr( device, "vkCmdBindShadingRateImageNV" );
    vkCmdSetViewportShadingRatePaletteNV                     = cast( PFN_vkCmdSetViewportShadingRatePaletteNV                     ) vkGetDeviceProcAddr( device, "vkCmdSetViewportShadingRatePaletteNV" );
    vkCmdSetCoarseSampleOrderNV                              = cast( PFN_vkCmdSetCoarseSampleOrderNV                              ) vkGetDeviceProcAddr( device, "vkCmdSetCoarseSampleOrderNV" );

    // VK_NV_ray_tracing
    vkCreateAccelerationStructureNV                          = cast( PFN_vkCreateAccelerationStructureNV                          ) vkGetDeviceProcAddr( device, "vkCreateAccelerationStructureNV" );
    vkDestroyAccelerationStructureNV                         = cast( PFN_vkDestroyAccelerationStructureNV                         ) vkGetDeviceProcAddr( device, "vkDestroyAccelerationStructureNV" );
    vkGetAccelerationStructureMemoryRequirementsNV           = cast( PFN_vkGetAccelerationStructureMemoryRequirementsNV           ) vkGetDeviceProcAddr( device, "vkGetAccelerationStructureMemoryRequirementsNV" );
    vkBindAccelerationStructureMemoryNV                      = cast( PFN_vkBindAccelerationStructureMemoryNV                      ) vkGetDeviceProcAddr( device, "vkBindAccelerationStructureMemoryNV" );
    vkCmdBuildAccelerationStructureNV                        = cast( PFN_vkCmdBuildAccelerationStructureNV                        ) vkGetDeviceProcAddr( device, "vkCmdBuildAccelerationStructureNV" );
    vkCmdCopyAccelerationStructureNV                         = cast( PFN_vkCmdCopyAccelerationStructureNV                         ) vkGetDeviceProcAddr( device, "vkCmdCopyAccelerationStructureNV" );
    vkCmdTraceRaysNV                                         = cast( PFN_vkCmdTraceRaysNV                                         ) vkGetDeviceProcAddr( device, "vkCmdTraceRaysNV" );
    vkCreateRayTracingPipelinesNV                            = cast( PFN_vkCreateRayTracingPipelinesNV                            ) vkGetDeviceProcAddr( device, "vkCreateRayTracingPipelinesNV" );
    vkGetRayTracingShaderGroupHandlesKHR                     = cast( PFN_vkGetRayTracingShaderGroupHandlesKHR                     ) vkGetDeviceProcAddr( device, "vkGetRayTracingShaderGroupHandlesKHR" );
    vkGetAccelerationStructureHandleNV                       = cast( PFN_vkGetAccelerationStructureHandleNV                       ) vkGetDeviceProcAddr( device, "vkGetAccelerationStructureHandleNV" );
    vkCmdWriteAccelerationStructuresPropertiesNV             = cast( PFN_vkCmdWriteAccelerationStructuresPropertiesNV             ) vkGetDeviceProcAddr( device, "vkCmdWriteAccelerationStructuresPropertiesNV" );
    vkCompileDeferredNV                                      = cast( PFN_vkCompileDeferredNV                                      ) vkGetDeviceProcAddr( device, "vkCompileDeferredNV" );

    // VK_EXT_external_memory_host
    vkGetMemoryHostPointerPropertiesEXT                      = cast( PFN_vkGetMemoryHostPointerPropertiesEXT                      ) vkGetDeviceProcAddr( device, "vkGetMemoryHostPointerPropertiesEXT" );

    // VK_AMD_buffer_marker
    vkCmdWriteBufferMarkerAMD                                = cast( PFN_vkCmdWriteBufferMarkerAMD                                ) vkGetDeviceProcAddr( device, "vkCmdWriteBufferMarkerAMD" );
    vkCmdWriteBufferMarker2AMD                               = cast( PFN_vkCmdWriteBufferMarker2AMD                               ) vkGetDeviceProcAddr( device, "vkCmdWriteBufferMarker2AMD" );

    // VK_NV_mesh_shader
    vkCmdDrawMeshTasksNV                                     = cast( PFN_vkCmdDrawMeshTasksNV                                     ) vkGetDeviceProcAddr( device, "vkCmdDrawMeshTasksNV" );
    vkCmdDrawMeshTasksIndirectNV                             = cast( PFN_vkCmdDrawMeshTasksIndirectNV                             ) vkGetDeviceProcAddr( device, "vkCmdDrawMeshTasksIndirectNV" );
    vkCmdDrawMeshTasksIndirectCountNV                        = cast( PFN_vkCmdDrawMeshTasksIndirectCountNV                        ) vkGetDeviceProcAddr( device, "vkCmdDrawMeshTasksIndirectCountNV" );

    // VK_NV_scissor_exclusive
    vkCmdSetExclusiveScissorEnableNV                         = cast( PFN_vkCmdSetExclusiveScissorEnableNV                         ) vkGetDeviceProcAddr( device, "vkCmdSetExclusiveScissorEnableNV" );
    vkCmdSetExclusiveScissorNV                               = cast( PFN_vkCmdSetExclusiveScissorNV                               ) vkGetDeviceProcAddr( device, "vkCmdSetExclusiveScissorNV" );

    // VK_NV_device_diagnostic_checkpoints
    vkCmdSetCheckpointNV                                     = cast( PFN_vkCmdSetCheckpointNV                                     ) vkGetDeviceProcAddr( device, "vkCmdSetCheckpointNV" );
    vkGetQueueCheckpointDataNV                               = cast( PFN_vkGetQueueCheckpointDataNV                               ) vkGetDeviceProcAddr( device, "vkGetQueueCheckpointDataNV" );
    vkGetQueueCheckpointData2NV                              = cast( PFN_vkGetQueueCheckpointData2NV                              ) vkGetDeviceProcAddr( device, "vkGetQueueCheckpointData2NV" );

    // VK_EXT_present_timing
    vkSetSwapchainPresentTimingQueueSizeEXT                  = cast( PFN_vkSetSwapchainPresentTimingQueueSizeEXT                  ) vkGetDeviceProcAddr( device, "vkSetSwapchainPresentTimingQueueSizeEXT" );
    vkGetSwapchainTimingPropertiesEXT                        = cast( PFN_vkGetSwapchainTimingPropertiesEXT                        ) vkGetDeviceProcAddr( device, "vkGetSwapchainTimingPropertiesEXT" );
    vkGetSwapchainTimeDomainPropertiesEXT                    = cast( PFN_vkGetSwapchainTimeDomainPropertiesEXT                    ) vkGetDeviceProcAddr( device, "vkGetSwapchainTimeDomainPropertiesEXT" );
    vkGetPastPresentationTimingEXT                           = cast( PFN_vkGetPastPresentationTimingEXT                           ) vkGetDeviceProcAddr( device, "vkGetPastPresentationTimingEXT" );

    // VK_INTEL_performance_query
    vkInitializePerformanceApiINTEL                          = cast( PFN_vkInitializePerformanceApiINTEL                          ) vkGetDeviceProcAddr( device, "vkInitializePerformanceApiINTEL" );
    vkUninitializePerformanceApiINTEL                        = cast( PFN_vkUninitializePerformanceApiINTEL                        ) vkGetDeviceProcAddr( device, "vkUninitializePerformanceApiINTEL" );
    vkCmdSetPerformanceMarkerINTEL                           = cast( PFN_vkCmdSetPerformanceMarkerINTEL                           ) vkGetDeviceProcAddr( device, "vkCmdSetPerformanceMarkerINTEL" );
    vkCmdSetPerformanceStreamMarkerINTEL                     = cast( PFN_vkCmdSetPerformanceStreamMarkerINTEL                     ) vkGetDeviceProcAddr( device, "vkCmdSetPerformanceStreamMarkerINTEL" );
    vkCmdSetPerformanceOverrideINTEL                         = cast( PFN_vkCmdSetPerformanceOverrideINTEL                         ) vkGetDeviceProcAddr( device, "vkCmdSetPerformanceOverrideINTEL" );
    vkAcquirePerformanceConfigurationINTEL                   = cast( PFN_vkAcquirePerformanceConfigurationINTEL                   ) vkGetDeviceProcAddr( device, "vkAcquirePerformanceConfigurationINTEL" );
    vkReleasePerformanceConfigurationINTEL                   = cast( PFN_vkReleasePerformanceConfigurationINTEL                   ) vkGetDeviceProcAddr( device, "vkReleasePerformanceConfigurationINTEL" );
    vkQueueSetPerformanceConfigurationINTEL                  = cast( PFN_vkQueueSetPerformanceConfigurationINTEL                  ) vkGetDeviceProcAddr( device, "vkQueueSetPerformanceConfigurationINTEL" );
    vkGetPerformanceParameterINTEL                           = cast( PFN_vkGetPerformanceParameterINTEL                           ) vkGetDeviceProcAddr( device, "vkGetPerformanceParameterINTEL" );

    // VK_AMD_display_native_hdr
    vkSetLocalDimmingAMD                                     = cast( PFN_vkSetLocalDimmingAMD                                     ) vkGetDeviceProcAddr( device, "vkSetLocalDimmingAMD" );

    // VK_NV_device_generated_commands
    vkGetGeneratedCommandsMemoryRequirementsNV               = cast( PFN_vkGetGeneratedCommandsMemoryRequirementsNV               ) vkGetDeviceProcAddr( device, "vkGetGeneratedCommandsMemoryRequirementsNV" );
    vkCmdPreprocessGeneratedCommandsNV                       = cast( PFN_vkCmdPreprocessGeneratedCommandsNV                       ) vkGetDeviceProcAddr( device, "vkCmdPreprocessGeneratedCommandsNV" );
    vkCmdExecuteGeneratedCommandsNV                          = cast( PFN_vkCmdExecuteGeneratedCommandsNV                          ) vkGetDeviceProcAddr( device, "vkCmdExecuteGeneratedCommandsNV" );
    vkCmdBindPipelineShaderGroupNV                           = cast( PFN_vkCmdBindPipelineShaderGroupNV                           ) vkGetDeviceProcAddr( device, "vkCmdBindPipelineShaderGroupNV" );
    vkCreateIndirectCommandsLayoutNV                         = cast( PFN_vkCreateIndirectCommandsLayoutNV                         ) vkGetDeviceProcAddr( device, "vkCreateIndirectCommandsLayoutNV" );
    vkDestroyIndirectCommandsLayoutNV                        = cast( PFN_vkDestroyIndirectCommandsLayoutNV                        ) vkGetDeviceProcAddr( device, "vkDestroyIndirectCommandsLayoutNV" );

    // VK_EXT_depth_bias_control
    vkCmdSetDepthBias2EXT                                    = cast( PFN_vkCmdSetDepthBias2EXT                                    ) vkGetDeviceProcAddr( device, "vkCmdSetDepthBias2EXT" );

    // VK_QCOM_queue_perf_hint
    vkQueueSetPerfHintQCOM                                   = cast( PFN_vkQueueSetPerfHintQCOM                                   ) vkGetDeviceProcAddr( device, "vkQueueSetPerfHintQCOM" );

    // VK_QCOM_tile_shading
    vkCmdDispatchTileQCOM                                    = cast( PFN_vkCmdDispatchTileQCOM                                    ) vkGetDeviceProcAddr( device, "vkCmdDispatchTileQCOM" );
    vkCmdBeginPerTileExecutionQCOM                           = cast( PFN_vkCmdBeginPerTileExecutionQCOM                           ) vkGetDeviceProcAddr( device, "vkCmdBeginPerTileExecutionQCOM" );
    vkCmdEndPerTileExecutionQCOM                             = cast( PFN_vkCmdEndPerTileExecutionQCOM                             ) vkGetDeviceProcAddr( device, "vkCmdEndPerTileExecutionQCOM" );

    // VK_NV_low_latency
    vkSetLatencySleepModeLegacyNV                            = cast( PFN_vkSetLatencySleepModeLegacyNV                            ) vkGetDeviceProcAddr( device, "vkSetLatencySleepModeLegacyNV" );
    vkLatencySleepLegacyNV                                   = cast( PFN_vkLatencySleepLegacyNV                                   ) vkGetDeviceProcAddr( device, "vkLatencySleepLegacyNV" );
    vkSetLatencyMarkerLegacyNV                               = cast( PFN_vkSetLatencyMarkerLegacyNV                               ) vkGetDeviceProcAddr( device, "vkSetLatencyMarkerLegacyNV" );
    vkGetLatencyTimingsLegacyNV                              = cast( PFN_vkGetLatencyTimingsLegacyNV                              ) vkGetDeviceProcAddr( device, "vkGetLatencyTimingsLegacyNV" );
    vkQueueNotifyOutOfBandLegacyNV                           = cast( PFN_vkQueueNotifyOutOfBandLegacyNV                           ) vkGetDeviceProcAddr( device, "vkQueueNotifyOutOfBandLegacyNV" );
    vkGetSleepStatusLegacyNV                                 = cast( PFN_vkGetSleepStatusLegacyNV                                 ) vkGetDeviceProcAddr( device, "vkGetSleepStatusLegacyNV" );
    vkShutdownLatencyDeviceLegacyNV                          = cast( PFN_vkShutdownLatencyDeviceLegacyNV                          ) vkGetDeviceProcAddr( device, "vkShutdownLatencyDeviceLegacyNV" );

    // VK_EXT_descriptor_buffer
    vkGetDescriptorSetLayoutSizeEXT                          = cast( PFN_vkGetDescriptorSetLayoutSizeEXT                          ) vkGetDeviceProcAddr( device, "vkGetDescriptorSetLayoutSizeEXT" );
    vkGetDescriptorSetLayoutBindingOffsetEXT                 = cast( PFN_vkGetDescriptorSetLayoutBindingOffsetEXT                 ) vkGetDeviceProcAddr( device, "vkGetDescriptorSetLayoutBindingOffsetEXT" );
    vkGetDescriptorEXT                                       = cast( PFN_vkGetDescriptorEXT                                       ) vkGetDeviceProcAddr( device, "vkGetDescriptorEXT" );
    vkCmdBindDescriptorBuffersEXT                            = cast( PFN_vkCmdBindDescriptorBuffersEXT                            ) vkGetDeviceProcAddr( device, "vkCmdBindDescriptorBuffersEXT" );
    vkCmdSetDescriptorBufferOffsetsEXT                       = cast( PFN_vkCmdSetDescriptorBufferOffsetsEXT                       ) vkGetDeviceProcAddr( device, "vkCmdSetDescriptorBufferOffsetsEXT" );
    vkCmdBindDescriptorBufferEmbeddedSamplersEXT             = cast( PFN_vkCmdBindDescriptorBufferEmbeddedSamplersEXT             ) vkGetDeviceProcAddr( device, "vkCmdBindDescriptorBufferEmbeddedSamplersEXT" );
    vkGetBufferOpaqueCaptureDescriptorDataEXT                = cast( PFN_vkGetBufferOpaqueCaptureDescriptorDataEXT                ) vkGetDeviceProcAddr( device, "vkGetBufferOpaqueCaptureDescriptorDataEXT" );
    vkGetImageOpaqueCaptureDescriptorDataEXT                 = cast( PFN_vkGetImageOpaqueCaptureDescriptorDataEXT                 ) vkGetDeviceProcAddr( device, "vkGetImageOpaqueCaptureDescriptorDataEXT" );
    vkGetImageViewOpaqueCaptureDescriptorDataEXT             = cast( PFN_vkGetImageViewOpaqueCaptureDescriptorDataEXT             ) vkGetDeviceProcAddr( device, "vkGetImageViewOpaqueCaptureDescriptorDataEXT" );
    vkGetSamplerOpaqueCaptureDescriptorDataEXT               = cast( PFN_vkGetSamplerOpaqueCaptureDescriptorDataEXT               ) vkGetDeviceProcAddr( device, "vkGetSamplerOpaqueCaptureDescriptorDataEXT" );
    vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT = cast( PFN_vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT ) vkGetDeviceProcAddr( device, "vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT" );

    // VK_NV_fragment_shading_rate_enums
    vkCmdSetFragmentShadingRateEnumNV                        = cast( PFN_vkCmdSetFragmentShadingRateEnumNV                        ) vkGetDeviceProcAddr( device, "vkCmdSetFragmentShadingRateEnumNV" );

    // VK_EXT_device_fault
    vkGetDeviceFaultInfoEXT                                  = cast( PFN_vkGetDeviceFaultInfoEXT                                  ) vkGetDeviceProcAddr( device, "vkGetDeviceFaultInfoEXT" );

    // VK_EXT_vertex_input_dynamic_state
    vkCmdSetVertexInputEXT                                   = cast( PFN_vkCmdSetVertexInputEXT                                   ) vkGetDeviceProcAddr( device, "vkCmdSetVertexInputEXT" );

    // VK_HUAWEI_subpass_shading
    vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI          = cast( PFN_vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI          ) vkGetDeviceProcAddr( device, "vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI" );
    vkCmdSubpassShadingHUAWEI                                = cast( PFN_vkCmdSubpassShadingHUAWEI                                ) vkGetDeviceProcAddr( device, "vkCmdSubpassShadingHUAWEI" );

    // VK_HUAWEI_invocation_mask
    vkCmdBindInvocationMaskHUAWEI                            = cast( PFN_vkCmdBindInvocationMaskHUAWEI                            ) vkGetDeviceProcAddr( device, "vkCmdBindInvocationMaskHUAWEI" );

    // VK_NV_external_memory_rdma
    vkGetMemoryRemoteAddressNV                               = cast( PFN_vkGetMemoryRemoteAddressNV                               ) vkGetDeviceProcAddr( device, "vkGetMemoryRemoteAddressNV" );

    // VK_EXT_pipeline_properties
    vkGetPipelinePropertiesEXT                               = cast( PFN_vkGetPipelinePropertiesEXT                               ) vkGetDeviceProcAddr( device, "vkGetPipelinePropertiesEXT" );

    // VK_EXT_extended_dynamic_state2
    vkCmdSetPatchControlPointsEXT                            = cast( PFN_vkCmdSetPatchControlPointsEXT                            ) vkGetDeviceProcAddr( device, "vkCmdSetPatchControlPointsEXT" );
    vkCmdSetLogicOpEXT                                       = cast( PFN_vkCmdSetLogicOpEXT                                       ) vkGetDeviceProcAddr( device, "vkCmdSetLogicOpEXT" );

    // VK_EXT_color_write_enable
    vkCmdSetColorWriteEnableEXT                              = cast( PFN_vkCmdSetColorWriteEnableEXT                              ) vkGetDeviceProcAddr( device, "vkCmdSetColorWriteEnableEXT" );

    // VK_EXT_multi_draw
    vkCmdDrawMultiEXT                                        = cast( PFN_vkCmdDrawMultiEXT                                        ) vkGetDeviceProcAddr( device, "vkCmdDrawMultiEXT" );
    vkCmdDrawMultiIndexedEXT                                 = cast( PFN_vkCmdDrawMultiIndexedEXT                                 ) vkGetDeviceProcAddr( device, "vkCmdDrawMultiIndexedEXT" );

    // VK_EXT_opacity_micromap
    vkCreateMicromapEXT                                      = cast( PFN_vkCreateMicromapEXT                                      ) vkGetDeviceProcAddr( device, "vkCreateMicromapEXT" );
    vkDestroyMicromapEXT                                     = cast( PFN_vkDestroyMicromapEXT                                     ) vkGetDeviceProcAddr( device, "vkDestroyMicromapEXT" );
    vkCmdBuildMicromapsEXT                                   = cast( PFN_vkCmdBuildMicromapsEXT                                   ) vkGetDeviceProcAddr( device, "vkCmdBuildMicromapsEXT" );
    vkBuildMicromapsEXT                                      = cast( PFN_vkBuildMicromapsEXT                                      ) vkGetDeviceProcAddr( device, "vkBuildMicromapsEXT" );
    vkCopyMicromapEXT                                        = cast( PFN_vkCopyMicromapEXT                                        ) vkGetDeviceProcAddr( device, "vkCopyMicromapEXT" );
    vkCopyMicromapToMemoryEXT                                = cast( PFN_vkCopyMicromapToMemoryEXT                                ) vkGetDeviceProcAddr( device, "vkCopyMicromapToMemoryEXT" );
    vkCopyMemoryToMicromapEXT                                = cast( PFN_vkCopyMemoryToMicromapEXT                                ) vkGetDeviceProcAddr( device, "vkCopyMemoryToMicromapEXT" );
    vkWriteMicromapsPropertiesEXT                            = cast( PFN_vkWriteMicromapsPropertiesEXT                            ) vkGetDeviceProcAddr( device, "vkWriteMicromapsPropertiesEXT" );
    vkCmdCopyMicromapEXT                                     = cast( PFN_vkCmdCopyMicromapEXT                                     ) vkGetDeviceProcAddr( device, "vkCmdCopyMicromapEXT" );
    vkCmdCopyMicromapToMemoryEXT                             = cast( PFN_vkCmdCopyMicromapToMemoryEXT                             ) vkGetDeviceProcAddr( device, "vkCmdCopyMicromapToMemoryEXT" );
    vkCmdCopyMemoryToMicromapEXT                             = cast( PFN_vkCmdCopyMemoryToMicromapEXT                             ) vkGetDeviceProcAddr( device, "vkCmdCopyMemoryToMicromapEXT" );
    vkCmdWriteMicromapsPropertiesEXT                         = cast( PFN_vkCmdWriteMicromapsPropertiesEXT                         ) vkGetDeviceProcAddr( device, "vkCmdWriteMicromapsPropertiesEXT" );
    vkGetDeviceMicromapCompatibilityEXT                      = cast( PFN_vkGetDeviceMicromapCompatibilityEXT                      ) vkGetDeviceProcAddr( device, "vkGetDeviceMicromapCompatibilityEXT" );
    vkGetMicromapBuildSizesEXT                               = cast( PFN_vkGetMicromapBuildSizesEXT                               ) vkGetDeviceProcAddr( device, "vkGetMicromapBuildSizesEXT" );

    // VK_HUAWEI_cluster_culling_shader
    vkCmdDrawClusterHUAWEI                                   = cast( PFN_vkCmdDrawClusterHUAWEI                                   ) vkGetDeviceProcAddr( device, "vkCmdDrawClusterHUAWEI" );
    vkCmdDrawClusterIndirectHUAWEI                           = cast( PFN_vkCmdDrawClusterIndirectHUAWEI                           ) vkGetDeviceProcAddr( device, "vkCmdDrawClusterIndirectHUAWEI" );

    // VK_EXT_pageable_device_local_memory
    vkSetDeviceMemoryPriorityEXT                             = cast( PFN_vkSetDeviceMemoryPriorityEXT                             ) vkGetDeviceProcAddr( device, "vkSetDeviceMemoryPriorityEXT" );

    // VK_ARM_scheduling_controls
    vkCmdSetDispatchParametersARM                            = cast( PFN_vkCmdSetDispatchParametersARM                            ) vkGetDeviceProcAddr( device, "vkCmdSetDispatchParametersARM" );

    // VK_VALVE_descriptor_set_host_mapping
    vkGetDescriptorSetLayoutHostMappingInfoVALVE             = cast( PFN_vkGetDescriptorSetLayoutHostMappingInfoVALVE             ) vkGetDeviceProcAddr( device, "vkGetDescriptorSetLayoutHostMappingInfoVALVE" );
    vkGetDescriptorSetHostMappingVALVE                       = cast( PFN_vkGetDescriptorSetHostMappingVALVE                       ) vkGetDeviceProcAddr( device, "vkGetDescriptorSetHostMappingVALVE" );

    // VK_NV_copy_memory_indirect
    vkCmdCopyMemoryIndirectNV                                = cast( PFN_vkCmdCopyMemoryIndirectNV                                ) vkGetDeviceProcAddr( device, "vkCmdCopyMemoryIndirectNV" );
    vkCmdCopyMemoryToImageIndirectNV                         = cast( PFN_vkCmdCopyMemoryToImageIndirectNV                         ) vkGetDeviceProcAddr( device, "vkCmdCopyMemoryToImageIndirectNV" );

    // VK_NV_memory_decompression
    vkCmdDecompressMemoryNV                                  = cast( PFN_vkCmdDecompressMemoryNV                                  ) vkGetDeviceProcAddr( device, "vkCmdDecompressMemoryNV" );
    vkCmdDecompressMemoryIndirectCountNV                     = cast( PFN_vkCmdDecompressMemoryIndirectCountNV                     ) vkGetDeviceProcAddr( device, "vkCmdDecompressMemoryIndirectCountNV" );

    // VK_NV_device_generated_commands_compute
    vkGetPipelineIndirectMemoryRequirementsNV                = cast( PFN_vkGetPipelineIndirectMemoryRequirementsNV                ) vkGetDeviceProcAddr( device, "vkGetPipelineIndirectMemoryRequirementsNV" );
    vkCmdUpdatePipelineIndirectBufferNV                      = cast( PFN_vkCmdUpdatePipelineIndirectBufferNV                      ) vkGetDeviceProcAddr( device, "vkCmdUpdatePipelineIndirectBufferNV" );
    vkGetPipelineIndirectDeviceAddressNV                     = cast( PFN_vkGetPipelineIndirectDeviceAddressNV                     ) vkGetDeviceProcAddr( device, "vkGetPipelineIndirectDeviceAddressNV" );

    // VK_EXT_extended_dynamic_state3
    vkCmdSetDepthClampEnableEXT                              = cast( PFN_vkCmdSetDepthClampEnableEXT                              ) vkGetDeviceProcAddr( device, "vkCmdSetDepthClampEnableEXT" );
    vkCmdSetPolygonModeEXT                                   = cast( PFN_vkCmdSetPolygonModeEXT                                   ) vkGetDeviceProcAddr( device, "vkCmdSetPolygonModeEXT" );
    vkCmdSetRasterizationSamplesEXT                          = cast( PFN_vkCmdSetRasterizationSamplesEXT                          ) vkGetDeviceProcAddr( device, "vkCmdSetRasterizationSamplesEXT" );
    vkCmdSetSampleMaskEXT                                    = cast( PFN_vkCmdSetSampleMaskEXT                                    ) vkGetDeviceProcAddr( device, "vkCmdSetSampleMaskEXT" );
    vkCmdSetAlphaToCoverageEnableEXT                         = cast( PFN_vkCmdSetAlphaToCoverageEnableEXT                         ) vkGetDeviceProcAddr( device, "vkCmdSetAlphaToCoverageEnableEXT" );
    vkCmdSetAlphaToOneEnableEXT                              = cast( PFN_vkCmdSetAlphaToOneEnableEXT                              ) vkGetDeviceProcAddr( device, "vkCmdSetAlphaToOneEnableEXT" );
    vkCmdSetLogicOpEnableEXT                                 = cast( PFN_vkCmdSetLogicOpEnableEXT                                 ) vkGetDeviceProcAddr( device, "vkCmdSetLogicOpEnableEXT" );
    vkCmdSetColorBlendEnableEXT                              = cast( PFN_vkCmdSetColorBlendEnableEXT                              ) vkGetDeviceProcAddr( device, "vkCmdSetColorBlendEnableEXT" );
    vkCmdSetColorBlendEquationEXT                            = cast( PFN_vkCmdSetColorBlendEquationEXT                            ) vkGetDeviceProcAddr( device, "vkCmdSetColorBlendEquationEXT" );
    vkCmdSetColorWriteMaskEXT                                = cast( PFN_vkCmdSetColorWriteMaskEXT                                ) vkGetDeviceProcAddr( device, "vkCmdSetColorWriteMaskEXT" );
    vkCmdSetTessellationDomainOriginEXT                      = cast( PFN_vkCmdSetTessellationDomainOriginEXT                      ) vkGetDeviceProcAddr( device, "vkCmdSetTessellationDomainOriginEXT" );
    vkCmdSetRasterizationStreamEXT                           = cast( PFN_vkCmdSetRasterizationStreamEXT                           ) vkGetDeviceProcAddr( device, "vkCmdSetRasterizationStreamEXT" );
    vkCmdSetConservativeRasterizationModeEXT                 = cast( PFN_vkCmdSetConservativeRasterizationModeEXT                 ) vkGetDeviceProcAddr( device, "vkCmdSetConservativeRasterizationModeEXT" );
    vkCmdSetExtraPrimitiveOverestimationSizeEXT              = cast( PFN_vkCmdSetExtraPrimitiveOverestimationSizeEXT              ) vkGetDeviceProcAddr( device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT" );
    vkCmdSetDepthClipEnableEXT                               = cast( PFN_vkCmdSetDepthClipEnableEXT                               ) vkGetDeviceProcAddr( device, "vkCmdSetDepthClipEnableEXT" );
    vkCmdSetSampleLocationsEnableEXT                         = cast( PFN_vkCmdSetSampleLocationsEnableEXT                         ) vkGetDeviceProcAddr( device, "vkCmdSetSampleLocationsEnableEXT" );
    vkCmdSetColorBlendAdvancedEXT                            = cast( PFN_vkCmdSetColorBlendAdvancedEXT                            ) vkGetDeviceProcAddr( device, "vkCmdSetColorBlendAdvancedEXT" );
    vkCmdSetProvokingVertexModeEXT                           = cast( PFN_vkCmdSetProvokingVertexModeEXT                           ) vkGetDeviceProcAddr( device, "vkCmdSetProvokingVertexModeEXT" );
    vkCmdSetLineRasterizationModeEXT                         = cast( PFN_vkCmdSetLineRasterizationModeEXT                         ) vkGetDeviceProcAddr( device, "vkCmdSetLineRasterizationModeEXT" );
    vkCmdSetLineStippleEnableEXT                             = cast( PFN_vkCmdSetLineStippleEnableEXT                             ) vkGetDeviceProcAddr( device, "vkCmdSetLineStippleEnableEXT" );
    vkCmdSetDepthClipNegativeOneToOneEXT                     = cast( PFN_vkCmdSetDepthClipNegativeOneToOneEXT                     ) vkGetDeviceProcAddr( device, "vkCmdSetDepthClipNegativeOneToOneEXT" );
    vkCmdSetViewportWScalingEnableNV                         = cast( PFN_vkCmdSetViewportWScalingEnableNV                         ) vkGetDeviceProcAddr( device, "vkCmdSetViewportWScalingEnableNV" );
    vkCmdSetViewportSwizzleNV                                = cast( PFN_vkCmdSetViewportSwizzleNV                                ) vkGetDeviceProcAddr( device, "vkCmdSetViewportSwizzleNV" );
    vkCmdSetCoverageToColorEnableNV                          = cast( PFN_vkCmdSetCoverageToColorEnableNV                          ) vkGetDeviceProcAddr( device, "vkCmdSetCoverageToColorEnableNV" );
    vkCmdSetCoverageToColorLocationNV                        = cast( PFN_vkCmdSetCoverageToColorLocationNV                        ) vkGetDeviceProcAddr( device, "vkCmdSetCoverageToColorLocationNV" );
    vkCmdSetCoverageModulationModeNV                         = cast( PFN_vkCmdSetCoverageModulationModeNV                         ) vkGetDeviceProcAddr( device, "vkCmdSetCoverageModulationModeNV" );
    vkCmdSetCoverageModulationTableEnableNV                  = cast( PFN_vkCmdSetCoverageModulationTableEnableNV                  ) vkGetDeviceProcAddr( device, "vkCmdSetCoverageModulationTableEnableNV" );
    vkCmdSetCoverageModulationTableNV                        = cast( PFN_vkCmdSetCoverageModulationTableNV                        ) vkGetDeviceProcAddr( device, "vkCmdSetCoverageModulationTableNV" );
    vkCmdSetShadingRateImageEnableNV                         = cast( PFN_vkCmdSetShadingRateImageEnableNV                         ) vkGetDeviceProcAddr( device, "vkCmdSetShadingRateImageEnableNV" );
    vkCmdSetRepresentativeFragmentTestEnableNV               = cast( PFN_vkCmdSetRepresentativeFragmentTestEnableNV               ) vkGetDeviceProcAddr( device, "vkCmdSetRepresentativeFragmentTestEnableNV" );
    vkCmdSetCoverageReductionModeNV                          = cast( PFN_vkCmdSetCoverageReductionModeNV                          ) vkGetDeviceProcAddr( device, "vkCmdSetCoverageReductionModeNV" );

    // VK_ARM_tensors
    vkCreateTensorARM                                        = cast( PFN_vkCreateTensorARM                                        ) vkGetDeviceProcAddr( device, "vkCreateTensorARM" );
    vkDestroyTensorARM                                       = cast( PFN_vkDestroyTensorARM                                       ) vkGetDeviceProcAddr( device, "vkDestroyTensorARM" );
    vkCreateTensorViewARM                                    = cast( PFN_vkCreateTensorViewARM                                    ) vkGetDeviceProcAddr( device, "vkCreateTensorViewARM" );
    vkDestroyTensorViewARM                                   = cast( PFN_vkDestroyTensorViewARM                                   ) vkGetDeviceProcAddr( device, "vkDestroyTensorViewARM" );
    vkGetTensorMemoryRequirementsARM                         = cast( PFN_vkGetTensorMemoryRequirementsARM                         ) vkGetDeviceProcAddr( device, "vkGetTensorMemoryRequirementsARM" );
    vkBindTensorMemoryARM                                    = cast( PFN_vkBindTensorMemoryARM                                    ) vkGetDeviceProcAddr( device, "vkBindTensorMemoryARM" );
    vkGetDeviceTensorMemoryRequirementsARM                   = cast( PFN_vkGetDeviceTensorMemoryRequirementsARM                   ) vkGetDeviceProcAddr( device, "vkGetDeviceTensorMemoryRequirementsARM" );
    vkCmdCopyTensorARM                                       = cast( PFN_vkCmdCopyTensorARM                                       ) vkGetDeviceProcAddr( device, "vkCmdCopyTensorARM" );
    vkGetTensorOpaqueCaptureDescriptorDataARM                = cast( PFN_vkGetTensorOpaqueCaptureDescriptorDataARM                ) vkGetDeviceProcAddr( device, "vkGetTensorOpaqueCaptureDescriptorDataARM" );
    vkGetTensorViewOpaqueCaptureDescriptorDataARM            = cast( PFN_vkGetTensorViewOpaqueCaptureDescriptorDataARM            ) vkGetDeviceProcAddr( device, "vkGetTensorViewOpaqueCaptureDescriptorDataARM" );

    // VK_EXT_shader_module_identifier
    vkGetShaderModuleIdentifierEXT                           = cast( PFN_vkGetShaderModuleIdentifierEXT                           ) vkGetDeviceProcAddr( device, "vkGetShaderModuleIdentifierEXT" );
    vkGetShaderModuleCreateInfoIdentifierEXT                 = cast( PFN_vkGetShaderModuleCreateInfoIdentifierEXT                 ) vkGetDeviceProcAddr( device, "vkGetShaderModuleCreateInfoIdentifierEXT" );

    // VK_NV_optical_flow
    vkCreateOpticalFlowSessionNV                             = cast( PFN_vkCreateOpticalFlowSessionNV                             ) vkGetDeviceProcAddr( device, "vkCreateOpticalFlowSessionNV" );
    vkDestroyOpticalFlowSessionNV                            = cast( PFN_vkDestroyOpticalFlowSessionNV                            ) vkGetDeviceProcAddr( device, "vkDestroyOpticalFlowSessionNV" );
    vkBindOpticalFlowSessionImageNV                          = cast( PFN_vkBindOpticalFlowSessionImageNV                          ) vkGetDeviceProcAddr( device, "vkBindOpticalFlowSessionImageNV" );
    vkCmdOpticalFlowExecuteNV                                = cast( PFN_vkCmdOpticalFlowExecuteNV                                ) vkGetDeviceProcAddr( device, "vkCmdOpticalFlowExecuteNV" );

    // VK_AMD_anti_lag
    vkAntiLagUpdateAMD                                       = cast( PFN_vkAntiLagUpdateAMD                                       ) vkGetDeviceProcAddr( device, "vkAntiLagUpdateAMD" );

    // VK_EXT_shader_object
    vkCreateShadersEXT                                       = cast( PFN_vkCreateShadersEXT                                       ) vkGetDeviceProcAddr( device, "vkCreateShadersEXT" );
    vkDestroyShaderEXT                                       = cast( PFN_vkDestroyShaderEXT                                       ) vkGetDeviceProcAddr( device, "vkDestroyShaderEXT" );
    vkGetShaderBinaryDataEXT                                 = cast( PFN_vkGetShaderBinaryDataEXT                                 ) vkGetDeviceProcAddr( device, "vkGetShaderBinaryDataEXT" );
    vkCmdBindShadersEXT                                      = cast( PFN_vkCmdBindShadersEXT                                      ) vkGetDeviceProcAddr( device, "vkCmdBindShadersEXT" );
    vkCmdSetDepthClampRangeEXT                               = cast( PFN_vkCmdSetDepthClampRangeEXT                               ) vkGetDeviceProcAddr( device, "vkCmdSetDepthClampRangeEXT" );

    // VK_QCOM_tile_properties
    vkGetFramebufferTilePropertiesQCOM                       = cast( PFN_vkGetFramebufferTilePropertiesQCOM                       ) vkGetDeviceProcAddr( device, "vkGetFramebufferTilePropertiesQCOM" );
    vkGetDynamicRenderingTilePropertiesQCOM                  = cast( PFN_vkGetDynamicRenderingTilePropertiesQCOM                  ) vkGetDeviceProcAddr( device, "vkGetDynamicRenderingTilePropertiesQCOM" );

    // VK_NV_cooperative_vector
    vkConvertCooperativeVectorMatrixNV                       = cast( PFN_vkConvertCooperativeVectorMatrixNV                       ) vkGetDeviceProcAddr( device, "vkConvertCooperativeVectorMatrixNV" );
    vkCmdConvertCooperativeVectorMatrixNV                    = cast( PFN_vkCmdConvertCooperativeVectorMatrixNV                    ) vkGetDeviceProcAddr( device, "vkCmdConvertCooperativeVectorMatrixNV" );

    // VK_NV_low_latency2
    vkSetLatencySleepModeNV                                  = cast( PFN_vkSetLatencySleepModeNV                                  ) vkGetDeviceProcAddr( device, "vkSetLatencySleepModeNV" );
    vkLatencySleepNV                                         = cast( PFN_vkLatencySleepNV                                         ) vkGetDeviceProcAddr( device, "vkLatencySleepNV" );
    vkSetLatencyMarkerNV                                     = cast( PFN_vkSetLatencyMarkerNV                                     ) vkGetDeviceProcAddr( device, "vkSetLatencyMarkerNV" );
    vkGetLatencyTimingsNV                                    = cast( PFN_vkGetLatencyTimingsNV                                    ) vkGetDeviceProcAddr( device, "vkGetLatencyTimingsNV" );
    vkQueueNotifyOutOfBandNV                                 = cast( PFN_vkQueueNotifyOutOfBandNV                                 ) vkGetDeviceProcAddr( device, "vkQueueNotifyOutOfBandNV" );

    // VK_ARM_data_graph
    vkCreateDataGraphPipelinesARM                            = cast( PFN_vkCreateDataGraphPipelinesARM                            ) vkGetDeviceProcAddr( device, "vkCreateDataGraphPipelinesARM" );
    vkCreateDataGraphPipelineSessionARM                      = cast( PFN_vkCreateDataGraphPipelineSessionARM                      ) vkGetDeviceProcAddr( device, "vkCreateDataGraphPipelineSessionARM" );
    vkGetDataGraphPipelineSessionBindPointRequirementsARM    = cast( PFN_vkGetDataGraphPipelineSessionBindPointRequirementsARM    ) vkGetDeviceProcAddr( device, "vkGetDataGraphPipelineSessionBindPointRequirementsARM" );
    vkGetDataGraphPipelineSessionMemoryRequirementsARM       = cast( PFN_vkGetDataGraphPipelineSessionMemoryRequirementsARM       ) vkGetDeviceProcAddr( device, "vkGetDataGraphPipelineSessionMemoryRequirementsARM" );
    vkBindDataGraphPipelineSessionMemoryARM                  = cast( PFN_vkBindDataGraphPipelineSessionMemoryARM                  ) vkGetDeviceProcAddr( device, "vkBindDataGraphPipelineSessionMemoryARM" );
    vkDestroyDataGraphPipelineSessionARM                     = cast( PFN_vkDestroyDataGraphPipelineSessionARM                     ) vkGetDeviceProcAddr( device, "vkDestroyDataGraphPipelineSessionARM" );
    vkCmdDispatchDataGraphARM                                = cast( PFN_vkCmdDispatchDataGraphARM                                ) vkGetDeviceProcAddr( device, "vkCmdDispatchDataGraphARM" );
    vkGetDataGraphPipelineAvailablePropertiesARM             = cast( PFN_vkGetDataGraphPipelineAvailablePropertiesARM             ) vkGetDeviceProcAddr( device, "vkGetDataGraphPipelineAvailablePropertiesARM" );
    vkGetDataGraphPipelinePropertiesARM                      = cast( PFN_vkGetDataGraphPipelinePropertiesARM                      ) vkGetDeviceProcAddr( device, "vkGetDataGraphPipelinePropertiesARM" );

    // VK_EXT_attachment_feedback_loop_dynamic_state
    vkCmdSetAttachmentFeedbackLoopEnableEXT                  = cast( PFN_vkCmdSetAttachmentFeedbackLoopEnableEXT                  ) vkGetDeviceProcAddr( device, "vkCmdSetAttachmentFeedbackLoopEnableEXT" );

    // VK_QCOM_tile_memory_heap
    vkCmdBindTileMemoryQCOM                                  = cast( PFN_vkCmdBindTileMemoryQCOM                                  ) vkGetDeviceProcAddr( device, "vkCmdBindTileMemoryQCOM" );

    // VK_EXT_memory_decompression
    vkCmdDecompressMemoryEXT                                 = cast( PFN_vkCmdDecompressMemoryEXT                                 ) vkGetDeviceProcAddr( device, "vkCmdDecompressMemoryEXT" );
    vkCmdDecompressMemoryIndirectCountEXT                    = cast( PFN_vkCmdDecompressMemoryIndirectCountEXT                    ) vkGetDeviceProcAddr( device, "vkCmdDecompressMemoryIndirectCountEXT" );

    // VK_NV_external_compute_queue
    vkCreateExternalComputeQueueNV                           = cast( PFN_vkCreateExternalComputeQueueNV                           ) vkGetDeviceProcAddr( device, "vkCreateExternalComputeQueueNV" );
    vkDestroyExternalComputeQueueNV                          = cast( PFN_vkDestroyExternalComputeQueueNV                          ) vkGetDeviceProcAddr( device, "vkDestroyExternalComputeQueueNV" );

    // VK_NV_cluster_acceleration_structure
    vkGetClusterAccelerationStructureBuildSizesNV            = cast( PFN_vkGetClusterAccelerationStructureBuildSizesNV            ) vkGetDeviceProcAddr( device, "vkGetClusterAccelerationStructureBuildSizesNV" );
    vkCmdBuildClusterAccelerationStructureIndirectNV         = cast( PFN_vkCmdBuildClusterAccelerationStructureIndirectNV         ) vkGetDeviceProcAddr( device, "vkCmdBuildClusterAccelerationStructureIndirectNV" );

    // VK_NV_partitioned_acceleration_structure
    vkGetPartitionedAccelerationStructuresBuildSizesNV       = cast( PFN_vkGetPartitionedAccelerationStructuresBuildSizesNV       ) vkGetDeviceProcAddr( device, "vkGetPartitionedAccelerationStructuresBuildSizesNV" );
    vkCmdBuildPartitionedAccelerationStructuresNV            = cast( PFN_vkCmdBuildPartitionedAccelerationStructuresNV            ) vkGetDeviceProcAddr( device, "vkCmdBuildPartitionedAccelerationStructuresNV" );

    // VK_EXT_device_generated_commands
    vkGetGeneratedCommandsMemoryRequirementsEXT              = cast( PFN_vkGetGeneratedCommandsMemoryRequirementsEXT              ) vkGetDeviceProcAddr( device, "vkGetGeneratedCommandsMemoryRequirementsEXT" );
    vkCmdPreprocessGeneratedCommandsEXT                      = cast( PFN_vkCmdPreprocessGeneratedCommandsEXT                      ) vkGetDeviceProcAddr( device, "vkCmdPreprocessGeneratedCommandsEXT" );
    vkCmdExecuteGeneratedCommandsEXT                         = cast( PFN_vkCmdExecuteGeneratedCommandsEXT                         ) vkGetDeviceProcAddr( device, "vkCmdExecuteGeneratedCommandsEXT" );
    vkCreateIndirectCommandsLayoutEXT                        = cast( PFN_vkCreateIndirectCommandsLayoutEXT                        ) vkGetDeviceProcAddr( device, "vkCreateIndirectCommandsLayoutEXT" );
    vkDestroyIndirectCommandsLayoutEXT                       = cast( PFN_vkDestroyIndirectCommandsLayoutEXT                       ) vkGetDeviceProcAddr( device, "vkDestroyIndirectCommandsLayoutEXT" );
    vkCreateIndirectExecutionSetEXT                          = cast( PFN_vkCreateIndirectExecutionSetEXT                          ) vkGetDeviceProcAddr( device, "vkCreateIndirectExecutionSetEXT" );
    vkDestroyIndirectExecutionSetEXT                         = cast( PFN_vkDestroyIndirectExecutionSetEXT                         ) vkGetDeviceProcAddr( device, "vkDestroyIndirectExecutionSetEXT" );
    vkUpdateIndirectExecutionSetPipelineEXT                  = cast( PFN_vkUpdateIndirectExecutionSetPipelineEXT                  ) vkGetDeviceProcAddr( device, "vkUpdateIndirectExecutionSetPipelineEXT" );
    vkUpdateIndirectExecutionSetShaderEXT                    = cast( PFN_vkUpdateIndirectExecutionSetShaderEXT                    ) vkGetDeviceProcAddr( device, "vkUpdateIndirectExecutionSetShaderEXT" );

    // VK_ARM_shader_instrumentation
    vkCreateShaderInstrumentationARM                         = cast( PFN_vkCreateShaderInstrumentationARM                         ) vkGetDeviceProcAddr( device, "vkCreateShaderInstrumentationARM" );
    vkDestroyShaderInstrumentationARM                        = cast( PFN_vkDestroyShaderInstrumentationARM                        ) vkGetDeviceProcAddr( device, "vkDestroyShaderInstrumentationARM" );
    vkCmdBeginShaderInstrumentationARM                       = cast( PFN_vkCmdBeginShaderInstrumentationARM                       ) vkGetDeviceProcAddr( device, "vkCmdBeginShaderInstrumentationARM" );
    vkCmdEndShaderInstrumentationARM                         = cast( PFN_vkCmdEndShaderInstrumentationARM                         ) vkGetDeviceProcAddr( device, "vkCmdEndShaderInstrumentationARM" );
    vkGetShaderInstrumentationValuesARM                      = cast( PFN_vkGetShaderInstrumentationValuesARM                      ) vkGetDeviceProcAddr( device, "vkGetShaderInstrumentationValuesARM" );
    vkClearShaderInstrumentationMetricsARM                   = cast( PFN_vkClearShaderInstrumentationMetricsARM                   ) vkGetDeviceProcAddr( device, "vkClearShaderInstrumentationMetricsARM" );

    // VK_EXT_custom_resolve
    vkCmdBeginCustomResolveEXT                               = cast( PFN_vkCmdBeginCustomResolveEXT                               ) vkGetDeviceProcAddr( device, "vkCmdBeginCustomResolveEXT" );

    // VK_NV_compute_occupancy_priority
    vkCmdSetComputeOccupancyPriorityNV                       = cast( PFN_vkCmdSetComputeOccupancyPriorityNV                       ) vkGetDeviceProcAddr( device, "vkCmdSetComputeOccupancyPriorityNV" );

    // VK_EXT_primitive_restart_index
    vkCmdSetPrimitiveRestartIndexEXT                         = cast( PFN_vkCmdSetPrimitiveRestartIndexEXT                         ) vkGetDeviceProcAddr( device, "vkCmdSetPrimitiveRestartIndexEXT" );

    // VK_KHR_acceleration_structure
    vkCreateAccelerationStructureKHR                         = cast( PFN_vkCreateAccelerationStructureKHR                         ) vkGetDeviceProcAddr( device, "vkCreateAccelerationStructureKHR" );
    vkDestroyAccelerationStructureKHR                        = cast( PFN_vkDestroyAccelerationStructureKHR                        ) vkGetDeviceProcAddr( device, "vkDestroyAccelerationStructureKHR" );
    vkCmdBuildAccelerationStructuresKHR                      = cast( PFN_vkCmdBuildAccelerationStructuresKHR                      ) vkGetDeviceProcAddr( device, "vkCmdBuildAccelerationStructuresKHR" );
    vkCmdBuildAccelerationStructuresIndirectKHR              = cast( PFN_vkCmdBuildAccelerationStructuresIndirectKHR              ) vkGetDeviceProcAddr( device, "vkCmdBuildAccelerationStructuresIndirectKHR" );
    vkBuildAccelerationStructuresKHR                         = cast( PFN_vkBuildAccelerationStructuresKHR                         ) vkGetDeviceProcAddr( device, "vkBuildAccelerationStructuresKHR" );
    vkCopyAccelerationStructureKHR                           = cast( PFN_vkCopyAccelerationStructureKHR                           ) vkGetDeviceProcAddr( device, "vkCopyAccelerationStructureKHR" );
    vkCopyAccelerationStructureToMemoryKHR                   = cast( PFN_vkCopyAccelerationStructureToMemoryKHR                   ) vkGetDeviceProcAddr( device, "vkCopyAccelerationStructureToMemoryKHR" );
    vkCopyMemoryToAccelerationStructureKHR                   = cast( PFN_vkCopyMemoryToAccelerationStructureKHR                   ) vkGetDeviceProcAddr( device, "vkCopyMemoryToAccelerationStructureKHR" );
    vkWriteAccelerationStructuresPropertiesKHR               = cast( PFN_vkWriteAccelerationStructuresPropertiesKHR               ) vkGetDeviceProcAddr( device, "vkWriteAccelerationStructuresPropertiesKHR" );
    vkCmdCopyAccelerationStructureKHR                        = cast( PFN_vkCmdCopyAccelerationStructureKHR                        ) vkGetDeviceProcAddr( device, "vkCmdCopyAccelerationStructureKHR" );
    vkCmdCopyAccelerationStructureToMemoryKHR                = cast( PFN_vkCmdCopyAccelerationStructureToMemoryKHR                ) vkGetDeviceProcAddr( device, "vkCmdCopyAccelerationStructureToMemoryKHR" );
    vkCmdCopyMemoryToAccelerationStructureKHR                = cast( PFN_vkCmdCopyMemoryToAccelerationStructureKHR                ) vkGetDeviceProcAddr( device, "vkCmdCopyMemoryToAccelerationStructureKHR" );
    vkGetAccelerationStructureDeviceAddressKHR               = cast( PFN_vkGetAccelerationStructureDeviceAddressKHR               ) vkGetDeviceProcAddr( device, "vkGetAccelerationStructureDeviceAddressKHR" );
    vkCmdWriteAccelerationStructuresPropertiesKHR            = cast( PFN_vkCmdWriteAccelerationStructuresPropertiesKHR            ) vkGetDeviceProcAddr( device, "vkCmdWriteAccelerationStructuresPropertiesKHR" );
    vkGetDeviceAccelerationStructureCompatibilityKHR         = cast( PFN_vkGetDeviceAccelerationStructureCompatibilityKHR         ) vkGetDeviceProcAddr( device, "vkGetDeviceAccelerationStructureCompatibilityKHR" );
    vkGetAccelerationStructureBuildSizesKHR                  = cast( PFN_vkGetAccelerationStructureBuildSizesKHR                  ) vkGetDeviceProcAddr( device, "vkGetAccelerationStructureBuildSizesKHR" );

    // VK_KHR_ray_tracing_pipeline
    vkCmdTraceRaysKHR                                        = cast( PFN_vkCmdTraceRaysKHR                                        ) vkGetDeviceProcAddr( device, "vkCmdTraceRaysKHR" );
    vkCreateRayTracingPipelinesKHR                           = cast( PFN_vkCreateRayTracingPipelinesKHR                           ) vkGetDeviceProcAddr( device, "vkCreateRayTracingPipelinesKHR" );
    vkGetRayTracingCaptureReplayShaderGroupHandlesKHR        = cast( PFN_vkGetRayTracingCaptureReplayShaderGroupHandlesKHR        ) vkGetDeviceProcAddr( device, "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR" );
    vkCmdTraceRaysIndirectKHR                                = cast( PFN_vkCmdTraceRaysIndirectKHR                                ) vkGetDeviceProcAddr( device, "vkCmdTraceRaysIndirectKHR" );
    vkGetRayTracingShaderGroupStackSizeKHR                   = cast( PFN_vkGetRayTracingShaderGroupStackSizeKHR                   ) vkGetDeviceProcAddr( device, "vkGetRayTracingShaderGroupStackSizeKHR" );
    vkCmdSetRayTracingPipelineStackSizeKHR                   = cast( PFN_vkCmdSetRayTracingPipelineStackSizeKHR                   ) vkGetDeviceProcAddr( device, "vkCmdSetRayTracingPipelineStackSizeKHR" );

    // VK_EXT_mesh_shader
    vkCmdDrawMeshTasksEXT                                    = cast( PFN_vkCmdDrawMeshTasksEXT                                    ) vkGetDeviceProcAddr( device, "vkCmdDrawMeshTasksEXT" );
    vkCmdDrawMeshTasksIndirectEXT                            = cast( PFN_vkCmdDrawMeshTasksIndirectEXT                            ) vkGetDeviceProcAddr( device, "vkCmdDrawMeshTasksIndirectEXT" );
    vkCmdDrawMeshTasksIndirectCountEXT                       = cast( PFN_vkCmdDrawMeshTasksIndirectCountEXT                       ) vkGetDeviceProcAddr( device, "vkCmdDrawMeshTasksIndirectCountEXT" );
}

