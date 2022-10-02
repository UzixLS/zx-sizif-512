module joysega(
    input clk28,
    input rst_n,

    input [8:0] vc,
    input [8:0] hc,
    input turbo_strobe,
    output sync_strobe,

    input n_joy_up,
    input n_joy_down,
    input n_joy_left,
    input n_joy_right,
    input n_joy_b1,
    input n_joy_b2,
    output reg joy_sel,

    output reg joy_up,
    output reg joy_down,
    output reg joy_left,
    output reg joy_right,
    output reg joy_b1,
    output reg joy_b2,
    output reg joy_b3,
    output reg joy_x,
    output reg joy_y,
    output reg joy_z,
    output reg joy_start,
    output reg joy_mode,
    output wire joy_b1_turbo,
    output wire joy_b2_turbo,
    output wire joy_b3_turbo
);

`ifdef REV_C
    localparam READ_DELAY = 0;
    wire joy_rd_strobe = hc[4:1] == 4'b1111;
`elsif REV_D
    localparam READ_DELAY = 0;
    wire joy_rd_strobe = hc[4:1] == 4'b1111;
`else
    localparam READ_DELAY = 1;
    wire joy_rd_strobe = hc[4:1] == 4'b0111;
`endif

reg joy_md, joy_md6;
wire joy_rd_ena = hc < 256 && vc[6:0] == 0; // every ~8ms
wire [2:0] joy_rd_state = hc[7:5]; // one step ~4.5us
assign sync_strobe = hc[4:1] == 4'b1101;

always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        joy_md <= 0;
        joy_md6 <= 0;
        joy_up <= 0;
        joy_down <= 0;
        joy_left <= 0;
        joy_right <= 0;
        joy_b1 <= 0;
        joy_b2 <= 0;
        joy_b3 <= 0;
        joy_start <= 0;
        joy_mode <= 0;
        joy_x <= 0;
        joy_y <= 0;
        joy_z <= 0;
    end
    else begin
        joy_sel <= (joy_rd_state[0] && joy_rd_ena)? 1'b1 : 1'b0;
        if (joy_rd_ena && joy_rd_strobe) begin
            if (joy_rd_state == 3'd2 + READ_DELAY) begin
                if (n_joy_left == 0 && n_joy_right == 0) begin
                    joy_md <= 1'b1;
                    joy_b3 <= ~n_joy_b1;
                    joy_start <= ~n_joy_b2;
                end
                else begin
                    joy_md <= 0;
                    joy_b3 <= 0;
                    joy_start <= 0;
                end
            end
            else if (joy_rd_state == 3'd3 + READ_DELAY) begin
                joy_up <= ~n_joy_up;
                joy_down <= ~n_joy_down;
                joy_left <= ~n_joy_left;
                joy_right <= ~n_joy_right;
                joy_b1 <= ~n_joy_b1;
                joy_b2 <= ~n_joy_b2;
            end
            else if (joy_rd_state == 3'd4 + READ_DELAY) begin
                joy_md6 <= joy_md && n_joy_up == 0 && n_joy_down == 0;
            end
            else if (joy_rd_state == 3'd5 + READ_DELAY) begin
                if (joy_md6) begin
                    joy_mode <= ~n_joy_right;
                    joy_x <= ~n_joy_left;
                    joy_y <= ~n_joy_down;
                    joy_z <= ~n_joy_up;
                end
                else begin
                    joy_mode <= 0;
                    joy_x <= 0;
                    joy_y <= 0;
                    joy_z <= 0;
                end
            end
        end
    end
end

assign joy_b1_turbo = joy_b1 | (joy_y & turbo_strobe);
assign joy_b2_turbo = joy_b2 | (joy_z & turbo_strobe);
assign joy_b3_turbo = joy_b3 | (joy_x & turbo_strobe);


endmodule
