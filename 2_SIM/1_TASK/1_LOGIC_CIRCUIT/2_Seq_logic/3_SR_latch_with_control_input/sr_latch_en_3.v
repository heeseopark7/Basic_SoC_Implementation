`timescale 1ns / 1ps
module sr_latch_en_3 ( // behavioral-level
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

       reg       o_Q   ;
       reg       o_Q_n ;

       always@(*) begin
             if ( i_En ) begin
                  if     ( i_S && !i_R ) begin // set
                        o_Q   = 1'b1;
                        o_Q_n = 1'b0;
                  end 
                  else if ( !i_S && i_R ) begin // reset
                        o_Q   = 1'b0;
                        o_Q_n = 1'b1;
                  end
                  else if ( i_S && i_R ) begin // forbidden
                        o_Q   = 1'b1;
                        o_Q_n = 1'b1;
                  end
             end
       end
endmodule
