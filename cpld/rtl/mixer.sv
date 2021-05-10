module mixer(
    input rst_n,
    input clk28,

    input beeper,
    input tape_out,
    input tape_in,

    input [7:0] sd_l0,
    input [7:0] sd_l1,
    input [7:0] sd_r0,
    input [7:0] sd_r1,
    
    output dac_l,
    output dac_r
);

localparam WIDTH = 10;

reg [WIDTH:0] dac_l_cnt, dac_r_cnt;
assign dac_l = dac_l_cnt[WIDTH];
assign dac_r = dac_r_cnt[WIDTH];

wire [WIDTH-1:0] dac_next_l = 
    sd_l0 + sd_l1 +
    {beeper, tape_out, tape_in, 5'b00000}
    ;
wire [WIDTH-1:0] dac_next_r =
    sd_r0 + sd_r1 +
    {beeper, tape_out, tape_in, 5'b00000}
    ;

always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        dac_l_cnt <= 0;
        dac_r_cnt <= 0;
    end
    else begin
        dac_l_cnt <= dac_l_cnt[WIDTH-1:0] + dac_next_l;
        dac_r_cnt <= dac_r_cnt[WIDTH-1:0] + dac_next_r;
    end
end

endmodule
