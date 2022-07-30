REV = D
REVISION = rev_${REV}

.PHONY: build program clean

build:
	quartus_sh --no_banner --flow compile zx_ula -c ${REVISION}

program:
	quartus_pgm --no_banner --mode=jtag -o "BVP;output/${REVISION}.pof"

clean:
	rm -rf db incremental_db output

report:
	cat output/${REVISION}.*.smsg output/${REVISION}.*.rpt |grep -e Error -e Critical -e Warning |grep -v -e "Family doesn't support jitter analysis" -e "Force Fitter to Avoid Periphery Placement Warnings"

export PATH:=/opt/quartus13.0sp1/quartus/bin:/cygdrive/c/Hwdev/quartus130sp1/quartus/bin:${PATH}

-include Makefile.local
