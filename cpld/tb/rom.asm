	DEVICE ZXSPECTRUM48

	ORG #0000
Start:
	nop
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
	ld a, #83
	.200 out (c), a

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
Loop:
	halt
	jp Loop

	ORG #1FF8 // DivROM exit vector
	reti
	ORG #1FFA // DivROM exit vector
	retn
	ORG #1FFF // DivROM exit vector
	nop
	jp #3D00

	ORG #C000 // mapped #0000
DivROM_Start:
	nop
	ld bc, #3D00
	push bc
	jp #1FFF
	ORG #DFFF // mapped #1FFF
	nop
	ORG #1D00 // mapped #3D00
	jp #0000


	SAVEBIN "rom.bin",0,65536
