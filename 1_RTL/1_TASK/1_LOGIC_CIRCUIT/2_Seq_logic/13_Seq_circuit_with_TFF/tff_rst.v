mescale 1ns / 1ps  
module tff_rst (
        i_T    ,
        i_Clk  ,
        i_nRst ,
        o_Q  
);

        input   i_T    ;
        input   i_Clk  ;
        input   i_nRst ;
        output  o_Q    ;


        reg     o_Q   ;
        always@(posedge i_Clk or negedge i_nRst) begin
        if (!i_nRst ) begin
                o_Q  <= 1'b0  ;
        end
        else begin 
        case ( i_T )
        1'b0 : o_Q <= o_Q  ;
        1'b1 : o_Q <= ~o_Q ;
        endcase
        end
        end

endmodule
