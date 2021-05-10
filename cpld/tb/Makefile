export PATH:=/opt/modelsim201/modelsim_ase/bin:/cygdrive/c/Hwdev/modelsim181/modelsim_ase/win32aloem:/cygdrive/c/Hwdev/iverilog/bin/:/cygdrive/c/Hwdev/sjasmplus/:/cygdrive/c/Dev/srec/:${PATH}
SRC_AZ80=$(wildcard ./az80/*.v)
SRC_T80=./t80/t80n_pack.vhd ./t80/t80n.vhd ./t80/t80n_alu.vhd ./t80/t80n_mcode.vhd ./t80/t80na.vhd

all: testbench_zx_ula

testbench_zx_ula: IVFLAGS+=-I./az80/ -I./t80/ -I../rtl/
testbench_zx_ula: VLOGFLAGS+=+define+REV_D
testbench_zx_ula: VSIMFLAGS+=+nowarn3722 +nowarn8822 +nowarn3017 +nowarn3155
testbench_zx_ula: testbench_zx_ula.v ../rtl/common.sv $(wildcard stubs/*.v ../rtl/*.vhd ../rtl/*.v ../rtl/*.sv)
testbench_zx_ula: ${SRC_T80}
testbench_zx_ula: rom.mem

testbench_memcontroller: testbench_memcontroller.v

xtestbench_%:
	iverilog -g2005-sv ${IVFLAGS} -o $@.vvp $^
	vvp $@.vvp
	@rm $@.vvp

testbench_%:
	test ! -d work || rm -rf work
	vlib work
	test ! -n "$(filter %.v %.sv,$^)" || vlog -quiet -sv ${VLOGFLAGS} $(filter %.v %sv,$^)
	test ! -n "$(filter %.vhd %.vhdl,$^)" || vcom -quiet ${VCOMFLAGS} $(filter %.vhd %.vhdl,$^)
	vsim ${VSIMFLAGS} -batch -quiet -do 'run -all' $@
	test ! -r transcript || rm transcript

%.bin: %.asm
	sjasmplus $<

%.mem: %.bin
	srec_cat $< -binary -o $@ -vmem 8

clean:
	rm -rf ivl_vhdl_work/ work/ *.bin *.mem *.vcd

-include Makefile.local
