    STRUCT MENU_T
addr DW
items DB
height DB
y_row DB
y_pixel DB
    ENDS

    STRUCT MENUENTRY_T
text_addr DW
value_cb_addr DW
callback DW
reserved DW
    ENDS

    MACRO MENUDESCR label_addr, items
        MENU_T (label_addr) (items) (items+2) ((24-(items+2))/2) (((24-(items+2))/2)*8)
    ENDM

.menu:
    MENUENTRY_T str_machine     menu_machine_value_cb     menu_machine_cb
    MENUENTRY_T str_cpu         menu_clock_value_cb       menu_clock_cb
    MENUENTRY_T str_panning     menu_panning_value_cb     menu_panning_cb
    MENUENTRY_T str_joystick    menu_joystick_value_cb    menu_joystick_cb
    IFNDEF SIZIFXXS
    MENUENTRY_T str_rom48       menu_rom48_value_cb       menu_rom48_cb
    ENDIF
    MENUENTRY_T str_divmmc      menu_divmmc_value_cb      menu_divmmc_cb
    MENUENTRY_T str_ulaplus     menu_ulaplus_value_cb     menu_ulaplus_cb
    MENUENTRY_T str_dac         menu_dac_value_cb         menu_dac_cb
    MENUENTRY_T str_exit        menu_exit_value_cb        menu_exit_cb
    MENUENTRY_T 0
!menu: MENUDESCR .menu, ($-.menu)/MENUENTRY_T-1

.menuext:
    MENUENTRY_T str_machine     menu_machine_value_cb     menu_machine_cb
    MENUENTRY_T str_cpu         menu_clock_value_cb       menu_clock_cb
    MENUENTRY_T str_panning     menu_panning_value_cb     menu_panning_cb
    MENUENTRY_T str_joystick    menu_joystick_value_cb    menu_joystick_cb
    MENUENTRY_T str_rom48       menu_rom48_value_cb       menu_rom48_cb
    MENUENTRY_T str_divmmc      menu_divmmc_value_cb      menu_divmmc_cb
    MENUENTRY_T str_ulaplus     menu_ulaplus_value_cb     menu_ulaplus_cb
    MENUENTRY_T str_dac         menu_dac_value_cb         menu_dac_cb
    MENUENTRY_T str_tsfm        menu_tsfm_value_cb        menu_tsfm_cb
    MENUENTRY_T str_saa         menu_saa_value_cb         menu_saa_cb
    MENUENTRY_T str_gs          menu_gs_value_cb          menu_gs_cb
    MENUENTRY_T str_exit        menu_exit_value_cb        menu_exit_cb
    MENUENTRY_T 0
!menuext: MENUDESCR .menuext, ($-.menuext)/MENUENTRY_T-1


menu_machine_value_cb:
    ld ix, .values_table
    ld a, (cfg.machine)
    jp menu_value_get
.values_table:
    DW str_machine_48_end-2
    DW str_machine_128_end-2
    DW str_machine_3e_end-2
    DW str_machine_pentagon_end-2

menu_clock_value_cb:
    ld ix, .values_table
    ld a, (cfg.clock)
    jp menu_value_get
.values_table:
    DW str_cpu_35_end-2
    DW str_cpu_44_end-2
    DW str_cpu_52_end-2
    DW str_cpu_7_end-2
    DW str_cpu_14_end-2

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
    DW str_panning_mono_end-2
    DW str_panning_abc_end-2
    DW str_panning_acb_end-2

menu_joystick_value_cb:
    ld ix, .values_table
    ld a, (cfg.joystick)
    jp menu_value_get
.values_table:
    DW str_joystick_kempston_end-2
    DW str_joystick_sinclair_end-2

menu_rom48_value_cb:
    ld ix, .values_table
    ld a, (cfg.rom48)
    jp menu_value_get
.values_table:
    DW str_rom48_default_end-2
    DW str_rom48_lg_end-2
    DW str_rom48_opense_end-2

menu_divmmc_value_cb:
    ld ix, .values_table
    ld a, (cfg.divmmc)
    jp menu_value_get
.values_table:
    DW str_off_end-2
    DW str_on_end-2
    DW str_divmmc_noos_end-2

menu_ulaplus_value_cb:
    ld ix, .values_table
    ld a, (cfg.ulaplus)
    jp menu_value_get
.values_table:
    DW str_off_end-2
    DW str_on_end-2

menu_dac_value_cb:
    ld ix, .values_table
    ld a, (cfg.dac)
    jp menu_value_get
.values_table:
    DW str_off_end-2
    DW str_dac_covox_end-2
    DW str_dac_sd_end-2
    DW str_dac_covoxsd_end-2

menu_tsfm_value_cb:
    ld ix, .values_table
    ld a, (cfgext.tsfm)
    jp menu_value_get
.values_table:
    DW str_off_end-2
    DW str_on_end-2

menu_saa_value_cb:
    ld ix, .values_table
    ld a, (cfgext.saa)
    jp menu_value_get
.values_table:
    DW str_off_end-2
    DW str_on_end-2

menu_gs_value_cb:
    ld ix, .values_table
    ld a, (cfgext.gs)
    jp menu_value_get
.values_table:
    DW str_off_end-2
    DW str_on_end-2


menu_exit_value_cb:
    ld ix, .values_table
    ld a, (var_exit_reboot)
    jp menu_value_get
.values_table:
    DW str_exit_no_reboot_end-2
    DW str_exit_reboot_end-2

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

menu_divmmc_cb:
    ld a, (cfg.divmmc)
    ld c, 2
    call menu_handle_press
    ld (cfg.divmmc), a
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

