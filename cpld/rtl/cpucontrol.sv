import common::*;
module cpucontrol(
    input rst_n,
    input clk28,
    input clk14,
    input clk7,
    input clk35,

    cpu_bus bus,

    output int_vector_rd,
    output [7:0] int_vector_data,

    input [8:0] vc,
    input [8:0] hc,
    input [2:0] rampage128,
    input screen_loading,
    input turbo_t turbo,
    input timings_t timings,
    input pause,
    input ext_wait_cycle,

    output reg n_rstcpu,
    output reg clkcpu,
    output clkcpu_ck,
    output clkwait,
    output reg n_int,
    output n_int_next,
    output snow
);


/* CONTENTION */
reg mreq_delayed, iorq_delayed;
always @(posedge clkcpu)
    mreq_delayed <= bus.mreq;
always @(posedge clkcpu)
    iorq_delayed <= bus.iorq;
wire contention_mem_addr = bus.a[14] & (~bus.a[15] | (bus.a[15] & rampage128[0]));
wire contention_mem = iorq_delayed == 1'b0 && mreq_delayed == 1'b0 && contention_mem_addr;
wire contention_io = iorq_delayed == 1'b0 && bus.iorq;
wire contention0 = screen_loading && (hc[2] || hc[3]) && (contention_mem || contention_io);
wire contention = clkcpu && contention0 && turbo == TURBO_NONE && timings != TIMINGS_PENT;
assign snow = (timings != TIMINGS_PENT) && bus.a[14] && ~bus.a[15] && bus.rfsh;


/* CLOCK */
reg [2:0] turbo_wait;
wire turbo_wait_trig0 = bus.rd || bus.wr;
reg turbo_wait_trig1;
always @(posedge clk28) begin
    turbo_wait_trig1 <= turbo_wait_trig0;
    turbo_wait[0] <= turbo == TURBO_14 && turbo_wait_trig0 && !turbo_wait_trig1;
    turbo_wait[1] <= turbo_wait[0] && (bus.iorq || ext_wait_cycle);
    turbo_wait[2] <= turbo_wait[1];
end

reg clkcpu_prev;
assign clkcpu_ck = clkcpu && ! clkcpu_prev;
assign clkwait = pause || contention || (|turbo_wait);
always @(negedge clk28) begin
    clkcpu_prev <= clkcpu;
    clkcpu <= clkwait? clkcpu : (turbo == TURBO_14)? clk14 : (turbo == TURBO_7)? clk7 : clk35;
end


/* INT GENERATOR */
localparam INT_V_S48       = 247;
localparam INT_H_S48       = 442;
localparam INT_V_S128      = 247;
localparam INT_H_S128      = 450;
localparam INT_V_PENT      = 239;
localparam INT_H_PENT      = 316;
wire int_begin =
    (timings == TIMINGS_PENT)?
        vc == INT_V_PENT && hc == INT_H_PENT :
    (timings == TIMINGS_S128)?
        vc == INT_V_S128 && hc == INT_H_S128 :
    // 48K 
        vc == INT_V_S48 && hc == INT_H_S48 ;
reg [4:0] int_cnt;
assign n_int_next = (|int_cnt)? 1'b0 : 1'b1;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        int_cnt <= 0;
        n_int <= 1'b1;
    end
    else begin
        if (clkcpu_ck)
            n_int <= n_int_next;
        if ((int_cnt != 0 && clkcpu_ck) || (int_cnt == 0 && int_begin))
            int_cnt <= int_cnt + 1'b1;
    end
end


/* INT VECTOR */
assign int_vector_rd = bus.iorq && bus.m1;
assign int_vector_data = 8'hff;


/* RESET */
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        n_rstcpu <= 0;
    else if (vc[0])
        n_rstcpu <= 1'b1;
end


endmodule
