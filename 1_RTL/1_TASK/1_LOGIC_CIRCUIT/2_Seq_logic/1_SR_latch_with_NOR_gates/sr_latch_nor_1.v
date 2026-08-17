`timescale 1ns / 1ps
module sr_latch_nor_1 ( //gate-level
          i_S  ,
          i_R  ,
          o_Q  ,
          o_Q_n
);

          input   i_S    ;
          input   i_R    ;
          output  o_Q    ;
          output  o_Q_n  ;

          nor  n1  ( o_Q_n , i_S , o_Q   );
          nor  n2  ( o_Q   , i_R , o_Q_n );

endmodule
