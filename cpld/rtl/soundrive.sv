import common::*;
module soundrive(
    input rst_n,
    input clk28,
    input en_soundrive,
    input en_covox,

    cpu_bus bus,

    output reg [7:0] ch_l0,
    output reg [7:0] ch_l1,
    output reg [7:0] ch_r0,
    output reg [7:0] ch_r1
);

wire covox_cs = en_covox && bus.ioreq && bus.a[7:0] == 8'hFB;
wire soundrive_a_cs = en_soundrive && bus.ioreq && bus.a[7:0] == 8'h0F;
wire soundrive_b_cs = en_soundrive && bus.ioreq && bus.a[7:0] == 8'h1F;
wire soundrive_c_cs = en_soundrive && bus.ioreq && bus.a[7:0] == 8'h4F;
wire soundrive_d_cs = en_soundrive && bus.ioreq && bus.a[7:0] == 8'h5F;

always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        ch_l0 <= 8'h80;
        ch_l1 <= 8'h80;
        ch_r0 <= 8'h80;
        ch_r1 <= 8'h80;
    end
    else begin
        if ((covox_cs || soundrive_a_cs) && bus.wr)
            ch_l0 <= bus.d;
        if ((covox_cs || soundrive_b_cs) && bus.wr)
            ch_l1 <= bus.d;
        if ((covox_cs || soundrive_c_cs) && bus.wr)
            ch_r0 <= bus.d;
        if ((covox_cs || soundrive_d_cs) && bus.wr)
            ch_r1 <= bus.d;
    end
end


endmodule
