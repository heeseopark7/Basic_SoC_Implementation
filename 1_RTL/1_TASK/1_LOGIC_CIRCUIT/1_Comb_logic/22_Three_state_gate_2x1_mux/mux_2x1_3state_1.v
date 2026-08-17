`timescale 1ns / 1ps
module mux_2x1_3state_1 (
               i_A  ,
               i_B  ,
               i_S  ,
               o_Y
);

      input    i_A   ;
      input    i_B   ;
      input    i_S   ;
      output   o_Y   ;

      wire     w_n_S ;

      not n1 ( w_n_S , i_S         );

      bufif0 dut1 ( o_Y , i_A , w_n_S ); // 3stategate, en=0
      bufif1 dut2 ( o_Y , i_B , i_S   ); // 3stategate, en=1
  
endmodule
