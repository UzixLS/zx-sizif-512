import common::*;
module divmmc(
    input rst_n,
    input clk28,
    input ck14,
    input ck7,
    input en,
    input en_hooks,

    cpu_bus bus,
    output [7:0] d_out,
    output d_out_active,

    input sd_miso,
    output sd_mosi,
    output reg sd_sck,
    output reg sd_cs,

    input rammap,
    input magic_mode,
    input magic_map,

    output reg [3:0] div_page,
    output div_map,
    output div_ram,
    output div_ramwr_mask,
    output div_wait
);

reg div_automap, div_automap_next;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        div_automap_next <= 0;
        div_automap <= 0;
    end
    else if (bus.m1 && bus.mreq && magic_map == 0) begin
        if (!en_hooks || !en || rammap) begin
            div_automap_next <= 0;
        end
        else if (bus.a[15:3] == 13'h3FF) begin // exit vectors 1FF8-1FFF
            div_automap_next <= 0;
        end
        else if (
                bus.a == 16'h0000 || // power-on/reset/rst0/software restart
                bus.a == 16'h0008 || // syntax error
                bus.a == 16'h0038 || // im1 interrupt/rst #38
                (bus.a == 16'h0066 && !magic_mode) || // nmi routine
                bus.a == 16'h04C6 || // tape save routine
                bus.a == 16'h0562    // tape load and verify routine
                ) begin
            div_automap_next <= 1'b1;
        end
        else if (bus.a[15:8] == 8'h3D) begin // tr-dos mapping area
            div_automap_next <= 1'b1;
            div_automap <= 1'b1;
        end
    end
    else if (!bus.m1) begin
        div_automap <= div_automap_next;
    end
end

reg spi_rd;
reg div_conmem, div_mapram;
wire port_e3_cs = en && bus.ioreq && bus.a[7:0] == 8'hE3;
wire port_e7_cs = en && bus.ioreq && bus.a[7:0] == 8'hE7;
wire port_eb_cs = en && bus.ioreq && bus.a[7:0] == 8'hEB;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        spi_rd <= 0;
        div_page <= 0;
        div_mapram <= 0;
        div_conmem <= 0;
        sd_cs <= 1'b1;
    end
    else begin
        spi_rd <= port_eb_cs && bus.rd;
        if (port_e3_cs && bus.wr) begin
            div_page <= bus.d[3:0];
            div_mapram <= bus.d[6] | div_mapram;
            div_conmem <= bus.d[7];
        end
        if (port_e7_cs && bus.wr) begin
            sd_cs <= bus.d[0];
        end
    end
end

reg [3:0] spi_cnt;
wire spi_cnt_en = ~spi_cnt[3] | spi_cnt[2] | spi_cnt[1] | spi_cnt[0];
assign div_wait = ~spi_cnt[3];
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        spi_cnt <= 0;
    else if (port_eb_cs && (bus.rd || bus.wr))
        spi_cnt <= 4'b1110;
    else if (spi_cnt_en && ck7)
        spi_cnt <= spi_cnt + 1'b1;
end

reg spi_mosi_en;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        spi_mosi_en <= 0;
    else if (port_eb_cs && bus.wr)
        spi_mosi_en <= 1'b1;
    else if (!spi_cnt_en)
        spi_mosi_en <= 0;
end

reg [7:0] spi_reg;
assign sd_mosi = spi_mosi_en? spi_reg[7] : 1'b1;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        spi_reg <= 0;
    else if (port_eb_cs && bus.wr)
        spi_reg <= bus.d;
    else if (spi_cnt[3] == 1'b0 && ck7)
        spi_reg[7:0] <= {spi_reg[6:0], sd_miso};
end

always @(posedge clk28) begin
    if (ck14)
        sd_sck <= ~sd_sck & ~spi_cnt[3];
end


assign div_map = div_automap | div_conmem;
assign div_ram = (div_conmem == 1 && bus.a[13] == 1) ||
    (div_automap == 1 && bus.a[13] == 1) ||
    (div_conmem == 0 && div_automap == 1 && div_mapram == 1);
assign div_ramwr_mask = bus.a[15] == 0 && bus.a[14] == 0 &&
    (bus.a[13] == 0 || div_page == 4'b0011) && div_conmem == 0 && div_automap == 1 && div_mapram == 1;

assign d_out_active = spi_rd;
assign d_out = spi_reg;

endmodule
