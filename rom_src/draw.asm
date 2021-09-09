; IN  -  B = pixel row (0..191)
; IN  -  C = character column (0..31)
; OUT - HL = screen address
; OUT - DE = garbage
; OUT - AF = garbage
coords_to_pixel_address:
    ld  h, 0
    ld  l, b            ; hl = row
    add hl, hl          ; hl = row number * 2
    ld  de, screen_map  ; de = screen map
    add hl, de          ; de = screen_map + (row * 2)
    ld  a, (hl)         ; implements ld hl, (hl)
    inc hl
    ld  h, (hl)         
    ld  l, a            ; hl = address of first pixel in screen map
    ld  d, 0
    ld  e, c            ; de = X (character based)
    add hl, de          ; hl = screen addr + 32
    ret                 ; return screen_map[pixel_row]

screen_map:     
    DW #4000, #4100, #4200, #4300, #4400, #4500, #4600, #4700
    DW #4020, #4120, #4220, #4320, #4420, #4520, #4620, #4720
    DW #4040, #4140, #4240, #4340, #4440, #4540, #4640, #4740
    DW #4060, #4160, #4260, #4360, #4460, #4560, #4660, #4760
    DW #4080, #4180, #4280, #4380, #4480, #4580, #4680, #4780
    DW #40A0, #41A0, #42A0, #43A0, #44A0, #45A0, #46A0, #47A0
    DW #40C0, #41C0, #42C0, #43C0, #44C0, #45C0, #46C0, #47C0
    DW #40E0, #41E0, #42E0, #43E0, #44E0, #45E0, #46E0, #47E0
    DW #4800, #4900, #4A00, #4B00, #4C00, #4D00, #4E00, #4F00
    DW #4820, #4920, #4A20, #4B20, #4C20, #4D20, #4E20, #4F20
    DW #4840, #4940, #4A40, #4B40, #4C40, #4D40, #4E40, #4F40
    DW #4860, #4960, #4A60, #4B60, #4C60, #4D60, #4E60, #4F60
    DW #4880, #4980, #4A80, #4B80, #4C80, #4D80, #4E80, #4F80
    DW #48A0, #49A0, #4AA0, #4BA0, #4CA0, #4DA0, #4EA0, #4FA0
    DW #48C0, #49C0, #4AC0, #4BC0, #4CC0, #4DC0, #4EC0, #4FC0
    DW #48E0, #49E0, #4AE0, #4BE0, #4CE0, #4DE0, #4EE0, #4FE0
    DW #5000, #5100, #5200, #5300, #5400, #5500, #5600, #5700
    DW #5020, #5120, #5220, #5320, #5420, #5520, #5620, #5720
    DW #5040, #5140, #5240, #5340, #5440, #5540, #5640, #5740
    DW #5060, #5160, #5260, #5360, #5460, #5560, #5660, #5760
    DW #5080, #5180, #5280, #5380, #5480, #5580, #5680, #5780
    DW #50A0, #51A0, #52A0, #53A0, #54A0, #55A0, #56A0, #57A0
    DW #50C0, #51C0, #52C0, #53C0, #54C0, #55C0, #56C0, #57C0
    DW #50E0, #51E0, #52E0, #53E0, #54E0, #55E0, #56E0, #57E0


; IN  -  B = pixel row (0..191)
; IN  -  C = character column (0..31)
; OUT - HL = screen address
; OUT - AF = garbage
coords_to_attribute_address_pixelrow:
    ; attribute address - 010110vv vvvhhhhh
    ld a, b    ; A = { v4, v3, v2, v1, v0, x, x, x }
    rlca       ; A = { v2, v1, v0, x, x, x, v4, v3 }
    rlca       ; ...
    jr .do_work
; IN  -  B = character row (0..23)
; IN  -  C = character column (0..31)
; OUT - HL = screen address
; OUT -  A = garbage
!coords_to_attribute_address:
    ; attribute address - 010110vv vvvhhhhh
    ld a, b    ; A = { 0, 0, 0, v4, v3, v2, v1, v0 }
    rrca       ; A = { v2, v1, v0, 0, 0, 0, v4, v3 }
    rrca       ; ...
    rrca       ; ...
.do_work:
    ld h, a    ; save A temporary
    and a, #E0 ; A = { v2, v1, v0, 0, 0, 0 ,0 ,0 }
    or c       ; A = { v2, v1, v0, h4, h3, h2, h1, h0 }
    ld l, a    ;
    ld a, h    ; restore A = { v2, v1, v0, x, x, x, v4, v3 }
    and a, #03 ; A = { 000000, v4, v3 }
    or a, #58  ; A = { 010110, v4, v3 }
    ld h, a    ; HL = attribute address
    ret


