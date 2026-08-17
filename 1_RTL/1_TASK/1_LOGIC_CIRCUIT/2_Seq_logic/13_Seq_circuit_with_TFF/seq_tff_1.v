`timescale 1ns / 1ps  
module seq_tff_1 (
         i_x   ,
         i_Clk ,
         i_rst ,
         o_y
);  
  
         input    i_x   ;
         input    i_Clk ;
         input    i_rst ;
         output   o_y   ;

         wire     w_TA  ;
         wire     w_By  ;
         and a1 ( w_TA , i_x , w_By );

         wire     w_Ay  ;
         tff_rst dut1 (
                 .i_T    ( w_TA  ),
                 .i_Clk  ( i_Clk ),
                 .i_nRst ( i_rst ),
                 .o_Q    ( w_Ay )
);

         tff_rst dut2 (
                 .i_T    ( i_x   ),
                 .i_Clk  ( i_Clk ),
                 .i_nRst ( i_rst ),
                 .o_Q    ( w_By )
);

         and a2 ( o_y , w_Ay , w_By );
endmodule  
