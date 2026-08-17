
`timescale 1ns/1ps

module BCD_adder3 (
     i_Add,
     i_Aug,
     i_C0,
     o_C,
     o_S
);
     input   [3:0]   i_Add  ;
     input   [3:0]   i_Aug  ;
     input           i_C0   ;
     output          o_C    ;
     output  [3:0]   o_S    ;

     wire    [3:0]  w_Z     ;
     wire           w_K     ;     
     four_bit_adder1 F1 (
     .i_a (i_Add),
     .i_b (i_Aug),
     .i_c0(i_C0) ,
     .o_c4(w_K)  ,
     .o_s (w_Z)
); // 모듈이름, 인스턴스이름

      reg            w_W84 ;
      reg            w_W82 ;
      reg            o_C   ;
      always@(*) begin
      w_W84 = w_Z[3] & w_Z[2]    ;
      w_W82 = w_Z[3] & w_Z[1]    ;
      o_C   = w_K | w_W84 | w_W82;
      end
           
      reg   [3:0]    w      ;
      always@(*) begin
      w[3] =  1'b0   ;
      w[2] =  o_C    ;
      w[1] =  o_C    ;
      w[0] =  1'b0   ;
      end
      
      four_bit_adder1 F2 (
     .i_a  (w   )    ,
     .i_b  (w_Z )    ,
     .i_c0 (1'b0)    , // 안쓰여있는건 입력이 0으로 고정
     .o_s  (o_S )    ,
     .o_c4 (    )      // 비어있으면 이대로 선언
);

endmodule
