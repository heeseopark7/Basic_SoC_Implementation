`timescale 1ns / 1ps
module priority_encoder3 (
         i_D,
         o_x,
         o_y,
         o_V
);

         input   [3:0]     i_D   ;
         output            o_x   ;
         output            o_y   ;
         output            o_V   ;

         reg               w_D23 ;
         reg               o_x   ;

         always@(*) begin
                   w_D23 = i_D[3] | i_D[2]          ;
                   o_x   = w_D23                    ;
         end

         reg               w_nD2 ;
         reg               w_D12 ;
         reg               o_y   ;

         always@(*) begin
                   w_nD2 = ~i_D[2]                   ;
                   w_D12 = w_nD2  & i_D[1]           ;
                   o_y   = i_D[3] | w_D12            ;
         end
 
         reg               o_V   ;
 
         always@(*) begin
                   o_V   = w_D23  | i_D[1] | i_D[0]  ;
         end  

endmodule
       
