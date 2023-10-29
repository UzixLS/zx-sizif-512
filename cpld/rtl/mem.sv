`ifdef REV_C
    `define BANK_PENT_0   4'd0
    `define BANK_S128_0   4'd0
    `define BANK_S128_1   4'd1
    `define BANK_MAGIC    4'd2
    `define BANK_DIV      4'd3
    `define BANK_S3_0     4'd4
    `define BANK_S3_1     4'd5
    `define BANK_S3_2     4'd6
    `define BANK_S3_3     4'd1
    `define BANK_S3_3_DIV 4'd1
    `define BANK_48       4'd1
    `define BANK_48ALT1   4'd7
    `define BANK_48ALT2   4'd7
`else
    `define BANK_PENT_0   4'd0
    `define BANK_S128_0   4'd9
    `define BANK_S128_1   4'd1
    `define BANK_MAGIC    4'd2
    `define BANK_DIV      4'd3
    `define BANK_S3_0     4'd4
    `define BANK_S3_1     4'd5
    `define BANK_S3_2     4'd6
    `define BANK_S3_3     4'd11
    `define BANK_S3_3_DIV 4'd12
    `define BANK_48       4'd10
    `define BANK_48ALT1   4'd7
    `define BANK_48ALT2   4'd8
`endif

import common::*;
module mem(
    input rst_n,
    input clk28,
    cpu_bus bus,
    inout [7:0] xd,
    output [17:14] ra,
    output reg n_romcs,
    output [18:0] va,
    inout [7:0] vd,
    output n_vrd,
    output n_vwr,

    output basic48_paged,
    output cpuwait,

    input machine_t machine,
    input rom_wren,
    input magic_map,
    input [2:0] ram_page128,
    input rom_page128,
    input [2:0] port_1ffd,
    input [4:0] port_dffd,
    input [2:0] ram_pageext,
    input rom_alt48_en,
    input rom_alt48,
    input rom_custom_en,
    input [1:0] rom_custom,
    input divmmc_en,
    input div_ram,
    input div_map,
    input div_ramwr_mask,
    input [3:0] div_page,

    input snow,
    input video_page,
    input video_read_req,
    input video_read_req_is_up,
    input [14:0] video_read_addr,
    output video_read_req_ack,
    output video_data_valid,
    input up_read_req,
    input [5:0] up_read_addr,
    input up_write_req,
    input [5:0] up_write_addr,

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

wire romreq = bus.mreq && !bus.rfsh && bus.a[15:14] == 2'b00 &&
                (magic_map || (!div_ram && div_map) || (!div_ram && !port_dffd[4] && !port_1ffd[0]));
wire ramreq = bus.mreq && !bus.rfsh && !romreq;

reg ram_read_req;
always @(posedge clk28)
    ram_read_req <= ramreq && bus.rd;
always @(posedge clk28)
    n_romcs <= ~romreq;

// reserve 128K RAM for DivMMC
wire [1:0] ram_pageext0 = {divmmc_en? 1'b1 : ~ram_pageext[1], ~ram_pageext[0]};

wire [18:13] ram_a =
    (magic_map && bus.a[15:14] == 2'b11)           ? {2'b00, 3'b111, bus.a[13]} :
    (magic_map)                                    ? {3'b111, video_page, bus.a[14:13]} :
    (div_map && bus.a[15:13] == 3'b001)            ? {2'b01, div_page} :
    (div_map && bus.a[15:14] == 2'b00)             ? {2'b01, 4'b0011} :
    (port_dffd[3] && bus.a[15])                    ? {2'b11, bus.a[14], bus.a[15], bus.a[14], bus.a[13]} :
    (port_dffd[3] && bus.a[14])                    ? {ram_pageext0, ram_page128, bus.a[13]} :
    (port_1ffd[2] == 1'b0 && port_1ffd[0] == 1'b1) ? {2'b11, port_1ffd[1], bus.a[15], bus.a[14], bus.a[13]} :
    (port_1ffd == 3'b101)                          ? {2'b11, ~(bus.a[15] & bus.a[14]), bus.a[15], bus.a[14], bus.a[13]} :
    (port_1ffd == 3'b111)                          ? {2'b11, ~(bus.a[15] & bus.a[14]), (bus.a[15] | bus.a[14]), bus.a[14], bus.a[13]} :
    (bus.a[15:14] == 2'b11)                        ? {ram_pageext0, ram_page128, bus.a[13]} :
                                                     {2'b11, bus.a[14], bus.a[15], bus.a[14], bus.a[13]} ;

wire [14:0] video_read_addr_snowed = (snow && !video_read_req_is_up)? {video_read_addr[14:7], bus.a[6:0]} : video_read_addr;

wire cpu_data_latchen, up_data_latchen;
reg [7:0] xd_out_latch;
always @* begin
    if (cpu_data_latchen || up_data_latchen)
        xd_out_latch <= vd;
end

wire cpu_read_misaddress, cpu_data_valid;
reg cpuwait_reg;
assign cpuwait = cpu_read_misaddress || cpuwait_reg;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        cpuwait_reg <= 0;
    else if (cpu_read_misaddress)
        cpuwait_reg <= 1'b1;
    else if (cpu_data_valid)
        cpuwait_reg <= 0;
end

wire [7:0] vd_out;
assign vd = n_vwr? {8{1'bz}} : vd_out;
assign n_vrd = 1'b0;
ram_arbiter ram_arbiter0(
    .clk28(clk28),
    .va(va),
    .vd_out(vd_out),
    .n_vwr(n_vwr),
    .cpu_read_req(bus.mreq && bus.rd), // (ramreq && bus.rd) isnt used to get faster response
    .cpu_addr(bus.a[12:0]),
    .cpu_addr_hi(ram_a),
    .cpu_read_misaddress(cpu_read_misaddress),
    .cpu_data_latchen(cpu_data_latchen),
    .cpu_data_valid(cpu_data_valid),
    .cpu_write_req(ramreq && bus.wr && !div_ramwr_mask),
    .cpu_write_data(bus.d),
    .video_read_req(video_read_req),
    .video_read_req_is_up(video_read_req_is_up),
    .video_read_addr(video_read_addr_snowed),
    .video_read_page(video_page),
    .video_read_req_ack(video_read_req_ack),
    .video_data_valid(video_data_valid),
    .up_read_req(up_read_req),
    .up_read_addr(up_read_addr),
    .up_data_latchen(up_data_latchen),
    .up_write_req(up_write_req),
    .up_write_addr(up_write_addr),
    .up_write_data(bus.d)
);

assign ra[17:14] =
    rom_wren                                          ? {3'b000, bus.a[0]} : // handle jedec sequence (Z80 addr #1555 = ROM addr #05555, Z80 addr #2AAA = ROM addr #02AAA)
    magic_map                                         ? `BANK_MAGIC :
    div_map                                           ? `BANK_DIV :
`ifndef REV_C
    (rom_custom_en && rom_page128 == 1'b0)            ? {2'b11, rom_custom} :
