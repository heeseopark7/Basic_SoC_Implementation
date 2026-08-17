`timescale 1ns / 1ps
module FBAS3 (

     i_A,
     i_B,
     i_M,
     o_C4,
     o_V,
     o_S     );

     input  [3:0] i_A  ;
     input  [3:0] i_B  ;
     input        i_M  ;
     output       o_C4 ;
     output       o_V  ;
     output [3:0] o_S  ;

     reg    [3:0] w_B  ;
     always@(*) begin
     w_B = {4{i_M}} ^ i_B;
     end

     reg    [3:0] o_S  ;
     reg    [3:1] w_C  ;
     reg          o_C4 ;
     always@(*) begin
     {w_C[1], o_S[0]} = i_A[0] + w_B[0] + i_M;
     {w_C[2], o_S[1]} = i_A[1] + w_B[1] + w_C[1];
     {w_C[3], o_S[2]} = i_A[2] + w_B[2] + w_C[2];
     {o_C4  , o_S[3]} = i_A[3] + w_B[3] + w_C[3];
      end
  
      reg         o_V  ;
      always@(*) begin
      o_V = o_C4 ^ w_C[3];
      end


endmodule
