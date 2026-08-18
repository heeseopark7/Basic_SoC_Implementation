`timescale 1ns / 1ps  
module seq_detector (
                 i_x    ,
                 i_Clk  ,
                 i_nRst ,
                 o_y
);

     input       i_x    ;
     input       i_Clk  ;
     input       i_nRst ;
     output      o_y    ;

     localparam  S0 = 2'b00     ;
     localparam  S1 = 2'b01     ;
     localparam  S2 = 2'b11     ;
     localparam  S3 = 2'b10     ;

     reg [1:0]   r_state, r_next;
     
     always @(posedge i_Clk or negedge i_nRst) begin
        if (!i_nRst) r_state <= S0     ;
        else         r_state <= r_next ;
     end

     always @(*) begin
         case (r_state)
         S0 : if (i_x) r_next = S1; else r_next = S0;
         S1 : if (i_x) r_next = S2; else r_next = S0;
         S2 : if (i_x) r_next = S3; else r_next = S0;
         S3 : if (i_x) r_next = S3; else r_next = S0;
         endcase
     end

     reg     o_y;
     always @(*) begin
         if (r_state == S3) o_y = 1'b1;
         else               o_y = 1'b0;
         
     end
endmodule
