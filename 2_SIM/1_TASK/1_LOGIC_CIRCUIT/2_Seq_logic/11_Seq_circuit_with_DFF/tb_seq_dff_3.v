`timescale 1ns / 1ps
module tb_seq_dff_3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_x     ;
        reg     t_y     ;
        reg     t_Clk   ;
        wire    t_A     ;

        // DUT (Device Under Test) 인스턴스
        seq_dff_3 dut (
                .i_x   ( t_x   ),
                .i_y   ( t_y   ),
                .i_Clk ( t_Clk ),
                .o_A   ( t_A   )
        );

        // 클럭 생성 : 10ns 주기 (posedge는 5,15,25... ns)
        initial begin
                t_Clk = 1'b0 ;
                forever #5 t_Clk = ~t_Clk ;
        end

        // 자극(stimulus) 인가
        // ※ A(t+1) = A ^ x ^ y  (홀수 함수)
        //    x,y 중 1의 개수가 홀수면 A 반전, 짝수면 A 유지
        //    - x,y = 00 또는 11 (1이 짝수) -> A 유지
        //    - x,y = 01 또는 10 (1이 홀수) -> A 반전
        //    리셋이 없으므로 초반엔 A가 x일 수 있음. x,y=00을 줘도 A는 유지라
        //    x,y=01이나 10을 줘서 A가 확정되도록 유도.
        initial begin
                // x=0,y=1 (홀수) -> A 반전. 초기 x여도 몇 번 반전하며 관찰
                t_x = 1'b0 ; t_y = 1'b1 ;   // 홀수 -> A 반전
                #10 ;
                #10 ;                        // 계속 반전

                // x=0,y=0 (짝수) -> A 유지
                t_x = 1'b0 ; t_y = 1'b0 ;   // 짝수 -> A 유지
                #10 ;
                #10 ;

                // x=1,y=0 (홀수) -> A 반전
                t_x = 1'b1 ; t_y = 1'b0 ;   // 홀수 -> A 반전
                #10 ;

                // x=1,y=1 (짝수) -> A 유지
                t_x = 1'b1 ; t_y = 1'b1 ;   // 짝수 -> A 유지
                #10 ;
                #10 ;

                // x=0,y=1 (홀수) -> A 반전
                t_x = 1'b0 ; t_y = 1'b1 ;   // 홀수 -> A 반전
                #10 ;

                // x=1,y=0 (홀수) -> A 반전
                t_x = 1'b1 ; t_y = 1'b0 ;   // 홀수 -> A 반전
                #10 ;

                $finish ;
        end

        // 콘솔 모니터링 (x,y와 상태 A 관찰)
        initial begin
                $monitor("time=%0t | x=%b y=%b | A=%b",
                          $time, t_x, t_y, t_A);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_seq_dff_3.vcd");
                $dumpvars(0, tb_seq_dff_3);
        end

endmodule
