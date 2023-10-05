`include "DataPath.v"
`include "Controller.v"
`timescale 10ns/1ns

module GCD_test;

reg [15:0] data_in;
reg clk, start;
reg [15:0] a,b;
wire done;

GCD Dp (gt, lt, eq, lda, ldb, sel_1, sel_2, sel_in, data_in, clk);
controller C (lda, ldb, sel_1, sel_2, sel_in, done, clk, gt, lt, eq, start);

initial begin 
clk = 0;
#3 start = 1;
#1000 $finish;
end
 always #5 clk = ~clk;

 initial begin 
    #12 data_in = 143;
    #10 data_in = 78;
    end

initial begin
       $monitor ($time,"%d %b", Dp.y, done);
       $dumpfile ("GCD_Test.vcd");
       $dumpvars (0, GCD_test);
       end
endmodule    