`endif
    (machine == MACHINE_S3)? (
        (port_1ffd[2] == 1'b0 && rom_page128 == 1'b0) ? `BANK_S3_0 :
        (port_1ffd[2] == 1'b0 && rom_page128 == 1'b1) ? `BANK_S3_1 :
        (port_1ffd[2] == 1'b1 && rom_page128 == 1'b0) ? `BANK_S3_2 :
        (rom_alt48_en && rom_alt48)                   ? `BANK_48ALT2 :
        (rom_alt48_en)                                ? `BANK_48ALT1 :
        (divmmc_en)                                   ? `BANK_S3_3_DIV :
                                                        `BANK_S3_3 ) :
    (machine == MACHINE_S128)? (
        (rom_page128 == 1'b0)                         ? `BANK_S128_0 :
        (rom_alt48_en && rom_alt48)                   ? `BANK_48ALT2 :
        (rom_alt48_en)                                ? `BANK_48ALT1 :
                                                        `BANK_S128_1 ) :
    (machine == MACHINE_PENT)? (
        (rom_page128 == 1'b0)                         ? `BANK_PENT_0 :
        (rom_alt48_en && rom_alt48)                   ? `BANK_48ALT2 :
        (rom_alt48_en)                                ? `BANK_48ALT1 :
                                                        `BANK_S128_1 ) :
    // 48K
    (rom_alt48_en && rom_alt48)                       ? `BANK_48ALT2 :
    (rom_alt48_en)                                    ? `BANK_48ALT1 :
                                                        `BANK_48 ;

assign basic48_paged = (ra == `BANK_48) ||
                       (ra == `BANK_48ALT1) ||
                       (ra == `BANK_48ALT2) ||
                       (ra == `BANK_S128_1) ||
                       (ra == `BANK_S3_3) ||
                       (ra == `BANK_S3_3_DIV) ;

// this is required because of weak xd pullup causing garbage reads from nonexisting ports
reg [1:0] xd_precharge0;
wire xd_precharge = clk28 && xd_precharge0[1] && !xd_precharge0[0];
always @(posedge clk28)
    xd_precharge0 <= {bus.iorq && (bus.rd || bus.m1), xd_precharge0[1]};

assign xd[7:0] =
    ram_read_req                   ? xd_out_latch :
    up_read_req                    ? xd_out_latch :
    ay_dout_active                 ? {8{1'bz}} :
    magic_dout_active              ? magic_dout :
    div_dout_active                ? div_dout :
    up_dout_active                 ? up_dout :
    ports_dout_active              ? ports_dout :
    xd_precharge                   ? 8'hFF :
                                     {8{1'bz}} ;

endmodule



module ram_arbiter(
    input clk28,

    output reg [18:0] va,
    output reg [7:0] vd_out,
    output reg n_vrd,
    output reg n_vwr,

    input cpu_read_req,
    input [12:0] cpu_addr,
    input [18:13] cpu_addr_hi,
    output cpu_read_misaddress,
    output reg cpu_data_latchen,
    output cpu_data_valid,
    input cpu_write_req,
    input [7:0] cpu_write_data,

    input video_read_req,
    input video_read_req_is_up,
    input [14:0] video_read_addr,
    input video_read_page,
    output video_data_valid,
    output video_read_req_ack,

    input up_read_req,
    input [5:0] up_read_addr,
    output reg up_data_latchen,
    output up_data_valid,

    input up_write_req,
    input [5:0] up_write_addr,
    input [7:0] up_write_data
);
localparam LATENCY = 2'd2;
localparam LATENCY_VIDEO = 2'd1;

reg cpu_write_req0, up_write_req0, cpu_read_req0, up_read_req0;
wire cpu_write_req_rise = cpu_write_req && !cpu_write_req0;
wire up_write_req_rise  = up_write_req  && !up_write_req0;
wire cpu_read_req_rise  = cpu_read_req  && !cpu_read_req0;
wire up_read_req_rise   = up_read_req   && !up_read_req0;
wire hiprio_req_rise    = cpu_write_req_rise || up_write_req_rise || cpu_read_req_rise || up_read_req_rise;

localparam REQ_NONE      = 2'd0;
localparam REQ_CPU_RD    = 2'd1;
localparam REQ_UP_RD     = 2'd2;
localparam REQ_VIDEO_RD  = 2'd3;
reg [1:0] current_req = REQ_NONE;
reg [1:0] step = 0;

assign cpu_read_misaddress = current_req == REQ_CPU_RD && cpu_addr_hi != va[18:13];

always @(posedge clk28) begin
    if (step == 0 || (current_req == REQ_VIDEO_RD && hiprio_req_rise)) begin
        cpu_data_latchen         <= 0;
        up_data_latchen          <= 0;

        if (cpu_write_req_rise) begin
            n_vrd                <= 1'b1;
            n_vwr                <= 1'b0;
            va                   <= {cpu_addr_hi, cpu_addr};
            vd_out               <= cpu_write_data;
            current_req          <= REQ_NONE;
            step                 <= LATENCY;
        end
        else if (up_write_req_rise) begin
            n_vrd                <= 1'b1;
            n_vwr                <= 1'b0;
            va                   <= {2'b00, 3'b111, 8'b11111111, up_write_addr};
            vd_out               <= up_write_data;
            current_req          <= REQ_NONE;
            step                 <= LATENCY;
        end
        else if (cpu_read_req_rise) begin
            n_vrd                <= 1'b0;
            n_vwr                <= 1'b1;
            va                   <= {cpu_addr_hi, cpu_addr};
            current_req          <= REQ_CPU_RD;
            step                 <= LATENCY;
            cpu_data_latchen     <= 1'b1;
        end
        else if (up_read_req_rise) begin
            n_vrd                <= 1'b0;
            n_vwr                <= 1'b1;
            va                   <= {2'b00, 3'b111, 8'b11111111, up_read_addr};
            current_req          <= REQ_UP_RD;
            step                 <= LATENCY;
            up_data_latchen      <= 1'b1;
        end
        else if (video_read_req) begin
            n_vrd                <= 1'b0;
            n_vwr                <= 1'b1;
            va                   <= video_read_req_is_up?
                                    {2'b00, 3'b111, 8'b11111111, video_read_addr[5:0]} :
                                    {3'b111, video_read_page, video_read_addr} ;
            current_req          <= REQ_VIDEO_RD;
            step                 <= LATENCY_VIDEO;
        end
        else begin
            n_vrd                <= 1'b1;
            n_vwr                <= 1'b1;
            current_req          <= REQ_NONE;
            step                 <= 0;
        end

        cpu_write_req0           <= cpu_write_req;
        up_write_req0            <= up_write_req;
        cpu_read_req0            <= cpu_read_req;
        up_read_req0             <= up_read_req;
    end
    else if (cpu_read_misaddress) begin
        va                       <= {cpu_addr_hi, cpu_addr};
        step                     <= LATENCY;
    end
    else begin
        step                     <= step - 1'd1;
    end
end

assign cpu_data_valid             = current_req == REQ_CPU_RD   && step == 0;
assign up_data_valid              = current_req == REQ_UP_RD    && step == 0;
assign video_data_valid           = current_req == REQ_VIDEO_RD && step == 0;
assign video_read_req_ack         = current_req == REQ_VIDEO_RD && step == 1'd1 && !hiprio_req_rise;

endmodule
