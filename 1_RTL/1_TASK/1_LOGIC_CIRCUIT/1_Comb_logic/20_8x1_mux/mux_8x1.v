`timescale 1ns / 1ps

module mux_8x1 (
       i_I  ,
       i_S  ,
       o_Y
);
       input  [7:0]  i_I  ;
       input  [2:0]  i_S  ;
       output        o_Y  ;

       wire   [7:0]  w_I  ;
       wire   [2:0]  w_S  ;

       not n1 [2:0]  ( w_S , i_S );
       and a0        ( w_I[0], i_I[0], w_S[2], w_S[1], w_S[0] );
       and a1        ( w_I[1], i_I[1], w_S[2], w_S[1], i_S[0] );
       and a2        ( w_I[2], i_I[2], w_S[2], i_S[1], w_S[0] );
       and a3        ( w_I[3], i_I[3], w_S[2], i_S[1], i_S[0] );

       and a4        ( w_I[4], i_I[4], i_S[2], w_S[1], w_S[0] );
       and a5        ( w_I[5], i_I[5], i_S[2], w_S[1], i_S[0] );
       and a6        ( w_I[6], i_I[6], i_S[2], i_S[1], w_S[0] );
       and a7        ( w_I[7], i_I[7], i_S[2], i_S[1], i_S[0] );


       or  o1        ( o_Y, w_I[0], w_I[1], w_I[2], w_I[3], w_I[4], w_I[5], w_I[6], w_I[7]  );
  
endmodule
