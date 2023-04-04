ifneq ($(wildcard ../.git),)
	VERSION := $(shell git describe --abbrev=6 --long --dirty --always --tags --first-parent)
endif

export PATH:=/cygdrive/c/Hwdev/sjasmplus/:/cygdrive/c/Dev/srec/:${PATH}

REV=D
SJOPTS=-DSIZIF512 -DREV_${REV} -DVERSION=\"${VERSION}\"

.PHONY: all clean .FORCE
.FORCE:

all: main.bin

clean:
	rm -f *.bin *.mem *.hex *.map *.sna

%.bin: %.asm .FORCE
	sjasmplus ${SJOPTS} $<
%.mem: %.bin
	srec_cat $< -binary -o $@ -vmem 8
%.hex: %.bin
	srec_cat $< -binary -o $@ -intel

test: main_test.bin

-include Makefile.local
