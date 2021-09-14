module rgb (
    input clk28,
    input strobe,

    input up_en,

    input [2:0] r_i,
    input [2:0] g_i,
    input [1:0] b_i,

    output reg [1:0] r_o,
    output reg [1:0] g_o,
    output reg [1:0] b_o
);


`ifdef REV_C
function [1:0] color_2to2; input [1:0] in;
    case (in)
        2'b00: color_2to2 = 2'b00; // 0mV
        2'b01: color_2to2 = 2'b10; // 343mV
        2'b10: color_2to2 = strobe? 2'b10 : 2'bz1;
        2'b11: color_2to2 = 2'b11; // 675mV
    endcase
endfunction
function [1:0] color_3to2; input [2:0] in;
    case (in)
        3'b000: color_3to2 = 2'b00; // 0mV
        3'b001: color_3to2 = strobe? 2'b00 : 2'b10;
        3'b010: color_3to2 = 2'bz1; // 237mV
        3'b011: color_3to2 = 2'b10; // 343mV
        3'b100: color_3to2 = strobe? 2'b10 : 2'bz1;
        3'b101: color_3to2 = 2'b1z; // 505mV
        3'b110: color_3to2 = strobe? 2'bz1 : 2'b1z;
        3'b111: color_3to2 = 2'b11; // 675mV
    endcase
endfunction
`endif


`ifdef REV_D
function [1:0] color_2to2; input [1:0] in;
    case (in)
        2'b00: color_2to2 = 2'b00;
        2'b01: color_2to2 = strobe? 2'b10 : 2'b0z;
        2'b10: color_2to2 = strobe? 2'b1z : 2'bz0;
        2'b11: color_2to2 = 2'b11;
    endcase
endfunction
function [1:0] color_3to2; input [2:0] in;
    case (in)
        3'b000: color_3to2 = 2'b00;
        3'b001: color_3to2 = strobe? 2'bz1 : 2'bzz;
        3'b010: color_3to2 = strobe? 2'b1z : 2'b00;
        3'b011: color_3to2 = strobe? 2'b11 : 2'b00;
        3'b100: color_3to2 = strobe? 2'b10 : 2'bzz;
        3'b101: color_3to2 = 2'b10;
        3'b110: color_3to2 = strobe? 2'b11 : 2'b10;
        3'b111: color_3to2 = 2'b11;
    endcase
endfunction
`endif


always @(posedge clk28) begin
    if (up_en) begin
        g_o = color_3to2(g_i);
        r_o = color_3to2(r_i);
        b_o = color_2to2(b_i);
    end
    else begin
        {g_o[1], r_o[1], b_o[1]} = {g_i[2], r_i[2], b_i[1]};
        `ifdef REV_C
            {g_o[0], r_o[0], b_o[0]} = {g_i[1]? 1'b1 : 1'bz, r_i[1]? 1'b1 : 1'bz, b_i[0]? 1'b1 : 1'bz};
        `else
            {g_o[0], r_o[0], b_o[0]} = {g_i[1], r_i[1], b_i[0]};
        `endif
    end
end


endmodule
