`define MAX(a,b) (a)>(b)?(a):(b)
`define MIN(a,b) (a)<(b)?(a):(b)

`define ISDEF(N)  (^(N) >= 0 === 1'b1 || ^(N) < 0 === 1'b1)          //"IS DEFined", is an
                //integer strictly defined; Xilinx warnings about "===" in synthesable
                //code - include in supression rules.
                //Why so complicated - I forgot :)

`define TZER(N)  (!`ISDEF(N) || (N) <= 0) ? 'hx : \
(~|((N)&'h7fff_ffff)?31:(~|((N)&'h3fff_ffff)?30: \
(~|((N)&'h1fff_ffff)?29:(~|((N)&'hfff_ffff)?28: \
(~|((N)&'h7ff_ffff)?27:(~|((N)&'h3ff_ffff)?26:(~|((N)&'h1ff_ffff)?25:(~|((N)&'hff_ffff)?24: \
(~|((N)&'h7f_ffff)?23:(~|((N)&'h3f_ffff)?22:(~|((N)&'h1f_ffff)?21:(~|((N)&'hf_ffff)?20: \
(~|((N)&'h7_ffff)?19:(~|((N)&'h3_ffff)?18:(~|((N)&'h1_ffff)?17:(~|((N)&'hffff)?16: \
(~|((N)&'h7fff)?15:(~|((N)&'h3fff)?14:(~|((N)&'h1fff)?13:(~|((N)&'hfff)?12: \
(~|((N)&'h7ff)?11:(~|((N)&'h3ff)?10:(~|((N)&'h1ff)?9:(~|((N)&'hff)?8: \
(~|((N)&'h7f)?7:(~|((N)&'h3f)?6:(~|((N)&'h1f)?5:(~|((N)&'hf)?4: \
(~|((N)&'h7)?3:(~|((N)&'h3)?2: \
(~N&'h1)))))))))))))))))))))))))))))))     //"Trailong ZERoes". ONLY FOR ARGUMENTS <= 32 BITS!
                //Maximum 2's power divider of a number. Both for synthesis and simulation; bit
                //selection is not used since N could be an expression.

`define CLOG2_CORE(N)  \
((N)&'h8000_0000 ?32:((N)&'h4000_0000 ?31:((N)&'h2000_0000 ?30:((N)&'h1000_0000 ?29: \
((N)&'h800_0000 ?28:((N)&'h400_0000 ?27:((N)&'h200_0000 ?26:((N)&'h100_0000 ?25: \
((N)&'h80_0000 ?24:((N)&'h40_0000 ?23:((N)&'h20_0000 ?22:((N)&'h10_0000 ?21: \
((N)&'h8_0000 ?20:((N)&'h4_0000 ?19:((N)&'h2_0000 ?18:((N)&'h1_0000 ?17: \
((N)&'h8000 ?16:((N)&'h4000 ?15:((N)&'h2000 ?14:((N)&'h1000 ?13: \
((N)&'h800 ?12:((N)&'h400 ?11:((N)&'h200 ?10:((N)&'h100 ?9: \
((N)&'h80 ?8:((N)&'h40 ?7:((N)&'h20 ?6:((N)&'h10 ?5: \
((N)&'h8 ?4:((N)&'h4 ?3:((N)&'h2 ?2: \
((N)&'h1))))))))))))))))))))))))))))))))    //"Core Ceil(LOG2(N+1))" for correctly defined
                //values (<= 32 bits). Both for synthesis and not; bit selection is not
                //used since N could be an expression.

`define HZ2NS(F) (1.0e9 / (F))                //Convert frequency [Hz] to delay in [ns].

`define ABS(X) ((X >= 0) ? (X) : (-X))                                //ABSolute value of X.

`define CLOG2(N)  ((!`ISDEF(N) || (N) <= 0) ? 'hx : `CLOG2_CORE((N)-1)) //"Ceil(LOG2(N))"
                //ONLY FOR ARGUMENTS <= 32 BITS! Ceil (nearest greater or equal integer) of
                //binary logarithm.

`define WIDINPAR(W)  ((W) >= 1 ? (W) : ((W) == 0 ? 1'b1 : 1'bx))        //"WIDth INdex from a
                //PARameter" ONLY FOR ARGUMENTS <= 32 BITS! High index of a bus from given
                //parameter, to avoid index "-1".
                //Ex.: bus with width W: "[widinpar(W)-1:0];"

`define WIDC(N)  (`ISDEF(N) && (N) == 0 ? 1 : `CLOG2((N) + 1))        //"WIDth Computation"
                //ONLY FOR ARGUMENTS <= 32 BITS! High index of a bus out of it's maximum
                //value (from 0).
                //Ex.: bus for holding numbers in range [0..N]: "wire [`WIDCF(N)-1:0] bus;"
                //Precision width of parameters: "localparam [`WIDCF(<expr>)-1:0] N = <expr>;"

`define WIDCN(N)  (`ISDEF(N) && ((N) == 0 || (N) == 1) ? 1 : `CLOG2(N)) //"WIDth Computation from N"
                //ONLY FOR ARGUMENTS <= 32 BITS!  High index of a bus out of number of it's
                //different values. Handy for computation of high index of a bus.
                //Ex.: coder with N inputs output: "output [`WIDCFN(N)-1:0] out;";
                //N-words RAM adress input: "input [`WIDCFN(N)-1:0] adr;"

`define URAND(MIN, MAX)  ((MAX) < (MIN) ? 1'bx :  (((MAX) == (MIN)) ? (MIN) : \
            (MIN + {$random} % ((MAX) - (MIN)))) )
                //Form an unsigned random value in the range [MIN..MAX-1];
                //"{}" makes unsigned.

`define POS_FMOD(A, B) A - B * ($rtoi((A + 0.0) / B) + $signed(A < 0))        //Positive fraction
                //modulo. Only for POSITIVE dividers!!!

`define ISHEXD(L)  (`ISDEF(L) && ((L) >= "A" && (L) <= "F" || (L) >= "a" && (L) <= "f" || \
                              (L) >= "0" && (L) <= "9"))    //IS byte a HEX Digit. x- and z-
                //bits are treated correctly.

`define ISHEXDX(L) (`ISHEXD(L) || \
                `ISDEF(L) && ((L) == "X" || (L) == "x"))    //IS byte a HEX Digit or X/x.

`define IS_DEC_INT_DIG(L)  ((L) >= "0" && (L) <= "9")          //Is a byte a valid decimal
                //integer digit.

`define HEXD2DEC(L)  (!`ISHEXD(L) ? \
                        0 : \
                        ((L) >= "a" ? (L) - "a" + 10 : \
                                     ((L) >= "A"  ? (L) - "A" + 10 : \
                                                    (L) - "0")))            //Convert
                //HEXadecimal Digit to decimal number, on all incorrect inputs returns 0.