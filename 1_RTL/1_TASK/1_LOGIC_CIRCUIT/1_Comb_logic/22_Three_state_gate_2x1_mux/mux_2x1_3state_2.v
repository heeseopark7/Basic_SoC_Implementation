`timescale 1ns / 1ps
module mux_2x1_3state_2 (
               i_A  ,
               i_B  ,
               i_S  ,
               o_Y
);

      input    i_A   ;
      input    i_B   ;
      input    i_S   ;
      output   o_Y   ;

      wire     w_n_S ;

      assign   w_n_S = ~i_S           ;

      assign o_Y = w_n_S ? i_A : 1'bz ; 
      assign o_Y = i_S   ? i_B : 1'bz ;  
  
endmodule
