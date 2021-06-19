    DB 0

    IFDEF SIZIFXXS
str_sizif: DB "SIZIF-XXS",0
str_sizif_end:
    ENDIF

    IFDEF SIZIF512
str_sizif: DB "SIZIF-512",0
str_sizif_end:
    ENDIF

str_exit: DB "Exit",0
str_exit_end:

str_exit_reboot: DB "& reboot     ",0
str_exit_reboot_end:

str_exit_no_reboot: DB "             ",0
str_exit_no_reboot_end:

str_on: DB " ON",0
str_on_end:

str_off: DB "OFF",0
str_off_end:

str_timings: DB "Timings",0
str_timings_end:

str_timings_pentagon: DB "Pentagon",0
str_timings_pentagon_end:

str_timings_128: DB "     128",0
str_timings_128_end:

str_timings_48: DB "      48",0
str_timings_48_end:

str_cpu: DB "CPU freq",0
str_cpu_end:

str_cpu_35: DB "3.5MHz",0
str_cpu_35_end:

str_cpu_7: DB "  7MHz",0
str_cpu_7_end:

str_cpu_14: DB " 14MHz",0
str_cpu_14_end:

str_panning: DB "Panning",0
str_panning_end:

str_panning_abc: DB " ABC",0
str_panning_abc_end:

str_panning_acb: DB " ACB",0
str_panning_acb_end:

str_panning_mono: DB "Mono",0
str_panning_mono_end:

str_joystick: DB "Joystick",0
str_joystick_end:

str_joystick_kempston: DB "Kempston",0
str_joystick_kempston_end:

str_joystick_sinclair: DB "Sinclair",0
str_joystick_sinclair_end:

str_rom48: DB "48K ROM",0
str_rom48_end:

str_rom48_default: DB "Default",0
str_rom48_default_end:

str_rom48_alt: DB "    Alt",0
str_rom48_alt_end:

str_plus3: DB "+3",0
str_plus3_end:

str_featurelock: DB "Features",0
str_featurelock_end:

str_divmmc: DB "DivMMC",0
str_divmmc_end:

str_ram: DB "RAM",0
str_ram_end:

str_ram_48: DB " 48K",0
str_ram_48_end:

str_ram_128: DB "128K",0
str_ram_128_end:

str_ram_256: DB "256K",0
str_ram_256_end:

str_ram_512: DB "512K",0
str_ram_512_end:

