`timescale 1ns / 1ps  
  
module d_latch_2 (
                i_D  ,
                i_En ,
                o_Q  ,
                o_n_Q  
);  
  
         input  i_D   ;
         input  i_En  ;
         output o_Q   ;
         output o_n_Q ;  
  
         reg    o_Q   ;
         
         always@(*) begin
                if ( i_En ) begin
                   o_Q   =  i_D ;
                 
                end

         end
  
         assign o_n_Q = ~o_Q    ;
endmodule
