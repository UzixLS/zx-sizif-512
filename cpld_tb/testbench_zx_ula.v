`timescale 100ps/10ps 
module testbench_zx_ula();

reg rst_n;
reg clk32;
reg clk28;
reg clk14;


/* CPU */
wire clkcpu;
wire [15:0] a_cpu, a_cpu_cpu;
wire [7:0] d_cpu_o, d_cpu_i;
wire n_rd, n_rd_cpu;
wire n_wr, n_wr_cpu;
wire n_iorq, n_iorq_cpu;
wire n_mreq, n_mreq_cpu;
wire n_m1, n_m1_cpu;
wire n_rfsh, n_rfsh_cpu;
wire n_int;
wire n_nmi;

T80na cpu1(
    .RESET_n(rst_n),
    .CLK_n(clkcpu),
    .WAIT_n(1'b1),
    .INT_n(n_int),
    .NMI_n(n_nmi),
    .BUSRQ_n(1'b1),
    .M1_n(n_m1_cpu),
    .MREQ_n(n_mreq_cpu),
    .IORQ_n(n_iorq_cpu),
    .RD_n(n_rd_cpu),
    .WR_n(n_wr_cpu),
    .RFSH_n(n_rfsh_cpu),
    .A(a_cpu_cpu),
    .D_i(d_cpu_i),
    .D_o(d_cpu_o)
);


/* ULA */
wire [7:0] vd;
wire [18:0] va;
wire [16:14] ra;
wire m_romcs;
wire n_vrd;
wire n_vwr;
wire vaout;
wire vaout_7;
wire vdout;
wire n_iorqge;
reg n_magic;
reg fd_rdat;
reg vg_wd;
reg vg_tr43;
reg vg_sl;
reg vg_sr;
zx_ula zx_ula1(
    .rst_n(rst_n),
    .clk14(clk14),
    // .clk28(clk28),
    // .clk32(clk32),
    .clkcpu(clkcpu),
    .vd(vd),
    .va(va),
    .ra(ra),
    .a13(a_cpu[13]),
    .a14(a_cpu[14]),
    .a15(a_cpu[15]),
    .n_rd(n_rd),
    .n_wr(n_wr),
    .n_iorq(n_iorq),
    .n_mreq(n_mreq),
    .n_m1(n_m1),
    .n_rfsh(n_rfsh),
    .n_romcs(n_romcs),
    .n_vrd(n_vrd),
    .n_vwr(n_vwr),
    .n_int(n_int),
    .n_nmi(n_nmi),
    .n_iorqge_o(n_iorqge),
    .n_iorqge_i(n_iorqge),
    .n_magic(n_magic),
    .tape_in(1'b1),
    .kd(5'b0),
    .sd_cd(1'b0),
    .sd_miso(1'b0),
    .fd_rdat(fd_rdat),
    .vg_drq(1'b0),
    .vg_wf_de(1'b0),
    .vg_wd(vg_wd),
    .vg_tr43(vg_tr43),
    .vg_sl(vg_sl),
    .vg_sr(vg_sr),
    .vaout(vaout),
    .vaout_8(vaout_8),
    .vdout(vdout)
    );


/* MEMORY */
reg [7:0] rom [0:16383];
wire [13:0] rom_addr;
reg [13:0] rom_addr0;
wire [7:0] rom_q = rom[rom_addr0];
always @(posedge clk14) begin
    rom_addr0 <= rom_addr;
end
initial begin
    $readmemh("rom.mem", rom);
end

reg [7:0] ram [0:65535];
wire [15:0] ram_addr_a;
reg [15:0] ram_addr_a0;
wire [7:0] ram_q_a = ram[ram_addr_a0];

always @(posedge clk14) begin
    if (n_vwr == 0) begin
        ram[ram_addr_a] <= vd;
    end
    ram_addr_a0 <= ram_addr_a;
end
initial begin
    $readmemh("zero64.mem", ram);
end


/* BUS ARBITER */
assign rom_addr = {ra[14],a_cpu[13:0]};
assign ram_addr_a = va[15:0];

assign va =
   vaout_8? {{11{1'bz}}, a_cpu[7:0]} : 
   vaout? {19{1'bz}} :
   {{6{1'bz}}, a_cpu[12:0]};

assign vd =
    ~n_vrd? ram_q_a :
    vdout? {8{1'bz}} :
    ~n_wr? d_cpu_o :
    ~n_romcs? rom_q :
    {8{1'bz}};

assign d_cpu_i = 
    ~n_wr? d_cpu_o :
    ~n_romcs? rom_q :
    vd;


/* CPU SIGNALS (ideal timings) */
// assign n_rd = n_rd_cpu;
// assign n_wr = n_wr_cpu;
// assign n_iorq = n_iorq_cpu;
// assign n_mreq = n_mreq_cpu;
// assign n_m1 = n_m1_cpu;
// assign n_rfsh = n_rfsh_cpu;
// assign a_cpu = a_cpu_cpu;

/* CPU SIGNALS (Z84C0008 timings) */
assign #600 n_rd = n_rd_cpu; //TdCf(RDf)
assign #600 n_wr = n_wr_cpu; //TdCf(WRf)
assign #550 n_iorq = n_iorq_cpu; //TdCr(IORQf)
assign #600 n_mreq = n_mreq_cpu; //TdCf(MREQf)
assign #700 n_m1 = n_m1_cpu; //TdCr(M1f)
assign #950 n_rfsh = n_rfsh_cpu; //TdCr(RFSHf)
assign #800 a_cpu = a_cpu_cpu; //TdCr(A)

/* CPU SIGNALS (Z84C0004 timings) */
// assign #850 n_rd = n_rd_cpu; //TdCf(RDf)
// assign #800 n_wr = n_wr_cpu; //TdCf(WRf)
// assign #750 n_iorq = n_iorq_cpu; //TdCr(IORQf)
// assign #850 n_mreq = n_mreq_cpu; //TdCf(MREQf)
// assign #1000 n_m1 = n_m1_cpu; //TdCr(M1f)
// assign #1300 n_rfsh = n_rfsh_cpu; //TdCr(RFSHf)
// assign #1100 a_cpu = a_cpu_cpu; //TdCr(A)


/* SIMULATION SIGNALS */
initial begin
    n_magic = 1;
    #500000
    n_magic = 0;
    #500000
    n_magic = 1;
end

always begin
    fd_rdat = 1;
    #303000 fd_rdat = 0;
    #5000;
end 

always begin
    vg_wd = 0;
    vg_tr43 = 0;
    vg_sl = 0;
    vg_sr = 0;
    #303000
    vg_wd = 1;
    #4000
    vg_wd = 0;
    
    #300750
    vg_tr43 = 1;
    vg_sl = 1;
    #1250
    vg_wd = 1;
    #3500
    vg_sl = 0;
    vg_tr43 = 0;
    #500
    vg_wd = 0;

    #300750
    vg_tr43 = 1;
    vg_sr = 1;
    #1250
    vg_wd = 1;
    #3500
    vg_sr = 0;
    vg_tr43 = 0;
    #500
    vg_wd = 0;
end


/* CLOCKS & RESET */
initial begin
    rst_n = 0;
    #3000 rst_n = 1;
end

always begin
    clk14 = 0;
    #357 clk14 = 1;
    #358;
end 

always begin
    clk28 = 0;
    #178 clk28 = 1;
    #179;
end

always begin
    clk32 = 0;
    #156 clk32 = 1;
    #156;
end 


/* TESTBENCH CONTROL */
initial begin
    $dumpfile("testbench_zx_ula.vcd");
    $dumpvars();
    #5000000 $finish;
    //#21000000 $finish;
end


always @(clk14) begin
    // if (v > 100) $dumpoff;
    // if (~n_iorq) $dumpon;
    // if (v == 1 && ovf == 1) $finish;
end



endmodule
