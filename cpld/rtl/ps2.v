`include "ps2_codes.vh"

module ps2#(
    parameter CLK_FREQ
    ) (
    input rst_n,
    input clk,

    input ps2_clk_in,
    input ps2_dat_in,
    output ps2_clk_out,
    output ps2_dat_out,

    input [7:0] zxkb_addr,
    output reg [4:0] zxkb_data,
    output reg key_magic,
    output reg key_reset,
    output reg key_pause,
    output reg joy_up,
    output reg joy_down,
    output reg joy_left,
    output reg joy_right,
    output reg joy_fire
);


wire rxdone;
wire rxerr;
wire [7:0] rxbyte;
ps2_rxtx #(.CLK_FREQ(CLK_FREQ)) ps2_rxtx0(
    .rst_n(rst_n),
    .clk(clk),
    .ps2_clk_in(ps2_clk_in),
    .ps2_dat_in(ps2_dat_in),
    .ps2_clk_out(ps2_clk_out),
    .ps2_dat_out(ps2_dat_out),
    .dataout(rxbyte),
    .dataout_valid(rxdone),
    .dataout_error(rxerr)
);


reg key2_a, key2_b, key2_c, key2_d, key2_e, key2_f, key2_g, key2_h, key2_i, key2_j, key2_k, key2_l, key2_m, key2_n;
reg key2_o, key2_p, key2_q, key2_r, key2_s, key2_t, key2_u, key2_v, key2_w, key2_x, key2_y, key2_z, key2_0, key2_1;
reg key2_2, key2_3, key2_4, key2_5, key2_6, key2_7, key2_8, key2_9, key2_space, key2_enter, key2_l_shift, key2_r_shift;
reg key2_l_ctrl, key2_r_ctrl, key2_up, key2_down, key2_left, key2_right, key2_esc, key2_backspace, key2_accent;
reg key2_minus, key2_equals, key2_back_slash, key2_tab, key2_l_bracket, key2_r_bracket, key2_semicolon, key2_quote;
reg key2_comma, key2_period, key2_slash, key2_caps, key2_pgup, key2_pgdn;
reg key2_alt, key2_del;

reg is_press;
reg is_ext;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        is_press <= 1'b1;
        is_ext <= 0;
        key_magic <= 0;
        key_pause <= 0;
        {joy_up, joy_down, joy_left, joy_right, joy_fire} <= 0;
        {key2_a, key2_b, key2_c, key2_d, key2_e, key2_f, key2_g, key2_h, key2_i, key2_j, key2_k, key2_l, key2_m, key2_n} <= 0;
        {key2_o, key2_p, key2_q, key2_r, key2_s, key2_t, key2_u, key2_v, key2_w, key2_x, key2_y, key2_z, key2_0, key2_1} <= 0;
        {key2_2, key2_3, key2_4, key2_5, key2_6, key2_7, key2_8, key2_9, key2_space, key2_enter, key2_l_shift, key2_r_shift} <= 0;
        {key2_l_ctrl, key2_r_ctrl, key2_up, key2_down, key2_left, key2_right, key2_esc, key2_backspace, key2_accent} <= 0;
        {key2_minus, key2_equals, key2_back_slash, key2_tab, key2_l_bracket, key2_r_bracket, key2_semicolon, key2_quote} <= 0;
        {key2_comma, key2_period, key2_slash, key2_caps, key2_pgup, key2_pgdn} <= 0;
        {key2_alt, key2_del} <= 0;
    end
    else begin
        if (rxdone) begin
            case ({is_ext, rxbyte})
                `PS2_A: key2_a <= is_press;
                `PS2_B: key2_b <= is_press;
                `PS2_C: key2_c <= is_press;
                `PS2_D: key2_d <= is_press;
                `PS2_E: key2_e <= is_press;
                `PS2_F: key2_f <= is_press;
                `PS2_G: key2_g <= is_press;
                `PS2_H: key2_h <= is_press;
                `PS2_I: key2_i <= is_press;
                `PS2_J: key2_j <= is_press;
                `PS2_K: key2_k <= is_press;
                `PS2_L: key2_l <= is_press;
                `PS2_M: key2_m <= is_press;
                `PS2_N: key2_n <= is_press;
                `PS2_O: key2_o <= is_press;
                `PS2_P: key2_p <= is_press;
                `PS2_Q: key2_q <= is_press;
                `PS2_R: key2_r <= is_press;
                `PS2_S: key2_s <= is_press;
                `PS2_T: key2_t <= is_press;
                `PS2_U: key2_u <= is_press;
                `PS2_V: key2_v <= is_press;
                `PS2_W: key2_w <= is_press;
                `PS2_X: key2_x <= is_press;
                `PS2_Y: key2_y <= is_press;
                `PS2_Z: key2_z <= is_press;
                `PS2_0: key2_0 <= is_press;
                `PS2_1: key2_1 <= is_press;
                `PS2_2: key2_2 <= is_press;
                `PS2_3: key2_3 <= is_press;
                `PS2_4: key2_4 <= is_press;
                `PS2_5: key2_5 <= is_press;
                `PS2_6: key2_6 <= is_press;
                `PS2_7: key2_7 <= is_press;
                `PS2_8: key2_8 <= is_press;
                `PS2_9: key2_9 <= is_press;
                `PS2_SPACE: key2_space <= is_press;
                `PS2_ENTER: key2_enter <= is_press;

                `PS2_L_SHIFT:   key2_l_shift <= is_press;
                `PS2_R_SHIFT:   key2_r_shift <= is_press;
                `PS2_L_CTRL:    key2_l_ctrl <= is_press;
                `PS2_R_CTRL:    key2_r_ctrl <= is_press;

                `PS2_UP:        key2_up <= is_press;
                `PS2_DOWN:      key2_down <= is_press;
                `PS2_LEFT:      key2_left <= is_press;
                `PS2_RIGHT:     key2_right <= is_press;

                `PS2_ESC:       key2_esc <= is_press;
                `PS2_BACKSPACE: key2_backspace <= is_press;
                `PS2_ACCENT:    key2_accent <= is_press;
                `PS2_MINUS:     key2_minus <= is_press;
                `PS2_EQUALS:    key2_equals <= is_press;
                `PS2_BACK_SLASH: key2_back_slash <= is_press;
                `PS2_TAB:       key2_tab <= is_press;
                `PS2_L_BRACKET: key2_l_bracket <= is_press;
                `PS2_R_BRACKET: key2_r_bracket <= is_press;
                `PS2_SEMICOLON: key2_semicolon <= is_press;
                `PS2_QUOTE:     key2_quote <= is_press;
                `PS2_COMMA:     key2_comma <= is_press;
                `PS2_PERIOD:    key2_period <= is_press;
                `PS2_SLASH:     key2_slash <= is_press;
                `PS2_CAPS:      key2_caps <= is_press;
                `PS2_PGUP:      key2_pgup <= is_press;
                `PS2_PGDN:      key2_pgdn <= is_press;

                `PS2_F5:        key_magic <= is_press;
                `PS2_F12:       key_pause <= is_press;
                `PS2_DELETE:    key2_del <= is_press;

                `PS2_KP_8:      joy_up <= is_press;
                `PS2_KP_2:      joy_down <= is_press;
                `PS2_KP_5:      joy_down <= is_press;
                `PS2_KP_4:      joy_left <= is_press;
                `PS2_KP_6:      joy_right <= is_press;
                `PS2_KP_0:      joy_fire <= is_press;
                `PS2_KP_ENTER:  joy_fire <= is_press;
                `PS2_L_ALT:     begin joy_fire <= is_press && !key2_l_ctrl; key2_alt <= is_press; end
                `PS2_R_ALT:     begin joy_fire <= is_press && !key2_l_ctrl; key2_alt <= is_press; end
            endcase
            is_press <= rxbyte != 8'hF0;
            is_ext <= rxbyte == 8'hE0 || (rxbyte == 8'hF0 && is_ext);
        end
        else if (rxerr) begin
            is_press <= 1'b1;
            is_ext <= 0;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        key_reset <= 0;
    else
        key_reset <= (key2_l_ctrl || key2_r_ctrl) && key2_alt && (key2_del || key2_backspace);
