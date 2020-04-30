; Sizif-512 Service ROM.
; Runing while magic (NMI) buton hold and changes CPLD configuration register by keypresses.
; If no keypress was registered - jump to standart NMI handler. Otherwise - exit NMI.
    DEVICE ZXSPECTRUM48
    OPT --syntax=m


    ORG #0000
StartEnter:
    nop
    jp StartEnter

    ORG #0066
NmiEnter:               ; stack usage: 11 bytes
    nop
    push af
    push hl
    ld h, 0

Loop:
    ld a, #f7
    in a, (#fe)         ; read 0-5 keys
    bit 7, a            ; check magic buttons is hold
    jr nz, NmiExit      ; if no, exit

Key1:                   ; timings <= 0
    bit 0, a
    jr nz, Key2
    ld a, #40
    out (#ff), a
    jp KeyWasPressed
Key2:                   ; timings <= 1
    bit 1, a
    jr nz, Key3
    ld a, #41
    out (#ff), a
    jp KeyWasPressed
Key3:                   ; turbo <= 0
    bit 2, a
    jr nz, Key4
    ld a, #20
    out (#ff), a
    jp KeyWasPressed
Key4:                   ; turbo <= 1
    bit 3, a
    jr nz, Key5
    ld a, #21
    out (#ff), a
    jp KeyWasPressed
Key5:                   ; ay_abc <= 0
    bit 4, a
    jr nz, Key6
    ld a, #10
    out (#ff), a
    jp KeyWasPressed
Key6:                   ; ay_abc <= 1
    ld a, #ef
    in a, (#fe)
    bit 4, a
    jr nz, Key9
    ld a, #11
    out (#ff), a
    jp KeyWasPressed
Key9:                   ; extlock <= 0
    bit 1, a
    jr nz, Key0
    ld a, #80
    out (#ff), a
    jp KeyWasPressed
Key0:                   ; extlock <= 1
    bit 0, a
    jr nz, Loop
    ld a, #81
    out (#ff), a
    jp KeyWasPressed

KeyWasPressed:
    ld h, 1
    jp Loop


NmiExit:
    bit 0, h        ; was key pressed?
    jr nz, NmiLeave ; yes?
    jr NmiPass      ; no...

NmiPass: ; pass to default NMI handler
    ; load exit code into stack
    ; thats required to restore A register and EXTROM mapping
    LUA ALLPASS
        for i = 6, 0, -1 do --; 7 bytes total
            _pc("ld a, (NmiPassFromStack+"..i..")")
            _pc("push af")
            _pc("inc sp")   --; we don't need F register
        end
    ENDLUA
    jr NmiPassLeaveDo

NmiLeave: ; leave NMI handler and return to main program
    ; load exit code into stack
    ; thats required to restore A register and EXTROM mapping
    LUA ALLPASS
        for i = 6, 0, -1 do --; 7 bytes total
            _pc("ld a, (NmiLeaveFromStack+"..i..")")
            _pc("push af")
            _pc("inc sp")   --; we don't need F register
        end
    ENDLUA

NmiPassLeaveDo:
    ld hl, 0
    add hl, sp  ; copy SP to HL

    .7 inc sp   ; restore SP to point out our 7 bytes of code
    ld a, #08   ; restore EXTROM mapping later from stack
    jp (hl)     ; go to stack-placed NmiXXXFromStack

NmiPassFromStack:
    out (#ff), a ; 2 bytes
    pop hl       ; 1 byte
    pop af       ; 1 byte
    jp #0066     ; 3 bytes

NmiLeaveFromStack:
    out (#ff), a ; 2 bytes
    pop hl       ; 1 byte
    pop af       ; 1 byte
    retn         ; 2 bytes
    nop          ; 1 byte

    SAVEBIN "rom1.bin",0,16384
