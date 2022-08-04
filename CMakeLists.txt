cmake_minimum_required(VERSION 3.5)

project(openh264 VERSION "2.3.0" LANGUAGES CXX ASM)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/inc 
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/inc
                    ${CMAKE_CURRENT_SOURCE_DIR}/codec/api/wels)

enable_language(ASM_NASM)
set(CMAKE_ASM_NASM_SOURCE_FILE_EXTENSIONS asm)
add_definitions(-DX86_ASM)

# makefile build log
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

# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/decoder/core/x86/dct_dec.o codec/decoder/core/x86/dct_dec.asm
# nasm -DUNIX64 -DHAVE_AVX2 -f elf64 -I./codec/common/x86/   -o codec/decoder/core/x86/intra_pred.o codec/decoder/core/x86/intra_pred.asm
file(GLOB COMMON_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/cpuid.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/dct.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/deblock.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/expand_picture.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/mc_chroma.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/mc_luma.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/mb_copy.asm)

file(GLOB DEC_ASM_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/x86/dct_dec.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/core/x86/intra_pred.asm)

file(GLOB ONLY_LINUX_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/vaa.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/satd_sad.asm
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/intra_pred_com.asm)

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

file(GLOB dec_plus_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/src/welsDecoderExt.cpp
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/src/welsCodecTrace.cpp
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/src/wels_dec_export.def)

file(GLOB dec_plus_INCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/common/inc/welsCodecTrace.h
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/decoder/plus/inc/welsDecoderExt.h)

file(GLOB dec_console_INCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/dec/inc/d3d9_utils.h
                            ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/common/inc/read_config.h)
file(GLOB dec_console_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/dec/src/d3d9_utils.cpp
                           ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/dec/src/h264dec.cpp
                            ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/common/src/read_config.cpp)

add_compile_options(-fPIC)
# set (CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fPIC")
# set（CMAKE_C_FLAGS“$ {CMAKE_C_FLAGS} -fPIC”）
# set（CMAKE_CXX_FLAGS“$ {CMAKE_CXX_FLAGS} -fPIC”）
add_library(welsdeccore STATIC ${dec_INCS} ${dec_SRCS})

set(ASM_OBJS "")

foreach(mainfile IN LISTS COMMON_SOURCES)
    get_filename_component(mainname ${mainfile} NAME_WE)
    if(MSVC)
        add_custom_command(TARGET welsdeccore
                            PRE_LINK
                            COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -f win64 -DWIN64 -o ${CMAKE_CURRENT_BINARY_DIR}/"${mainname}.obj"
                            COMMAND echo "== nasm asm ok ${mainname}.obj"
                            )
        list(APPEND ASM_OBJS "${CMAKE_CURRENT_BINARY_DIR}/${mainname}.obj") 
        # message(STATUS "++ ${ASM_OBJS}")
    else()
        add_custom_command(TARGET welsdeccore
                    PRE_LINK
                    COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -DUNIX64 -f elf64 -DHAVE_AVX2 -o ${CMAKE_CURRENT_BINARY_DIR}/"${mainname}.o"
                    COMMAND echo "== nasm asm ok ${mainname}.o"
        )
        list(APPEND ASM_OBJS "${CMAKE_CURRENT_BINARY_DIR}/${mainname}.o") 
    endif(MSVC) #MSVC
    message(STATUS "==>> ${mainname} ${mainfile}")
endforeach()

foreach(mainfile IN LISTS DEC_ASM_SOURCES)
    get_filename_component(mainname ${mainfile} NAME_WE)
    if(MSVC)
        add_custom_command(TARGET welsdeccore
                            PRE_LINK
                            COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -f win64 -DWIN64 -o ${CMAKE_CURRENT_BINARY_DIR}/"${mainname}.obj"
                            COMMAND echo "== nasm asm ok ${mainname}.obj"
                            )
        list(APPEND ASM_OBJS "${CMAKE_CURRENT_BINARY_DIR}/${mainname}.obj") 
        # message(STATUS "++ ${ASM_OBJS}")
    else()
        add_custom_command(TARGET welsdeccore
                    PRE_LINK
                    COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -DUNIX64 -f elf64 -DHAVE_AVX2 -o ${CMAKE_CURRENT_BINARY_DIR}/"${mainname}.o"
                    COMMAND echo "== nasm asm ok ${mainname}.o"
        )
        list(APPEND ASM_OBJS "${CMAKE_CURRENT_BINARY_DIR}/${mainname}.o") 
    endif(MSVC) #MSVC
    message(STATUS "==>> ${mainname} ${mainfile}")
endforeach()

foreach(mainfile IN LISTS ONLY_LINUX_SRCS)
    get_filename_component(mainname ${mainfile} NAME_WE)
    if(UNIX)
        add_custom_command(TARGET welsdeccore
                    PRE_LINK
                    COMMAND nasm -I${CMAKE_CURRENT_SOURCE_DIR}/codec/common/x86/ ${mainfile} -DUNIX64 -f elf64 -DHAVE_AVX2 -o ${CMAKE_CURRENT_BINARY_DIR}/"${mainname}.o"
                    COMMAND echo "== nasm asm ok ${mainname}.o"
        )
        list(APPEND ASM_OBJS "${CMAKE_CURRENT_BINARY_DIR}/${mainname}.o") 
    endif(UNIX) #MSVC
    message(STATUS "==>> ${mainname} ${mainfile}")
endforeach()

# Optimize execution speed
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()
set(CMAKE_CXX_FLAGS_RELEASE -Ofast)

#-DHAVE_AVX2 -Wall -fno-strict-aliasing -fPIC -MMD -MP -fstack-protector-all -DGENERATED_VERSION_HEADER -DHAVE_AVX2 -Wno-class-memaccess
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3  -Wall -m64")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3  -Wall -m64")

message(STATUS "==>>all objs: ${ASM_OBJS}")
target_link_libraries(welsdeccore PRIVATE ${ASM_OBJS})

# target_link_libraries(welsdeccore PRIVATE simd)
add_library(welsdecplus SHARED ${dec_plus_INCS} ${dec_plus_SRCS})
target_link_libraries(welsdecplus PRIVATE welsdeccore)

if(UNIX)
    target_link_libraries(welsdecplus PRIVATE pthread)
endif()


add_executable(dec_console ${dec_console_INCS} ${dec_console_SRCS})
target_link_libraries(dec_console PRIVATE welsdecplus)
target_include_directories(dec_console PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/common/inc/
                        ${CMAKE_CURRENT_SOURCE_DIR}/codec/console/dec/inc/)