; print one characters at specified coordinate
; IN  -  A = ascii code
; IN  -  B = row (0..191)
; IN  -  C = column (0..31)
; OUT - AF = garbage
; OUT -  B = garbage
; OUT - DE = garbage
; OUT - HL = garbage
; OUT - IX = garbage
print_char:
    sub 32       ; A = A - 32 (offset of first printable ASCII code)
    ld ix, 0     ; IX = character index in font
    ld d, 0      ; ..
    ld e, a      ; ..
    add ix, de   ; ..
    add ix, ix   ; ix *= 8 (8 bytes per character in font)
    add ix, ix   ; ...
    add ix, ix   ; ...
    ld de, font  ; ix = &font + character index
    add ix, de   ; ...
    xor a        ; A = 0 (row counter)
.loop:
    push af
    call coords_to_pixel_address ; HL = screen address
    ld a, (ix)         ; A = pixel data
    ld (hl), a         ; draw pixel data to screen
    pop af             ; restore A = row counter
    inc b              ; row += 1
    inc ix             ; next line in character
    inc a              ; if (++A >= 8) - exit
    and a, 7           ; ...
    jr nz, .loop       ; ...
    ret


; print null-terminated string
; IN  -  B - row
; IN  -  C - column
; IN  - HL - string
; OUT -  C - last printed column
; OUT - HL - pointer to string 0 byte
; OUT - AF - garbage
; OUT -  B = garbage
; OUT - DE - garbage
; OUT - IX = garbage
print_string:
    ld a, (hl)              ; A = *string
    or a                    ; if (A == 0) - exit
    ret z                   ; ...
    push bc
    push hl
    call print_char
    pop hl
    pop bc
    inc hl                  ; string++
    inc c                   ; column++
    jr print_string
    ret


; print null-terminated string reverse
; IN  -  B - row
; IN  -  C - column
; IN  - HL - string
; OUT -  C - last printed column
; OUT - HL - pointer to string 0 byte
; OUT - AF - garbage
; OUT -  B = garbage
; OUT - DE - garbage
; OUT - IX = garbage
print_string_rev:
    ld a, (hl)              ; A = *string
    or a                    ; if (A == 0) - exit
    ret z                   ; ...
    push bc
    push hl
    call print_char
    pop hl
    pop bc
    dec hl                  ; string--
    dec c                   ; column--
    jr print_string_rev
    ret


; IN  -  B - start row (0..23)
; IN  -  C - start column (0..31)
; IN  -  D - rows
; IN  -  E - columns
; OUT -  B - end row
; OUT -  D - garbage
; OUT -  E - garbage
; OUT - AF - garbage
draw_box:
    push bc
    push de
.draw_header:
    call coords_to_attribute_address ; HL = attribute address
    ld a, e             ; A = columns
.draw_header_column:
    or a                ; if (columns == 0) - goto next row
    jr z, .draw_body    ; ...
    ld (hl), MENU_HEADER_ATTR ; set attribute
    inc hl              ; next column attribute address
    dec a               ; columns = columns - 1;
    jr .draw_header_column

.draw_body:
    inc b               ; current_row += 1
    dec d               ; rows -= 1
    jr z, .draw_body_end ; if (rows == 0) - exit
    call coords_to_attribute_address ; HL = attribute address
    ld a, e             ; A = columns
.draw_body_column:
    or a                ; if (columns == 0) - goto next row
    jr z, .draw_body    ; ...
    ld (hl), MENU_BODY_ATTR ; set attribute
    inc hl              ; next column attribute address
    dec a               ; columns = columns - 1;
    jr .draw_body_column

.draw_body_end:
    pop de
    pop bc
    push bc
    push de
    sla b               ; current_row = current_row_pixel_address
    sla b               ; ...
    sla b               ; ...
    sla d               ; rows = rows_pixels
    sla d               ; ...
    sla d               ; ...
    dec d               ; rows_pixels -= 1 (fill be filled later by frame)
.fill:
    push de
    push de
    call coords_to_pixel_address
    pop de
.fill_line:
    ld (hl), 0          ; clear pixels
    inc hl              ; column++
    dec e               ; columns--
    jr nz, .fill_line   ; if (columns == 0) - goto next row
    pop de
    inc b               ; row++
    dec d               ; rows--
    jr nz, .fill        ; if (rows == 0) - exit

.fill_end:
    pop de
    pop bc
    inc b               ; current_row += 1
    sla b               ; current_row = current_row_pixel_address
    sla b               ; ...
    sla b               ; ...
    dec d               ; rows -= 1
    sla d               ; rows = rows_pixels
    sla d               ; ...
    sla d               ; ...
