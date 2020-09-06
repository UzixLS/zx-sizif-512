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
	output n_nmi,

	input [4:0] kd,
	input tape_in,

	input n_magic,

	output reg [1:0] r,
	output reg [1:0] g,
	output reg [1:0] b,
	output reg csync,
	output reg hsync,
	output reg vsync,

	output reg ay_clk,
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
	output reg joy_sel,

	input sd_cd,
	input sd_miso,
	output sd_mosi,
	output reg sd_sck,
	output reg sd_cs,

	output reg plus3_drd,
	output reg plus3_dwr,
	output reg plus3_mtr
);


/* CONSTANTS */
`ifdef USE_FPGA
	localparam PULLUP1 = 1'b1;
`else
	localparam PULLUP1 = 1'bz;
`endif
localparam TIMINGS_PENT = 2'b00;
localparam TIMINGS_S128 = 2'b01;
localparam TIMINGS_S48  = 2'b11;
localparam TURBO_NONE   = 2'b00;
localparam TURBO_7      = 2'b01;
localparam TURBO_14     = 2'b11;


/* REGISTER DEFINITIONS */
reg [2:0] border;
reg magic_beeper;
reg [2:0] rambank128;
reg [1:0] timings;
reg [1:0] turbo;
wire clkwait;
reg pause;
reg up_en;

reg n_iorqge_delayed;
always @(posedge clk28)
	n_iorqge_delayed <= n_iorqge;
wire n_ioreq = ~n_m1 | n_iorqge | n_iorqge_delayed;


/* SCREEN CONTROLLER */
localparam H_AREA         = 256;
localparam V_AREA         = 192;
localparam SCREEN_DELAY   = 8;

localparam H_LBORDER_S48  = 48 - SCREEN_DELAY;
localparam H_RBORDER_S48  = 48 + SCREEN_DELAY;
localparam H_BLANK1_S48   = 16;
localparam H_SYNC_S48     = 33;
localparam H_BLANK2_S48   = 47;
localparam H_TOTAL_S48    = H_AREA + H_RBORDER_S48 + H_BLANK1_S48 + H_SYNC_S48 + H_BLANK2_S48 + H_LBORDER_S48;
localparam V_BBORDER_S48  = 48;
localparam V_SYNC_S48     = 8;
localparam V_TBORDER_S48  = 64;
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
wire ck35 = hc0[0] & hc0[1] && hc0[2];

wire hc0_reset =
	(timings == TIMINGS_PENT)?
		hc0 == (H_TOTAL_PENT<<2) - 1'b1 :
	(timings == TIMINGS_S128)?
		hc0 == (H_TOTAL_S128<<2) - 1'b1 :
	// 48K
		hc0 == (H_TOTAL_S48<<2) - 1'b1 ;
wire vc_reset = 
	(timings == TIMINGS_PENT)?
		vc == V_TOTAL_PENT - 1'b1 :
	(timings == TIMINGS_S128)?
		vc == V_TOTAL_S128 - 1'b1 :
	// 48K
		vc == V_TOTAL_S48 - 1'b1;
wire hsync0 =
	(timings == TIMINGS_PENT)?
		(hc >= (H_AREA + H_RBORDER_PENT + H_BLANK1_PENT)) &&
			(hc <  (H_AREA + H_RBORDER_PENT + H_BLANK1_PENT + H_SYNC_PENT)) :
	(timings == TIMINGS_S128)?
		(hc >= (H_AREA + H_RBORDER_S128 + H_BLANK1_S128)) &&
			(hc <  (H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128)) :
	// 48K
		(hc >= (H_AREA + H_RBORDER_S48 + H_BLANK1_S48)) &&
			(hc <  (H_AREA + H_RBORDER_S48 + H_BLANK1_S48 + H_SYNC_S48)) ;
wire vsync0 = 
	(timings == TIMINGS_PENT)?
		(vc >= (V_AREA + V_BBORDER_PENT)) && (vc < (V_AREA + V_BBORDER_PENT + V_SYNC_PENT)) :
	(timings == TIMINGS_S128)?
		(vc >= (V_AREA + V_BBORDER_S128)) && (vc < (V_AREA + V_BBORDER_S128 + V_SYNC_S128)) :
	// 48K
		(vc >= (V_AREA + V_BBORDER_S48)) && (vc < (V_AREA + V_BBORDER_S48 + V_SYNC_S48)) ;
wire blank =
	(timings == TIMINGS_PENT)?
		((vc >= (V_AREA + V_BBORDER_PENT)) && (vc < (V_AREA + V_BBORDER_PENT + V_SYNC_PENT))) ||
			((hc >= (H_AREA + H_RBORDER_PENT)) &&
			 (hc <  (H_AREA + H_RBORDER_PENT + H_BLANK1_PENT + H_SYNC_PENT + H_BLANK2_PENT))) :
	(timings == TIMINGS_S128)?
		((vc >= (V_AREA + V_BBORDER_S128)) && (vc < (V_AREA + V_BBORDER_S128 + V_SYNC_S128))) ||
			((hc >= (H_AREA + H_RBORDER_S128)) &&
			 (hc <  (H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128 + H_BLANK2_S128))) :
	// 48K
		((vc >= (V_AREA + V_BBORDER_S48)) && (vc < (V_AREA + V_BBORDER_S48 + V_SYNC_S48))) ||
			((hc >= (H_AREA + H_RBORDER_S48)) &&
			 (hc <  (H_AREA + H_RBORDER_S48 + H_BLANK1_S48 + H_SYNC_S48 + H_BLANK2_S48))) ;

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
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		blink_cnt <= 0;
	else if (hc0_reset && vc_reset)
		blink_cnt <= blink_cnt + 1'b1;
end

wire [7:0] attr_border = {2'b00, border[2] ^ ~sd_miso, border[1] ^ magic_beeper, border[0] ^ (pause & blink), 3'b000};

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
wire border_update = !screen_show && ((timings == TIMINGS_PENT && ck7) || hc0[4:0] == 5'b11110);
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


/* CONTENTION */
reg n_mreq_delayed, n_iorq_delayed;
always @(posedge clkcpu)
	n_mreq_delayed <= n_mreq;
always @(posedge clkcpu)
	n_iorq_delayed <= n_iorqge;
wire contention_mem_addr = xa[14] & (~xa[15] | (xa[15] & rambank128[0]));
wire contention_mem = n_iorq_delayed == 1'b1 && n_mreq_delayed == 1'b1 && contention_mem_addr;
wire contention_io = n_iorq_delayed == 1'b1 && n_iorqge == 0;
wire contention0 = screen_load && (hc[2] || hc[3]) && (contention_mem || contention_io);
wire contention = clkcpu && contention0 && turbo == TURBO_NONE && timings != TIMINGS_PENT;
wire snow = (timings != TIMINGS_PENT) && xa[14] && ~xa[15] && n_rfsh == 0;


/* CLOCK */
reg [2:0] turbo_wait;
wire turbo_wait_trig0 = n_rd == 0 || n_wr == 0;
reg turbo_wait_trig1;
always @(posedge clk28) begin
	turbo_wait_trig1 <= turbo_wait_trig0;
	turbo_wait[0] <= turbo == TURBO_14 && turbo_wait_trig0 && !turbo_wait_trig1;
	turbo_wait[1] <= turbo_wait[0] && (n_iorqge == 0);
	turbo_wait[2] <= turbo_wait[1];
end

reg clkcpu_prev;
wire clkcpu_ck = clkcpu && ! clkcpu_prev;
assign clkwait = pause || contention || (|turbo_wait);
always @(negedge clk28) begin
	clkcpu_prev <= clkcpu;
	clkcpu <= clkwait? clkcpu : (turbo == TURBO_14)? hc0[0] : (turbo == TURBO_7)? hc0[1] : hc[0];
end
assign n_clkcpu = ~clkcpu;


/* INT GENERATOR */
wire int_vector_rd = n_iorqge == 0 && n_m1 == 0;
wire [7:0] int_vector_data = 8'hff;

localparam INT_V_S48       = 247;
localparam INT_H_S48       = H_TOTAL_S48-6;
localparam INT_V_S128      = 247;
localparam INT_H_S128      = H_TOTAL_S128-6;
localparam INT_V_PENT      = 239;
localparam INT_H_PENT      = 316;
wire int_begin =
	(timings == TIMINGS_PENT)?
		vc == INT_V_PENT && hc == INT_H_PENT :
	(timings == TIMINGS_S128)?
		vc == INT_V_S128 && hc == INT_H_S128 :
	// 48K 
		vc == INT_V_S48 && hc == INT_H_S48 ;
reg [4:0] int0;
wire n_int_next = (|int0)? 1'b0 : 1'b1;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		int0 <= 0;
		n_int <= 1'b1;
	end
	else begin
		if (clkcpu_ck)
			n_int <= n_int_next;
		if ((int0 != 0 && clkcpu_ck) || (int0 == 0 && int_begin))
			int0 <= int0 + 1'b1;
	end
end


/* RESET */
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		n_rstcpu <= 0;
	else if (vc[0])
		n_rstcpu <= PULLUP1;
end


/* MAGIC */
reg magic_mode;
reg magic_map;
reg magic_unmap_next;
reg magic_map_next;
assign n_nmi = magic_mode? 1'b0 : PULLUP1;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		magic_mode <= 0;
		magic_map <= 0;
		magic_unmap_next <= 0;
		magic_map_next <= 0;
	end
	else begin
		if (n_magic == 0 && n_int == 1'b1 && n_int_next == 1'b0)
			magic_mode <= 1'b1;

		if (magic_map && n_mreq == 1'b0 && n_rd == 1'b0 && xa == 16'hf000 && !magic_map_next) begin
			magic_unmap_next <= 1'b1;
			magic_mode <= 1'b0;
		end
		else if (magic_map && n_mreq == 1'b0 && n_rd == 1'b0 && xa == 16'hf008) begin
			magic_unmap_next <= 1'b1;
			magic_map_next <= 1'b1;
		end
		else if (magic_unmap_next && n_mreq == 1'b1) begin
			magic_map <= 1'b0;
			magic_unmap_next <= 1'b0;
		end
		else if (magic_mode && n_m1 == 1'b0 && n_mreq == 1'b0 && (xa == 16'h0066 || magic_map_next)) begin
			magic_map <= 1'b1;
			magic_map_next <= 1'b0;
		end
	end
end


/* MAGIC CONFIG */
reg extlock;
reg rom_plus3;
reg rom_alt48;
wire config_cs = magic_map && n_ioreq == 0 && xa[7:0] == 8'hff;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		magic_beeper <= 0;
		extlock <= 0;
		timings <= TIMINGS_PENT;
		turbo <= TURBO_NONE;
		ay_abc <= 1'b1;
		ay_mono <= 0;
		rom_plus3 <= 0;
		rom_alt48 <= 0;
	end
	else if (config_cs && n_wr == 0) begin
		if (xa[15:12] == 4'h0)
 			magic_beeper <= xd[0];
		if (xa[15:12] == 4'h1)
 			extlock <= xd[0];
		if (xa[15:12] == 4'h2)
			timings <= xd[1:0];
		if (xa[15:12] == 4'h3)
			turbo <= xd[1:0];
		if (xa[15:12] == 4'h4)
			{ay_mono, ay_abc} <= xd[1:0];
		if (xa[15:12] == 4'h5)
			rom_plus3 <= xd[0];
		if (xa[15:12] == 4'h6)
			rom_alt48 <= xd[0];
	end
end


/* PORT #FF */
wire [7:0] port_ff_data = attr_next;
reg port_ff_rd;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		port_ff_rd <= 0;
	else
		port_ff_rd <= n_rd == 0 && n_ioreq == 0 && (timings != TIMINGS_PENT || xa[7:0] == 8'hFF) && screen_load;
end


/* PORT #FE */
wire port_fe_cs = n_ioreq == 0 && xa[0] == 0;
reg port_fe_rd;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		port_fe_rd <= 0;
	else
		port_fe_rd <= port_fe_cs && n_rd == 0;
end

wire [7:0] port_fe_data = {n_magic, tape_in, 1'b1, kd};
reg tape_out, beeper;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		beeper <= 0;
		tape_out <= 0;
		border <= 0;
	end
	else if (port_fe_cs && n_wr == 0 && clkcpu_ck) begin // clkcpu_ck to synchronize border
		beeper <= xd[4];
		tape_out <= xd[3];
		border <= xd[2:0];
	end
end


/* PORT #7FFD */
wire port_7ffd_cs = n_ioreq == 0 && xa[1] == 0 && xa[15] == 0 && xa[14] == 1'b1;
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


/* PORT #DFFD */
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
		ay_clk <= 0;
		ay_bc1 <= 0;
		ay_bdir <= 0;
	end
	else begin
		if (ck35)
			ay_clk = pause | ~ay_clk;
		ay_bc1  <= xa[15] == 1'b1 && xa[14] == 1'b1 && xa[1] == 0 && n_ioreq == 0;
		ay_bdir <= xa[15] == 1'b1 && xa[1] == 0 && n_ioreq == 0 && n_wr == 0;
	end
end


/* PORT #1FFD */
wire port_1ffd_cs = !extlock && n_ioreq == 0 && xa == 16'h1FFD;
reg [2:0] p1ffd;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		p1ffd <= 0;
		plus3_mtr <= 1'bz;
	end
	else if (port_1ffd_cs && n_wr == 0) begin
		p1ffd <= xd[2:0];
		plus3_mtr <= xd[3]? 1'b0 : 1'bz;
	end
end


/* PORTS #2FFD & #3FFD (+3DOS) */
wire port_2ffd_3ffd_cs = !extlock && n_ioreq == 0 && (xa == 16'h2FFD || xa == 16'h3FFD);
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n) begin
		plus3_dwr <= 1'b1;
		plus3_drd <= 1'b1;
	end
	else begin
		plus3_drd <= (n_rd == 0 && port_2ffd_3ffd_cs)? 1'b0 : 1'b1;
		plus3_dwr <= (n_wr == 0 && port_2ffd_3ffd_cs)? 1'b0 : 1'b1;
	end
end


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
wire [9:0] snd_dac_next_l = covox_data_l0 + covox_data_l1 + {beeper, tape_out ^ magic_beeper, tape_in, sd_miso, 4'b0000};
wire [9:0] snd_dac_next_r = covox_data_r0 + covox_data_r1 + {beeper, tape_out ^ magic_beeper, tape_in, sd_miso, 4'b0000};
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


/* JOYSTICK / GAMEPAD */
reg joy_up, joy_down, joy_left, joy_right, joy_b1, joy_b2, joy_b3, joy_x, joy_y, joy_z, joy_start, joy_mode;
reg joy_md, joy_md6;
wire joy_rd_ena = hc < 256 && vc[6:0] == 0; // every ~8ms
wire joy_rd_strobe = hc[4];
wire [2:0] joy_rd_state = hc[7:5]; // one step ~4.5us
always @(posedge clk28 or negedge rst_n) begin
	if (rst_n == 0) begin
		joy_md <= 0;
		joy_md6 <= 0;
		joy_up <= 0;
		joy_down <= 0;
		joy_left <= 0;
		joy_right <= 0;
		joy_b1 <= 0;
		joy_b2 <= 0;
		joy_b3 <= 0;
		joy_start <= 0;
		joy_mode <= 0;
		joy_x <= 0;
		joy_y <= 0;
		joy_z <= 0;
		pause <= 0;
	end
	else begin
		joy_sel <= (joy_rd_state[0] && joy_rd_ena)? 1'b1 : 1'b0;
		if (joy_rd_ena && joy_rd_strobe) begin
			if (joy_rd_state == 3'd2) begin
				if (n_joy_left == 0 && n_joy_right == 0) begin
					joy_md <= 1'b1;
					joy_b3 <= ~n_joy_b1;
					if (joy_start == 1'b0 && n_joy_b2 == 1'b0)
						pause <= ~pause;
					joy_start <= ~n_joy_b2;
				end
				else begin
					joy_md <= 0;
					joy_b3 <= 0;
					joy_start <= 0;
				end
			end
			else if (joy_rd_state == 3'd3) begin
				joy_up <= ~n_joy_up;
				joy_down <= ~n_joy_down;
				joy_left <= ~n_joy_left;
				joy_right <= ~n_joy_right;
				joy_b1 <= ~n_joy_b1;
				joy_b2 <= ~n_joy_b2;
			end
			else if (joy_rd_state == 3'd4) begin
				joy_md6 <= joy_md && n_joy_up == 0 && n_joy_down == 0;
			end
			else if (joy_rd_state == 3'd5) begin
				if (joy_md6) begin
					joy_mode <= ~n_joy_right;
					joy_x <= ~n_joy_left;
					joy_y <= ~n_joy_down;
					joy_z <= ~n_joy_up;
				end
				else begin
					joy_mode <= 0;
					joy_x <= 0;
					joy_y <= 0;
					joy_z <= 0;
				end
			end
		end
	end
end

wire joy_b1_turbo = joy_b1 | (joy_y & blink_cnt[1]);
wire joy_b2_turbo = joy_b2 | (joy_z & blink_cnt[1]);
wire joy_b3_turbo = joy_b3 | (joy_x & blink_cnt[1]);

wire [7:0] kempston_data = {1'b0, joy_b3_turbo, joy_b2_turbo, joy_b1_turbo, joy_up, joy_down, joy_left, joy_right};
reg kempston_rd;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		kempston_rd <= 0;
	else
		kempston_rd <= !extlock && n_ioreq == 0 && n_rd == 0 && xa[7:5] == 3'b000;
end


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
	else if (n_m1 == 0 && n_mreq == 0 && magic_map == 0) begin 
		if (sd_cd || extlock || dffd_d4 || p1ffd[0]) begin
			automap_next <= 0;
		end
		else if (xa[15:3] == 13'h3FF) begin // exit vectors 1FF8-1FFF
			automap_next <= 0;
		end
		else if (
				xa == 16'h0000 || // power-on/reset/rst0/software restart
				xa == 16'h0008 || // syntax error
				xa == 16'h0038 || // im1 interrupt/rst #38
				(xa == 16'h0066 && !magic_mode) || // nmi routine
				xa == 16'h04C6 || // tape save routine
				xa == 16'h0562    // tape load and verify routine
				) begin
			automap_next <= 1'b1;
		end
		else if (xa[15:8] == 8'h3D) begin // tr-dos mapping area
			automap_next <= 1'b1;
			automap <= 1'b1;
		end
	end
	else if (n_m1 == 1'b1) begin
		automap <= automap_next;
	end
end

reg [3:0] divcnt;
wire divcnt_en = ~divcnt[3] | divcnt[2] | divcnt[1] | divcnt[0];
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		divcnt <= 0;
	else if (port_eb_cs && (n_rd == 0 || n_wr == 0))
		divcnt <= 4'b1110;
	else if (divcnt_en && ck14)
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
		if (ck14)
			divmmc_data[7:0] <= {divmmc_data[6:0], sd_miso};
end

always @(posedge clk28)
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
		romreq = 1'b0;
		ramreq = 1'b0;
		ramreq_wr = 1'b0;
	end
	else begin
		romreq =  n_mreq == 0 && n_rfsh == 1 &&  xa[14] == 0    && xa[15] == 0 &&
			(magic_map || (!div_ram && divmap) || (!div_ram && !dffd_d4 && !p1ffd[0]));
		ramreq = (n_mreq == 0 && n_rfsh == 1 && !romreq) || up_write_req;
		ramreq_wr = ramreq && n_wr == 0 && div_ramwr_mask == 0;
	end
end

assign n_romcs = (romreq && n_mreq == 0)? 1'b0 : 1'b1;
assign n_vrd = ((ramreq && n_rd == 0) || screen_read)? 1'b0 : 1'b1;
assign n_vwr = (ramreq_wr && n_wr == 0 && screen_read == 0)? 1'b0 : 1'b1;


`ifdef USE_FPGA
assign dout = port_ff_rd || port_fe_rd || kempston_rd || div_rd || port_ff3b_rd || (ramreq && n_rd == 0) || int_vector_rd;
assign vdout = n_vrd == 1'b1;
`endif


reg [18:13] ram_a;
always @(posedge clk28 or negedge rst_n) begin
	if (!rst_n)
		ram_a <= 0;
	else
		ram_a <=
			magic_map & xa[15] & xa[14]? {2'b00, 3'b111, xa[13]} :
			magic_map? {3'b111, vbank, xa[14:13]} :
			divmap & ~xa[14] & ~xa[15] & xa[13]? {2'b01, divbank} :
			divmap & ~xa[14] & ~xa[15]? {2'b01, 4'b0011} :
			dffd_d3 & xa[15]? {2'b11, xa[14], xa[15], xa[14], xa[13]} :
			dffd_d3 & xa[14]? {rambank_ext, rambank128, xa[13]} :
			(p1ffd[2] == 1'b0 && p1ffd[0] == 1'b1)? {2'b11, p1ffd[1], xa[15], xa[14], xa[13]} :
			(p1ffd == 3'b101)? {2'b11, ~(xa[15] & xa[14]), xa[15], xa[14]} :
			(p1ffd == 3'b111)? {2'b11, ~(xa[15] & xa[14]), (xa[15] | xa[14]), xa[14]} :
			xa[15] & xa[14]? {rambank_ext, rambank128, xa[13]} :
			{2'b11, xa[14], xa[15], xa[14], xa[13]} ;
end

assign ra[16:14] =
	magic_map? 3'd2 :
	divmap? 3'd3 :
	(rom_plus3 && p1ffd[2] == 1'b0 && rombank128 == 1'b0)? 3'd4 :
	(rom_plus3 && p1ffd[2] == 1'b0 && rombank128 == 1'b1)? 3'd5 :
	(rom_plus3 && p1ffd[2] == 1'b1 && rombank128 == 1'b0)? 3'd6 :
	(rombank128 == 1'b1 && rom_alt48 == 1'b1)? 3'd7 :
	(rombank128 == 1'b1)? 3'd1 :
	3'd0;

assign va[18:0] =
	screen_read && (up_ink_read || up_paper_read)? {2'b00, 3'b111, 8'b11111111, up_addr} :
	screen_read && snow? {3'b111, vbank, screen_addr[14:8], xa[7:0]} :
	screen_read? {3'b111, vbank, screen_addr} :
	up_write_req? {2'b00, 3'b111, 8'b11111111, up_addr_reg[5:0]} :
	{ram_a[18:13], xa[12:0]};

assign xd[7:0] =
	port_ff3b_rd? port_ff3b_data :
	div_rd? divmmc_data :
	kempston_rd? kempston_data :
	port_fe_rd? port_fe_data :
	port_ff_rd? port_ff_data :
	ramreq && n_rd == 0? vd :
	int_vector_rd? int_vector_data :
	{8{1'bz}};

assign vd[7:0] =
	n_vrd == 0? {8{1'bz}} :
	xd;


endmodule
