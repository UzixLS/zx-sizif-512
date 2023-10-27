import common::*;
module video(
    input rst_n,
    input clk28,

    input machine_t machine,
    input [2:0] border,
    input up_en,

    output reg [2:0] r,
    output reg [2:0] g,
    output reg [1:0] b,
    output reg vsync,
    output reg hsync,
    output reg csync,

    input read_allow,
    output reg read_req,
    output read_req_is_up,
    output [14:0] read_req_addr,
    output [5:0] read_req_up_addr,
    input [7:0] read_data,

    output contention,
    output reg even_line,
    output port_ff_active,
    output [7:0] port_ff_data,

    output [8:0] hc_out,
    output [8:0] vc_out,
    output clk14,
    output clk7,
    output clk35,
    output ck14,
    output ck7,
    output ck35,
    output clk25hz,
    output clk12_5hz,
    output clk6_25hz,
    output clk3_125hz,
    output clk1_5625hz
);

reg  [8:0] vc;
reg  [10:0] hc0;
wire [8:0] hc = hc0[10:2];
assign vc_out = vc;
assign hc_out = hc;

assign clk14 = hc0[0];
assign clk7 = hc0[1];
assign clk35 = hc0[2];
assign ck14 = hc0[0];
assign ck7 = hc0[0] & hc0[1];
assign ck35 = hc0[0] & hc0[1] & hc0[2];

reg [4:0] blink_cnt;
assign clk25hz = blink_cnt[0];
assign clk12_5hz = blink_cnt[1];
assign clk6_25hz = blink_cnt[2];
assign clk3_125hz = blink_cnt[3];
assign clk1_5625hz = blink_cnt[4];


/* SYNC SIGNALS */
localparam H_AREA         = 256;
localparam V_AREA         = 192;
localparam SCREEN_DELAY   = 13;

localparam H_LBORDER_S48  = 54 - SCREEN_DELAY;
localparam H_RBORDER_S48  = 53 + SCREEN_DELAY;
localparam H_BLANK1_S48   = 12;
localparam H_SYNC_S48     = 33;
localparam H_BLANK2_S48   = 40;
localparam H_TOTAL_S48    = H_AREA + H_RBORDER_S48 + H_BLANK1_S48 + H_SYNC_S48 + H_BLANK2_S48 + H_LBORDER_S48;
localparam V_BBORDER_S48  = 56;
localparam V_SYNC_S48     = 8;
localparam V_TBORDER_S48  = 56;
localparam V_TOTAL_S48    = V_AREA + V_BBORDER_S48 + V_SYNC_S48 + V_TBORDER_S48;

localparam H_LBORDER_S128 = 54 - SCREEN_DELAY;
localparam H_RBORDER_S128 = 53 + SCREEN_DELAY;
localparam H_BLANK1_S128  = 16;
localparam H_SYNC_S128    = 33;
localparam H_BLANK2_S128  = 44;
localparam H_TOTAL_S128   = H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128 + H_BLANK2_S128 + H_LBORDER_S128;
localparam V_BBORDER_S128 = 55;
localparam V_SYNC_S128    = 8;
localparam V_TBORDER_S128 = 56;
localparam V_TOTAL_S128   = V_AREA + V_BBORDER_S128 + V_SYNC_S128 + V_TBORDER_S128;

localparam H_LBORDER_PENT = 54 - SCREEN_DELAY;
localparam H_RBORDER_PENT = 53 + SCREEN_DELAY;
localparam H_BLANK1_PENT  = 12;
localparam H_SYNC_PENT    = 33;
localparam H_BLANK2_PENT  = 40;
localparam H_TOTAL_PENT   = H_AREA + H_RBORDER_PENT + H_BLANK1_PENT + H_SYNC_PENT + H_BLANK2_PENT + H_LBORDER_PENT;
localparam V_BBORDER_PENT = 56;
localparam V_SYNC_PENT    = 8;
localparam V_TBORDER_PENT = 64;
localparam V_TOTAL_PENT   = V_AREA + V_BBORDER_PENT + V_SYNC_PENT + V_TBORDER_PENT;

wire hc0_reset =
    (machine == MACHINE_S48)?
        hc0 == (H_TOTAL_S48<<2) - 1'b1 :
    (machine == MACHINE_S128 || machine == MACHINE_S3)?
        hc0 == (H_TOTAL_S128<<2) - 1'b1 :
    // Pentagon
        hc0 == (H_TOTAL_PENT<<2) - 1'b1 ;
