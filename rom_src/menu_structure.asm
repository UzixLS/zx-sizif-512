    STRUCT MENU_T
addr DW
items DB
height DB
y_row DB
y_pixel DB
width DB
x DB
x_logo DB
    ENDS

    STRUCT MENUENTRY_T
text_addr DW
value_cb_addr DW
callback DW
reserved DW
    ENDS

    MACRO MENU_DEF width
        MENU_T {
            ($+MENU_T)
            (((.end-$)/MENUENTRY_T-1))
            (((.end-$)/MENUENTRY_T-1)+2)
            ( (24-(((.end-$)/MENUENTRY_T-1)+2))/2)
            (((24-(((.end-$)/MENUENTRY_T-1)+2))/2)*8)
            (width)
            ( (32-width)/2)
            (((32-width)/2)+width-6)
        }
    ENDM

menudefault: MENU_DEF 20
    MENUENTRY_T str_cpu         menu_clock_value_cb       menu_clock_cb
    MENUENTRY_T str_machine     menu_machine_value_cb     menu_machine_cb
    MENUENTRY_T str_panning     menu_panning_value_cb     menu_panning_cb
    MENUENTRY_T str_joystick    menu_joystick_value_cb    menu_joystick_cb
    MENUENTRY_T str_rom48       menu_rom48_value_cb       menu_rom48_cb
    MENUENTRY_T str_sd          menu_sd_value_cb          menu_sd_cb
    MENUENTRY_T str_ulaplus     menu_ulaplus_value_cb     menu_ulaplus_cb
    MENUENTRY_T str_dac         menu_dac_value_cb         menu_dac_cb
    MENUENTRY_T str_menuadv     0                         menu_menuadv_cb
    MENUENTRY_T str_exit        menu_exit_value_cb        menu_exit_cb
    MENUENTRY_T 0
.end:

menuext: MENU_DEF 20
    MENUENTRY_T str_cpu         menu_clock_value_cb       menu_clock_cb
    MENUENTRY_T str_machine     menu_machine_value_cb     menu_machine_cb
    MENUENTRY_T str_panning     menu_panning_value_cb     menu_panning_cb
    MENUENTRY_T str_joystick    menu_joystick_value_cb    menu_joystick_cb
    MENUENTRY_T str_rom48       menu_rom48_value_cb       menu_rom48_cb
    MENUENTRY_T str_sd          menu_sd_value_cb          menu_sd_cb
    MENUENTRY_T str_ulaplus     menu_ulaplus_value_cb     menu_ulaplus_cb
    MENUENTRY_T str_dac         menu_dac_value_cb         menu_dac_cb
    MENUENTRY_T str_tsfm        menu_tsfm_value_cb        menu_tsfm_cb
    MENUENTRY_T str_saa         menu_saa_value_cb         menu_saa_cb
    MENUENTRY_T str_gs          menu_gs_value_cb          menu_gs_cb
    MENUENTRY_T str_menuadv     0                         menu_menuadv_cb
    MENUENTRY_T str_exit        menu_exit_value_cb        menu_exit_cb
    MENUENTRY_T 0
.end:

menuadv: MENU_DEF 22
    MENUENTRY_T str_sd_indication menu_sdind_value_cb     menu_sdind_cb
    MENUENTRY_T str_bright_boost  menu_bright_value_cb    menu_bright_cb
    MENUENTRY_T str_autoturbo     menu_autoturbo_value_cb menu_autoturbo_cb
    MENUENTRY_T str_zxkit1        menu_zxkit1_value_cb    menu_zxkit1_cb
    MENUENTRY_T str_save_settings menu_cfgsave_value_cb   menu_cfgsave_cb
    MENUENTRY_T str_back          0                       menu_back_cb
    MENUENTRY_T 0
.end:

menuboot: MENU_DEF 16
    MENUENTRY_T str_normal_boot   0                       menu_boot_normal_cb
    IFNDEF REV_C
    MENUENTRY_T str_zx80          0                       menu_boot_zx80_cb
    MENUENTRY_T str_zx81          0                       menu_boot_zx81_cb
    MENUENTRY_T str_negluk        0                       menu_boot_negluk_cb
    ENDIF
    MENUENTRY_T 0
.end:



menu_machine_value_cb:
    ld ix, .values_table
    ld a, (cfg.machine)
    jp menu_value_get
.values_table:
    DW str_machine_48.end-2
    DW str_machine_128.end-2
    DW str_machine_3e.end-2
    DW str_machine_pentagon.end-2

menu_clock_value_cb:
    ld ix, .values_table
    ld a, (cfg.clock)
    jp menu_value_get
.values_table:
    DW str_cpu_35.end-2
    DW str_cpu_44.end-2
    DW str_cpu_52.end-2
    DW str_cpu_7.end-2
    DW str_cpu_14.end-2

