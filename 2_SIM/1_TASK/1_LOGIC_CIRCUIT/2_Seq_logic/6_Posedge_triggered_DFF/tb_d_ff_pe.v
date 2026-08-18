`timescale 1ns / 1ps
module tb_d_ff_pe;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_D    ;
        reg     t_clk  ;
        wire    t_Q    ;
        wire    t_NQ   ;

        // DUT (Device Under Test) 인스턴스
        d_ff_pe dut (
                .i_D   ( t_D   ),
                .i_clk ( t_clk ),
                .o_Q   ( t_Q   ),
                .o_NQ  ( t_NQ  )
        );

        // 클럭 생성 : 10ns 주기 (5ns 마다 반전)
        initial begin
                t_clk = 1'b0 ;
                forever #5 t_clk = ~t_clk ;
        end

        // 자극(stimulus) 인가
        // ※ 이 FF는 posedge(상승 엣지)에서만 D를 Q로 잡음
        //    상승 엣지는 5ns, 15ns, 25ns... 마다 발생
        initial begin
                t_D = 1'b0 ;
                #7 ;                // 첫 상승엣지(5ns) 지난 후 -> Q=0

                t_D = 1'b1 ;        // D=1
                #10 ;               // 상승엣지(15ns) -> Q=1

                t_D = 1'b0 ;        // D=0
                #10 ;               // 상승엣지(25ns) -> Q=0

                t_D = 1'b1 ;        // D=1
                #3  ;               // 엣지 아닌 순간에 D 바꿈
                t_D = 1'b0 ;        // 다시 D=0 (엣지 직전 값이 잡힘)
                #7  ;               // 상승엣지(35ns) -> Q=0 (엣지 순간 D=0)

                t_D = 1'b1 ;        // D=1
                #10 ;               // 상승엣지(45ns) -> Q=1

                t_D = 1'b1 ;        // D=1 유지
                #10 ;               // 상승엣지(55ns) -> Q=1 유지

                t_D = 1'b0 ;        // D=0
                #10 ;               // 상승엣지(65ns) -> Q=0

                $finish ;
        end

        // 콘솔 모니터링 (Q와 NQ가 항상 반대인지도 확인)
        initial begin
                $monitor("time=%0t | clk=%b D=%b | Q=%b NQ=%b",
                          $time, t_clk, t_D, t_Q, t_NQ);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_d_ff_pe.vcd");
                $dumpvars(0, tb_d_ff_pe);
        end

endmodule
