`timescale 1ns / 1ps

module tb_pipeline;

    reg  [9:0]  in1, in2, in3;
    reg         clk, rst;
    wire [11:0] out;

    pipeline dut (
        .in1 (in1),
        .in2 (in2),
        .in3 (in3),
        .out (out),
        .clk (clk),
        .rst (rst)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        rst = 1'b0;
        in1 = 10'd0; in2 = 10'd0; in3 = 10'd0;
        #12;
        rst = 1'b1;

        in1 = 10'd100; in2 = 10'd200; in3 = 10'd50;
        @(posedge clk);

        in1 = 10'd1023; in2 = 10'd1023; in3 = 10'd1023;
        @(posedge clk);

        in1 = 10'd10; in2 = 10'd20; in3 = 10'd30;
        @(posedge clk);

        in1 = 10'd0; in2 = 10'd0; in3 = 10'd0;
        repeat (4) @(posedge clk);

        $stop;
    end
    initial begin
	$dumpfile("./pipeline.vcd");
	$dumpvars(0, dut);
    end	

endmodule
