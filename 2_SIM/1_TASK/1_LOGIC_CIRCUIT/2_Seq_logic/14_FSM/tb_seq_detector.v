`timescale 1ns / 1ps
module tb_seq_detector;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_x     ;
        reg     t_Clk   ;
        reg     t_nRst  ;
        wire    t_y     ;

        // DUT (Device Under Test) 인스턴스
        seq_detector dut (
                .i_x    ( t_x    ),
                .i_Clk  ( t_Clk  ),
                .i_nRst ( t_nRst ),
                .o_y    ( t_y    )
        );

        // 클럭 생성 : 10ns 주기 (posedge는 5,15,25... ns)
        initial begin
                t_Clk = 1'b0 ;
                forever #5 t_Clk = ~t_Clk ;
        end

        // 자극(stimulus) 인가
        // ※ FSM 시퀀스 검출기: 1이 3개 이상 연속이면 y=1 (Moore)
        //    S0(초기) -> S1(1개) -> S2(2개) -> S3(3개+, y=1)
        //    0이 들어오면 -> S0으로 (초기화)
        initial begin
                // 비동기 리셋으로 초기화 (S0)
                t_nRst = 1'b0 ; t_x = 1'b0 ;
                #12 ;
                t_nRst = 1'b1 ;

                // 케이스 1: 1을 1개만 -> y 안 뜸
                t_x = 1'b1 ; #10 ;      // S0->S1
                t_x = 1'b0 ; #10 ;      // S1->S0 (끊김)

                // 케이스 2: 1을 2개 -> y 안 뜸
                t_x = 1'b1 ; #10 ;      // S0->S1
                t_x = 1'b1 ; #10 ;      // S1->S2
                t_x = 1'b0 ; #10 ;      // S2->S0 (끊김)

                // 케이스 3: 1을 3개 연속 -> y=1 (핵심)
                t_x = 1'b1 ; #10 ;      // S0->S1
                t_x = 1'b1 ; #10 ;      // S1->S2
                t_x = 1'b1 ; #10 ;      // S2->S3 (y=1 여기서)
                t_x = 1'b0 ; #10 ;      // S3->S0

                // 케이스 4: 1을 5개 연속 -> y=1 계속 유지
                t_x = 1'b1 ; #10 ;      // S0->S1
                t_x = 1'b1 ; #10 ;      // S1->S2
                t_x = 1'b1 ; #10 ;      // S2->S3 (y=1 시작)
                t_x = 1'b1 ; #10 ;      // S3->S3 (y=1 유지)
                t_x = 1'b1 ; #10 ;      // S3->S3 (y=1 유지)
                t_x = 1'b0 ; #10 ;      // S3->S0 (끊김)

                // 케이스 5: 동작 중 비동기 리셋
                t_x = 1'b1 ; #10 ;      // S0->S1
                t_x = 1'b1 ; #10 ;      // S1->S2
                #3 ;
                t_nRst = 1'b0 ;         // 리셋 -> 즉시 S0 (y=0)
                #6 ;
                t_nRst = 1'b1 ;

                // 리셋 후 다시 3개 연속
                t_x = 1'b1 ; #10 ;
                t_x = 1'b1 ; #10 ;
                t_x = 1'b1 ; #10 ;      // y=1

                t_x = 1'b0 ; #10 ;

                $finish ;
        end

        // 콘솔 모니터링 (상태도 같이 보이도록)
        initial begin
                $monitor("time=%0t | nRst=%b x=%b state=%b | y=%b",
                          $time, t_nRst, t_x, dut.r_state, t_y);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_seq_detector.vcd");
                $dumpvars(0, tb_seq_detector);
        end

endmodule
