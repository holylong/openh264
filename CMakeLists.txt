cmake_minimum_required(VERSION 3.5)

project(openh264 VERSION 2.3.0 LANGUAGES CXX ASM)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/api/wels)

enable_language(ASM_NASM)
set(CMAKE_ASM_NASM_SOURCE_FILE_EXTENSIONS asm)
add_definitions(-DX86_ASM)

# makefile build log
#common
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/cpuid.o codec/common/x86/cpuid.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/dct.o codec/common/x86/dct.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/deblock.o codec/common/x86/deblock.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/expand_picture.o codec/common/x86/expand_picture.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/intra_pred_com.o codec/common/x86/intra_pred_com.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/mb_copy.o codec/common/x86/mb_copy.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/mc_chroma.o codec/common/x86/mc_chroma.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/mc_luma.o codec/common/x86/mc_luma.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/satd_sad.o codec/common/x86/satd_sad.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/common/x86/vaa.o codec/common/x86/vaa.asm

#decoder
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/decoder/core/x86/dct_dec.o codec/decoder/core/x86/dct_dec.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/decoder/core/x86/intra_pred.o codec/decoder/core/x86/intra_pred.asm

#encoder
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/encoder/core/x86/coeff.o codec/encoder/core/x86/coeff.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/encoder/core/x86/dct_enc.o codec/encoder/core/x86/dct_enc.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/encoder/core/x86/intra_pred.o codec/encoder/core/x86/intra_pred.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/encoder/core/x86/matrix_transpose.o codec/encoder/core/x86/matrix_transpose.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/encoder/core/x86/memzero.o codec/encoder/core/x86/memzero.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/encoder/core/x86/quant.o codec/encoder/core/x86/quant.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/encoder/core/x86/sample_sc.o codec/encoder/core/x86/sample_sc.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/encoder/core/x86/score.o codec/encoder/core/x86/score.asm

#processing
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/processing/src/x86/denoisefilter.o codec/processing/src/x86/denoisefilter.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/processing/src/x86/downsample_bilinear.o codec/processing/src/x86/downsample_bilinear.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/processing/src/x86/vaa.o codec/processing/src/x86/vaa.asm
file(GLOB COMMON_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/cpuid.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/dct.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/deblock.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/expand_picture.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/mc_chroma.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/mc_luma.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/mb_copy.asm)

file(GLOB DEC_ASM_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/x86/dct_dec.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/x86/intra_pred.asm)

file(GLOB ENC_ASM_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/x86/dct_enc.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/x86/intra_pred.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/x86/coeff.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/x86/matrix_transpose.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/x86/memzero.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/x86/quant.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/x86/score.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/x86/sample_sc.asm)

file(GLOB ONLY_ENC_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/vaa.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/satd_sad.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/intra_pred_com.asm)

file(GLOB welsvp_ASM_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/x86/denoisefilter.asm
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/x86/downsample_bilinear.asm
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/x86/vaa.asm)

file(GLOB dec_INCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/copy_mb.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/cpu.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/cpu_core.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/deblocking_common.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/expand_pic.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/ls_defines.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/macros.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/mc.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/measure_time.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/memory_align.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/typedefs.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/utils.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/wels_common_defs.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/wels_const_common.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/au_parser.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/bit_stream.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/cabac_decoder.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/deblocking.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/decoder.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/decoder_context.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/decoder_core.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/decode_mb_aux.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/decode_slice.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/dec_frame.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/dec_golomb.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/error_code.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/error_concealment.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/fmo.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/get_intra_predictor.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/manage_dec_ref.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/mb_cache.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/memmgr_nal_unit.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/mv_pred.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/nalu.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/nal_prefix.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/parameter_sets.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/parse_mb_syn_cabac.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/parse_mb_syn_cavlc.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/picture.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/pic_queue.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/rec_mb.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/slice.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/vlc_decoder.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/wels_common_basis.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/wels_const.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc/wels_decoder_thread.h)

