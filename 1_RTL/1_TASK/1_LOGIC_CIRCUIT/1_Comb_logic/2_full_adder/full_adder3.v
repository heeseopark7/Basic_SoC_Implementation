`timescale 1ns / 1ps
module full_adder3 (
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

    reg      o_s;
    reg      o_c;
    always @(*) begin
    o_s = i_x ^ i_y ^ i_z ;
    o_c = (i_x & i_y) | (i_y & i_z) | (i_x & i_z) ;
    end

endmodule
