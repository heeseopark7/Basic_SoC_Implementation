
`timescale 1ns / 1ps

module three_to_eight_decoder2(
                i_x  ,
                i_y  ,
                i_z  ,
                o_D
);
       input          i_x    ;
       input          i_y    ;
       input          i_z    ;
       output  [7:0]  o_D    ;

       wire           w_n_x    ;
       wire           w_n_y    ;
       wire           w_n_z    ;

       assign w_n_x = ~i_x     ;
       assign w_n_y = ~i_y     ;
       assign w_n_z = ~i_z     ;

       assign o_D[0] = w_n_z & w_n_y & w_n_x   ;
       assign o_D[1] = i_z   & w_n_y & w_n_x   ;
       assign o_D[2] = w_n_z & i_y   & w_n_x   ;
       assign o_D[3] = i_z   & i_y   & w_n_x   ;
       assign o_D[4] = w_n_z & w_n_y & i_x     ;
       assign o_D[5] = i_z   & w_n_y & i_x     ;
       assign o_D[6] = w_n_z & i_y   & i_x     ;
       assign o_D[7] = i_z   & i_y   & i_x     ;
endmodule
