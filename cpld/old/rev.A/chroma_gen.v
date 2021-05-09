// Based on Joerg Wolfram's code //

module chroma_gen #(
    parameter CLK_FREQ
    ) (
    input cg_clock,         // input clock
    input cg_enable,        // colour enable
    input cg_hsync,         // hor. sync
    input cg_pnsel,         // system (pal/ntsc)
    input [2:0] cg_rgb,     // rgb input
    output reg [2:0] cg_out // chroma out
);

localparam CARRIER_WIDTH =
    (CLK_FREQ == 14_000_000)? 17 :
    (CLK_FREQ == 14_318_180)? 17 :
    (CLK_FREQ == 16_000_000)? 14 :
    (CLK_FREQ == 17_734_475)? 3 :
    (CLK_FREQ == 20_000_000)? 14 :
    (CLK_FREQ == 24_000_000)? 17 :
    (CLK_FREQ == 25_000_000)? 16 :
    (CLK_FREQ == 28_000_000)? 18 :
    (CLK_FREQ == 32_000_000)? 15 :
    (CLK_FREQ == 40_000_000)? 15 :
    0;
localparam PAL_CARRIER =
    (CLK_FREQ == 14_000_000)? 83018 : // 20.776 error
    (CLK_FREQ == 14_318_180)? 81173 : // 11.72 error
    (CLK_FREQ == 16_000_000)? 9080 :  // 25 error
    (CLK_FREQ == 17_734_475)? 4 :     // 0 error
    (CLK_FREQ == 20_000_000)? 7264 :  // 25 error
    (CLK_FREQ == 24_000_000)? 48427 : // 5.51 error
    (CLK_FREQ == 25_000_000)? 23245 : // 13.14 error
    (CLK_FREQ == 28_000_000)? 83018 : // 20.78 error
    (CLK_FREQ == 32_000_000)? 9080 :  // 25 error
    (CLK_FREQ == 40_000_000)? 7264 :  // 25 error
    0;
localparam NTSC_CARRIER =
    (CLK_FREQ == 14_000_000)? 67025 : // 23.82 error
    (CLK_FREQ == 14_318_180)? 65536 : // 0 errror
    (CLK_FREQ == 16_000_000)? 7331 :  // 44.84 error
    (CLK_FREQ == 17_734_475)? 4 :     // 0 error (NTSC4.43)
    (CLK_FREQ == 20_000_000)? 5865 :  // 166.91 error
    (CLK_FREQ == 24_000_000)? 39098 : // 16.19 error
    (CLK_FREQ == 25_000_000)? 18767 : // 23.82 error
    (CLK_FREQ == 28_000_000)? 67025 : // 23.82 error
    (CLK_FREQ == 32_000_000)? 7331 :  // 44.84 error
    (CLK_FREQ == 40_000_000)? 5865 :  // 166.91 error
    0;

reg [CARRIER_WIDTH:0] carrier;
wire [31:0] carrier_next;
reg [3:0] burst_cnt;
wire burst;
reg oddeven;
reg [3:0] phase;
reg [3:0] scarrier;
wire cenable;


// DDS for PAL-carrier
assign carrier_next = (cg_pnsel == 1'b0)?
        (carrier + PAL_CARRIER)  :
        (carrier + NTSC_CARRIER) ;

always @(posedge cg_clock) begin
    carrier <= carrier_next[CARRIER_WIDTH:0];
end

// burst generator
always @(posedge carrier[CARRIER_WIDTH] or negedge cg_hsync) begin
    if (cg_hsync == 1'b0)
        burst_cnt <= 4'b0100;
    else if (burst_cnt != 4'b0000)
        burst_cnt <= burst_cnt + 1'b1;
end
assign burst = burst_cnt[3];

// odd/even line
always @(posedge cg_hsync) begin
    if (cg_pnsel == 1'b0)
        oddeven <= ~oddeven;
    else
        oddeven <= 1'b0;
end

// carrier phase
always @* begin
    if (burst == 1'b1) begin
        if ((oddeven == 1'b0) && (cg_pnsel == 1'b0))
            phase <= 4'b0110; // burst phase 135 deg
        else
            phase <= 4'b1010; // burst phase -135 deg
    end
    else if (oddeven == 1'b0) begin
        case (cg_rgb)
            3'b001:  phase <= 4'b0000; // blue phase
            3'b010:  phase <= 4'b0101; // red phase
            3'b011:  phase <= 4'b0011; // magenta phase
            3'b100:  phase <= 4'b1011; // green phase
            3'b101:  phase <= 4'b1101; // cyan phase
            3'b110:  phase <= 4'b0111; // yellow phase
            default: phase <= 4'b0000; // dummy function
        endcase
    end
    else begin
        case (cg_rgb)
            3'b001:  phase <= 4'b0000; // blue phase
            3'b010:  phase <= 4'b1011; // red phase
            3'b011:  phase <= 4'b1101; // magenta phase
            3'b100:  phase <= 4'b0101; // green phase
            3'b101:  phase <= 4'b0011; // cyan phase
            3'b110:  phase <= 4'b1001; // yellow phase
            default: phase <= 4'b0000; // dummy function
        endcase
    end
end

// modulated carrier
always @*
    scarrier <= carrier[CARRIER_WIDTH:CARRIER_WIDTH-3] + phase;

// colour enable
assign cenable =
    cg_enable == 1'b1 &&
    cg_rgb != 3'b000 &&
    cg_rgb != 3'b111;

// chroma signal
always @(posedge cg_clock) begin
    cg_out[2] <= cenable;
    cg_out[1] <= burst;
    cg_out[0] <= scarrier[3];
end


endmodule
