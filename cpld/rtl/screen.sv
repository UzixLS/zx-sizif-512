`include "util.vh"
import common::*;
module screen(
    input rst_n,
    input clk28,

    input timings_t timings,
    input [2:0] border,
    input up_en,

    output reg [2:0] r,
    output reg [2:0] g,
    output reg [1:0] b,
    output reg vsync,
    output reg hsync,
    output reg csync,

    input fetch_allow,
    output reg fetch,
    output fetch_up,
    output [14:0] addr,
    output [5:0] up_addr,
    input [7:0] fetch_data,

    output loading,
    output blink,
    output reg [7:0] attr_next,

    output [8:0] hc_out,
    output [8:0] vc_out,
    output reg [4:0] blink_cnt,
    output clk14,
    output clk7,
    output clk35,
    output ck14,
    output ck7,
    output ck35
);

/* SCREEN CONTROLLER */
localparam H_AREA         = 256;
localparam V_AREA         = 192;
localparam SCREEN_DELAY   = 8;

localparam H_LBORDER_S48  = 48 - SCREEN_DELAY;
localparam H_RBORDER_S48  = 48 + SCREEN_DELAY;
localparam H_BLANK1_S48   = 17;
localparam H_SYNC_S48     = 33;
localparam H_BLANK2_S48   = 46;
localparam H_TOTAL_S48    = H_AREA + H_RBORDER_S48 + H_BLANK1_S48 + H_SYNC_S48 + H_BLANK2_S48 + H_LBORDER_S48;
localparam V_BBORDER_S48  = 56;
localparam V_SYNC_S48     = 8;
localparam V_TBORDER_S48  = 56;
localparam V_TOTAL_S48    = V_AREA + V_BBORDER_S48 + V_SYNC_S48 + V_TBORDER_S48;

localparam H_LBORDER_S128 = 48 - SCREEN_DELAY;
localparam H_RBORDER_S128 = 48 + SCREEN_DELAY;
localparam H_BLANK1_S128  = 25;
localparam H_SYNC_S128    = 33;
localparam H_BLANK2_S128  = 46;
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

reg  [$clog2(`MAX(V_TOTAL_PENT, `MAX(V_TOTAL_S128, V_TOTAL_S48)))-1:0] vc;
reg  [$clog2(`MAX(H_TOTAL_PENT, `MAX(H_TOTAL_S128, H_TOTAL_S48)))+1:0] hc0;
wire [$clog2(`MAX(H_TOTAL_PENT, `MAX(H_TOTAL_S128, H_TOTAL_S48)))-1:0] hc = hc0[$bits(hc0)-1:2];

assign vc_out = vc;
assign hc_out = hc;

assign clk14 = hc0[0];
assign clk7 = hc0[1];
assign clk35 = hc0[2];
assign ck14 = hc0[0];
assign ck7 = hc0[0] & hc0[1];
assign ck35 = hc0[0] & hc0[1] & hc0[2];

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


assign blink = blink_cnt[$bits(blink_cnt)-1];
always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n)
        blink_cnt <= 0;
    else if (hc0_reset && vc_reset)
        blink_cnt <= blink_cnt + 1'b1;
end


wire [7:0] attr_border = {2'b00, border[2:0], 3'b000};

reg [7:0] bitmap, attr, bitmap_next;
reg [7:0] up_ink, up_paper, up_ink_next, up_paper_next;

reg [1:0] fetch_step;
wire fetch_bitmap   = fetch && fetch_step == 2'd0;
wire fetch_attr     = fetch && fetch_step == 2'd1;
wire fetch_up_ink   = fetch && fetch_step == 2'd2;
wire fetch_up_paper = fetch && fetch_step == 2'd3;
assign fetch_up = fetch_up_ink | fetch_up_paper;

assign addr = fetch_bitmap?
    { 2'b10, vc[7:6], vc[2:0], vc[5:3], hc[7:3] } :
    { 5'b10110, vc[7:3], hc[7:3] };
assign up_addr = fetch_up_ink?
    { attr_next[7:6], 1'b0, attr_next[2:0] } :
    { attr_next[7:6], 1'b1, attr_next[5:3] } ;

assign loading = (vc < V_AREA) && (hc < H_AREA || hc0_reset);
wire screen_show = (vc < V_AREA) && (hc0 >= (SCREEN_DELAY<<2) - 2) && (hc0 < ((H_AREA + SCREEN_DELAY)<<2) - 2);
wire screen_update = vc < V_AREA && hc <= H_AREA && hc != 0 && hc0[4:0] == 5'b11110;
wire border_update = !screen_show && ((timings == TIMINGS_PENT && ck7) || hc0[4:0] == 5'b11110);
wire bitmap_shift = hc0[1:0] == 2'b10;


always @(posedge clk28 or negedge rst_n) begin
    if (!rst_n) begin
        fetch <= 0;
        fetch_step <= 0;
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
            fetch <= (loading || up_en) && fetch_allow;
            if (fetch && fetch_step[0] && !up_en)
                fetch_step <= 0; // skip fetching ulaplus ink and paper
            else if (!loading && up_en)
                fetch_step <= 2'd3; // always fetch ulaplus paper in border area
            else if (hc0_reset || hc0[4:0] == 5'b11111)
                fetch_step <= 0;
            else if (fetch)
                fetch_step <= fetch_step + 1'b1;

            if (fetch_attr)
                attr_next <= fetch_data;
            else if (!loading)
                attr_next <= attr_border;
            if (fetch_bitmap)
                bitmap_next <= fetch_data;
            if (fetch_up_ink)
                up_ink_next <= fetch_data;
            if (fetch_up_paper)
                up_paper_next <= fetch_data;
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
        if (screen_update || (!screen_show && !loading))
            up_paper <= up_paper_next;
    end
end


/* RGBS generation */
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
    csync = ~(vsync0 ^ hsync0);
    vsync = vsync0;
    hsync = hsync0;
end


endmodule
