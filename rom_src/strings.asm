    DB 0

    IFDEF SIZIFXXS
str_sizif: DB "SIZIF-XXS",0
str_sizif_end:
    ENDIF

    IFDEF SIZIF512
str_sizif: DB "SIZIF-512",0
str_sizif_end:
    ENDIF

str_pause DB " PAUSE ",0
str_pause_end:

str_exit: DB "Exit",0
str_exit_end:

str_exit_reboot: DB "& reboot     ",0
str_exit_reboot_end:

str_exit_no_reboot: DB "             ",0
str_exit_no_reboot_end:

str_on: DB "   ON",0
str_on_end:

str_off: DB "      OFF",0
str_off_end:

str_machine: DB "Machine",0
str_machine_end:

str_machine_48: DB "      48",0
str_machine_48_end:

str_machine_128: DB "     128",0
str_machine_128_end:

str_machine_3e: DB "     +3e",0
str_machine_3e_end:

str_machine_pentagon: DB "Pentagon",0
str_machine_pentagon_end:

str_cpu: DB "CPU freq",0
str_cpu_end:

str_cpu_35: DB "3.5MHz",0
str_cpu_35_end:

str_cpu_44: DB "4.4MHz",0
str_cpu_44_end:

str_cpu_52: DB "5.2MHz",0
str_cpu_52_end:

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

str_rom48_lg: DB "     LG",0
str_rom48_lg_end:

str_rom48_opense: DB " OpenSE",0
str_rom48_opense_end:

str_divmmc: DB "DivMMC",0
str_divmmc_end:

str_divmmc_noos: DB "NO OS",0
str_divmmc_noos_end:

str_ulaplus: DB "ULA+",0
str_ulaplus_end

str_dac: DB "DAC",0
str_dac_end

str_dac_covox: DB "   Covox",0
str_dac_covox_end

str_dac_sd: DB "      SD",0
str_dac_sd_end

str_dac_covoxsd: DB "Covox+SD",0
str_dac_covoxsd_end

str_tsfm: DB "TSFM+MIDI",0
str_tsfm_end

str_saa: DB "SAA1099",0
str_saa_end

str_gs: DB "GS",0
str_gs_end
