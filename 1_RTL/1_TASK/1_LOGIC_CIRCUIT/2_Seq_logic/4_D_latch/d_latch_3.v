 `timescale 1ns / 1ps  
  
module d_latch_3 (
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
         reg    o_n_Q ;
 
         always@(*) begin
                if ( i_En ) begin
                   o_Q   =  i_D ;
                   o_n_Q = ~i_D ; // o_n_Q를 o_Q에 의존하지 않는게 좋음
                end

         end

endmodule
