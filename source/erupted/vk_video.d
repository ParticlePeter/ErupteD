/**
 * Dlang vulkan type definitions
 *
 * Copyright: Copyright 2015-2016 The Khronos Group Inc.; Copyright 2016 Alex Parrill, Peter Particle.
 * License:   $(https://opensource.org/licenses/MIT, MIT License).
 * Authors: Copyright 2016 Alex Parrill, Peter Particle
 */
module erupted.vk_video;

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


// - vulkan_video_codecs_common -
enum vulkan_video_codecs_common = 1;

pure uint VK_MAKE_VIDEO_STD_VERSION( uint major, uint minor, uint patch ) { return ( major << 22 ) | ( minor << 12 ) | patch; }


// - vulkan_video_codec_h264std -
enum vulkan_video_codec_h264std = 1;

enum STD_VIDEO_H264_CPB_CNT_LIST_SIZE = 32;
enum STD_VIDEO_H264_SCALING_LIST_4X4_NUM_LISTS = 6;
enum STD_VIDEO_H264_SCALING_LIST_4X4_NUM_ELEMENTS = 16;
enum STD_VIDEO_H264_SCALING_LIST_8X8_NUM_LISTS = 6;
enum STD_VIDEO_H264_SCALING_LIST_8X8_NUM_ELEMENTS = 64;
enum STD_VIDEO_H264_MAX_NUM_LIST_REF = 32;
enum STD_VIDEO_H264_MAX_CHROMA_PLANES = 2;
enum STD_VIDEO_H264_NO_REFERENCE_PICTURE = 0xFF;

enum StdVideoH264ChromaFormatIdc {
    STD_VIDEO_H264_CHROMA_FORMAT_IDC_MONOCHROME  = 0,
    STD_VIDEO_H264_CHROMA_FORMAT_IDC_420         = 1,
    STD_VIDEO_H264_CHROMA_FORMAT_IDC_422         = 2,
    STD_VIDEO_H264_CHROMA_FORMAT_IDC_444         = 3,
    STD_VIDEO_H264_CHROMA_FORMAT_IDC_INVALID     = 0x7FFFFFFF,
    STD_VIDEO_H264_CHROMA_FORMAT_IDC_MAX_ENUM    = 0x7FFFFFFF
}

enum STD_VIDEO_H264_CHROMA_FORMAT_IDC_MONOCHROME = StdVideoH264ChromaFormatIdc.STD_VIDEO_H264_CHROMA_FORMAT_IDC_MONOCHROME;
enum STD_VIDEO_H264_CHROMA_FORMAT_IDC_420        = StdVideoH264ChromaFormatIdc.STD_VIDEO_H264_CHROMA_FORMAT_IDC_420;
enum STD_VIDEO_H264_CHROMA_FORMAT_IDC_422        = StdVideoH264ChromaFormatIdc.STD_VIDEO_H264_CHROMA_FORMAT_IDC_422;
enum STD_VIDEO_H264_CHROMA_FORMAT_IDC_444        = StdVideoH264ChromaFormatIdc.STD_VIDEO_H264_CHROMA_FORMAT_IDC_444;
enum STD_VIDEO_H264_CHROMA_FORMAT_IDC_INVALID    = StdVideoH264ChromaFormatIdc.STD_VIDEO_H264_CHROMA_FORMAT_IDC_INVALID;
enum STD_VIDEO_H264_CHROMA_FORMAT_IDC_MAX_ENUM   = StdVideoH264ChromaFormatIdc.STD_VIDEO_H264_CHROMA_FORMAT_IDC_MAX_ENUM;

enum StdVideoH264ProfileIdc {
    STD_VIDEO_H264_PROFILE_IDC_BASELINE                  = 66,
    STD_VIDEO_H264_PROFILE_IDC_MAIN                      = 77,
    STD_VIDEO_H264_PROFILE_IDC_HIGH                      = 100,
    STD_VIDEO_H264_PROFILE_IDC_HIGH_10                   = 110,
    STD_VIDEO_H264_PROFILE_IDC_HIGH_422                  = 122,
    STD_VIDEO_H264_PROFILE_IDC_HIGH_444_PREDICTIVE       = 244,
    STD_VIDEO_H264_PROFILE_IDC_INVALID                   = 0x7FFFFFFF,
    STD_VIDEO_H264_PROFILE_IDC_MAX_ENUM                  = 0x7FFFFFFF
}

enum STD_VIDEO_H264_PROFILE_IDC_BASELINE                 = StdVideoH264ProfileIdc.STD_VIDEO_H264_PROFILE_IDC_BASELINE;
enum STD_VIDEO_H264_PROFILE_IDC_MAIN                     = StdVideoH264ProfileIdc.STD_VIDEO_H264_PROFILE_IDC_MAIN;
enum STD_VIDEO_H264_PROFILE_IDC_HIGH                     = StdVideoH264ProfileIdc.STD_VIDEO_H264_PROFILE_IDC_HIGH;
enum STD_VIDEO_H264_PROFILE_IDC_HIGH_10                  = StdVideoH264ProfileIdc.STD_VIDEO_H264_PROFILE_IDC_HIGH_10;
enum STD_VIDEO_H264_PROFILE_IDC_HIGH_422                 = StdVideoH264ProfileIdc.STD_VIDEO_H264_PROFILE_IDC_HIGH_422;
enum STD_VIDEO_H264_PROFILE_IDC_HIGH_444_PREDICTIVE      = StdVideoH264ProfileIdc.STD_VIDEO_H264_PROFILE_IDC_HIGH_444_PREDICTIVE;
enum STD_VIDEO_H264_PROFILE_IDC_INVALID                  = StdVideoH264ProfileIdc.STD_VIDEO_H264_PROFILE_IDC_INVALID;
enum STD_VIDEO_H264_PROFILE_IDC_MAX_ENUM                 = StdVideoH264ProfileIdc.STD_VIDEO_H264_PROFILE_IDC_MAX_ENUM;

enum StdVideoH264LevelIdc {
    STD_VIDEO_H264_LEVEL_IDC_1_0         = 0,
    STD_VIDEO_H264_LEVEL_IDC_1_1         = 1,
    STD_VIDEO_H264_LEVEL_IDC_1_2         = 2,
    STD_VIDEO_H264_LEVEL_IDC_1_3         = 3,
    STD_VIDEO_H264_LEVEL_IDC_2_0         = 4,
    STD_VIDEO_H264_LEVEL_IDC_2_1         = 5,
    STD_VIDEO_H264_LEVEL_IDC_2_2         = 6,
    STD_VIDEO_H264_LEVEL_IDC_3_0         = 7,
    STD_VIDEO_H264_LEVEL_IDC_3_1         = 8,
    STD_VIDEO_H264_LEVEL_IDC_3_2         = 9,
    STD_VIDEO_H264_LEVEL_IDC_4_0         = 10,
    STD_VIDEO_H264_LEVEL_IDC_4_1         = 11,
    STD_VIDEO_H264_LEVEL_IDC_4_2         = 12,
    STD_VIDEO_H264_LEVEL_IDC_5_0         = 13,
    STD_VIDEO_H264_LEVEL_IDC_5_1         = 14,
    STD_VIDEO_H264_LEVEL_IDC_5_2         = 15,
    STD_VIDEO_H264_LEVEL_IDC_6_0         = 16,
    STD_VIDEO_H264_LEVEL_IDC_6_1         = 17,
    STD_VIDEO_H264_LEVEL_IDC_6_2         = 18,
    STD_VIDEO_H264_LEVEL_IDC_INVALID     = 0x7FFFFFFF,
    STD_VIDEO_H264_LEVEL_IDC_MAX_ENUM    = 0x7FFFFFFF
}

enum STD_VIDEO_H264_LEVEL_IDC_1_0        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_1_0;
enum STD_VIDEO_H264_LEVEL_IDC_1_1        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_1_1;
enum STD_VIDEO_H264_LEVEL_IDC_1_2        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_1_2;
enum STD_VIDEO_H264_LEVEL_IDC_1_3        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_1_3;
enum STD_VIDEO_H264_LEVEL_IDC_2_0        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_2_0;
enum STD_VIDEO_H264_LEVEL_IDC_2_1        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_2_1;
enum STD_VIDEO_H264_LEVEL_IDC_2_2        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_2_2;
enum STD_VIDEO_H264_LEVEL_IDC_3_0        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_3_0;
enum STD_VIDEO_H264_LEVEL_IDC_3_1        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_3_1;
enum STD_VIDEO_H264_LEVEL_IDC_3_2        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_3_2;
enum STD_VIDEO_H264_LEVEL_IDC_4_0        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_4_0;
enum STD_VIDEO_H264_LEVEL_IDC_4_1        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_4_1;
enum STD_VIDEO_H264_LEVEL_IDC_4_2        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_4_2;
enum STD_VIDEO_H264_LEVEL_IDC_5_0        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_5_0;
enum STD_VIDEO_H264_LEVEL_IDC_5_1        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_5_1;
enum STD_VIDEO_H264_LEVEL_IDC_5_2        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_5_2;
enum STD_VIDEO_H264_LEVEL_IDC_6_0        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_6_0;
enum STD_VIDEO_H264_LEVEL_IDC_6_1        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_6_1;
enum STD_VIDEO_H264_LEVEL_IDC_6_2        = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_6_2;
enum STD_VIDEO_H264_LEVEL_IDC_INVALID    = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_INVALID;
enum STD_VIDEO_H264_LEVEL_IDC_MAX_ENUM   = StdVideoH264LevelIdc.STD_VIDEO_H264_LEVEL_IDC_MAX_ENUM;

enum StdVideoH264PocType {
    STD_VIDEO_H264_POC_TYPE_0            = 0,
    STD_VIDEO_H264_POC_TYPE_1            = 1,
    STD_VIDEO_H264_POC_TYPE_2            = 2,
    STD_VIDEO_H264_POC_TYPE_INVALID      = 0x7FFFFFFF,
    STD_VIDEO_H264_POC_TYPE_MAX_ENUM     = 0x7FFFFFFF
}

enum STD_VIDEO_H264_POC_TYPE_0           = StdVideoH264PocType.STD_VIDEO_H264_POC_TYPE_0;
enum STD_VIDEO_H264_POC_TYPE_1           = StdVideoH264PocType.STD_VIDEO_H264_POC_TYPE_1;
enum STD_VIDEO_H264_POC_TYPE_2           = StdVideoH264PocType.STD_VIDEO_H264_POC_TYPE_2;
enum STD_VIDEO_H264_POC_TYPE_INVALID     = StdVideoH264PocType.STD_VIDEO_H264_POC_TYPE_INVALID;
enum STD_VIDEO_H264_POC_TYPE_MAX_ENUM    = StdVideoH264PocType.STD_VIDEO_H264_POC_TYPE_MAX_ENUM;

enum StdVideoH264AspectRatioIdc {
    STD_VIDEO_H264_ASPECT_RATIO_IDC_UNSPECIFIED          = 0,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_SQUARE               = 1,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_12_11                = 2,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_10_11                = 3,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_16_11                = 4,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_40_33                = 5,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_24_11                = 6,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_20_11                = 7,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_32_11                = 8,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_80_33                = 9,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_18_11                = 10,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_15_11                = 11,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_64_33                = 12,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_160_99               = 13,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_4_3                  = 14,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_3_2                  = 15,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_2_1                  = 16,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_EXTENDED_SAR         = 255,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_INVALID              = 0x7FFFFFFF,
    STD_VIDEO_H264_ASPECT_RATIO_IDC_MAX_ENUM             = 0x7FFFFFFF
}

enum STD_VIDEO_H264_ASPECT_RATIO_IDC_UNSPECIFIED         = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_UNSPECIFIED;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_SQUARE              = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_SQUARE;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_12_11               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_12_11;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_10_11               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_10_11;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_16_11               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_16_11;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_40_33               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_40_33;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_24_11               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_24_11;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_20_11               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_20_11;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_32_11               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_32_11;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_80_33               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_80_33;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_18_11               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_18_11;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_15_11               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_15_11;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_64_33               = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_64_33;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_160_99              = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_160_99;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_4_3                 = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_4_3;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_3_2                 = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_3_2;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_2_1                 = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_2_1;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_EXTENDED_SAR        = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_EXTENDED_SAR;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_INVALID             = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_INVALID;
enum STD_VIDEO_H264_ASPECT_RATIO_IDC_MAX_ENUM            = StdVideoH264AspectRatioIdc.STD_VIDEO_H264_ASPECT_RATIO_IDC_MAX_ENUM;

enum StdVideoH264WeightedBipredIdc {
    STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_DEFAULT   = 0,
    STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_EXPLICIT  = 1,
    STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_IMPLICIT  = 2,
    STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_INVALID   = 0x7FFFFFFF,
    STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_MAX_ENUM  = 0x7FFFFFFF
}

enum STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_DEFAULT  = StdVideoH264WeightedBipredIdc.STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_DEFAULT;
enum STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_EXPLICIT = StdVideoH264WeightedBipredIdc.STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_EXPLICIT;
enum STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_IMPLICIT = StdVideoH264WeightedBipredIdc.STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_IMPLICIT;
enum STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_INVALID  = StdVideoH264WeightedBipredIdc.STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_INVALID;
enum STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_MAX_ENUM = StdVideoH264WeightedBipredIdc.STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_MAX_ENUM;

enum StdVideoH264ModificationOfPicNumsIdc {
    STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_SUBTRACT      = 0,
    STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_ADD           = 1,
    STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_LONG_TERM                = 2,
    STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_END                      = 3,
    STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_INVALID                  = 0x7FFFFFFF,
    STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_MAX_ENUM                 = 0x7FFFFFFF
}

enum STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_SUBTRACT     = StdVideoH264ModificationOfPicNumsIdc.STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_SUBTRACT;
enum STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_ADD          = StdVideoH264ModificationOfPicNumsIdc.STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_ADD;
enum STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_LONG_TERM               = StdVideoH264ModificationOfPicNumsIdc.STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_LONG_TERM;
enum STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_END                     = StdVideoH264ModificationOfPicNumsIdc.STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_END;
enum STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_INVALID                 = StdVideoH264ModificationOfPicNumsIdc.STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_INVALID;
enum STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_MAX_ENUM                = StdVideoH264ModificationOfPicNumsIdc.STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_MAX_ENUM;

enum StdVideoH264MemMgmtControlOp {
    STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_END                               = 0,
    STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_SHORT_TERM                 = 1,
    STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_LONG_TERM                  = 2,
    STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_LONG_TERM                    = 3,
    STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_SET_MAX_LONG_TERM_INDEX           = 4,
    STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_ALL                        = 5,
    STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_CURRENT_AS_LONG_TERM         = 6,
    STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_INVALID                           = 0x7FFFFFFF,
    STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MAX_ENUM                          = 0x7FFFFFFF
}

enum STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_END                              = StdVideoH264MemMgmtControlOp.STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_END;
enum STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_SHORT_TERM                = StdVideoH264MemMgmtControlOp.STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_SHORT_TERM;
enum STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_LONG_TERM                 = StdVideoH264MemMgmtControlOp.STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_LONG_TERM;
enum STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_LONG_TERM                   = StdVideoH264MemMgmtControlOp.STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_LONG_TERM;
enum STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_SET_MAX_LONG_TERM_INDEX          = StdVideoH264MemMgmtControlOp.STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_SET_MAX_LONG_TERM_INDEX;
enum STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_ALL                       = StdVideoH264MemMgmtControlOp.STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_ALL;
enum STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_CURRENT_AS_LONG_TERM        = StdVideoH264MemMgmtControlOp.STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_CURRENT_AS_LONG_TERM;
enum STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_INVALID                          = StdVideoH264MemMgmtControlOp.STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_INVALID;
enum STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MAX_ENUM                         = StdVideoH264MemMgmtControlOp.STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MAX_ENUM;

enum StdVideoH264CabacInitIdc {
    STD_VIDEO_H264_CABAC_INIT_IDC_0              = 0,
    STD_VIDEO_H264_CABAC_INIT_IDC_1              = 1,
    STD_VIDEO_H264_CABAC_INIT_IDC_2              = 2,
    STD_VIDEO_H264_CABAC_INIT_IDC_INVALID        = 0x7FFFFFFF,
    STD_VIDEO_H264_CABAC_INIT_IDC_MAX_ENUM       = 0x7FFFFFFF
}

enum STD_VIDEO_H264_CABAC_INIT_IDC_0             = StdVideoH264CabacInitIdc.STD_VIDEO_H264_CABAC_INIT_IDC_0;
enum STD_VIDEO_H264_CABAC_INIT_IDC_1             = StdVideoH264CabacInitIdc.STD_VIDEO_H264_CABAC_INIT_IDC_1;
enum STD_VIDEO_H264_CABAC_INIT_IDC_2             = StdVideoH264CabacInitIdc.STD_VIDEO_H264_CABAC_INIT_IDC_2;
enum STD_VIDEO_H264_CABAC_INIT_IDC_INVALID       = StdVideoH264CabacInitIdc.STD_VIDEO_H264_CABAC_INIT_IDC_INVALID;
enum STD_VIDEO_H264_CABAC_INIT_IDC_MAX_ENUM      = StdVideoH264CabacInitIdc.STD_VIDEO_H264_CABAC_INIT_IDC_MAX_ENUM;

enum StdVideoH264DisableDeblockingFilterIdc {
    STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_DISABLED        = 0,
    STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_ENABLED         = 1,
    STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_PARTIAL         = 2,
    STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_INVALID         = 0x7FFFFFFF,
    STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_MAX_ENUM        = 0x7FFFFFFF
}

