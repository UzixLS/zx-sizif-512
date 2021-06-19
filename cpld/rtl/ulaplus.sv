import common::*;
module ulaplus(
    input rst_n,
    input clk28,
    input en,

    cpu_bus bus,
    output [7:0] d_out,
    output d_out_active,

    output reg active,
    output reg write_req,
    output [5:0] write_addr
);


wire port_bf3b_cs = en && bus.ioreq && bus.a == 16'hBF3B;
wire port_ff3b_cs = en && bus.ioreq && bus.a == 16'hFF3B;
reg port_ff3b_rd;
wire [7:0] port_ff3b_data = {7'b0000000, active};
reg [7:0] addr_reg;
assign write_addr = addr_reg[5:0];

always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        active <= 0;
        addr_reg <= 0;
        write_req <= 0;
        port_ff3b_rd <= 0;
    end
    else begin
        if (port_bf3b_cs && bus.wr)
            addr_reg <= bus.d;
        if (port_ff3b_cs && bus.wr && addr_reg == 8'b01000000)
            active <= bus.d[0];

        write_req <= port_ff3b_cs && bus.wr && addr_reg[7:6] == 2'b00;
        port_ff3b_rd <= port_ff3b_cs && bus.rd;

        if (!en)
            active <= 0;
    end
end


assign d_out = port_ff3b_data;
assign d_out_active = port_ff3b_rd;

endmodule
