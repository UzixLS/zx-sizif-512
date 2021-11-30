`ifdef REV_C
    `define BANK_PENT_0 4'd0
    `define BANK_S128_0 4'd0
    `define BANK_S128_1 4'd1
    `define BANK_MAGIC  4'd2
    `define BANK_DIV    4'd3
    `define BANK_S3_0   4'd4
    `define BANK_S3_1   4'd5
    `define BANK_S3_2   4'd6
    `define BANK_S3_3   4'd1
    `define BANK_48     4'd1
    `define BANK_48ALT1 4'd7
    `define BANK_48ALT2 4'd7
`else
    `define BANK_PENT_0 4'd0
    `define BANK_S128_0 4'd12
    `define BANK_S128_1 4'd1
    `define BANK_MAGIC  4'd2
    `define BANK_DIV    4'd3
    `define BANK_S3_0   4'd4
    `define BANK_S3_1   4'd5
    `define BANK_S3_2   4'd6
    `define BANK_S3_3   4'd14
    `define BANK_48     4'd13
    `define BANK_48ALT1 4'd7
    `define BANK_48ALT2 4'd15
`endif

import common::*;
module memcontrol(
    input clk28,
    cpu_bus bus,
    inout [7:0] xd,
    output [17:14] ra,
    output reg n_romcs,
    output [18:0] va,
    inout [7:0] vd,
    output n_vrd,
    output reg n_vwr,

    input machine_t machine,
    input screenpage,
    input screen_fetch,
    input screen_fetch_up,
    input snow,
    input [14:0] screen_addr,
    input [5:0] screen_up_addr,
    input up_write_req,
    input [5:0] up_write_addr,
    input magic_map,
    input [2:0] rampage128,
    input rompage128,
    input [2:0] port_1ffd,
    input [4:0] port_dffd,
    input [2:0] rampage_ext,
    input rom_alt48_en,
    input rom_alt48,
    input rom_custom_en,
    input [1:0] rom_custom,
    input divmmc_en,
    input div_ram,
    input div_map,
    input div_ramwr_mask,
    input [3:0] div_page,

    input magic_dout_active,
    input [7:0] magic_dout,
    input up_dout_active,
    input [7:0] up_dout,
    input div_dout_active,
    input [7:0] div_dout,
    input ay_dout_active,
    input ports_dout_active,
    input [7:0] ports_dout
);

wire [18:13] ram_a;

assign n_vrd = 1'b0;

reg romreq, ramreq;
always @(posedge clk28) begin
    romreq =  bus.mreq && !bus.rfsh && bus.a[15:14] == 2'b00 &&
        (magic_map || (!div_ram && div_map) || (!div_ram && !port_dffd[4] && !port_1ffd[0]));
    ramreq = (bus.mreq && !bus.rfsh && !romreq) || up_write_req;

    n_vwr = ~(ramreq && bus.wr && !div_ramwr_mask && !screen_fetch);
    n_romcs = ~romreq;
end

reg vwr0;
reg [7:0] xd_bufwr;
reg [18:0] va_buf;
always @(negedge clk28) begin
    if (~n_vwr && !vwr0)
        xd_bufwr <= xd;
    vwr0 <= ~n_vwr;

    if (bus.mreq && ramreq)
        va_buf <= {ram_a[18:13], bus.a[12:0]};
end


// reserve 128K RAM for DivMMC
wire [1:0] rampage_ext0 = {divmmc_en? 1'b1 : ~rampage_ext[1], ~rampage_ext[0]};

assign ram_a =
    magic_map & bus.a[15] & bus.a[14]? {2'b00, 3'b111, bus.a[13]} :
    magic_map? {3'b111, screenpage, bus.a[14:13]} :
    div_map & ~bus.a[15] & ~bus.a[14] & bus.a[13]? {2'b01, div_page} :
    div_map & ~bus.a[15] & ~bus.a[14]? {2'b01, 4'b0011} :
    port_dffd[3] & bus.a[15]? {2'b11, bus.a[14], bus.a[15], bus.a[14], bus.a[13]} :
    port_dffd[3] & bus.a[14]? {rampage_ext0, rampage128, bus.a[13]} :
    (port_1ffd[2] == 1'b0 && port_1ffd[0] == 1'b1)? {2'b11, port_1ffd[1], bus.a[15], bus.a[14], bus.a[13]} :
    (port_1ffd == 3'b101)? {2'b11, ~(bus.a[15] & bus.a[14]), bus.a[15], bus.a[14], bus.a[13]} :
    (port_1ffd == 3'b111)? {2'b11, ~(bus.a[15] & bus.a[14]), (bus.a[15] | bus.a[14]), bus.a[14], bus.a[13]} :
    bus.a[15] & bus.a[14]? {rampage_ext0, rampage128, bus.a[13]} :
    {2'b11, bus.a[14], bus.a[15], bus.a[14], bus.a[13]} ;


assign ra[17:14] =
    magic_map? `BANK_MAGIC :
    div_map? `BANK_DIV :
`ifndef REV_C
    (rom_custom_en && rompage128 == 1'b0)? {2'b10, rom_custom} :
`endif
    (machine == MACHINE_S3)? (
        (port_1ffd[2] == 1'b0 && rompage128 == 1'b0)? `BANK_S3_0 :
        (port_1ffd[2] == 1'b0 && rompage128 == 1'b1)? `BANK_S3_1 :
        (port_1ffd[2] == 1'b1 && rompage128 == 1'b0)? `BANK_S3_2 :
        (rom_alt48_en && rom_alt48)? `BANK_48ALT2 :
        (rom_alt48_en)? `BANK_48ALT1 :
        `BANK_S3_3 ) :
    (machine == MACHINE_S128)? (
        (rompage128 == 1'b0)? `BANK_S128_0 :
        (rom_alt48_en && rom_alt48)? `BANK_48ALT2 :
        (rom_alt48_en)? `BANK_48ALT1 :
        `BANK_S128_1 ) :
    (machine == MACHINE_PENT)? (
        (rompage128 == 1'b0)? `BANK_PENT_0 :
        (rom_alt48_en && rom_alt48)? `BANK_48ALT2 :
        (rom_alt48_en)? `BANK_48ALT1 :
        `BANK_S128_1 ) :
    // 48K
    (rom_alt48_en && rom_alt48)? `BANK_48ALT2 :
    (rom_alt48_en)? `BANK_48ALT1 :
    `BANK_48;

assign va[18:0] =
    screen_fetch && screen_fetch_up? {2'b00, 3'b111, 8'b11111111, screen_up_addr} :
    screen_fetch && snow? {3'b111, screenpage, screen_addr[14:8], bus.a[7:0]} :
    screen_fetch? {3'b111, screenpage, screen_addr} :
    up_write_req? {2'b00, 3'b111, 8'b11111111, up_write_addr} :
    va_buf;


// this is required because of weak xd pullup causing garbage reads from nonexisting ports
reg [1:0] xd_precharge0;
wire xd_precharge = clk28 && xd_precharge0[1] && !xd_precharge0[0];
always @(posedge clk28)
    xd_precharge0 <= {bus.iorq && (bus.rd || bus.m1), xd_precharge0[1]};

assign xd[7:0] =
    (ramreq && bus.rd)? vd :
    magic_dout_active? magic_dout :
    up_dout_active? up_dout :
    div_dout_active? div_dout :
    ay_dout_active? {8{1'bz}} :
    ports_dout_active? ports_dout :
    xd_precharge? 8'hFF :
    {8{1'bz}} ;

assign vd[7:0] =
    (~n_vwr & vwr0)? xd_bufwr :
    {8{1'bz}};


endmodule
