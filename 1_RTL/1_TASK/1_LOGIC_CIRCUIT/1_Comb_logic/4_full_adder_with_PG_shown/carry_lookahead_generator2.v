`timescale 1ns / 1ps
module carry_lookahead_generator2(
    i_p,
    i_g,
    i_c0,
    o_c
);

    input  [2:0] i_p  ;
    input  [2:0] i_g  ;
    input        i_c0 ;
    output [3:1] o_c  ;

    assign o_c[1] = i_g[0] | (i_p[0]&i_c0  ) ;
    assign o_c[2] = i_g[1] | (i_p[1]&i_g[0]) | (i_p[1]&i_p[0]&i_c0) ;
    assign o_c[3] = i_g[2] | (i_p[2]&i_g[1]) | (i_p[2]&i_p[1]&i_g[0]) | (i_p[2]&i_p[1]&i_p[0]&i_c0) ;

endmodule
