`timescale 1ns / 1ps  
  
module mux_4x1_3state_1 (
               i_I  ,
               i_S  ,
               i_E  ,
               o_Y  
);  
  
       input   [3:0]   i_I  ;
       input   [1:0]   i_S  ;
       input           i_E  ;
       output          o_Y  ;
  
       wire    [3:0]   w_D  ;

       decoder_with_e1 dut (
                      .i_A ( i_S[1] ),
                      .i_B ( i_S[0] ),
                      .i_E ( i_E    ),
                      .o_D ( w_D    )
);

       bufif0  b1 [3:0]    ( o_Y , i_I , w_D ); // active-low(out, in, enable)

endmodule
