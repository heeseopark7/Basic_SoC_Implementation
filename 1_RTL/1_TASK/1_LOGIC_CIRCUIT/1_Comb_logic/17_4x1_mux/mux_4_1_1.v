`timescale 1ns / 1ps 
module mux_4_1_1 (
                  i_I ,
                  i_S ,
                  o_Y
);

       input  [3:0]  i_I   ;
       input  [1:0]  i_S   ;
       output        o_Y   ;

       wire   [1:0]  w_n_S ; 
       wire   [3:0]  w_I   ;

       not  n0  ( w_n_S[0] , i_S[0] );
       not  n1  ( w_n_S[1] , i_S[1] );

       and  a0  ( w_I[0]   , i_I[0] , w_n_S[1] , w_n_S[0]          );
       and  a1  ( w_I[1]   , i_I[1] , w_n_S[1] , i_S[0]            );
       and  a2  ( w_I[2]   , i_I[2] , i_S[1]   , w_n_S[0]          );
       and  a3  ( w_I[3]   , i_I[3] , i_S[1]   , i_S[0]            );

       or   o1  ( o_Y      , w_I[0] , w_I[1]   , w_I[2]   , w_I[3] );
endmodule
