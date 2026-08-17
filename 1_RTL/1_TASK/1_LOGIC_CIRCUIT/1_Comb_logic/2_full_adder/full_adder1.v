`timescale 1ns / 1ps
module full_adder1 (
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

    wire     w1;
    xor x1 ( w1, i_x, i_y);

    wire     w2;
    and a1 ( w2, i_x, i_y);

    xor x2 ( o_s, w1, i_z);

    wire     w3;
    and a2 ( w3, w1, i_z );

    or     ( o_c, w3, w2 );

endmodule
