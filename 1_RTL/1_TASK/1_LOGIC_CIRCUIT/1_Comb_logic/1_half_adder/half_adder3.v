`timescale 1ns / 1ps
module half_adder3 (
    i_x,
    i_y,
    o_c,
    o_s            );

    input   i_x;
    input   i_y;
    output  o_c;
    output  o_s;

    reg     o_c;
    reg     o_s;

    always @(*) begin
        o_s = i_x ^ i_y ;
        o_c = i_x & i_y ;
    end
endmodule
