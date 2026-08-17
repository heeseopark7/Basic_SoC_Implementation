`timescale 1ns / 1ps  
module d_ff_pe (
                   i_D   ,
                   i_clk ,
                   o_Q   ,
                   o_NQ  
);
       input       i_D   ;
       input       i_clk ;
       output      o_Q   ;
       output      o_NQ  ;
  
       reg         o_Q   ;
       
       always@(posedge i_clk) begin
                   o_Q <= i_D  ;
       end
       assign      o_NQ = ~o_Q ;

endmodule
