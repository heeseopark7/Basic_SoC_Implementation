`timescale 1ns / 1ps
//tb_comparator.v
module tb_comparator;

    reg  [31:0] i_a;
    reg  [31:0] i_b;
    wire        o_equal;
    wire        o_greater;
    wire        o_less;

    comparator uut (
        .i_a       (i_a),
        .i_b       (i_b),
        .o_equal   (o_equal),
        .o_greater (o_greater),
        .o_less    (o_less)
    );

    initial begin
        $dumpfile("./comparator.vcd");
        $dumpvars(0, tb_comparator);
    end

    initial begin
        $monitor("Time=%0t | a=%0d b=%0d | eq=%b gt=%b lt=%b",
                  $time, i_a, i_b, o_equal, o_greater, o_less);

        // 1) a < b
        i_a = 32'd10;          i_b = 32'd20;          #10;

        // 2) a > b
        i_a = 32'd100;         i_b = 32'd50;          #10;

        // 3) a == b
        i_a = 32'd12345;       i_b = 32'd12345;       #10;

        // 4) 둘 다 0
        i_a = 32'd0;           i_b = 32'd0;           #10;

        // 5) 최댓값 vs 0 (경계값)
        i_a = 32'hFFFF_FFFF;   i_b = 32'd0;           #10;

        // 6) 최댓값끼리 (경계값 동등)
        i_a = 32'hFFFF_FFFF;   i_b = 32'hFFFF_FFFF;   #10;

        // 7) 딱 1 차이 (a가 1 작음)
        i_a = 32'h8000_0000;   i_b = 32'h8000_0001;   #10;

        // 8) 딱 1 차이 (a가 1 큼)
        i_a = 32'h8000_0001;   i_b = 32'h8000_0000;   #10;

        #10;
        $finish;
    end

endmodule
