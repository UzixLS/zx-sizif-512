module shiftreg165#(
    parameter BITS = 8,
    parameter DEFAULT_STATE = 1'b0
    ) (
    input rst_n,
    input clk,
    input clk_en,
    input sync,
    input q,
    output reg cp,
    output reg pl,
    output reg [BITS-1:0] d
);

reg [$clog2(BITS)-1:0] cnt;
reg [BITS-2:0] d_shift;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        d <= {BITS{DEFAULT_STATE}};
        d_shift <= {BITS-1{DEFAULT_STATE}};
        cp <= 0;
        pl <= 0;
        cnt <= 0;
    end
    else if (clk_en) begin
        if (cp == 0) begin
            pl <= (cnt == 0)? 1'b0 : 1'b1;
        end
        else begin
            pl <= 1'b1;
            d_shift <= {d_shift[BITS-3:0], q};
            if (cnt == BITS-1)
                d <= {d_shift[BITS-2:0], q};
            cnt <= (sync || cnt == BITS-1)? {$clog2(BITS)-1{1'b0}} : cnt + 1'b1;
        end
        cp <= !cp;
    end
end

endmodule
