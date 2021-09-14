    DEVICE ZXSPECTRUM48
    OPT --syntax=F
    DEFINE TEST_BUILD

    org #4000
    ;INCBIN "EXOLON.SCR",0

    org #7070 
int_handler:
    ei
    reti

    org #7E00
; INT IM2 vector table
    .257 db #70 ; by Z80 user manual int vector is I * 256 + (D & 0xFE)
                ; but by other references and by T80/A-Z80 implementation int vector is I * 256 + D
                ; so we just play safe and use symmetric int handler address and vector table with one extra byte

    org #8000
app_begin:
    di
    call menu_init

    ld a, #7e            ; set our interrupt table address (#7Fxx)
    ld i, a              ; ...
    im 2
    ei
.loop:
    halt
    call input_process
    call menu_process
    ld a, #01
    out #fe, a
    ld a, (var_exit_flag)
    or a
    jr z, .loop

save_variables:
    ret


includes:
    include config.asm
    include draw.asm
    include input.asm
    include pause.asm
    include menu.asm
    include menu_structure.asm
    include font.asm
    include strings.asm

variables:
    include variables.asm

    DISPLAY "Application size: ",/D,$-app_begin
    CSPECTMAP "main_test.map"
    SAVESNA "main_test.sna",app_begin
    SAVEBIN "main_test.bin",#8000,#4000
