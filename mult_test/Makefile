
LDSCRIPT   = ../libopencm3/lib/stm32/f4/stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS	   = stm32f4_wrapper.o mult_basic.o test_NTT_1440to180_v4.S test_INTT_1440to180_v4.S test_NTT_180to30_v4.S test_INTT_180to30_v4.S test_NTT_30to5_v4.S test_INTT_30to5_v4.S School_5.S test_1440to677_mod2048.S

all: lib test_mult.bin

include ../common/make.mk

# exceptional case, since it uses an extra dependency (i.e. asmfunction.s)
asmwrapper.elf: asmwrapper.o asmfunction.s $(OBJS) $(LDSCRIPT)
	$(LD) -o asmwrapper.elf asmwrapper.o asmfunction.s $(OBJS) $(LDFLAGS) -l$(LIBNAME)
