`timescale 1ns / 1ps
module FBA_with_CL2(
     i_A  ,
     i_B  ,
     i_C0 ,
     o_C4 ,
     o_S                                    );
     input  [3:0]  i_A   ;
     input  [3:0]  i_B   ;
     input         i_C0  ;
     output        o_C4  ;
     output [3:0]  o_S   ;

     wire   [3:0]  w_G   ;
     wire   [3:0]  w_P   ;
     assign w_G = i_A & i_B;
     assign w_P = i_A ^ i_B;

     wire   [3:1]  w_C   ;
     carry_lookahead_generator1 CLG ( 
            .i_p   (w_P),
            .i_g   (w_G), 
            .i_c0  (i_C0),
            .o_c   (w_C)
     );

     assign o_C4 = w_G[3] | (w_P[3]&w_G[2]) | (w_P[3]&w_P[2]&w_G[1]) | (w_P[3]&w_P[2]&w_P[1]&w_G[0]) | (w_P[3]&w_P[2]&w_P[1]&w_P[0]&i_C0);
     assign o_S  = w_P ^ {w_C[3:1], i_C0}; 

endmodule
