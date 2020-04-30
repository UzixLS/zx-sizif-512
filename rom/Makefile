all:
	#   00x          010         011        011        100               101                   110        111
	cat pentagon.rom trd504t.rom ESXMMC.BIN ESXMMC.BIN S128_ZX80_ROM.bin S128_ZX81_ED2_ROM.bin opense.rom ../rom_src/main.bin \
		>sizif-512-010.rom
	cat sizif-512-010.rom \
		testrom.bin testrom.bin testrom.bin testrom.bin testrom.bin testrom.bin testrom.bin testrom.bin \
		>sizif-512-020.rom
	cat sizif-512-020.rom \
		DiagROM.v47 DiagROM.v47 DiagROM.v47 DiagROM.v47 DiagROM.v47 DiagROM.v47 DiagROM.v47 DiagROM.v47 \
		TEST430.ROM TEST430.ROM \
		>sizif-512-040.rom
