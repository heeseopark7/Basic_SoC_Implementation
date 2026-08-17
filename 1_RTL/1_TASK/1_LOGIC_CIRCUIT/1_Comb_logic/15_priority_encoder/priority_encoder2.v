`timescale 1ns / 1ps
module priority_encoder2 (
         i_D,
         o_x,
         o_y,
         o_V
);

         input   [3:0]     i_D   ;
         output            o_x   ;
         output            o_y   ;
         output            o_V   ;

         wire              w_D23 ;

         assign    w_D23 = i_D[3] | i_D[2]          ;
         assign    o_x   = w_D23                    ;

         wire              w_nD2 ;
         wire              w_D12 ;

         assign    w_nD2 = ~i_D[2]                   ;
         assign    w_D12 = w_nD2  & i_D[1]           ;
         assign    o_y   = i_D[3] | w_D12            ;

         assign    o_V   = w_D23  | i_D[1] | i_D[0]  ;

endmodule
       
