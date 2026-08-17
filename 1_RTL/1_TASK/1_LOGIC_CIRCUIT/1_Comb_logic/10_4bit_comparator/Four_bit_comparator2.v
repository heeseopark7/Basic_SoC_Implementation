`timescale 1ns / 1ps
module Four_bit_comparator2 (
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
       
       wire    [3:0]    w_x       ;
       assign w_x = ~(i_A ^ i_B)  ;
       
       wire    [3:0]    w_n_A     ;
       assign w_n_A = ~i_A        ;

       wire    [3:0]    w_n_B     ;
       assign w_n_B = ~i_B        ;

       wire    [3:0]    w_nAB     ;
       assign w_nAB = w_n_A & i_B ;

       wire    [3:0]    w_AnB ;
       assign w_AnB = i_A & w_n_B ;

       wire    [6:1]    w_g   ;
       assign w_g[6] = w_x[3] & w_nAB[2]                     ;
       assign w_g[5] = w_x[3] & w_AnB[2]                     ;
       assign w_g[4] = w_x[3] & w_x[2] & w_nAB[1]            ;
       assign w_g[3] = w_x[3] & w_x[2] & w_AnB[1]            ;
       assign w_g[2] = w_x[3] & w_x[2] & w_x[1] & w_nAB[0]   ;
       assign w_g[1] = w_x[3] & w_x[2] & w_x[1] & w_AnB[0]   ;
       
       assign o_EQ   = w_x[3] & w_x[2] & w_x[1] & w_x[0]     ;  // A = B
       assign o_LT   = w_nAB[3] | w_g[6] | w_g[4] | w_g[2]   ;  // A < B
       assign o_GT   = w_AnB[3] | w_g[5] | w_g[3] | w_g[1]   ;  // A > B

endmodule
