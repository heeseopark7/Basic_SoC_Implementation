`timescale 1ns / 1ps
module tb_seq_ex3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_x     ;
        reg     t_Clk   ;
        wire    t_A     ;
        wire    t_NA    ;
        wire    t_B     ;
        wire    t_NB    ;
        wire    t_y     ;

        // DUT (Device Under Test) 인스턴스
        seq_ex3 dut (
                .i_x   ( t_x   ),
                .i_Clk ( t_Clk ),
                .o_A   ( t_A   ),
                .o_NA  ( t_NA  ),
                .o_B   ( t_B   ),
                .o_NB  ( t_NB  ),
                .o_y   ( t_y   )
        );

        // 클럭 생성 : 10ns 주기 (posedge는 5,15,25... ns)
        initial begin
                t_Clk = 1'b0 ;
                forever #5 t_Clk = ~t_Clk ;
        end

        // 자극(stimulus) 인가
        // ※ 이 회로는 1들의 흐름 속에서 0을 검출 (교재 그림 5.15)
        //    A(t+1)=(A+B)x, B(t+1)=A'x, y=(A+B)x'
        //    x=1을 여러 번 준 뒤 x=0을 주면 y가 반응하는지 확인
        //    (리셋 없으므로 초반에 x=0을 줘서 상태를 00으로 정리)
        initial begin
                // 리셋 대용: x=0을 주면 A,B가 0으로 정리됨 (A(t+1)=(A+B)*0=0, B=A'*0=0)
                t_x = 1'b0 ;
                #20 ;               // 클럭 2번 -> A=0, B=0 확정

                // 1을 연속으로 흘려보냄 (상태가 진행)
                t_x = 1'b1 ;
                #10 ;               // 1개
                #10 ;               // 2개
                #10 ;               // 3개
                #10 ;               // 4개

                // 0 삽입 (1들의 흐름이 끊김) -> y 반응 확인
                t_x = 1'b0 ;
                #10 ;

                // 다시 1 흐름
                t_x = 1'b1 ;
                #10 ;
                #10 ;

                // 다시 0
                t_x = 1'b0 ;
                #10 ;

                // 1 하나
                t_x = 1'b1 ;
                #10 ;

                // 0 두 번
                t_x = 1'b0 ;
                #10 ;
                #10 ;

                $finish ;
        end

        // 콘솔 모니터링 (상태 AB와 출력 y 관찰)
        initial begin
                $monitor("time=%0t | x=%b | A=%b B=%b | y=%b",
                          $time, t_x, t_A, t_B, t_y);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_seq_ex3.vcd");
                $dumpvars(0, tb_seq_ex3);
        end

endmodule
