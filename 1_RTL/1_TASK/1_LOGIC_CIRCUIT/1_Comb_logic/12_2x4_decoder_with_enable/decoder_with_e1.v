
`timescale 1ns / 1ps  
  
module decoder_with_e1 (
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

       not   na ( w_n_A, i_A );
       not   nb ( w_n_B, i_B );
       not   ne ( w_n_E, i_E );

       nand  n0 ( o_D[0], w_n_A, w_n_B, w_n_E );
       nand  n1 ( o_D[1], w_n_A, i_B  , w_n_E );
       nand  n2 ( o_D[2], i_A  , w_n_B, w_n_E );
       nand  n3 ( o_D[3], i_A  , i_B  , w_n_E );

endmodule
