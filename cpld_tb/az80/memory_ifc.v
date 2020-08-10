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
// CREATED		"Sun Dec 09 19:14:29 2018"

module memory_ifc(
	clk,
	nM1_int,
	ctl_mRead,
	ctl_mWrite,
	in_intr,
	nreset,
	fIORead,
	fIOWrite,
	setM1,
	ctl_iorw,
	timings_en,
	iorq_Tw,
	nhold_clk_wait,
	nM1_out,
	nRFSH_out,
	nMREQ_out,
	nRD_out,
	nWR_out,
	nIORQ_out,
	latch_wait,
	wait_m1
);


input wire	clk;
input wire	nM1_int;
input wire	ctl_mRead;
input wire	ctl_mWrite;
input wire	in_intr;
input wire	nreset;
input wire	fIORead;
input wire	fIOWrite;
input wire	setM1;
input wire	ctl_iorw;
input wire	timings_en;
input wire	iorq_Tw;
input wire	nhold_clk_wait;
output wire	nM1_out;
output wire	nRFSH_out;
output wire	nMREQ_out;
output wire	nRD_out;
output wire	nWR_out;
output wire	nIORQ_out;
output wire	latch_wait;
output wire	wait_m1;

wire	intr_iorq;
wire	ioRead;
wire	iorq;
wire	ioWrite;
wire	m1_mreq;
wire	mrd_mreq;
wire	mwr_mreq;
reg	mwr_wr;
wire	nMEMRQ_int;
wire	nq2;
reg	q1;
reg	q2;
wire	wait_io;
reg	wait_iorq;
reg	wait_iorqinta;
reg	wait_m_ALTERA_SYNTHESIZED1;
reg	wait_mrd;
reg	wait_mwr;
wire	SYNTHESIZED_WIRE_0;
reg	DFFE_m1_ff3;
wire	SYNTHESIZED_WIRE_1;
reg	DFFE_iorq_ff4;
reg	SYNTHESIZED_WIRE_15;
reg	DFFE_mrd_ff3;
reg	DFFE_intr_ff3;
wire	SYNTHESIZED_WIRE_2;
reg	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_3;
reg	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
reg	DFFE_iorq_ff1;
reg	DFFE_m1_ff1;
reg	DFFE_mrd_ff1;
reg	DFFE_mwr_ff1;
reg	DFFE_mreq_ff2;




assign	nMREQ_out = SYNTHESIZED_WIRE_0 & nMEMRQ_int;

assign	ioRead = iorq & fIORead;

assign	SYNTHESIZED_WIRE_1 = ~(DFFE_m1_ff3 | wait_m_ALTERA_SYNTHESIZED1);

assign	m1_mreq = ~(in_intr | SYNTHESIZED_WIRE_1);

assign	iorq = wait_iorq | DFFE_iorq_ff4 | SYNTHESIZED_WIRE_15;

assign	ioWrite = iorq & fIOWrite;

assign	latch_wait = wait_mrd | wait_io | wait_m_ALTERA_SYNTHESIZED1 | wait_mwr;

assign	nMEMRQ_int = ~(m1_mreq | mrd_mreq | mwr_mreq);

assign	nRD_out = ~(m1_mreq | mrd_mreq | ioRead);

assign	mrd_mreq = DFFE_mrd_ff3 | wait_mrd;

assign	nWR_out = ~(ioWrite | mwr_wr);

assign	mwr_mreq = mwr_wr | wait_mwr;

assign	nIORQ_out = ~(intr_iorq | iorq);

assign	wait_io = wait_iorqinta | wait_iorq;

assign	intr_iorq = DFFE_intr_ff3 | wait_iorqinta;

assign	nM1_out = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_0 = ~(SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_17);

assign	nRFSH_out = ~(nq2 & SYNTHESIZED_WIRE_16);


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	wait_iorqinta <= 0;
	end
else
	begin
	wait_iorqinta <= iorq_Tw;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_intr_ff3 <= 0;
	end
else
if (nhold_clk_wait)
	begin
	DFFE_intr_ff3 <= wait_iorqinta;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_iorq_ff1 <= 0;
	end
else
if (timings_en)
	begin
	DFFE_iorq_ff1 <= ctl_iorw;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_15 <= 0;
	end
else
if (timings_en)
	begin
	SYNTHESIZED_WIRE_15 <= DFFE_iorq_ff1;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	wait_iorq <= 0;
	end
else
if (timings_en)
	begin
	wait_iorq <= SYNTHESIZED_WIRE_15;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_iorq_ff4 <= 0;
	end
else
if (timings_en)
	begin
	DFFE_iorq_ff4 <= wait_iorq;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_16 <= 0;
	end
else
if (timings_en)
	begin
	SYNTHESIZED_WIRE_16 <= nM1_int;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_m1_ff1 <= 1;
	end
else
if (timings_en)
	begin
	DFFE_m1_ff1 <= setM1;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	wait_m_ALTERA_SYNTHESIZED1 <= 0;
	end
else
if (timings_en)
	begin
	wait_m_ALTERA_SYNTHESIZED1 <= DFFE_m1_ff1;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_m1_ff3 <= 0;
	end
else
if (timings_en)
	begin
	DFFE_m1_ff3 <= wait_m_ALTERA_SYNTHESIZED1;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_mrd_ff1 <= 0;
	end
else
if (timings_en)
	begin
	DFFE_mrd_ff1 <= ctl_mRead;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	wait_mrd <= 0;
	end
else
if (timings_en)
	begin
	wait_mrd <= DFFE_mrd_ff1;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_mrd_ff3 <= 0;
	end
else
if (timings_en)
	begin
	DFFE_mrd_ff3 <= wait_mrd;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	SYNTHESIZED_WIRE_17 <= 0;
	end
else
if (timings_en)
	begin
	SYNTHESIZED_WIRE_17 <= SYNTHESIZED_WIRE_16;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_mreq_ff2 <= 0;
	end
else
if (timings_en)
	begin
	DFFE_mreq_ff2 <= SYNTHESIZED_WIRE_17;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_mwr_ff1 <= 0;
	end
else
if (timings_en)
	begin
	DFFE_mwr_ff1 <= ctl_mWrite;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	wait_mwr <= 0;
	end
else
if (timings_en)
	begin
	wait_mwr <= DFFE_mwr_ff1;
	end
end


always@(posedge SYNTHESIZED_WIRE_18 or negedge nreset)
begin
if (!nreset)
	begin
	mwr_wr <= 0;
	end
else
if (timings_en)
	begin
	mwr_wr <= wait_mwr;
	end
end

assign	SYNTHESIZED_WIRE_18 =  ~clk;

assign	nq2 =  ~q2;

assign	SYNTHESIZED_WIRE_2 =  ~nreset;

assign	SYNTHESIZED_WIRE_3 =  ~DFFE_mreq_ff2;


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	q1 <= 0;
	end
else
if (timings_en)
	begin
	q1 <= SYNTHESIZED_WIRE_16;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	q2 <= 0;
	end
else
if (timings_en)
	begin
	q2 <= q1;
	end
end

assign	wait_m1 = wait_m_ALTERA_SYNTHESIZED1;

endmodule
