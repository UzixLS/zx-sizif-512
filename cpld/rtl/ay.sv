import common::*;
module ay(
    input rst_n,
    input clk28,

    cpu_bus bus,
    input ck35,

    output reg ay_clk,
    output reg ay_bc1,
    output reg ay_bdir
);


always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        ay_clk <= 0;
        ay_bc1 <= 0;
        ay_bdir <= 0;
    end
    else begin
        if (ck35)
            ay_clk <= ~ay_clk;
        ay_bc1  <= bus.a[15] == 1'b1 && bus.a[14] == 1'b1 && bus.a[1] == 0 && bus.ioreq;
        ay_bdir <= bus.a[15] == 1'b1 && bus.a[1] == 0 && bus.ioreq && bus.wr;
    end
end


endmodule