enum STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_DISABLED       = StdVideoH264DisableDeblockingFilterIdc.STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_DISABLED;
enum STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_ENABLED        = StdVideoH264DisableDeblockingFilterIdc.STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_ENABLED;
enum STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_PARTIAL        = StdVideoH264DisableDeblockingFilterIdc.STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_PARTIAL;
enum STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_INVALID        = StdVideoH264DisableDeblockingFilterIdc.STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_INVALID;
enum STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_MAX_ENUM       = StdVideoH264DisableDeblockingFilterIdc.STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_MAX_ENUM;

enum StdVideoH264SliceType {
    STD_VIDEO_H264_SLICE_TYPE_P          = 0,
    STD_VIDEO_H264_SLICE_TYPE_B          = 1,
    STD_VIDEO_H264_SLICE_TYPE_I          = 2,
    STD_VIDEO_H264_SLICE_TYPE_INVALID    = 0x7FFFFFFF,
    STD_VIDEO_H264_SLICE_TYPE_MAX_ENUM   = 0x7FFFFFFF
}

enum STD_VIDEO_H264_SLICE_TYPE_P         = StdVideoH264SliceType.STD_VIDEO_H264_SLICE_TYPE_P;
enum STD_VIDEO_H264_SLICE_TYPE_B         = StdVideoH264SliceType.STD_VIDEO_H264_SLICE_TYPE_B;
enum STD_VIDEO_H264_SLICE_TYPE_I         = StdVideoH264SliceType.STD_VIDEO_H264_SLICE_TYPE_I;
enum STD_VIDEO_H264_SLICE_TYPE_INVALID   = StdVideoH264SliceType.STD_VIDEO_H264_SLICE_TYPE_INVALID;
enum STD_VIDEO_H264_SLICE_TYPE_MAX_ENUM  = StdVideoH264SliceType.STD_VIDEO_H264_SLICE_TYPE_MAX_ENUM;

enum StdVideoH264PictureType {
    STD_VIDEO_H264_PICTURE_TYPE_P        = 0,
    STD_VIDEO_H264_PICTURE_TYPE_B        = 1,
    STD_VIDEO_H264_PICTURE_TYPE_I        = 2,
    STD_VIDEO_H264_PICTURE_TYPE_IDR      = 5,
    STD_VIDEO_H264_PICTURE_TYPE_INVALID  = 0x7FFFFFFF,
    STD_VIDEO_H264_PICTURE_TYPE_MAX_ENUM = 0x7FFFFFFF
}

enum STD_VIDEO_H264_PICTURE_TYPE_P       = StdVideoH264PictureType.STD_VIDEO_H264_PICTURE_TYPE_P;
enum STD_VIDEO_H264_PICTURE_TYPE_B       = StdVideoH264PictureType.STD_VIDEO_H264_PICTURE_TYPE_B;
enum STD_VIDEO_H264_PICTURE_TYPE_I       = StdVideoH264PictureType.STD_VIDEO_H264_PICTURE_TYPE_I;
enum STD_VIDEO_H264_PICTURE_TYPE_IDR     = StdVideoH264PictureType.STD_VIDEO_H264_PICTURE_TYPE_IDR;
enum STD_VIDEO_H264_PICTURE_TYPE_INVALID = StdVideoH264PictureType.STD_VIDEO_H264_PICTURE_TYPE_INVALID;
enum STD_VIDEO_H264_PICTURE_TYPE_MAX_ENUM = StdVideoH264PictureType.STD_VIDEO_H264_PICTURE_TYPE_MAX_ENUM;

enum StdVideoH264NonVclNaluType {
    STD_VIDEO_H264_NON_VCL_NALU_TYPE_SPS                 = 0,
    STD_VIDEO_H264_NON_VCL_NALU_TYPE_PPS                 = 1,
    STD_VIDEO_H264_NON_VCL_NALU_TYPE_AUD                 = 2,
    STD_VIDEO_H264_NON_VCL_NALU_TYPE_PREFIX              = 3,
    STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_SEQUENCE     = 4,
    STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_STREAM       = 5,
    STD_VIDEO_H264_NON_VCL_NALU_TYPE_PRECODED            = 6,
    STD_VIDEO_H264_NON_VCL_NALU_TYPE_INVALID             = 0x7FFFFFFF,
    STD_VIDEO_H264_NON_VCL_NALU_TYPE_MAX_ENUM            = 0x7FFFFFFF
}

enum STD_VIDEO_H264_NON_VCL_NALU_TYPE_SPS                = StdVideoH264NonVclNaluType.STD_VIDEO_H264_NON_VCL_NALU_TYPE_SPS;
enum STD_VIDEO_H264_NON_VCL_NALU_TYPE_PPS                = StdVideoH264NonVclNaluType.STD_VIDEO_H264_NON_VCL_NALU_TYPE_PPS;
enum STD_VIDEO_H264_NON_VCL_NALU_TYPE_AUD                = StdVideoH264NonVclNaluType.STD_VIDEO_H264_NON_VCL_NALU_TYPE_AUD;
enum STD_VIDEO_H264_NON_VCL_NALU_TYPE_PREFIX             = StdVideoH264NonVclNaluType.STD_VIDEO_H264_NON_VCL_NALU_TYPE_PREFIX;
enum STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_SEQUENCE    = StdVideoH264NonVclNaluType.STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_SEQUENCE;
enum STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_STREAM      = StdVideoH264NonVclNaluType.STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_STREAM;
enum STD_VIDEO_H264_NON_VCL_NALU_TYPE_PRECODED           = StdVideoH264NonVclNaluType.STD_VIDEO_H264_NON_VCL_NALU_TYPE_PRECODED;
enum STD_VIDEO_H264_NON_VCL_NALU_TYPE_INVALID            = StdVideoH264NonVclNaluType.STD_VIDEO_H264_NON_VCL_NALU_TYPE_INVALID;
enum STD_VIDEO_H264_NON_VCL_NALU_TYPE_MAX_ENUM           = StdVideoH264NonVclNaluType.STD_VIDEO_H264_NON_VCL_NALU_TYPE_MAX_ENUM;

struct StdVideoH264SpsVuiFlags {
    mixin( bitfields!(
        uint32_t, "aspect_ratio_info_present_flag",  1,
        uint32_t, "overscan_info_present_flag",      1,
        uint32_t, "overscan_appropriate_flag",       1,
        uint32_t, "video_signal_type_present_flag",  1,
        uint32_t, "video_full_range_flag",           1,
        uint32_t, "color_description_present_flag",  1,
        uint32_t, "chroma_loc_info_present_flag",    1,
        uint32_t, "timing_info_present_flag",        1,
        uint32_t, "fixed_frame_rate_flag",           1,
        uint32_t, "bitstream_restriction_flag",      1,
        uint32_t, "nal_hrd_parameters_present_flag", 1,
        uint32_t, "vcl_hrd_parameters_present_flag", 1,
        uint32_t, "",                                20,
    ));
}

struct StdVideoH264HrdParameters {
    uint8_t                                       cpb_cnt_minus1;
    uint8_t                                       bit_rate_scale;
    uint8_t                                       cpb_size_scale;
    uint8_t                                       reserved1;
    uint32_t[ STD_VIDEO_H264_CPB_CNT_LIST_SIZE ]  bit_rate_value_minus1;
    uint32_t[ STD_VIDEO_H264_CPB_CNT_LIST_SIZE ]  cpb_size_value_minus1;
    uint8_t[ STD_VIDEO_H264_CPB_CNT_LIST_SIZE ]   cbr_flag;
    uint32_t                                      initial_cpb_removal_delay_length_minus1;
    uint32_t                                      cpb_removal_delay_length_minus1;
    uint32_t                                      dpb_output_delay_length_minus1;
    uint32_t                                      time_offset_length;
}

struct StdVideoH264SequenceParameterSetVui {
    StdVideoH264SpsVuiFlags              flags;
    StdVideoH264AspectRatioIdc           aspect_ratio_idc;
    uint16_t                             sar_width;
    uint16_t                             sar_height;
    uint8_t                              video_format;
    uint8_t                              colour_primaries;
    uint8_t                              transfer_characteristics;
    uint8_t                              matrix_coefficients;
    uint32_t                             num_units_in_tick;
    uint32_t                             time_scale;
    uint8_t                              max_num_reorder_frames;
    uint8_t                              max_dec_frame_buffering;
    uint8_t                              chroma_sample_loc_type_top_field;
    uint8_t                              chroma_sample_loc_type_bottom_field;
    uint32_t                             reserved1;
    const( StdVideoH264HrdParameters )*  pHrdParameters;
}

struct StdVideoH264SpsFlags {
    mixin( bitfields!(
        uint32_t, "constraint_set0_flag",                 1,
        uint32_t, "constraint_set1_flag",                 1,
        uint32_t, "constraint_set2_flag",                 1,
        uint32_t, "constraint_set3_flag",                 1,
        uint32_t, "constraint_set4_flag",                 1,
        uint32_t, "constraint_set5_flag",                 1,
        uint32_t, "direct_8x8_inference_flag",            1,
        uint32_t, "mb_adaptive_frame_field_flag",         1,
        uint32_t, "frame_mbs_only_flag",                  1,
        uint32_t, "delta_pic_order_always_zero_flag",     1,
        uint32_t, "separate_colour_plane_flag",           1,
        uint32_t, "gaps_in_frame_num_value_allowed_flag", 1,
        uint32_t, "qpprime_y_zero_transform_bypass_flag", 1,
        uint32_t, "frame_cropping_flag",                  1,
        uint32_t, "seq_scaling_matrix_present_flag",      1,
        uint32_t, "vui_parameters_present_flag",          1,
        uint32_t, "",                                     16,
    ));
}

struct StdVideoH264ScalingLists {
    uint16_t                                                                                              scaling_list_present_mask;
    uint16_t                                                                                              use_default_scaling_matrix_mask;
    uint8_t[ STD_VIDEO_H264_SCALING_LIST_4X4_NUM_ELEMENTS ][ STD_VIDEO_H264_SCALING_LIST_4X4_NUM_LISTS ]  ScalingList4x4;
    uint8_t[ STD_VIDEO_H264_SCALING_LIST_8X8_NUM_ELEMENTS ][ STD_VIDEO_H264_SCALING_LIST_8X8_NUM_LISTS ]  ScalingList8x8;
}

struct StdVideoH264SequenceParameterSet {
    StdVideoH264SpsFlags                           flags;
    StdVideoH264ProfileIdc                         profile_idc;
    StdVideoH264LevelIdc                           level_idc;
    StdVideoH264ChromaFormatIdc                    chroma_format_idc;
    uint8_t                                        seq_parameter_set_id;
    uint8_t                                        bit_depth_luma_minus8;
    uint8_t                                        bit_depth_chroma_minus8;
    uint8_t                                        log2_max_frame_num_minus4;
    StdVideoH264PocType                            pic_order_cnt_type;
    int32_t                                        offset_for_non_ref_pic;
    int32_t                                        offset_for_top_to_bottom_field;
    uint8_t                                        log2_max_pic_order_cnt_lsb_minus4;
    uint8_t                                        num_ref_frames_in_pic_order_cnt_cycle;
    uint8_t                                        max_num_ref_frames;
    uint8_t                                        reserved1;
    uint32_t                                       pic_width_in_mbs_minus1;
    uint32_t                                       pic_height_in_map_units_minus1;
    uint32_t                                       frame_crop_left_offset;
    uint32_t                                       frame_crop_right_offset;
    uint32_t                                       frame_crop_top_offset;
    uint32_t                                       frame_crop_bottom_offset;
    uint32_t                                       reserved2;
    const( int32_t )*                              pOffsetForRefFrame;
    const( StdVideoH264ScalingLists )*             pScalingLists;
    const( StdVideoH264SequenceParameterSetVui )*  pSequenceParameterSetVui;
}

struct StdVideoH264PpsFlags {
    mixin( bitfields!(
        uint32_t, "transform_8x8_mode_flag",                      1,
        uint32_t, "redundant_pic_cnt_present_flag",               1,
        uint32_t, "constrained_intra_pred_flag",                  1,
        uint32_t, "deblocking_filter_control_present_flag",       1,
        uint32_t, "weighted_pred_flag",                           1,
        uint32_t, "bottom_field_pic_order_in_frame_present_flag", 1,
        uint32_t, "entropy_coding_mode_flag",                     1,
        uint32_t, "pic_scaling_matrix_present_flag",              1,
        uint32_t, "",                                             24,
    ));
}

struct StdVideoH264PictureParameterSet {
    StdVideoH264PpsFlags                flags;
    uint8_t                             seq_parameter_set_id;
    uint8_t                             pic_parameter_set_id;
    uint8_t                             num_ref_idx_l0_default_active_minus1;
    uint8_t                             num_ref_idx_l1_default_active_minus1;
    StdVideoH264WeightedBipredIdc       weighted_bipred_idc;
    int8_t                              pic_init_qp_minus26;
    int8_t                              pic_init_qs_minus26;
    int8_t                              chroma_qp_index_offset;
    int8_t                              second_chroma_qp_index_offset;
    const( StdVideoH264ScalingLists )*  pScalingLists;
}


// - vulkan_video_codec_h264std_decode -
enum vulkan_video_codec_h264std_decode = 1;

enum VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_API_VERSION_1_0_0 = VK_MAKE_VIDEO_STD_VERSION( 1, 0, 0 );

enum STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_LIST_SIZE = 2;
enum VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_API_VERSION_1_0_0;
enum const( char )* VK_STD_VULKAN_VIDEO_CODEC_H264_DECODE_EXTENSION_NAME = "VK_STD_vulkan_video_codec_h264_decode";

enum StdVideoDecodeH264FieldOrderCount {
    STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_TOP          = 0,
    STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_BOTTOM       = 1,
    STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_INVALID      = 0x7FFFFFFF,
    STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_MAX_ENUM     = 0x7FFFFFFF
}

enum STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_TOP         = StdVideoDecodeH264FieldOrderCount.STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_TOP;
enum STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_BOTTOM      = StdVideoDecodeH264FieldOrderCount.STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_BOTTOM;
enum STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_INVALID     = StdVideoDecodeH264FieldOrderCount.STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_INVALID;
enum STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_MAX_ENUM    = StdVideoDecodeH264FieldOrderCount.STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_MAX_ENUM;

struct StdVideoDecodeH264PictureInfoFlags {
    mixin( bitfields!(
        uint32_t, "field_pic_flag",           1,
        uint32_t, "is_intra",                 1,
        uint32_t, "IdrPicFlag",               1,
        uint32_t, "bottom_field_flag",        1,
        uint32_t, "is_reference",             1,
        uint32_t, "complementary_field_pair", 1,
        uint32_t, "",                         26,
    ));
}

struct StdVideoDecodeH264PictureInfo {
    StdVideoDecodeH264PictureInfoFlags                            flags;
    uint8_t                                                       seq_parameter_set_id;
    uint8_t                                                       pic_parameter_set_id;
    uint8_t                                                       reserved1;
    uint8_t                                                       reserved2;
    uint16_t                                                      frame_num;
    uint16_t                                                      idr_pic_id;
    int32_t[ STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_LIST_SIZE ]  PicOrderCnt;
}

struct StdVideoDecodeH264ReferenceInfoFlags {
    mixin( bitfields!(
        uint32_t, "top_field_flag",               1,
        uint32_t, "bottom_field_flag",            1,
        uint32_t, "used_for_long_term_reference", 1,
        uint32_t, "is_non_existing",              1,
        uint32_t, "",                             28,
    ));
}

struct StdVideoDecodeH264ReferenceInfo {
    StdVideoDecodeH264ReferenceInfoFlags                          flags;
    uint16_t                                                      FrameNum;
    uint16_t                                                      reserved;
    int32_t[ STD_VIDEO_DECODE_H264_FIELD_ORDER_COUNT_LIST_SIZE ]  PicOrderCnt;
}


// - vulkan_video_codec_h264std_encode -
enum vulkan_video_codec_h264std_encode = 1;

enum VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_API_VERSION_1_0_0 = VK_MAKE_VIDEO_STD_VERSION( 1, 0, 0 );

enum VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_API_VERSION_1_0_0;
enum const( char )* VK_STD_VULKAN_VIDEO_CODEC_H264_ENCODE_EXTENSION_NAME = "VK_STD_vulkan_video_codec_h264_encode";

struct StdVideoEncodeH264WeightTableFlags {
    uint32_t  luma_weight_l0_flag;
    uint32_t  chroma_weight_l0_flag;
    uint32_t  luma_weight_l1_flag;
    uint32_t  chroma_weight_l1_flag;
}

struct StdVideoEncodeH264WeightTable {
    StdVideoEncodeH264WeightTableFlags                                             flags;
    uint8_t                                                                        luma_log2_weight_denom;
    uint8_t                                                                        chroma_log2_weight_denom;
    int8_t[ STD_VIDEO_H264_MAX_NUM_LIST_REF ]                                      luma_weight_l0;
    int8_t[ STD_VIDEO_H264_MAX_NUM_LIST_REF ]                                      luma_offset_l0;
    int8_t[ STD_VIDEO_H264_MAX_CHROMA_PLANES ][ STD_VIDEO_H264_MAX_NUM_LIST_REF ]  chroma_weight_l0;
    int8_t[ STD_VIDEO_H264_MAX_CHROMA_PLANES ][ STD_VIDEO_H264_MAX_NUM_LIST_REF ]  chroma_offset_l0;
    int8_t[ STD_VIDEO_H264_MAX_NUM_LIST_REF ]                                      luma_weight_l1;
    int8_t[ STD_VIDEO_H264_MAX_NUM_LIST_REF ]                                      luma_offset_l1;
    int8_t[ STD_VIDEO_H264_MAX_CHROMA_PLANES ][ STD_VIDEO_H264_MAX_NUM_LIST_REF ]  chroma_weight_l1;
    int8_t[ STD_VIDEO_H264_MAX_CHROMA_PLANES ][ STD_VIDEO_H264_MAX_NUM_LIST_REF ]  chroma_offset_l1;
}

