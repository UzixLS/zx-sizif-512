; OUT - F  - garbage
; OUT - BC - garbage
; OUT - DE - garbage
; OUT - HL - garbage
flash_program_byte_prepare:
	ld de, var_ram_func
	ld hl, flash_program_byte.sub
	ld bc, flash_program_byte.sub_end-flash_program_byte.sub
	ldir
	ret


; IN  - IY - dest
; IN  - A  - byte
; OUT - AF - garbage
; OUT - BC - garbage
; OUT - HL - garbage
flash_program_byte:
	jp var_ram_func
.sub:
	ld bc, #01ff                ; enable jedec seq
	ld h, #4                    ; ...
	out (c), h                  ; ...
	ld hl, #1555 : ld (hl), #AA ; unlock jedec sequence
	ld hl, #2aaa : ld (hl), #55 ; ...
	ld hl, #1555 : ld (hl), #A0 ; ...
	ld h, #0                    ; disable jedec seq
	out (c), h                  ; ...
	ld (iy), a                  ; actual write
.loop:
	ld a, (iy)                  ; status polling
	ld l, (iy)                  ; ...
	xor l                       ; DQ6 is inverting each read while flash busy
	bit 6, a                    ; ...
	jr nz, .loop                ; ...
	inc h                       ; enable border
	out (c), h                  ; ...
	ret
.sub_end:


; IN  - IX - source
; IN  - IY - dest
; IN  - B  - count
; OUT - AF - garbage
; OUT - BC - garbage
; OUT - DE - garbage
; OUT - HL - garbage
; OUT - IX - garbage
; OUT - IY - garbage
flash_program:
	push bc
	call flash_program_byte_prepare
	pop bc
.loop:
	ld a, (ix)
	push bc
	call flash_program_byte
	pop bc
	inc ix
	inc iy
	djnz .loop
	ret


; IN  - IY - address to erase
; OUT - AF - garbage
; OUT - BC - garbage
; OUT - DE - garbage
; OUT - HL - garbage
flash_erase_sector:
	ld de, var_ram_func
	ld hl, .sub
	ld bc, .sub_end-.sub
	ldir
	jp var_ram_func
.sub:
	ld bc, #01ff                ; enable jedec seq
	ld h, #4                    ; ...
	out (c), h                  ; ...
	ld hl, #1555 : ld (hl), #AA ; unlock jedec sequence
	ld hl, #2aaa : ld (hl), #55 ; ...
	ld hl, #1555 : ld (hl), #80 ; ...
	ld hl, #1555 : ld (hl), #AA ; ...
	ld hl, #2aaa : ld (hl), #55 ; ...
	ld h, #0                    ; disable jedec seq
	out (c), h                  ; ...
	ld (iy), #30                ; actual erase
.loop:
	ld a, (iy)                  ; status polling
	ld l, (iy)                  ; ...
	xor l                       ; DQ6 is inverting each read while flash busy
	bit 6, a                    ; ...
	jr nz, .loop                ; ...
	inc h                       ; enable border
	out (c), h                  ; ...
	ret
.sub_end:
