
`timescale 1ns / 1ps

module FA_decoder1 (
       i_x  ,
       i_y  , 
       i_z  ,
       o_S  ,
       o_C
);

       input        i_x  ;
       input        i_y  ;
       input        i_z  ;
       output       o_S  ;
       output       o_C  ;

       wire  [7:0]  w_D  ;

       three_to_eight_decoder1 uut(
                   .i_x  (i_x) ,
                   .i_y  (i_y) ,
                   .i_z  (i_z) ,
                   .o_D  (w_D)
       );

       or S ( o_S, w_D[1], w_D[2], w_D[4], w_D[7] );
       or C ( o_C, w_D[3], w_D[5], w_D[6], w_D[7] );

endmodule
