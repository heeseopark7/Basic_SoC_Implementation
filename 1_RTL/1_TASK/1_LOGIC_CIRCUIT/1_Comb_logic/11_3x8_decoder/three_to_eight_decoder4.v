
`timescale 1ns / 1ps

module three_to_eight_decoder4(
                i_x  ,
                i_y  ,
                i_z  ,
                i_E  ,
                o_D
);
       input          i_x    ;
       input          i_y    ;
       input          i_z    ;
       input          i_E    ;
       output  [7:0]  o_D    ;

       wire           w_n_x    ;
       wire           w_n_y    ;
       wire           w_n_z    ;

       not   n1 ( w_n_x, i_x );
       not   n2 ( w_n_y, i_y );
       not   n3 ( w_n_z, i_z );

       and   a0 ( o_D[0], w_n_z, w_n_y, w_n_x, i_E );
       and   a1 ( o_D[1], i_z  , w_n_y, w_n_x, i_E );
       and   a2 ( o_D[2], w_n_z, i_y  , w_n_x, i_E );
       and   a3 ( o_D[3], i_z  , i_y  , w_n_x, i_E );
       and   a4 ( o_D[4], w_n_z, w_n_y, i_x, i_E   );
       and   a5 ( o_D[5], i_z  , w_n_y, i_x, i_E   );
       and   a6 ( o_D[6], w_n_z, i_y  , i_x, i_E   );
       and   a7 ( o_D[7], i_z  , i_y  , i_x, i_E   );
endmodule
