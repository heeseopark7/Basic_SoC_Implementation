`timescale 1ns / 1ps  
  
module mux_4x1_3state_3 (
               i_I  ,
               i_S  ,
               i_E  ,
               o_Y  
);  
  
       input   [3:0]   i_I  ;
       input   [1:0]   i_S  ;
       input           i_E  ;
       output          o_Y  ;
 
       reg             o_Y  ;

       always@(*) begin
                  if ( !i_E) begin     // active-low
                  case ( i_S )
                  2'b00 : o_Y = i_I[0] ;
                  2'b01 : o_Y = i_I[1] ;
                  2'b10 : o_Y = i_I[2] ;
                  2'b11 : o_Y = i_I[3] ;
                  endcase
                  end
                  else
                          o_Y = 1'b0   ;
       end

endmodule
