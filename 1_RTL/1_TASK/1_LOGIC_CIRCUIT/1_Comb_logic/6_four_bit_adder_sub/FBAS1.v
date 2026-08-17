`timescale 1ns / 1ps
module FBAS1 (
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

     wire   [3:0] w_B  ;
     xor x1 [3:0]    (w_B, i_B, {4{i_M}});  // 복제 연산자 쓰기
     
     wire   [3:1] w_C  ;

     full_adder1 FA0 (i_A[0], w_B[0],i_M, o_S[0], w_C[1]);

     full_adder1 FA1 (i_A[1], w_B[1],w_C[1], o_S[1], w_C[2]);

     full_adder1 FA2 (i_A[2], w_B[2],w_C[2], o_S[2], w_C[3]);

     full_adder1 FA3 (i_A[3], w_B[3],w_C[3], o_S[3], o_C4);

     xor x2          (o_V, o_C4, w_C[3]);

endmodule