struct StdVideoEncodeH264SliceHeaderFlags {
    mixin( bitfields!(
        uint32_t,  "direct_spatial_mv_pred_flag",      1,
        uint32_t,  "num_ref_idx_active_override_flag", 1,
        uint32_t,  "reserved",                         30,
    ));
}

struct StdVideoEncodeH264PictureInfoFlags {
    mixin( bitfields!(
        uint32_t,  "IdrPicFlag",                         1,
        uint32_t,  "is_reference",                       1,
        uint32_t,  "no_output_of_prior_pics_flag",       1,
        uint32_t,  "long_term_reference_flag",           1,
        uint32_t,  "adaptive_ref_pic_marking_mode_flag", 1,
        uint32_t,  "reserved",                           27,
    ));
}

struct StdVideoEncodeH264ReferenceInfoFlags {
    mixin( bitfields!(
        uint32_t,  "used_for_long_term_reference", 1,
        uint32_t,  "reserved",                     31,
    ));
}

struct StdVideoEncodeH264ReferenceListsInfoFlags {
    mixin( bitfields!(
        uint32_t,  "ref_pic_list_modification_flag_l0", 1,
        uint32_t,  "ref_pic_list_modification_flag_l1", 1,
        uint32_t,  "reserved",                          30,
    ));
}

struct StdVideoEncodeH264RefListModEntry {
    StdVideoH264ModificationOfPicNumsIdc  modification_of_pic_nums_idc;
    uint16_t                              abs_diff_pic_num_minus1;
    uint16_t                              long_term_pic_num;
}

struct StdVideoEncodeH264RefPicMarkingEntry {
    StdVideoH264MemMgmtControlOp  memory_management_control_operation;
    uint16_t                      difference_of_pic_nums_minus1;
    uint16_t                      long_term_pic_num;
    uint16_t                      long_term_frame_idx;
    uint16_t                      max_long_term_frame_idx_plus1;
}

struct StdVideoEncodeH264ReferenceListsInfo {
    StdVideoEncodeH264ReferenceListsInfoFlags       flags;
    uint8_t                                         num_ref_idx_l0_active_minus1;
    uint8_t                                         num_ref_idx_l1_active_minus1;
    uint8_t[ STD_VIDEO_H264_MAX_NUM_LIST_REF ]      RefPicList0;
    uint8_t[ STD_VIDEO_H264_MAX_NUM_LIST_REF ]      RefPicList1;
    uint8_t                                         refList0ModOpCount;
    uint8_t                                         refList1ModOpCount;
    uint8_t                                         refPicMarkingOpCount;
    uint8_t[7]                                      reserved1;
    const( StdVideoEncodeH264RefListModEntry )*     pRefList0ModOperations;
    const( StdVideoEncodeH264RefListModEntry )*     pRefList1ModOperations;
    const( StdVideoEncodeH264RefPicMarkingEntry )*  pRefPicMarkingOperations;
}

struct StdVideoEncodeH264PictureInfo {
    StdVideoEncodeH264PictureInfoFlags              flags;
    uint8_t                                         seq_parameter_set_id;
    uint8_t                                         pic_parameter_set_id;
    uint16_t                                        idr_pic_id;
    StdVideoH264PictureType                         primary_pic_type;
    uint32_t                                        frame_num;
    int32_t                                         PicOrderCnt;
    uint8_t                                         temporal_id;
    uint8_t[3]                                      reserved1;
    const( StdVideoEncodeH264ReferenceListsInfo )*  pRefLists;
}

struct StdVideoEncodeH264ReferenceInfo {
    StdVideoEncodeH264ReferenceInfoFlags  flags;
    StdVideoH264PictureType               primary_pic_type;
    uint32_t                              FrameNum;
    int32_t                               PicOrderCnt;
    uint16_t                              long_term_pic_num;
    uint16_t                              long_term_frame_idx;
    uint8_t                               temporal_id;
}

struct StdVideoEncodeH264SliceHeader {
    StdVideoEncodeH264SliceHeaderFlags       flags;
    uint32_t                                 first_mb_in_slice;
    StdVideoH264SliceType                    slice_type;
    int8_t                                   slice_alpha_c0_offset_div2;
    int8_t                                   slice_beta_offset_div2;
    int8_t                                   slice_qp_delta;
    uint8_t                                  reserved1;
    StdVideoH264CabacInitIdc                 cabac_init_idc;
    StdVideoH264DisableDeblockingFilterIdc   disable_deblocking_filter_idc;
    const( StdVideoEncodeH264WeightTable )*  pWeightTable;
}


// - vulkan_video_codec_h265std -
enum vulkan_video_codec_h265std = 1;

enum STD_VIDEO_H265_SUBLAYERS_LIST_SIZE = 7;
enum STD_VIDEO_H265_CPB_CNT_LIST_SIZE = 32;
enum STD_VIDEO_H265_SCALING_LIST_4X4_NUM_LISTS = 6;
enum STD_VIDEO_H265_SCALING_LIST_4X4_NUM_ELEMENTS = 16;
enum STD_VIDEO_H265_SCALING_LIST_8X8_NUM_LISTS = 6;
enum STD_VIDEO_H265_SCALING_LIST_8X8_NUM_ELEMENTS = 64;
enum STD_VIDEO_H265_SCALING_LIST_16X16_NUM_LISTS = 6;
enum STD_VIDEO_H265_SCALING_LIST_16X16_NUM_ELEMENTS = 64;
enum STD_VIDEO_H265_SCALING_LIST_32X32_NUM_LISTS = 2;
enum STD_VIDEO_H265_SCALING_LIST_32X32_NUM_ELEMENTS = 64;
enum STD_VIDEO_H265_PREDICTOR_PALETTE_COMPONENTS_LIST_SIZE = 3;
enum STD_VIDEO_H265_PREDICTOR_PALETTE_COMP_ENTRIES_LIST_SIZE = 128;
enum STD_VIDEO_H265_MAX_DPB_SIZE = 16;
enum STD_VIDEO_H265_MAX_LONG_TERM_REF_PICS_SPS = 32;
enum STD_VIDEO_H265_CHROMA_QP_OFFSET_LIST_SIZE = 6;
enum STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_COLS_LIST_SIZE = 19;
enum STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_ROWS_LIST_SIZE = 21;
enum STD_VIDEO_H265_MAX_NUM_LIST_REF = 15;
enum STD_VIDEO_H265_MAX_CHROMA_PLANES = 2;
enum STD_VIDEO_H265_MAX_SHORT_TERM_REF_PIC_SETS = 64;
enum STD_VIDEO_H265_MAX_LONG_TERM_PICS = 16;
enum STD_VIDEO_H265_MAX_DELTA_POC = 48;
enum STD_VIDEO_H265_NO_REFERENCE_PICTURE = 0xFF;

enum StdVideoH265ChromaFormatIdc {
    STD_VIDEO_H265_CHROMA_FORMAT_IDC_MONOCHROME  = 0,
    STD_VIDEO_H265_CHROMA_FORMAT_IDC_420         = 1,
    STD_VIDEO_H265_CHROMA_FORMAT_IDC_422         = 2,
    STD_VIDEO_H265_CHROMA_FORMAT_IDC_444         = 3,
    STD_VIDEO_H265_CHROMA_FORMAT_IDC_INVALID     = 0x7FFFFFFF,
    STD_VIDEO_H265_CHROMA_FORMAT_IDC_MAX_ENUM    = 0x7FFFFFFF
}

enum STD_VIDEO_H265_CHROMA_FORMAT_IDC_MONOCHROME = StdVideoH265ChromaFormatIdc.STD_VIDEO_H265_CHROMA_FORMAT_IDC_MONOCHROME;
enum STD_VIDEO_H265_CHROMA_FORMAT_IDC_420        = StdVideoH265ChromaFormatIdc.STD_VIDEO_H265_CHROMA_FORMAT_IDC_420;
enum STD_VIDEO_H265_CHROMA_FORMAT_IDC_422        = StdVideoH265ChromaFormatIdc.STD_VIDEO_H265_CHROMA_FORMAT_IDC_422;
enum STD_VIDEO_H265_CHROMA_FORMAT_IDC_444        = StdVideoH265ChromaFormatIdc.STD_VIDEO_H265_CHROMA_FORMAT_IDC_444;
enum STD_VIDEO_H265_CHROMA_FORMAT_IDC_INVALID    = StdVideoH265ChromaFormatIdc.STD_VIDEO_H265_CHROMA_FORMAT_IDC_INVALID;
enum STD_VIDEO_H265_CHROMA_FORMAT_IDC_MAX_ENUM   = StdVideoH265ChromaFormatIdc.STD_VIDEO_H265_CHROMA_FORMAT_IDC_MAX_ENUM;

enum StdVideoH265ProfileIdc {
    STD_VIDEO_H265_PROFILE_IDC_MAIN                      = 1,
    STD_VIDEO_H265_PROFILE_IDC_MAIN_10                   = 2,
    STD_VIDEO_H265_PROFILE_IDC_MAIN_STILL_PICTURE        = 3,
    STD_VIDEO_H265_PROFILE_IDC_FORMAT_RANGE_EXTENSIONS   = 4,
    STD_VIDEO_H265_PROFILE_IDC_SCC_EXTENSIONS            = 9,
    STD_VIDEO_H265_PROFILE_IDC_INVALID                   = 0x7FFFFFFF,
    STD_VIDEO_H265_PROFILE_IDC_MAX_ENUM                  = 0x7FFFFFFF
}

enum STD_VIDEO_H265_PROFILE_IDC_MAIN                     = StdVideoH265ProfileIdc.STD_VIDEO_H265_PROFILE_IDC_MAIN;
enum STD_VIDEO_H265_PROFILE_IDC_MAIN_10                  = StdVideoH265ProfileIdc.STD_VIDEO_H265_PROFILE_IDC_MAIN_10;
enum STD_VIDEO_H265_PROFILE_IDC_MAIN_STILL_PICTURE       = StdVideoH265ProfileIdc.STD_VIDEO_H265_PROFILE_IDC_MAIN_STILL_PICTURE;
enum STD_VIDEO_H265_PROFILE_IDC_FORMAT_RANGE_EXTENSIONS  = StdVideoH265ProfileIdc.STD_VIDEO_H265_PROFILE_IDC_FORMAT_RANGE_EXTENSIONS;
enum STD_VIDEO_H265_PROFILE_IDC_SCC_EXTENSIONS           = StdVideoH265ProfileIdc.STD_VIDEO_H265_PROFILE_IDC_SCC_EXTENSIONS;
enum STD_VIDEO_H265_PROFILE_IDC_INVALID                  = StdVideoH265ProfileIdc.STD_VIDEO_H265_PROFILE_IDC_INVALID;
enum STD_VIDEO_H265_PROFILE_IDC_MAX_ENUM                 = StdVideoH265ProfileIdc.STD_VIDEO_H265_PROFILE_IDC_MAX_ENUM;

enum StdVideoH265LevelIdc {
    STD_VIDEO_H265_LEVEL_IDC_1_0         = 0,
    STD_VIDEO_H265_LEVEL_IDC_2_0         = 1,
    STD_VIDEO_H265_LEVEL_IDC_2_1         = 2,
    STD_VIDEO_H265_LEVEL_IDC_3_0         = 3,
    STD_VIDEO_H265_LEVEL_IDC_3_1         = 4,
    STD_VIDEO_H265_LEVEL_IDC_4_0         = 5,
    STD_VIDEO_H265_LEVEL_IDC_4_1         = 6,
    STD_VIDEO_H265_LEVEL_IDC_5_0         = 7,
    STD_VIDEO_H265_LEVEL_IDC_5_1         = 8,
    STD_VIDEO_H265_LEVEL_IDC_5_2         = 9,
    STD_VIDEO_H265_LEVEL_IDC_6_0         = 10,
    STD_VIDEO_H265_LEVEL_IDC_6_1         = 11,
    STD_VIDEO_H265_LEVEL_IDC_6_2         = 12,
    STD_VIDEO_H265_LEVEL_IDC_INVALID     = 0x7FFFFFFF,
    STD_VIDEO_H265_LEVEL_IDC_MAX_ENUM    = 0x7FFFFFFF
}

enum STD_VIDEO_H265_LEVEL_IDC_1_0        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_1_0;
enum STD_VIDEO_H265_LEVEL_IDC_2_0        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_2_0;
enum STD_VIDEO_H265_LEVEL_IDC_2_1        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_2_1;
enum STD_VIDEO_H265_LEVEL_IDC_3_0        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_3_0;
enum STD_VIDEO_H265_LEVEL_IDC_3_1        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_3_1;
enum STD_VIDEO_H265_LEVEL_IDC_4_0        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_4_0;
enum STD_VIDEO_H265_LEVEL_IDC_4_1        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_4_1;
enum STD_VIDEO_H265_LEVEL_IDC_5_0        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_5_0;
enum STD_VIDEO_H265_LEVEL_IDC_5_1        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_5_1;
enum STD_VIDEO_H265_LEVEL_IDC_5_2        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_5_2;
enum STD_VIDEO_H265_LEVEL_IDC_6_0        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_6_0;
enum STD_VIDEO_H265_LEVEL_IDC_6_1        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_6_1;
enum STD_VIDEO_H265_LEVEL_IDC_6_2        = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_6_2;
enum STD_VIDEO_H265_LEVEL_IDC_INVALID    = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_INVALID;
enum STD_VIDEO_H265_LEVEL_IDC_MAX_ENUM   = StdVideoH265LevelIdc.STD_VIDEO_H265_LEVEL_IDC_MAX_ENUM;

enum StdVideoH265SliceType {
    STD_VIDEO_H265_SLICE_TYPE_B          = 0,
    STD_VIDEO_H265_SLICE_TYPE_P          = 1,
    STD_VIDEO_H265_SLICE_TYPE_I          = 2,
    STD_VIDEO_H265_SLICE_TYPE_INVALID    = 0x7FFFFFFF,
    STD_VIDEO_H265_SLICE_TYPE_MAX_ENUM   = 0x7FFFFFFF
}

enum STD_VIDEO_H265_SLICE_TYPE_B         = StdVideoH265SliceType.STD_VIDEO_H265_SLICE_TYPE_B;
enum STD_VIDEO_H265_SLICE_TYPE_P         = StdVideoH265SliceType.STD_VIDEO_H265_SLICE_TYPE_P;
enum STD_VIDEO_H265_SLICE_TYPE_I         = StdVideoH265SliceType.STD_VIDEO_H265_SLICE_TYPE_I;
enum STD_VIDEO_H265_SLICE_TYPE_INVALID   = StdVideoH265SliceType.STD_VIDEO_H265_SLICE_TYPE_INVALID;
enum STD_VIDEO_H265_SLICE_TYPE_MAX_ENUM  = StdVideoH265SliceType.STD_VIDEO_H265_SLICE_TYPE_MAX_ENUM;

enum StdVideoH265PictureType {
    STD_VIDEO_H265_PICTURE_TYPE_P        = 0,
    STD_VIDEO_H265_PICTURE_TYPE_B        = 1,
    STD_VIDEO_H265_PICTURE_TYPE_I        = 2,
    STD_VIDEO_H265_PICTURE_TYPE_IDR      = 3,
    STD_VIDEO_H265_PICTURE_TYPE_INVALID  = 0x7FFFFFFF,
    STD_VIDEO_H265_PICTURE_TYPE_MAX_ENUM = 0x7FFFFFFF
}

enum STD_VIDEO_H265_PICTURE_TYPE_P       = StdVideoH265PictureType.STD_VIDEO_H265_PICTURE_TYPE_P;
enum STD_VIDEO_H265_PICTURE_TYPE_B       = StdVideoH265PictureType.STD_VIDEO_H265_PICTURE_TYPE_B;
enum STD_VIDEO_H265_PICTURE_TYPE_I       = StdVideoH265PictureType.STD_VIDEO_H265_PICTURE_TYPE_I;
enum STD_VIDEO_H265_PICTURE_TYPE_IDR     = StdVideoH265PictureType.STD_VIDEO_H265_PICTURE_TYPE_IDR;
enum STD_VIDEO_H265_PICTURE_TYPE_INVALID = StdVideoH265PictureType.STD_VIDEO_H265_PICTURE_TYPE_INVALID;
enum STD_VIDEO_H265_PICTURE_TYPE_MAX_ENUM = StdVideoH265PictureType.STD_VIDEO_H265_PICTURE_TYPE_MAX_ENUM;

enum StdVideoH265AspectRatioIdc {
    STD_VIDEO_H265_ASPECT_RATIO_IDC_UNSPECIFIED          = 0,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_SQUARE               = 1,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_12_11                = 2,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_10_11                = 3,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_16_11                = 4,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_40_33                = 5,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_24_11                = 6,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_20_11                = 7,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_32_11                = 8,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_80_33                = 9,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_18_11                = 10,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_15_11                = 11,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_64_33                = 12,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_160_99               = 13,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_4_3                  = 14,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_3_2                  = 15,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_2_1                  = 16,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_EXTENDED_SAR         = 255,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_INVALID              = 0x7FFFFFFF,
    STD_VIDEO_H265_ASPECT_RATIO_IDC_MAX_ENUM             = 0x7FFFFFFF
}

