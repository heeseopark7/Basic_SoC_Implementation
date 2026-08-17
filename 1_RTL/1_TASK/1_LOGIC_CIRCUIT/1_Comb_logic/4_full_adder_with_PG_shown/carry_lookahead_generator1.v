`timescale 1ns / 1ps
module carry_lookahead_generator1(
    i_p,
    i_g,
    i_c0,
    o_c
);

    input  [2:0] i_p  ;
    input  [2:0] i_g  ;
    input        i_c0 ;
    output [3:1] o_c  ;

    wire         w1                             ;
    and a1 ( w1, i_c0, i_p[0], i_p[1], i_p[2] ) ;
    wire         w2                             ;   
    and a2 ( w2, i_g[0], i_p[1], i_p[2]       ) ;
    wire         w3                             ;
    and a3 ( w3, i_g[1], i_p[2]               ) ;
    or  o1 ( o_c[3], w1, w2, w3, i_g[2]       ) ;
    wire         w4                             ;
    and a4 ( w4, i_c0, i_p[0], i_p[1]         ) ;
    wire         w5                             ;  
    and a5 ( w5, i_g[0], i_p[1]               ) ;
    or  o2 ( o_c[2], w4, w5, i_g[1]           ) ;
    wire         w6                             ;
    and a6 ( w6, i_c0, i_p[0]                 ) ;
    or  o3 (o_c[1], w6, i_g[0]                ) ;

endmodule
