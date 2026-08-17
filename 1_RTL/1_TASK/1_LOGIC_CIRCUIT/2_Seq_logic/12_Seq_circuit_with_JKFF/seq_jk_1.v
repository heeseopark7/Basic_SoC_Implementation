`timescale 1ns / 1ps

module seq_jk_1 (
           i_x   ,  
           i_Clk ,
           o_A   ,
           o_B
);

           input   i_x   ;
           input   i_Clk ;
           output  o_A   ;
           output  o_B   ;

           wire    w_Nx  ;
  not  n1  ( w_Nx , i_x );

           wire    w_KA  ;
  and  a1  ( w_KA , w_Nx, o_B );

           wire    w_KB  ;
  xor  x1  ( w_KB, o_A, i_x   );

  jk_ff_1 dut1 (
            .i_J    ( o_B   ),
            .i_K    ( w_KA  ),
            .i_Clk  ( i_Clk ),
            .o_Q    ( o_A   ),
            .o_NQ   (       )
);

  jk_ff_1 dut2 (
            .i_J    ( w_Nx  ),
            .i_K    ( w_KB  ),
            .i_Clk  ( i_Clk ),
            .o_Q    ( o_B   ),
            .o_NQ   (       )
);

endmodule
