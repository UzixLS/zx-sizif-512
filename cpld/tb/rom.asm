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

	ORG #8066     // nmi #0066 enter vector (magic page)
Nmi:
	ld hl, #8000              ; which address to readout
	ld a, #2a                 ; 2a - ld hl, (nn)
    ld (Readout_vector-2), a  ; ...
    ld (Readout_vector-1), hl ; hl was set earlier by im2 table address
    ld a, #c9                 ; c9 - ret
    ld (Readout_vector+1), a  ; ...
    call Readout_vector-2     ; hl contains default im2 handler address now
	jr Nmi

; Magic vectors
    ORG #F000
Exit_vector:
    ORG #F008
Readout_vector:

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

	ORG #1FFF      // divmmc exit vector (main page)
	nop            // this instruction skipped normally
	jp #3D00

	ORG #C000      // divmmc #0000 handle vector (divmmc page)
DivROM_Start:
	nop            // this instruction skipped normally
	ld bc, #00C3   // JP#0000 opcode
	ld (#3D00), bc // store opcode at #3D00 (divmmc page)
	ld bc, #3D00
	push bc
	jp #1FFF       // go to #DFFD (divmmc page)
	ORG #DFFF      // divmmc #1FFF exit vector (divmmc page)
	nop            // last instruction executed in this page

	SAVEBIN "rom.bin",0,65536
