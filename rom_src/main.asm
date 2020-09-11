; Sizif-512 Service ROM.
; Running while magic (NMI) button hold and changes CPLD configuration register by keypresses.
; If no keypress was registered - jump to default NMI handler. Otherwise - exit NMI.
    DEVICE ZXSPECTRUM48
    OPT --syntax=m

; NMI handler
    ORG #0066
    jp nmi_enter

; INT IM1 handler
    ORG #0038
    ld hl, #0038 ; set jump address for exit_nmi routine
    ret

; INT IM2 handler
    ORG #0101
    ret

; INT IM2 vector table
    ORG #0F00
    .257 db #01 ; by Z80 user manual int vector is I * 256 + (D & 0xFE)
                ; but by other references and by T80/A-Z80 implementation int vector is I * 256 + D
                ; so we just play safe and use symmetric int handler address and vector table with one extra byte

; Main program
nmi_enter:
    ld (Saved_sp_value), sp
    ld sp, Stack_top
    push af
    push hl
    ld a, #01                    ; show magic border
    out (#ff), a                 ; ...
    xor a                        ; reset variables to initial state
    ld (Magic_leave_cnt), a      ; ...
    ld (Key_was_pressed_flag), a ; ...
    ld (Reset_flag), a           ; ...

loop:
    call key_checker
    call check_magic_hold        ; return A
    or a                         ; check leave flag
    jp nz, exit_nmi              ; yes?
    jr loop

; check all functional keys and change zx configuration depending on pressed keys
; input parameters: none
; output parameters: none
key_checker:
    push af
key_1:                   ; timings <= pentagon
    ld a, #f7            ; read 0-5 keys
    in a, (#fe)          ; ...
    bit 0, a
    jr nz, key_2
    ld a, #20
    out (#ff), a
    jp key_checker_pressed
key_2:                   ; timings <= 128
    bit 1, a
    jr nz, key_3
    ld a, #21
    out (#ff), a
    jp key_checker_pressed
key_3:                   ; turbo <= 48
    bit 2, a
    jr nz, key_4
    ld a, #23
    out (#ff), a
    jp key_checker_pressed
key_4:                   ; turbo <= none
    bit 3, a
    jr nz, key_5
    ld a, #30
    out (#ff), a
    jp key_checker_pressed
key_5:                   ; turbo <= 7
    bit 4, a
    jr nz, key_6
    ld a, #31
    out (#ff), a
    jp key_checker_pressed
key_6:                   ; turbo <= 14
    ld a, #ef            ; read 6-0 keys
    in a, (#fe)          ; ...
    bit 4, a
    jr nz, key_7
    ld a, #33
    out (#ff), a
    jp key_checker_pressed
key_7:                   ; ay_abc <= 1
    bit 3, a
    jr nz, key_8
    ld a, #41
    out (#ff), a
    jp key_checker_pressed
key_8:                   ; ay_abc <= 0
    bit 2, a
    jr nz, key_9
    ld a, #40
    out (#ff), a
    jp key_checker_pressed
key_9:                   ; ay_mono <= 1
    bit 1, a
    jr nz, key_U
    ld a, #42
    out (#ff), a
    jp key_checker_pressed
key_U:                   ; joystick_sinclair <= 0
    ld a, #df            ; read Y-P keys
    in a, (#fe)          ; ...
    bit 3, a
    jr nz, key_I
    ld a, #70
    out (#ff), a
    jp key_checker_pressed
key_I:                   ; joystick_sinclair <= 1
    bit 2, a
    jr nz, key_O
    ld a, #71
    out (#ff), a
    jp key_checker_pressed
key_O:                   ; extlock <= 0
    bit 1, a
    jr nz, key_P
    ld a, #10
    out (#ff), a
    jp key_checker_pressed
key_P:                   ; extlock <= 1
    bit 0, a
    jr nz, key_Q
    ld a, #11
    out (#ff), a
    jp key_checker_pressed
key_Q:                   ; rom_alt48 <= 0
    ld a, #fb            ; read Q-T keys
    in a, (#fe)          ; ...
    bit 0, a
    jr nz, key_W
    ld a, #60
    out (#ff), a
    jp key_checker_pressed
key_W:                   ; rom_alt48 <= 1
    bit 1, a
    jr nz, key_E
    ld a, #61
    out (#ff), a
    jp key_checker_pressed
key_E:                   ; rom_plus3 <= 0
    bit 2, a
    jr nz, key_R
    ld a, #50
    out (#ff), a
    jp key_checker_pressed
key_R:                   ; rom_plus3 <= 1
    bit 3, a
    jr nz, Key_Space
    ld a, #51
    out (#ff), a
    jp key_checker_pressed
Key_Space:               ; jump to #00 on exit
    ld a, #7f            ; read B-Space keys
    in a, (#fe)          ; ...
    bit 0, a
    jr nz, key_checker_done
    ld a, #01
    ld (Reset_flag), a
    jp key_checker_pressed
key_checker_pressed:
    ld a, #01
    ld (Key_was_pressed_flag), a
    call beep
key_checker_done:
    pop af
    ret

; check magic keys is still holding. if no - debounce and set leave flag then
; input parameters: none
; output parameters: A != 0 - leave, A == 0 - do not leave
check_magic_hold: 
    push af
    ld a, #ff                  ; read magic key state in bit 7 of #FE port
    in a, (#fe)                ; ...
    bit 7, a                   ; check key is hold
    ld a, #00
    jr z, check_magic_hold_l1  ; yes?
    ld a, (Magic_leave_cnt)
    inc a
    jp nz, check_magic_hold_l1 ; check is counter overflow?
    pop af                     ; yes? set A=1 and exit
    ld a, #01
    ret
check_magic_hold_l1:
    ld (Magic_leave_cnt), a
    pop af
    xor a                      ; counter didn't overflow
    ret

; do beep and flash border
; input parameters: none
; output parameters: none
beep: 
    push af
    push bc
    push de
    ld de, #10         ; set total length
beep_length:
    ld bc, #30         ; set beeper toggling period
beep_period0:
    dec bc             ; check it is time to toggle beeper
    ld a, b            ; ...
    or c               ; ...
    jr nz, beep_period0 ; no?
    ld a, #00          ; yes? doing beep
    out (#ff), a       ; ...
    ld bc, #20         ; set beeper toggling period
beep_period1:
    dec bc             ; check it is time to toggle beeper
    ld a, b            ; ...
    or c               ; ...
    jr nz, beep_period1 ; no? 
    ld a, #01          ; yes? doing beep
    out (#ff), a       ; ...
    dec de             ; check whether time is over
    ld a, d            ; ...
    or e               ; ...
    jr nz, beep_length ; no?
    pop de
    pop bc
    pop af
    ret

; read non-magic im2 table and returns im2 handler address
; input parameters: A - im2 table address hight byte
; output parameters: HL - handler address
get_im2_handler:
    push af
    ld h, a                   ; hl = im2 table address
    ld l, #ff                 ; hl = im2 table address
    ld a, #2a                 ; 2a - ld hl, (nn)
    ld (Readout_vector-2), a  ; ...
    ld (Readout_vector-1), hl ; hl was set earlier by im2 table address
    ld a, #c9                 ; c9 - ret
    ld (Readout_vector+1), a  ; ...
    call Readout_vector-2     ; hl contains default im2 handler address now
    pop af
    ret

exit_nmi:
    xor a                ; disable border
    out (#ff), a         ; ...
    ld a, (Reset_flag)   ; should we jump to #0000 at exit?
    or a                 ; ...
    ld hl, #0000         ; ...
    jp nz, exit_with_jp  ; yes?
    ld a, (Key_was_pressed_flag) ; was key pressed?
    or a                         ; ...
    ld hl, #0066         ; ...
    jp z, exit_with_jp   ; no? jump to default nmi handler
    ld a, i              ; save interrupt table address
    push af
    call get_im2_handler ; hl = im2 handler address
    ld a, #0f            ; set our interrupt table address (#0Fxx)
    ld i, a              ; ...
    ei                   ; determine im1 or im2
    halt                 ; ... also sync execution flow with int for safety
    pop af
    ld i, a              ; restore default interrupt table address
    jp po, exit_with_ret ; check int was enabled by default. no? just do retn

exit_with_jp:
    ld (Exit_vector-1), hl   ; hl argument is jump address
    ld a, #c3                ; c3 - jp
    ld (Exit_vector-2), a
    pop hl
    pop af
    ld sp, (Saved_sp_value)
    jp Exit_vector-2

exit_with_ret:
    ld hl, #45ed             ; ed45 - retn; reverse bytes order
    ld (Exit_vector-1), hl
    pop hl
    pop af
    ld sp, (Saved_sp_value)
    jp Exit_vector-1

; Magic vectors
    ORG #F000
Exit_vector:
    nop
    ORG #F008
Readout_vector:
    nop

; Variables
    ORG #FC00
Reset_flag:
    db 0
Key_was_pressed_flag:
    db 0
Magic_leave_cnt:
    db 0
Saved_sp_value:
    dw 0
Stack_bottom:
    ORG #FFBE
Stack_top:
    ORG #FFC0
Ulaplus_pallete:
    .64 db 0

    SAVEBIN "rom1.bin",0,16384
