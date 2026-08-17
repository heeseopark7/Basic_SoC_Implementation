`timescale 1ns / 1ps  
module d_ff_ms_3 ( // nededge trigger
                   i_D   ,
                   i_clk ,
                   o_Q  
);
       input       i_D   ;
       input       i_clk ;
       output      o_Q   ;
    
       reg         o_Q   ;   
    
       always@(negedge i_clk) begin
                   o_Q <= i_D ; // F/F은 non-blocking
       end
endmodule
