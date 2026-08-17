`timescale 1ns / 1ps  
module d_ff_ms_1 ( // nededge trigger
                   i_D   ,
                   i_clk ,
                   o_Q  
);
       input       i_D   ;
       input       i_clk ;
       output      o_Q   ;

       wire        w_Y   ;

d_latch_1 uut1 ( 
                  .i_D  (i_D),
                  .i_En (i_clk),
                  .o_Q  (w_Y),
                  .o_n_Q ()
);

       wire        w_Nclk   ;
       not n1 ( w_Nclk , i_clk );
       
d_latch_1 uut2 (
                  .i_D  (w_Y),
                  .i_En (w_Nclk),
                  .o_Q  (o_Q),
                  .o_n_Q ()
);
  
endmodule
