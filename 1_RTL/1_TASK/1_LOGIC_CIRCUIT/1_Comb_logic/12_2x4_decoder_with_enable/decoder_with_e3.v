
`timescale 1ns / 1ps  
  
module decoder_with_e3 (
       i_A ,
       i_B ,
       i_E ,
       o_D
);

       input          i_A    ;
       input          i_B    ;
       input          i_E    ;
       output  [3:0]  o_D    ;

       reg            w_n_A  ;
       reg            w_n_B  ;
       reg            w_n_E  ;

       always@(*) begin
              w_n_A = ~i_A   ;
              w_n_B = ~i_B   ;
              w_n_E = ~i_E   ;
       end

       reg     [3:0]  o_D    ;     
 
       always@(*) begin
              o_D[0] = ~( w_n_A & w_n_B & w_n_E ) ;
              o_D[1] = ~( w_n_A & i_B   & w_n_E ) ;
              o_D[2] = ~( i_A   & w_n_B & w_n_E ) ;
              o_D[3] = ~( i_A   & i_B   & w_n_E ) ;
       end

endmodule
