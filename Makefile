TARGET_LIB = libmad.a

OBJS = bit.o decoder.o fixed.o frame.o huffman.o \
	layer12.o layer3.o stream.o synth.o timer.o

PREFIX  = arm-vita-eabi
CC      = $(PREFIX)-gcc
AR      = $(PREFIX)-gcc-ar
CFLAGS  = -Wl,-q -Wall -O3 -I.
ASFLAGS = $(CFLAGS)

$(TARGET_LIB): $(OBJS)
	$(AR) rcs $@ $^

clean:
	@rm -rf $(TARGET_LIB) $(OBJS)

install: $(TARGET_LIB)
	@cp  $(TARGET_LIB) $(VITASDK)/arm-vita-eabi/lib
	@cp mad.h "$(VITASDK)/arm-vita-eabi/include/"
	@echo "Installed!"
