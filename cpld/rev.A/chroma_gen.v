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

parameter CARRIER_WIDTH =
    (CLK_FREQ == 17_734_475)? 4 :  
    (CLK_FREQ == 14_318_180)? 17 :
    (CLK_FREQ == 40_000_000)? 15 :
    (CLK_FREQ == 20_000_000)? 14 :
    (CLK_FREQ == 32_000_000)? 15 :
    (CLK_FREQ == 16_000_000)? 14 :
    (CLK_FREQ == 28_000_000)? 18 :
    (CLK_FREQ == 14_000_000)? 17 :
    0;
parameter PAL_CARRIER =
    (CLK_FREQ == 17_734_475)? 8 :
    (CLK_FREQ == 14_318_180)? 81173 :
    (CLK_FREQ == 40_000_000)? 7264 :
    (CLK_FREQ == 20_000_000)? 7264 :
    (CLK_FREQ == 32_000_000)? 9080 :
    (CLK_FREQ == 16_000_000)? 9080 :
    (CLK_FREQ == 28_000_000)? 83018 :
    (CLK_FREQ == 14_000_000)? 83018 :
    0;
parameter NTSC_CARRIER =
    (CLK_FREQ == 17_734_475)? 8 : // NTSC4.43
    (CLK_FREQ == 14_318_180)? 65536 :
    (CLK_FREQ == 40_000_000)? 5865 :
    (CLK_FREQ == 20_000_000)? 5865 :
    (CLK_FREQ == 32_000_000)? 7331 :
    (CLK_FREQ == 16_000_000)? 7331 :
    (CLK_FREQ == 28_000_000)? 67025 :
    (CLK_FREQ == 14_000_000)? 67025 :
    0;

reg [CARRIER_WIDTH:0] carrier;
reg [3:0] bcounter;
reg [3:0] phase;
reg [3:0] scarrier;
reg oddeven;
reg burst, bstop;
reg cenable;


// DDS for PAL-carrier
always @(posedge cg_clock) begin
    if (cg_pnsel == 1'b0)
        carrier <= carrier + PAL_CARRIER;
    else
        carrier <= carrier + NTSC_CARRIER;
end

// burst generator  
always @* begin
    if (bcounter == 4'b0000) 
        bstop <= 1'b1;
    else
        bstop <= 1'b0;
end

always @(posedge carrier[CARRIER_WIDTH] or negedge cg_hsync) begin
    if (cg_hsync == 1'b0)
        bcounter <= 4'b0100;
    else if (carrier[CARRIER_WIDTH] == 1'b1 && bstop == 1'b0)
        bcounter <= bcounter + 1;   
end

always @*
    burst <= bcounter[3];

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
always @* begin
    if ((cg_rgb != 3'b000) && (cg_rgb != 3'b111) && (cg_enable == 1'b1))
        cenable <= 1'b1;
    else
        cenable <= 1'b0;
end

// chroma signal
always @(posedge cg_clock) begin
    cg_out[2] <= cenable;
    cg_out[1] <= burst;
    cg_out[0] <= scarrier[3];
end


endmodule 
