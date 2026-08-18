`timescale 1ns / 1ps
module tb_seq_jk_3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_x     ;
        reg     t_Clk   ;
        wire    t_A     ;
        wire    t_B     ;

        // DUT (Device Under Test) 인스턴스
        seq_jk_3 dut (
                .i_x   ( t_x   ),
                .i_Clk ( t_Clk ),
                .o_A   ( t_A   ),
                .o_B   ( t_B   )
        );

        // 클럭 생성 : 10ns 주기 (posedge는 5,15,25... ns)
        initial begin
                t_Clk = 1'b0 ;
                forever #5 t_Clk = ~t_Clk ;
        end

        // 자극(stimulus) 인가
        // ※ JK FF 2개 순차회로 (그림 5.18)
        //    J_A=B, K_A=Bx', J_B=x', K_B=A^x
        //    입력 x를 0/1로 바꿔가며 상태 (A,B) 변화를 관찰
        //    리셋이 없어 초기 상태가 x일 수 있으니, x 시퀀스로 동작 관찰
        initial begin
                // x=1 여러 클럭 - 상태 진행 관찰
                t_x = 1'b1 ;
                #10 ;
                #10 ;
                #10 ;
                #10 ;

                // x=0 여러 클럭
                t_x = 1'b0 ;
                #10 ;
                #10 ;
                #10 ;

                // x=1 다시
                t_x = 1'b1 ;
                #10 ;
                #10 ;

                // x=0
                t_x = 1'b0 ;
                #10 ;

                // x=1
                t_x = 1'b1 ;
                #10 ;
                #10 ;

                $finish ;
        end

        // 콘솔 모니터링 (입력 x와 상태 A,B 관찰)
        initial begin
                $monitor("time=%0t | x=%b | A=%b B=%b",
                          $time, t_x, t_A, t_B);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_seq_jk_3.vcd");
                $dumpvars(0, tb_seq_jk_3);
        end

endmodule
