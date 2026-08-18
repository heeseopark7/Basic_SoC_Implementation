`timescale 1ns / 1ps
module tb_d_ff_ms_3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_D    ;
        reg     t_clk  ;
        wire    t_Q    ;

        // DUT (Device Under Test) 인스턴스
        d_ff_ms_3 dut (
                .i_D   ( t_D   ),
                .i_clk ( t_clk ),
                .o_Q   ( t_Q   )
        );

        // 클럭 생성 : 10ns 주기 (5ns 마다 반전)
        initial begin
                t_clk = 1'b0 ;
                forever #5 t_clk = ~t_clk ;
        end

        // 자극(stimulus) 인가
        // ※ 이 FF는 negedge(하강 엣지)에서만 D를 Q로 잡음
        //    D를 여러 값으로 바꿔가며, 하강 엣지 순간의 값이 Q에 저장되는지 확인
        initial begin
                t_D = 1'b0 ;
                #12 ;               // 첫 하강엣지(10ns) 지난 후 -> Q=0

                t_D = 1'b1 ;        // D=1
                #10 ;               // 다음 하강엣지(20ns)에서 -> Q=1

                t_D = 1'b0 ;        // D=0
                #10 ;               // 하강엣지(30ns) -> Q=0

                t_D = 1'b1 ;        // D=1
                #3  ;               // 하강엣지 전에 D 바꿈 (엣지 아닌 순간엔 Q 안 바뀜 확인)
                t_D = 1'b0 ;        // 다시 D=0 (엣지 직전 값이 잡힘)
                #7  ;               // 하강엣지(40ns) -> Q=0 (엣지 순간 D=0)

                t_D = 1'b1 ;        // D=1
                #10 ;               // 하강엣지(50ns) -> Q=1

                t_D = 1'b1 ;        // D=1 유지
                #10 ;               // 하강엣지(60ns) -> Q=1 유지

                t_D = 1'b0 ;        // D=0
                #10 ;               // 하강엣지(70ns) -> Q=0

                $finish ;
        end

        // 콘솔 모니터링
        initial begin
                $monitor("time=%0t | clk=%b D=%b | Q=%b",
                          $time, t_clk, t_D, t_Q);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_d_ff_ms_3.vcd");
                $dumpvars(0, tb_d_ff_ms_3);
        end

endmodule
