OUTDIR=out_new
REV=E

.PHONY: all build_rev clean pipeline

all:
	mkdir -p ${OUTDIR}/
	${MAKE} REV=C build_rev
	${MAKE} REV=D build_rev
	${MAKE} REV=E build_rev

build_rev:
	${MAKE} REV=${REV} -C rom_src/ clean all
	${MAKE} REV=${REV} -C rom/ clean all
	${MAKE} REV=${REV} -C cpld/syn/ clean build
	cp cpld/syn/output/rev_${REV}.pof ${OUTDIR}/cpld.rev.${REV}.pof
	cp rom/sizif512-040.rom ${OUTDIR}/rom.rev.${REV}.rom

clean:
	rm -f "${OUTDIR}"
	${MAKE} -C cpld/syn/ clean
	${MAKE} -C cpld/tb/ clean
	${MAKE} -C rom/ clean
	${MAKE} -C rom_src/ clean

pipeline:
	${MAKE} REV=${REV} -C rom_src/
	${MAKE} REV=${REV} -C rom/
	${MAKE} REV=${REV} -C cpld/syn/ build report program

-include Makefile.local
