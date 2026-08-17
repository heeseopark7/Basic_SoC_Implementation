`timescale 1ns / 1ps
module Four_bit_comparator3 (
       i_A   ,
       i_B   ,
       o_LT  , // A<B
       o_GT  , // A>B
       o_EQ    // A=B
);

       input   [3:0]    i_A  ;
       input   [3:0]    i_B  ;
       output           o_LT ;
       output           o_GT ;
       output           o_EQ ;
       
       reg     [3:0]    w_x       ;
       always@(*) begin
       w_x = ~(i_A ^ i_B)         ;
       end

       reg     [3:0]    w_n_A     ;
       always@(*) begin
       w_n_A = ~i_A               ;
       end

       reg     [3:0]    w_n_B     ;
       always@(*) begin
       w_n_B = ~i_B               ;
       end

       reg     [3:0]    w_nAB     ;
       always@(*) begin
       w_nAB = w_n_A & i_B        ;
       end

       reg     [3:0]    w_AnB     ;
       always@(*) begin
       w_AnB = i_A & w_n_B        ;
       end

       reg     [6:1]    w_g                           ;
       always@(*) begin 
       w_g[6] = w_x[3] & w_nAB[2]                     ;
       w_g[5] = w_x[3] & w_AnB[2]                     ;
       w_g[4] = w_x[3] & w_x[2] & w_nAB[1]            ;
       w_g[3] = w_x[3] & w_x[2] & w_AnB[1]            ;
       w_g[2] = w_x[3] & w_x[2] & w_x[1] & w_nAB[0]   ;
       w_g[1] = w_x[3] & w_x[2] & w_x[1] & w_AnB[0]   ;
       end

       reg              o_EQ                          ;
       reg              o_LT                          ;
       reg              o_GT                          ;
       always@(*) begin
       o_EQ   = w_x[3] & w_x[2] & w_x[1] & w_x[0]     ;  // A = B
       o_LT   = w_nAB[3] | w_g[6] | w_g[4] | w_g[2]   ;  // A < B
       o_GT   = w_AnB[3] | w_g[5] | w_g[3] | w_g[1]   ;  // A > B
       end

endmodulee
