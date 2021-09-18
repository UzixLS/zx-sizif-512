    DEVICE ZXSPECTRUM48
    OPT --syntax=F

app_begin:
; Startup handler
    ORG #0000
    ex de, hl ; EB opcode used by CPLD to determine magic ROM presence
    ex de, hl ; ...
    jp startup_handler
    DB 0,"Sizif Magic ROM",0

; NMI handler
    ORG #0066
    ex de, hl ; EB opcode used by CPLD to determine magic ROM presence
    ex de, hl ; ...
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
    ld sp, Stack_top
    ld ix, #5800    ; draw 4 rygb boxes on left top corner to indicate boot
    ld (ix+0), #D2  ; r
    ld (ix+1), #F6  ; y
    call check_initialized
    jr z, .warm_boot
    im 1            ; wait for ps/2 keyboard ready
    ld b, POWERON_DELAY ; ...
.loop               ; ...
    ei              ; ...
    halt            ; ...
    djnz .loop      ; ...
    call init_default_config
    call detect_sd_card
    call detect_ext_board
    call check_custom_rom
.warm_boot:
    call load_config
    call init_cpld
    call save_initialized
    call mute_saa1099  ; saa1099 does not have reset pin
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
    call check_entering_pause ; A[1] == 1 if pause button is pressed
    bit 1, a                  ; ...
    jp nz, enter_pause        ; ...
    call delay_10ms           ; 
    call check_entering_menu  ; A == 1 if we are entering menu, A == 2 if we are leaving to...
    bit 0, a                  ; ...default nmi handler, A == 0 otherwise
    jp nz, enter_menu         ; ...
    bit 1, a                  ; ...
    jr z, .loop               ; ...
.leave:
    xor a                ; disable border
    ld bc, #01ff         ; ...
    out (c), a           ; ...
    ld bc, #ffff         ; if divmmc paged - just do retn
    in a, (c)            ; ...
    bit 3, a             ; ...
    jr nz, exit_with_ret ; ... 
    ld hl, #0066         ; otherwise jump to default nmi handler
    jr exit_with_jp      ; ...


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


check_initialized:
    ld hl, cfg_initialized     ; if (cfg_initialized == "magic word") Z = 0, else Z = 1
    ld a, #B1                  ; ...
    cpi                        ; ... hl++
    ret nz                     ; ...
    ld a, #5B                  ; ...
    cpi                        ; ... hl++
    ret nz                     ; ...
    ld a, #00                  ; ...
    cpi                        ; ... hl++
    ret nz                     ; ...
    ld a, #B5                  ; ...
    cpi                        ; ... hl++
    ret

save_initialized:
    ld hl, #5BB1               ; cfg_initialized = "magic word"
    ld (cfg_initialized+0), hl ; ...
    ld hl, #B500               ; ...
    ld (cfg_initialized+2), hl ; ...
    ret

init_default_config:
    ld bc, CFG_T+CFGEXT_T ; cfg_saved = cfg_default
    ld de, cfg_saved      ; ...
    ld hl, CFG_DEFAULT    ; ...
    ldir                  ; ...

load_config:
    ld bc, CFG_T+CFGEXT_T ; cfg = cfg_saved
    ld de, cfg            ; ...
    ld hl, cfg_saved      ; ...
    ldir                  ; ...
    ret                   ; ...

save_config:
    ld bc, CFG_T+CFGEXT_T ; cfg_saved = cfg
    ld de, cfg_saved      ; ...
    ld hl, cfg            ; ... 
    ldir                  ; ...
    ret


init_cpld:
.check_alt48rom:
    ld a, (cfg.rom48)           ; if alternative 48k rom enabled - disable 128 menu
    or a                        ; ... this is required because 128 menu isn't compatible
    jr z, .check_7ffd_disabled  ; ... with currently used Looking Glass 48K rom
    ld a, (cfg.machine)         ; ... however +3e works with looking glass flawlessly
    cp 2                        ; ...
    jr z, .check_7ffd_disabled  ; ...
    ld a, #10                   ; ...
    ld bc, #7ffd                ; ...
    out (c), a                  ; ...