file(GLOB enc_INCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/as264_common.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/au_set.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/copy_mb.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/cpu.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/cpu_core.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/deblocking.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/deblocking_common.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/decode_mb_aux.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/dq_map.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/encode_mb_aux.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/encoder.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/encoder_context.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/expand_pic.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/extern.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/get_intra_predictor.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/golomb_common.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/ls_defines.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/macros.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/mb_cache.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/mc.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/md.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/measure_time.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/memory_align.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/mt_defs.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/mv_pred.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/nal_encap.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/param_svc.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/parameter_sets.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/paraset_strategy.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/picture.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/picture_handle.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/rc.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/ref_list_mgr_svc.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/sad_common.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/sample.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/set_mb_syn_cabac.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/set_mb_syn_cavlc.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/slice.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/slice_multi_threading.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/stat.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_base_layer_md.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_enc_frame.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_enc_golomb.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_enc_macroblock.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_enc_slice_segment.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_encode_mb.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_encode_slice.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_mode_decision.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_motion_estimate.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_set_mb_syn.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/svc_set_mb_syn_cavlc.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/typedefs.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/utils.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/vlc_encoder.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/wels_common_basis.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/wels_common_defs.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/wels_const.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/wels_const_common.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/wels_func_ptr_def.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/WelsThreadLib.h)

