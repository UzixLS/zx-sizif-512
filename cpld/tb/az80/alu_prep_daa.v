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
// CREATED		"Mon Oct 13 12:01:36 2014"

module alu_prep_daa(
	high,
	low,
	low_gt_9,
	high_eq_9,
	high_gt_9
);


input wire	[3:0] high;
input wire	[3:0] low;
output wire	low_gt_9;
output wire	high_eq_9;
output wire	high_gt_9;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;




assign	SYNTHESIZED_WIRE_4 =  ~high[2];

assign	SYNTHESIZED_WIRE_1 = low[3] & low[2];

assign	SYNTHESIZED_WIRE_3 = high[3] & high[2];

assign	SYNTHESIZED_WIRE_0 = low[3] & low[1];

assign	low_gt_9 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_2 = high[3] & high[1];

assign	high_gt_9 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_5 =  ~high[1];

assign	high_eq_9 = high[3] & high[0] & SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5;


endmodule
