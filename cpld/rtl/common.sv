package common;
    typedef enum { TIMINGS_PENT, TIMINGS_S128, TIMINGS_S48 } timings_t;
    typedef enum { TURBO_NONE, TURBO_7, TURBO_14 = 3 } turbo_t;
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