wire vc_reset =
    (machine == MACHINE_S48)?
        vc == V_TOTAL_S48 - 1'b1:
    (machine == MACHINE_S128 || machine == MACHINE_S3)?
        vc == V_TOTAL_S128 - 1'b1 :
    // Pentagon
        vc == V_TOTAL_PENT - 1'b1 ;
wire hsync0 =
    (machine == MACHINE_S48)?
        (hc >= (H_AREA + H_RBORDER_S48 + H_BLANK1_S48)) && (hc < (H_AREA + H_RBORDER_S48 + H_BLANK1_S48 + H_SYNC_S48)) :
    (machine == MACHINE_S128 || machine == MACHINE_S3)?
        (hc >= (H_AREA + H_RBORDER_S128 + H_BLANK1_S128)) && (hc < (H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128)) :
    // Pentagon
        (hc >= (H_AREA + H_RBORDER_PENT + H_BLANK1_PENT)) && (hc < (H_AREA + H_RBORDER_PENT + H_BLANK1_PENT + H_SYNC_PENT)) ;
wire vsync0 =
    (machine == MACHINE_S48)?
        (vc >= (V_AREA + V_BBORDER_S48)) && (vc < (V_AREA + V_BBORDER_S48 + V_SYNC_S48)) :
    (machine == MACHINE_S128 || machine == MACHINE_S3)?
        (vc >= (V_AREA + V_BBORDER_S128)) && (vc < (V_AREA + V_BBORDER_S128 + V_SYNC_S128)) :
    // Pentagon
        (vc >= (V_AREA + V_BBORDER_PENT)) && (vc < (V_AREA + V_BBORDER_PENT + V_SYNC_PENT)) ;
wire blank =
    (machine == MACHINE_S48)?
        ((vc >= (V_AREA + V_BBORDER_S48)) && (vc < (V_AREA + V_BBORDER_S48 + V_SYNC_S48))) ||
            ((hc >= (H_AREA + H_RBORDER_S48)) &&
             (hc <  (H_AREA + H_RBORDER_S48 + H_BLANK1_S48 + H_SYNC_S48 + H_BLANK2_S48))) :
    (machine == MACHINE_S128 || machine == MACHINE_S3)?
        ((vc >= (V_AREA + V_BBORDER_S128)) && (vc < (V_AREA + V_BBORDER_S128 + V_SYNC_S128))) ||
            ((hc >= (H_AREA + H_RBORDER_S128)) &&
             (hc <  (H_AREA + H_RBORDER_S128 + H_BLANK1_S128 + H_SYNC_S128 + H_BLANK2_S128))) :
    // Pentagon
        ((vc >= (V_AREA + V_BBORDER_PENT)) && (vc < (V_AREA + V_BBORDER_PENT + V_SYNC_PENT))) ||
            ((hc >= (H_AREA + H_RBORDER_PENT)) &&
             (hc <  (H_AREA + H_RBORDER_PENT + H_BLANK1_PENT + H_SYNC_PENT + H_BLANK2_PENT))) ;

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

wire blink = blink_cnt[$bits(blink_cnt)-1];
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        blink_cnt <= 0;
    else if (hc0_reset && vc_reset)
        blink_cnt <= blink_cnt + 1'b1;
end

reg hsync0_delayed;
always @(posedge clk28)
    hsync0_delayed <= hsync0;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        even_line <= 0;
    else if (hsync0 && !hsync0_delayed)
        even_line <= ~even_line;
end