enum STD_VIDEO_H265_ASPECT_RATIO_IDC_UNSPECIFIED         = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_UNSPECIFIED;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_SQUARE              = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_SQUARE;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_12_11               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_12_11;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_10_11               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_10_11;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_16_11               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_16_11;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_40_33               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_40_33;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_24_11               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_24_11;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_20_11               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_20_11;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_32_11               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_32_11;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_80_33               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_80_33;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_18_11               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_18_11;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_15_11               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_15_11;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_64_33               = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_64_33;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_160_99              = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_160_99;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_4_3                 = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_4_3;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_3_2                 = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_3_2;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_2_1                 = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_2_1;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_EXTENDED_SAR        = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_EXTENDED_SAR;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_INVALID             = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_INVALID;
enum STD_VIDEO_H265_ASPECT_RATIO_IDC_MAX_ENUM            = StdVideoH265AspectRatioIdc.STD_VIDEO_H265_ASPECT_RATIO_IDC_MAX_ENUM;

struct StdVideoH265DecPicBufMgr {
    uint32_t[ STD_VIDEO_H265_SUBLAYERS_LIST_SIZE ]  max_latency_increase_plus1;
    uint8_t[ STD_VIDEO_H265_SUBLAYERS_LIST_SIZE ]   max_dec_pic_buffering_minus1;
    uint8_t[ STD_VIDEO_H265_SUBLAYERS_LIST_SIZE ]   max_num_reorder_pics;
}

struct StdVideoH265SubLayerHrdParameters {
    uint32_t[ STD_VIDEO_H265_CPB_CNT_LIST_SIZE ]  bit_rate_value_minus1;
    uint32_t[ STD_VIDEO_H265_CPB_CNT_LIST_SIZE ]  cpb_size_value_minus1;
    uint32_t[ STD_VIDEO_H265_CPB_CNT_LIST_SIZE ]  cpb_size_du_value_minus1;
    uint32_t[ STD_VIDEO_H265_CPB_CNT_LIST_SIZE ]  bit_rate_du_value_minus1;
    uint32_t                                      cbr_flag;
}

struct StdVideoH265HrdFlags {
    mixin( bitfields!(
        uint32_t, "nal_hrd_parameters_present_flag",           1,
        uint32_t, "vcl_hrd_parameters_present_flag",           1,
        uint32_t, "sub_pic_hrd_params_present_flag",           1,
        uint32_t, "sub_pic_cpb_params_in_pic_timing_sei_flag", 1,
        uint32_t, "fixed_pic_rate_general_flag",               8,
        uint32_t, "fixed_pic_rate_within_cvs_flag",            8,
        uint32_t, "low_delay_hrd_flag",                        8,
        uint32_t, "",                                          4,
    ));
}

struct StdVideoH265HrdParameters {
    StdVideoH265HrdFlags                            flags;
    uint8_t                                         tick_divisor_minus2;
    uint8_t                                         du_cpb_removal_delay_increment_length_minus1;
    uint8_t                                         dpb_output_delay_du_length_minus1;
    uint8_t                                         bit_rate_scale;
    uint8_t                                         cpb_size_scale;
    uint8_t                                         cpb_size_du_scale;
    uint8_t                                         initial_cpb_removal_delay_length_minus1;
    uint8_t                                         au_cpb_removal_delay_length_minus1;
    uint8_t                                         dpb_output_delay_length_minus1;
    uint8_t[ STD_VIDEO_H265_SUBLAYERS_LIST_SIZE ]   cpb_cnt_minus1;
    uint16_t[ STD_VIDEO_H265_SUBLAYERS_LIST_SIZE ]  elemental_duration_in_tc_minus1;
    uint16_t[3]                                     reserved;
    const( StdVideoH265SubLayerHrdParameters )*     pSubLayerHrdParametersNal;
    const( StdVideoH265SubLayerHrdParameters )*     pSubLayerHrdParametersVcl;
}

struct StdVideoH265VpsFlags {
    mixin( bitfields!(
        uint32_t, "vps_temporal_id_nesting_flag",             1,
        uint32_t, "vps_sub_layer_ordering_info_present_flag", 1,
        uint32_t, "vps_timing_info_present_flag",             1,
        uint32_t, "vps_poc_proportional_to_timing_flag",      1,
        uint32_t, "",                                         28,
    ));
}

struct StdVideoH265ProfileTierLevelFlags {
    mixin( bitfields!(
        uint32_t, "general_tier_flag",                  1,
        uint32_t, "general_progressive_source_flag",    1,
        uint32_t, "general_interlaced_source_flag",     1,
        uint32_t, "general_non_packed_constraint_flag", 1,
        uint32_t, "general_frame_only_constraint_flag", 1,
        uint32_t, "",                                   27,
    ));
}

struct StdVideoH265ProfileTierLevel {
    StdVideoH265ProfileTierLevelFlags  flags;
    StdVideoH265ProfileIdc             general_profile_idc;
    StdVideoH265LevelIdc               general_level_idc;
}

struct StdVideoH265VideoParameterSet {
    StdVideoH265VpsFlags                    flags;
    uint8_t                                 vps_video_parameter_set_id;
    uint8_t                                 vps_max_sub_layers_minus1;
    uint8_t                                 reserved1;
    uint8_t                                 reserved2;
    uint32_t                                vps_num_units_in_tick;
    uint32_t                                vps_time_scale;
    uint32_t                                vps_num_ticks_poc_diff_one_minus1;
    uint32_t                                reserved3;
    const( StdVideoH265DecPicBufMgr )*      pDecPicBufMgr;
    const( StdVideoH265HrdParameters )*     pHrdParameters;
    const( StdVideoH265ProfileTierLevel )*  pProfileTierLevel;
}

struct StdVideoH265ScalingLists {
    uint8_t[ STD_VIDEO_H265_SCALING_LIST_4X4_NUM_ELEMENTS ][ STD_VIDEO_H265_SCALING_LIST_4X4_NUM_LISTS ]      ScalingList4x4;
    uint8_t[ STD_VIDEO_H265_SCALING_LIST_8X8_NUM_ELEMENTS ][ STD_VIDEO_H265_SCALING_LIST_8X8_NUM_LISTS ]      ScalingList8x8;
    uint8_t[ STD_VIDEO_H265_SCALING_LIST_16X16_NUM_ELEMENTS ][ STD_VIDEO_H265_SCALING_LIST_16X16_NUM_LISTS ]  ScalingList16x16;
    uint8_t[ STD_VIDEO_H265_SCALING_LIST_32X32_NUM_ELEMENTS ][ STD_VIDEO_H265_SCALING_LIST_32X32_NUM_LISTS ]  ScalingList32x32;
    uint8_t[ STD_VIDEO_H265_SCALING_LIST_16X16_NUM_LISTS ]                                                    ScalingListDCCoef16x16;
    uint8_t[ STD_VIDEO_H265_SCALING_LIST_32X32_NUM_LISTS ]                                                    ScalingListDCCoef32x32;
}

struct StdVideoH265SpsVuiFlags {
    mixin( bitfields!(
        uint32_t, "aspect_ratio_info_present_flag",          1,
        uint32_t, "overscan_info_present_flag",              1,
        uint32_t, "overscan_appropriate_flag",               1,
        uint32_t, "video_signal_type_present_flag",          1,
        uint32_t, "video_full_range_flag",                   1,
        uint32_t, "colour_description_present_flag",         1,
        uint32_t, "chroma_loc_info_present_flag",            1,
        uint32_t, "neutral_chroma_indication_flag",          1,
        uint32_t, "field_seq_flag",                          1,
        uint32_t, "frame_field_info_present_flag",           1,
        uint32_t, "default_display_window_flag",             1,
        uint32_t, "vui_timing_info_present_flag",            1,
        uint32_t, "vui_poc_proportional_to_timing_flag",     1,
        uint32_t, "vui_hrd_parameters_present_flag",         1,
        uint32_t, "bitstream_restriction_flag",              1,
        uint32_t, "tiles_fixed_structure_flag",              1,
        uint32_t, "motion_vectors_over_pic_boundaries_flag", 1,
        uint32_t, "restricted_ref_pic_lists_flag",           1,
        uint32_t, "",                                        14,
    ));
}

struct StdVideoH265SequenceParameterSetVui {
    StdVideoH265SpsVuiFlags              flags;
    StdVideoH265AspectRatioIdc           aspect_ratio_idc;
    uint16_t                             sar_width;
    uint16_t                             sar_height;
    uint8_t                              video_format;
    uint8_t                              colour_primaries;
    uint8_t                              transfer_characteristics;
    uint8_t                              matrix_coeffs;
    uint8_t                              chroma_sample_loc_type_top_field;
    uint8_t                              chroma_sample_loc_type_bottom_field;
    uint8_t                              reserved1;
    uint8_t                              reserved2;
    uint16_t                             def_disp_win_left_offset;
    uint16_t                             def_disp_win_right_offset;
    uint16_t                             def_disp_win_top_offset;
    uint16_t                             def_disp_win_bottom_offset;
    uint32_t                             vui_num_units_in_tick;
    uint32_t                             vui_time_scale;
    uint32_t                             vui_num_ticks_poc_diff_one_minus1;
    uint16_t                             min_spatial_segmentation_idc;
    uint16_t                             reserved3;
    uint8_t                              max_bytes_per_pic_denom;
    uint8_t                              max_bits_per_min_cu_denom;
    uint8_t                              log2_max_mv_length_horizontal;
    uint8_t                              log2_max_mv_length_vertical;
    const( StdVideoH265HrdParameters )*  pHrdParameters;
}

struct StdVideoH265PredictorPaletteEntries {
    uint16_t[ STD_VIDEO_H265_PREDICTOR_PALETTE_COMP_ENTRIES_LIST_SIZE ][ STD_VIDEO_H265_PREDICTOR_PALETTE_COMPONENTS_LIST_SIZE ]  PredictorPaletteEntries;
}

struct StdVideoH265SpsFlags {
    mixin( bitfields!(
        uint32_t, "sps_temporal_id_nesting_flag",                    1,
        uint32_t, "separate_colour_plane_flag",                      1,
        uint32_t, "conformance_window_flag",                         1,
        uint32_t, "sps_sub_layer_ordering_info_present_flag",        1,
        uint32_t, "scaling_list_enabled_flag",                       1,
        uint32_t, "sps_scaling_list_data_present_flag",              1,
        uint32_t, "amp_enabled_flag",                                1,
        uint32_t, "sample_adaptive_offset_enabled_flag",             1,
        uint32_t, "pcm_enabled_flag",                                1,
        uint32_t, "pcm_loop_filter_disabled_flag",                   1,
        uint32_t, "long_term_ref_pics_present_flag",                 1,
        uint32_t, "sps_temporal_mvp_enabled_flag",                   1,
        uint32_t, "strong_intra_smoothing_enabled_flag",             1,
        uint32_t, "vui_parameters_present_flag",                     1,
        uint32_t, "sps_extension_present_flag",                      1,
        uint32_t, "sps_range_extension_flag",                        1,
        uint32_t, "transform_skip_rotation_enabled_flag",            1,
        uint32_t, "transform_skip_context_enabled_flag",             1,
        uint32_t, "implicit_rdpcm_enabled_flag",                     1,
        uint32_t, "explicit_rdpcm_enabled_flag",                     1,
        uint32_t, "extended_precision_processing_flag",              1,
        uint32_t, "intra_smoothing_disabled_flag",                   1,
        uint32_t, "high_precision_offsets_enabled_flag",             1,
        uint32_t, "persistent_rice_adaptation_enabled_flag",         1,
        uint32_t, "cabac_bypass_alignment_enabled_flag",             1,
        uint32_t, "sps_scc_extension_flag",                          1,
        uint32_t, "sps_curr_pic_ref_enabled_flag",                   1,
        uint32_t, "palette_mode_enabled_flag",                       1,
        uint32_t, "sps_palette_predictor_initializers_present_flag", 1,
        uint32_t, "intra_boundary_filtering_disabled_flag",          1,
        uint32_t, "",                                                2,
    ));
}

struct StdVideoH265ShortTermRefPicSetFlags {
    mixin( bitfields!(
        uint32_t, "inter_ref_pic_set_prediction_flag", 1,
        uint32_t, "delta_rps_sign",                    1,
        uint32_t, "",                                  30,
    ));
}

struct StdVideoH265ShortTermRefPicSet {
    StdVideoH265ShortTermRefPicSetFlags      flags;
    uint32_t                                 delta_idx_minus1;
    uint16_t                                 use_delta_flag;
    uint16_t                                 abs_delta_rps_minus1;
    uint16_t                                 used_by_curr_pic_flag;
    uint16_t                                 used_by_curr_pic_s0_flag;
    uint16_t                                 used_by_curr_pic_s1_flag;
    uint16_t                                 reserved1;
    uint8_t                                  reserved2;
    uint8_t                                  reserved3;
    uint8_t                                  num_negative_pics;
    uint8_t                                  num_positive_pics;
    uint16_t[ STD_VIDEO_H265_MAX_DPB_SIZE ]  delta_poc_s0_minus1;
    uint16_t[ STD_VIDEO_H265_MAX_DPB_SIZE ]  delta_poc_s1_minus1;
}

struct StdVideoH265LongTermRefPicsSps {
    uint32_t                                               used_by_curr_pic_lt_sps_flag;
    uint32_t[ STD_VIDEO_H265_MAX_LONG_TERM_REF_PICS_SPS ]  lt_ref_pic_poc_lsb_sps;
}

struct StdVideoH265SequenceParameterSet {
    StdVideoH265SpsFlags                           flags;
    StdVideoH265ChromaFormatIdc                    chroma_format_idc;
    uint32_t                                       pic_width_in_luma_samples;
    uint32_t                                       pic_height_in_luma_samples;
    uint8_t                                        sps_video_parameter_set_id;
    uint8_t                                        sps_max_sub_layers_minus1;
    uint8_t                                        sps_seq_parameter_set_id;
    uint8_t                                        bit_depth_luma_minus8;
    uint8_t                                        bit_depth_chroma_minus8;
    uint8_t                                        log2_max_pic_order_cnt_lsb_minus4;
    uint8_t                                        log2_min_luma_coding_block_size_minus3;
    uint8_t                                        log2_diff_max_min_luma_coding_block_size;
    uint8_t                                        log2_min_luma_transform_block_size_minus2;
    uint8_t                                        log2_diff_max_min_luma_transform_block_size;
    uint8_t                                        max_transform_hierarchy_depth_inter;
    uint8_t                                        max_transform_hierarchy_depth_intra;
    uint8_t                                        num_short_term_ref_pic_sets;
    uint8_t                                        num_long_term_ref_pics_sps;
    uint8_t                                        pcm_sample_bit_depth_luma_minus1;
    uint8_t                                        pcm_sample_bit_depth_chroma_minus1;
    uint8_t                                        log2_min_pcm_luma_coding_block_size_minus3;
    uint8_t                                        log2_diff_max_min_pcm_luma_coding_block_size;
    uint8_t                                        reserved1;
    uint8_t                                        reserved2;
    uint8_t                                        palette_max_size;
    uint8_t                                        delta_palette_max_predictor_size;
    uint8_t                                        motion_vector_resolution_control_idc;
    uint8_t                                        sps_num_palette_predictor_initializers_minus1;
    uint32_t                                       conf_win_left_offset;
    uint32_t                                       conf_win_right_offset;
    uint32_t                                       conf_win_top_offset;
    uint32_t                                       conf_win_bottom_offset;
    const( StdVideoH265ProfileTierLevel )*         pProfileTierLevel;
    const( StdVideoH265DecPicBufMgr )*             pDecPicBufMgr;
    const( StdVideoH265ScalingLists )*             pScalingLists;
    const( StdVideoH265ShortTermRefPicSet )*       pShortTermRefPicSet;
    const( StdVideoH265LongTermRefPicsSps )*       pLongTermRefPicsSps;
    const( StdVideoH265SequenceParameterSetVui )*  pSequenceParameterSetVui;
    const( StdVideoH265PredictorPaletteEntries )*  pPredictorPaletteEntries;
}

struct StdVideoH265PpsFlags {
    mixin( bitfields!(
        uint32_t, "dependent_slice_segments_enabled_flag",           1,
        uint32_t, "output_flag_present_flag",                        1,
        uint32_t, "sign_data_hiding_enabled_flag",                   1,
        uint32_t, "cabac_init_present_flag",                         1,
        uint32_t, "constrained_intra_pred_flag",                     1,
        uint32_t, "transform_skip_enabled_flag",                     1,
        uint32_t, "cu_qp_delta_enabled_flag",                        1,
        uint32_t, "pps_slice_chroma_qp_offsets_present_flag",        1,
        uint32_t, "weighted_pred_flag",                              1,
        uint32_t, "weighted_bipred_flag",                            1,
        uint32_t, "transquant_bypass_enabled_flag",                  1,
        uint32_t, "tiles_enabled_flag",                              1,
        uint32_t, "entropy_coding_sync_enabled_flag",                1,
        uint32_t, "uniform_spacing_flag",                            1,
        uint32_t, "loop_filter_across_tiles_enabled_flag",           1,
        uint32_t, "pps_loop_filter_across_slices_enabled_flag",      1,
        uint32_t, "deblocking_filter_control_present_flag",          1,
        uint32_t, "deblocking_filter_override_enabled_flag",         1,
        uint32_t, "pps_deblocking_filter_disabled_flag",             1,
        uint32_t, "pps_scaling_list_data_present_flag",              1,
        uint32_t, "lists_modification_present_flag",                 1,
        uint32_t, "slice_segment_header_extension_present_flag",     1,
        uint32_t, "pps_extension_present_flag",                      1,
        uint32_t, "cross_component_prediction_enabled_flag",         1,
        uint32_t, "chroma_qp_offset_list_enabled_flag",              1,
        uint32_t, "pps_curr_pic_ref_enabled_flag",                   1,
        uint32_t, "residual_adaptive_colour_transform_enabled_flag", 1,
        uint32_t, "pps_slice_act_qp_offsets_present_flag",           1,
        uint32_t, "pps_palette_predictor_initializers_present_flag", 1,
        uint32_t, "monochrome_palette_flag",                         1,
        uint32_t, "pps_range_extension_flag",                        1,
        uint32_t, "",                                                1,
    ));
}