end


wire key_a  = key2_a;
wire key_b  = key2_b;
wire key_c  = key2_c;
wire key_d  = key2_d;
wire key_e  = key2_e;
wire key_f  = key2_f;
wire key_g  = key2_g;
wire key_h  = key2_h;
wire key_i  = key2_i;
wire key_j  = key2_j | key2_minus;
wire key_k  = key2_k;
wire key_l  = key2_l | key2_equals;
wire key_m  = key2_m | key2_period;
wire key_n  = key2_n | key2_comma;
wire key_o  = key2_o | key2_semicolon;
wire key_p  = key2_p | key2_quote;
wire key_q  = key2_q;
wire key_r  = key2_r;
wire key_s  = key2_s;
wire key_t  = key2_t;
wire key_u  = key2_u;
wire key_v  = key2_v | key2_back_slash | key2_slash;
wire key_w  = key2_w;
wire key_x  = key2_x;
wire key_y  = key2_y;
wire key_z  = key2_z;
wire key_0  = key2_0 | key2_backspace;
wire key_1  = key2_1 | key2_tab;
wire key_2  = key2_2 | key2_caps;
wire key_3  = key2_3 | key2_pgup;
wire key_4  = key2_4 | key2_pgdn;
wire key_5  = key2_5 | key2_left;
wire key_6  = key2_6 | key2_down;
wire key_7  = key2_7 | key2_up | key2_accent;
wire key_8  = key2_8 | key2_right | key2_l_bracket;
wire key_9  = key2_9 | key2_r_bracket;
wire key_en = key2_enter;
wire key_sp = key2_space | key2_esc;
wire key_cs = key2_l_shift | key2_r_shift | key2_up | key2_down | key2_left | key2_right | key2_esc | key2_backspace
                | key2_tab | key2_caps | key2_pgup | key2_pgdn ;
wire key_ss = key2_l_ctrl | key2_r_ctrl | key2_accent | key2_minus | key2_equals | key2_back_slash | key2_l_bracket
                | key2_r_bracket | key2_semicolon | key2_quote | key2_comma | key2_period | key2_slash ;

always @* begin
    zxkb_data <= ~(
        //                  KD4    KD3    KD2    KD1     KD0
        ((~zxkb_addr[0])? { key_v, key_c, key_x, key_z,  key_cs } : 5'd0) | // KA8
        ((~zxkb_addr[1])? { key_g, key_f, key_d, key_s,  key_a  } : 5'd0) | // KA9
        ((~zxkb_addr[2])? { key_t, key_r, key_e, key_w,  key_q  } : 5'd0) | // KA10
        ((~zxkb_addr[3])? { key_5, key_4, key_3, key_2,  key_1  } : 5'd0) | // KA11
        ((~zxkb_addr[4])? { key_6, key_7, key_8, key_9,  key_0  } : 5'd0) | // KA12
        ((~zxkb_addr[5])? { key_y, key_u, key_i, key_o,  key_p  } : 5'd0) | // KA13
        ((~zxkb_addr[6])? { key_h, key_j, key_k, key_l,  key_en } : 5'd0) | // KA14
        ((~zxkb_addr[7])? { key_b, key_n, key_m, key_ss, key_sp } : 5'd0)   // KA15
    );
end

endmodule
