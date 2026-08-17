`timescale 1ns / 1ps 

module seq_dff_3 (
           i_x,
           i_y,
           i_Clk,
           o_A
);

           input   i_x   ;
           input   i_y   ;
           input   i_Clk ;
           output  o_A   ;

           reg     o_A   ;
           always@(posedge i_Clk) begin
           o_A <= i_x ^ i_y ^ o_A;
           end
endmodule
