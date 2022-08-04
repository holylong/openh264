# This file is autogenerated, do not edit it directly, edit build/mktargets.py
# instead. To regenerate files, run build/mktargets.sh.

DECODER_SRCDIR=codec/decoder
DECODER_CPP_SRCS=\
	$(DECODER_SRCDIR)/core/src/au_parser.cpp\
	$(DECODER_SRCDIR)/core/src/bit_stream.cpp\
	$(DECODER_SRCDIR)/core/src/cabac_decoder.cpp\
	$(DECODER_SRCDIR)/core/src/deblocking.cpp\
	$(DECODER_SRCDIR)/core/src/decode_mb_aux.cpp\
	$(DECODER_SRCDIR)/core/src/decode_slice.cpp\
	$(DECODER_SRCDIR)/core/src/decoder.cpp\
	$(DECODER_SRCDIR)/core/src/decoder_core.cpp\
	$(DECODER_SRCDIR)/core/src/decoder_data_tables.cpp\
	$(DECODER_SRCDIR)/core/src/error_concealment.cpp\
	$(DECODER_SRCDIR)/core/src/fmo.cpp\
	$(DECODER_SRCDIR)/core/src/get_intra_predictor.cpp\
	$(DECODER_SRCDIR)/core/src/manage_dec_ref.cpp\
	$(DECODER_SRCDIR)/core/src/memmgr_nal_unit.cpp\
	$(DECODER_SRCDIR)/core/src/mv_pred.cpp\
	$(DECODER_SRCDIR)/core/src/parse_mb_syn_cabac.cpp\
	$(DECODER_SRCDIR)/core/src/parse_mb_syn_cavlc.cpp\
	$(DECODER_SRCDIR)/core/src/pic_queue.cpp\
	$(DECODER_SRCDIR)/core/src/rec_mb.cpp\
	$(DECODER_SRCDIR)/core/src/wels_decoder_thread.cpp\
	$(DECODER_SRCDIR)/plus/src/welsDecoderExt.cpp\

DECODER_OBJS += $(DECODER_CPP_SRCS:.cpp=.$(OBJ))

DECODER_ASM_SRCS=\
	$(DECODER_SRCDIR)/core/x86/dct_dec.asm\
	$(DECODER_SRCDIR)/core/x86/intra_pred.asm\

DECODER_OBJSASM += $(DECODER_ASM_SRCS:.asm=.$(OBJ))
ifeq ($(ASM_ARCH), x86)
DECODER_OBJS += $(DECODER_OBJSASM)
endif
OBJS += $(DECODER_OBJSASM)

DECODER_ASM_ARM_SRCS=\
	$(DECODER_SRCDIR)/core/arm/block_add_neon.S\
	$(DECODER_SRCDIR)/core/arm/intra_pred_neon.S\

DECODER_OBJSARM += $(DECODER_ASM_ARM_SRCS:.S=.$(OBJ))
ifeq ($(ASM_ARCH), arm)
DECODER_OBJS += $(DECODER_OBJSARM)
endif
OBJS += $(DECODER_OBJSARM)

DECODER_ASM_ARM64_SRCS=\
	$(DECODER_SRCDIR)/core/arm64/block_add_aarch64_neon.S\
	$(DECODER_SRCDIR)/core/arm64/intra_pred_aarch64_neon.S\

DECODER_OBJSARM64 += $(DECODER_ASM_ARM64_SRCS:.S=.$(OBJ))
ifeq ($(ASM_ARCH), arm64)
DECODER_OBJS += $(DECODER_OBJSARM64)
endif
OBJS += $(DECODER_OBJSARM64)

DECODER_ASM_MIPS_MMI_SRCS=\
	$(DECODER_SRCDIR)/core/mips/dct_mmi.c\

DECODER_OBJSMIPS_MMI += $(DECODER_ASM_MIPS_MMI_SRCS:.c=.$(OBJ))

DECODER_ASM_MIPS_MSA_SRCS=\

DECODER_OBJSMIPS_MSA += $(DECODER_ASM_MIPS_MSA_SRCS:.c=.$(OBJ))
ifeq ($(ASM_ARCH), mips)
ifeq ($(ENABLE_MMI), Yes)
DECODER_OBJS += $(DECODER_OBJSMIPS_MMI)
endif
ifeq ($(ENABLE_MSA), Yes)
DECODER_OBJS += $(DECODER_OBJSMIPS_MSA)
endif
endif
OBJS += $(DECODER_OBJSMIPS_MMI)
OBJS += $(DECODER_OBJSMIPS_MSA)

DECODER_ASM_LOONGARCH_LSX_SRCS=\
	$(DECODER_SRCDIR)/core/loongarch/mb_aux_lsx.c\

DECODER_OBJSLOONGARCH_LSX += $(DECODER_ASM_LOONGARCH_LSX_SRCS:.c=.$(OBJ))

DECODER_ASM_LOONGARCH_LASX_SRCS=\

DECODER_OBJSLOONGARCH_LASX += $(DECODER_ASM_LOONGARCH_LASX_SRCS:.c=.$(OBJ))
ifeq ($(ASM_ARCH), loongarch)
ifeq ($(ENABLE_LSX), Yes)
DECODER_OBJS += $(DECODER_OBJSLOONGARCH_LSX)
endif
ifeq ($(ENABLE_LASX), Yes)
DECODER_OBJS += $(DECODER_OBJSLOONGARCH_LASX)
endif
endif

OBJS += $(DECODER_OBJS)

$(DECODER_SRCDIR)/%.$(OBJ): $(DECODER_SRCDIR)/%.cpp
	$(QUIET_CXX)$(CXX) $(CFLAGS) $(CXXFLAGS) $(INCLUDES) $(DECODER_CFLAGS) $(DECODER_INCLUDES) -c $(CXX_O) $<

$(DECODER_SRCDIR)/%.$(OBJ): $(DECODER_SRCDIR)/%.c
	$(QUIET_CC)$(CC) $(CFLAGS) $(INCLUDES) $(DECODER_CFLAGS) $(DECODER_INCLUDES) -c $(CXX_O) $<

$(DECODER_SRCDIR)/%.$(OBJ): $(DECODER_SRCDIR)/%.asm
	$(QUIET_ASM)$(ASM) $(ASMFLAGS) $(ASM_INCLUDES) $(DECODER_ASMFLAGS) $(DECODER_ASM_INCLUDES) -o $@ $<

$(DECODER_SRCDIR)/%.$(OBJ): $(DECODER_SRCDIR)/%.S
	$(QUIET_CCAS)$(CCAS) $(CCASFLAGS) $(ASMFLAGS) $(INCLUDES) $(DECODER_CFLAGS) $(DECODER_INCLUDES) -c -o $@ $<

$(LIBPREFIX)decoder.$(LIBSUFFIX): $(DECODER_OBJS)
	$(QUIET)rm -f $@
	$(QUIET_AR)$(AR) $(AR_OPTS) $+

libraries: $(LIBPREFIX)decoder.$(LIBSUFFIX)
LIBRARIES += $(LIBPREFIX)decoder.$(LIBSUFFIX)
