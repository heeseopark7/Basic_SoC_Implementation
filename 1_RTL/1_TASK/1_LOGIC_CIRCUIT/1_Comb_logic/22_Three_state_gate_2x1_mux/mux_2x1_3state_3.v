`timescale 1ns / 1ps
module mux_2x1_3state_3 (
               i_A  ,
               i_B  ,
               i_S  ,
               o_Y
);

      input    i_A   ;
      input    i_B   ;
      input    i_S   ;
      output   o_Y   ;

      reg      o_Y   ;
  
      always@(*) begin
             case (i_S)   //case문을 쓰기 때문에 w_n_S와 1'bz 사용할 필요 없음
             1'b0 : o_Y = i_A ; 
             1'b1 : o_Y = i_B ;
             endcase  
      end  

endmodule
