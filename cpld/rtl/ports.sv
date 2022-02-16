import common::*;
module ports(
    input rst_n,
    input clk28,
    input en_kempston,
    input en_sinclair,

    cpu_bus bus,
    output [7:0] d_out,
    output d_out_active,

    input machine_t machine,
    input port_ff_active,
    input [7:0] port_ff_data,
    input [4:0] kd,
    input [7:0] kempston_data,
    input magic_map,
    input tape_in,

    output reg tape_out,
    output reg beeper,
    output reg [2:0] border,
    output reg screenpage,
    output reg rompage128,
    output reg [2:0] rampage128,
    output reg [2:0] rampage_ext,
    output reg [2:0] port_1ffd,
    output reg [4:0] port_dffd,

    output reg plus3_drd,
    output reg plus3_dwr,
    output reg plus3_mtr
);


/* PORT #FF */
reg port_ff_rd;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        port_ff_rd <= 0;
    else
        port_ff_rd <= bus.rd && bus.ioreq && !magic_map && port_ff_active &&
            (machine != MACHINE_S3) && (machine != MACHINE_PENT || bus.a[7:0] == 8'hFF);
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
wire [7:0] port_fe_data = {1'b1, tape_in, 1'b1, kd0};
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        beeper <= 0;
        tape_out <= 0;
        border <= 0;
    end
    else if (port_fe_cs && bus.wr) begin
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
reg lock_7ffd;
wire port_7ffd_cs = bus.ioreq && bus.a[1] == 0 && bus.a[15] == 0 &&
                    (bus.a[14] == 1'b1 || (!magic_map && machine != MACHINE_S3)) &&
                    (machine != MACHINE_S48 || magic_map) &&
                    (lock_7ffd == 0 || port_dffd[4] == 1'b1);
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        rampage128 <= 0;
        screenpage <= 0;
        rompage128 <= 0;
        lock_7ffd <= 0;
    end
    else if (port_7ffd_cs && bus.wr) begin
        rampage128 <= bus.d[2:0];
        screenpage <= bus.d[3];
        rompage128 <= bus.d[4];
        lock_7ffd <= bus.d[5];
    end
end


/* PORT #DFFD */
wire port_dffd_cs = bus.ioreq && bus.a == 16'hDFFD && (machine == MACHINE_PENT || magic_map);
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        rampage_ext <= 0;
        port_dffd <= 0;
    end
    else if (port_dffd_cs && bus.wr) begin
        rampage_ext <= bus.d[2:0];
        port_dffd <= bus.d[4:0];
    end
end


/* PORT #1FFD */
wire port_1ffd_cs = bus.ioreq && bus.a[15:12] == 4'b0001 && !bus.a[1] &&
                    (machine == MACHINE_S3 || magic_map);
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
wire port_2ffd_3ffd_cs = bus.ioreq && bus.a[15:13] == 3'b001 && !bus.a[1] &&
                         (machine == MACHINE_S3);
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
        kempston_rd <= en_kempston && bus.ioreq && bus.rd && bus.a[5:0] == 6'h1F;
end


/* BUS CONTROLLER */
assign d_out_active = port_fe_rd | port_ff_rd | kempston_rd;

assign d_out =
    kempston_rd? kempston_data :
    port_fe_rd? port_fe_data :
    port_ff_data ;


endmodule
