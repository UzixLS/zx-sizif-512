import common::*;
module divmmc(
    input rst_n,
    input clk28,
    input ck14,
    input ck7,
    input en,
    input en_hooks,
    input en_zc,

    cpu_bus bus,
    output [7:0] d_out,
    output d_out_active,

    input sd_cd,
    input sd_miso,
    output sd_mosi,
    output reg sd_sck,
    output reg sd_cs,

    input rammap,
    input magic_mode,
    input magic_map,

    output reg [3:0] page,
    output map,
    output reg mapram,
    output ram,
    output ramwr_mask,
    output cpuwait
);

reg automap, automap_next;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        automap_next <= 0;
        automap <= 0;
    end
    else if (bus.m1 && bus.mreq && !magic_map) begin
        if (!en_hooks || !en || rammap) begin
            automap_next <= 0;
        end
        else if (bus.a[15:3] == 13'h3FF) begin // exit vectors 1FF8-1FFF
            automap_next <= 0;
        end
        else if (
                bus.a == 16'h0000 || // power-on/reset/rst0/software restart
                bus.a == 16'h0008 || // syntax error
                bus.a == 16'h0038 || // im1 interrupt/rst #38
                (bus.a == 16'h0066 && !magic_mode) || // nmi routine
                bus.a == 16'h04C6 || // tape save routine
                bus.a == 16'h0562    // tape load and verify routine
                ) begin
            automap_next <= 1'b1;
        end
        else if (bus.a[15:8] == 8'h3D) begin // tr-dos mapping area
            automap_next <= 1'b1;
            automap <= 1'b1;
        end
    end
    else if (!bus.m1) begin
        automap <= automap_next;
    end
end

reg conmem;
wire port_e3_cs = en && bus.ioreq && bus.a[7:0] == 8'hE3;
wire port_e7_cs = en && bus.ioreq && bus.a[7:0] == 8'hE7;
wire port_eb_cs = en && bus.ioreq && bus.a[7:0] == 8'hEB;
wire port_57_cs = en_zc && bus.ioreq && bus.a[7:0] == 8'h57;
wire port_77_cs = en_zc && bus.ioreq && bus.a[7:0] == 8'h77;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        page <= 0;
        mapram <= 0;
        conmem <= 0;
        sd_cs <= 1'b1;
    end
    else begin
        if (port_e3_cs && bus.wr) begin
            page <= bus.d[3:0];
            mapram <= bus.d[6] | mapram;
            conmem <= bus.d[7];
        end
        if (port_e7_cs && bus.wr) begin
            sd_cs <= bus.d[0];
        end
        else if (port_77_cs && bus.wr) begin
            sd_cs <= bus.d[1] | ~bus.d[0];
        end
    end
end

reg spi_rd, zc_rd;
wire [7:0] zc_data = {7'b0000000, sd_cd};
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        spi_rd <= 0;
        zc_rd <= 0;
    end
    else begin
        spi_rd <= (port_eb_cs || port_57_cs) && bus.rd;
        zc_rd <= port_77_cs && bus.rd;
    end
end

reg [3:0] spi_cnt;
wire spi_cnt_en = ~spi_cnt[3] | spi_cnt[2] | spi_cnt[1] | spi_cnt[0];
assign cpuwait = ~spi_cnt[3];
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        spi_cnt <= 0;
    else if ((port_eb_cs || port_57_cs) && (bus.rd || bus.wr))
        spi_cnt <= 4'b1110;
    else if (spi_cnt_en && ck7)
        spi_cnt <= spi_cnt + 1'b1;
end

reg spi_mosi_en;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        spi_mosi_en <= 0;
    else if ((port_eb_cs || port_57_cs) && bus.wr)
        spi_mosi_en <= 1'b1;
    else if (!spi_cnt_en)
        spi_mosi_en <= 0;
end

reg [7:0] spi_reg;
assign sd_mosi = spi_mosi_en? spi_reg[7] : 1'b1;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        spi_reg <= 0;
    else if ((port_eb_cs || port_57_cs) && bus.wr)
        spi_reg <= bus.d;
    else if (spi_cnt[3] == 1'b0 && ck7)
        spi_reg[7:0] <= {spi_reg[6:0], sd_miso};
end

always @(posedge clk28) begin
    if (ck14)
        sd_sck <= ~sd_sck & ~spi_cnt[3];
end


assign map = automap | conmem;
assign ram =
    (automap && bus.a[13]) ||
    (conmem && bus.a[13]) ||
    (!conmem && automap && mapram);
assign ramwr_mask =
    !bus.a[15] && !bus.a[14] &&
    (!bus.a[13] || page == 4'b0011) &&
    !conmem && automap && mapram;

assign d_out_active = zc_rd | spi_rd;
assign d_out = zc_rd? zc_data : spi_reg;

endmodule
