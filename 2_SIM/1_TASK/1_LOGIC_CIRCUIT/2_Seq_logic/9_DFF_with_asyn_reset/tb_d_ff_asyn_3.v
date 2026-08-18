`timescale 1ns / 1ps
module tb_d_ff_asyn_3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_D     ;
        reg     t_Clk   ;
        reg     t_Nrst  ;
        wire    t_Q     ;
        wire    t_NQ    ;

        // DUT (Device Under Test) 인스턴스
        d_ff_asyn_3 dut (
                .i_D    ( t_D    ),
                .i_Clk  ( t_Clk  ),
                .i_Nrst ( t_Nrst ),
                .o_Q    ( t_Q    ),
                .o_NQ   ( t_NQ   )
        );

        // 클럭 생성 : 10ns 주기 (posedge는 5,15,25... ns)
        initial begin
                t_Clk = 1'b0 ;
                forever #5 t_Clk = ~t_Clk ;
        end

        // 자극(stimulus) 인가
        // ※ 비동기 리셋(active-low): Nrst=0이면 클럭 무관하게 즉시 Q=0
        //    Nrst=1이면 posedge에서 D를 Q로 저장
        initial begin
                // 시작할 때 리셋 걸어 초기화 (Nrst=0 -> Q=0)
                t_Nrst = 1'b0 ; t_D = 1'b1 ;   // 리셋 활성 -> Q=0 (D=1이어도)
                #12 ;

                // 리셋 해제 -> 정상 동작
                t_Nrst = 1'b1 ; t_D = 1'b1 ;   // posedge(15ns) -> Q=1
                #10 ;

                t_D = 1'b0 ;                    // posedge(25ns) -> Q=0
                #10 ;

                t_D = 1'b1 ;                    // posedge(35ns) -> Q=1
                #10 ;

                // 동작 중 비동기 리셋 (클럭 엣지 아닌 순간에 리셋)
                #2 ;                           // 클럭 엣지 아닌 시점
                t_Nrst = 1'b0 ;                // 리셋 활성 -> 클럭 안 기다리고 즉시 Q=0 (핵심)
                #6 ;

                t_Nrst = 1'b1 ;                // 리셋 해제
                t_D = 1'b1 ;                    // 다음 posedge -> Q=1
                #10 ;

                t_D = 1'b0 ;                    // posedge -> Q=0
                #10 ;

                $finish ;
        end

        // 콘솔 모니터링
        initial begin
                $monitor("time=%0t | Nrst=%b clk=%b D=%b | Q=%b NQ=%b",
                          $time, t_Nrst, t_Clk, t_D, t_Q, t_NQ);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_d_ff_asyn_3.vcd");
                $dumpvars(0, tb_d_ff_asyn_3);
        end

endmodule
