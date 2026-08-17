`timescale 1ns / 1ps

module multiplier_4x3_2(
       i_A,
       i_B,
       o_C
);

        input   [2:0]  i_A ;
        input   [3:0]  i_B ;
        output  [6:0]  o_C ;

        wire    [3:0]  w_0             ;
        assign w_0 = {4{i_A[0]}} & i_B ;
        assign o_C[0] = w_0[0]         ;

        wire    [3:0]  w_1             ;
        assign w_1 = {4{i_A[1]}} & i_B ;
        
        wire    [3:0]  w_S ;
        wire           w_C4;  
        assign o_C[1] = w_S[0];     
        four_bit_adder1 f1 (
                 .i_a  ( w_1  ),
                 .i_b  ( {1'b0, w_0[3], w_0[2], w_0[1]} ), // shift처리
                 .i_c0 ( 1'b0 ),
                 .o_s  ( w_S  ),
                 .o_c4 ( w_C4 )
        );
        wire    [3:0]  w_2 ;
        assign w_2 = {4{i_A[2]}} & i_B;           

        four_bit_adder1 f2 (
                 .i_a  ( w_2  ),
                 .i_b  ( {w_C4, w_S[3], w_S[2], w_S[1]} ),
                 .i_c0 ( 1'b0 ),
                 .o_s  ( {o_C[5], o_C[4], o_C[3], o_C[2]}),
                 .o_c4 ( o_C[6])
        );
endmodule