struct StdVideoH265PictureParameterSet {
    StdVideoH265PpsFlags                                             flags;
    uint8_t                                                          pps_pic_parameter_set_id;
    uint8_t                                                          pps_seq_parameter_set_id;
    uint8_t                                                          sps_video_parameter_set_id;
    uint8_t                                                          num_extra_slice_header_bits;
    uint8_t                                                          num_ref_idx_l0_default_active_minus1;
    uint8_t                                                          num_ref_idx_l1_default_active_minus1;
    int8_t                                                           init_qp_minus26;
    uint8_t                                                          diff_cu_qp_delta_depth;
    int8_t                                                           pps_cb_qp_offset;
    int8_t                                                           pps_cr_qp_offset;
    int8_t                                                           pps_beta_offset_div2;
    int8_t                                                           pps_tc_offset_div2;
    uint8_t                                                          log2_parallel_merge_level_minus2;
    uint8_t                                                          log2_max_transform_skip_block_size_minus2;
    uint8_t                                                          diff_cu_chroma_qp_offset_depth;
    uint8_t                                                          chroma_qp_offset_list_len_minus1;
    int8_t[ STD_VIDEO_H265_CHROMA_QP_OFFSET_LIST_SIZE ]              cb_qp_offset_list;
    int8_t[ STD_VIDEO_H265_CHROMA_QP_OFFSET_LIST_SIZE ]              cr_qp_offset_list;
    uint8_t                                                          log2_sao_offset_scale_luma;
    uint8_t                                                          log2_sao_offset_scale_chroma;
    int8_t                                                           pps_act_y_qp_offset_plus5;
    int8_t                                                           pps_act_cb_qp_offset_plus5;
    int8_t                                                           pps_act_cr_qp_offset_plus3;
    uint8_t                                                          pps_num_palette_predictor_initializers;
    uint8_t                                                          luma_bit_depth_entry_minus8;
    uint8_t                                                          chroma_bit_depth_entry_minus8;
    uint8_t                                                          num_tile_columns_minus1;
    uint8_t                                                          num_tile_rows_minus1;
    uint8_t                                                          reserved1;
    uint8_t                                                          reserved2;
    uint16_t[ STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_COLS_LIST_SIZE ]  column_width_minus1;
    uint16_t[ STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_ROWS_LIST_SIZE ]  row_height_minus1;
    uint32_t                                                         reserved3;
    const( StdVideoH265ScalingLists )*                               pScalingLists;
    const( StdVideoH265PredictorPaletteEntries )*                    pPredictorPaletteEntries;
}


// - vulkan_video_codec_h265std_decode -
enum vulkan_video_codec_h265std_decode = 1;

enum VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_API_VERSION_1_0_0 = VK_MAKE_VIDEO_STD_VERSION( 1, 0, 0 );

enum STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE = 8;
enum VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_API_VERSION_1_0_0;
enum const( char )* VK_STD_VULKAN_VIDEO_CODEC_H265_DECODE_EXTENSION_NAME = "VK_STD_vulkan_video_codec_h265_decode";

struct StdVideoDecodeH265PictureInfoFlags {
    mixin( bitfields!(
        uint32_t, "IrapPicFlag",                     1,
        uint32_t, "IdrPicFlag",                      1,
        uint32_t, "IsReference",                     1,
        uint32_t, "short_term_ref_pic_set_sps_flag", 1,
        uint32_t, "",                                28,
    ));
}

struct StdVideoDecodeH265PictureInfo {
    StdVideoDecodeH265PictureInfoFlags                      flags;
    uint8_t                                                 sps_video_parameter_set_id;
    uint8_t                                                 pps_seq_parameter_set_id;
    uint8_t                                                 pps_pic_parameter_set_id;
    uint8_t                                                 NumDeltaPocsOfRefRpsIdx;
    int32_t                                                 PicOrderCntVal;
    uint16_t                                                NumBitsForSTRefPicSetInSlice;
    uint16_t                                                reserved;
    uint8_t[ STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE ]  RefPicSetStCurrBefore;
    uint8_t[ STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE ]  RefPicSetStCurrAfter;
    uint8_t[ STD_VIDEO_DECODE_H265_REF_PIC_SET_LIST_SIZE ]  RefPicSetLtCurr;
}

struct StdVideoDecodeH265ReferenceInfoFlags {
    mixin( bitfields!(
        uint32_t, "used_for_long_term_reference", 1,
        uint32_t, "unused_for_reference",         1,
        uint32_t, "",                             30,
    ));
}

struct StdVideoDecodeH265ReferenceInfo {
    StdVideoDecodeH265ReferenceInfoFlags  flags;
    int32_t                               PicOrderCntVal;
}


// - vulkan_video_codec_h265std_encode -
enum vulkan_video_codec_h265std_encode = 1;

enum VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_API_VERSION_1_0_0 = VK_MAKE_VIDEO_STD_VERSION( 1, 0, 0 );

enum VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_API_VERSION_1_0_0;
enum const( char )* VK_STD_VULKAN_VIDEO_CODEC_H265_ENCODE_EXTENSION_NAME = "VK_STD_vulkan_video_codec_h265_encode";

struct StdVideoEncodeH265WeightTableFlags {
    uint16_t  luma_weight_l0_flag;
    uint16_t  chroma_weight_l0_flag;
    uint16_t  luma_weight_l1_flag;
    uint16_t  chroma_weight_l1_flag;
}

struct StdVideoEncodeH265WeightTable {
    StdVideoEncodeH265WeightTableFlags                                             flags;
    uint8_t                                                                        luma_log2_weight_denom;
    int8_t                                                                         delta_chroma_log2_weight_denom;
    int8_t[ STD_VIDEO_H265_MAX_NUM_LIST_REF ]                                      delta_luma_weight_l0;
    int8_t[ STD_VIDEO_H265_MAX_NUM_LIST_REF ]                                      luma_offset_l0;
    int8_t[ STD_VIDEO_H265_MAX_CHROMA_PLANES ][ STD_VIDEO_H265_MAX_NUM_LIST_REF ]  delta_chroma_weight_l0;
    int8_t[ STD_VIDEO_H265_MAX_CHROMA_PLANES ][ STD_VIDEO_H265_MAX_NUM_LIST_REF ]  delta_chroma_offset_l0;
    int8_t[ STD_VIDEO_H265_MAX_NUM_LIST_REF ]                                      delta_luma_weight_l1;
    int8_t[ STD_VIDEO_H265_MAX_NUM_LIST_REF ]                                      luma_offset_l1;
    int8_t[ STD_VIDEO_H265_MAX_CHROMA_PLANES ][ STD_VIDEO_H265_MAX_NUM_LIST_REF ]  delta_chroma_weight_l1;
    int8_t[ STD_VIDEO_H265_MAX_CHROMA_PLANES ][ STD_VIDEO_H265_MAX_NUM_LIST_REF ]  delta_chroma_offset_l1;
}

struct StdVideoEncodeH265SliceSegmentHeaderFlags {
    mixin( bitfields!(
        uint32_t,  "first_slice_segment_in_pic_flag",              1,
        uint32_t,  "dependent_slice_segment_flag",                 1,
        uint32_t,  "slice_sao_luma_flag",                          1,
        uint32_t,  "slice_sao_chroma_flag",                        1,
        uint32_t,  "num_ref_idx_active_override_flag",             1,
        uint32_t,  "mvd_l1_zero_flag",                             1,
        uint32_t,  "cabac_init_flag",                              1,
        uint32_t,  "cu_chroma_qp_offset_enabled_flag",             1,
        uint32_t,  "deblocking_filter_override_flag",              1,
        uint32_t,  "slice_deblocking_filter_disabled_flag",        1,
        uint32_t,  "collocated_from_l0_flag",                      1,
        uint32_t,  "slice_loop_filter_across_slices_enabled_flag", 1,
        uint32_t,  "reserved",                                     20,
    ));
}

struct StdVideoEncodeH265SliceSegmentHeader {
    StdVideoEncodeH265SliceSegmentHeaderFlags  flags;
    StdVideoH265SliceType                      slice_type;
    uint32_t                                   slice_segment_address;
    uint8_t                                    collocated_ref_idx;
    uint8_t                                    MaxNumMergeCand;
    int8_t                                     slice_cb_qp_offset;
    int8_t                                     slice_cr_qp_offset;
    int8_t                                     slice_beta_offset_div2;
    int8_t                                     slice_tc_offset_div2;
    int8_t                                     slice_act_y_qp_offset;
    int8_t                                     slice_act_cb_qp_offset;
    int8_t                                     slice_act_cr_qp_offset;
    int8_t                                     slice_qp_delta;
    uint16_t                                   reserved1;
    const( StdVideoEncodeH265WeightTable )*    pWeightTable;
}

struct StdVideoEncodeH265ReferenceListsInfoFlags {
    mixin( bitfields!(
        uint32_t,  "ref_pic_list_modification_flag_l0", 1,
        uint32_t,  "ref_pic_list_modification_flag_l1", 1,
        uint32_t,  "reserved",                          30,
    ));
}

struct StdVideoEncodeH265ReferenceListsInfo {
    StdVideoEncodeH265ReferenceListsInfoFlags   flags;
    uint8_t                                     num_ref_idx_l0_active_minus1;
    uint8_t                                     num_ref_idx_l1_active_minus1;
    uint8_t[ STD_VIDEO_H265_MAX_NUM_LIST_REF ]  RefPicList0;
    uint8_t[ STD_VIDEO_H265_MAX_NUM_LIST_REF ]  RefPicList1;
    uint8_t[ STD_VIDEO_H265_MAX_NUM_LIST_REF ]  list_entry_l0;
    uint8_t[ STD_VIDEO_H265_MAX_NUM_LIST_REF ]  list_entry_l1;
}

struct StdVideoEncodeH265PictureInfoFlags {
    mixin( bitfields!(
        uint32_t,  "is_reference",                    1,
        uint32_t,  "IrapPicFlag",                     1,
        uint32_t,  "used_for_long_term_reference",    1,
        uint32_t,  "discardable_flag",                1,
        uint32_t,  "cross_layer_bla_flag",            1,
        uint32_t,  "pic_output_flag",                 1,
        uint32_t,  "no_output_of_prior_pics_flag",    1,
        uint32_t,  "short_term_ref_pic_set_sps_flag", 1,
        uint32_t,  "slice_temporal_mvp_enabled_flag", 1,
        uint32_t,  "reserved",                        23,
    ));
}

struct StdVideoEncodeH265LongTermRefPics {
    uint8_t                                               num_long_term_sps;
    uint8_t                                               num_long_term_pics;
    uint8_t[ STD_VIDEO_H265_MAX_LONG_TERM_REF_PICS_SPS ]  lt_idx_sps;
    uint8_t[ STD_VIDEO_H265_MAX_LONG_TERM_PICS ]          poc_lsb_lt;
    uint16_t                                              used_by_curr_pic_lt_flag;
    uint8_t[ STD_VIDEO_H265_MAX_DELTA_POC ]               delta_poc_msb_present_flag;
    uint8_t[ STD_VIDEO_H265_MAX_DELTA_POC ]               delta_poc_msb_cycle_lt;
}

struct StdVideoEncodeH265PictureInfo {
    StdVideoEncodeH265PictureInfoFlags              flags;
    StdVideoH265PictureType                         pic_type;
    uint8_t                                         sps_video_parameter_set_id;
    uint8_t                                         pps_seq_parameter_set_id;
    uint8_t                                         pps_pic_parameter_set_id;
    uint8_t                                         short_term_ref_pic_set_idx;
    int32_t                                         PicOrderCntVal;
    uint8_t                                         TemporalId;
    uint8_t[7]                                      reserved1;
    const( StdVideoEncodeH265ReferenceListsInfo )*  pRefLists;
    const( StdVideoH265ShortTermRefPicSet )*        pShortTermRefPicSet;
    const( StdVideoEncodeH265LongTermRefPics )*     pLongTermRefPics;
}

struct StdVideoEncodeH265ReferenceInfoFlags {
    mixin( bitfields!(
        uint32_t,  "used_for_long_term_reference", 1,
        uint32_t,  "unused_for_reference",         1,
        uint32_t,  "reserved",                     30,
    ));
}

struct StdVideoEncodeH265ReferenceInfo {
    StdVideoEncodeH265ReferenceInfoFlags  flags;
    StdVideoH265PictureType               pic_type;
    int32_t                               PicOrderCntVal;
    uint8_t                               TemporalId;
}


// - vulkan_video_codec_av1std -
enum vulkan_video_codec_av1std = 1;

enum STD_VIDEO_AV1_MAX_LOOP_FILTER_STRENGTHS = 4;
enum STD_VIDEO_AV1_TOTAL_REFS_PER_FRAME = 8;
enum STD_VIDEO_AV1_LOOP_FILTER_ADJUSTMENTS = 2;
enum STD_VIDEO_AV1_MAX_SEGMENTS = 8;
enum STD_VIDEO_AV1_SEG_LVL_MAX = 8;
enum STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS = 8;
enum STD_VIDEO_AV1_MAX_NUM_PLANES = 3;
enum STD_VIDEO_AV1_NUM_REF_FRAMES = 8;
enum STD_VIDEO_AV1_GLOBAL_MOTION_PARAMS = 6;
enum STD_VIDEO_AV1_MAX_NUM_Y_POINTS = 14;
enum STD_VIDEO_AV1_MAX_NUM_CB_POINTS = 10;
enum STD_VIDEO_AV1_MAX_NUM_CR_POINTS = 10;
enum STD_VIDEO_AV1_MAX_NUM_POS_LUMA = 24;
enum STD_VIDEO_AV1_MAX_NUM_POS_CHROMA = 25;
enum STD_VIDEO_AV1_REFS_PER_FRAME = 7;
enum STD_VIDEO_AV1_MAX_TILE_COLS = 64;
enum STD_VIDEO_AV1_MAX_TILE_ROWS = 64;
enum STD_VIDEO_AV1_PRIMARY_REF_NONE = 7;
enum STD_VIDEO_AV1_SELECT_INTEGER_MV = 2;
enum STD_VIDEO_AV1_SELECT_SCREEN_CONTENT_TOOLS = 2;
enum STD_VIDEO_AV1_SKIP_MODE_FRAMES = 2;

