`timescale 1ns / 1ps
module tb_d_latch_3;

        // DUT 입력에 연결할 reg, 출력에 연결할 wire
        reg     t_D    ;
        reg     t_En   ;
        wire    t_Q    ;
        wire    t_n_Q  ;

        // DUT (Device Under Test) 인스턴스
        d_latch_3 dut (
                .i_D   ( t_D   ),
                .i_En  ( t_En  ),
                .o_Q   ( t_Q   ),
                .o_n_Q ( t_n_Q )
        );

        // 자극(stimulus) 인가
        // ※ D 래치: En=1이면 투명(Q=D), En=0이면 저장(유지)
        initial begin
                // En=1 : Q가 D를 그대로 따라가는지 (투명 동작)
                t_En = 1'b1 ; t_D = 1'b1 ;   // Q=1
                #10 ;
                t_En = 1'b1 ; t_D = 1'b0 ;   // Q=0 (D 따라 바뀜)
                #10 ;
                t_En = 1'b1 ; t_D = 1'b1 ;   // Q=1 (D 따라 바뀜)
                #10 ;

                // En=0 : D를 바꿔도 Q가 유지되는지 (저장 동작, 핵심)
                t_En = 1'b0 ; t_D = 1'b0 ;   // En=0 -> Q=1 유지 (직전 D=1 저장)
                #10 ;
                t_En = 1'b0 ; t_D = 1'b1 ;   // En=0 -> Q=1 유지 (D 바뀌어도 무관)
                #10 ;
                t_En = 1'b0 ; t_D = 1'b0 ;   // En=0 -> Q=1 유지
                #10 ;

                // 다시 En=1 : 현재 D 반영
                t_En = 1'b1 ; t_D = 1'b0 ;   // Q=0 (투명, D 반영)
                #10 ;

                // En=0 : Q=0 저장
                t_En = 1'b0 ; t_D = 1'b1 ;   // En=0 -> Q=0 유지
                #10 ;

                $finish ;
        end

        // 콘솔 모니터링
        initial begin
                $monitor("time=%0t | En=%b D=%b | Q=%b n_Q=%b",
                          $time, t_En, t_D, t_Q, t_n_Q);
        end

        // 파형 덤프
        initial begin
                $dumpfile("tb_d_latch_3.vcd");
                $dumpvars(0, tb_d_latch_3);
        end

endmodule
