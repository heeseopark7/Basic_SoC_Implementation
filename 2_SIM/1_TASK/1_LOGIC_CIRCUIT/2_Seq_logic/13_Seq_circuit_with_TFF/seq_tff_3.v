`timescale 1ns / 1ps  
module seq_tff_3 (
         i_x    ,
         i_Clk  ,
         i_nRst ,
         o_y
);  
  
         input    i_x    ;
         input    i_Clk  ;
         input    i_nRst ;
         output   o_y    ;
	
         wire     w_TA 	 ;
	 reg	  w_By	 ;
         assign   w_TA = i_x & w_By ;

         reg      w_Ay  ;
         always@( posedge i_Clk or negedge i_nRst ) begin
         if (!i_nRst) begin
                  w_Ay <= 1'b0;
                  w_By <= 1'b0;
         end
         else begin
              case (w_TA)
              1'b0 : w_Ay <=  w_Ay  ;
              1'b1 : w_Ay <= ~w_Ay  ;
              endcase
         
              case (i_x)
              1'b0 : w_By <=  w_By ;
              1'b1 : w_By <= ~w_By ;
              endcase
         end
         end

         assign    o_y = w_Ay & w_By ;
endmodule
