`timescale 1ns / 1ps
module tb_jk_ff_3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_J    ;
        reg     t_K    ;
        reg     t_Clk  ;
        wire    t_Q    ;
        wire    t_NQ   ;

        // DUT (Device Under Test) 인스턴스
        jk_ff_3 dut (
                .i_J   ( t_J   ),
                .i_K   ( t_K   ),
                .i_Clk ( t_Clk ),
                .o_Q   ( t_Q   ),
                .o_NQ  ( t_NQ  )
        );

        // 클럭 생성 : 10ns 주기 (posedge는 5,15,25... ns)
        initial begin
                t_Clk = 1'b0 ;
                forever #5 t_Clk = ~t_Clk ;
        end

        // 자극(stimulus) 인가
        // JK 동작: 00 유지 / 01 reset / 10 set / 11 toggle
        // 각 값은 상승엣지 전에 세팅되도록 클럭 주기(10ns)에 맞춰 인가
        initial begin
                // 먼저 set으로 초기값 확정 (초기 x 방지)
                t_J = 1'b1 ; t_K = 1'b0 ;   // set   -> Q=1
                #10 ;

                t_J = 1'b0 ; t_K = 1'b1 ;   // reset -> Q=0
                #10 ;

                t_J = 1'b0 ; t_K = 1'b0 ;   // hold  -> Q=0 유지
                #10 ;

                t_J = 1'b1 ; t_K = 1'b0 ;   // set   -> Q=1
                #10 ;

                t_J = 1'b0 ; t_K = 1'b0 ;   // hold  -> Q=1 유지
                #10 ;

                // toggle 반복 - 매 클럭마다 반전되는지 확인
                t_J = 1'b1 ; t_K = 1'b1 ;   // toggle -> Q 반전 (1->0)
                #10 ;                        // toggle -> Q 반전 (0->1)
                #10 ;                        // toggle -> Q 반전 (1->0)
                #10 ;                        // toggle -> Q 반전 (0->1)

                t_J = 1'b0 ; t_K = 1'b1 ;   // reset -> Q=0
                #10 ;

                $finish ;
        end

        // 콘솔 모니터링
        initial begin
                $monitor("time=%0t | clk=%b J=%b K=%b | Q=%b NQ=%b",
                          $time, t_Clk, t_J, t_K, t_Q, t_NQ);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_jk_ff_3.vcd");
                $dumpvars(0, tb_jk_ff_3);
        end

endmodule
