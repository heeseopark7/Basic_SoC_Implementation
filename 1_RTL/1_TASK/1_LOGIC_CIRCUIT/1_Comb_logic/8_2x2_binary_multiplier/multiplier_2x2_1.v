`timescale 1ns/1ps
module multiplier_2x2_1 (
           i_A,
           i_B,
           o_P
);

           input   [1:0]  i_A  ;
           input   [1:0]  i_B  ;
           output  [3:0]  o_P  ;

           wire           w_1 ;
           wire           w_2 ;
           wire           w_3 ;
           wire           w_4 ;

           and a1 (o_P[0], i_A[0], i_B[0]);
           and a2 (w_1   , i_A[0], i_B[1]);
           and a3 (w_2   , i_A[1], i_B[0]);
           and a4 (w_4   , i_A[1], i_B[1]);

           half_adder1 HA1 (
           .i_x (w_2),
           .i_y (w_1),
           .o_c (w_3),
           .o_s (o_P[1])
           );

           half_adder1 HA2 (
           .i_x (w_4),
           .i_y (w_3),
           .o_c (o_P[3]),
           .o_s (o_P[2])
           );
           
endmodule