enum StdVideoAV1Profile {
    STD_VIDEO_AV1_PROFILE_MAIN           = 0,
    STD_VIDEO_AV1_PROFILE_HIGH           = 1,
    STD_VIDEO_AV1_PROFILE_PROFESSIONAL   = 2,
    STD_VIDEO_AV1_PROFILE_INVALID        = 0x7FFFFFFF,
    STD_VIDEO_AV1_PROFILE_MAX_ENUM       = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_PROFILE_MAIN          = StdVideoAV1Profile.STD_VIDEO_AV1_PROFILE_MAIN;
enum STD_VIDEO_AV1_PROFILE_HIGH          = StdVideoAV1Profile.STD_VIDEO_AV1_PROFILE_HIGH;
enum STD_VIDEO_AV1_PROFILE_PROFESSIONAL  = StdVideoAV1Profile.STD_VIDEO_AV1_PROFILE_PROFESSIONAL;
enum STD_VIDEO_AV1_PROFILE_INVALID       = StdVideoAV1Profile.STD_VIDEO_AV1_PROFILE_INVALID;
enum STD_VIDEO_AV1_PROFILE_MAX_ENUM      = StdVideoAV1Profile.STD_VIDEO_AV1_PROFILE_MAX_ENUM;

enum StdVideoAV1Level {
    STD_VIDEO_AV1_LEVEL_2_0      = 0,
    STD_VIDEO_AV1_LEVEL_2_1      = 1,
    STD_VIDEO_AV1_LEVEL_2_2      = 2,
    STD_VIDEO_AV1_LEVEL_2_3      = 3,
    STD_VIDEO_AV1_LEVEL_3_0      = 4,
    STD_VIDEO_AV1_LEVEL_3_1      = 5,
    STD_VIDEO_AV1_LEVEL_3_2      = 6,
    STD_VIDEO_AV1_LEVEL_3_3      = 7,
    STD_VIDEO_AV1_LEVEL_4_0      = 8,
    STD_VIDEO_AV1_LEVEL_4_1      = 9,
    STD_VIDEO_AV1_LEVEL_4_2      = 10,
    STD_VIDEO_AV1_LEVEL_4_3      = 11,
    STD_VIDEO_AV1_LEVEL_5_0      = 12,
    STD_VIDEO_AV1_LEVEL_5_1      = 13,
    STD_VIDEO_AV1_LEVEL_5_2      = 14,
    STD_VIDEO_AV1_LEVEL_5_3      = 15,
    STD_VIDEO_AV1_LEVEL_6_0      = 16,
    STD_VIDEO_AV1_LEVEL_6_1      = 17,
    STD_VIDEO_AV1_LEVEL_6_2      = 18,
    STD_VIDEO_AV1_LEVEL_6_3      = 19,
    STD_VIDEO_AV1_LEVEL_7_0      = 20,
    STD_VIDEO_AV1_LEVEL_7_1      = 21,
    STD_VIDEO_AV1_LEVEL_7_2      = 22,
    STD_VIDEO_AV1_LEVEL_7_3      = 23,
    STD_VIDEO_AV1_LEVEL_INVALID  = 0x7FFFFFFF,
    STD_VIDEO_AV1_LEVEL_MAX_ENUM = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_LEVEL_2_0     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_2_0;
enum STD_VIDEO_AV1_LEVEL_2_1     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_2_1;
enum STD_VIDEO_AV1_LEVEL_2_2     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_2_2;
enum STD_VIDEO_AV1_LEVEL_2_3     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_2_3;
enum STD_VIDEO_AV1_LEVEL_3_0     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_3_0;
enum STD_VIDEO_AV1_LEVEL_3_1     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_3_1;
enum STD_VIDEO_AV1_LEVEL_3_2     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_3_2;
enum STD_VIDEO_AV1_LEVEL_3_3     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_3_3;
enum STD_VIDEO_AV1_LEVEL_4_0     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_4_0;
enum STD_VIDEO_AV1_LEVEL_4_1     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_4_1;
enum STD_VIDEO_AV1_LEVEL_4_2     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_4_2;
enum STD_VIDEO_AV1_LEVEL_4_3     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_4_3;
enum STD_VIDEO_AV1_LEVEL_5_0     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_5_0;
enum STD_VIDEO_AV1_LEVEL_5_1     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_5_1;
enum STD_VIDEO_AV1_LEVEL_5_2     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_5_2;
enum STD_VIDEO_AV1_LEVEL_5_3     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_5_3;
enum STD_VIDEO_AV1_LEVEL_6_0     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_6_0;
enum STD_VIDEO_AV1_LEVEL_6_1     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_6_1;
enum STD_VIDEO_AV1_LEVEL_6_2     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_6_2;
enum STD_VIDEO_AV1_LEVEL_6_3     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_6_3;
enum STD_VIDEO_AV1_LEVEL_7_0     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_7_0;
enum STD_VIDEO_AV1_LEVEL_7_1     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_7_1;
enum STD_VIDEO_AV1_LEVEL_7_2     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_7_2;
enum STD_VIDEO_AV1_LEVEL_7_3     = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_7_3;
enum STD_VIDEO_AV1_LEVEL_INVALID = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_INVALID;
enum STD_VIDEO_AV1_LEVEL_MAX_ENUM = StdVideoAV1Level.STD_VIDEO_AV1_LEVEL_MAX_ENUM;

enum StdVideoAV1FrameType {
    STD_VIDEO_AV1_FRAME_TYPE_KEY         = 0,
    STD_VIDEO_AV1_FRAME_TYPE_INTER       = 1,
    STD_VIDEO_AV1_FRAME_TYPE_INTRA_ONLY  = 2,
    STD_VIDEO_AV1_FRAME_TYPE_SWITCH      = 3,
    STD_VIDEO_AV1_FRAME_TYPE_INVALID     = 0x7FFFFFFF,
    STD_VIDEO_AV1_FRAME_TYPE_MAX_ENUM    = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_FRAME_TYPE_KEY        = StdVideoAV1FrameType.STD_VIDEO_AV1_FRAME_TYPE_KEY;
enum STD_VIDEO_AV1_FRAME_TYPE_INTER      = StdVideoAV1FrameType.STD_VIDEO_AV1_FRAME_TYPE_INTER;
enum STD_VIDEO_AV1_FRAME_TYPE_INTRA_ONLY = StdVideoAV1FrameType.STD_VIDEO_AV1_FRAME_TYPE_INTRA_ONLY;
enum STD_VIDEO_AV1_FRAME_TYPE_SWITCH     = StdVideoAV1FrameType.STD_VIDEO_AV1_FRAME_TYPE_SWITCH;
enum STD_VIDEO_AV1_FRAME_TYPE_INVALID    = StdVideoAV1FrameType.STD_VIDEO_AV1_FRAME_TYPE_INVALID;
enum STD_VIDEO_AV1_FRAME_TYPE_MAX_ENUM   = StdVideoAV1FrameType.STD_VIDEO_AV1_FRAME_TYPE_MAX_ENUM;

enum StdVideoAV1ReferenceName {
    STD_VIDEO_AV1_REFERENCE_NAME_INTRA_FRAME     = 0,
    STD_VIDEO_AV1_REFERENCE_NAME_LAST_FRAME      = 1,
    STD_VIDEO_AV1_REFERENCE_NAME_LAST2_FRAME     = 2,
    STD_VIDEO_AV1_REFERENCE_NAME_LAST3_FRAME     = 3,
    STD_VIDEO_AV1_REFERENCE_NAME_GOLDEN_FRAME    = 4,
    STD_VIDEO_AV1_REFERENCE_NAME_BWDREF_FRAME    = 5,
    STD_VIDEO_AV1_REFERENCE_NAME_ALTREF2_FRAME   = 6,
    STD_VIDEO_AV1_REFERENCE_NAME_ALTREF_FRAME    = 7,
    STD_VIDEO_AV1_REFERENCE_NAME_INVALID         = 0x7FFFFFFF,
    STD_VIDEO_AV1_REFERENCE_NAME_MAX_ENUM        = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_REFERENCE_NAME_INTRA_FRAME    = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_INTRA_FRAME;
enum STD_VIDEO_AV1_REFERENCE_NAME_LAST_FRAME     = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_LAST_FRAME;
enum STD_VIDEO_AV1_REFERENCE_NAME_LAST2_FRAME    = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_LAST2_FRAME;
enum STD_VIDEO_AV1_REFERENCE_NAME_LAST3_FRAME    = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_LAST3_FRAME;
enum STD_VIDEO_AV1_REFERENCE_NAME_GOLDEN_FRAME   = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_GOLDEN_FRAME;
enum STD_VIDEO_AV1_REFERENCE_NAME_BWDREF_FRAME   = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_BWDREF_FRAME;
enum STD_VIDEO_AV1_REFERENCE_NAME_ALTREF2_FRAME  = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_ALTREF2_FRAME;
enum STD_VIDEO_AV1_REFERENCE_NAME_ALTREF_FRAME   = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_ALTREF_FRAME;
enum STD_VIDEO_AV1_REFERENCE_NAME_INVALID        = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_INVALID;
enum STD_VIDEO_AV1_REFERENCE_NAME_MAX_ENUM       = StdVideoAV1ReferenceName.STD_VIDEO_AV1_REFERENCE_NAME_MAX_ENUM;

enum StdVideoAV1InterpolationFilter {
    STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP          = 0,
    STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH   = 1,
    STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP    = 2,
    STD_VIDEO_AV1_INTERPOLATION_FILTER_BILINEAR          = 3,
    STD_VIDEO_AV1_INTERPOLATION_FILTER_SWITCHABLE        = 4,
    STD_VIDEO_AV1_INTERPOLATION_FILTER_INVALID           = 0x7FFFFFFF,
    STD_VIDEO_AV1_INTERPOLATION_FILTER_MAX_ENUM          = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP         = StdVideoAV1InterpolationFilter.STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP;
enum STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH  = StdVideoAV1InterpolationFilter.STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH;
enum STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP   = StdVideoAV1InterpolationFilter.STD_VIDEO_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP;
enum STD_VIDEO_AV1_INTERPOLATION_FILTER_BILINEAR         = StdVideoAV1InterpolationFilter.STD_VIDEO_AV1_INTERPOLATION_FILTER_BILINEAR;
enum STD_VIDEO_AV1_INTERPOLATION_FILTER_SWITCHABLE       = StdVideoAV1InterpolationFilter.STD_VIDEO_AV1_INTERPOLATION_FILTER_SWITCHABLE;
enum STD_VIDEO_AV1_INTERPOLATION_FILTER_INVALID          = StdVideoAV1InterpolationFilter.STD_VIDEO_AV1_INTERPOLATION_FILTER_INVALID;
enum STD_VIDEO_AV1_INTERPOLATION_FILTER_MAX_ENUM         = StdVideoAV1InterpolationFilter.STD_VIDEO_AV1_INTERPOLATION_FILTER_MAX_ENUM;

enum StdVideoAV1TxMode {
    STD_VIDEO_AV1_TX_MODE_ONLY_4X4       = 0,
    STD_VIDEO_AV1_TX_MODE_LARGEST        = 1,
    STD_VIDEO_AV1_TX_MODE_SELECT         = 2,
    STD_VIDEO_AV1_TX_MODE_INVALID        = 0x7FFFFFFF,
    STD_VIDEO_AV1_TX_MODE_MAX_ENUM       = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_TX_MODE_ONLY_4X4      = StdVideoAV1TxMode.STD_VIDEO_AV1_TX_MODE_ONLY_4X4;
enum STD_VIDEO_AV1_TX_MODE_LARGEST       = StdVideoAV1TxMode.STD_VIDEO_AV1_TX_MODE_LARGEST;
enum STD_VIDEO_AV1_TX_MODE_SELECT        = StdVideoAV1TxMode.STD_VIDEO_AV1_TX_MODE_SELECT;
enum STD_VIDEO_AV1_TX_MODE_INVALID       = StdVideoAV1TxMode.STD_VIDEO_AV1_TX_MODE_INVALID;
enum STD_VIDEO_AV1_TX_MODE_MAX_ENUM      = StdVideoAV1TxMode.STD_VIDEO_AV1_TX_MODE_MAX_ENUM;

enum StdVideoAV1FrameRestorationType {
    STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_NONE            = 0,
    STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_WIENER          = 1,
    STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_SGRPROJ         = 2,
    STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_SWITCHABLE      = 3,
    STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_INVALID         = 0x7FFFFFFF,
    STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_MAX_ENUM        = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_NONE           = StdVideoAV1FrameRestorationType.STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_NONE;
enum STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_WIENER         = StdVideoAV1FrameRestorationType.STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_WIENER;
enum STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_SGRPROJ        = StdVideoAV1FrameRestorationType.STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_SGRPROJ;
enum STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_SWITCHABLE     = StdVideoAV1FrameRestorationType.STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_SWITCHABLE;
enum STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_INVALID        = StdVideoAV1FrameRestorationType.STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_INVALID;
enum STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_MAX_ENUM       = StdVideoAV1FrameRestorationType.STD_VIDEO_AV1_FRAME_RESTORATION_TYPE_MAX_ENUM;

enum StdVideoAV1ColorPrimaries {
    STD_VIDEO_AV1_COLOR_PRIMARIES_BT_709                 = 1,
    STD_VIDEO_AV1_COLOR_PRIMARIES_UNSPECIFIED            = 2,
    STD_VIDEO_AV1_COLOR_PRIMARIES_BT_470_M               = 4,
    STD_VIDEO_AV1_COLOR_PRIMARIES_BT_470_B_G             = 5,
    STD_VIDEO_AV1_COLOR_PRIMARIES_BT_601                 = 6,
    STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_240              = 7,
    STD_VIDEO_AV1_COLOR_PRIMARIES_GENERIC_FILM           = 8,
    STD_VIDEO_AV1_COLOR_PRIMARIES_BT_2020                = 9,
    STD_VIDEO_AV1_COLOR_PRIMARIES_XYZ                    = 10,
    STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_431              = 11,
    STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_432              = 12,
    STD_VIDEO_AV1_COLOR_PRIMARIES_EBU_3213               = 22,
    STD_VIDEO_AV1_COLOR_PRIMARIES_INVALID                = 0x7FFFFFFF,
    STD_VIDEO_AV1_COLOR_PRIMARIES_BT_UNSPECIFIED         = STD_VIDEO_AV1_COLOR_PRIMARIES_UNSPECIFIED,
    STD_VIDEO_AV1_COLOR_PRIMARIES_MAX_ENUM               = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_COLOR_PRIMARIES_BT_709                = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_BT_709;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_UNSPECIFIED           = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_UNSPECIFIED;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_BT_470_M              = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_BT_470_M;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_BT_470_B_G            = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_BT_470_B_G;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_BT_601                = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_BT_601;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_240             = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_240;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_GENERIC_FILM          = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_GENERIC_FILM;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_BT_2020               = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_BT_2020;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_XYZ                   = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_XYZ;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_431             = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_431;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_432             = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_SMPTE_432;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_EBU_3213              = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_EBU_3213;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_INVALID               = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_INVALID;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_BT_UNSPECIFIED        = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_BT_UNSPECIFIED;
enum STD_VIDEO_AV1_COLOR_PRIMARIES_MAX_ENUM              = StdVideoAV1ColorPrimaries.STD_VIDEO_AV1_COLOR_PRIMARIES_MAX_ENUM;

enum StdVideoAV1TransferCharacteristics {
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_RESERVED_0            = 0,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_709                = 1,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_UNSPECIFIED           = 2,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_RESERVED_3            = 3,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_470_M              = 4,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_470_B_G            = 5,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_601                = 6,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_240             = 7,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LINEAR                = 8,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LOG_100               = 9,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LOG_100_SQRT10        = 10,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_IEC_61966             = 11,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_1361               = 12,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SRGB                  = 13,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_2020_10_BIT        = 14,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_2020_12_BIT        = 15,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_2084            = 16,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_428             = 17,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_HLG                   = 18,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_INVALID               = 0x7FFFFFFF,
    STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_MAX_ENUM              = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_RESERVED_0           = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_RESERVED_0;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_709               = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_709;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_UNSPECIFIED          = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_UNSPECIFIED;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_RESERVED_3           = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_RESERVED_3;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_470_M             = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_470_M;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_470_B_G           = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_470_B_G;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_601               = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_601;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_240            = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_240;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LINEAR               = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LINEAR;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LOG_100              = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LOG_100;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LOG_100_SQRT10       = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_LOG_100_SQRT10;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_IEC_61966            = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_IEC_61966;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_1361              = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_1361;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SRGB                 = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SRGB;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_2020_10_BIT       = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_2020_10_BIT;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_2020_12_BIT       = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_BT_2020_12_BIT;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_2084           = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_2084;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_428            = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_SMPTE_428;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_HLG                  = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_HLG;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_INVALID              = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_INVALID;
enum STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_MAX_ENUM             = StdVideoAV1TransferCharacteristics.STD_VIDEO_AV1_TRANSFER_CHARACTERISTICS_MAX_ENUM;

enum StdVideoAV1MatrixCoefficients {
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_IDENTITY           = 0,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_709             = 1,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_UNSPECIFIED        = 2,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_RESERVED_3         = 3,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_FCC                = 4,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_470_B_G         = 5,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_601             = 6,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_240          = 7,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_YCGCO        = 8,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_2020_NCL        = 9,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_2020_CL         = 10,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_2085         = 11,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_CHROMAT_NCL        = 12,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_CHROMAT_CL         = 13,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_ICTCP              = 14,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_INVALID            = 0x7FFFFFFF,
    STD_VIDEO_AV1_MATRIX_COEFFICIENTS_MAX_ENUM           = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_IDENTITY          = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_IDENTITY;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_709            = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_709;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_UNSPECIFIED       = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_UNSPECIFIED;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_RESERVED_3        = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_RESERVED_3;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_FCC               = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_FCC;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_470_B_G        = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_470_B_G;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_601            = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_601;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_240         = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_240;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_YCGCO       = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_YCGCO;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_2020_NCL       = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_2020_NCL;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_2020_CL        = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_BT_2020_CL;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_2085        = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_SMPTE_2085;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_CHROMAT_NCL       = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_CHROMAT_NCL;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_CHROMAT_CL        = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_CHROMAT_CL;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_ICTCP             = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_ICTCP;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_INVALID           = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_INVALID;
enum STD_VIDEO_AV1_MATRIX_COEFFICIENTS_MAX_ENUM          = StdVideoAV1MatrixCoefficients.STD_VIDEO_AV1_MATRIX_COEFFICIENTS_MAX_ENUM;

enum StdVideoAV1ChromaSamplePosition {
    STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_UNKNOWN         = 0,
    STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_VERTICAL        = 1,
    STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_COLOCATED       = 2,
    STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_RESERVED        = 3,
    STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_INVALID         = 0x7FFFFFFF,
    STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_MAX_ENUM        = 0x7FFFFFFF
}

enum STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_UNKNOWN        = StdVideoAV1ChromaSamplePosition.STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_UNKNOWN;
enum STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_VERTICAL       = StdVideoAV1ChromaSamplePosition.STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_VERTICAL;
enum STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_COLOCATED      = StdVideoAV1ChromaSamplePosition.STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_COLOCATED;
enum STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_RESERVED       = StdVideoAV1ChromaSamplePosition.STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_RESERVED;
enum STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_INVALID        = StdVideoAV1ChromaSamplePosition.STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_INVALID;
enum STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_MAX_ENUM       = StdVideoAV1ChromaSamplePosition.STD_VIDEO_AV1_CHROMA_SAMPLE_POSITION_MAX_ENUM;

struct StdVideoAV1ColorConfigFlags {
    mixin( bitfields!(
        uint32_t,  "mono_chrome",                    1,
        uint32_t,  "color_range",                    1,
        uint32_t,  "separate_uv_delta_q",            1,
        uint32_t,  "color_description_present_flag", 1,
        uint32_t,  "reserved",                       28,
    ));
}

struct StdVideoAV1ColorConfig {
    StdVideoAV1ColorConfigFlags         flags;
    uint8_t                             BitDepth;
    uint8_t                             subsampling_x;
    uint8_t                             subsampling_y;
    uint8_t                             reserved1;
    StdVideoAV1ColorPrimaries           color_primaries;
    StdVideoAV1TransferCharacteristics  transfer_characteristics;
    StdVideoAV1MatrixCoefficients       matrix_coefficients;
    StdVideoAV1ChromaSamplePosition     chroma_sample_position;
}

struct StdVideoAV1TimingInfoFlags {
    mixin( bitfields!(
        uint32_t,  "equal_picture_interval", 1,
        uint32_t,  "reserved",               31,
    ));
}

struct StdVideoAV1TimingInfo {
    StdVideoAV1TimingInfoFlags  flags;
    uint32_t                    num_units_in_display_tick;
    uint32_t                    time_scale;
    uint32_t                    num_ticks_per_picture_minus_1;
}

struct StdVideoAV1LoopFilterFlags {
    mixin( bitfields!(
        uint32_t,  "loop_filter_delta_enabled", 1,
        uint32_t,  "loop_filter_delta_update",  1,
        uint32_t,  "reserved",                  30,
    ));
}

struct StdVideoAV1LoopFilter {
    StdVideoAV1LoopFilterFlags                          flags;
    uint8_t[ STD_VIDEO_AV1_MAX_LOOP_FILTER_STRENGTHS ]  loop_filter_level;
    uint8_t                                             loop_filter_sharpness;
    uint8_t                                             update_ref_delta;
    int8_t[ STD_VIDEO_AV1_TOTAL_REFS_PER_FRAME ]        loop_filter_ref_deltas;
    uint8_t                                             update_mode_delta;
    int8_t[ STD_VIDEO_AV1_LOOP_FILTER_ADJUSTMENTS ]     loop_filter_mode_deltas;
}

struct StdVideoAV1QuantizationFlags {
    mixin( bitfields!(
        uint32_t,  "using_qmatrix", 1,
        uint32_t,  "diff_uv_delta", 1,
        uint32_t,  "reserved",      30,
    ));
}

struct StdVideoAV1Quantization {
    StdVideoAV1QuantizationFlags  flags;
    uint8_t                       base_q_idx;
    int8_t                        DeltaQYDc;
    int8_t                        DeltaQUDc;
    int8_t                        DeltaQUAc;
    int8_t                        DeltaQVDc;
    int8_t                        DeltaQVAc;
    uint8_t                       qm_y;
    uint8_t                       qm_u;
    uint8_t                       qm_v;
}

struct StdVideoAV1Segmentation {
    uint8_t[ STD_VIDEO_AV1_MAX_SEGMENTS ]                               FeatureEnabled;
    int16_t[ STD_VIDEO_AV1_SEG_LVL_MAX ][ STD_VIDEO_AV1_MAX_SEGMENTS ]  FeatureData;
}

struct StdVideoAV1TileInfoFlags {
    mixin( bitfields!(
        uint32_t,  "uniform_tile_spacing_flag", 1,
        uint32_t,  "reserved",                  31,
    ));
}

struct StdVideoAV1TileInfo {
    StdVideoAV1TileInfoFlags  flags;
    uint8_t                   TileCols;
    uint8_t                   TileRows;
    uint16_t                  context_update_tile_id;
    uint8_t                   tile_size_bytes_minus_1;
    uint8_t[7]                reserved1;
    const( uint16_t )*        pMiColStarts;
    const( uint16_t )*        pMiRowStarts;
    const( uint16_t )*        pWidthInSbsMinus1;
    const( uint16_t )*        pHeightInSbsMinus1;
}

struct StdVideoAV1CDEF {
    uint8_t                                             cdef_damping_minus_3;
    uint8_t                                             cdef_bits;
    uint8_t[ STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS ]  cdef_y_pri_strength;
    uint8_t[ STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS ]  cdef_y_sec_strength;
    uint8_t[ STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS ]  cdef_uv_pri_strength;
    uint8_t[ STD_VIDEO_AV1_MAX_CDEF_FILTER_STRENGTHS ]  cdef_uv_sec_strength;
}

struct StdVideoAV1LoopRestoration {
    StdVideoAV1FrameRestorationType[ STD_VIDEO_AV1_MAX_NUM_PLANES ]  FrameRestorationType;
    uint16_t[ STD_VIDEO_AV1_MAX_NUM_PLANES ]                         LoopRestorationSize;
}

struct StdVideoAV1GlobalMotion {
    uint8_t[ STD_VIDEO_AV1_NUM_REF_FRAMES ]                                        GmType;
    int32_t[ STD_VIDEO_AV1_GLOBAL_MOTION_PARAMS ][ STD_VIDEO_AV1_NUM_REF_FRAMES ]  gm_params;
}

struct StdVideoAV1FilmGrainFlags {
    mixin( bitfields!(
        uint32_t,  "chroma_scaling_from_luma", 1,
        uint32_t,  "overlap_flag",             1,
        uint32_t,  "clip_to_restricted_range", 1,
        uint32_t,  "update_grain",             1,
        uint32_t,  "reserved",                 28,
    ));
}

struct StdVideoAV1FilmGrain {
    StdVideoAV1FilmGrainFlags                   flags;
    uint8_t                                     grain_scaling_minus_8;
    uint8_t                                     ar_coeff_lag;
    uint8_t                                     ar_coeff_shift_minus_6;
    uint8_t                                     grain_scale_shift;
    uint16_t                                    grain_seed;
    uint8_t                                     film_grain_params_ref_idx;
    uint8_t                                     num_y_points;
    uint8_t[ STD_VIDEO_AV1_MAX_NUM_Y_POINTS ]   point_y_value;
    uint8_t[ STD_VIDEO_AV1_MAX_NUM_Y_POINTS ]   point_y_scaling;
    uint8_t                                     num_cb_points;
    uint8_t[ STD_VIDEO_AV1_MAX_NUM_CB_POINTS ]  point_cb_value;
    uint8_t[ STD_VIDEO_AV1_MAX_NUM_CB_POINTS ]  point_cb_scaling;
    uint8_t                                     num_cr_points;
    uint8_t[ STD_VIDEO_AV1_MAX_NUM_CR_POINTS ]  point_cr_value;
    uint8_t[ STD_VIDEO_AV1_MAX_NUM_CR_POINTS ]  point_cr_scaling;
    int8_t[ STD_VIDEO_AV1_MAX_NUM_POS_LUMA ]    ar_coeffs_y_plus_128;
    int8_t[ STD_VIDEO_AV1_MAX_NUM_POS_CHROMA ]  ar_coeffs_cb_plus_128;
    int8_t[ STD_VIDEO_AV1_MAX_NUM_POS_CHROMA ]  ar_coeffs_cr_plus_128;
    uint8_t                                     cb_mult;
    uint8_t                                     cb_luma_mult;
    uint16_t                                    cb_offset;
    uint8_t                                     cr_mult;
    uint8_t                                     cr_luma_mult;
    uint16_t                                    cr_offset;
}

struct StdVideoAV1SequenceHeaderFlags {
    mixin( bitfields!(
        uint32_t,  "still_picture",                      1,
        uint32_t,  "reduced_still_picture_header",       1,
        uint32_t,  "use_128x128_superblock",             1,
        uint32_t,  "enable_filter_intra",                1,
        uint32_t,  "enable_intra_edge_filter",           1,
        uint32_t,  "enable_interintra_compound",         1,
        uint32_t,  "enable_masked_compound",             1,
        uint32_t,  "enable_warped_motion",               1,
        uint32_t,  "enable_dual_filter",                 1,
        uint32_t,  "enable_order_hint",                  1,
        uint32_t,  "enable_jnt_comp",                    1,
        uint32_t,  "enable_ref_frame_mvs",               1,
        uint32_t,  "frame_id_numbers_present_flag",      1,
        uint32_t,  "enable_superres",                    1,
        uint32_t,  "enable_cdef",                        1,
        uint32_t,  "enable_restoration",                 1,
        uint32_t,  "film_grain_params_present",          1,
        uint32_t,  "timing_info_present_flag",           1,
        uint32_t,  "initial_display_delay_present_flag", 1,
        uint32_t,  "reserved",                           13,
    ));
}

struct StdVideoAV1SequenceHeader {
    StdVideoAV1SequenceHeaderFlags    flags;
    StdVideoAV1Profile                seq_profile;
    uint8_t                           frame_width_bits_minus_1;
    uint8_t                           frame_height_bits_minus_1;
    uint16_t                          max_frame_width_minus_1;
    uint16_t                          max_frame_height_minus_1;
    uint8_t                           delta_frame_id_length_minus_2;
    uint8_t                           additional_frame_id_length_minus_1;
    uint8_t                           order_hint_bits_minus_1;
    uint8_t                           seq_force_integer_mv;
    uint8_t                           seq_force_screen_content_tools;
    uint8_t[5]                        reserved1;
    const( StdVideoAV1ColorConfig )*  pColorConfig;
    const( StdVideoAV1TimingInfo )*   pTimingInfo;
}


// - vulkan_video_codec_av1std_decode -
enum vulkan_video_codec_av1std_decode = 1;

enum VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_API_VERSION_1_0_0 = VK_MAKE_VIDEO_STD_VERSION( 1, 0, 0 );

enum VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_API_VERSION_1_0_0;
enum const( char )* VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_EXTENSION_NAME = "VK_STD_vulkan_video_codec_av1_decode";

struct StdVideoDecodeAV1PictureInfoFlags {
    mixin( bitfields!(
        uint32_t, "error_resilient_mode",             1,
        uint32_t, "disable_cdf_update",               1,
        uint32_t, "use_superres",                     1,
        uint32_t, "render_and_frame_size_different",  1,
        uint32_t, "allow_screen_content_tools",       1,
        uint32_t, "is_filter_switchable",             1,
        uint32_t, "force_integer_mv",                 1,
        uint32_t, "frame_size_override_flag",         1,
        uint32_t, "buffer_removal_time_present_flag", 1,
        uint32_t, "allow_intrabc",                    1,
        uint32_t, "frame_refs_short_signaling",       1,
        uint32_t, "allow_high_precision_mv",          1,
        uint32_t, "is_motion_mode_switchable",        1,
        uint32_t, "use_ref_frame_mvs",                1,
        uint32_t, "disable_frame_end_update_cdf",     1,
        uint32_t, "allow_warped_motion",              1,
        uint32_t, "reduced_tx_set",                   1,
        uint32_t, "reference_select",                 1,
        uint32_t, "skip_mode_present",                1,
        uint32_t, "delta_q_present",                  1,
        uint32_t, "delta_lf_present",                 1,
        uint32_t, "delta_lf_multi",                   1,
        uint32_t, "segmentation_enabled",             1,
        uint32_t, "segmentation_update_map",          1,
        uint32_t, "segmentation_temporal_update",     1,
        uint32_t, "segmentation_update_data",         1,
        uint32_t, "UsesLr",                           1,
        uint32_t, "usesChromaLr",                     1,
        uint32_t, "apply_grain",                      1,
        uint32_t, "reserved",                         3,
    ));
}

struct StdVideoDecodeAV1PictureInfo {
    StdVideoDecodeAV1PictureInfoFlags          flags;
    StdVideoAV1FrameType                       frame_type;
    uint32_t                                   current_frame_id;
    uint8_t                                    OrderHint;
    uint8_t                                    primary_ref_frame;
    uint8_t                                    refresh_frame_flags;
    uint8_t                                    reserved1;
    StdVideoAV1InterpolationFilter             interpolation_filter;
    StdVideoAV1TxMode                          TxMode;
    uint8_t                                    delta_q_res;
    uint8_t                                    delta_lf_res;
    uint8_t[ STD_VIDEO_AV1_SKIP_MODE_FRAMES ]  SkipModeFrame;
    uint8_t                                    coded_denom;
    uint8_t[3]                                 reserved2;
    uint8_t[ STD_VIDEO_AV1_NUM_REF_FRAMES ]    OrderHints;
    uint32_t[ STD_VIDEO_AV1_NUM_REF_FRAMES ]   expectedFrameId;
    const( StdVideoAV1TileInfo )*              pTileInfo;
    const( StdVideoAV1Quantization )*          pQuantization;
    const( StdVideoAV1Segmentation )*          pSegmentation;
    const( StdVideoAV1LoopFilter )*            pLoopFilter;
    const( StdVideoAV1CDEF )*                  pCDEF;
    const( StdVideoAV1LoopRestoration )*       pLoopRestoration;
    const( StdVideoAV1GlobalMotion )*          pGlobalMotion;
    const( StdVideoAV1FilmGrain )*             pFilmGrain;
}

struct StdVideoDecodeAV1ReferenceInfoFlags {
    mixin( bitfields!(
        uint32_t,  "disable_frame_end_update_cdf", 1,
        uint32_t,  "segmentation_enabled",         1,
        uint32_t,  "reserved",                     30,
    ));
}

struct StdVideoDecodeAV1ReferenceInfo {
    StdVideoDecodeAV1ReferenceInfoFlags      flags;
    uint8_t                                  frame_type;
    uint8_t                                  RefFrameSignBias;
    uint8_t                                  OrderHint;
    uint8_t[ STD_VIDEO_AV1_NUM_REF_FRAMES ]  SavedOrderHints;
}


// - vulkan_video_codec_av1std_encode -
enum vulkan_video_codec_av1std_encode = 1;

enum VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_API_VERSION_1_0_0 = VK_MAKE_VIDEO_STD_VERSION( 1, 0, 0 );

enum VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_API_VERSION_1_0_0;
enum const( char )* VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_EXTENSION_NAME = "VK_STD_vulkan_video_codec_av1_encode";

struct StdVideoEncodeAV1DecoderModelInfo {
    uint8_t   buffer_delay_length_minus_1;
    uint8_t   buffer_removal_time_length_minus_1;
    uint8_t   frame_presentation_time_length_minus_1;
    uint8_t   reserved1;
    uint32_t  num_units_in_decoding_tick;
}

struct StdVideoEncodeAV1ExtensionHeader {
    uint8_t  temporal_id;
    uint8_t  spatial_id;
}

struct StdVideoEncodeAV1OperatingPointInfoFlags {
    mixin( bitfields!(
        uint32_t,  "decoder_model_present_for_this_op",         1,
        uint32_t,  "low_delay_mode_flag",                       1,
        uint32_t,  "initial_display_delay_present_for_this_op", 1,
        uint32_t,  "reserved",                                  29,
    ));
}

struct StdVideoEncodeAV1OperatingPointInfo {
    StdVideoEncodeAV1OperatingPointInfoFlags  flags;
    uint16_t                                  operating_point_idc;
    uint8_t                                   seq_level_idx;
    uint8_t                                   seq_tier;
    uint32_t                                  decoder_buffer_delay;
    uint32_t                                  encoder_buffer_delay;
    uint8_t                                   initial_display_delay_minus_1;
}

struct StdVideoEncodeAV1PictureInfoFlags {
    mixin( bitfields!(
        uint32_t, "error_resilient_mode",             1,
        uint32_t, "disable_cdf_update",               1,
        uint32_t, "use_superres",                     1,
        uint32_t, "render_and_frame_size_different",  1,
        uint32_t, "allow_screen_content_tools",       1,
        uint32_t, "is_filter_switchable",             1,
        uint32_t, "force_integer_mv",                 1,
        uint32_t, "frame_size_override_flag",         1,
        uint32_t, "buffer_removal_time_present_flag", 1,
        uint32_t, "allow_intrabc",                    1,
        uint32_t, "frame_refs_short_signaling",       1,
        uint32_t, "allow_high_precision_mv",          1,
        uint32_t, "is_motion_mode_switchable",        1,
        uint32_t, "use_ref_frame_mvs",                1,
        uint32_t, "disable_frame_end_update_cdf",     1,
        uint32_t, "allow_warped_motion",              1,
        uint32_t, "reduced_tx_set",                   1,
        uint32_t, "skip_mode_present",                1,
        uint32_t, "delta_q_present",                  1,
        uint32_t, "delta_lf_present",                 1,
        uint32_t, "delta_lf_multi",                   1,
        uint32_t, "segmentation_enabled",             1,
        uint32_t, "segmentation_update_map",          1,
        uint32_t, "segmentation_temporal_update",     1,
        uint32_t, "segmentation_update_data",         1,
        uint32_t, "UsesLr",                           1,
        uint32_t, "usesChromaLr",                     1,
        uint32_t, "show_frame",                       1,
        uint32_t, "showable_frame",                   1,
        uint32_t, "reserved",                         3,
    ));
}

struct StdVideoEncodeAV1PictureInfo {
    StdVideoEncodeAV1PictureInfoFlags           flags;
    StdVideoAV1FrameType                        frame_type;
    uint32_t                                    frame_presentation_time;
    uint32_t                                    current_frame_id;
    uint8_t                                     order_hint;
    uint8_t                                     primary_ref_frame;
    uint8_t                                     refresh_frame_flags;
    uint8_t                                     coded_denom;
    uint16_t                                    render_width_minus_1;
    uint16_t                                    render_height_minus_1;
    StdVideoAV1InterpolationFilter              interpolation_filter;
    StdVideoAV1TxMode                           TxMode;
    uint8_t                                     delta_q_res;
    uint8_t                                     delta_lf_res;
    uint8_t[ STD_VIDEO_AV1_NUM_REF_FRAMES ]     ref_order_hint;
    int8_t[ STD_VIDEO_AV1_REFS_PER_FRAME ]      ref_frame_idx;
    uint8_t[3]                                  reserved1;
    uint32_t[ STD_VIDEO_AV1_REFS_PER_FRAME ]    delta_frame_id_minus_1;
    const( StdVideoAV1TileInfo )*               pTileInfo;
    const( StdVideoAV1Quantization )*           pQuantization;
    const( StdVideoAV1Segmentation )*           pSegmentation;
    const( StdVideoAV1LoopFilter )*             pLoopFilter;
    const( StdVideoAV1CDEF )*                   pCDEF;
    const( StdVideoAV1LoopRestoration )*        pLoopRestoration;
    const( StdVideoAV1GlobalMotion )*           pGlobalMotion;
    const( StdVideoEncodeAV1ExtensionHeader )*  pExtensionHeader;
    const( uint32_t )*                          pBufferRemovalTimes;
}

struct StdVideoEncodeAV1ReferenceInfoFlags {
    mixin( bitfields!(
        uint32_t,  "disable_frame_end_update_cdf", 1,
        uint32_t,  "segmentation_enabled",         1,
        uint32_t,  "reserved",                     30,
    ));
}

struct StdVideoEncodeAV1ReferenceInfo {
    StdVideoEncodeAV1ReferenceInfoFlags         flags;
    uint32_t                                    RefFrameId;
    StdVideoAV1FrameType                        frame_type;
    uint8_t                                     OrderHint;
    uint8_t[3]                                  reserved1;
    const( StdVideoEncodeAV1ExtensionHeader )*  pExtensionHeader;
}


// - vulkan_video_codec_vp9std -
enum vulkan_video_codec_vp9std = 1;

enum STD_VIDEO_VP9_MAX_REF_FRAMES = 4;
enum STD_VIDEO_VP9_LOOP_FILTER_ADJUSTMENTS = 2;
enum STD_VIDEO_VP9_MAX_SEGMENTATION_TREE_PROBS = 7;
enum STD_VIDEO_VP9_MAX_SEGMENTATION_PRED_PROB = 3;
enum STD_VIDEO_VP9_MAX_SEGMENTS = 8;
enum STD_VIDEO_VP9_SEG_LVL_MAX = 4;
enum STD_VIDEO_VP9_NUM_REF_FRAMES = 8;
enum STD_VIDEO_VP9_REFS_PER_FRAME = 3;

enum StdVideoVP9Profile {
    STD_VIDEO_VP9_PROFILE_0              = 0,
    STD_VIDEO_VP9_PROFILE_1              = 1,
    STD_VIDEO_VP9_PROFILE_2              = 2,
    STD_VIDEO_VP9_PROFILE_3              = 3,
    STD_VIDEO_VP9_PROFILE_INVALID        = 0x7FFFFFFF,
    STD_VIDEO_VP9_PROFILE_MAX_ENUM       = 0x7FFFFFFF
}

enum STD_VIDEO_VP9_PROFILE_0             = StdVideoVP9Profile.STD_VIDEO_VP9_PROFILE_0;
enum STD_VIDEO_VP9_PROFILE_1             = StdVideoVP9Profile.STD_VIDEO_VP9_PROFILE_1;
enum STD_VIDEO_VP9_PROFILE_2             = StdVideoVP9Profile.STD_VIDEO_VP9_PROFILE_2;
enum STD_VIDEO_VP9_PROFILE_3             = StdVideoVP9Profile.STD_VIDEO_VP9_PROFILE_3;
enum STD_VIDEO_VP9_PROFILE_INVALID       = StdVideoVP9Profile.STD_VIDEO_VP9_PROFILE_INVALID;
enum STD_VIDEO_VP9_PROFILE_MAX_ENUM      = StdVideoVP9Profile.STD_VIDEO_VP9_PROFILE_MAX_ENUM;

enum StdVideoVP9Level {
    STD_VIDEO_VP9_LEVEL_1_0      = 0,
    STD_VIDEO_VP9_LEVEL_1_1      = 1,
    STD_VIDEO_VP9_LEVEL_2_0      = 2,
    STD_VIDEO_VP9_LEVEL_2_1      = 3,
    STD_VIDEO_VP9_LEVEL_3_0      = 4,
    STD_VIDEO_VP9_LEVEL_3_1      = 5,
    STD_VIDEO_VP9_LEVEL_4_0      = 6,
    STD_VIDEO_VP9_LEVEL_4_1      = 7,
    STD_VIDEO_VP9_LEVEL_5_0      = 8,
    STD_VIDEO_VP9_LEVEL_5_1      = 9,
    STD_VIDEO_VP9_LEVEL_5_2      = 10,
    STD_VIDEO_VP9_LEVEL_6_0      = 11,
    STD_VIDEO_VP9_LEVEL_6_1      = 12,
    STD_VIDEO_VP9_LEVEL_6_2      = 13,
    STD_VIDEO_VP9_LEVEL_INVALID  = 0x7FFFFFFF,
    STD_VIDEO_VP9_LEVEL_MAX_ENUM = 0x7FFFFFFF
}

enum STD_VIDEO_VP9_LEVEL_1_0     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_1_0;
enum STD_VIDEO_VP9_LEVEL_1_1     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_1_1;
enum STD_VIDEO_VP9_LEVEL_2_0     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_2_0;
enum STD_VIDEO_VP9_LEVEL_2_1     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_2_1;
enum STD_VIDEO_VP9_LEVEL_3_0     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_3_0;
enum STD_VIDEO_VP9_LEVEL_3_1     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_3_1;
enum STD_VIDEO_VP9_LEVEL_4_0     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_4_0;
enum STD_VIDEO_VP9_LEVEL_4_1     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_4_1;
enum STD_VIDEO_VP9_LEVEL_5_0     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_5_0;
enum STD_VIDEO_VP9_LEVEL_5_1     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_5_1;
enum STD_VIDEO_VP9_LEVEL_5_2     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_5_2;
enum STD_VIDEO_VP9_LEVEL_6_0     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_6_0;
enum STD_VIDEO_VP9_LEVEL_6_1     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_6_1;
enum STD_VIDEO_VP9_LEVEL_6_2     = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_6_2;
enum STD_VIDEO_VP9_LEVEL_INVALID = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_INVALID;
enum STD_VIDEO_VP9_LEVEL_MAX_ENUM = StdVideoVP9Level.STD_VIDEO_VP9_LEVEL_MAX_ENUM;

enum StdVideoVP9FrameType {
    STD_VIDEO_VP9_FRAME_TYPE_KEY         = 0,
    STD_VIDEO_VP9_FRAME_TYPE_NON_KEY     = 1,
    STD_VIDEO_VP9_FRAME_TYPE_INVALID     = 0x7FFFFFFF,
    STD_VIDEO_VP9_FRAME_TYPE_MAX_ENUM    = 0x7FFFFFFF
}

enum STD_VIDEO_VP9_FRAME_TYPE_KEY        = StdVideoVP9FrameType.STD_VIDEO_VP9_FRAME_TYPE_KEY;
enum STD_VIDEO_VP9_FRAME_TYPE_NON_KEY    = StdVideoVP9FrameType.STD_VIDEO_VP9_FRAME_TYPE_NON_KEY;
enum STD_VIDEO_VP9_FRAME_TYPE_INVALID    = StdVideoVP9FrameType.STD_VIDEO_VP9_FRAME_TYPE_INVALID;
enum STD_VIDEO_VP9_FRAME_TYPE_MAX_ENUM   = StdVideoVP9FrameType.STD_VIDEO_VP9_FRAME_TYPE_MAX_ENUM;

enum StdVideoVP9ReferenceName {
    STD_VIDEO_VP9_REFERENCE_NAME_INTRA_FRAME     = 0,
    STD_VIDEO_VP9_REFERENCE_NAME_LAST_FRAME      = 1,
    STD_VIDEO_VP9_REFERENCE_NAME_GOLDEN_FRAME    = 2,
    STD_VIDEO_VP9_REFERENCE_NAME_ALTREF_FRAME    = 3,
    STD_VIDEO_VP9_REFERENCE_NAME_INVALID         = 0x7FFFFFFF,
    STD_VIDEO_VP9_REFERENCE_NAME_MAX_ENUM        = 0x7FFFFFFF
}

enum STD_VIDEO_VP9_REFERENCE_NAME_INTRA_FRAME    = StdVideoVP9ReferenceName.STD_VIDEO_VP9_REFERENCE_NAME_INTRA_FRAME;
enum STD_VIDEO_VP9_REFERENCE_NAME_LAST_FRAME     = StdVideoVP9ReferenceName.STD_VIDEO_VP9_REFERENCE_NAME_LAST_FRAME;
enum STD_VIDEO_VP9_REFERENCE_NAME_GOLDEN_FRAME   = StdVideoVP9ReferenceName.STD_VIDEO_VP9_REFERENCE_NAME_GOLDEN_FRAME;
enum STD_VIDEO_VP9_REFERENCE_NAME_ALTREF_FRAME   = StdVideoVP9ReferenceName.STD_VIDEO_VP9_REFERENCE_NAME_ALTREF_FRAME;
enum STD_VIDEO_VP9_REFERENCE_NAME_INVALID        = StdVideoVP9ReferenceName.STD_VIDEO_VP9_REFERENCE_NAME_INVALID;
enum STD_VIDEO_VP9_REFERENCE_NAME_MAX_ENUM       = StdVideoVP9ReferenceName.STD_VIDEO_VP9_REFERENCE_NAME_MAX_ENUM;

enum StdVideoVP9InterpolationFilter {
    STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP          = 0,
    STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH   = 1,
    STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP_SHARP    = 2,
    STD_VIDEO_VP9_INTERPOLATION_FILTER_BILINEAR          = 3,
    STD_VIDEO_VP9_INTERPOLATION_FILTER_SWITCHABLE        = 4,
    STD_VIDEO_VP9_INTERPOLATION_FILTER_INVALID           = 0x7FFFFFFF,
    STD_VIDEO_VP9_INTERPOLATION_FILTER_MAX_ENUM          = 0x7FFFFFFF
}

enum STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP         = StdVideoVP9InterpolationFilter.STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP;
enum STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH  = StdVideoVP9InterpolationFilter.STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH;
enum STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP_SHARP   = StdVideoVP9InterpolationFilter.STD_VIDEO_VP9_INTERPOLATION_FILTER_EIGHTTAP_SHARP;
enum STD_VIDEO_VP9_INTERPOLATION_FILTER_BILINEAR         = StdVideoVP9InterpolationFilter.STD_VIDEO_VP9_INTERPOLATION_FILTER_BILINEAR;
enum STD_VIDEO_VP9_INTERPOLATION_FILTER_SWITCHABLE       = StdVideoVP9InterpolationFilter.STD_VIDEO_VP9_INTERPOLATION_FILTER_SWITCHABLE;
enum STD_VIDEO_VP9_INTERPOLATION_FILTER_INVALID          = StdVideoVP9InterpolationFilter.STD_VIDEO_VP9_INTERPOLATION_FILTER_INVALID;
enum STD_VIDEO_VP9_INTERPOLATION_FILTER_MAX_ENUM         = StdVideoVP9InterpolationFilter.STD_VIDEO_VP9_INTERPOLATION_FILTER_MAX_ENUM;

enum StdVideoVP9ColorSpace {
    STD_VIDEO_VP9_COLOR_SPACE_UNKNOWN    = 0,
    STD_VIDEO_VP9_COLOR_SPACE_BT_601     = 1,
    STD_VIDEO_VP9_COLOR_SPACE_BT_709     = 2,
    STD_VIDEO_VP9_COLOR_SPACE_SMPTE_170  = 3,
    STD_VIDEO_VP9_COLOR_SPACE_SMPTE_240  = 4,
    STD_VIDEO_VP9_COLOR_SPACE_BT_2020    = 5,
    STD_VIDEO_VP9_COLOR_SPACE_RESERVED   = 6,
    STD_VIDEO_VP9_COLOR_SPACE_RGB        = 7,
    STD_VIDEO_VP9_COLOR_SPACE_INVALID    = 0x7FFFFFFF,
    STD_VIDEO_VP9_COLOR_SPACE_MAX_ENUM   = 0x7FFFFFFF
}

enum STD_VIDEO_VP9_COLOR_SPACE_UNKNOWN   = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_UNKNOWN;
enum STD_VIDEO_VP9_COLOR_SPACE_BT_601    = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_BT_601;
enum STD_VIDEO_VP9_COLOR_SPACE_BT_709    = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_BT_709;
enum STD_VIDEO_VP9_COLOR_SPACE_SMPTE_170 = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_SMPTE_170;
enum STD_VIDEO_VP9_COLOR_SPACE_SMPTE_240 = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_SMPTE_240;
enum STD_VIDEO_VP9_COLOR_SPACE_BT_2020   = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_BT_2020;
enum STD_VIDEO_VP9_COLOR_SPACE_RESERVED  = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_RESERVED;
enum STD_VIDEO_VP9_COLOR_SPACE_RGB       = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_RGB;
enum STD_VIDEO_VP9_COLOR_SPACE_INVALID   = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_INVALID;
enum STD_VIDEO_VP9_COLOR_SPACE_MAX_ENUM  = StdVideoVP9ColorSpace.STD_VIDEO_VP9_COLOR_SPACE_MAX_ENUM;

struct StdVideoVP9ColorConfigFlags {
    mixin( bitfields!(
        uint32_t,  "color_range", 1,
        uint32_t,  "reserved",    31,
    ));
}

struct StdVideoVP9ColorConfig {
    StdVideoVP9ColorConfigFlags  flags;
    uint8_t                      BitDepth;
    uint8_t                      subsampling_x;
    uint8_t                      subsampling_y;
    uint8_t                      reserved1;
    StdVideoVP9ColorSpace        color_space;
}

struct StdVideoVP9LoopFilterFlags {
    mixin( bitfields!(
        uint32_t,  "loop_filter_delta_enabled", 1,
        uint32_t,  "loop_filter_delta_update",  1,
        uint32_t,  "reserved",                  30,
    ));
}

struct StdVideoVP9LoopFilter {
    StdVideoVP9LoopFilterFlags                       flags;
    uint8_t                                          loop_filter_level;
    uint8_t                                          loop_filter_sharpness;
    uint8_t                                          update_ref_delta;
    int8_t[ STD_VIDEO_VP9_MAX_REF_FRAMES ]           loop_filter_ref_deltas;
    uint8_t                                          update_mode_delta;
    int8_t[ STD_VIDEO_VP9_LOOP_FILTER_ADJUSTMENTS ]  loop_filter_mode_deltas;
}

struct StdVideoVP9SegmentationFlags {
    mixin( bitfields!(
        uint32_t,  "segmentation_update_map",          1,
        uint32_t,  "segmentation_temporal_update",     1,
        uint32_t,  "segmentation_update_data",         1,
        uint32_t,  "segmentation_abs_or_delta_update", 1,
        uint32_t,  "reserved",                         28,
    ));
}

struct StdVideoVP9Segmentation {
    StdVideoVP9SegmentationFlags                                        flags;
    uint8_t[ STD_VIDEO_VP9_MAX_SEGMENTATION_TREE_PROBS ]                segmentation_tree_probs;
    uint8_t[ STD_VIDEO_VP9_MAX_SEGMENTATION_PRED_PROB ]                 segmentation_pred_prob;
    uint8_t[ STD_VIDEO_VP9_MAX_SEGMENTS ]                               FeatureEnabled;
    int16_t[ STD_VIDEO_VP9_SEG_LVL_MAX ][ STD_VIDEO_VP9_MAX_SEGMENTS ]  FeatureData;
}


// - vulkan_video_codec_vp9std_decode -
enum vulkan_video_codec_vp9std_decode = 1;

enum VK_STD_VULKAN_VIDEO_CODEC_VP9_DECODE_API_VERSION_1_0_0 = VK_MAKE_VIDEO_STD_VERSION( 1, 0, 0 );

enum VK_STD_VULKAN_VIDEO_CODEC_VP9_DECODE_SPEC_VERSION = VK_STD_VULKAN_VIDEO_CODEC_VP9_DECODE_API_VERSION_1_0_0;
enum const( char )* VK_STD_VULKAN_VIDEO_CODEC_VP9_DECODE_EXTENSION_NAME = "VK_STD_vulkan_video_codec_vp9_decode";

struct StdVideoDecodeVP9PictureInfoFlags {
    mixin( bitfields!(
        uint32_t,  "error_resilient_mode",         1,
        uint32_t,  "intra_only",                   1,
        uint32_t,  "allow_high_precision_mv",      1,
        uint32_t,  "refresh_frame_context",        1,
        uint32_t,  "frame_parallel_decoding_mode", 1,
        uint32_t,  "segmentation_enabled",         1,
        uint32_t,  "show_frame",                   1,
        uint32_t,  "UsePrevFrameMvs",              1,
        uint32_t,  "reserved",                     24,
    ));
}

struct StdVideoDecodeVP9PictureInfo {
    StdVideoDecodeVP9PictureInfoFlags  flags;
    StdVideoVP9Profile                 profile;
    StdVideoVP9FrameType               frame_type;
    uint8_t                            frame_context_idx;
    uint8_t                            reset_frame_context;
    uint8_t                            refresh_frame_flags;
    uint8_t                            ref_frame_sign_bias_mask;
    StdVideoVP9InterpolationFilter     interpolation_filter;
    uint8_t                            base_q_idx;
    int8_t                             delta_q_y_dc;
    int8_t                             delta_q_uv_dc;
    int8_t                             delta_q_uv_ac;
    uint8_t                            tile_cols_log2;
    uint8_t                            tile_rows_log2;
    uint16_t[3]                        reserved1;
    const( StdVideoVP9ColorConfig )*   pColorConfig;
    const( StdVideoVP9LoopFilter )*    pLoopFilter;
    const( StdVideoVP9Segmentation )*  pSegmentation;
}


