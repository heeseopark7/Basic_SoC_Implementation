`timescale 1ns / 1ps
module mux_8x1_4input_2 (
               i_A  ,
               i_B  ,
               i_C  ,
               i_D  ,
               o_F  
);

       input   i_A   ;
       input   i_B   ;
       input   i_C   ;
       input   i_D   ;
       output  o_F   ;

       wire    w_n_D ;

       assign  w_n_D = ~i_D ;

       mux_8x1 uut (
               .i_I ( {1'b1, 1'b1, i_D, 1'b0, 1'b0, w_n_D, i_D, i_D} ),
               .i_S ( {i_A, i_B, i_C}                                ) ,
               .o_Y ( o_F                                            )
);


endmodule
