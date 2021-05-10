import common::*;
module ports(
    input rst_n,
    input clk28,
    input en_128k,
    input en_plus3,
    input en_profi,
    input en_kempston,
    input en_sinclair,

    cpu_bus bus,
    output [7:0] d_out,
    output d_out_active,

    input timings_t timings,
    input clkcpu_ck,
    input screen_loading,
    input [7:0] attr_next,
    input [4:0] kd,
    input [7:0] kempston_data,
    input magic_active_next,
    input tape_in,

    output reg tape_out,
    output reg beeper,
    output reg [2:0] border,
    output reg screenpage,
    output reg rompage128,
    output reg [2:0] rampage128,
    output reg [3:0] rampage_ext,
    output reg [2:0] port_1ffd,
    output reg port_dffd_d3,
    output reg port_dffd_d4,

    output reg plus3_drd,
    output reg plus3_dwr,
    output reg plus3_mtr
);


/* PORT #FF */
wire [7:0] port_ff_data = attr_next;
reg port_ff_rd;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        port_ff_rd <= 0;
    else
        port_ff_rd <= bus.rd && bus.ioreq && (timings != TIMINGS_PENT || bus.a[7:0] == 8'hFF) && screen_loading;
end


/* PORT #FE */
wire port_fe_cs = bus.ioreq && bus.a[0] == 0;
reg port_fe_rd;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        port_fe_rd <= 0;
    else
        port_fe_rd <= port_fe_cs && bus.rd;
end

reg [4:0] kd0;
wire [7:0] port_fe_data = {~magic_active_next, tape_in, 1'b1, kd0};
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        beeper <= 0;
        tape_out <= 0;
        border <= 0;
    end
    else if (port_fe_cs && bus.wr && clkcpu_ck) begin // clkcpu_ck to synchronize border
        beeper <= bus.d[4];
        tape_out <= bus.d[3];
        border <= bus.d[2:0];
    end
end

always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        kd0 <= 5'b11111;
    end
    else if (en_sinclair) begin
        kd0 <= kd
            & (bus.a[12] == 0? {~kempston_data[1], ~kempston_data[0], ~kempston_data[2], ~kempston_data[3], ~kempston_data[4]} : 5'b11111) // 6-0 keys
            & (bus.a[15] == 0? {1'b1, ~kempston_data[6], ~kempston_data[5], 2'b11} : 5'b11111 ) ; // b-space keys
    end
    else begin
        kd0 <= kd;
    end
end


/* PORT #7FFD */
wire port_7ffd_cs = en_128k && bus.ioreq && bus.a[1] == 0 && bus.a[15] == 0 && (bus.a[14] == 1'b1 || !en_plus3);
reg lock_7ffd;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        rampage128 <= 0;
        screenpage <= 0;
        rompage128 <= 0;
        lock_7ffd <= 0;
    end
    else if (port_7ffd_cs && bus.wr && (lock_7ffd == 0 || port_dffd_d4 == 1'b1)) begin
        rampage128 <= bus.d[2:0];
        screenpage <= bus.d[3];
        rompage128 <= bus.d[4];
        lock_7ffd <= bus.d[5];
    end
end


/* PORT #DFFD */
wire port_dffd_cs = en_profi && bus.ioreq && bus.a == 16'hDFFD;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        rampage_ext <= 0;
        port_dffd_d3 <= 0;
        port_dffd_d4 <= 0;
    end
    else if (port_dffd_cs && bus.wr) begin
        rampage_ext <= bus.d[2:0];
        port_dffd_d3 <= bus.d[3];
        port_dffd_d4 <= bus.d[4];
    end
end


/* PORT #1FFD */
wire port_1ffd_cs = en_plus3 && bus.ioreq && bus.a == 16'h1FFD;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        port_1ffd <= 0;
        plus3_mtr <= 1'b1;
    end
    else if (port_1ffd_cs && bus.wr) begin
        port_1ffd <= bus.d[2:0];
        plus3_mtr <= bus.d[3]? 1'b0 : 1'b1;
    end
end


/* PORTS #2FFD & #3FFD (+3DOS) */
wire port_2ffd_3ffd_cs = en_plus3 && bus.ioreq && (bus.a == 16'h2FFD || bus.a == 16'h3FFD);
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        plus3_dwr <= 1'b1;
        plus3_drd <= 1'b1;
    end
    else begin
        plus3_drd <= (bus.rd && port_2ffd_3ffd_cs)? 1'b0 : 1'b1;
        plus3_dwr <= (bus.wr && port_2ffd_3ffd_cs)? 1'b0 : 1'b1;
    end
end


/* KEMPSTON */
reg kempston_rd;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        kempston_rd <= 0;
    else
        kempston_rd <= en_kempston && bus.ioreq && bus.rd && bus.a[7:5] == 3'b000;
end


/* BUS CONTROLLER */
assign d_out_active = port_fe_rd | port_ff_rd | kempston_rd;

assign d_out = 
    kempston_rd? kempston_data :
    port_fe_rd? port_fe_data :
    port_ff_data ;


endmodule
