pause_init:
	ld d, PAUSE_BODY_ATTR
	ld c, PAUSE_X
	ld b, PAUSE_Y
	ld e, PAUSE_WIDTH
	call draw_attribute_line
	ld b, PAUSE_Y+2
	ld e, PAUSE_WIDTH
	call draw_attribute_line
	ld d, PAUSE_TEXT_ATTR
	ld b, PAUSE_Y+1
	ld e, PAUSE_WIDTH
	call draw_attribute_line
	ld b, (PAUSE_Y+1)<<3
	ld hl, str_pause
	call print_string
	ret

pause_process:
    ld a, #ff                   ; read pause key state in bit 1 of #FFFF port
    in a, (#ff)                 ; ...
    bit 1, a                    ; check key is hold
    jr nz, .is_hold             ; yes?
    ld a, 1
    ld (var_pause_is_released), a
    ret
.is_hold:
	ld a, (var_pause_is_released) ; if key wasnt released - do nothing
	or a                          ; ...
	ret z                         ; ...
	ld a, 1                       ; otherwise - var_exit_flag = 1
	ld (var_exit_flag), a         ; ...
	ret
