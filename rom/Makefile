# Each bank = 16Kb
bank00=128p-0.rom             # 0x00000
bank01=128-1.rom              # 0x04000
bank02=../rom_src/main.bin    # 0x08000
bank03=ESXMMC.BIN ESXMMC.BIN  # 0x0C000
bank04=zcen3e0.rom            # 0x10000
bank05=zcen3e1.rom            # 0x14000
bank06=zcen3e2.rom            # 0x18000
bank07=lg18alt.rom            # 0x1C000
# A17 (JP3)
bank08=opense.rom             # 0x20000
bank09=128-0.rom              # 0x24000
bank10=48.rom                 # 0x28000
bank11=zcen3e3.rom            # 0x2C000
bank12=zcen3e3_notap.rom      # 0x30000
bank13=negluk.rom             # 0x34000
bank14=S128_ZX80_ROM.bin      # 0x38000
bank15=S128_ZX81_ED2_ROM.bin  # 0x3C000
# A18 (JP2)
bank16=DiagROM.v61            # 0x40000
bank17=DiagROM.v61            # 0x44000
bank18=DiagROM.v61            # 0x48000
bank19=DiagROM.v61            # 0x4C000
bank20=DiagROM.v61            # 0x50000
bank21=DiagROM.v61            # 0x54000
bank22=DiagROM.v61            # 0x58000
bank23=DiagROM.v61            # 0x5C000
# A17+A18 (JP3+JP2)
bank24=zxdiag.rom             # 0x60000
bank25=zxdiag.rom             # 0x64000
bank26=zxdiag.rom             # 0x68000
bank27=zxdiag.rom             # 0x6C000
bank28=zxdiag.rom             # 0x70000
bank29=zxdiag.rom             # 0x74000
bank30=zxdiag.rom             # 0x78000
bank31=zxdiag.rom             # 0x7C000


sizif512-040.rom: ${bank00} ${bank01} ${bank02} ${bank03} ${bank04} ${bank05} ${bank06} ${bank07} \
				  ${bank08} ${bank09} ${bank10} ${bank11} ${bank12} ${bank13} ${bank14} ${bank15} \
				  ${bank16} ${bank17} ${bank18} ${bank19} ${bank20} ${bank21} ${bank22} ${bank23} \
				  ${bank24} ${bank25} ${bank26} ${bank27} ${bank28} ${bank29} ${bank30} ${bank31}
sizif512-020.rom: ${bank00} ${bank01} ${bank02} ${bank03} ${bank04} ${bank05} ${bank06} ${bank07} \
				  ${bank08} ${bank09} ${bank10} ${bank11} ${bank12} ${bank13} ${bank14} ${bank15}
sizif512-010.rom: ${bank00} ${bank01} ${bank02} ${bank03} ${bank04} ${bank05} ${bank06} ${bank07}

%.rom:
	cat $+ > $@

all: sizif512-010.rom sizif512-020.rom sizif512-040.rom

clean:
	rm -f sizif512-040.rom sizif512-020.rom sizif512-010.rom