.check_7ffd_disabled:
    ld a, (cfg.machine)         ; if machine == 48 - set 7ffd rom to basic48
    or a                        ; ... this is required for case when machine will be
    jr nz, .check_1ffd_disabled ; ... changed later by magic menu - this prevents
    ld a, #10                   ; ... hang if user changes machine while basic48 active
    ld bc, #7ffd                ; ...
    out (c), a                  ; ...
.check_1ffd_disabled:
    ld a, (cfg.machine)         ; if machine != +3 - set 1ffd rom to basic48
    cp 2                        ; ... this is required for case when +3 will be
    jr z, .do_load              ; ... activated later by magic menu - this prevents
    ld a, #4                    ; ... hang if user activate +3 while basic48 active
    ld bc, #1ffd                ; ...
    out (c), a                  ; ...
.do_load:
    ld b, CFG_T        ; B = registers count
    ld c, #ff          ; 
    ld hl, cfg+CFG_T-1 ; HL = &cfg[registers count-1]
    otdr               ; do { b--; out(bc, *hl); hl--; } while(b)
.do_load_ext:          ; same for extension board
    ld d, CFGEXT_T     ; ...
    ld b, #e1          ; ...
    ld c, #ff          ; ...
    ld hl, cfgext      ; ...
.do_load_ext_loop:     ; ...
    ld a, (hl)         ; ...
    out (c), a         ; ...
    inc hl             ; ...
    inc b              ; ...
    dec d              ; ...
    jr nz, .do_load_ext_loop ; ...
    ret


