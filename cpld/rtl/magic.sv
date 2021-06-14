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
    output magic_active_next,

    output reg extlock,
    output reg magic_beeper,
    output timings_t timings,
    output turbo_t turbo,
    output reg joy_sinclair,
    output reg rom_plus3,
    output reg rom_alt48,
    output reg ay_abc,
    output reg ay_mono
);

assign magic_active_next = magic_button;
reg magic_unmap_next;
reg magic_map_next;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        n_nmi <= 1'b1;
        magic_mode <= 0;
        magic_map <= 0;
        magic_unmap_next <= 0;
        magic_map_next <= 0;
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
        magic_beeper <= 0;
        extlock <= 0;
        timings <= TIMINGS_PENT;
        turbo <= TURBO_NONE;
        ay_abc <= 1'b1;
        ay_mono <= 0;
        rom_plus3 <= 0;
        rom_alt48 <= 0;
        joy_sinclair <= 0;
    end
    else if (config_cs && bus.wr) begin
        if (bus.a[15:12] == 4'h0)
            magic_beeper <= bus.d[0];
        if (bus.a[15:12] == 4'h1)
            extlock <= bus.d[0];
        if (bus.a[15:12] == 4'h2)
            timings <= timings_t'(bus.d[1:0]);
        if (bus.a[15:12] == 4'h3)
            turbo <= turbo_t'(bus.d[1:0]);
        if (bus.a[15:12] == 4'h4)
            {ay_mono, ay_abc} <= bus.d[1:0];
        if (bus.a[15:12] == 4'h5)
            rom_plus3 <= bus.d[0];
        if (bus.a[15:12] == 4'h6)
            rom_alt48 <= bus.d[0];
        if (bus.a[15:12] == 4'h7)
            joy_sinclair <= bus.d[0];
    end
end


endmodule
