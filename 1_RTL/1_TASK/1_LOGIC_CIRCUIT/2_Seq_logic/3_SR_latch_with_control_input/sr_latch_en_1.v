`timescale 1ns / 1ps
module sr_latch_en_1 ( // gate-level
                 i_S   ,
                 i_R   ,
                 i_En  ,
                 o_Q   ,
                 o_Q_n 
);
       input     i_S   ;
       input     i_R   ;
       input     i_En  ;
       output    o_Q   ;
       output    o_Q_n ;

       wire      w_S   ;
       wire      w_R   ;

       nand n1  ( w_S , i_S , i_En  );
       nand n2  ( w_R , i_R , i_En  );
       nand n3  ( o_Q , w_S , o_Q_n );
       nand n4  ( o_Q_n , w_R , o_Q );

endmodule
