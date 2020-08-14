export PATH:=/cygdrive/c/Hwdev/sjasmplus/:/cygdrive/c/Dev/srec/:${PATH}

all: main.bin

%.bin: %.asm
	sjasmplus $<
%.mem: %.bin
	srec_cat $< -binary -o $@ -vmem 8
