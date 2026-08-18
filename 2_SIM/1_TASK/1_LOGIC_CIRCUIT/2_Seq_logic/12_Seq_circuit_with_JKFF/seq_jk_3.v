`timescale 1ns / 1ps

module seq_jk_3 (
           i_x   ,  
           i_Clk ,
           o_A   ,
           o_B
);

           input   i_x   ;
           input   i_Clk ;
           output  o_A   ;
           output  o_B   ;

           wire    w_JA  ;
           assign  w_JA = o_B        ;
           wire    w_KA  ;
           assign  w_KA = ~i_x & o_B ;
           wire    w_JB  ;
           assign  w_JB = ~i_x       ;
           wire    w_KB  ;
           assign w_KB = o_A  ^ i_x ;

           reg     o_A   ;
           reg     o_B   ;
           always@(posedge i_Clk) begin
           case ( {w_JA,w_KA} )
           2'b00 : o_A <= o_A  ;
           2'b01 : o_A <= 1'b0 ;
           2'b11 : o_A <= ~o_A ;
           2'b10 : o_A <= 1'b1 ;
           endcase
           
           case ( {w_JB,w_KB} )
           2'b00 : o_B <= o_B  ;
           2'b01 : o_B <= 1'b0 ;
           2'b11 : o_B <= ~o_B ;
           2'b10 : o_B <= 1'b1 ;
           endcase
           end
endmodule
