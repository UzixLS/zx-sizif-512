`include "util.vh"
// `define USE_FPGA
// `define USE_CHROMA
// `define USE_DIV
// `define USE_BDI
// `define USE_COVOX

module zx_ula(
	input rst_n,
	input clk14,
	input clk32,

	output reg n_rstcpu,
	output reg clkcpu,

	inout [7:0] vd,
	inout [18:0] va,
	output [16:14] ra,
	input a0,
	input a1,
	input a13,
	input a14,
	input a15,

`ifdef USE_FPGA
	output vaout,
	output vaout_8,
	output vdout,
`endif

	output n_vrd,
	output reg n_vwr,
	output reg n_romcs,

	input n_rd,
	input n_wr,
	input n_mreq,
	input n_iorq,
	input n_m1,
	input n_rfsh,
	output reg n_int,
	output reg n_nmi,

	output n_iorqge_o,
	input n_iorqge_i,
	input [4:0] kd,
	input tape_in,
	output reg tape_out,
	output reg beeper,

	input n_magic,

	output reg r,
	output reg g,
	output reg b,
	output reg i,
	output reg csync,
	output reg hsync,
	output reg vsync,
`ifdef USE_CHROMA
	output [1:0] chroma,
`endif

	output ay_clk,
	output reg ay_bdir,
	output reg ay_bc1,
	output reg ay_abc,

	output snd,
`ifdef USE_FPGA
	output [7:0] snd_parallel,
`endif

	input n_joy_down,
	input n_joy_right,
	input n_joy_left,
	input n_joy_up,
	input n_joy_b1,
	input n_joy_b2,
	input n_joy_b3,

	output reg vg_clk,
	output reg vg_cs,
	output vg_rst,
	input vg_intr,
	input vg_drq,
	output vg_hlt,
	output vg_dden,
	output reg vg_rclk,
	input vg_wf_de,
	input vg_tr43,
	input vg_sr,
	input vg_sl,
	input vg_wd,
	output reg fd_wdat,
	input fd_index,
	output reg vg_index,
	input fd_rdat,
	output reg vg_rawr,
	output fd_disk0,
	output fd_disk1,
	output fd_side1,
	input fd_motor,

	input sd_cd,
	input sd_miso,
	output sd_mosi,
	output reg sd_sck,
	output reg sd_cs
);

wire [15:0] xa = {a15, a14, a13, va[12:0]};

reg [2:0] border;
reg [2:0] rambank128;
reg timings;
reg turbo;
reg extlock;
wire clkwait;

reg n_iorq_delayed;
assign n_iorqge_o = ~n_m1 | n_iorq;
wire n_ioreq = n_iorqge_i | n_iorq_delayed;


/* SCREEN CONTROLLER */
localparam H_AREA         = 256;
localparam V_AREA         = 192;
localparam SCREEN_DELAY   = 8;

localparam H_LBORDER_S48  = 32 - SCREEN_DELAY;
localparam H_RBORDER_S48  = 64 + SCREEN_DELAY;
localparam H_BLANK1_S48   = 16;
localparam H_SYNC_S48     = 32;
localparam H_BLANK2_S48   = 48;
localparam H_TOTAL_S48    = H_AREA + H_RBORDER_S48 + H_BLANK1_S48 + H_SYNC_S48 + H_BLANK2_S48 + H_LBORDER_S48;
localparam V_BBORDER_S48  = 56;
localparam V_SYNC_S48     = 8;
localparam V_TBORDER_S48  = 56;
localparam V_TOTAL_S48    = V_AREA + V_BBORDER_S48 + V_SYNC_S48 + V_TBORDER_S48;

localparam H_LBORDER_S128 = 64 - SCREEN_DELAY;
localparam H_RBORDER_S128 = 60 + SCREEN_DELAY;
localparam H_BLANK1_S128  = 16;
localparam H_SYNC_S128    = 33;
localparam H_BLANK2_S128  = 27;
localparam H_TOTAL_S128   = H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128 + H_BLANK2_S128 + H_LBORDER_S128;
localparam V_BBORDER_S128 = 47;
localparam V_SYNC_S128    = 8;
localparam V_TBORDER_S128 = 64;
localparam V_TOTAL_S128   = V_AREA + V_BBORDER_S128 + V_SYNC_S128 + V_TBORDER_S128;

