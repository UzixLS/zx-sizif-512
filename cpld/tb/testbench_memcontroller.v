`timescale 1ns/1ps 

module testbench_memcontroller();
reg clk;
reg val;
reg rst_n;


always begin
  clk = 0;
  #1 clk = 1;
  #1;
end 

initial begin
  rst_n = 0;
  #2 rst_n = 1;
end

wire n_mreq = 0;
wire n_rfsh = 1;

reg [7:0] inputs;
wire a15 = inputs[0];
wire a14 = inputs[1];
wire a13 = inputs[2];
wire conmem = inputs[3];
wire mapram  = inputs[4];
wire automap = inputs[5];
wire dffd_cpm = inputs[6];
wire tb_end = inputs[7];


wire divmap = automap | conmem;
wire div_ram = (conmem == 1 && a13 == 1) || (automap == 1 && a13 == 1) || (conmem == 0 && automap == 1 && mapram == 1);

wire
		n_romcs0 = (n_mreq == 0 && n_rfsh == 1 &&  a14 == 0    && a15 == 0 && !div_ram && !(dffd_cpm && !divmap))? 1'b0 : 1'b1;
wire
		n_ramcs  = (n_mreq == 0 && n_rfsh == 1 && (a14 == 1'b1 || a15 == 1'b1 || div_ram || (dffd_cpm && !divmap)))? 1'b0 : 1'b1;

wire
		xn_romcs0 = (n_mreq == 0 && n_rfsh == 1 &&  a14 == 0    && a15 == 0 &&
			((conmem == 0 && automap == 0) || (a13 == 0 && conmem == 1) || (a13 == 0 && mapram == 0)))? 1'b0 : 1'b1;
wire
		xn_ramcs  = (n_mreq == 0 && n_rfsh == 1 && (a14 == 1'b1 || a15 == 1'b1 ||
				(conmem == 0 && automap == 1 && mapram == 1) ||
				(a13 == 1 && conmem == 1) ||
				(a13 == 1 && automap == 1)
			) )? 1'b0 : 1'b1;


always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		inputs <= 0;
	end
	else begin
		if( n_romcs0  != xn_romcs0 || n_ramcs != xn_ramcs )
			$display("xn_romcs=%x xn_ramcs=%x n_romcs=%x n_ramcs=%x a15=%x a14=%x a13=%x conmem=%x mapram=%x automap=%x dffd_cpm=%x",
					  xn_romcs0,  xn_ramcs,   n_romcs0,  n_ramcs,  a15,   a14,   a13,   conmem,   mapram,   automap,   dffd_cpm);
		if( tb_end )
			$finish;
		inputs <= inputs + 1'b1;
	end
end



endmodule
