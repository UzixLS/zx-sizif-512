export PATH:=/cygdrive/c/Hwdev/modelsim181/modelsim_ase/win32aloem:/cygdrive/c/Hwdev/iverilog/bin/:/cygdrive/c/Hwdev/sjasmplus/:/cygdrive/c/Dev/srec/:${PATH}
V_T80=./t80/t80n_pack.vhd ./t80/t80n.vhd ./t80/t80n_alu.vhd ./t80/t80n_mcode.vhd ./t80/t80na.vhd
V_AZ80=$(wildcard ./az80/*.v)

all: testbench_zx_ula

# testbench_zx_ula: VFLAGS+=-I../az80/ -I../src
testbench_zx_ula: VSIMFLAGS+=+nowarn3722 +nowarn8822 +nowarn3017
testbench_zx_ula: V=testbench_zx_ula.v zx_ula.v ../cpld/chroma_gen14.vhd ${V_T80}
testbench_zx_ula: rom.mem zero64.mem

# testbench_%:
# 	iverilog -g2005-sv ${VFLAGS} -o $@.vvp $@.v ${V}
# 	vvp $@.vvp
# 	@rm $@.vvp

testbench_%:
	test ! -d work || rm -rf work
	vlib work
	test ! -n "$(filter %.v,${V})" || vlog -quiet -sv $(filter %.v,${V})
	test ! -n "$(filter %.vhd %.vhdl,${V})" || vcom -quiet $(filter %.vhd %.vhdl,${V})
	vsim ${VSIMFLAGS} -quiet -do 'run -all' $@
	rm transcript

%.bin: %.asm
	sjasmplus $<
%.mem: %.bin
	srec_cat $< -binary -o $@ -vmem 8

zero64.bin:
	dd if=/dev/zero count=65536 bs=1 >$@

clean:
	rm -rf ivl_vhdl_work/ work/ *.bin *.mem *.vcd
