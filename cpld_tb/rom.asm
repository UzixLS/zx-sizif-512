	DEVICE ZXSPECTRUM48

	ORG #0000
Start:
	jp Main

	ORG #0038
Int1:
	jp #1ff8
	ORG #00FF
	DB #38

	ORG #0066
Nmi:
	jp #1ffa
	push af
	ld a, #08
	out (#ff), a
	pop af
	retn

	ORG #1000
Main:
	im 2
	ei

	ld bc, #7ffd
	ld a, #11
	out (c), a

	//.72 nop
	//ld a, 7
	//out (#fe), a

	//ld hl, #4000
	//ld de, #c000
	//ld bc, 100
	//ldir

	//ld c, #ff
	//ld b, #ff
	//ld hl, #4000
	//otir

	jp #1fff

	ORG #1FF8
	reti
	ORG #1FFA
	retn
	ORG #1FFF
	jp #3d00

Loop:
	halt
	jp Loop

	SAVEBIN "rom.bin",0,16384