detect_sd_card:
    ld a, #ff                   ; read sd_cd state in bit 2 of #FFFF port
    in a, (#ff)                 ; ...
    bit 2, a                    ; check sd_cd == 0 (card is insert)
    jr z, .is_insert            ; yes?
.no_card:
    xor a                       ; divmmc = OFF
    ld (cfg_saved.divmmc), a    ; ...
    ret
.is_insert:
    ld a, 1                     ; divmmc = ON
    ld (cfg_saved.divmmc), a    ; ...
    ret


; OUT -  A = 1 if ext board present, 0 otherwise
; OUT -  F - garbage
; OUT - BC - garbage
detect_ext_board:
    ld b, #e0       ; read port #e0ff
    ld c, #ff       ; ...
    in a, (c)       ; ...
    ld b, a         ; if (result & 0xF0 != 0) - return
    and #f0         ; ...
    jr z, .detected ; ...
.not_detected:
    xor a
    ld (var_ext_presence), a
    ret
.detected
    ld a, 1
    ld (var_ext_presence), a
    xor a
    bit 0, b     ; check TSFM jumper
    jr z, .cfg_tsfm
    ld a, 1
.cfg_tsfm:
    ld (cfgext_saved.tsfm), a
    xor a
    bit 1, b     ; check SAA jumper
    jr z, .cfg_saa
    ld a, 1
.cfg_saa:
    ld (cfgext_saved.saa), a
    xor a
    bit 2, b     ; check GS jumper
    jr z, .cfg_gs
    ld a, 1
.cfg_gs:
    ld (cfgext_saved.gs), a
    ret


; Check if user holds 1/2/3/4 key on poweron. If true - boot with custom rom
check_custom_rom:
    ld a, #f7       ; read 1-5 keys
    in a, (#fe)     ; ...
    bit 0, a        ; check key 1 pressed
    jr z, .key1     ; ...
    bit 1, a        ; check key 2 pressed
    jr z, .key2     ; ...
    bit 2, a        ; check key 3 pressed
    jr z, .key3     ; ...
    bit 3, a        ; check key 4 pressed
    jr z, .key4     ; ...
    ret
.key1:
    ld a, #80       ; rom #0
    jr .reconfig
.key2:
    ld a, #81       ; rom #1
    jr .reconfig
.key3:
    ld a, #82       ; rom #2
    jr .reconfig
.key4:
    ld a, #83       ; rom #3
.reconfig:
    ld (cfg_saved.custom_rom), a ; set custom rom
    xor a
    ld (cfg_saved.divmmc), a     ; disable divmmc
    ld (cfg_saved.ulaplus), a    ; disable ula+
    ret


; OUT - A bit 1 if we are entering pause, 0 otherwise
check_entering_pause:
    ld a, #ff                   ; read pause key state in bit 1 of #FFFF port
    in a, (#ff)                 ; ...
    ret


; OUT -  A = 1 if we are entering menu, A = 2 if we are leaving menu, A = 0 otherwise
; OUT -  F - garbage
check_entering_menu: 
    ld a, #ff                   ; read magic key state in bit 0 of #FFFF port
    in a, (#ff)                 ; ...
    bit 0, a                    ; check key is hold
    jr nz, .is_hold             ; yes?
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
delay_10ms:
    ld c, 7
    ld a, (cfg.clock)
    or a
    jr z, .loop
    ld c, 9
    dec a
    jr z, .loop
    ld c, 11
    dec a
    jr z, .loop
    ld c, 7*2
    dec a
    jr z, .loop
    ld c, 7*4
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


mute_saa1099:
    ld bc, #ffff       ; select saa register
    ld a, #1c          ; ...
    out (c), a         ; ...
    ld b, #fe          ; mute
    xor a              ; ...
    out (c), a         ; ...
    ret

save:
.mute_gs:
    ld a, (var_ext_presence) ; if (no_ext_pcb || gs_is_disabled) - skip gs
    or a                     ; ...this is required to be compatible with DivIDE
    jr z, .mute_saa1099      ; ...which uses same port #bb
    ld a, (cfgext.gs)        ; ...
    or a                     ; ...
    jr z, .mute_saa1099      ; ...
    ld a, #fa                ; send command Out zero_to_zero
    out (#bb), a             ; ...
.mute_saa1099:
    call mute_saa1099
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
    ld a, #fe             ; ...
    call .restore_ay_sub
    ld hl, var_save_ay    ; select first AY chip in TurboSound
    ld a, #ff             ; ...
    call .restore_ay_sub
.restore_gs:
    ld a, (var_ext_presence) ; if (no_ext_pcb || gs_is_disabled) - skip gs
    or a                     ; ...this is required to be compatible with DivIDE
    jr z, .restore_ret       ; ...which uses same port #bb
    ld a, (cfgext.gs)        ; ...
    or a                     ; ...
    jr z, .restore_ret       ; ...
    ld a, #60                ; send command Get Song Position
    out (#bb), a             ; ...
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


enter_pause:
    ld a, 1
    ld (var_pause_flag), a
    jr main  

enter_menu:
    xor a
    ld (var_pause_flag), a
    jr main

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
    ld (var_pause_is_released), a
    ld (var_menu_current_item), a
    ld (var_menu_animate_cnt), a

    call save
    ld a, (var_pause_flag)
    or a
    jr z, .menu_init

.pause_init:
    call pause_init
.pause_loop:
    ei
    halt
    call pause_process
    ld a, (var_exit_flag)
    or a
    jr z, .pause_loop
    jr .wait_for_keys_release

.menu_init:
    call check_initialized
    jr z, .menu_init1
    call init_default_config
    call detect_ext_board
    call load_config
    call save_initialized
.menu_init1:
    call menu_init
.menu_loop:
    ei
    halt
    call input_process          ; B = 32 if exit key pressed
    bit 5, b
    jr nz, .wait_for_keys_release
    call menu_process
    ld a, (var_exit_flag)
    or a
    jr z, .menu_loop

.wait_for_keys_release:
    ei
    halt
    call input_process           ; B = 0 if no keys pressed
    xor a
    or b
    jr nz, .wait_for_keys_release
    ld a, #ff                    ; read magic/pause keys state
    in a, (#ff)                  ; ...
    and #03                      ; ...
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
    include pause.asm
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
    include variables.asm

    ORG #FFBE
Stack_top:
    ORG #FFC0
Ulaplus_pallete:
    .64 DB 0


    DISPLAY "Application size: ",/D,app_end-app_begin
    CSPECTMAP "main.map"
    SAVEBIN "main.bin",0,16384
