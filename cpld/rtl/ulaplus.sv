import common::*;
module ulaplus(
    input rst_n,
    input clk28,
    input en,

    cpu_bus bus,
    output [7:0] d_out,
    output d_out_active,

    output reg active,
    output reg read_req,
    output reg write_req,
    output [5:0] rw_addr,
    output reg [5:0] timex_mode,
    output reg uplus_video_page_cs,
    output reg uplus_video_page,
    input magic_map
);


wire port_bf3b_cs = en && bus.ioreq && bus.a == 16'hBF3B;
wire port_ff3b_cs = en && bus.ioreq && bus.a == 16'hFF3B;
reg port_ff3b_rd;
wire [7:0] port_ff3b_data = {7'b0000000, active};
reg [7:0] addr_reg;
assign rw_addr = addr_reg[5:0];
reg [5:0] prev_timex_mode;

//shadowing timex mode from timex FF register write, is active even without UP enabled
// unfortunatelly Sizif Magic menu uses lower-bytes FF port for its own purposes
wire port_ff_cs = !magic_map && bus.ioreq && bus.a[7:0] == 8'hFF;
// as well as 9ffd (eLeMeNt ZX)
wire port_9ffd_cs = bus.ioreq && bus.a[15:0] == 16'h9FFD;
wire mode_switching_data = (bus.d[7:6] == 2'b01 && bus.d[2:0] != 3'b000);
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        active <= 0;
        addr_reg <= 0;
        read_req <= 0;
        write_req <= 0;
        port_ff3b_rd <= 0;
        timex_mode <= 0;
        prev_timex_mode <= 0;
        uplus_video_page_cs <= 0;
        uplus_video_page <= 0;
    end
    else begin
        // 01 and all zeros are used to enable ULA+ pallete,
        // it would also disable timex mode, so exclude it!  
        uplus_video_page_cs <= port_bf3b_cs && bus.wr && mode_switching_data;
        if (port_bf3b_cs && bus.wr) begin
            addr_reg <= bus.d;
            if (mode_switching_data) begin
                // some forbidden timex states are used to swith screen 5 to 7 like in spectrum 128
                timex_mode[0] <= bus.d[0] & ~bus.d[1];
                // timex FF port bit [1] must be turn on both in hiColor and in hiRes
                timex_mode[1] <= bus.d[1];
                timex_mode[2] <= bus.d[1] & bus.d[2];
                timex_mode[5:3] <= bus.d[5:3];
                uplus_video_page <= bus.d[2] & ~bus.d[1] & ~bus.d[0];
            end
        end
        if ((port_ff_cs || port_9ffd_cs) && bus.wr)
            timex_mode <= bus.d[5:0];
        if (port_ff3b_cs && bus.wr && addr_reg == 8'b01000000) begin
            active <= bus.d[0];
            if (active && timex_mode == 5'b00000)
                timex_mode <= prev_timex_mode;
            else begin
                prev_timex_mode <= timex_mode;
                timex_mode <= 5'b00000;
            end
        end

        read_req  <= port_ff3b_cs && bus.rd && addr_reg[7:6] == 2'b00;
        write_req <= port_ff3b_cs && bus.wr && addr_reg[7:6] == 2'b00;
        port_ff3b_rd <= port_ff3b_cs && bus.rd;

        if (!en)
            active <= 0;
    end
end


assign d_out = port_ff3b_data;
assign d_out_active = port_ff3b_rd;

endmodule