menu_panning_value_cb:
    ld ix, .values_table
    ld a, (var_ext_presence) ; if (ext_board && tsfm) - use ABC instead of ACB panning
    or a                     ; ...
    jr z, .no_tsfm           ; ...
    ld a, (cfgext.tsfm)      ; ...
    or a                     ; ...
    jr z, .no_tsfm           ; ...
    ld a, (cfg.panning)
    cp a, 2                  ; if (panning == acb) panning = abc
    jr c, .get               ; ...
    dec a                    ; ...
.get
    jp menu_value_get
.no_tsfm:
    ld a, (cfg.panning)
    jp menu_value_get
.values_table:
    DW str_panning_mono.end-2
    DW str_panning_abc.end-2
    DW str_panning_acb.end-2

menu_joystick_value_cb:
    ld ix, .values_table
    ld a, (cfg.joystick)
    jp menu_value_get
.values_table:
    DW str_joystick_kempston.end-2
    DW str_joystick_sinclair.end-2

menu_rom48_value_cb:
    ld ix, .values_table
    ld a, (cfg.rom48)
    jp menu_value_get
.values_table:
    DW str_rom48_default.end-2
    DW str_rom48_lg.end-2
    DW str_rom48_opense.end-2

menu_sd_value_cb:
    ld ix, .values_table
    ld a, (cfg.sd)
    jp menu_value_get
.values_table:
    DW str_off.end-2
    DW str_divmmc.end-2
    DW str_zc3e.end-2

menu_ulaplus_value_cb:
    ld ix, .values_table
    ld a, (cfg.ulaplus)
    jp menu_value_get
.values_table:
    DW str_off.end-2
    DW str_on.end-2

menu_dac_value_cb:
    ld ix, .values_table
    ld a, (cfg.dac)
    jp menu_value_get
.values_table:
    DW str_off.end-2
    DW str_dac_covox.end-2
    DW str_dac_sd.end-2
    DW str_dac_covoxsd.end-2

menu_tsfm_value_cb:
    ld ix, .values_table
    ld a, (cfgext.tsfm)
    jp menu_value_get
.values_table:
    DW str_off.end-2
    DW str_on.end-2

menu_saa_value_cb:
    ld ix, .values_table
    ld a, (cfgext.saa)
    jp menu_value_get
.values_table:
    DW str_off.end-2
    DW str_on.end-2

menu_gs_value_cb:
    ld ix, .values_table
    ld a, (cfgext.gs)
    jp menu_value_get
.values_table:
    DW str_off.end-2
    DW str_on.end-2

menu_exit_value_cb:
    ld ix, .values_table
    ld a, (var_exit_reboot)
    jp menu_value_get
.values_table:
    DW str_exit_no_reboot.end-2
    DW str_exit_reboot.end-2

menu_sdind_value_cb:
    ld ix, .values_table
    ld a, (cfg.sdind)
    jp menu_value_get
.values_table:
    DW str_off_short.end-2
    DW str_on_short.end-2

menu_bright_value_cb:
    ld ix, .values_table
    ld a, (cfg.bright)
    jp menu_value_get
.values_table:
    DW str_off_short.end-2
    DW str_on_short.end-2

menu_autoturbo_value_cb:
    ld ix, .values_table
    ld a, (cfg.autoturbo)
    jp menu_value_get
.values_table:
    DW str_off_short.end-2
    DW str_on_short.end-2

menu_zxkit1_value_cb:
    ld ix, .values_table
    ld a, (cfg.zxkit1)
    jp menu_value_get
.values_table:
    DW str_off_short.end-2
    DW str_on_short.end-2

menu_cfgsave_value_cb:
    ld ix, .values_table
    ld a, (var_flash_error)
    jp menu_value_get
.values_table:
    DW str_no_error.end-2
    DW str_error.end-2


menu_value_get:
    sla a
    ld c, a
    ld b, 0
    add ix, bc
    ld l, (ix+0)
    ld h, (ix+1)
    ret



menu_machine_cb:
    ld a, (cfg.machine)
    ld c, 3
    call menu_handle_press
    ld (cfg.machine), a
    ld bc, #02ff
    out (c), a
    ret

menu_clock_cb:
    ld a, (cfg.clock)
    ld c, 4
    call menu_handle_press
    ld (cfg.clock), a
    ld bc, #03ff
    out (c), a
    ret

menu_panning_cb:
    ld a, (var_ext_presence) ; if (ext_board && tsfm) - do not allow to set ACB panning
    or a                     ; ...
    jr z, .no_tsfm           ; ...
    ld a, (cfgext.tsfm)      ; ...
    or a                     ; ...
    jr z, .no_tsfm           ; ...
    ld a, (cfg.panning)      ; ...
    ld c, 1                  ; ...
    jr .load
.no_tsfm:
    ld a, (cfg.panning)
    ld c, 2
.load:
    call menu_handle_press
    ld (cfg.panning), a
    ld bc, #04ff
    out (c), a
    ret

menu_joystick_cb:
    ld a, (cfg.joystick)
    ld c, 1
    call menu_handle_press
    ld (cfg.joystick), a
    ld bc, #07ff
    out (c), a
    ret

menu_rom48_cb:
    ld a, (cfg.rom48)
    IFDEF REV_C
        ld c, 1
    ELSE
        ld c, 2
    ENDIF
    call menu_handle_press
    ld (cfg.rom48), a
    ld bc, #06ff
    out (c), a
    ret

