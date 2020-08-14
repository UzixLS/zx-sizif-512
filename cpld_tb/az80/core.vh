//----------------------------------------------------------------------------
//  A-Z80 CPU Copyright (C) 2014,2016  Goran Devic, www.baltazarstudios.com
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//----------------------------------------------------------------------------
//============================================================================
// A-Z80 core, instantiates and connects all internal blocks.
//
// This file is included by the "z80_top_ifc_n" and "z80_top_direct" providing
// interface binding and direct (no interface) binding.
//============================================================================

// Include a list of top-level signal wires
`include "globals.vh"

// Specific to simulation, some modules in the schematics need to be pre-initialized
// to avoid starting simulations with unknown values in selected flip flops.
reg fpga_reset = 1;
always @(posedge clk)
begin
    fpga_reset <= 0;
end

// Define internal data bus partitions segmented by data bus switches
wire [7:0] db0;         // Segment connecting data pins and IR
wire [7:0] db1;         // Segment leading to the ALU
wire [7:0] db2;         // Segment with msb part of the register address-side interface

wire [7:0] db_hi_as;    // Register file data bus segment high byte
wire [7:0] db_lo_as;    // Register file data bus segment low byte

wire [6:0] prefix;      // Instruction decode PLA prefix bitfield
assign prefix = { ~use_ixiy, use_ixiy, ~in_halt, in_alu, table_xx, table_cb, table_ed };

wire nM1_int;           // External pins timing control
assign nM1_int = !(setM1 | (fFetch & T1));

`include "coremodules.vh"

// Data path within the CPU in various forms, ending with data pins
data_switch sw2_( .sw_up_en(bus_sw_2u), .sw_down_en(bus_sw_2d), .db_up(db1[7:0]), .db_down(db2[7:0]) );

// Data switch SW1 with the data mask
data_switch_mask sw1_( .sw_mask543_en(bus_sw_mask543_en), .sw_up_en(bus_sw_1u), .sw_down_en(bus_sw_1d), .db_up(db0[7:0]), .db_down(db1[7:0]) );

/* This SystemVerilog-style code is kept for future reference
// Control block
clk_delay   clk_delay_( .* );
decode_state decode_state_( .* );
execute     execute_( .* );
interrupts  interrupts_( .*, .db(db0[4:3]) );
ir          ir_( .*, .db(db0[7:0]) );
pin_control pin_control_( .* );
pla_decode  pla_decode_( .* );
resets      resets_( .* );
sequencer   sequencer_( .* );

// ALU and ALU control, including the flags
alu_control alu_control_( .*, .db(db1[7:0]), .op543({pla[104],pla[103],pla[102]}) );
alu_select  alu_select_( .* );
alu_flags   alu_flags_( .*, .db(db1[7:0]) );
alu         alu_( .*, .db(db2[7:0]), .bsel(db0[5:3]) );

// Register file and register control
reg_file    reg_file_( .*, .db_hi_ds(db2[7:0]), .db_lo_ds(db1[7:0]), .db_hi_as(db_hi_as[7:0]), .db_lo_as(db_lo_as[7:0]) );
reg_control reg_control_( .* );

// Address latch and the incrementer
address_latch address_latch_( .*, .abus({db_hi_as[7:0], db_lo_as[7:0]}) );

// Misc bus
bus_control bus_control_( .*, .db(db0[7:0]) );
bus_switch bus_switch_( .* );

// Timing control of the external pins
memory_ifc memory_ifc_( .* );
*/
