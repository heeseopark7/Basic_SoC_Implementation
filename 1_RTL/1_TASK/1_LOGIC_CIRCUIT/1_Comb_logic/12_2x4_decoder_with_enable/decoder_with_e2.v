
`timescale 1ns / 1ps  
  
module decoder_with_e2 (
       i_A ,
       i_B ,
       i_E ,
       o_D
);

       input          i_A    ;
       input          i_B    ;
       input          i_E    ;
       output  [3:0]  o_D    ;

       wire           w_n_A  ;
       wire           w_n_B  ;
       wire           w_n_E  ;

       assign w_n_A = ~i_A   ;
       assign w_n_B = ~i_B   ;
       assign w_n_E = ~i_E   ;

       assign o_D[0] = ~( w_n_A & w_n_B & w_n_E ) ;
       assign o_D[1] = ~( w_n_A & i_B   & w_n_E ) ;
       assign o_D[2] = ~( i_A   & w_n_B & w_n_E ) ;
       assign o_D[3] = ~( i_A   & i_B   & w_n_E ) ;

endmodule