menu_sd_cb:
    ld a, (cfg.sd)
    ld c, 2
    call menu_handle_press
    ld (cfg.sd), a
    ld bc, #09ff
    out (c), a
    ret

menu_ulaplus_cb:
    ld a, (cfg.ulaplus)
    ld c, 1
    call menu_handle_press
    ld (cfg.ulaplus), a
    ld bc, #0aff
    out (c), a
    ret

menu_dac_cb:
    ld a, (cfg.dac)
    ld c, 3
    call menu_handle_press
    ld (cfg.dac), a
    ld bc, #0bff
    out (c), a
    ret

menu_tsfm_cb:
    ld a, (cfgext.tsfm)
    ld c, 1
    call menu_handle_press
    ld (cfgext.tsfm), a
    ld bc, #e1ff
    out (c), a
    ret

menu_saa_cb:
    ld a, (cfgext.saa)
    ld c, 1
    call menu_handle_press
    ld (cfgext.saa), a
    ld bc, #e2ff
    out (c), a
    ret

menu_gs_cb:
    ld a, (cfgext.gs)
    ld c, 1
    call menu_handle_press
    ld (cfgext.gs), a
    ld bc, #e3ff
    out (c), a
    ret

menu_exit_cb:
    bit 4, d                ; action?
    jr nz, .exit
    ld a, (var_exit_reboot)
    ld c, 1
    call menu_handle_press
    ld (var_exit_reboot), a
    ret
.exit
    ld a, 1
    ld (var_exit_flag), a
    ret

menu_menuadv_cb:
    ld hl, menuadv
    call menu_init
    ret

menu_sdind_cb:
    ld a, (cfg.sdind)
    ld c, 1
    call menu_handle_press
    ld (cfg.sdind), a
    ld bc, #0cff
    out (c), a
    ret

menu_bright_cb:
    ld a, (cfg.bright)
    ld c, 1
    call menu_handle_press
    ld (cfg.bright), a
    ld bc, #0dff
    out (c), a
    ret

menu_autoturbo_cb:
    ld a, (cfg.autoturbo)
    ld c, 1
    call menu_handle_press
    ld (cfg.autoturbo), a
    ld bc, #0eff
    out (c), a
    ret

menu_zxkit1_cb:
    ld a, (cfg.zxkit1)
    ld c, 1
    call menu_handle_press
    ld (cfg.zxkit1), a
    ld bc, #0fff
    out (c), a
    ret

menu_cfgsave_cb:
    bit 4, d                ; action?
    ret z
    call save_user_config
    or a                    ; a == 1 means error
    ret nz                  ; ...
    push de
    ld a, 1
    ld b, SAVE_ANIMATION_LEN    ; show some border effect to provide feedback about operation
.loop:                          ; ...
    push bc                     ; ...
    call .save_animation_effect ; ...
    pop bc                      ; ...
    djnz .loop                  ; ...
    pop de
    ret
.save_animation_effect:
    ld e, 255
.loop_outer:
    inc a                       ; toggle border
    and 1                       ; ...
    ld bc, #01ff                ; ...
    out (c), a                  ; ...
    ld d, 255
.loop_inner:
    dec d
    jr nz, .loop_inner
    dec e
    jr nz, .loop_outer
    ret

menu_back_cb:
    call restore_screen
    ld hl, (var_menumain)
    jp menu_init

menu_boot_normal_cb:
    bit 4, d                ; action?
    ret z
    ld a, 0
    ld (cfg_saved.custom_rom), a
    ld a, 1
    ld (var_exit_flag), a
    ret

menu_boot_zx80_cb:
    bit 4, d                ; action?
    ret z
    ld a, #81
    ld (cfg_saved.custom_rom), a
    ld a, 1
    ld (var_exit_flag), a
    ret

menu_boot_zx81_cb:
    bit 4, d                ; action?
    ret z
    ld a, #80
    ld (cfg_saved.custom_rom), a
    ld a, 1
    ld (var_exit_flag), a
    ret

menu_boot_negluk_cb:
    bit 4, d                ; action?
    ret z
    ld a, #83
    ld (cfg_saved.custom_rom), a
    ld a, 1
    ld (var_exit_flag), a
    ret


; IN  -  A - variable to change
; IN  -  C - max value
; IN  -  D - pressed key
; OUT -  A - new variable value
menu_handle_press:
    bit 4, d                ; action?
    jr nz, .increment
    bit 0, d                ; right?
    jr nz, .increment
    bit 1, d                ; left?
    jr nz, .decrement
    ret
.increment:
    cp c                    ; if (value >= max) value = 0
    jr nc, .increment_roll  ; ...
    inc a                   ; else value++
    ret
.increment_roll:
    xor a                   ; value = 0
    ret
.decrement:
    or a                    ; if (value == 0) value = max
    jr z, .decrement_roll   ; ...
    dec a                   ; else value--
    ret
.decrement_roll:
    ld a, c                 ; value = max
    ret
