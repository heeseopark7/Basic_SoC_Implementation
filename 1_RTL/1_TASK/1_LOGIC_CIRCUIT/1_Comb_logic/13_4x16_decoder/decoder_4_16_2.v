`timescale 1ns / 1ps
module decoder_4_16_2(
        i_x  , 
        i_y  ,
        i_z  ,
        i_w  ,
        o_D
);

        input              i_x   ;
        input              i_y   ;
        input              i_z   ;
        input              i_w   ;
        output  [15:0]     o_D   ;

        wire         w_n_w ;
        
        assign       w_n_w = ~i_w ;
        
        three_to_eight_decoder4   d1 (
                      .i_x (i_x)     ,
                      .i_y (i_y)     ,
                      .i_z (i_z)     ,
                      .i_E (w_n_w)   ,
                      .o_D (o_D[7:0])
        );              

        three_to_eight_decoder4   d2 (
                      .i_x (i_x)     ,
                      .i_y (i_y)     ,
                      .i_z (i_z)     ,
                      .i_E (i_w)     ,
                      .o_D (o_D[15:8])
        );              

endmodule
