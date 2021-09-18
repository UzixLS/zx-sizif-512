OUTDIR=out_new

all:
	mkdir -p ${OUTDIR}/
	${MAKE} build_rev REV=C
	${MAKE} build_rev REV=D

build_rev:
	${MAKE} -C cpld/syn/ REVISION=rev_${REV} clean build
	${MAKE} -C rom_src/ REV=${REV} clean all
	${MAKE} -C rom/ REV=${REV} clean all
	cp cpld/syn/output/rev_${REV}.pof ${OUTDIR}/
	cp rom/sizif512-040.rom ${OUTDIR}/rom.rev.${REV}.rom

clean:
	rm -f "${OUTDIR}"
	${MAKE} -C cpld/syn/ clean
	${MAKE} -C cpld/tb/ clean
	${MAKE} -C rom_src/ clean
	${MAKE} -C rom/ clean
