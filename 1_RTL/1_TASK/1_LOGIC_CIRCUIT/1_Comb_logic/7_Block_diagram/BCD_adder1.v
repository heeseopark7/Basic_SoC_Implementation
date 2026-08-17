`timescale 1ns/1ps
module BCD_adder1 (
     i_Add,
     i_Aug,
     i_C0,
     o_C,
     o_S
);
     input   [3:0]   i_Add  ;
     input   [3:0]   i_Aug  ;
     input           i_C0   ;
     output          o_C    ;
     output  [3:0]   o_S    ;
 
     wire    [3:0]  w_Z     ;
     wire           w_K     ;     
     four_bit_adder1 F1 (
     .i_a (i_Add),
     .i_b (i_Aug),
     .i_c0(i_C0) ,
     .o_c4(w_K)  ,
     .o_s (w_Z)
); 

      wire           w_W84 ;
      wire           w_W82 ;

      and a1 ( w_W84, w_Z[3], w_Z[2] )  ;
      and a2 ( w_W82, w_Z[3], w_Z[1] )  ;
      or  o1 ( o_C  , w_K, w_W84, w_W82);
     
      
      wire  [3:0]    w      ;
      buf b3 ( w[3] , 1'b0 );
      buf b2 ( w[2] , o_C  );
      buf b1 ( w[1] , o_C  );
      buf b0 ( w[0] , 1'b0 );

      four_bit_adder1 F2 (
     .i_a  (w   )    ,
     .i_b  (w_Z )    ,
     .i_c0 (1'b0)    ,
     .o_s  (o_S )    ,
     .o_c4 (    )      
);

endmodule
