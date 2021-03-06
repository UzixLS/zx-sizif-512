import common::*;
module magic(
    input rst_n,
    input clk28,

    cpu_bus bus,
    input n_int,
    input n_int_next,
    output reg n_nmi,

    input magic_button,

    output reg magic_mode,
    output reg magic_map,

    output reg magic_reboot,
    output reg magic_beeper,
    output timings_t timings,
    output turbo_t turbo,
    output rammode_t ram_mode,
    output panning_t panning,
    output reg joy_sinclair,
    output reg rom_plus3,
    output reg rom_alt48,
    output reg divmmc_en,
    output reg ulaplus_en,
    output reg covox_en,
    output reg sd_en
);

reg magic_unmap_next;
reg magic_map_next;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        n_nmi <= 1'b1;
        magic_mode <= 1'b1;
        magic_map <= 1'b1;
        magic_map_next <= 0;
        magic_unmap_next <= 0;
    end
    else begin
        if (magic_button == 1'b1 && n_int == 1'b1 && n_int_next == 1'b0) begin
            if (!magic_mode)
                n_nmi <= 1'b0;
            magic_mode <= 1'b1;
        end

        if (magic_map && bus.mreq && bus.rd && bus.a == 16'hf000 && !magic_map_next) begin
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
        else if (magic_mode && bus.m1 && bus.mreq && (bus.a == 16'h0066 || magic_map_next)) begin
            n_nmi <= 1'b1;
            magic_map <= 1'b1;
            magic_map_next <= 1'b0;
        end
    end
end


/* MAGIC CONFIG */
wire config_cs = magic_map && bus.ioreq && bus.a[7:0] == 8'hFF;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        magic_reboot <= 0;
        magic_beeper <= 0;
        timings <= TIMINGS_PENT;
        turbo <= TURBO_NONE;
        ram_mode <= RAM_512;
        panning <= PANNING_ABC;
        rom_plus3 <= 1'b1;
        rom_alt48 <= 0;
        joy_sinclair <= 0;
        divmmc_en <= 1'b1;
        ulaplus_en <= 1'b1;
        covox_en <= 1'b1;
        sd_en <= 1'b1;
    end
    else if (config_cs && bus.wr) case (bus.a[15:8])
        8'h00: magic_reboot <= bus.d[0];
        8'h01: magic_beeper <= bus.d[0];
        8'h02: timings <= timings_t'(bus.d[1:0]);
        8'h03: turbo <= turbo_t'(bus.d[1:0]);
        8'h04: panning <= panning_t'(bus.d[1:0]);
        8'h05: rom_plus3 <= bus.d[0];
        8'h06: rom_alt48 <= bus.d[0];
        8'h07: joy_sinclair <= bus.d[0];
        8'h08: ram_mode <= rammode_t'(bus.d[1:0]);
        8'h09: divmmc_en <= bus.d[0];
        8'h0a: ulaplus_en <= bus.d[0];
        8'h0b: {sd_en, covox_en} <= bus.d[1:0];
    endcase
end


endmodule
