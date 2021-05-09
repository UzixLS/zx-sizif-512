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
// CREATED		"Sat Dec 10 08:57:54 2016"

module resets(
	reset_in,
	clk,
	M1,
	T2,
	fpga_reset,
	nhold_clk_wait,
	clrpc,
	nreset
);


input wire	reset_in;
input wire	clk;
input wire	M1;
input wire	T2;
input wire	fpga_reset;
input wire	nhold_clk_wait;
output wire	clrpc;
output wire	nreset;

reg	clrpc_int;
wire	nclk;
reg	x1;
wire	x2;
wire	x3;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_9;
reg	DFFE_intr_ff3;
reg	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_3;
reg	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_6;

assign	nreset = SYNTHESIZED_WIRE_6;




always@(posedge nclk or negedge SYNTHESIZED_WIRE_8)
begin
if (!SYNTHESIZED_WIRE_8)
	begin
	x1 <= 1;
	end
else
	begin
	x1 <= ~x1 & reset_in | x1 & ~SYNTHESIZED_WIRE_1;
	end
end

assign	clrpc = clrpc_int | SYNTHESIZED_WIRE_9 | DFFE_intr_ff3 | SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_1 =  ~reset_in;

assign	x2 = x1 & SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_11 = M1 & T2;

assign	x3 = x1 & SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_6 =  ~SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_3 =  ~SYNTHESIZED_WIRE_11;

assign	nclk =  ~clk;

assign	SYNTHESIZED_WIRE_8 =  ~fpga_reset;


always@(posedge nclk)
begin
if (nhold_clk_wait)
	begin
	DFFE_intr_ff3 <= SYNTHESIZED_WIRE_9;
	end
end


always@(posedge nclk)
begin
if (nhold_clk_wait)
	begin
	SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_12;
	end
end


always@(posedge nclk)
begin
if (nhold_clk_wait)
	begin
	SYNTHESIZED_WIRE_9 <= SYNTHESIZED_WIRE_10;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_8)
begin
if (!SYNTHESIZED_WIRE_8)
	begin
	SYNTHESIZED_WIRE_12 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_12 <= x3;
	end
end


always@(posedge nclk or negedge SYNTHESIZED_WIRE_6)
begin
if (!SYNTHESIZED_WIRE_6)
	begin
	clrpc_int <= 0;
	end
else
	begin
	clrpc_int <= ~clrpc_int & x2 | clrpc_int & ~SYNTHESIZED_WIRE_11;
	end
end


endmodule
