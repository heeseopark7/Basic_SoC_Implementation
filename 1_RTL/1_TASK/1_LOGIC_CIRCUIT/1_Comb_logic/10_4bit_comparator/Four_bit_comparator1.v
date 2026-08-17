`timescale 1ns / 1ps
module Four_bit_comparator1 (
       i_A   ,
       i_B   ,
       o_LT  , // A<B
       o_GT  , // A>B
       o_EQ    // A=B
);

       input   [3:0]    i_A  ;
       input   [3:0]    i_B  ;
       output           o_LT ;
       output           o_GT ;
       output           o_EQ ;
       
       wire    [3:0]    w_x  ;
       xnor x  [3:0]  ( w_x, i_A, i_B                 );
       
       wire    [3:0]    w_n_A ;
       not  na [3:0]  ( w_n_A, i_A                    );

       wire    [3:0]    w_n_B ;
       not  nb [3:0]  ( w_n_B, i_B                    );

       wire    [3:0]    w_nAB ;
       and  a  [3:0]  ( w_nAB, w_n_A, i_B             );

       wire    [3:0]    w_AnB ;
       and  b  [3:0]  ( w_AnB, i_A, w_n_B             );

       wire    [6:1]    w_g   ;
       and  g6        ( w_g[6], w_x[3], w_nAB[2]                 );
       and  g5        ( w_g[5], w_x[3], w_AnB[2]                 );
       and  g4        ( w_g[4], w_x[3], w_x[2], w_nAB[1]         );
       and  g3        ( w_g[3], w_x[3], w_x[2], w_AnB[1]         );
       and  g2        ( w_g[2], w_x[3], w_x[2], w_x[1], w_nAB[0] );
       and  g1        ( w_g[1], w_x[3], w_x[2], w_x[1], w_AnB[0] );
       
       and  g0        ( o_EQ, w_x[3], w_x[2], w_x[1], w_x[0]     );  // A = B
       or   o1        ( o_LT, w_nAB[3], w_g[6], w_g[4], w_g[2]   );  // A < B
       or   o2        ( o_GT, w_AnB[3], w_g[5], w_g[3], w_g[1]   );  // A > B

endmodule

