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
// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
// CREATED		"Sat Dec 10 08:55:35 2016"

module decode_state(
	ctl_state_iy_set,
	ctl_state_ixiy_clr,
	ctl_state_ixiy_we,
	ctl_state_halt_set,
	ctl_state_tbl_ed_set,
	ctl_state_tbl_cb_set,
	ctl_state_alu,
	clk,
	address_is_1,
	ctl_repeat_we,
	in_intr,
	in_nmi,
	nreset,
	ctl_state_tbl_we,
	nhold_clk_wait,
	in_halt,
	table_cb,
	table_ed,
	table_xx,
	use_ix,
	use_ixiy,
	in_alu,
	repeat_en
);


input wire	ctl_state_iy_set;
input wire	ctl_state_ixiy_clr;
input wire	ctl_state_ixiy_we;
input wire	ctl_state_halt_set;
input wire	ctl_state_tbl_ed_set;
input wire	ctl_state_tbl_cb_set;
input wire	ctl_state_alu;
input wire	clk;
input wire	address_is_1;
input wire	ctl_repeat_we;
input wire	in_intr;
input wire	in_nmi;
input wire	nreset;
input wire	ctl_state_tbl_we;
input wire	nhold_clk_wait;
output reg	in_halt;
output wire	table_cb;
output wire	table_ed;
output wire	table_xx;
output wire	use_ix;
output wire	use_ixiy;
output wire	in_alu;
output wire	repeat_en;

reg	DFFE_instNonRep;
reg	DFFE_instIY1;
reg	DFFE_inst4;
reg	DFFE_instED;
reg	DFFE_instCB;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_3;

assign	in_alu = ctl_state_alu;
assign	table_cb = DFFE_instCB;
assign	table_ed = DFFE_instED;
assign	use_ix = DFFE_inst4;



assign	repeat_en =  ~DFFE_instNonRep;

assign	use_ixiy = DFFE_instIY1 | DFFE_inst4;

assign	table_xx = ~(DFFE_instED | DFFE_instCB);


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_inst4 <= 0;
	end
else
if (ctl_state_ixiy_we)
	begin
	DFFE_inst4 <= SYNTHESIZED_WIRE_0;
	end
end

assign	SYNTHESIZED_WIRE_0 = ~(ctl_state_iy_set | ctl_state_ixiy_clr);

assign	SYNTHESIZED_WIRE_4 = ctl_state_tbl_we & nhold_clk_wait;

assign	SYNTHESIZED_WIRE_3 = in_nmi | in_intr;


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_instCB <= 0;
	end
else
if (SYNTHESIZED_WIRE_4)
	begin
	DFFE_instCB <= ctl_state_tbl_cb_set;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_instED <= 0;
	end
else
if (SYNTHESIZED_WIRE_4)
	begin
	DFFE_instED <= ctl_state_tbl_ed_set;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	in_halt <= 0;
	end
else
	begin
	in_halt <= ~in_halt & ctl_state_halt_set | in_halt & ~SYNTHESIZED_WIRE_3;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_instIY1 <= 0;
	end
else
if (ctl_state_ixiy_we)
	begin
	DFFE_instIY1 <= ctl_state_iy_set;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_instNonRep <= 0;
	end
else
if (ctl_repeat_we)
	begin
	DFFE_instNonRep <= address_is_1;
	end
end


endmodule