file(GLOB enc_SRCS 	${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/au_set.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/common_tables.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/copy_mb.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/cpu.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/crt_util_safe_x.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/deblocking.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/deblocking_common.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/decode_mb_aux.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/encode_mb_aux.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/encoder.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/encoder_data_tables.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/encoder_ext.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/expand_pic.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/get_intra_predictor.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/intra_pred_common.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/mc.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/md.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/memory_align.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/mv_pred.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/nal_encap.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/paraset_strategy.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/picture_handle.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/ratectl.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/ref_list_mgr_svc.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/sad_common.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/sample.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/set_mb_syn_cabac.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/set_mb_syn_cavlc.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/slice_multi_threading.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/svc_base_layer_md.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/svc_enc_slice_segment.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/svc_encode_mb.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/svc_encode_slice.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/svc_mode_decision.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/svc_motion_estimate.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/svc_set_mb_syn_cabac.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/svc_set_mb_syn_cavlc.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/utils.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/wels_task_base.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/wels_task_encoder.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/wels_task_management.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/WelsTaskThread.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/WelsThread.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/WelsThreadLib.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/WelsThreadPool.cpp)

file(GLOB enc_preprocess_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/interface/IWelsVP.h
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/src/wels_preprocess.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/wels_preprocess.h)

file(GLOB dec_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/common_tables.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/copy_mb.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/cpu.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/crt_util_safe_x.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/deblocking_common.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/expand_pic.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/mc.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/memory_align.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/utils.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/WelsThreadLib.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/au_parser.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/bit_stream.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/cabac_decoder.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/deblocking.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/decoder.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/decoder_core.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/decoder_data_tables.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/decode_mb_aux.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/decode_slice.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/error_concealment.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/fmo.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/get_intra_predictor.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/manage_dec_ref.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/memmgr_nal_unit.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/mv_pred.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/parse_mb_syn_cabac.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/parse_mb_syn_cavlc.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/pic_queue.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/rec_mb.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/src/wels_decoder_thread.cpp)

file(GLOB welsvp_SRC ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/cpu.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/intra_pred_common.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/memory.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/sad_common.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/WelsFrameWork.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/WelsFrameWorkEx.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/WelsThreadLib.cpp
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/interface/IWelsVP.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/resource.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/WelsVP.def
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/WelsVP.rc
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/common.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/cpu.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/intra_pred_common.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/memory.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/sad_common.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/typedef.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/util.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/WelsFrameWork.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/WelsThreadLib.h
                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/scenechangedetection/SceneChangeDetection.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/scenechangedetection/SceneChangeDetection.h
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/denoise/denoise.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/denoise/denoise.h
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/denoise/denoise_filter.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/vaacalc/vaacalcfuncs.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/vaacalc/vaacalculation.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/vaacalc/vaacalculation.h
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/backgrounddetection/BackgroundDetection.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/backgrounddetection/BackgroundDetection.h
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/adaptivequantization/AdaptiveQuantization.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/adaptivequantization/AdaptiveQuantization.h
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/downsample/downsample.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/downsample/downsample.h
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/downsample/downsamplefuncs.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/complexityanalysis/ComplexityAnalysis.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/complexityanalysis/ComplexityAnalysis.h
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/imagerotate/imagerotate.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/imagerotate/imagerotate.h
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/imagerotate/imagerotatefuncs.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/scrolldetection/ScrollDetection.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/scrolldetection/ScrollDetection.h
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/scrolldetection/ScrollDetectionFuncs.cpp
				${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/scrolldetection/ScrollDetectionFuncs.h)

file(GLOB dec_plus_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/src/welsDecoderExt.cpp
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/welsCodecTrace.cpp
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/src/wels_dec_export.def)

file(GLOB dec_plus_INCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/welsCodecTrace.h
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/inc/welsDecoderExt.h)

file(GLOB enc_plus_INCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/welsCodecTrace.h
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/plus/inc/welsEncoderExt.h)

file(GLOB enc_plus_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/plus/src/wels_enc_export.def
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/welsCodecTrace.cpp
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/plus/src/welsEncoderExt.cpp)

file(GLOB enc_plus_win_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/plus/src/DllEntry.cpp)

file(GLOB dec_console_INCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/dec/inc/d3d9_utils.h
                            ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/common/inc/read_config.h)
file(GLOB dec_console_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/dec/src/d3d9_utils.cpp
                           ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/dec/src/h264dec.cpp
                            ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/common/src/read_config.cpp)

file(GLOB enc_console_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/common/src/read_config.cpp
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/enc/src/welsenc.cpp
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/common/inc/read_config.h)

add_compile_options(-fPIC)
# set (CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fPIC")
# set（CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
# set（CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
#decoder
add_library(welsdeccore STATIC ${dec_INCS} ${dec_SRCS})
#encoder
add_library(welsenccore STATIC ${enc_INCS} ${enc_SRCS} ${enc_preprocess_SRCS})
#welsvp
add_library(welsvp STATIC ${welsvp_SRC})


set(ASM_DEC_OBJS "")
set(ASM_ENC_OBJS "")
set(ASM_WELSVP_OBJS "")
set(ASM_COM_OBJS "")

foreach(mainfile IN LISTS COMMON_SOURCES)
    get_filename_component(mainname ${mainfile} NAME_WE)
    if(MSVC)
        add_custom_command(TARGET welsdeccore
                            PRE_LINK
                            COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -f win64 -DWIN64 -o ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.obj
                            COMMAND echo == nasm asm ok ${mainname}.obj
                            )
        list(APPEND ASM_DEC_OBJS ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.obj) 
        list(APPEND ASM_ENC_OBJS ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.obj)
        list(APPEND ASM_COM_OBJS ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.obj)
    else()
        add_custom_command(TARGET welsdeccore
                    PRE_LINK
                    COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -DUNIX64 -f elf64 -DHAVE_AVX2 -o ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.o
                    COMMAND echo == nasm asm ok ${mainname}.o
        )
        list(APPEND ASM_DEC_OBJS ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.o)
        list(APPEND ASM_ENC_OBJS ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.o)
        list(APPEND ASM_COM_OBJS ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.o)
    endif(MSVC) #MSVC
    message(STATUS ==>>${mainfile})
endforeach()

foreach(mainfile IN LISTS DEC_ASM_SOURCES)
    get_filename_component(mainname ${mainfile} NAME_WE)
    if(MSVC)
        add_custom_command(TARGET welsdeccore
                            PRE_LINK
                            COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -f win64 -DWIN64 -o ${CMAKE_CURRENT_BINARY_DIR}/decoder/${mainname}.obj
                            COMMAND echo == nasm asm ok ${mainname}.obj
                            )   
        list(APPEND ASM_DEC_OBJS ${CMAKE_CURRENT_BINARY_DIR}/decoder/${mainname}.obj) 
    else()
        add_custom_command(TARGET welsdeccore
                    PRE_LINK
                    COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -DUNIX64 -f elf64 -DHAVE_AVX2 -o ${CMAKE_CURRENT_BINARY_DIR}/decoder/${mainname}.o
                    COMMAND echo == nasm asm ok ${mainname}.o
        )
        list(APPEND ASM_DEC_OBJS ${CMAKE_CURRENT_BINARY_DIR}/decoder/${mainname}.o) 
    endif(MSVC) #MSVC
    message(STATUS ==>>${mainfile})
endforeach()

foreach(mainfile IN LISTS ENC_ASM_SOURCES)
    get_filename_component(mainname ${mainfile} NAME_WE)
    if(MSVC)
        add_custom_command(TARGET welsenccore
                            PRE_LINK
                            COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -f win64 -DWIN64 -o ${CMAKE_CURRENT_BINARY_DIR}/encoder/${mainname}.obj
                            COMMAND echo == nasm asm ok ${mainname}.obj
                            )
        list(APPEND ASM_ENC_OBJS ${CMAKE_CURRENT_BINARY_DIR}/encoder/${mainname}.obj) 
    else()
        add_custom_command(TARGET welsenccore
                    PRE_LINK
                    COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -DUNIX64 -f elf64 -DHAVE_AVX2 -o ${CMAKE_CURRENT_BINARY_DIR}/encoder/${mainname}.o
                    COMMAND echo == nasm asm ok ${mainname}.o
        )
        list(APPEND ASM_ENC_OBJS ${CMAKE_CURRENT_BINARY_DIR}/encoder/${mainname}.o) 
    endif(MSVC) #MSVC
    message(STATUS ==>>${mainfile})
endforeach()

foreach(mainfile IN LISTS ONLY_ENC_SRCS)
    get_filename_component(mainname ${mainfile} NAME_WE)
    if(MSVC)
        add_custom_command(TARGET welsenccore
                            PRE_LINK
                            COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -f win64 -DWIN64 -o ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.obj
                            COMMAND echo == nasm asm ok ${mainname}.obj
                            )
        list(APPEND ASM_WELSVP_OBJS ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.obj)
    else()
        add_custom_command(TARGET welsdeccore
                    PRE_LINK
                    COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -DUNIX64 -f elf64 -DHAVE_AVX2 -o ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.o
                    COMMAND echo == nasm asm ok ${mainname}.o
        )
        list(APPEND ASM_WELSVP_OBJS ${CMAKE_CURRENT_BINARY_DIR}/${mainname}.o)
    endif(UNIX) #MSVC
    message(STATUS ==>>${mainfile})
endforeach()

add_custom_command(TARGET welsdeccore
                    PRE_BUILD
                    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_BINARY_DIR}/encoder
                    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_BINARY_DIR}/welsvp
                    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_BINARY_DIR}/decoder)

