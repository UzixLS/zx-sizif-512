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
// CREATED		"Sat Dec 10 09:05:10 2016"

module reg_control(
	ctl_reg_exx,
	ctl_reg_ex_af,
	ctl_reg_ex_de_hl,
	ctl_reg_use_sp,
	nreset,
	ctl_reg_sel_pc,
	ctl_reg_sel_ir,
	ctl_reg_sel_wz,
	ctl_reg_gp_we,
	ctl_reg_not_pc,
	use_ixiy,
	use_ix,
	ctl_reg_sys_we_lo,
	ctl_reg_sys_we_hi,
	ctl_reg_sys_we,
	clk,
	ctl_sw_4d,
	nhold_clk_wait,
	ctl_reg_gp_hilo,
	ctl_reg_gp_sel,
	ctl_reg_sys_hilo,
	reg_sel_bc,
	reg_sel_bc2,
	reg_sel_ix,
	reg_sel_iy,
	reg_sel_de,
	reg_sel_hl,
	reg_sel_de2,
	reg_sel_hl2,
	reg_sel_af,
	reg_sel_af2,
	reg_sel_wz,
	reg_sel_pc,
	reg_sel_ir,
	reg_sel_sp,
	reg_sel_gp_hi,
	reg_sel_gp_lo,
	reg_sel_sys_lo,
	reg_sel_sys_hi,
	reg_gp_we,
	reg_sys_we_lo,
	reg_sys_we_hi,
	reg_sw_4d_lo,
	reg_sw_4d_hi
);


input wire	ctl_reg_exx;
input wire	ctl_reg_ex_af;
input wire	ctl_reg_ex_de_hl;
input wire	ctl_reg_use_sp;
input wire	nreset;
input wire	ctl_reg_sel_pc;
input wire	ctl_reg_sel_ir;
input wire	ctl_reg_sel_wz;
input wire	ctl_reg_gp_we;
input wire	ctl_reg_not_pc;
input wire	use_ixiy;
input wire	use_ix;
input wire	ctl_reg_sys_we_lo;
input wire	ctl_reg_sys_we_hi;
input wire	ctl_reg_sys_we;
input wire	clk;
input wire	ctl_sw_4d;
input wire	nhold_clk_wait;
input wire	[1:0] ctl_reg_gp_hilo;
input wire	[1:0] ctl_reg_gp_sel;
input wire	[1:0] ctl_reg_sys_hilo;
output wire	reg_sel_bc;
output wire	reg_sel_bc2;
output wire	reg_sel_ix;
output wire	reg_sel_iy;
output wire	reg_sel_de;
output wire	reg_sel_hl;
output wire	reg_sel_de2;
output wire	reg_sel_hl2;
output wire	reg_sel_af;
output wire	reg_sel_af2;
output wire	reg_sel_wz;
output wire	reg_sel_pc;
output wire	reg_sel_ir;
output wire	reg_sel_sp;
output wire	reg_sel_gp_hi;
output wire	reg_sel_gp_lo;
output wire	reg_sel_sys_lo;
output wire	reg_sel_sys_hi;
output wire	reg_gp_we;
output wire	reg_sys_we_lo;
output wire	reg_sys_we_hi;
output wire	reg_sw_4d_lo;
output wire	reg_sw_4d_hi;

reg	bank_af;
reg	bank_exx;
reg	bank_hl_de1;
reg	bank_hl_de2;
wire	reg_sys_we_lo_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_58;
wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_60;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;

assign	reg_sel_wz = ctl_reg_sel_wz;
assign	reg_sel_ir = ctl_reg_sel_ir;
assign	reg_sel_gp_hi = ctl_reg_gp_hilo[1];
assign	reg_sel_gp_lo = ctl_reg_gp_hilo[0];
assign	reg_sel_sys_lo = ctl_reg_sys_hilo[0];
assign	reg_sel_sys_hi = ctl_reg_sys_hilo[1];
assign	reg_gp_we = ctl_reg_gp_we;
assign	reg_sw_4d_lo = ctl_sw_4d;



assign	reg_sel_bc = SYNTHESIZED_WIRE_52 & SYNTHESIZED_WIRE_53;

assign	reg_sel_af = SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_54;

assign	SYNTHESIZED_WIRE_54 = SYNTHESIZED_WIRE_55 & SYNTHESIZED_WIRE_5;

assign	reg_sel_sp = SYNTHESIZED_WIRE_55 & ctl_reg_use_sp;

assign	SYNTHESIZED_WIRE_5 =  ~ctl_reg_use_sp;

assign	reg_sel_ix = SYNTHESIZED_WIRE_56 & use_ix;

assign	SYNTHESIZED_WIRE_50 = ctl_reg_ex_de_hl & SYNTHESIZED_WIRE_53;

assign	reg_sel_iy = SYNTHESIZED_WIRE_56 & SYNTHESIZED_WIRE_10;

assign	reg_sel_af2 = bank_af & SYNTHESIZED_WIRE_54;

