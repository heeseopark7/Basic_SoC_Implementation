mescale 1ns / 1ps
module FBA_with_CL1(
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

     and a0 [3:0] (w_G, i_A, i_B) ;
     xor x0 [3:0] (w_P, i_A, i_B) ;

     wire   [3:1]  w_C   ;
     carry_lookahead_generator1 CLG ( 
            .i_p   (w_P),
            .i_g   (w_G), 
            .i_c0  (i_C0),
            .o_c   (w_C)
     );
        
              wire w1, w2, w3, w4;
              and g1 (w1, i_C0, w_P[0], w_P[1], w_P[2], w_P[3]);
              and g2 (w2, w_G[0],       w_P[1], w_P[2], w_P[3]);
              and g3 (w3,               w_G[1], w_P[2], w_P[3]);
              and g4 (w4,                       w_G[2], w_P[3]);
              or  g5 (o_C4, w1, w2, w3, w4,     w_G[3]        );
              xor xs [3:0] (o_S, w_P,         {w_C[3:1], i_C0});
                                             
     endmodule
