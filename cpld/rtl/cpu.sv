import common::*;
module cpu(
    input rst_n,
    input clk28,
    input clk14,
    input clk7,
    input clk35,
    input ck14,
    input ck7,

    cpu_bus bus,

    input [8:0] vc,
    input [8:0] hc,
    input video_contention,
    input [2:0] ram_page128,
    input machine_t machine,
    input turbo_t turbo,
    input hold,
    input ext_wait_cycle1,
    input ext_wait_cycle2,

    output reg n_rstcpu_out,
    output reg clkcpu,
    output clkcpu_ck,
    output reg n_int,
    output reg n_int_next,
    output snow
);


/* CONTENTION */
wire iorq_contended = bus.iorq && (~bus.a[0] || (bus.a == 16'hBF3B) || (bus.a == 16'hFF3B)) && (machine != MACHINE_S3);
reg mreq_delayed, iorq_delayed;
always @(posedge clkcpu)
    mreq_delayed <= bus.mreq;
always @(posedge clkcpu)
    iorq_delayed <= iorq_contended;
wire contention_page = (machine == MACHINE_S3)? ram_page128[2] : ram_page128[0];
wire contention_addr = bus.a[14] & (~bus.a[15] | (bus.a[15] & contention_page));
wire contention_mem = !iorq_contended && !mreq_delayed && contention_addr;
wire contention0 = video_contention && !iorq_delayed && (contention_mem || iorq_contended);
wire contention = clkcpu && contention0 && turbo == TURBO_NONE && (machine == MACHINE_S48 || machine == MACHINE_S128 || machine == MACHINE_S3);
assign snow = video_contention && contention_addr && bus.rfsh && bus.mreq && (machine == MACHINE_S48 || machine == MACHINE_S128);


/* CLOCK */
wire turbo_wait_cond = turbo == TURBO_14 && ((bus.mreq && !bus.rfsh) || (bus.iorq && bus.m1) || bus.ioreq_unmasked);
reg [2:0] turbo_wait_reg;
reg turbo_wait;
always @* begin
    if (ext_wait_cycle2)
        turbo_wait <= turbo_wait_cond && !turbo_wait_reg[2];
    else if (ext_wait_cycle1 || bus.iorq || bus.ioreq_unmasked)
        turbo_wait <= turbo_wait_cond && !turbo_wait_reg[1];
    else
        turbo_wait <= turbo_wait_cond && !turbo_wait_reg[0];
end
always @(posedge clk28) begin
    if (clkcpu != clk14)
        turbo_wait_reg <= {turbo_wait_reg[1:0], turbo_wait_cond};
end

reg clkcpu_prev;
assign clkcpu_ck = clkcpu && !clkcpu_prev;
always @(posedge clk28) begin
    clkcpu_prev <= clkcpu;
    if (contention || hold || turbo_wait)
        clkcpu <= clkcpu;
    else if (turbo == TURBO_14)
        clkcpu <= clk14;
    else if (turbo == TURBO_7 && ck14)
        clkcpu <= clk7;
    else if (turbo == TURBO_5 && ck14 && hc[1])
        clkcpu <= clk7;
    else if (turbo == TURBO_4 && ck14 && hc[1] && hc[2])
        clkcpu <= clk7;
    else if (ck7)
        clkcpu <= clk35;
end


/* INT GENERATOR */
localparam INT_V_S48       = 248;
localparam INT_H_S48       = 0;
localparam INT_L_S48       = 63;
localparam INT_V_S128      = 248;
localparam INT_H_S128      = 4;
localparam INT_L_S128      = 71;
localparam INT_V_PENT      = 239;
localparam INT_H_PENT      = 322;
localparam INT_L_PENT      = 63;
wire int_begin =
    (machine == MACHINE_S48)?
        vc == INT_V_S48 && hc == INT_H_S48 :
    (machine == MACHINE_S128 || machine == MACHINE_S3)?
        vc == INT_V_S128 && hc == INT_H_S128 :
    // Pentagon
        vc == INT_V_PENT && hc == INT_H_PENT ;
wire [6:0] int_len =
    (machine == MACHINE_S48)?
        INT_L_S48 :
    (machine == MACHINE_S128 || machine == MACHINE_S3)?
        INT_L_S128 :
    // Pentagon
        INT_L_PENT ;

reg [6:0] int_cnt;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        int_cnt <= 0;
        n_int_next <= 1'b1;
    end
    else if ((int_cnt != 0 && ck7) || (int_cnt == 0 && int_begin)) begin
        int_cnt <= int_cnt + 1'b1;
        n_int_next <= (int_cnt < int_len)? 1'b0 : 1'b1;
    end
end

always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        n_int <= 1'b1;
    else if (clkcpu_ck)
        n_int <= n_int_next;
end


/* RESET */
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        n_rstcpu_out <= 0;
`ifdef TESTBENCH
    else if (hc[4])
        n_rstcpu_out <= 1'b1;
`endif
    else if (vc[8])
        n_rstcpu_out <= 1'b1;
end


/* T-STATES COUNTER (for debug) */
`ifdef TESTBENCH
integer tstate;
always @(posedge clkcpu) begin
    if (!n_int_next && n_int)
        tstate <= -1;
    else
        tstate <= tstate + 1;
end
`endif


endmodule
