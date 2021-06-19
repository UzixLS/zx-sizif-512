export PATH:=/cygdrive/c/Hwdev/sjasmplus/:/cygdrive/c/Dev/srec/:${PATH}

SJOPTS='-DSIZIF512'

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
