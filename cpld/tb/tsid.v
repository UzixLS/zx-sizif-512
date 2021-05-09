module tsid(
    input rst_n,
    input clkcpu,
    input clk32,
    input [15:0] a,
    inout [7:0] d,
    input n_rd,
    input n_wr,
    input n_iorq,
    output reg n_iorqge,
    output reg n_wait,

    input cfg,

    output reg [4:0] sid_a,
    inout [7:0] sid_d,
    output sid_clk,
    output sid_rst,
    output reg sid_cs,
    output reg sid_wr
);

assign sid_rst = rst_n;

reg [4:0] sid_clk_cnt = 16;
assign sid_clk = sid_clk_cnt[4];
always @(posedge clk32)
    sid_clk_cnt <= sid_clk_cnt + 1'b1;

wire port_cf = a[7:0] == 8'hCF;
reg iowr, iord;
always @(posedge clk32) begin
    iowr <= port_cf && n_iorq == 1'b0 && n_wr == 1'b0;
    iord <= port_cf && n_iorq == 1'b0 && n_rd == 1'b0;
end

localparam ST_IDLE = 3'd0;
localparam ST_WR0 = 3'd1;
localparam ST_WR1 = 3'd2;
localparam ST_RD0 = 3'd3;
localparam ST_RD1 = 3'd4;
localparam ST_CYCLE_END = 3'd5;
reg [2:0] st;
reg [7:0] sid_d_latch;
always @(posedge clk32 or negedge rst_n) begin
    if (!rst_n) begin
        sid_cs <= 1'b1;
        sid_wr <= 1'b1;
        sid_a <= 0;
        sid_d_latch <= 0;
        n_wait <= 1'b1;
        st <= ST_IDLE;
    end
    else case (st)
    ST_IDLE: begin
        if (iowr) begin
            sid_a <= a[12:8];
            sid_d_latch <= d;
            sid_wr <= 1'b0;
            if (sid_clk_cnt == 20) begin
                sid_cs <= 1'b0;
                st <= ST_WR1;
            end
            else begin
                st <= ST_WR0;
            end
        end
        else if (iord) begin
            sid_a <= a[12:8];
            n_wait <= 1'b0;
            if (sid_clk_cnt == 20) begin
                sid_cs <= 1'b0;
                st <= ST_RD1;
            end
            else begin
                st <= ST_RD0;
            end
        end
    end
    ST_WR0: begin
        if (sid_clk_cnt == 20) begin
            sid_cs <= 1'b0;
            st <= ST_WR1;
        end
    end
    ST_WR1: begin
        if (sid_clk_cnt == 0) begin
            sid_cs <= 1'b1;
            sid_wr <= 1'b1;
            st <= ST_CYCLE_END;
        end
    end
    ST_RD0: begin
        if (sid_clk_cnt == 20) begin
            sid_cs <= 1'b0;
            st <= ST_RD1;
        end
    end
    ST_RD1: begin
        if (sid_clk_cnt == 0) begin
            sid_cs <= 1'b1;
            sid_d_latch <= sid_d;
            n_wait <= 1'b1;
            st <= ST_CYCLE_END;
        end
    end
    ST_CYCLE_END: begin
        if (!iord && !iowr)
            st <= ST_IDLE;
    end
    endcase
end

assign sid_d = (sid_wr == 1'b0)? sid_d_latch : 8'bzzzzzzzz;

always @(negedge clkcpu)
    n_iorqge <= (port_cf)? 1'b1 : 1'bz;

assign d = (port_cf && n_iorq == 1'b0 && n_rd == 1'b0)? sid_d_latch : 8'bzzzzzzzz;


endmodule
