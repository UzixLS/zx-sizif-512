    DEVICE ZXSPECTRUM48
    OPT --syntax=F

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
    ORG #0200
    .257 db #01 ; by Z80 user manual int vector is I * 256 + (D & 0xFE)
                ; but by other references and by T80/A-Z80 implementation int vector is I * 256 + D
                ; so we just play safe and use symmetric int handler address and vector table with one extra byte


    ORG #0570   ; this address chosen to do not overlap with divmmc entrypoints
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
    call load_user_config
    call detect_sd_card
    call detect_ext_board
    call detect_external_ay
    call detect_external_bdi
    call check_custom_rom
.warm_boot:
    call load_config
    call init_cpld
    call save_initialized
    call mute_saa1099  ; saa1099 does not have reset pin
    ld ix, #5800    ; draw 4 rygb boxes on left top corner to indicate boot
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
    ld a, 1                   ; show magic border
    ld bc, #01ff              ; ...
    out (c), a                ; ...
    xor a
    ld (var_magic_enter_cnt), a
    ld (var_magic_leave_cnt), a
.key_wait_loop:
    call check_entering_pause ; A[1] == 1 if pause button is pressed
    bit 1, a                  ; ...
    jp nz, .enter_pause       ; ...
    call delay_10ms           ;
    call check_entering_menu  ; A == 1 if we are entering menu, A == 2 if we are leaving to...
    bit 0, a                  ; ...default nmi handler, A == 0 otherwise
    jp nz, .enter_menu        ; ...
    bit 1, a                  ; ...
    jr z, .key_wait_loop      ; ...
.leave_no_key:
    xor a                     ; disable border
    ld bc, #01ff              ; ...
    out (c), a                ; ...
    ld bc, #00ff              ; ...
    in a, (c)                 ; if divmmc paged - just do retn
    bit 3, a                  ; ...
    jr nz, exit_with_ret      ; ...
    ld hl, #0066              ; otherwise jump to default nmi handler
    jr exit_with_jp           ; ...

.enter_pause:
    ld hl, nmi_pause
    ld (var_main_fun), hl
    jr .enter
.enter_menu:
    ld hl, nmi_menu
    ld (var_main_fun), hl
    ;jr .enter
.enter:
    push de
    push ix
    push iy
    ld a, i                   ; save I reg and IFF2
    push af                   ; ...
    ld a, #02                 ; set our IM2 interrupt table address (#02xx)
    ld i, a                   ; ...
    xor a
    ld (var_exit_flag), a
    ld (var_exit_reboot), a
    call input_init
    call save
.run_fun:
    ld hl, .leave             ; place ret address to stack
    push hl                   ; ...
    ld hl, (var_main_fun)     ; jump to our loop function
    jp (hl)                   ; ...
.leave:
    call save_config
    call restore
    ld a, (var_exit_reboot)   ; should we reboot?
    or a                      ; ...
    jr z, .leave_without_reboot ; ...
    ld a, 2                   ; reboot
    ld bc, #01ff              ; ...
    out (c), a                ; ...
.leave_without_reboot:
    pop af                    ; A = I
    push af                   ;
    call get_im2_handler      ; HL = default im2 handler address
    ld (var_int_vector), hl
    xor a                     ; disable border
    ld bc, #01ff              ; ...
    out (c), a                ; ...
    pop af
    pop iy
    pop ix
    pop de
    ei                        ; wait for int just for safety
    halt                      ; ...
    ld i, a                   ; restore default interrupt table address
    jp po, exit_with_ret      ; check int was enabled by default. no? just do retn
    ld hl, (var_int_vector)   ; ...
    jp exit_with_jp           ; yes? goto default int handler


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
.check:
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


load_user_config:
    ld hl, user_config_initialized ; check if magic world is written to flash
    call check_initialized.check   ; if no - do not do anything
    ret nz                         ; ...
    ld bc, CFG_T                   ; else - cfg_saved = user_config
    ld de, cfg_saved               ; ...
    ld hl, user_config             ; ...
    ldir                           ; ...
.quirks:                           ; some options shouldn't be saved by user, so we just overwrite them from default config
    ld a, (CFG_DEFAULT.ay)         ; AY should be disabled only by detect_external_ay
    ld (cfg_saved.ay), a           ; ...
    ret

; OUT -  A = 1 if error, 0 if ok
save_user_config:
    call flash_is_supported        ; if flash isnt supported - set error flag and exit
    jr z, .support_check_passed    ; ...
    ld a, 1                        ; ...
    ld (var_flash_error), a        ; ...
    ret                            ; ...
