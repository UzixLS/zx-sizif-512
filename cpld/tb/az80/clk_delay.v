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
// CREATED		"Sat Dec 10 08:59:31 2016"

module clk_delay(
	clk,
	in_intr,
	nreset,
	T1,
	latch_wait,
	mwait,
	M1,
	busrq,
	setM1,
	hold_clk_iorq,
	hold_clk_wait,
	iorq_Tw,
	busack,
	pin_control_oe,
	hold_clk_busrq,
	nhold_clk_wait
);


input wire	clk;
input wire	in_intr;
input wire	nreset;
input wire	T1;
input wire	latch_wait;
input wire	mwait;
input wire	M1;
input wire	busrq;
input wire	setM1;
output wire	hold_clk_iorq;
output wire	hold_clk_wait;
output wire	iorq_Tw;
output wire	busack;
output wire	pin_control_oe;
output wire	hold_clk_busrq;
output wire	nhold_clk_wait;

reg	hold_clk_busrq_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_1;
reg	DFF_inst5;
reg	SYNTHESIZED_WIRE_7;
reg	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
reg	SYNTHESIZED_WIRE_9;

assign	hold_clk_wait = SYNTHESIZED_WIRE_9;
assign	iorq_Tw = DFF_inst5;




always@(posedge SYNTHESIZED_WIRE_6 or negedge nreset)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_9 <= 0;
	end
else
if (SYNTHESIZED_WIRE_1)
	begin
	SYNTHESIZED_WIRE_9 <= mwait;
	end
end


always@(posedge SYNTHESIZED_WIRE_6 or negedge nreset)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_8 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_8 <= busrq;
	end
end

assign	hold_clk_iorq = DFF_inst5 | SYNTHESIZED_WIRE_7;

assign	busack = SYNTHESIZED_WIRE_8 & hold_clk_busrq_ALTERA_SYNTHESIZED;

assign	pin_control_oe = SYNTHESIZED_WIRE_3 & nreset;

assign	SYNTHESIZED_WIRE_5 = hold_clk_busrq_ALTERA_SYNTHESIZED | setM1;

assign	SYNTHESIZED_WIRE_3 =  ~hold_clk_busrq_ALTERA_SYNTHESIZED;


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_7 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_4;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	hold_clk_busrq_ALTERA_SYNTHESIZED <= 0;
	end
else
if (SYNTHESIZED_WIRE_5)
	begin
	hold_clk_busrq_ALTERA_SYNTHESIZED <= SYNTHESIZED_WIRE_8;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFF_inst5 <= 0;
	end
else
	begin
	DFF_inst5 <= SYNTHESIZED_WIRE_7;
	end
end

assign	SYNTHESIZED_WIRE_4 = in_intr & M1 & T1;

assign	SYNTHESIZED_WIRE_1 = latch_wait | SYNTHESIZED_WIRE_9;

assign	nhold_clk_wait =  ~SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_6 =  ~clk;

assign	hold_clk_busrq = hold_clk_busrq_ALTERA_SYNTHESIZED;

endmodule
