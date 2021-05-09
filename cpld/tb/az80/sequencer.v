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
// CREATED		"Sat Feb 13 17:56:57 2016"

module sequencer(
	clk,
	nextM,
	setM1,
	nreset,
	hold_clk_iorq,
	hold_clk_wait,
	hold_clk_busrq,
	M1,
	M2,
	M3,
	M4,
	M5,
	T1,
	T2,
	T3,
	T4,
	T5,
	T6,
	timings_en
);


input wire	clk;
input wire	nextM;
input wire	setM1;
input wire	nreset;
input wire	hold_clk_iorq;
input wire	hold_clk_wait;
input wire	hold_clk_busrq;
output wire	M1;
output wire	M2;
output wire	M3;
output wire	M4;
output reg	M5;
output wire	T1;
output wire	T2;
output wire	T3;
output wire	T4;
output wire	T5;
output reg	T6;
output wire	timings_en;

wire	ena_M;
wire	ena_T;
reg	DFFE_M4_ff;
wire	SYNTHESIZED_WIRE_18;
reg	DFFE_T1_ff;
wire	SYNTHESIZED_WIRE_19;
reg	DFFE_T2_ff;
reg	DFFE_T3_ff;
reg	DFFE_T4_ff;
reg	DFFE_T5_ff;
reg	DFFE_M1_ff;
reg	DFFE_M2_ff;
reg	DFFE_M3_ff;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;

assign	M1 = DFFE_M1_ff;
assign	M2 = DFFE_M2_ff;
assign	M3 = DFFE_M3_ff;
assign	M4 = DFFE_M4_ff;
assign	T1 = DFFE_T1_ff;
assign	T2 = DFFE_T2_ff;
assign	T3 = DFFE_T3_ff;
assign	T4 = DFFE_T4_ff;
assign	T5 = DFFE_T5_ff;



assign	ena_M = nextM | setM1;

assign	SYNTHESIZED_WIRE_12 = DFFE_M4_ff & SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_13 = DFFE_T1_ff & SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_14 = DFFE_T2_ff & SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_15 = DFFE_T3_ff & SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_16 = DFFE_T4_ff & SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_17 = DFFE_T5_ff & SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_9 = DFFE_M1_ff & SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_10 = DFFE_M2_ff & SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_11 = DFFE_M3_ff & SYNTHESIZED_WIRE_18;

assign	ena_T = ~(hold_clk_iorq | hold_clk_wait | hold_clk_busrq);


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_M1_ff <= 1;
	end
else
if (ena_M)
	begin
	DFFE_M1_ff <= setM1;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_M2_ff <= 0;
	end
else
if (ena_M)
	begin
	DFFE_M2_ff <= SYNTHESIZED_WIRE_9;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_M3_ff <= 0;
	end
else
if (ena_M)
	begin
	DFFE_M3_ff <= SYNTHESIZED_WIRE_10;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_M4_ff <= 0;
	end
else
if (ena_M)
	begin
	DFFE_M4_ff <= SYNTHESIZED_WIRE_11;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	M5 <= 0;
	end
else
if (ena_M)
	begin
	M5 <= SYNTHESIZED_WIRE_12;
	end
end

assign	SYNTHESIZED_WIRE_19 =  ~ena_M;

assign	SYNTHESIZED_WIRE_18 =  ~setM1;


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_T1_ff <= 1;
	end
else
if (ena_T)
	begin
	DFFE_T1_ff <= ena_M;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_T2_ff <= 0;
	end
else
if (ena_T)
	begin
	DFFE_T2_ff <= SYNTHESIZED_WIRE_13;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_T3_ff <= 0;
	end
else
if (ena_T)
	begin
	DFFE_T3_ff <= SYNTHESIZED_WIRE_14;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_T4_ff <= 0;
	end
else
if (ena_T)
	begin
	DFFE_T4_ff <= SYNTHESIZED_WIRE_15;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_T5_ff <= 0;
	end
else
if (ena_T)
	begin
	DFFE_T5_ff <= SYNTHESIZED_WIRE_16;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	T6 <= 0;
	end
else
if (ena_T)
	begin
	T6 <= SYNTHESIZED_WIRE_17;
	end
end

assign	timings_en = ena_T;

endmodule