localparam H_LBORDER_PENT = 64 - SCREEN_DELAY;
localparam H_RBORDER_PENT = 56 + SCREEN_DELAY;
localparam H_BLANK1_PENT  = 8;
localparam H_SYNC_PENT    = 33;
localparam H_BLANK2_PENT  = 31;
localparam H_TOTAL_PENT   = H_AREA + H_RBORDER_PENT + H_BLANK1_PENT + H_SYNC_PENT + H_BLANK2_PENT + H_LBORDER_PENT;
localparam V_BBORDER_PENT = 56;
localparam V_SYNC_PENT    = 8;
localparam V_TBORDER_PENT = 64;
localparam V_TOTAL_PENT   = V_AREA + V_BBORDER_PENT + V_SYNC_PENT + V_TBORDER_PENT;

reg [`CLOG2(`MAX(V_TOTAL_S128, V_TOTAL_PENT))-1:0] vc;
reg [`CLOG2(`MAX(H_TOTAL_S128, H_TOTAL_PENT)):0] hc0;
wire [`CLOG2(`MAX(H_TOTAL_S128, H_TOTAL_PENT))-1:0] hc = hc0[$bits(hc0)-1:1];

wire ck7 = hc0[0];
wire ck3_5 = hc0[0] & hc0[1];

wire hc0_reset = timings?
	hc0 == (H_TOTAL_S128<<1) - 1'b1 :
	hc0 == (H_TOTAL_PENT<<1) - 1'b1 ;
wire vc_reset = timings?
	vc == V_TOTAL_S128 - 1'b1 :
	vc == V_TOTAL_PENT - 1'b1 ;
wire hsync0 = timings?
	(hc >= (H_AREA + H_RBORDER_S128 + H_BLANK1_S128)) &&
		(hc <  (H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128)) :
	(hc >= (H_AREA + H_RBORDER_PENT + H_BLANK1_PENT)) &&
		(hc <  (H_AREA + H_RBORDER_PENT + H_BLANK1_PENT + H_SYNC_PENT));
wire vsync0 = timings?
	(vc >= (V_AREA + V_BBORDER_S128)) && (vc < (V_AREA + V_BBORDER_S128 + V_SYNC_S128)) :
	(vc >= (V_AREA + V_BBORDER_PENT)) && (vc < (V_AREA + V_BBORDER_PENT + V_SYNC_PENT)) ;
wire blank = timings?
	((vc >= (V_AREA + V_BBORDER_S128)) && (vc < (V_AREA + V_BBORDER_S128 + V_SYNC_S128))) ||
		((hc >= (H_AREA + H_RBORDER_S128)) &&
		 (hc <  (H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128 + H_BLANK2_S128))) :
	((vc >= (V_AREA + V_BBORDER_PENT)) && (vc < (V_AREA + V_BBORDER_PENT + V_SYNC_PENT))) ||
		((hc >= (H_AREA + H_RBORDER_PENT)) &&
		 (hc <  (H_AREA + H_RBORDER_PENT + H_BLANK1_PENT + H_SYNC_PENT + H_BLANK2_PENT)));

always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		hc0 <= 0;
		vc <= 0;
	end
	else if (hc0_reset) begin
		hc0 <= 0;
		if (vc_reset) begin
			vc <= 0;
		end
		else begin
			vc <= vc + 1'b1;
		end
	end
	else begin
		hc0 <= hc0 + 1'b1;
	end
end

reg [4:0] blink_cnt;
wire blink = blink_cnt[$bits(blink_cnt)-1];
always @(negedge n_int or negedge rst_n) begin
	if (!rst_n)
		blink_cnt <= 0;
	else
		blink_cnt <= blink_cnt + 1'b1;
end

