// `define REV_C
// `define REV_D

import common::*;
module zx_ula (
    input rst_n,
    input clk28,

    output n_rstcpu,
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

    input [4:0] kd,
    input tape_in,

    input n_magic,

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

    input n_joy_down,
    input n_joy_right,
    input n_joy_left,
    input n_joy_up,
    input n_joy_b1,
    input n_joy_b2,
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
timings_t timings;
turbo_t turbo;
rammode_t ram_mode;
reg pause = 0;
wire ps2_key_reset, ps2_key_pause, joy_pause;
wire [2:0] border;
wire magic_reboot, magic_beeper;
wire up_active;
wire clkwait;
wire [2:0] rampage128;
wire div_wait;


/* CPU BUS */
cpu_bus bus();
reg n_iorqge_delayed;
always @(posedge clk28)
    n_iorqge_delayed <= n_iorqge;
assign bus.a = xa;
assign bus.d = xd;
assign bus.iorq = ~n_iorqge;
assign bus.mreq = ~n_mreq;
assign bus.m1 = ~n_m1;
assign bus.rfsh = ~n_rfsh;
assign bus.rd = ~n_rd;
assign bus.wr = ~n_wr;
assign bus.ioreq = ~(~n_m1 | n_iorqge | n_iorqge_delayed);


/* RESET */
reg rst_n0 = 0;
reg [2:0] rst_n0_cnt = 0;
always @(posedge clk28) begin
    if (rst_n == 1'b0) begin
        if (! (&rst_n0_cnt))
            rst_n0_cnt <= rst_n0_cnt + 1'b1;
    end
    else begin
        rst_n0_cnt <= 0;
    end
    rst_n0 <= (&rst_n0_cnt)? 1'b0 : 1'b1;
end

reg usrrst_n = 0;
always @(posedge clk28) begin
    usrrst_n <= (&rst_n0_cnt || ps2_key_reset || magic_reboot)? 1'b0 : 1'b1;
end

/* PAUSE */
always @(posedge clk28) begin
    if (n_int == 1'b0 && bus.rfsh)
        pause <= ps2_key_pause || joy_pause;
end


/* SCREEN CONTROLLER */
wire blink;
wire [2:0] screen_border = {border[2] ^ ~sd_cs, border[1] ^ magic_beeper, border[0] ^ (pause & blink)};
wire [2:0] r0, g0;
wire [1:0] b0;
wire screen_fetch, screen_fetch_up, screen_loading;
wire [14:0] screen_addr;
wire [5:0] screen_up_addr;
wire [7:0] attr_next;
wire [8:0] vc, hc;
wire [4:0] blink_cnt;
wire clk14, clk7, clk35, ck14, ck7, ck35;
screen screen0(
    .rst_n(rst_n0),
    .clk28(clk28),

    .timings(timings),
    .border(screen_border),
    .up_en(up_active),

    .r(r0),
    .g(g0),
    .b(b0),
    .csync(csync),
    .vsync(vsync),
    .hsync(hsync),

    .fetch_allow((!bus.iorq && !bus.mreq) || bus.rfsh || clkwait),
    .fetch(screen_fetch),
    .fetch_up(screen_fetch_up),
    .addr(screen_addr),
    .up_addr(screen_up_addr),
    .fetch_data(vd),

    .loading(screen_loading),
    .blink(blink),
    .attr_next(attr_next),

    .vc_out(vc),
    .hc_out(hc),
    .blink_cnt(blink_cnt),
    .clk14(clk14),
    .clk7(clk7),
    .clk35(clk35),
    .ck14(ck14),
    .ck7(ck7),
    .ck35(ck35)
);


/* RGB OUTPUT */
rgb rgb0(
    .clk28(clk28),
    .clk14(clk14),
    .up_en(up_active),
    .r_i(r0),
    .g_i(g0),
    .b_i(b0),
    .r_o(r),
    .g_o(g),
    .b_o(b)
);


/* PS/2 KEYBOARD */
wire [4:0] ps2_kd;
wire ps2_key_magic;
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


/* JOYSTICK / GAMEPAD */
wire joy_up, joy_down, joy_left, joy_right, joy_b1_turbo, joy_b2_turbo, joy_b3_turbo, joy_mode;
joysega joysega0(
    .rst_n(rst_n0),
    .clk28(clk28),

    .vc(vc),
    .hc(hc),
    .turbo_strobe(blink_cnt[1]),

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
    .joy_start(),
    .joy_mode(joy_mode),
    .pause(joy_pause)
);

wire [7:0] kempston_data = {1'b0, joy_b3_turbo, joy_b2_turbo, ps2_joy_fire | joy_b1_turbo, 
    ps2_joy_up | joy_up, ps2_joy_down | joy_down, ps2_joy_left | joy_left, ps2_joy_right | joy_right};


/* CPU CONTROLLER */
wire n_int_next, clkcpu_ck, snow;
wire n_rstcpu0;
assign n_rstcpu = n_rstcpu0? 1'bz : 1'b0;
assign n_clkcpu = ~clkcpu;
cpucontrol cpucontrol0(
    .rst_n(usrrst_n),
    .clk28(clk28),
    .clk14(clk14),
    .clk7(clk7),
    .clk35(clk35),

    .bus(bus),

    .vc(vc),
    .hc(hc),
    .rampage128(rampage128),
    .screen_loading(screen_loading),
    .turbo(turbo),
    .timings(timings),
    .pause(pause),
    .ext_wait_cycle(div_wait || up_active),

    .n_rstcpu(n_rstcpu0),
    .clkcpu(clkcpu),
    .clkcpu_ck(clkcpu_ck),
    .clkwait(clkwait),
    .n_int(n_int),
    .n_int_next(n_int_next),
    .snow(snow)
);


/* MAGIC */
wire magic_mode, magic_map;
wire n_nmi0;
reg n_nmi0_prev;
always @(posedge clk28)    // precharge to 1 - this is required because of weak n_nmi pullup ...
    n_nmi0_prev <= n_nmi0; // ... which may cause multiple nmi triggering in Z80 in 14MHz mode
assign n_nmi = n_nmi0? (n_nmi0_prev? 1'bz : 1'b1) : 1'b0;
wire divmmc_en, joy_sinclair, rom_plus3, rom_alt48, up_en, covox_en, sd_en;
panning_t panning;
assign ay_mono = panning == PANNING_MONO;
assign ay_abc = panning == PANNING_ABC;
wire magic_button = n_magic == 0 || joy_mode || ps2_key_magic;
`ifndef REV_C
    assign bus0 = magic_mode;
`endif
magic magic0(
    .rst_n(usrrst_n),
    .clk28(clk28),

    .bus(bus),
    .n_int(n_int),
    .n_int_next(n_int_next),
    .n_nmi(n_nmi0),

    .magic_button(magic_button),

    .magic_mode(magic_mode),
    .magic_map(magic_map),

    .magic_reboot(magic_reboot),
    .magic_beeper(magic_beeper),
    .timings(timings),
    .turbo(turbo),
    .ram_mode(ram_mode),
    .joy_sinclair(joy_sinclair),
    .rom_plus3(rom_plus3),
    .rom_alt48(rom_alt48),
    .panning(panning),
    .divmmc_en(divmmc_en),
    .ulaplus_en(up_en),
    .covox_en(covox_en),
    .sd_en(sd_en)
);


/* PORTS */
wire [7:0] ports_dout;
wire ports_dout_active;
wire beeper, tape_out;
wire screenpage;
wire rompage128;
wire [2:0] rampage_ext;
wire [2:0] port_1ffd;
wire port_dffd_d3;
wire port_dffd_d4;
wire plus3_mtr0;
assign plus3_mtr = plus3_mtr0? 1'bz : 1'b0;
ports ports0 (
    .rst_n(usrrst_n),
    .clk28(clk28),

    .bus(bus),
    .d_out(ports_dout),
    .d_out_active(ports_dout_active),

    .en_128k(ram_mode == RAM_512 || ram_mode == RAM_128),
    .en_plus3(rom_plus3),
    .en_profi(ram_mode == RAM_512),
    .en_kempston(!joy_sinclair),
    .en_sinclair(joy_sinclair),

    .timings(timings),
    .clkcpu_ck(clkcpu_ck),
    .screen_loading(screen_loading),
    .attr_next(attr_next),
    .kd(kd & ps2_kd),
    .kempston_data(kempston_data),
    .magic_button(magic_button),
    .tape_in(tape_in),

    .tape_out(tape_out),
    .beeper(beeper),
    .border(border),
    .screenpage(screenpage),
    .rompage128(rompage128),
    .rampage128(rampage128),
    .rampage_ext(rampage_ext),
    .port_1ffd(port_1ffd),
    .port_dffd_d3(port_dffd_d3),
    .port_dffd_d4(port_dffd_d4),

    .plus3_drd(plus3_drd),
    .plus3_dwr(plus3_dwr),
    .plus3_mtr(plus3_mtr0)
);


/* AY */
wire ay_dout_active;
ay ay0(
    .rst_n(usrrst_n),
    .clk28(clk28),
    .bus(bus),
    .ck35(ck35 && !pause),
    .ay_clk(ay_clk),
    .ay_bc1(ay_bc1),
    .ay_bdir(ay_bdir),
    .d_out_active(ay_dout_active)
);


/* COVOX & SOUNDRIVE */
wire [7:0] soundrive_l0, soundrive_l1, soundrive_r0, soundrive_r1;
soundrive soundrive0(
    .rst_n(usrrst_n),
    .clk28(clk28),
    .en_covox(covox_en),
    .en_soundrive(sd_en),

    .bus(bus),

    .ch_l0(soundrive_l0),
    .ch_l1(soundrive_l1),
    .ch_r0(soundrive_r0),
    .ch_r1(soundrive_r1)
);


/* SOUND MIXER */
mixer mixer0(
    .rst_n(rst_n0),
    .clk28(clk28),

    .beeper(beeper ^ magic_beeper),
    .tape_out(tape_out),
    .tape_in(tape_in ^ sd_cs),
    .sd_l0(soundrive_l0),
    .sd_l1(soundrive_l1),
    .sd_r0(soundrive_r0),
    .sd_r1(soundrive_r1),

    .dac_l(snd_l),
    .dac_r(snd_r)
);


/* DIVMMC */
wire div_map, div_ram, div_ramwr_mask, div_dout_active;
wire [7:0] div_dout;
wire [3:0] div_page;
divmmc divmmc0(
    .rst_n(usrrst_n),
    .clk28(clk28),
    .ck14(ck14),
    .ck7(ck7),
    .en(divmmc_en),
    .en_hooks(~sd_cd),

    .bus(bus),
    .d_out(div_dout),
    .d_out_active(div_dout_active),

    .sd_miso(sd_miso),
    .sd_mosi(sd_mosi),
    .sd_sck(sd_sck),
    .sd_cs(sd_cs),
    
    .rammap(port_dffd_d4 | port_1ffd[0]),
    .magic_mode(magic_mode),
    .magic_map(magic_map),

    .page(div_page),
    .map(div_map),
    .ram(div_ram),
    .ramwr_mask(div_ramwr_mask),
    .cpuwait(div_wait)
);


/* ULAPLUS */
wire up_dout_active;
wire [7:0] up_dout;
wire up_write_req;
wire [5:0] up_write_addr;
ulaplus ulaplus0(
    .rst_n(usrrst_n),
    .clk28(clk28),
    .en(up_en),

    .bus(bus),
    .d_out(up_dout),
    .d_out_active(up_dout_active),

    .active(up_active),
    .write_req(up_write_req),
    .write_addr(up_write_addr)
);


/* MEMORY CONTROLLER */
wire romreq =  bus.mreq && !bus.rfsh &&  bus.a[14] == 0 && bus.a[15] == 0 &&
        (magic_map || (!div_ram && div_map) || (!div_ram && !port_dffd_d4 && !port_1ffd[0]));
wire ramreq = (bus.mreq && !bus.rfsh && !romreq) || up_write_req;
wire ramreq_wr = ramreq && bus.wr && div_ramwr_mask == 0;

assign n_romcs = (romreq && bus.mreq)? 1'b0 : 1'b1;
assign n_vrd = ((ramreq && bus.rd) || screen_fetch)? 1'b0 : 1'b1;
assign n_vwr = (ramreq_wr && bus.wr && !screen_fetch)? 1'b0 : 1'b1;

// reserve 128K RAM for DivMMC
wire [1:0] rampage_ext0 = {divmmc_en? 1'b1 : ~rampage_ext[1], ~rampage_ext[0]};

wire [18:13] ram_a =
    magic_map & bus.a[15] & bus.a[14]? {2'b00, 3'b111, bus.a[13]} :
    magic_map? {3'b111, screenpage, bus.a[14:13]} :
    div_map & ~bus.a[14] & ~bus.a[15] & bus.a[13]? {2'b01, div_page} :
    div_map & ~bus.a[14] & ~bus.a[15]? {2'b01, 4'b0011} :
    port_dffd_d3 & bus.a[15]? {2'b11, bus.a[14], bus.a[15], bus.a[14], bus.a[13]} :
    port_dffd_d3 & bus.a[14]? {rampage_ext0, rampage128, bus.a[13]} :
    (port_1ffd[2] == 1'b0 && port_1ffd[0] == 1'b1)? {2'b11, port_1ffd[1], bus.a[15], bus.a[14], bus.a[13]} :
    (port_1ffd == 3'b101)? {2'b11, ~(bus.a[15] & bus.a[14]), bus.a[15], bus.a[14]} :
    (port_1ffd == 3'b111)? {2'b11, ~(bus.a[15] & bus.a[14]), (bus.a[15] | bus.a[14]), bus.a[14]} :
    bus.a[15] & bus.a[14]? {rampage_ext0, rampage128, bus.a[13]} :
    {2'b11, bus.a[14], bus.a[15], bus.a[14], bus.a[13]} ;

assign ra[17:14] =
    magic_map? 3'd2 :
    div_map? 3'd3 :
    (rom_plus3 && port_1ffd[2] == 1'b0 && rompage128 == 1'b0)? 3'd4 :
    (rom_plus3 && port_1ffd[2] == 1'b0 && rompage128 == 1'b1)? 3'd5 :
    (rom_plus3 && port_1ffd[2] == 1'b1 && rompage128 == 1'b0)? 3'd6 :
    (rompage128 == 1'b1 && rom_alt48 == 1'b1)? 3'd7 :
    (rompage128 == 1'b1)? 3'd1 :
    3'd0;

assign va[18:0] =
    screen_fetch && screen_fetch_up? {2'b00, 3'b111, 8'b11111111, screen_up_addr} :
    screen_fetch && snow? {3'b111, screenpage, screen_addr[14:8], bus.a[7:0]} :
    screen_fetch? {3'b111, screenpage, screen_addr} :
    up_write_req? {2'b00, 3'b111, 8'b11111111, up_write_addr} :
    {ram_a[18:13], bus.a[12:0]};

// this is required because of weak xd pullup causing garbage reads from nonexisting ports
reg [1:0] xd_precharge0;
wire xd_precharge = clk28 && xd_precharge0[1] && !xd_precharge0[0];
always @(posedge clk28)
    xd_precharge0 <= {bus.iorq && (bus.rd || bus.m1), xd_precharge0[1]};

assign xd[7:0] =
    (ramreq && bus.rd)? vd :
    up_dout_active? up_dout :
    div_dout_active? div_dout :
    ay_dout_active? {8{1'bz}} :
    ports_dout_active? ports_dout :
    xd_precharge? 8'hFF :
    {8{1'bz}} ;

assign vd[7:0] =
    n_vrd == 0? {8{1'bz}} :
    xd;


endmodule
