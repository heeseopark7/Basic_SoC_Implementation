`timescale 1ns / 1ps
module four_bit_adder3 (
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

    reg           o_c4;
    reg     [3:0] o_s ;
    
    always @(*) begin
    { o_c4, o_s } = i_a + i_b + i_c0 ;
    end
endmodule