reg [7:0] bitmap, attr, bitmap_next, attr_next;
wire pixel = bitmap[7];
always @(posedge clk14) begin
	if (ck7) begin
		if (blank)
			{i, g, r, b} = 4'b0000;
		else begin
			{g, r, b} = (pixel ^ (attr[7] & blink))? attr[2:0] : attr[5:3];
			i = (g | r | b) & attr[6];
		end
		csync <= ~(vsync0 ^ hsync0);
		vsync <= vsync0;
		hsync <= hsync0;
	end
end

reg screen_read;
wire attr_read = screen_read & ~ck7;
wire bitmap_read = screen_read & ck7;
wire [14:0] bitmap_addr = { 2'b10, vc[7:6], vc[2:0], vc[5:3], hc[7:3] };
wire [14:0] attr_addr = { 5'b10110, vc[7:3], hc[7:3] };
wire [14:0] screen_addr = ~ck7? attr_addr : bitmap_addr;
wire screen_load = (vc < V_AREA) && (hc < H_AREA || hc0_reset);
wire screen_show = (vc < V_AREA) && (hc >= SCREEN_DELAY - 1) && (hc < H_AREA + SCREEN_DELAY - 1);
wire screen_update = vc < V_AREA && hc <= H_AREA && hc != 0 && hc0[3:0] == 4'b1110;
wire border_update = !screen_show && (timings == 0 || hc0[3:0] == 4'b1110);

always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		screen_read <= 0;
		attr <= 0;
		bitmap <= 0;
		attr_next <= 0;
		bitmap_next <= 0;
	end
	else begin
		if (screen_load && (((n_mreq == 1'b1 || n_rfsh == 0) && n_iorq == 1'b1 && n_m1 == 1'b1) || clkwait)) begin
			screen_read <= 1'b1;
		end
		else begin
			screen_read <= 0;
		end

		if (attr_read)
			attr_next <= vd;
		else if (!screen_load)
			attr_next <= 8'hff;
		if (bitmap_read)
			bitmap_next <= vd;

		if (border_update)
			attr <= {2'b00, border[2] ^ ~sd_miso, border[1] ^ ~n_magic, border[0] ^ ~fd_rdat, 3'b000};
		else if (screen_update)
			attr <= attr_next;

		if (screen_update)
			bitmap <= bitmap_next;
		else if (ck7)
			bitmap <= {bitmap[6:0], 1'b0};
	end
end


/* INT GENERATOR */
localparam INT_V_S48       = 248;
localparam INT_H_FROM_S48  = 0;
localparam INT_H_TO_S48    = 64;
localparam INT_V_S128      = 248;
localparam INT_H_FROM_S128 = 0;
localparam INT_H_TO_S128   = 64;
localparam INT_V_PENT      = 239;
localparam INT_H_FROM_PENT = 316;
localparam INT_H_TO_PENT   = 384;
reg int0, int1;
always @(posedge clk14) begin
	int0 = timings?
		vc == INT_V_S128 && hc >= INT_H_FROM_S128 && hc < INT_H_TO_S128 :
		// (vc == INT_V_S128-1 && hc >= H_TOTAL_S128-2) || (vc == INT_V_S128 && hc < INT_H_TO_S128-2) :
		vc == INT_V_PENT && hc >= INT_H_FROM_PENT && hc < INT_H_TO_PENT ;
	int1 = timings?
		hc < INT_H_FROM_S128+(INT_H_TO_S128-INT_H_FROM_S128)/2 :
		hc < INT_H_FROM_PENT+(INT_H_TO_PENT-INT_H_FROM_PENT)/2 ;
	n_int <= ~(int0 && (turbo? int1 : 1'b1));
end


/* MAGIC */
reg [1:0] n_magic0;
wire magic_enter = n_magic0[0] == 0 && n_magic0[1] == 1'b1;
always @(posedge n_int or negedge rst_n) begin
	if (!rst_n)
		n_magic0 <= 2'b11;
	else
		n_magic0 <= {n_magic0[0], n_magic};
end

always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		n_nmi <= 1'b1;
		n_rstcpu <= 0;
	end
	else begin
		n_nmi <= (magic_enter && vc == 0)? 1'b0 : 1'b1;
		if (blink_cnt[0])
			n_rstcpu <= 1'b1;
	end
end


/* CONTENTION */
reg n_mreq_delayed;
always @(posedge clkcpu)
	n_mreq_delayed <= n_mreq;
always @(posedge clkcpu)
	n_iorq_delayed <= n_iorq;
wire contention_mem_addr = a14 & (~a15 | (a15 & rambank128[0]));
wire contention_mem = n_iorq_delayed == 1'b1 && n_mreq_delayed == 1'b1 && contention_mem_addr;
wire contention_io = n_iorq_delayed == 1'b1 && n_iorq == 0;
wire contention0 = screen_load && (hc[2] || hc[3]) && (contention_mem || contention_io);
wire contention = contention0 && !turbo && timings;
wire snow = timings && a14 && ~a15 && n_rfsh == 0;


/* CLOCK */
assign clkwait = clkcpu && contention;
always @(negedge clk14)
	clkcpu <= clkwait? 1'b1 : turbo? hc0[0] : ~hc[0];


/* CONFIG */
reg [1:0] extrom;
wire config_cs = extrom == 2'b01 && n_ioreq == 0 && xa[0] == 1'b1 && xa[1] == 1'b1;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		extlock <= 0;
		timings <= 0;
		turbo <= 0;
		ay_abc <= 1'b1;
		extrom <= 0;
	end
	else begin
		if (config_cs && n_wr == 0) begin
			if (xa[15])
				extlock <= vd[0];
			if (xa[14])
				timings <= vd[0];
			if (xa[13])
				turbo <= vd[0];
			if (xa[12])
				ay_abc <= vd[0];
			if (xa[11])
				extrom <= vd[1:0];
		end
		else if (magic_enter && n_mreq == 1'b0 && n_m1 == 1'b0 && xa == 16'h0066) begin
			extrom <= 2'b01;
		end
	end
end


/* PORT #FF */
wire [7:0] port_ff_data = attr_next;
reg port_ff_rd;
always @(posedge clk14)
	port_ff_rd <= n_iorq == 0 && (n_rd == 0 || n_m1 == 0) && !screen_read;


/* PORT #FE */
wire port_fe_cs = n_ioreq == 0 && xa[0] == 0;
reg port_fe_rd;
always @(posedge clk14)
	port_fe_rd <= port_fe_cs && n_rd == 0;

wire [7:0] port_fe_data = {n_magic0[0], tape_in, 1'b1, kd};
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		beeper <= 0;
		tape_out <= 0;
		border <= 0;
	end
	else if (port_fe_cs && n_wr == 0) begin
		beeper <= vd[4];
		tape_out <= vd[3];
		border <= vd[2:0];
	end
end


/* PORT #7FFD */
wire port_7ffd_cs = n_ioreq == 0 && xa[1] == 0 && xa[15] == 0;
reg vbank;
reg rombank128;
reg lock_7ffd;
reg dffd_d4;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		rambank128 <= 0;
		vbank <= 0;
		rombank128 <= 0;
		lock_7ffd <= 0;
	end
	else if (port_7ffd_cs && n_wr == 0 && (lock_7ffd == 0 || dffd_d4 == 1'b1)) begin
		rambank128 <= vd[2:0];
		vbank <= vd[3];
		rombank128 <= vd[4];
		lock_7ffd <= vd[5];
	end
end


/* PORT DFFD */
wire port_dffd_cs = !extlock && n_ioreq == 0 && xa == 16'hDFFD;
reg [1:0] rambank_ext;
reg dffd_d3;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		rambank_ext <= 2'b11;
		dffd_d3 <= 1'b0;
		dffd_d4 <= 1'b0;
	end
	else if (port_dffd_cs && n_wr == 0) begin
		rambank_ext[0] <= ~vd[0];
`ifdef USE_DIV
		if (sd_cd == 1'b1)
`endif
		rambank_ext[1] <= ~vd[1];
		dffd_d3 <= vd[3];
		dffd_d4 <= vd[4];
	end
end


/* AY */
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		ay_bc1 <= 0;
		ay_bdir <= 0;
	end
	else begin
		ay_bc1  <= xa[15] == 1'b1 && xa[14] == 1'b1 && xa[1] == 0 && n_ioreq == 0;
		ay_bdir <= xa[15] == 1'b1 && xa[1] == 0 && n_ioreq == 0 && n_wr == 0;
	end
end
assign ay_clk = hc[1];


/* COVOX */
`ifdef USE_COVOX
reg [7:0] covox_data;
wire covox_cs = !extlock && n_ioreq == 0 && xa[7:0] == 8'hFB;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		covox_data <= 0;
	else if (covox_cs && n_wr == 0)
		covox_data <= vd;
end

reg [8:0] snd_dac;
assign snd = snd_dac[8];
wire [8:0] snd_dac_next = covox_data + {beeper, tape_out, tape_in, sd_miso, 4'b0000};
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		snd_dac <= 0;
	else
		snd_dac <= snd_dac[7:0] + snd_dac_next[8:1];
end
`ifdef USE_FPGA
	assign snd_parallel = snd_dac_next;
`endif
`else /* USE_COVOX */
	assign snd = beeper ^ tape_out ^ tape_in ^ sd_miso;
`endif /* USE_COVOX */


/* JOYPAD/KEMPSTON */
wire [7:0] kempston_data = {1'b0, ~n_joy_b3, ~n_joy_b2, ~n_joy_b1, ~n_joy_up,
						~n_joy_down, ~n_joy_left, ~n_joy_right};
reg kempston_rd;
always @(posedge clk14)
	kempston_rd <= !extlock && n_ioreq == 0 && n_rd == 0 && xa[7:5] == 3'b000;


/* BETA DISK INTERFACE */
`ifdef USE_BDI
reg dos;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		dos <= 0;
	end
	else begin
`ifdef USE_DIV
		if (sd_cd == 0)
			dos <= 0;
		else
`endif
		if (n_magic == 0 && n_mreq == 0 && n_m1 == 0 && (xa[15] || xa[14]))
			dos <= 1'b1;
		else if (n_mreq == 0 && n_m1 == 0 && xa[15:8] == 8'h3D && rombank128 == 1'b1)
			dos <= 1'b1;
		else if (n_mreq == 0 && n_m1 == 0 && (xa[15] == 1'b1 || xa[14] == 1'b1))
			dos <= 0;
	end
end

reg [7:0] port_dosff;
wire [7:0] port_dosff_data = {vg_intr, vg_drq, 6'b111111};
wire port_dosff_cs = dos && n_ioreq == 0 && xa[7] == 1'b1;
reg port_dosff_rd;
always @(posedge clk14)
	port_dosff_rd <= port_dosff_cs && n_rd == 0;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		port_dosff <= 0;
	else if (port_dosff_cs && n_wr == 0)
		port_dosff <= vd;
end

assign vg_dden = port_dosff[6];
assign fd_side1 = ~port_dosff[4];
assign vg_hlt = port_dosff[3];
assign vg_rst = port_dosff[2];
assign fd_disk0 = ((port_dosff[1:0] == 2'b00) && fd_motor)? 1'b0 : 1'bz;
assign fd_disk1 = ((port_dosff[1:0] == 2'b01) && fd_motor)? 1'b0 : 1'bz;

always @(posedge clk14)
	vg_cs <= (dos && n_ioreq == 0 && xa[7] == 0)? 1'b0 : 1'b1;


reg [1:0] vgck;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		vgck <= 0;
		vg_clk <= 1'b1;
	end
	else if (vgck == 3 && (ck7 || vg_clk)) begin
		vgck <= 0;
		vg_clk <= ~vg_clk;
	end
	else if (ck7) begin
		vgck <= vgck + 1'b1;
	end
end

always @(posedge clk14)
	vg_index <= fd_index & vg_hlt;

reg rd1, rd2;
always @(posedge clk14) begin
	if (ck3_5) begin
		rd1 <= fd_rdat;
		rd2 <= rd1;
	end
	vg_rawr <= (vg_wf_de == 0 & rd1 == 1'b1 & rd2 == 0)? 1'b0 : 1'b1;
end

reg [3:0] fa;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		fa <= 0;
	end
	else if (ck3_5 && rd1 == 1'b1 & rd2 == 0) begin
		if (fa < 7)
			fa <= 4;
		else
			fa <= 11;
	end
	else if (ck3_5) begin
		if (fa > 12)
			fa <= 0;
		else
			fa <= fa + 1'b1;
	end
end

always @(posedge clk14)
	vg_rclk <= (vg_wf_de == 0)? fa < 7 : 1'b1;

reg [2:0] wdata;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		wdata <= 0;
	end
	else begin
		if (vg_wd == 1'b1) begin
			fd_wdat  <= 0;
			wdata[2] <= vg_tr43 & vg_sl;
			wdata[1] <= ~ ((vg_tr43 & vg_sr) | (vg_tr43 & vg_sl));
			wdata[0] <= vg_tr43 & vg_sr;
		end
		else if (ck3_5) begin
			fd_wdat  <= wdata[2];
			wdata[2] <= wdata[1];
			wdata[1] <= wdata[0];
			wdata[0] <= 0;
		end
	end
end

`else /* USE_BDI */
always @* vg_cs <= 1'b1;
assign vg_rst = 0;
wire dos = 0;
wire port_dosff_rd = 0;
wire [7:0] port_dosff_data = 0;
`endif /* USE_BDI */


/* DIVMMC */
`ifdef USE_DIV
wire port_eb_cs = !extlock && n_ioreq == 0 && xa[7:0] == 8'hEB;
reg div_rd;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		div_rd <= 0;
	else
		div_rd <= n_rd == 0 && port_eb_cs;
end

reg conmem, mapram;
reg [4:0] divbank;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		divbank <= 0;
		mapram <= 0;
		conmem <= 0;
		sd_cs <= 1'b1;
	end
	else if (!extlock && n_ioreq == 0 && n_wr == 0) begin
		if (xa[7:0] == 8'hE3) begin
			divbank <= vd[4:0];
			mapram <= vd[6] | mapram;
			conmem <= vd[7];
		end
		if (xa[7:0] == 8'hE7) begin
			sd_cs <= vd[0];
		end
	end
end

reg automap_next;
reg automap;
always @(negedge clk14 or negedge rst_n) begin // negedge for timing of 3Dh entrypoint in turbo mode
	if (!rst_n) begin
		automap_next <= 0;
		automap <= 0;
	end
	else begin
		if (sd_cd || extlock) begin
			automap_next <= 0;
		end
		else if (n_m1 == 0 && n_mreq == 0 && dffd_d4 == 0 && (
				xa == 16'h0000 || // power-on/reset/rst0/software restart
				xa == 16'h0008 || // syntax error
				xa == 16'h0038 || // im1 interrupt/rst #38
				(xa == 16'h0066 && !magic_enter) || // nmi routine
				xa == 16'h04C6 || // tape save routine
				xa == 16'h0562    // tape load and verify routine
				)) begin
			automap_next <= 1'b1;
		end
		else if (n_m1 == 0 && n_mreq == 0 && xa[15:8] == 8'h3D) begin // tr-dos mapping area
			automap_next <= 1'b1;
			automap <= 1'b1;
		end
		else if (n_m1 == 0 && n_mreq == 0 && xa[15:3] == 13'h3FF) begin
			automap_next <= 0;
		end
		else if (n_m1 == 1'b1) begin
			automap <= automap_next;
		end
	end
end

reg [3:0] divcnt;
wire divcnt_en = ~divcnt[3] | divcnt[2] | divcnt[1] | divcnt[0];
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		divcnt <= 0;
	else if (port_eb_cs && (n_rd == 0 || n_wr == 0))
		divcnt <= 4'b1110;
	else if (divcnt_en && ck7)
		divcnt <= divcnt + 1'b1;
end

reg div_mosi_en;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		div_mosi_en <= 0;
	else if (port_eb_cs && n_wr == 0)
		div_mosi_en <= 1'b1;
	else if (!divcnt_en)
		div_mosi_en <= 0;
end

reg [7:0] divmmc_data;
assign sd_mosi = div_mosi_en? divmmc_data[7] : 1'b1;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n)
		divmmc_data <= 0;
	else if (port_eb_cs && n_wr == 0)
		divmmc_data <= vd;
	else if (divcnt[3] == 1'b0)
		if (ck7)
			divmmc_data[7:0] <= {divmmc_data[6:0], sd_miso};
end

always @(posedge clk14)
	sd_sck <= ~sd_sck & ~divcnt[3];

`else /* USE_DIV */
always @* sd_cs = 1'b1;
always @* sd_sck = 0;
assign sd_mosi = 1'b1;
wire div_rd = 0;
wire [4:0] divbank = 0;
wire [7:0] divmmc_data = 0;
`endif /* USE_DIV */


/* VIDEO */
`ifdef USE_CHROMA
reg [2:0] chroma0;
chroma_gen chroma_gen1(
	.cg_clock(clk32),
	.cg_rgb({g,r,b}),
	.cg_hsync(~hsync),
	.cg_enable(1'b1),
	.cg_pnsel(1'b0),
	.cg_out(chroma0)
);
assign chroma[0] = chroma0[1]? chroma0[0] : 1'bz;
assign chroma[1] = chroma0[2]? chroma0[0] : 1'bz;
`endif



/* MEMORY CONTROLLER */
`ifdef USE_DIV
wire divmap = automap | conmem;
wire div_ram = (conmem == 1 && a13 == 1) || (automap == 1 && a13 == 1) || (conmem == 0 && automap == 1 && mapram == 1);
wire div_ramwr_mask = a15 == 0 && a14 == 0 && (a13 == 0 || divbank == 5'b00011) && conmem == 0 && automap == 1 && mapram == 1;
`else 
wire divmap = 0;
wire div_ram = 0;
wire div_ramwr_mask = 0;
`endif

reg n_ramcs, n_romcs0, n_vwr0;
reg [18:13] ram_a;
always @(posedge clk14 or negedge rst_n) begin
	if (!rst_n) begin
		n_romcs0 <= 1'b1;
		n_ramcs <= 1'b1;
		n_vwr0 <= 1'b1;
		ram_a <= 0;
	end
	else begin
		n_romcs0 = (n_mreq == 0 && n_rfsh == 1 &&  a14 == 0    && a15 == 0 && !div_ram && !(dffd_d4 && !divmap))? 1'b0 : 1'b1;
		n_ramcs  = (n_mreq == 0 && n_rfsh == 1 && (a14 == 1'b1 || a15 == 1'b1 || div_ram || (dffd_d4 && !divmap)))? 1'b0 : 1'b1;
		n_vwr0 = n_ramcs | n_wr | div_ramwr_mask;
		ram_a <=
			divmap & ~a14 & ~a15 & a13? {1'b0, divbank} :
			divmap & ~a14 & ~a15? {1'b0, 5'b00011} :
			dffd_d3 & a15? {2'b11, a14, a15, a14, a13} :
			dffd_d3 & a14? {rambank_ext, rambank128, a13} :
			a15 & a14? {rambank_ext, rambank128, a13} :
			{2'b11, a14, a15, a14, a13} ;
	end
end

assign n_romcs = n_romcs0 | n_mreq;
assign n_vrd = (n_ramcs | n_rd) & ~screen_read;
assign n_vwr = n_vwr0 | n_wr | screen_read;


`ifdef USE_FPGA
assign vaout = screen_read == 1'b1;
assign vaout_8 = screen_read && snow;
assign vdout = port_ff_rd || port_fe_rd || kempston_rd || div_rd || port_dosff_rd;
`endif


assign ra[16:14] =
	(extrom == 2'b01)? 3'b111 :
	(extrom[1] == 1'b1)? {extrom, rombank128} :
	divmap? 3'b011 :
	dos? 3'b010 :
	{2'b00, rombank128};

assign va[18:0] =
	screen_read & snow? {3'b111, vbank, screen_addr[14:8], {8{1'bz}}} :
	screen_read? {3'b111, vbank, screen_addr} :
	{ram_a[18:13], {13{1'bz}}};

assign vd[7:0] =
	port_dosff_rd? port_dosff_data :
	div_rd? divmmc_data :
	kempston_rd? kempston_data :
	port_fe_rd? port_fe_data :
	port_ff_rd? port_ff_data :
	{8{1'bz}};

endmodule
