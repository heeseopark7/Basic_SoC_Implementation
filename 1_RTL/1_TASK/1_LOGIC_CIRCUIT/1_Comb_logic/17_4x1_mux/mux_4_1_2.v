`timescale 1ns / 1ps 
module mux_4_1_2 (
                  i_I ,
                  i_S ,
                  o_Y
);

       input  [3:0]  i_I   ;
       input  [1:0]  i_S   ;
       output        o_Y   ;

       wire   [1:0]  w_n_S ; 
       wire   [3:0]  w_I   ;

       assign        w_n_S[1] = ~i_S[1] ;
       assign        w_n_S[0] = ~i_S[0] ;

       assign        w_I[0]   = i_I[0] & w_n_S[1] & w_n_S[0]      ;
       assign        w_I[1]   = i_I[1] & w_n_S[1] & i_S[0]        ;
       assign        w_I[2]   = i_I[2] & i_S[1]   & w_n_S[0]      ;
       assign        w_I[3]   = i_I[3] & i_S[1]   & i_S[0]        ;

       assign        o_Y      = w_I[0] | w_I[1] | w_I[2] | w_I[3] ;

endmodule
