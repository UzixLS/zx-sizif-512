package common;
    typedef enum { MACHINE_S48, MACHINE_S128, MACHINE_S3, MACHINE_PENT } machine_t;
    typedef enum { TURBO_NONE, TURBO_4, TURBO_5, TURBO_7, TURBO_14 } turbo_t;
    typedef enum { PANNING_MONO, PANNING_ABC, PANNING_ACB } panning_t;
endpackage


interface cpu_bus();
    reg [15:0] a;
    reg [7:0] d;
    reg iorq;
    reg mreq;
    reg m1;
    reg rfsh;
    reg rd;
    reg wr;

    reg ioreq;
    reg ioreq_unmasked;
    reg mreq_rise;
endinterface
