// `define REV_C
// `define REV_D
// `define REV_E

`ifdef REV_C
    `define REV_CD
`elsif REV_D
    `define REV_CD
`endif

import common::*;
module zx_ula (
    input rst_n,
    input clk28,

    inout n_rstcpu,
    output clkcpu,
    output n_clkcpu,

    input [15:0] xa,
    inout [7:0] xd,
    output [18:0] va,
    inout [7:0] vd,
    output [17:14] ra,

    output n_vrd,
    output n_vwr,
    output n_romcs,

    input n_rd,
    input n_wr,
    input n_mreq,
    input n_iorqge,
    input n_m1,
    input n_rfsh,
    output n_int,
    output n_nmi,

    output [1:0] r,
    output [1:0] g,
    output [1:0] b,
    output csync,
    output hsync,
    output vsync,

    output ay_clk,
    output ay_bdir,
    output ay_bc1,
    output ay_abc,
    output ay_mono,

    output snd_l,
    output snd_r,

    input [4:0] kd,
    input n_magic,

`ifdef REV_CD
    input tape_in,
    input n_joy_down,
    input n_joy_right,
    input n_joy_left,
    input n_joy_up,
    input n_joy_b1,
    input n_joy_b2,
`else
    input shift_out,
    output shift_clk,
    output shift_pl,
`endif
    output joy_sel,

    input sd_cd,
    input sd_miso,
    output sd_mosi,
    output sd_sck,
    output sd_cs,

    output plus3_drd,
    output plus3_dwr,
    output plus3_mtr

`ifndef REV_C
    ,
    input ps2_clk,
    input ps2_dat,

    output bus0,
    input bus1
`endif
);


/* SHARED DEFINITIONS */
machine_t machine;
turbo_t turbo;
wire ps2_key_reset, ps2_key_pause, joy_start;
wire [2:0] border;
wire magic_reboot, magic_beeper;
wire up_active;
wire [2:0] ram_page128;
wire ay_ext_wait_cycle2;
wire div_ext_wait_cycle2;
wire mem_wait;
wire sd_indication;
wire bright_boost;
wire zxkit1;
wire joy_a_up;
wire div_map;
wire div_mapram;
wire basic48_paged;
wire fastforward;


/* CPU BUS */
cpu_bus bus();
always @(negedge clk28) begin
    bus.a <= xa;
    bus.d <= xd;
    bus.iorq <= ~n_iorqge;
    bus.mreq <= ~n_mreq;
    bus.m1 <= ~n_m1;
    bus.rfsh <= ~n_rfsh;
    bus.rd <= ~n_rd;
    bus.wr <= ~n_wr;
    bus.ioreq <= ~n_iorqge & n_m1;
    bus.ioreq_unmasked <= n_m1 & n_mreq & (~n_wr | ~n_rd);
    bus.mreq_rise <= ~n_mreq & ~bus.mreq;
end


