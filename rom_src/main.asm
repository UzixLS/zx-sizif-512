    DEVICE ZXSPECTRUM48
    OPT --syntax=F

app_begin:
; Startup handler
    ORG #0000
    jp startup_handler
    DB 0,"Sizif Magic ROM",0

; NMI handler
    ORG #0066
    jp nmi_handler

; INT IM1 handler
    ORG #0038
    push bc
    ld bc, #0038
    ld (var_int_vector), bc
    pop bc
    ret

; INT IM2 handler
    ORG #0101
    ret

; INT IM2 vector table
    ORG #0600
    .257 db #01 ; by Z80 user manual int vector is I * 256 + (D & 0xFE)
                ; but by other references and by T80/A-Z80 implementation int vector is I * 256 + D
                ; so we just play safe and use symmetric int handler address and vector table with one extra byte


startup_handler:
    ld ix, #5800    ; draw 4 rygb boxes on left top corner to indicate boot
    ld (ix+0), #D2  ; r
    ld (ix+1), #F6  ; y
    call init_config
    call init_cpld
    ld (ix+2), #E4  ; g
    ld (ix+3), #C9  ; b
    ld hl, 0
    jp exit_with_jp


nmi_handler:
    ld (var_sp_reg), sp
    ld sp, Stack_top
    push af
    push hl
    push bc
    ld a, #01            ; show magic border
    out (#ff), a         ; ...
    xor a
    ld (var_magic_enter_cnt), a
    ld (var_magic_leave_cnt), a
.loop:
    call check_magic_delay
    call check_magic_hold   ; A == 1 if we are entering menu, A == 2 if we are leaving to...
    bit 0, a                ; ...default nmi handler, A == 0 otherwise
    jp nz, main             ; ...
    bit 1, a                ; ...
    jr z, .loop             ; ...
.leave:
    xor a                ; disable border
    ld bc, #01ff         ; ...
    out (c), a           ; ...
    ld hl, #0066         ; jump to default nmi handler
    jp exit_with_jp      ; ...


; IN  - HL - jump address
exit_with_jp:
    ld (Exit_vector-1), hl
    ld a, #c3                ; c3 - jp
    ld (Exit_vector-2), a
    pop bc
    pop hl
    pop af
    ld sp, (var_sp_reg)
    jp Exit_vector-2

exit_with_ret:
    ld hl, #45ed             ; ed45 - retn; reverse bytes order
    ld (Exit_vector-1), hl
    pop bc
    pop hl
    pop af
    ld sp, (var_sp_reg)
    jp Exit_vector-1


init_config:
    ld hl, cfg_initialized     ; if (cfg_initialized == "magic word") {restore cfg} else {default cfg}
    ld a, #B1                  ; ...
    cpi                        ; ... hl++
    jr nz, .init_default       ; ...
    ld a, #5B                  ; ...
    cpi                        ; ... hl++
    jr nz, .init_default       ; ...
    ld a, #00                  ; ...
    cpi                        ; ... hl++
    jr nz, .init_default       ; ...
    ld a, #B5                  ; ...
    cpi                        ; ... hl++
    jr nz, .init_default       ; ...
    jr .restore                ; ...
.init_default:
    ld bc, CFG_T               ; cfg_saved = cfg_default
    ld de, cfg_saved           ; ...
    ld hl, CFG_DEFAULT         ; ...
    ldir                       ; ...
.restore:
    ld bc, CFG_T               ; cfg = cfg_saved
    ld de, cfg                 ; ...
    ld hl, cfg_saved           ; ...
    ldir                       ; ...
.save_magic:
    ld hl, #5BB1               ; cfg_initialized = "magic word"
    ld (cfg_initialized+0), hl ; ...
    ld hl, #B500               ; ...
    ld (cfg_initialized+2), hl ; ...
    ret

save_config:
    ld bc, CFG_T     ; cfg_saved = cfg
    ld de, cfg_saved ; ...
    ld hl, cfg       ; ... 
    ldir             ; ...
    ret


init_cpld:
    ld a, (cfg.ram)    ; if ram == 48K - run basic48
    cp 1               ; ...
    jr nz, .do_load    ; ...
    ld a, #10          ; ...
    ld bc, #7ffd       ; ...
    out (c), a         ; ...
    ld a, #4           ; ...
    ld bc, #1ffd       ; ...
    out (c), a         ;
.do_load:
    ld b, CFG_T        ; B = registers count
    ld c, #ff          ; 
    ld hl, cfg+CFG_T-1 ; HL = &cfg[registers count-1]
    otdr               ; do { b--; out(bc, *hl); hl--; } while(b)
    ret


; OUT -  A = 1 if we are entering menu, A = 2 if we are leaving menu, A = 0 otherwise
; OUT -  F - garbage
check_magic_hold: 
    ld a, #ff                   ; read magic key state in bit 7 of #FE port
    in a, (#fe)                 ; ...
    bit 7, a                    ; check key is hold
    jr z, .is_hold              ; yes?
.not_hold:
    ld a, (var_magic_leave_cnt) ; leave_counter++
    inc a                       ; ...
    ld (var_magic_leave_cnt), a ; ...
    cp MENU_LEAVE_DELAY         ; if (counter == MENU_LEAVE_DELAY) - return 2
    jr nz, .return0             ; ...
    ld a, 2
    ret
.is_hold:
    ld a, (var_magic_enter_cnt) ; enter_counter++
    inc a                       ; ...
    ld (var_magic_enter_cnt), a ; ...
    cp MENU_ENTER_DELAY         ; if (counter == MENU_ENTER_DELAY) - return 1
    jr nz, .return0             ; ...
    ld a, 1
    ret
.return0:
    xor a
    ret


; OUT - AF - garbage
; OUT - BC - garbage
check_magic_delay:
    ld c, MENU_HOLDCHECK_DELAY
    ld a, (cfg.clock)
    or a
    jr z, .loop
    ld c, MENU_HOLDCHECK_DELAY*2
    dec a
    jr z, .loop
    ld c, MENU_HOLDCHECK_DELAY*4
.loop:
    ld a, c
.loop_outer:
    ld b, 255                 ; ~1ms cycle at 3.5MHz
.loop_inner:                  ; ...
    djnz .loop_inner          ; 13 T-states
    dec a
    jr nz, .loop_outer
    ret


; read non-magic im2 table and returns im2 handler address
; IN  -  A - im2 table address hight byte
; OUT - HL - handler address
; OUT - AF - garbage
get_im2_handler:
    ld h, a                   ; HL = im2 table address
    ld l, #ff                 ; HL = im2 table address
    ld a, #2a                 ; 2a - ld hl, (nn)
    ld (Readout_vector-2), a  ; ...
    ld (Readout_vector-1), hl ; HL was set earlier by im2 table address
    ld a, #c9                 ; c9 - ret
    ld (Readout_vector+1), a  ; ...
    call Readout_vector-2     ; HL = default im2 handler address
    ret


save:
.mute_saa1099:
    ld bc, #ffff       ; select saa register
    ld a, #1c          ; ...
    out (c), a         ; ...
    ld b, #fe          ; mute
    xor a              ; ...
    out (c), a         ; ...
.save_ay:
    ld hl, var_save_ay ; select first AY chip in TurboSound
    ld a, #ff          ; ...
    call .save_ay_sub
    ld a, #fe          ; select second AY chip in TurboSound
    call .save_ay_sub
.save_screen:
    ld bc, 6912
    ld de, var_save_screen
    ld hl, #4000
    ldir
.save_ulaplus:
    ld bc, #bf3b       ; set ulaplus address = mode register
    ld a, #40          ; ...
    out (c), a         ; ...
    ld bc, #ff3b       ; save mode register value
    in a, (c)          ; ...
    ld (var_save_ulaplus), a ; ...
    xor a              ; disable ulaplus
    out (c), a         ; ...
    ret

.save_ay_sub:
    ld bc, #fffd       ; ...
    out (c), a         ; ...
    ld d, 16           ; register_number=16
.save_ay_sub_loop:
    dec d              ; register_number--
    ld b, #ff          ; select register number
    out (c), d         ; ...
    in a, (c)          ; read register
    ld (hl), a         ; save to ram
    xor a              ; set register to 0
    ld b, #bf          ; ...
    out (c), a         ; ...
    inc hl             ; ram++
    or d               ; register_number == 0?
    jr nz, .save_ay_sub_loop
    ret


restore:
.restore_ulaplus:
    ld bc, #bf3b       ; set ulaplus address = mode register
    ld a, #40          ; ...
    out (c), a         ; ...
    ld bc, #ff3b       ; restore mode register value
    ld a, (var_save_ulaplus) ; ...
    out (c), a         ; ...
.restore_screen:
    ld bc, 6912
    ld de, #4000
    ld hl, var_save_screen
    ldir
.restore_ay:
    ld hl, var_save_ay+16 ; select second AY chip in TurboSound
    ld a, #fe          ; ...
    call .restore_ay_sub
    ld hl, var_save_ay ; select first AY chip in TurboSound
    ld a, #ff          ; ...
    call .restore_ay_sub
.restore_ret:
    ret

.restore_ay_sub:
    ld bc, #fffd       ; ...
    out (c), a         ; ...
    ld d, 16           ; register_number=16
.restore_ay_sub_loop:
    dec d              ; register_number--
    ld b, #ff          ; select register number
    out (c), d         ; ...
    ld b, #bf          ; restore register
    ld a, (hl)         ; ...
    out (c), a         ; ...
    inc hl             ; ram++
    xor a              ; register_number == 0?
    or d               ; ...
    jr nz, .restore_ay_sub_loop ;
    ret


; Main program
main:
    push de
    push ix
    push iy

    ld a, i              ; save I reg and IFF2
    push af              ; ...
    ld a, #06            ; set our interrupt table address (#06xx)
    ld i, a              ; ...

    xor a
    ld (var_exit_flag), a
    ld (var_exit_reboot), a
    ld (var_input_key), a
    ld (var_input_key_last), a
    ld (var_input_key_hold_timer), a
    ld (var_menu_current_item), a
    ld (var_menu_animate_cnt), a

    call save
    call menu_init

.loop:
    ei
    halt
    call input_process          ; B = 32 if exit key pressed
    bit 5, b
    jr nz, .wait_for_keys_release

    call menu_process
    ld a, (var_exit_flag)
    or a
    jr z, .loop

.wait_for_keys_release:
    ei
    halt
    call input_process           ; B = 0 if no keys pressed
    xor a
    or b
    jr nz, .wait_for_keys_release

.leave:
    call save_config
    call restore
    ld a, (var_exit_reboot) ; should we reboot?
    or a                    ; ...
    jr z, .leave_without_reboot ; ...
    ld a, 1                 ; reboot
    ld bc, #00ff            ; ...
    out (c), a              ; ...
.leave_without_reboot:
    pop af               ; A = I
    push af              ; 
    call get_im2_handler ; HL = default im2 handler address
    ld (var_int_vector), hl
    xor a                ; disable border
    ld bc, #01ff         ; ...
    out (c), a           ; ...
    pop af
    pop iy
    pop ix
    pop de
    ei                   ; wait for int just for safety
    halt                 ; ...
    ld i, a              ; restore default interrupt table address
    jp po, exit_with_ret ; check int was enabled by default. no? just do retn
    ld hl, (var_int_vector) ; ...
    jp exit_with_jp      ; yes? goto default int handler


; Includes
    include config.asm
    include draw.asm
    include input.asm
    include menu.asm
    include menu_structure.asm
    include font.asm
    include strings.asm

app_end:
    ORG #3FE8
    DB 0,"End of Sizif Magic ROM",0

; Magic vectors
Exit_vector EQU #F000
Readout_vector EQU #F008

; Variables
    ORG #D500
var_save_screen: .6912 DB 0
    ORG #F020
var_save_ay: .32 DB 0
var_save_ulaplus: DB 0
var_sp_reg: DW 0
var_int_vector: DW 0
var_magic_enter_cnt: DB 0
var_magic_leave_cnt: DB 0
var_exit_flag: DB 0
var_exit_reboot: DB 0
var_input_key: DB 0
var_input_key_last: DB 0
var_input_key_hold_timer: DB 0
var_menu_current_item: DB 0
var_menu_animate_cnt: DB 0

cfg CFG_T
cfg_saved CFG_T
cfg_initialized: DB #B1, #5B, #00, #B5

    ORG #FFBE
Stack_top:
    ORG #FFC0
Ulaplus_pallete:
    .64 DB 0


    DISPLAY "Application size: ",/D,app_end-app_begin
    CSPECTMAP "main.map"
    SAVEBIN "main.bin",0,16384
