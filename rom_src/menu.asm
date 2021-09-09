menu_init:
    ld bc, MENU_T            ; if (ext board present) var_menu = menuext; else var_menu = menu;
    ld de, var_menu          ; ...
    ld hl, menu              ; ...
    ld a, (var_ext_presence) ; ...
    or a                     ; ...
    jr z, .set_menu          ; ...
    ld hl, menuext           ; ...
.set_menu:                   ; ...
    ldir                     ; ...

    ld ix, var_menu
    ld b, (ix+MENU_T.y_row)
    ld c, MENU_X
    ld d, (ix+MENU_T.height)
    ld e, MENU_WIDTH
    call draw_box

    ld ix, var_menu
    ld hl, str_sizif
    ld b, (ix+MENU_T.y_pixel)
    ld c, MENU_X
    call print_string

    ld ix, var_menu
    ld b, (ix+MENU_T.y_pixel)
    ld c, MENU_X+MENU_WIDTH-6
    ld e, 0
    call draw_logo

    call menu_draw_menu

    xor a
    ld d, MENU_SELECT_ATTR
    call menu_draw_selected_item
    ret


menu_process:
    ;call menu_animate_logo
    ;call menu_handle_updown
    ;call menu_handle_action_left_right


menu_animate_logo:
    ld a, (var_menu_animate_cnt)  ;
    inc a                         ; cnt++ (only cnt[7:5] used as color offset)
    cp #a0                        ; if (cnt[7:5] == 5) cnt = 0 - because valid offsets 0..4
    jr nz, .animate               ; ...
    xor a                         ; ...
.animate:                         ;
    ld (var_menu_animate_cnt), a  ;
    and a, #1F                    ; if (cnt[7:5] was not changed) - exit
    jr nz, .return                ; ...
    ld a, (var_menu_animate_cnt)  ;
    srl a                         ; cnt[7:5] -> cnt[2:0]
    srl a                         ; ...
    srl a                         ; ...
    srl a                         ; ...
    srl a                         ; ...
    ld e, a                       ; reverse animation direction (from left to right)
    ld a, 4                       ; ...
    sub e                         ; ...
    ld e, a                       ; ...
    ld ix, var_menu               ;
    ld b, (ix+MENU_T.y_pixel)     ; draw logo
    ld c, MENU_X+MENU_WIDTH-6     ; ...
    call draw_logo                ; ...
.return:
    ; ret                         ; pass to menu_handle_updown


; OUT -  A - pressed key
; OUT - BC - garbage
; OUT - DE - garbage
; OUT - HL - garbage
; OUT - IX - garbage
menu_handle_updown:
    ld ix, var_menu
    call input_key_get              ; A = current_pressed_key
.down:                              ;
    bit 2, a                        ; down?
    jr z, .up                       ; ...
    ld a, (var_menu_current_item)   ; 
    ld d, MENU_BODY_ATTR            ; fill selected item with background color
    call menu_draw_selected_item    ; ...
    inc a                           ; current_item++
    cp a, (ix+MENU_T.items)         ; if (current_item == max) current_item = 0
    jr nz, .return_save             ; ...
    ld a, 0                         ; ...
    jr .return_save                 ;
.up:                                ;
    bit 3, a                        ; up?
    jr z, .return                   ; ...
    ld a, (var_menu_current_item)   ; 
    ld d, MENU_BODY_ATTR            ; fill selected item with background color
    call menu_draw_selected_item    ; ...
    or a                            ; if (current_item == 0) current_item = max
    jr nz, .up_decrement            ; ...
    ld a, (ix+MENU_T.items)
.up_decrement                       ; ...
    dec a                           ; current_item--
.return_save:                       ; 
    ld (var_menu_current_item), a   ; ...
    ld d, MENU_SELECT_ATTR          ; highlight selected item
    call menu_draw_selected_item    ; ...
    xor a
.return:
    ;ret                            ; pass to menu_handle_action_left_right


; IN  -  A - pressed key
; OUT -  D - pressed key
; OUT - AF - garbage
; OUT - BC - garbage
; OUT - HL - garbage
; OUT - IX - garbage
menu_handle_action_left_right:
    ld d, a
    and #13                         ; action/left/right?
    jr z, .return
    ld ix, var_menu                 ; IX = &menu
    ld c, (ix+MENU_T.addr+0)        ; IX = &menu_entry
    ld b, (ix+MENU_T.addr+1)        ; ...
    ld ixl, c                       ; ...
    ld ixh, b                       ; ...
    ld a, (var_menu_current_item)   ; A = selected item index
    sla a                           ; A*8 (one menu entry - 8 bytes)
    sla a                           ; ...
    sla a                           ; ...
    ld c, a                         ; IX = &menu_entry[index].callback
    ld b, 0                         ; ...
    add ix, bc                      ; ...
    ld l, (ix+MENUENTRY_T.callback+0) ; HL = menu_entry[index].callback
    ld h, (ix+MENUENTRY_T.callback+1) ; ...
    ld a, h                         ; if (HL == 0) - exit
    or l                            ; ...
    jr z, .return                   ; ...
    call .callback                  ; call menu[index].callback(), D is pressed key
    call menu_draw_menu             ; update menu if something changed
.return:
    ret

.callback:
    jp (hl)                         ; AF, BC, HL, IX may be changed


; IN  -  A - selected menu item number
; IN  -  D - attribute
; OUT - BC - garbage
; OUT -  E - garbage
; OUT - HL - garbage
; OUT - IX - garbage
menu_draw_selected_item:
    push af
    ld ix, var_menu
    ld b, (ix+MENU_T.y_row)
    inc b
    add b
    ld b, a
    ld c, MENU_X
    ld e, MENU_WIDTH
    call draw_attribute_line
    pop af
    ret


menu_draw_menu:
    ld ix, var_menu
    ld a, (ix+MENU_T.y_pixel)
    add a, 8
    ld b, a
    ld c, MENU_X+1
    ld e, MENU_WIDTH
    ld l, (ix+MENU_T.addr+0)
    ld h, (ix+MENU_T.addr+1)
    call draw_menu
    ret


;var_menu_current_item: DB 0
;var_menu_animate_cnt: DB 0
