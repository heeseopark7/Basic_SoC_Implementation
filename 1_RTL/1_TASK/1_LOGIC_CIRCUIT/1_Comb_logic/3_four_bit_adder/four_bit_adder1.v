`timescale 1ns / 1ps  
module four_bit_adder1 (
    i_a  ,
    i_b  ,
    i_c0 , 
    o_s  , 
    o_c4
);

    input   [3:0] i_a ;
    input   [3:0] i_b ;
    input         i_c0;
    output  [3:0] o_s ;
    output        o_c4;

    wire          c1  ;
    wire          c2  ;
    wire          c3  ;

    full_adder1 F1 (i_a[0], i_b[0], i_c0, o_s[0],   c1) ;
    full_adder1 F2 (i_a[1], i_b[1],   c1, o_s[1],   c2) ;
    full_adder1 F3 (i_a[2], i_b[2],   c2, o_s[2],   c3) ;
    full_adder1 F4 (i_a[3], i_b[3],   c3, o_s[3], o_c4) ; 

endmodule
