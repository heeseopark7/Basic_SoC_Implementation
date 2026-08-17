`timescale 1ns / 1ps
module full_adder2 (
    i_x, 
    i_y,
    i_z,
    o_s,
    o_c
);

    input    i_x;
    input    i_y;
    input    i_z;
    output   o_s;
    output   o_c;

    assign o_s = i_x ^ i_y ^ i_z ;
    assign o_c = (i_x & i_y) | (i_y & i_z) | (i_x & i_z) ;

endmodule
