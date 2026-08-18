`timescale 1ns / 1ps
module tb_t_ff_with_jk_3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_T    ;
        reg     t_Clk  ;
        wire    t_Q    ;
        wire    t_NQ   ;

        // DUT (Device Under Test) 인스턴스
        t_ff_with_jk_3 dut (
                .i_T   ( t_T   ),
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
        // T 동작: T=1 -> toggle(반전) / T=0 -> 유지
        initial begin
                // T=1 : 매 클럭마다 반전되는지 확인 (핵심)
                t_T = 1'b1 ;        // toggle
                #10 ;               // 반전 (x->? , 초기 x면 반전 후에도 x일 수 있음)
                #10 ;               // 반전
                #10 ;               // 반전
                #10 ;               // 반전

                // T=0 : 값 유지되는지 확인
                t_T = 1'b0 ;        // hold
                #10 ;               // 유지
                #10 ;               // 유지

                // 다시 T=1 : toggle 재개
                t_T = 1'b1 ;        // toggle
                #10 ;               // 반전
                #10 ;               // 반전

                // T=0 : 다시 유지
                t_T = 1'b0 ;        // hold
                #10 ;               // 유지

                $finish ;
        end

        // 콘솔 모니터링
        initial begin
                $monitor("time=%0t | clk=%b T=%b | Q=%b NQ=%b",
                          $time, t_Clk, t_T, t_Q, t_NQ);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_t_ff_with_jk_3.vcd");
                $dumpvars(0, tb_t_ff_with_jk_3);
        end

endmodule