/* RESET */
reg rst_n0 = 0;
reg [2:0] rst_n0_cnt = 3'b111;
always @(posedge clk28) begin
    if (rst_n == 1'b1)
        rst_n0_cnt <= 0;
    else if (! (&rst_n0_cnt))
        rst_n0_cnt <= rst_n0_cnt + 1'b1;
    rst_n0 <= (&rst_n0_cnt)? 1'b0 : 1'b1;
end

reg usrrst_n = 0;
always @(posedge clk28) begin
    usrrst_n <= (&rst_n0_cnt || ps2_key_reset || magic_reboot)? 1'b0 : 1'b1;
end

reg n_rstcpu_in = 0;
reg [2:0] n_rstcpu_in_cnt = 3'b111;
always @(posedge clk28 or negedge usrrst_n) begin
    if (usrrst_n == 1'b0) begin
        n_rstcpu_in_cnt <= 3'b111;
        n_rstcpu_in <= 0;
    end
    else begin
        if (n_rstcpu == 1'b1)
            n_rstcpu_in_cnt <= 0;
        else if (! (&n_rstcpu_in_cnt))
            n_rstcpu_in_cnt <= n_rstcpu_in_cnt + 1'b1;
        n_rstcpu_in <= (&n_rstcpu_in_cnt)? 1'b0 : 1'b1;
    end
end


/* VIDEO CONTROLLER */
wire [2:0] r0, g0;
wire [1:0] b0;
wire video_contention, port_ff_active;
wire video_read_req, video_read_req_is_up, video_read_req_ack, video_read_data_valid;
wire [14:0] video_read_addr;
wire [7:0] port_ff_data;
wire [8:0] vc, hc;
wire even_line;
wire clk14, clk7, clk35, ck14, ck7, ck35, clk12_5hz;
wire vsync0, hsync0;
assign vsync = zxkit1? clk14 : vsync0;
assign hsync = zxkit1? csync : hsync0;
video video0(
    .rst_n(usrrst_n),
    .clk28(clk28),

    .machine(machine),
    .border({border[2] ^ sd_indication, border[1] ^ magic_beeper, border[0]}),
    .up_en(up_active),

    .r(r0),
    .g(g0),
    .b(b0),
    .csync(csync),
    .vsync(vsync0),
    .hsync(hsync0),

    .read_req(video_read_req),
    .read_req_is_up(video_read_req_is_up),
    .read_req_addr(video_read_addr),
    .read_req_ack(video_read_req_ack),
    .read_data_valid(video_read_data_valid),
    .read_data(vd),

    .contention(video_contention),
    .even_line(even_line),
    .port_ff_active(port_ff_active),
    .port_ff_data(port_ff_data),

    .vc_out(vc),
    .hc_out(hc),
    .clk14(clk14),
    .clk7(clk7),
    .clk35(clk35),
    .ck14(ck14),
    .ck7(ck7),
    .ck35(ck35),
    .clk12_5hz(clk12_5hz)
);


/* RGB OUTPUT */
rgb rgb0(
    .clk28(clk28),
    .strobe(clk14 ^ even_line),
    .up_en(up_active),
    .bright_boost(bright_boost),
    .r_i(r0),
    .g_i(g0),
    .b_i(b0),
    .r_o(r),
    .g_o(g),
    .b_o(b)
);


/* PS/2 KEYBOARD */
wire [4:0] ps2_kd;
wire ps2_key_magic, ps2_key_fastforward;
wire ps2_joy_up, ps2_joy_down, ps2_joy_left, ps2_joy_right, ps2_joy_fire;
`ifndef REV_C
ps2 #(.CLK_FREQ(28_000_000)) ps2_0(
    .rst_n(rst_n0),
    .clk(clk28),
    .ps2_clk_in(ps2_clk),
    .ps2_dat_in(ps2_dat),
    .zxkb_addr(bus.a[15:8]),
    .zxkb_data(ps2_kd),
    .key_magic(ps2_key_magic),
    .key_reset(ps2_key_reset),
    .key_pause(ps2_key_pause),
    .key_fastforward(ps2_key_fastforward),
    .joy_up(ps2_joy_up),
    .joy_down(ps2_joy_down),
    .joy_left(ps2_joy_left),
    .joy_right(ps2_joy_right),
    .joy_fire(ps2_joy_fire)
);
`else
assign ps2_kd = 5'b11111;
assign {ps2_key_magic, ps2_key_reset, ps2_key_pause} = 0;
assign {ps2_joy_up, ps2_joy_down, ps2_joy_left, ps2_joy_right, ps2_joy_fire} = 0;
`endif


/* SHIFT REGISTER */
`ifndef REV_CD
wire [7:0] shift_d;
wire tape_in = shift_d[3], n_joy_down = shift_d[5], n_joy_right = shift_d[7], n_joy_left = shift_d[6], n_joy_up = shift_d[2], n_joy_b1 = shift_d[4], n_joy_b2 = shift_d[0];
wire shift_sync;
shiftreg165 #(.DEFAULT_STATE(1'b1)) shiftreg165_0(
    .rst_n(rst_n0),
    .clk(clk28),
    .clk_en(ck7),
    .sync(shift_sync),
    .q(~shift_out),
    .cp(shift_clk),
    .pl(shift_pl),
    .d(shift_d)
);
`endif


/* JOYSTICK / GAMEPAD */
wire joy_up, joy_down, joy_left, joy_right, joy_b1_turbo, joy_b2_turbo, joy_b3_turbo, joy_mode;
joysega joysega0(
    .rst_n(usrrst_n),
    .clk28(clk28),

    .vc(vc),
    .hc(hc),
    .turbo_strobe(clk12_5hz),
`ifndef REV_CD
    .sync_strobe(shift_sync),
`endif

    .n_joy_up(n_joy_up),
    .n_joy_down(n_joy_down),
    .n_joy_left(n_joy_left),
    .n_joy_right(n_joy_right),
    .n_joy_b1(n_joy_b1),
    .n_joy_b2(n_joy_b2),
    .joy_sel(joy_sel),

    .joy_up(joy_up),
    .joy_down(joy_down),
    .joy_left(joy_left),
    .joy_right(joy_right),
    .joy_b1_turbo(joy_b1_turbo),
    .joy_b2_turbo(joy_b2_turbo),
    .joy_b3_turbo(joy_b3_turbo),
    .joy_start(joy_start),
    .joy_mode(joy_mode)
);

wire [7:0] kempston_data = {1'b0,
    (joy_a_up? 1'b0 : joy_b3_turbo),
    joy_b2_turbo,
    ps2_joy_fire | joy_b1_turbo,
    ps2_joy_up | joy_up | (joy_a_up? joy_b3_turbo : 1'b0),
    ps2_joy_down | joy_down,
    ps2_joy_left | joy_left,
    ps2_joy_right | joy_right};


/* CPU CONTROLLER */
wire n_int_next, clkcpu_ck, snow;
wire n_rstcpu_out;
assign n_rstcpu = n_rstcpu_out? 1'bz : 1'b0;
assign n_clkcpu = ~clkcpu;
cpu cpu0(
    .rst_n(usrrst_n),
    .clk28(clk28),
    .clk14(clk14),
    .clk7(clk7),
    .clk35(clk35),
    .ck14(ck14),
    .ck7(ck7),

    .bus(bus),

    .vc(vc),
    .hc(hc),
    .ram_page128(ram_page128),
    .machine(machine),
    .video_contention(video_contention),
    .turbo(turbo),
    .fastforward(fastforward),
    .hold(mem_wait),
    .ext_wait_cycle2(ay_ext_wait_cycle2 | div_ext_wait_cycle2),

    .n_rstcpu_out(n_rstcpu_out),
    .clkcpu(clkcpu),
    .clkcpu_ck(clkcpu_ck),
    .n_int(n_int),
    .n_int_next(n_int_next),
    .snow(snow)
);


/* MAGIC */
wire n_nmi0;
reg n_nmi0_prev;
always @(posedge clk28)    // precharge to 1 - this is required because of weak n_nmi pullup ...
    n_nmi0_prev <= n_nmi0; // ... which may cause multiple nmi triggering in Z80 in 14MHz mode
assign n_nmi = n_nmi0? (n_nmi0_prev? 1'bz : 1'b1) : 1'b0;

wire rom_wren;
wire [7:0] magic_dout;
wire magic_dout_active;
wire magic_mode, magic_map;
`ifndef REV_C
    assign bus0 = magic_mode;
`endif

wire [1:0] rom_custom;
wire rom_alt48_en, rom_alt48, rom_custom_en;
wire joy_sinclair, up_en, ay_en, covox_en, soundrive_en;
panning_t panning;
assign ay_mono = panning == PANNING_MONO;
assign ay_abc = panning == PANNING_ABC;
wire divmmc_en, zc_en, sd_indication_en;
assign sd_indication = sd_indication_en & ~sd_cs;

magic magic0(
    .rst_n(n_rstcpu_in),
    .clk28(clk28),
    .ck35(ck35),

    .bus(bus),
    .d_out(magic_dout),
    .d_out_active(magic_dout_active),

    .n_int(n_int),
    .n_int_next(n_int_next),
    .n_nmi(n_nmi0),

    .magic_button(~n_magic || joy_mode || ps2_key_magic),
    .pause_button(ps2_key_pause || joy_start),
    .fastforward_button(ps2_key_fastforward),
    .div_paged(div_map && !div_mapram),
    .basic48_paged(basic48_paged),

    .magic_mode(magic_mode),
    .magic_map(magic_map),

    .magic_reboot(magic_reboot),
    .magic_beeper(magic_beeper),
    .rom_wren(rom_wren),
    .machine(machine),
    .turbo(turbo),
    .joy_sinclair(joy_sinclair),
    .rom_alt48_en(rom_alt48_en),
    .rom_alt48(rom_alt48),
    .rom_custom_en(rom_custom_en),
    .rom_custom(rom_custom),
    .panning(panning),
    .divmmc_en(divmmc_en),
    .zc_en(zc_en),
    .ulaplus_en(up_en),
    .ay_en(ay_en),
    .covox_en(covox_en),
    .soundrive_en(soundrive_en),
    .sd_indication_en(sd_indication_en),
    .bright_boost(bright_boost),
    .zxkit1(zxkit1),
    .joy_a_up(joy_a_up),
    .fastforward(fastforward)
);


/* PORTS */
wire [7:0] ports_dout;
wire ports_dout_active;
wire beeper, tape_out;
wire video_page;
wire rom_page128;
wire [2:0] ram_pageext;
wire [2:0] port_1ffd;
wire [4:0] port_dffd;
wire plus3_mtr0;
assign plus3_mtr = plus3_mtr0? 1'bz : 1'b0;
ports ports0 (
    .rst_n(n_rstcpu_in),
    .clk28(clk28),

    .bus(bus),
    .d_out(ports_dout),
    .d_out_active(ports_dout_active),

    .en_kempston(!joy_sinclair),
    .en_sinclair(joy_sinclair),

    .machine(machine),
    .basic48_paged(basic48_paged),
    .port_ff_active(port_ff_active),
    .port_ff_data(port_ff_data),
    .kd(kd & ps2_kd),
    .kempston_data(kempston_data),
    .magic_map(magic_map),
    .tape_in(tape_in),

    .tape_out(tape_out),
    .beeper(beeper),
    .border(border),
    .video_page(video_page),
    .rom_page128(rom_page128),
    .ram_page128(ram_page128),
    .ram_pageext(ram_pageext),
    .port_1ffd(port_1ffd),
    .port_dffd(port_dffd),

    .plus3_drd(plus3_drd),
    .plus3_dwr(plus3_dwr),
    .plus3_mtr(plus3_mtr0)
);


/* AY */
wire ay_dout_active;
ay ay0(
    .rst_n(n_rstcpu_in),
    .clk28(clk28),
    .en(ay_en),
    .bus(bus),
    .ck35(ck35),
    .ay_clk(ay_clk),
    .ay_bc1(ay_bc1),
    .ay_bdir(ay_bdir),
    .d_out_active(ay_dout_active),
    .ext_wait_cycle2(ay_ext_wait_cycle2)
);


/* COVOX & SOUNDRIVE */
wire [7:0] soundrive_l0, soundrive_l1, soundrive_r0, soundrive_r1;
soundrive soundrive0(
    .rst_n(n_rstcpu_in),
    .clk28(clk28),
    .en_covox(covox_en),
    .en_specdrum(covox_en),
    .en_soundrive(soundrive_en),

    .bus(bus),

    .ch_l0(soundrive_l0),
    .ch_l1(soundrive_l1),
    .ch_r0(soundrive_r0),
    .ch_r1(soundrive_r1)
);


/* SOUND MIXER */
mixer mixer0(
    .rst_n(usrrst_n),
    .clk28(clk28),

    .beeper(beeper ^ magic_beeper),
    .tape_out(tape_out),
    .tape_in(tape_in ^ sd_indication),
    .sd_l0(soundrive_l0),
    .sd_l1(soundrive_l1),
    .sd_r0(soundrive_r0),
    .sd_r1(soundrive_r1),

    .dac_l(snd_l),
    .dac_r(snd_r)
);


/* DIVMMC */
wire div_ram, div_ramwr_mask, div_dout_active;
wire [7:0] div_dout;
wire [3:0] div_page;
divmmc divmmc0(
    .rst_n(n_rstcpu_in),
    .clk28(clk28),
    .ck14(ck14),
    .ck7(ck7),
    .en(divmmc_en),
    .en_hooks(divmmc_en),
    .en_zc(zc_en),

    .bus(bus),
    .d_out(div_dout),
    .d_out_active(div_dout_active),

    .sd_cd(sd_cd),
    .sd_miso(sd_miso),
    .sd_mosi(sd_mosi),
    .sd_sck(sd_sck),
    .sd_cs(sd_cs),

    .rammap(port_dffd[4] | port_1ffd[0]),
    .mask_hooks(magic_map),
    .mask_nmi_hook(magic_mode),
    .basic48_paged(basic48_paged),

    .page(div_page),
    .map(div_map),
    .mapram(div_mapram),
    .ram(div_ram),
    .ramwr_mask(div_ramwr_mask),
    .ext_wait_cycle2(div_ext_wait_cycle2)
);


/* ULAPLUS */
wire up_dout_active;
wire up_read_req, up_write_req;
wire [7:0] up_dout;
wire [5:0] up_rw_addr;
ulaplus ulaplus0(
    .rst_n(n_rstcpu_in),
    .clk28(clk28),
    .en(up_en),

    .bus(bus),
    .d_out(up_dout),
    .d_out_active(up_dout_active),

    .active(up_active),
    .read_req(up_read_req),
    .write_req(up_write_req),
    .rw_addr(up_rw_addr)
);


/* MEMORY CONTROLLER */
mem mem0(
    .rst_n(n_rstcpu_in),
    .clk28(clk28),
    .bus(bus),
    .xd(xd),
    .ra(ra),
    .n_romcs(n_romcs),
    .va(va),
    .vd(vd),
    .n_vrd(n_vrd),
    .n_vwr(n_vwr),

    .basic48_paged(basic48_paged),
    .cpuwait(mem_wait),

    .machine(machine),
    .rom_wren(rom_wren),
    .magic_map(magic_map),
    .ram_page128(ram_page128),
    .rom_page128(rom_page128),
    .port_1ffd(port_1ffd),
    .port_dffd(port_dffd),
    .ram_pageext(ram_pageext),
    .rom_alt48_en(rom_alt48_en),
    .rom_alt48(rom_alt48),
    .rom_custom_en(rom_custom_en),
    .rom_custom(rom_custom),
    .divmmc_en(divmmc_en),
    .div_ram(div_ram),
    .div_map(div_map),
    .div_ramwr_mask(div_ramwr_mask),
    .div_page(div_page),

    .snow(snow),
    .video_page(video_page),
    .video_read_req(video_read_req),
    .video_read_req_is_up(video_read_req_is_up),
    .video_read_addr(video_read_addr),
    .video_read_req_ack(video_read_req_ack),
    .video_data_valid(video_read_data_valid),
    .up_read_req(up_read_req),
    .up_read_addr(up_rw_addr),
    .up_write_req(up_write_req),
    .up_write_addr(up_rw_addr),

    .magic_dout_active(magic_dout_active),
    .magic_dout(magic_dout),
    .up_dout_active(up_dout_active),
    .up_dout(up_dout),
    .div_dout_active(div_dout_active),
    .div_dout(div_dout),
    .ay_dout_active(ay_dout_active),
    .ports_dout_active(ports_dout_active),
    .ports_dout(ports_dout)
);


endmodule