assign	SYNTHESIZED_WIRE_2 =  ~bank_af;

assign	SYNTHESIZED_WIRE_47 = SYNTHESIZED_WIRE_57 & SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_46 = bank_hl_de2 & SYNTHESIZED_WIRE_59;

assign	SYNTHESIZED_WIRE_39 = SYNTHESIZED_WIRE_60 & SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_49 = bank_hl_de2 & SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_48 = SYNTHESIZED_WIRE_57 & SYNTHESIZED_WIRE_59;

assign	reg_sel_de = SYNTHESIZED_WIRE_53 & SYNTHESIZED_WIRE_21;

assign	reg_sel_hl = SYNTHESIZED_WIRE_53 & SYNTHESIZED_WIRE_23;

assign	reg_sel_de2 = bank_exx & SYNTHESIZED_WIRE_24;

assign	reg_sel_hl2 = bank_exx & SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_38 = bank_hl_de1 & SYNTHESIZED_WIRE_59;

assign	SYNTHESIZED_WIRE_53 =  ~bank_exx;

assign	SYNTHESIZED_WIRE_45 = bank_hl_de1 & SYNTHESIZED_WIRE_58;

assign	SYNTHESIZED_WIRE_44 = SYNTHESIZED_WIRE_60 & SYNTHESIZED_WIRE_59;

assign	SYNTHESIZED_WIRE_52 = SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_60 =  ~bank_hl_de1;

assign	reg_sys_we_hi = ctl_reg_sys_we | ctl_reg_sys_we_hi;

assign	reg_sel_pc = ctl_reg_sel_pc & SYNTHESIZED_WIRE_32;

assign	SYNTHESIZED_WIRE_58 = SYNTHESIZED_WIRE_61 & SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_32 =  ~ctl_reg_not_pc;

assign	SYNTHESIZED_WIRE_36 =  ~ctl_reg_gp_sel[1];

assign	reg_sys_we_lo_ALTERA_SYNTHESIZED = ctl_reg_sys_we_lo | ctl_reg_sys_we;

assign	SYNTHESIZED_WIRE_56 = SYNTHESIZED_WIRE_61 & use_ixiy;

assign	SYNTHESIZED_WIRE_42 =  ~ctl_reg_gp_sel[0];

assign	SYNTHESIZED_WIRE_43 = ctl_reg_ex_de_hl & bank_exx;

assign	SYNTHESIZED_WIRE_34 =  ~use_ixiy;

assign	SYNTHESIZED_WIRE_59 = ctl_reg_gp_sel[0] & SYNTHESIZED_WIRE_36;


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	bank_af <= 0;
	end
else
if (nhold_clk_wait)
	begin
	bank_af <= bank_af ^ ctl_reg_ex_af;
	end
end

assign	SYNTHESIZED_WIRE_10 =  ~use_ix;

assign	SYNTHESIZED_WIRE_57 =  ~bank_hl_de2;

assign	SYNTHESIZED_WIRE_41 =  ~reg_sys_we_lo_ALTERA_SYNTHESIZED;

assign	SYNTHESIZED_WIRE_40 =  ~SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_38 | SYNTHESIZED_WIRE_39;

assign	reg_sw_4d_hi = ctl_sw_4d & SYNTHESIZED_WIRE_40;

assign	SYNTHESIZED_WIRE_37 = ctl_reg_sys_hilo[1] & SYNTHESIZED_WIRE_41 & ctl_reg_sel_ir;

assign	SYNTHESIZED_WIRE_61 = SYNTHESIZED_WIRE_42 & ctl_reg_gp_sel[1];


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	bank_hl_de2 <= 0;
	end
else
if (nhold_clk_wait)
	begin
	bank_hl_de2 <= bank_hl_de2 ^ SYNTHESIZED_WIRE_43;
	end
end

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_44 | SYNTHESIZED_WIRE_45;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_46 | SYNTHESIZED_WIRE_47;

assign	SYNTHESIZED_WIRE_24 = SYNTHESIZED_WIRE_48 | SYNTHESIZED_WIRE_49;


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	bank_hl_de1 <= 0;
	end
else
if (nhold_clk_wait)
	begin
	bank_hl_de1 <= bank_hl_de1 ^ SYNTHESIZED_WIRE_50;
	end
end


always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	bank_exx <= 0;
	end
else
if (nhold_clk_wait)
	begin
	bank_exx <= bank_exx ^ ctl_reg_exx;
	end
end

assign	SYNTHESIZED_WIRE_55 = ctl_reg_gp_sel[0] & ctl_reg_gp_sel[1];

assign	SYNTHESIZED_WIRE_30 =  ~ctl_reg_gp_sel[0];

assign	SYNTHESIZED_WIRE_31 =  ~ctl_reg_gp_sel[1];

assign	reg_sel_bc2 = SYNTHESIZED_WIRE_52 & bank_exx;

assign	reg_sys_we_lo = reg_sys_we_lo_ALTERA_SYNTHESIZED;

endmodule
