    STRUCT MENU_T
text_addr DW
value_cb_addr DW
callback DW
reserved DW
    ENDS

menu:
    MENU_T str_timings     menu_timings_value_cb     menu_timins_cb
    MENU_T str_cpu         menu_clock_value_cb       menu_clock_cb
    MENU_T str_panning     menu_panning_value_cb     menu_panning_cb
    MENU_T str_joystick    menu_joystick_value_cb    menu_joystick_cb
    MENU_T str_ram         menu_ram_value_cb         menu_ram_cb
    MENU_T str_rom48       menu_rom48_value_cb       menu_rom48_cb
    MENU_T str_plus3       menu_plus3_value_cb       menu_plus3_cb
    MENU_T str_divmmc      menu_divmmc_value_cb      menu_divmmc_cb
    MENU_T str_exit        menu_exit_value_cb        menu_exit_cb
    MENU_T 0
MENU_ITEMS EQU ($-menu)/MENU_T-1


menu_timings_value_cb:
    ld ix, .values_table
    ld a, (cfg.timings)
    jp menu_value_get
.values_table:
    DW str_timings_pentagon_end-2
    DW str_timings_48_end-2
    DW str_timings_128_end-2

menu_clock_value_cb:
    ld ix, .values_table
    ld a, (cfg.clock)
    jp menu_value_get
.values_table:
    DW str_cpu_35_end-2
    DW str_cpu_7_end-2
    DW str_cpu_14_end-2

menu_panning_value_cb:
    ld ix, .values_table
    ld a, (cfg.panning)
    jp menu_value_get
.values_table:
    DW str_panning_abc_end-2
    DW str_panning_acb_end-2
    DW str_panning_mono_end-2

menu_joystick_value_cb:
    ld ix, .values_table
    ld a, (cfg.joystick)
    jp menu_value_get
.values_table:
    DW str_joystick_kempston_end-2
    DW str_joystick_sinclair_end-2

menu_ram_value_cb:
    ld ix, .values_table
    ld a, (cfg.ram)
    or a
    jr nz, .less_than_512K
    ld a, (cfg.divmmc)           ; 256K with divmmc
    or a                         ; ...
    jr z, .is_512K               ; ...
    ld a, 3                      ; ...   
    jp menu_value_get
.is_512K:
    xor a
.less_than_512K:
    jp menu_value_get
.values_table:
    DW str_ram_512_end-2
    DW str_ram_48_end-2
    DW str_ram_128_end-2
    DW str_ram_256_end-2

menu_rom48_value_cb:
    ld ix, .values_table
    ld a, (cfg.rom48)
    jp menu_value_get
.values_table:
    DW str_rom48_default_end-2
    DW str_rom48_alt_end-2

menu_plus3_value_cb:
    ld ix, .values_table
    ld a, (cfg.plus3)
    jp menu_value_get
.values_table:
    DW str_off_end-2
    DW str_on_end-2

menu_divmmc_value_cb:
    ld ix, .values_table
    ld a, (cfg.divmmc)
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


menu_timins_cb:
    ld a, (cfg.timings)
    ld c, 2
    call menu_handle_press
    ld (cfg.timings), a
    ld bc, #02ff
    out (c), a
    ret

menu_clock_cb:
    ld a, (cfg.clock)
    ld c, 2
    call menu_handle_press
    ld (cfg.clock), a
    ld bc, #03ff
    out (c), a
    ret

menu_panning_cb:
    ld a, (cfg.panning)
    ld c, 2
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

menu_ram_cb:
    ld a, (cfg.ram)
    ld c, 2
    call menu_handle_press
    ld (cfg.ram), a
    ld bc, #08ff
    out (c), a
    ret

menu_rom48_cb:
    ld a, (cfg.rom48)
    ld c, 1
    call menu_handle_press
    ld (cfg.rom48), a
    ld bc, #06ff
    out (c), a
    ret

menu_plus3_cb:
    ld a, (cfg.plus3)
    ld c, 1
    call menu_handle_press
    ld (cfg.plus3), a
    ld bc, #05ff
    out (c), a
    ret

menu_divmmc_cb:
    ld a, (cfg.divmmc)
    ld c, 1
    call menu_handle_press
    ld (cfg.divmmc), a
    ld bc, #09ff
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
    cp c                    ; if (value == max) value = 0
    jr z, .increment_roll   ; ...
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

