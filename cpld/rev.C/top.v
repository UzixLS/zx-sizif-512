`include "util.vh"
// `define USE_FPGA


module zx_ula(
	input rst_n,
	input clk28,

	output reg n_rstcpu,
	output reg clkcpu,
	output n_clkcpu,

	input [15:0] xa,
	inout [7:0] xd,
	output [18:0] va,
	inout [7:0] vd,
	output [16:14] ra,

`ifdef USE_FPGA
	output dout,
	output vdout,
`endif

	output n_vrd,
	output n_vwr,
	output n_romcs,

	input n_rd,
	input n_wr,
	input n_mreq,
	input n_iorqge,
	input n_m1,
	input n_rfsh,
	output reg n_int,
	output reg n_nmi,

	input [4:0] kd,
	input tape_in,

	input n_magic,

	output reg [1:0] r,
	output reg [1:0] g,
	output reg [1:0] b,
	output reg csync,
	output reg hsync,
	output reg vsync,

	output ay_clk,
	output reg ay_bdir,
	output reg ay_bc1,
	output reg ay_abc,
	output reg ay_mono,

	output snd_l,
	output snd_r,
`ifdef USE_FPGA
	output [9:0] snd_parallel_l,
	output [9:0] snd_parallel_r,
`endif

	input n_joy_down,
	input n_joy_right,
	input n_joy_left,
	input n_joy_up,
	input n_joy_b1,
	input n_joy_b2,
	input n_joy_b3,

	input sd_cd,
	input sd_miso,
	output sd_mosi,
	output reg sd_sck,
	output reg sd_cs
);

reg [2:0] border;
reg [2:0] rambank128;
reg timings;
reg turbo;
reg extlock;
wire clkwait;
reg up_en;

reg n_iorq_delayed;
wire n_ioreq = ~n_m1 | n_iorqge | n_iorq_delayed;


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
reg [`CLOG2(`MAX(H_TOTAL_S128, H_TOTAL_PENT))+1:0] hc0;
wire [`CLOG2(`MAX(H_TOTAL_S128, H_TOTAL_PENT))-1:0] hc = hc0[$bits(hc0)-1:2];

wire clk14 = hc0[0];
wire clk7 = hc0[1];
wire ck14 = hc0[0];
wire ck7 = hc0[0] & hc0[1];

wire hc0_reset = timings?
	hc0 == (H_TOTAL_S128<<2) - 1'b1 :
	hc0 == (H_TOTAL_PENT<<2) - 1'b1 ;
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

always @(posedge clk28 or negedge rst_n) begin
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

wire [7:0] attr_border = {2'b00, border[2] ^ ~sd_miso, border[1] ^ ~n_magic, border[0], 3'b000};