foreach(mainfile IN LISTS welsvp_ASM_SRCS)
    get_filename_component(mainname ${mainfile} NAME_WE)
    if(MSVC)
        add_custom_command(TARGET welsvp
                            PRE_LINK
                            COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -f win64 -DWIN64 -o ${CMAKE_CURRENT_BINARY_DIR}/welsvp/${mainname}.obj
                            COMMAND echo == nasm asm ok ${mainname}.obj
                            )
        list(APPEND ASM_WELSVP_OBJS ${CMAKE_CURRENT_BINARY_DIR}/welsvp/${mainname}.obj) 
    else()
        add_custom_command(TARGET welsvp
                            PRE_LINK
                            COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -DUNIX64 -f elf64 -DHAVE_AVX2 -o ${CMAKE_CURRENT_BINARY_DIR}/welsvp/${mainname}.o
                            COMMAND echo == nasm asm ok ${mainname}.o)
        list(APPEND ASM_WELSVP_OBJS ${CMAKE_CURRENT_BINARY_DIR}/welsvp/${mainname}.o) 
    endif(MSVC) #MSVC
    message(STATUS ==>>${mainfile})
endforeach()

# Optimize execution speed
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()
set(CMAKE_CXX_FLAGS_RELEASE -Ofast)

#-DHAVE_AVX2 -Wall -fno-strict-aliasing -fPIC -MMD -MP -fstack-protector-all -DGENERATED_VERSION_HEADER -DHAVE_AVX2 -Wno-class-memaccess
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3  -Wall -m64")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3  -Wall -m64")

message(STATUS ==>>all objs: ${ASM_DEC_OBJS})

target_link_libraries(welsdeccore PRIVATE ${ASM_DEC_OBJS})
target_include_directories(welsdeccore PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc 
                                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/inc)


target_include_directories(welsenccore PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/
                            ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/interface/)
target_link_libraries(welsenccore PRIVATE ${ASM_ENC_OBJS} welsvp)

target_include_directories(welsvp PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/interface/
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/src/common/)
target_link_libraries(welsvp PRIVATE ${ASM_WELSVP_OBJS} ${ASM_COM_OBJS})

add_library(welsdecplus SHARED ${dec_plus_INCS} ${dec_plus_SRCS})
target_link_libraries(welsdecplus PRIVATE welsdeccore welsvp)
add_library(welsencplus SHARED ${enc_plus_INCS} ${enc_plus_SRCS})
target_link_libraries(welsencplus PRIVATE welsenccore)
target_include_directories(welsencplus PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/plus/inc 
                                ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/
                                ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/interface/)

if(UNIX)
    target_link_libraries(welsdecplus PRIVATE pthread)
    target_link_libraries(welsencplus PRIVATE pthread)
endif()


add_executable(dec_console ${dec_console_INCS} ${dec_console_SRCS})
target_link_libraries(dec_console PRIVATE welsdecplus)
target_include_directories(welsdecplus PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/inc
                                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc)

target_include_directories(dec_console PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/common/inc/
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/dec/inc/ ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/inc)

add_executable(enc_console ${enc_console_SRCS})
target_include_directories(enc_console PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/common/inc/
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/encoder/core/inc/ ${CMAKE_CURRENT_SOURCE_DIR}/codec/processing/interface/)
target_link_libraries(enc_console PRIVATE welsencplus)