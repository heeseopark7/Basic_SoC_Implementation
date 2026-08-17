`timescale 1ns / 1ps
module half_adder1 (
    i_x,
    i_y,
    o_c,
    o_s            );

    input   i_x;
    input   i_y;
    output  o_c;
    output  o_s;

    xor (o_s, i_x, i_y); // o_s = i_x ^ i_y
    and (o_c, i_x, i_y); // o_c = i_x & i_y
endmodule
