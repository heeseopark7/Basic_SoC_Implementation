
`timescale 1ns/1ps
module multiplier_2x2_3 (
           i_A,
           i_B,
           o_P
);

           input   [1:0]  i_A  ;
           input   [1:0]  i_B  ;
           output  [3:0]  o_P  ;

           reg            w_P0  ; // P0만 따로 선언
           reg            w_1   ;
           reg            w_2   ;
           reg            w_4   ;
           
           always@(*) begin
           w_P0   = i_A[0] & i_B[0] ;
           w_1    = i_A[0] & i_B[1] ;
           w_2    = i_A[1] & i_B[0] ;
           w_4    = i_A[1] & i_B[1] ;
           end
           
           assign o_P[0] = w_P0     ; // o_P[0]와 w_P0 연결

           wire           w_3   ;
 
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
