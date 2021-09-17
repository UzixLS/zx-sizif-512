module memcontrol(
    input clk28,
    cpu_bus bus,
    inout [7:0] xd,
    output [17:14] ra,
    output n_romcs,
    output [18:0] va,
    inout [7:0] vd,
    output n_vrd,
    output n_vwr,

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
    input rom_plus3,
    input rom_alt48,
    input [2:0] rampage_ext,
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

wire romreq =  bus.mreq && !bus.rfsh &&  bus.a[14] == 0 && bus.a[15] == 0 &&
        (magic_map || (!div_ram && div_map) || (!div_ram && !port_dffd[4] && !port_1ffd[0]));
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
    port_dffd[3] & bus.a[15]? {2'b11, bus.a[14], bus.a[15], bus.a[14], bus.a[13]} :
    port_dffd[3] & bus.a[14]? {rampage_ext0, rampage128, bus.a[13]} :
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
    magic_dout_active? magic_dout :
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
