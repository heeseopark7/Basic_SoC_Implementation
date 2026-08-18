`timescale 1ns / 1ps
module tb_sr_latch_nand_3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_S    ;
        reg     t_R    ;
        wire    t_Q    ;
        wire    t_Q_n  ;

        // DUT (Device Under Test) 인스턴스
        sr_latch_nand_3 dut (
                .i_S   ( t_S   ),
                .i_R   ( t_R   ),
                .o_Q   ( t_Q   ),
                .o_Q_n ( t_Q_n )
        );

        // 자극(stimulus) 인가
        // ※ NAND 래치는 극성이 NOR와 반대: 0이 활성
        //    S=0 -> set / R=0 -> reset / S=R=1 -> hold / S=R=0 -> forbidden
        initial begin
                // 초기값 - 먼저 set(S=0,R=1)으로 상태 확정 (초기 x 방지)
                t_S = 1'b0 ; t_R = 1'b1 ;   // set    : Q=1, Q_n=0
                #10 ;

                t_S = 1'b1 ; t_R = 1'b0 ;   // reset  : Q=0, Q_n=1
                #10 ;

                t_S = 1'b1 ; t_R = 1'b1 ;   // hold   : 이전(reset)값 유지 -> Q=0
                #10 ;

                t_S = 1'b0 ; t_R = 1'b1 ;   // set    : Q=1, Q_n=0
                #10 ;

                t_S = 1'b1 ; t_R = 1'b1 ;   // hold   : 이전(set)값 유지 -> Q=1
                #10 ;

                t_S = 1'b0 ; t_R = 1'b0 ;   // forbidden : Q=1, Q_n=1
                #10 ;

                t_S = 1'b1 ; t_R = 1'b0 ;   // reset  : Q=0, Q_n=1
                #10 ;

                $finish ;
        end

        // 콘솔 모니터링 - 값 바뀔 때마다 출력
        initial begin
                $monitor("time=%0t | S=%b R=%b | Q=%b Q_n=%b",
                          $time, t_S, t_R, t_Q, t_Q_n);
        end

        // 파형 덤프 (파형 뷰어용)
        initial begin
                $dumpfile("tb_sr_latch_nand_3.vcd");
                $dumpvars(0, tb_sr_latch_nand_3);
        end

endmodule