reg [7:0] bitmap, attr, bitmap_next, attr_next;
reg [7:0] up_ink, up_paper, up_ink_next, up_paper_next;
wire pixel = bitmap[7];
reg screen_read;
reg [1:0] screen_read_step;
wire screen_read_step_reset = hc0[4:0] == 5'b11111 || hc0_reset;
wire bitmap_read = screen_read && screen_read_step == 2'd0;
wire attr_read = screen_read && screen_read_step == 2'd1;
wire up_ink_read = screen_read && screen_read_step == 2'd2;
wire up_paper_read = screen_read && screen_read_step == 2'd3;
wire [14:0] screen_addr =  bitmap_read? 
										{ 2'b10, vc[7:6], vc[2:0], vc[5:3], hc[7:3] } :
										{ 5'b10110, vc[7:3], hc[7:3] };
wire [5:0] up_addr = up_ink_read? { attr_next[7:6], 1'b0, attr_next[2:0] } : { attr_next[7:6], 1'b1, attr_next[5:3] };
wire screen_load = (vc < V_AREA) && (hc < H_AREA || hc0_reset);
wire screen_show = (vc < V_AREA) && (hc0 >= (SCREEN_DELAY<<2) - 2) && (hc0 < ((H_AREA + SCREEN_DELAY)<<2) - 2);
wire screen_update = vc < V_AREA && hc <= H_AREA && hc != 0 && hc0[4:0] == 5'b11110;
wire border_update = !screen_show && ((timings == 0 && ck7) || hc0[4:0] == 5'b11110);
wire bitmap_shift = hc0[1:0] == 2'b10;
wire screen_read_next = (screen_load || up_en) && ((n_iorqge == 1'b1 && n_mreq == 1'b1) || n_rfsh == 1'b0 || clkwait);

always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		screen_read <= 0;
		screen_read_step <= 0;
		attr <= 0;
		bitmap <= 0;
		attr_next <= 0;
		bitmap_next <= 0;
		up_ink <= 0;
		up_paper <= 0;
		up_ink_next <= 0;
		up_paper_next <= 0;
	end
	else begin
		if (ck14) begin
			screen_read <= screen_read_next;
			if (screen_read && screen_read_step[0] && !up_en)
				screen_read_step <= 0;
			else if (!screen_load && up_en)
				screen_read_step <= 2'd3;
			else if (screen_read_step_reset)
				screen_read_step <= 0;
			else if (screen_read)
				screen_read_step <= screen_read_step + 1'b1;

			if (attr_read)
				attr_next <= vd;
			else if (!screen_load)
				attr_next <= attr_border;
			if (bitmap_read)
				bitmap_next <= vd;
			if (up_ink_read)
				up_ink_next <= vd;
			if (up_paper_read)
				up_paper_next <= vd;
		end

		if (border_update)
			attr <= attr_border;
		else if (screen_update)
			attr <= attr_next;

		if (screen_update)
			bitmap <= bitmap_next;
		else if (bitmap_shift)
			bitmap <= {bitmap[6:0], 1'b0};

		if (screen_update)
			up_ink <= up_ink_next;
		if (screen_update || (!screen_show && !screen_load))
			up_paper <= up_paper_next;
	end
end


/* VIDEO OUTPUT */
function [1:0] color_2to2; input [1:0] in;
	case (in)
		2'b00: color_2to2 = 2'b00; // 0mV
		2'b01: color_2to2 = 2'b10; // 343mV
		2'b10: color_2to2 = clk14? 2'b10 : 2'bz1;
		2'b11: color_2to2 = 2'b11; // 675mV
	endcase
endfunction
function [1:0] color_3to2; input [2:0] in;
	case (in)
		3'b000: color_3to2 = 2'b00; // 0mV
		3'b001: color_3to2 = clk14? 2'b00 : 2'b10;
		3'b010: color_3to2 = 2'bz1; // 237mV
		3'b011: color_3to2 = 2'b10; // 343mV
		3'b100: color_3to2 = clk14? 2'b10 : 2'bz1;
		3'b101: color_3to2 = 2'b1z; // 505mV
		3'b110: color_3to2 = clk14? 2'bz1 : 2'b1z;
		3'b111: color_3to2 = 2'b11; // 675mV
	endcase
endfunction

always @(posedge clk28) begin
	if (blank)
		{g, r, b} = 6'b000000;
	else if (up_en) begin
		g = color_3to2(pixel? up_ink[7:5] : up_paper[7:5]);
		r = color_3to2(pixel? up_ink[4:2] : up_paper[4:2]);
		b = color_2to2(pixel? up_ink[1:0] : up_paper[1:0]);
	end
	else begin
		{g[1], r[1], b[1]} = (pixel ^ (attr[7] & blink))? attr[2:0] : attr[5:3];
		{g[0], r[0], b[0]} = ((g[1] | r[1] | b[1]) & attr[6])? 3'b111 : 3'bzzz;
	end
	csync = ~(vsync0 ^ hsync0);
	vsync = vsync0;
	hsync = hsync0;
end


/* INT GENERATOR */
localparam INT_V_S48       = 248;
localparam INT_H_FROM_S48  = 0;
localparam INT_H_TO_S48    = 64;
localparam INT_V_S128      = 248;
localparam INT_H_FROM_S128 = 0;
localparam INT_H_TO_S128   = 64;
localparam INT_V_PENT      = 239;
localparam INT_H_FROM_PENT = 318;
localparam INT_H_TO_PENT   = 384;
reg int0, int1;
always @(posedge clk28) begin
	int0 = timings?
		vc == INT_V_S128 && hc >= INT_H_FROM_S128 && hc < INT_H_TO_S128 :
		// (vc == INT_V_S128-1 && hc >= H_TOTAL_S128-2) || (vc == INT_V_S128 && hc < INT_H_TO_S128-2) :
		vc == INT_V_PENT && hc >= INT_H_FROM_PENT && hc < INT_H_TO_PENT ;
		// hc >= INT_H_FROM_PENT && hc < INT_H_TO_PENT ;
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

always @(posedge clk28 or negedge rst_n) begin
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
	n_iorq_delayed <= n_iorqge;
wire contention_mem_addr = xa[14] & (~xa[15] | (xa[15] & rambank128[0]));
wire contention_mem = n_iorq_delayed == 1'b1 && n_mreq_delayed == 1'b1 && contention_mem_addr;
wire contention_io = n_iorq_delayed == 1'b1 && n_iorqge == 0;
wire contention0 = screen_load && (hc[2] || hc[3]) && (contention_mem || contention_io);
wire contention = contention0 && !turbo && timings;
wire snow = timings && xa[14] && ~xa[15] && n_rfsh == 0;


/* CLOCK */
assign clkwait = clkcpu && contention;
always @(negedge clk28)
	clkcpu <= clkwait? 1'b1 : turbo? hc0[1] : hc[0];
assign n_clkcpu = ~clkcpu;


/* CONFIG */
reg [1:0] extrom;
wire config_cs = extrom == 2'b01 && n_ioreq == 0 && xa[0] == 1'b1 && xa[1] == 1'b1;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		extlock <= 0;
		timings <= 0;
		turbo <= 0;
		ay_abc <= 1'b1;
		ay_mono <= 0;
		extrom <= 0;
	end
	else begin
		if (config_cs && n_wr == 0) begin
			if (xa[15])
				extlock <= xd[0];
			if (xa[14])
				timings <= xd[0];
			if (xa[13])
				turbo <= xd[0];
			if (xa[12])
				ay_abc <= xd[0];
			if (xa[11])
				extrom <= xd[1:0];
		end
		else if (magic_enter && n_mreq == 1'b0 && n_m1 == 1'b0 && xa == 16'h0066) begin
			extrom <= 2'b01;
		end
	end
end


/* PORT #FF */
wire [7:0] port_ff_data = attr_next;
reg port_ff_rd;
always @(posedge clk28)
	port_ff_rd <= n_rd == 0 && n_ioreq == 0 && (timings == 1 || xa[7:0] == 8'hFF) && screen_load;


/* PORT #FE */
wire port_fe_cs = n_ioreq == 0 && xa[0] == 0;
reg port_fe_rd;
always @(posedge clk28)
	port_fe_rd <= port_fe_cs && n_rd == 0;

wire [7:0] port_fe_data = {n_magic0[0], tape_in, 1'b1, kd};
reg tape_out, beeper;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		beeper <= 0;
		tape_out <= 0;
		border <= 0;
	end
	else if (port_fe_cs && n_wr == 0) begin
		beeper <= xd[4];
		tape_out <= xd[3];
		border <= xd[2:0];
	end
end


/* PORT #7FFD */
wire port_7ffd_cs = n_ioreq == 0 && xa[1] == 0 && xa[15] == 0;
reg vbank;
reg rombank128;
reg lock_7ffd;
reg dffd_d4;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		rambank128 <= 0;
		vbank <= 0;
		rombank128 <= 0;
		lock_7ffd <= 0;
	end
	else if (port_7ffd_cs && n_wr == 0 && (lock_7ffd == 0 || dffd_d4 == 1'b1)) begin
		rambank128 <= xd[2:0];
		vbank <= xd[3];
		rombank128 <= xd[4];
		lock_7ffd <= xd[5];
	end
end


/* PORT DFFD */
wire port_dffd_cs = !extlock && n_ioreq == 0 && xa == 16'hDFFD;
reg [1:0] rambank_ext;
reg dffd_d3;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		rambank_ext <= 2'b11;
		dffd_d3 <= 1'b0;
		dffd_d4 <= 1'b0;
	end
	else if (port_dffd_cs && n_wr == 0) begin
		rambank_ext[0] <= ~xd[0];
		if (sd_cd == 1'b1)
			rambank_ext[1] <= ~xd[1];
		dffd_d3 <= xd[3];
		dffd_d4 <= xd[4];
	end
end


/* AY */
always @(posedge clk28 or negedge rst_n) begin
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


/* COVOX & SOUNDRIVE */
reg [7:0] covox_data_l0, covox_data_l1, covox_data_r0, covox_data_r1;
wire covox_cs = !extlock && n_ioreq == 0 && xa[7:0] == 8'hFB;
wire soundrive_a_cs = !extlock && n_ioreq == 0 && xa[7:0] == 8'h0F;
wire soundrive_b_cs = !extlock && n_ioreq == 0 && xa[7:0] == 8'h1F;
wire soundrive_c_cs = !extlock && n_ioreq == 0 && xa[7:0] == 8'h4F;
wire soundrive_d_cs = !extlock && n_ioreq == 0 && xa[7:0] == 8'h5F;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		covox_data_l0 <= 8'h80;
		covox_data_l1 <= 8'h80;
		covox_data_r0 <= 8'h80;
		covox_data_r1 <= 8'h80;
	end
	else begin
		if ((covox_cs || soundrive_a_cs) && n_wr == 0)
			covox_data_l0 <= xd;
		if ((covox_cs || soundrive_b_cs) && n_wr == 0)
			covox_data_l1 <= xd;
		if ((covox_cs || soundrive_c_cs) && n_wr == 0)
			covox_data_r0 <= xd;
		if ((covox_cs || soundrive_d_cs) && n_wr == 0)
			covox_data_r1 <= xd;
	end
end

reg [10:0] snd_dac_l, snd_dac_r;
assign snd_l = snd_dac_l[10];
assign snd_r = snd_dac_r[10];
wire [9:0] snd_dac_next_l = covox_data_l0 + covox_data_l1 + {beeper, tape_out, tape_in, sd_miso, 4'b0000};
wire [9:0] snd_dac_next_r = covox_data_r0 + covox_data_r1 + {beeper, tape_out, tape_in, sd_miso, 4'b0000};
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		snd_dac_l <= 0;
		snd_dac_r <= 0;
	end
	else begin
		snd_dac_l <= snd_dac_l[9:0] + snd_dac_next_l;
		snd_dac_r <= snd_dac_r[9:0] + snd_dac_next_r;
	end
end
`ifdef USE_FPGA
	assign snd_parallel_l = snd_dac_next_l;
	assign snd_parallel_r = snd_dac_next_r;
`endif


/* JOYPAD/KEMPSTON */
wire [7:0] kempston_data = {1'b0, ~n_joy_b3, ~n_joy_b2, ~n_joy_b1, ~n_joy_up,
						~n_joy_down, ~n_joy_left, ~n_joy_right};
reg kempston_rd;
always @(posedge clk28)
	kempston_rd <= !extlock && n_ioreq == 0 && n_rd == 0 && xa[7:5] == 3'b000;


/* DIVMMC */
wire port_eb_cs = !extlock && n_ioreq == 0 && xa[7:0] == 8'hEB;
reg div_rd;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		div_rd <= 0;
	else
		div_rd <= n_rd == 0 && port_eb_cs;
end

reg conmem, mapram;
reg [3:0] divbank;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		divbank <= 0;
		mapram <= 0;
		conmem <= 0;
		sd_cs <= 1'b1;
	end
	else if (!extlock && n_ioreq == 0 && n_wr == 0) begin
		if (xa[7:0] == 8'hE3) begin
			divbank <= xd[3:0];
			mapram <= xd[6] | mapram;
			conmem <= xd[7];
		end
		if (xa[7:0] == 8'hE7) begin
			sd_cs <= xd[0];
		end
	end
end

reg automap_next;
reg automap;
always @(negedge clk28 or negedge rst_n) begin // negedge for timing of 3Dh entrypoint in turbo mode
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
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		divcnt <= 0;
	else if (port_eb_cs && (n_rd == 0 || n_wr == 0))
		divcnt <= 4'b1110;
	else if (divcnt_en && ck7)
		divcnt <= divcnt + 1'b1;
end

reg div_mosi_en;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		div_mosi_en <= 0;
	else if (port_eb_cs && n_wr == 0)
		div_mosi_en <= 1'b1;
	else if (!divcnt_en)
		div_mosi_en <= 0;
end

reg [7:0] divmmc_data;
assign sd_mosi = div_mosi_en? divmmc_data[7] : 1'b1;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		divmmc_data <= 0;
	else if (port_eb_cs && n_wr == 0)
		divmmc_data <= xd;
	else if (divcnt[3] == 1'b0)
		if (ck7)
			divmmc_data[7:0] <= {divmmc_data[6:0], sd_miso};
end

always @(posedge clk28)
	if (ck14)
		sd_sck <= ~sd_sck & ~divcnt[3];


/* ULAPLUS */
wire port_bf3b_cs = !extlock && n_ioreq == 0 && xa == 16'hbf3b;
wire port_ff3b_cs = !extlock && n_ioreq == 0 && xa == 16'hff3b;
reg port_ff3b_rd;
wire [7:0] port_ff3b_data = {7'b0000000, up_en};
reg [7:0] up_addr_reg;
reg up_write_req;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		port_ff3b_rd <= 1'b0;
		up_en <= 1'b0;
		up_write_req <= 1'b0;
		up_addr_reg <= 1'b0;
	end
	else begin
		port_ff3b_rd <= port_ff3b_cs && n_rd == 1'b0;
		if (n_wr == 1'b0) begin
			if (port_bf3b_cs)
				up_addr_reg <= xd;
			
			if (port_ff3b_cs) begin
				if (up_addr_reg == 8'b01000000)
					up_en <= xd[0];
				else if (up_addr_reg[7:6] == 2'b00)
					up_write_req <= 1'b1;
			end
		end
		else begin
			up_write_req <= 0;
		end
	end
	
end


/* MEMORY CONTROLLER */
wire divmap = automap | conmem;
wire div_ram = (conmem == 1 && xa[13] == 1) || (automap == 1 && xa[13] == 1) || (conmem == 0 && automap == 1 && mapram == 1);
wire div_ramwr_mask = xa[15] == 0 && xa[14] == 0 && (xa[13] == 0 || divbank == 4'b0011) && conmem == 0 && automap == 1 && mapram == 1;

reg romreq, ramreq, ramreq_wr;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		romreq <= 1'b0;
		ramreq <= 1'b0;
		ramreq_wr <= 1'b0;
	end
	else begin
		romreq =  n_mreq == 0 && n_rfsh == 1 &&  xa[14] == 0    && xa[15] == 0 &&   !div_ram && !(dffd_d4 && !divmap);
		ramreq = (n_mreq == 0 && n_rfsh == 1 && (xa[14] == 1'b1 || xa[15] == 1'b1 || div_ram ||  (dffd_d4 && !divmap))) || up_write_req;
		ramreq_wr = ramreq && n_wr == 0 && div_ramwr_mask == 0;
	end
end

assign n_romcs = (romreq && n_mreq == 0)? 1'b0 : 1'b1;
assign n_vrd = ((ramreq && n_rd == 0) || screen_read)? 1'b0 : 1'b1;
assign n_vwr = (ramreq_wr && n_wr == 0 && screen_read == 0)? 1'b0 : 1'b1;


`ifdef USE_FPGA
assign dout = port_ff_rd || port_fe_rd || kempston_rd || div_rd;
assign vdout = n_vrd == 1'b1;
`endif


reg [18:13] ram_a;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		ram_a <= 0;
	else
		ram_a <=
			divmap & ~xa[14] & ~xa[15] & xa[13]? {2'b00, divbank} :
			divmap & ~xa[14] & ~xa[15]? {2'b00, 4'b0011} :
			dffd_d3 & xa[15]? {2'b11, xa[14], xa[15], xa[14], xa[13]} :
			dffd_d3 & xa[14]? {rambank_ext, rambank128, xa[13]} :
			xa[15] & xa[14]? {rambank_ext, rambank128, xa[13]} :
			{2'b11, xa[14], xa[15], xa[14], xa[13]} ;
end

assign ra[16:14] =
	(extrom == 2'b01)? 3'b111 :
	(extrom[1] == 1'b1)? {extrom, rombank128} :
	divmap? 3'b011 :
	{2'b00, rombank128};

assign va[18:0] =
	screen_read && (up_ink_read || up_paper_read)? {13'b0111111111111, up_addr} :
	screen_read && snow? {3'b111, vbank, screen_addr[14:8], xa[7:0]} :
	screen_read? {3'b111, vbank, screen_addr} :
	up_write_req? {13'b0111111111111, up_addr_reg[5:0]} :
	{ram_a[18:13], xa[12:0]};

assign xd[7:0] =
	port_ff3b_rd? port_ff3b_data :
	div_rd? divmmc_data :
	kempston_rd? kempston_data :
	port_fe_rd? port_fe_data :
	port_ff_rd? port_ff_data :
	ramreq && n_rd == 0? vd :
	{8{1'bz}};

assign vd[7:0] =
	n_vrd == 0? {8{1'bz}} :
	xd;


endmodule
