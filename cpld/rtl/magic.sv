import common::*;
module magic(
    input rst_n,
    input clk28,
    input ck35,

    cpu_bus bus,
    output [7:0] d_out,
    output d_out_active,

    input n_int,
    input n_int_next,
    output reg n_nmi,

    input magic_button,
    input pause_button,
    input fastforward_button,
    input div_paged,
    input basic48_paged,

    output reg magic_mode,
    output reg magic_map,

    output reg magic_reboot,
    output reg magic_beeper,
    output reg rom_wren,
    output machine_t machine,
    output turbo_t turbo,
    output panning_t panning,
    output reg rom_custom_en,
    output reg [1:0] rom_custom,
    output reg rom_alt48_en,
    output reg rom_alt48,
    output reg joy_sinclair,
    output reg divmmc_en,
    output reg zc_en,
    output reg ulaplus_en,
    output reg ay_en,
    output reg covox_en,
    output reg soundrive_en,
    output reg sd_indication_en,
    output reg bright_boost,
    output reg zxkit1,
    output reg joy_a_up,
    output reg fastforward
);

localparam magic_on_start = 1'b1;

reg magic_unmap_next;
reg magic_map_next;
reg [1:0] opcode_check_next;
reg opcode_match;
reg opcode_is_reading;

always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        n_nmi <= 1'b1;
        magic_mode <= magic_on_start;
        magic_map <= magic_on_start;
        magic_map_next <= 0;
        magic_unmap_next <= 0;
        opcode_check_next <= {2{magic_on_start}};
        opcode_match <= 0;
        opcode_is_reading <= 0;
    end
    else begin
        if ((magic_button || pause_button || fastforward_button) && n_int == 1'b1 && n_int_next == 1'b0) begin
            if (!magic_mode)
                n_nmi <= 1'b0;
            magic_mode <= 1'b1;
        end

        if (|opcode_check_next) begin
            // Check two first fetched opcodes from magic rom is 0xEB
            // Otherwise assume there is no magic rom
            if (bus.mreq && bus.m1 && bus.rd) begin
                opcode_is_reading <= 1'b1;
                opcode_match <= bus.d == 8'hEB;
            end
            else if (opcode_is_reading) begin
                opcode_is_reading <= 1'b0;
                opcode_check_next <= opcode_match? {1'b0, opcode_check_next[1]} : 2'b00;
                magic_mode <= magic_mode && opcode_match;
                magic_map <= magic_map && opcode_match;
            end
        end
        else if (magic_map && bus.mreq && bus.rd && bus.a == 16'hf000 && !magic_map_next) begin
            magic_unmap_next <= 1'b1;
            magic_mode <= 1'b0;
        end
        else if (magic_map && bus.mreq && bus.rd && bus.a == 16'hf008) begin
            magic_unmap_next <= 1'b1;
            magic_map_next <= 1'b1;
        end
        else if (magic_unmap_next && !bus.mreq) begin
            magic_map <= 1'b0;
            magic_unmap_next <= 1'b0;
        end
        else if (magic_mode && bus.m1 && bus.mreq_rise && (bus.a == 16'h0066 || magic_map_next)) begin
            n_nmi <= 1'b1;
            magic_map <= 1'b1;
            magic_map_next <= 1'b0;
            opcode_check_next[1] <= bus.a == 16'h0066;
        end
    end
end


/* MAGIC CONFIG */
initial machine = MACHINE_PENT;
turbo_t turbo0 = TURBO_NONE;
initial panning = PANNING_ABC;
initial rom_custom_en = 0;
initial rom_custom = 0;
initial rom_alt48_en = 0;
initial rom_alt48 = 0;
initial joy_sinclair = 1'b1;
initial divmmc_en = 0;
initial zc_en = 1'b1;
initial ulaplus_en = 1'b1;
initial ay_en = 1'b1;
initial covox_en = 1'b1;
initial soundrive_en = 1'b1;
initial sd_indication_en = 1'b1;
`ifdef REV_C
    initial bright_boost = 1'b1;
`else
    initial bright_boost = 1'b0;
`endif
reg autoturbo_en = 1'b0;
initial zxkit1 = 1'b0;
initial joy_a_up = 1'b0;

wire config_cs = magic_map && bus.ioreq && bus.a[7:0] == 8'hFF;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        magic_reboot <= 0;
        magic_beeper <= 0;
        rom_wren <= 0;
        fastforward <= 0;
    end
    else if (config_cs && bus.wr) case (bus.a[15:8])
        8'h01: {rom_wren, magic_reboot, magic_beeper} <= bus.d[2:0];
        8'h02: machine <= machine_t'(bus.d[2:0]);
        8'h03: turbo0 <= turbo_t'(bus.d[2:0]);
        8'h04: panning <= panning_t'(bus.d[1:0]);
        8'h05: {rom_custom_en, rom_custom} <= {bus.d[7], bus.d[1:0]};
        8'h06: {rom_alt48_en, rom_alt48} <= {bus.d[0] | bus.d[1], bus.d[1]};
        8'h07: joy_sinclair <= bus.d[0];
        8'h08: ay_en <= bus.d[0];
        8'h09: {zc_en, divmmc_en} <= bus.d[1:0];
        8'h0A: ulaplus_en <= bus.d[0];
        8'h0B: {soundrive_en, covox_en} <= bus.d[1:0];
        8'h0C: sd_indication_en <= bus.d[0];
        8'h0D: bright_boost <= bus.d[0];
        8'h0E: autoturbo_en <= bus.d[0];
        8'h0F: zxkit1 <= bus.d[0];
        8'h10: joy_a_up <= bus.d[0];
        8'h11: fastforward <= bus.d[0];
    endcase
end

reg config_rd;
wire [7:0] config_data = {4'b0000, div_paged, fastforward_button, pause_button, magic_button};
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        config_rd <= 0;
    else
        config_rd <= config_cs && bus.rd && bus.a[15:8] == 8'h00;
end


/* AUTOMATIC TURBO */
reg [11:0] portfe_noturbo; // 1170uS
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        portfe_noturbo <= 0;
    else if (bus.ioreq && !bus.a[0])
        portfe_noturbo <= 1'b1;
    else if (|portfe_noturbo && ck35)
        portfe_noturbo <= portfe_noturbo + 1'b1;
end
reg basic48_ramclear_turbo;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        basic48_ramclear_turbo <= 0;
    else if (basic48_paged && bus.m1 && bus.a[15:6] == 10'b0001000111)
        basic48_ramclear_turbo <= 1'b1;
    else if (!basic48_paged || (bus.m1 && bus.a[15:6] != 10'b0001000111))
        basic48_ramclear_turbo <= 0;
end
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        turbo <= TURBO_NONE;
    else if (fastforward)
        turbo <= TURBO_14;
    else if (autoturbo_en && div_paged && !magic_map)
        turbo <= TURBO_14;
    else if (autoturbo_en && |portfe_noturbo)
        turbo <= TURBO_NONE;
    else if (autoturbo_en && basic48_ramclear_turbo)
        turbo <= TURBO_14;
    else
        turbo <= turbo0;
end


/* BUS CONTROLLER */
assign d_out_active = config_rd;
assign d_out = config_data;


endmodule
