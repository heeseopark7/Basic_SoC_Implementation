`timescale 1ns / 1ps
module tb_seq_detector;

        reg     t_x    ;
        reg     t_Clk  ;
        reg     t_nRst ;
        wire    t_y    ;

        seq_detector dut (
                .i_x    ( t_x    ),
                .i_Clk  ( t_Clk  ),
                .i_nRst ( t_nRst ),
                .o_y    ( t_y    )
        );

        initial begin
                t_Clk = 1'b0 ;
                forever #5 t_Clk = ~t_Clk ;
        end

        initial begin
                t_nRst = 1'b0 ; t_x = 1'b0 ; #12 ;
                t_nRst = 1'b1 ;

                t_x = 1'b1 ; #10 ;   // S0->S1
                t_x = 1'b1 ; #10 ;   // S1->S2
                t_x = 1'b1 ; #10 ;   // S2->S3, y=1
                t_x = 1'b1 ; #10 ;   // S3->S3, y=1 

                t_x = 1'b0 ; #10 ;   // S3->S0

                t_x = 1'b1 ; #10 ;   // S0->S1
                t_x = 1'b1 ; #10 ;   // S1->S2
                t_x = 1'b1 ; #10 ;   // S2->S3, y=1

                t_x = 1'b0 ; #10 ;   // S3->S0
                $finish ;
        end

        initial begin
                $monitor("time=%0t | nRst=%b x=%b state=%b | y=%b",
                          $time, t_nRst, t_x, dut.r_state, t_y);
        end

        initial begin
                $dumpfile("tb_seq_detector.vcd");
                $dumpvars(0, tb_seq_detector);
        end

endmodule