/* SCREEN CONTROLLER */
wire screen_show = (vc < V_AREA) && (hc0 >= (SCREEN_DELAY<<2) - 1) && (hc0 < ((H_AREA + SCREEN_DELAY)<<2) - 1);
wire screen_update = hc0[4:0] == 5'b10011;
wire border_update = (hc0[4:0] == 5'b10011) || (machine == MACHINE_PENT && ck7);
wire bitmap_shift = hc0[1:0] == 2'b11;
wire next_addr = hc0[4:0] == 5'b10001;

reg screen_read;
always @(posedge clk28)
    screen_read <= (vc < V_AREA) && (hc0 > 15) && (hc0 < (H_AREA<<2) + 17);

reg [7:0] vaddr;
reg [7:3] haddr;
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        vaddr <= 0;
        haddr <= 0;
    end
    else if (next_addr) begin
        vaddr <= vc[7:0];
        haddr <= hc[7:3];
    end
end

reg [7:0] bitmap, attr, bitmap_next, attr_next;
reg [7:0] up_ink, up_paper, up_ink_next, up_paper_next;

reg [1:0] read_step;
wire read_step_bitmap   = read_req && read_step == 2'd0;
wire read_step_attr     = read_req && read_step == 2'd1;
wire read_step_up_ink   = read_req && read_step == 2'd2;
wire read_step_up_paper = read_req && read_step == 2'd3;
assign read_req_is_up   = read_step_up_ink | read_step_up_paper;

assign read_req_addr = read_step_bitmap?
    { 2'b10, vaddr[7:6], vaddr[2:0], vaddr[5:3], haddr[7:3] } :
    { 5'b10110, vaddr[7:3], haddr[7:3] };
assign read_req_up_addr = read_step_up_ink?
    { attr_next[7:6], 1'b0, attr_next[2:0] } :
    { attr_next[7:6], 1'b1, attr_next[5:3] } ;

always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        read_req <= 0;
        read_step <= 0;
        attr_next <= 0;
        bitmap_next <= 0;
        up_ink_next <= 0;
        up_paper_next <= 0;
    end
    else if (ck14) begin
        if (read_req && read_step[0] && !up_en)
            read_step <= 0; // skip fetching ulaplus ink and paper
        else if (!screen_read && up_en)
            read_step <= 2'd3; // always fetch ulaplus paper in border area
        else if (next_addr)
            read_step <= 0;
        else if (read_req)
            read_step <= read_step + 1'b1;
        read_req <= (screen_read || up_en) && read_allow;

        if (read_step_attr)
            attr_next <= read_data;
        else if (!screen_read)
            attr_next <= {2'b00, border[2:0], border[2:0]};
        if (read_step_bitmap)
            bitmap_next <= read_data;
        else if (!screen_read)
            bitmap_next <= 0;
        if (read_step_up_ink)
            up_ink_next <= read_data;
        if (read_step_up_paper)
            up_paper_next <= read_data;
    end
end

always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        attr <= 0;
        bitmap <= 0;
        up_ink <= 0;
        up_paper <= 0;
    end
    else begin
        if (screen_show && screen_update)
            attr <= attr_next;
        else if (!screen_show && border_update)
            attr <= {2'b00, border[2:0], border[2:0]};

        if (screen_update)
            bitmap <= bitmap_next;
        else if (bitmap_shift)
            bitmap <= {bitmap[6:0], 1'b0};

        if (screen_update)
            up_ink <= up_ink_next;
        if (screen_update)
            up_paper <= up_paper_next;
    end
end


/* ATTRIBUTE PORT */
wire port_ff_attr = (machine == MACHINE_PENT) || hc[3:1] == 3'h6 || hc[3:1] == 3'h0;
wire port_ff_bitmap = (hc[3] && hc[1]);
assign port_ff_active = screen_read && (port_ff_attr || port_ff_bitmap);
assign port_ff_data =
    port_ff_attr? attr_next :
    port_ff_bitmap? bitmap_next :
    8'hFF;

assign contention = (vc < V_AREA) && (hc < H_AREA) && (hc[2] || hc[3]);


/* RGBS OUTPUT */
wire pixel = bitmap[7];
always @* begin
    if (blank)
        {g, r, b} = 0;
    else if (up_en) begin
        g = pixel? up_ink[7:5] : up_paper[7:5];
        r = pixel? up_ink[4:2] : up_paper[4:2];
        b = pixel? up_ink[1:0] : up_paper[1:0];
    end
    else begin
        {g[2], r[2], b[1]} = (pixel ^ (attr[7] & blink))? attr[2:0] : attr[5:3];
        {g[1], r[1], b[0]} = ((g[2] | r[2] | b[1]) & attr[6])? 3'b111 : 3'b000;
        {g[0], r[0]} = 2'b00;
    end
end

always @(posedge clk28) begin
    csync = ~(vsync0 ^ hsync0);
    vsync = vsync0;
    hsync = hsync0;
end


endmodule
