`timescale 1ns / 1ps
module tb_sr_latch_en_3;

        reg     t_S    ;
        reg     t_R    ;
        reg     t_En   ;
        wire    t_Q    ;
        wire    t_Q_n  ;

        sr_latch_en_3 dut (
                .i_S   ( t_S   ),
                .i_R   ( t_R   ),
                .i_En  ( t_En  ),
                .o_Q   ( t_Q   ),
                .o_Q_n ( t_Q_n )
        );

        initial begin
                // En=1로 켜고 set
                t_En = 1'b1 ; t_S = 1'b1 ; t_R = 1'b0 ;   // set   : Q=1
                #10 ;
                t_En = 1'b1 ; t_S = 1'b0 ; t_R = 1'b1 ;   // reset : Q=0
                #10 ;
                // En=0 -> 값 유지 확인 (핵심)
                t_En = 1'b0 ; t_S = 1'b1 ; t_R = 1'b0 ;   // En=0, Q=0 유지
                #10 ;
                t_En = 1'b0 ; t_S = 1'b0 ; t_R = 1'b1 ;   // En=0, Q=0 유지
                #10 ;
                // 다시 En=1
                t_En = 1'b1 ; t_S = 1'b1 ; t_R = 1'b0 ;   // set   : Q=1
                #10 ;
                t_En = 1'b0 ; t_S = 1'b0 ; t_R = 1'b1 ;   // En=0, Q=1 유지
                #10 ;
                t_En = 1'b1 ; t_S = 1'b1 ; t_R = 1'b1 ;   // forbidden : Q=1,Q_n=1
                #10 ;
                t_En = 1'b1 ; t_S = 1'b0 ; t_R = 1'b0 ;   // hold : 이전값 유지
                #10 ;
                $finish ;
        end

        initial begin
                $monitor("time=%0t | En=%b S=%b R=%b | Q=%b Q_n=%b",
                          $time, t_En, t_S, t_R, t_Q, t_Q_n);
        end

        initial begin
                $dumpfile("tb_sr_latch_en_3.vcd");
                $dumpvars(0, tb_sr_latch_en_3);
        end

endmodule
