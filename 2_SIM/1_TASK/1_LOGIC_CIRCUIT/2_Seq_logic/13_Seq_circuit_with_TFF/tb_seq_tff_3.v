`timescale 1ns / 1ps
module tb_seq_tff_3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_x     ;
        reg     t_Clk   ;
        reg     t_nRst  ;
        wire    t_y     ;

        // DUT (Device Under Test) 인스턴스
        seq_tff_3 dut (
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
        // ※ T FF 2진 카운터 (그림 5.20)
        //    x=1이면 매 클럭 카운트 (00->01->10->11->00...)
        //    x=0이면 제자리 유지
        //    y=AB : 상태 11일 때만 y=1
        //    리셋(active-low): nRst=0이면 즉시 A,B=0
        initial begin
                // 비동기 리셋으로 초기화
                t_nRst = 1'b0 ; t_x = 1'b0 ;   // 리셋 -> A=0, B=0
                #12 ;

                // 리셋 해제 후 x=1로 카운트 시작
                t_nRst = 1'b1 ;
                t_x = 1'b1 ;        // 카운트 enable
                #10 ;               // 00 -> 01
                #10 ;               // 01 -> 10
                #10 ;               // 10 -> 11  (y=1 뜨는지 확인)
                #10 ;               // 11 -> 00  (한 바퀴 완료)
                #10 ;               // 00 -> 01  (다시 순환)

                // x=0 : 카운트 멈춤 (제자리)
                t_x = 1'b0 ;
                #10 ;               // 유지
                #10 ;               // 유지

                // x=1 : 다시 카운트
                t_x = 1'b1 ;
                #10 ;
                #10 ;
                #10 ;

                // 동작 중 비동기 리셋 (클럭 엣지 아닌 순간에)
                #3 ;
                t_nRst = 1'b0 ;     // 즉시 A,B=0 (비동기)
                #6 ;

                t_nRst = 1'b1 ;     // 리셋 해제
                t_x = 1'b1 ;        // 다시 카운트
                #10 ;
                #10 ;

                $finish ;
        end

        // 콘솔 모니터링 (내부 상태 A,B는 출력 포트가 없으니 y와 x 관찰)
        initial begin
                $monitor("time=%0t | nRst=%b x=%b | y=%b",
                          $time, t_nRst, t_x, t_y);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_seq_tff_3.vcd");
                $dumpvars(0, tb_seq_tff_3);
        end

endmodule