.draw_frame_lr:
    push de
    call coords_to_pixel_address ; HL = pixel_address
    pop de
    push de
    ld (hl), #80        ; draw left frame line
    ld d, 0
    add hl, de          ; pixel_address += columns
    dec hl
    ld (hl), #01        ; draw right frame line
    pop de
    inc b               ; current_row_pixel += 1
    dec d               ; rows -= 1
    jr nz, .draw_frame_lr ; if (rows == 0) - exit

.draw_frame_low:
    ld (hl), #ff        ; draw low frame line starting from right corner
    dec hl              ; pixel_address -= one column
    dec e               ; columns -= 1
    jr nz, .draw_frame_low

.return:
    ret


; IN  -  B - start row (0..191)
; IN  -  C - start column (0..31)
; IN  -  E - columns
; IN  - HL - menu addr
; OUT - AF - garbage
; OUT - BC - garbage
; OUT - DE - garbage
; OUT - HL - garbage
; OUT - IX - garbage
draw_menu:
    ld a, c              ; column_to_print_value = start_column + columns - 3
    add a, e             ; ...
    sub 3                ; ...
    ld e, a              ; ...  
    push hl              ; IX = menu first item addr
    pop ix               ; ...
.line_loop:
    ld l, (ix+MENUENTRY_T.text_addr+0) ; HL = menuentry_t.textaddr
    ld h, (ix+MENUENTRY_T.text_addr+1) ; ...
    ld a, h              ; if (HL == 0) - exit
    or l                 ; ...
    ret z                ; ...
    push de
    push bc
    push ix
    call print_string    ; print menu item text
    pop ix
    pop bc
    pop de
    dec sp               ; DE will be restored in .skip_val
    dec sp               ; ...
.print_val:
    ld l, (ix+MENUENTRY_T.value_cb_addr+0) ; HL = menuentry_t.value_cb_addr
    ld h, (ix+MENUENTRY_T.value_cb_addr+1) ; ...
    ld a, h              ; if (HL == 0) - skip value print
    or l                 ; ...
    jr z, .skip_val      ; ...
    push ix
    push bc
    call .value_cb       ; HL = value text addr. AF, BC, IX may be changed
    pop bc
    dec sp
    dec sp
    ld c, e               ; column = column_to_print_value
    call print_string_rev ; print value text
    pop bc
    pop ix
.skip_val:
    ld a, b              ; row += 8
    add a, 8             ; ...
    ld b, a              ; ...
    ld de, MENUENTRY_T   ; IX = IX + sizeof(menuentry_t)
    add ix, de           ; ...
    pop de               ; restore E - columns
    jr .line_loop
.return:
    ret

.value_cb:
    jp (hl)


; IN  -  B - row (0..24)
; IN  -  C - start column (0..31)
; IN  -  D - attribute byte to use
; IN  -  E - columns
; OUT - AF - garbage
; OUT -  B - garbage
; OUT -  E - garbage
; OUT - HL - garbage
draw_attribute_line:
    call coords_to_attribute_address ; HL = attribute address
.loop:
    ld a, e                      ; if (columns == 0) - exit
    or a                         ; ...
    ret z                        ; ...
    ld (hl), d                   ; write attribute
    inc hl                       ; column++
    dec e                        ; columns--
    jr .loop
    ret


; IN  -  B - start row (0..191)
; IN  -  C - start column (0..31)
; IN  -  E - color cycle (0..4)
; OUT - AF - garbage
; OUT - BC - garbage
; OUT - DE - garbage
; OUT - HL - garbage
; OUT - IX - garbage
draw_logo:
    call coords_to_attribute_address_pixelrow ; HL = attribute address
    ld ix, logo_colors                        ; IX = logo_colors[color_cycle]
    ld d, 0                                   ; ...
    add ix, de                                ; ...
.set_colors:
    ld a, (ix+0)
    and #c7
    ld (hl), a
    inc hl
    ld a, (ix+1)
    ld (hl), a
    inc hl
    ld a, (ix+2)
    ld (hl), a
    inc hl
    ld a, (ix+3)
    ld (hl), a
    inc hl
    ld a, (ix+4)
    and #f8
    ld (hl), a
    inc hl
.set_pixels:
    ld ix, logo
    ld e, 8                          ; rows
.set_pixels_loop_row:
    ld d, 5                          ; columns
    push de
    call coords_to_pixel_address     ; HL = pixel address
    pop de
    inc b                            ; row++
    ld a, (ix)                       ; A = logo_pixel_data[row]
    inc ix
.set_pixels_loop_column:
    ld (hl), a                       ; update screen
    inc hl
    dec d                            ; columns--
    jr nz, .set_pixels_loop_column
    dec e                            ; rows--
    jr nz, .set_pixels_loop_row
    ret

logo: DB #00, #01, #03, #07, #0F, #1F, #3F, #7F
logo_colors: DB #5A, #56, #74, #65, #6B,  #5A, #56, #74, #65