.support_check_passed:
    ld iy, user_config_sector      ; erase
    call flash_erase_sector        ; ...
    ld ix, cfg                     ; program config to flash
    ld iy, user_config             ; ...
    ld b, CFG_T                    ; ...
    call flash_program             ; ...
    ld ix, cfg_initialized         ; program magic word to flash
    ld iy, user_config_initialized ; ...
    ld b, 4                        ; ...
    call flash_program             ; ...
    xor a                          ; clear error flag
    ld (var_flash_error), a        ; ...
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
    ld bc, #e1ff       ; ...
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
    in a, (#77)                 ; read sd_cd state from ZC status port
    bit 0, a                    ; check sd_cd == 0 (card is insert)
    ret z                       ; yes?
.no_card:
    ld a, (cfg_saved.sd)        ; if (sd == divmmc) sd = OFF
    cp 1                        ; ...
    ret nz                      ; ...
    xor a                       ; sd = OFF
    ld (cfg_saved.sd), a        ; ...
    ret


; OUT -  A = 1 if ext board present, 0 otherwise
; OUT -  F - garbage
; OUT - BC - garbage
detect_ext_board:
    ld bc, #e0ff    ; read port #e0ff
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


; Check if external AY addon is connected to zx bus
; If yes - disable internal AY and TSFM on extension board
detect_external_ay:
    ld bc, #08ff    ; disable main AY
    xor a           ; ...
    out (c), a      ; ...
    ld b, #e1       ; disable extension board's AY
    out (c), a      ; ...
    ld bc, #fffd    ; set AY register = R6
    ld a, 6         ; ...
    out (c), a      ; ...
    ld b, #bf       ; write some value to register
    out (c), a      ; ...
    ld b, #ff       ; read back this value
    in a, (c)       ; ...
    cp 6                      ; if read and written values are same - disable internal AY
    ret nz                    ; ...
    xor a                     ; ...
    ld (cfg_saved.ay), a      ; ...
    ld (cfgext_saved.tsfm), a ; ...
    ret


; Check if external BDI (TR-DOS) addon is connected to zx-bus
; If yes - set SD to ZC mode
detect_external_bdi:
    ld a, #10                ; BDI entry points is inactive if basic128 is selected
    ld bc, #7ffd             ; ... so we choose basic48
    out (c), a               ; ...
    ld a, #c9                ; write RET opcode to 5cc2
    ld hl, #5cc2             ; ...
    ld (hl), a               ; ...
    call .sub                ; do tr-dos call
    cp #42                   ; if there is no tr-dos then our #3d2f handler will be called, which sets a = #42
    ld a, #0                 ; revert to default #7ffd state
    out (c), a               ; ...
    ret z                    ; if a == #42 (no tr-dos) - just exit
.reconfig:                   ; ... otherwise disable esxdos
    ld a, (cfg_saved.sd)     ; if (sd != off) sd = zc
    or a                     ; ...
    ret z                    ; ...
    ld a, 2                  ; ...
    ld (cfg_saved.sd), a     ; ...
    ret
.sub:
    push hl                  ; call tr-dos rom procedure, which just does ret to HL
    jp trdos_3d2f_entrypoint ; ...


; Check if user holds CS key on poweron. If true - boot with custom rom
check_custom_rom:
    ld a, #fe                    ; read cs,z,x,c,v
    in a, (#fe)                  ; ...
    bit 0, a                     ; check CS is pressed
    jr nz, .check_custom_rom     ; ... skip menu if no
.show_menu:
    ld a, 1                      ; show magic border
    ld bc, #01ff                 ; ...
    out (c), a                   ; ...
    call bootmenu                ; ... else show boot menu
.check_custom_rom:
    ld a, (cfg_saved.custom_rom) ; which rom was choosen?
    or a                         ; ... do nothing if default
    ret z                        ; ...
.custom_rom_boot:
    xor a                        ; else - disable ula+
    ld (cfg_saved.ulaplus), a    ; ...
    ld a, (cfg_saved.sd)         ; if (sd != off) sd = zc
    or a                         ; ...
    ret z                        ; ...
    ld a, 2                      ; ...
    ld (cfg_saved.sd), a         ; ...
    ret


; OUT - A bit 1 if we are entering pause, 0 otherwise
check_entering_pause:
    xor a                       ; read pause key state in bit 1 of #00FF port
    in a, (#ff)                 ; ...
    ret


; OUT -  A = 1 if we are entering menu, A = 2 if we are leaving menu, A = 0 otherwise
; OUT -  F - garbage
check_entering_menu:
    xor a                       ; read magic key state in bit 0 of #00FF port
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
    bit 7, a             ; if bit 7 != 0 - assume no ulaplus there
    jr z, .save_ulaplus1 ; ... so save 0 (disabled) state
    xor a                ; ... for case when user will enable ulaplus in menu later
.save_ulaplus1:
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

mute_saa1099:
    ld bc, #ffff       ; select saa register
    ld a, #1c          ; ...
    out (c), a         ; ...
    ld b, #fe          ; mute
    xor a              ; ...
    out (c), a         ; ...
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
    call restore_screen
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

restore_screen:
    ld bc, 6912
    ld de, #4000
    ld hl, var_save_screen
    ldir
    ret


bootmenu:
    call input_init
    ld hl, menuboot
    call menu_init
    call menu_input_loop
    call wait_for_keys_release
    ret


nmi_pause:
    xor a
    ld (var_exit_flag), a
    call pause_init
.loop:
    ei
    halt
    call pause_process
    ld a, (var_exit_flag)
    or a
    jr z, .loop
.wait_for_pause_key_release:
    xor a              ; read magic/pause keys state from port #00FF
    in a, (#ff)        ; ...
    and #03            ; ...
    jr nz, .wait_for_pause_key_release
    ei                 ; second read to fix start button bouncing on 8bitdo gamepad
    halt               ; ...
.wait_for_pause_key_release2:
    xor a              ; read magic/pause keys state from port #00FF
    in a, (#ff)        ; ...
    and #03            ; ...
    jr nz, .wait_for_pause_key_release2
    ret


nmi_menu:
    call check_initialized     ; cpld and our variables may be not initialized at this point because magic rom was shadowed at start by external peripheral
    jr z, .init1               ; so we're initialize our variables for properly menu work, but skip cpld initialization as it already initialized itself with safe values
    call init_default_config
    ld a, 2                    ; default cpld sd card state - ZC
    ld (cfg_saved.sd), a       ; ...
    call detect_ext_board
    call load_config
    call save_initialized
.init1:
    ld hl, menudefault       ; if (ext board present) menu = menuext; else menu = menudefault;
    ld a, (var_ext_presence) ; ...
    or a                     ; ...
    jr z, .init2             ; ...
    ld hl, menuext           ; ...
.init2:
    ld (var_menumain), hl
    call menu_init
.loop:
    call menu_input_loop
    call wait_for_keys_release
    ret


menu_input_loop:
    xor a
    ld (var_exit_flag), a
    ld (var_exit_reboot), a
    ld (var_flash_error), a
.loop:
    ei
    halt
    call input_process ; B = 32 if exit key pressed
    bit 5, b
    ret nz
    call menu_process
    ld a, (var_exit_flag)
    or a
    jr z, .loop
    ret


wait_for_keys_release:
.loop:
    ei
    halt
    call input_process ; B = 0 if no keys pressed
    xor a
    or b
    jr nz, .loop
    xor a              ; read magic/pause keys state from port #00FF
    in a, (#ff)        ; ...
    and #03            ; ...
    jr nz, .loop
    ret


; Includes
    include config.asm
    include draw.asm
    include input.asm
    include pause.asm
    include menu.asm
    include menu_structure.asm
    include flash.asm
    include font.asm
    include strings.asm

    DISPLAY "Free space: ",/D,#2000-$
    ASSERT $ < #2000


; Rewrittable area to save user settings. Flash sector size = 4Kb
    ORG #2000
user_config_sector:
user_config_initialized: DB 0,0,0,0
user_config CFG_T


; BDI/TR-DOS detection routine. See detect_external_bdi
    ORG #3D2F
trdos_3d2f_entrypoint:
    nop
    ld a, #42
    ret

; Just some string at the end of ROM
    ORG #3FE8
    DB 0,"End of Sizif Magic ROM",0

; Variables
    ORG #C000
    include variables.asm
var_ram_func:
    .256 DB 0
    ASSERT $ < #EFF0

; Magic vectors
    ORG #F000
Exit_vector:
    ORG #F008
Readout_vector:

    ORG #FFBE
Stack_top:
    ORG #FFC0
Ulaplus_pallete:
    .64 DB 0


    CSPECTMAP "main.map"
    SAVEBIN "main.bin",0,16384
