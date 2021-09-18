package common;
    typedef enum { MACHINE_S48, MACHINE_S128, MACHINE_S3, MACHINE_PENT } machine_t;
    typedef enum { TURBO_NONE, TURBO_4, TURBO_5, TURBO_7, TURBO_14 } turbo_t;
    typedef enum { PANNING_MONO, PANNING_ABC, PANNING_ACB } panning_t;
    typedef enum { DIVMMC_OFF, DIVMMC_ON, DIVMMC_NOOS } divmmc_t;
endpackage


interface cpu_bus();
    wire [15:0] a;
    wire [7:0] d;
    wire iorq;
    wire mreq;
    wire m1;
    wire rfsh;
    wire rd;
    wire wr;

    reg ioreq;
endinterface
