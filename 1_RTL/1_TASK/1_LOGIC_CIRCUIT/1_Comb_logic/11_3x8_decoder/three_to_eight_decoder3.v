
`timescale 1ns / 1ps

module three_to_eight_decoder3(
                i_x  ,
                i_y  ,
                i_z  ,
                o_D
);
       input          i_x    ;
       input          i_y    ;
       input          i_z    ;
       output  [7:0]  o_D    ;

       reg          w_n_x    ;
       reg          w_n_y    ;
       reg          w_n_z    ;

       always@(*) begin
       w_n_x = ~i_x          ;
       w_n_y = ~i_y          ;
       w_n_z = ~i_z          ;
       end

       reg  [7:0]   o_D      ;
       
       always@(*) begin
       o_D[0] = w_n_z & w_n_y & w_n_x   ;
       o_D[1] = i_z   & w_n_y & w_n_x   ;
       o_D[2] = w_n_z & i_y   & w_n_x   ;
       o_D[3] = i_z   & i_y   & w_n_x   ;
       o_D[4] = w_n_z & w_n_y & i_x     ;
       o_D[5] = i_z   & w_n_y & i_x     ;
       o_D[6] = w_n_z & i_y   & i_x     ;
       o_D[7] = i_z   & i_y   & i_x     ;
       end

endmodule
