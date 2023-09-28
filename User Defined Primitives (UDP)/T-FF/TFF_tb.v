`include "T-FF.v"
`timescale 10ps/1ps
module tff;
 wire q;
reg  clk, clr;
integer i;
TFF tff(q, clk, clr);
initial begin
    $dumpfile("TFF_tb.vcd");
    $dumpvars(0, tff);
    $monitor("[T=%0t] clock=%0d clear=%0d output=%0d", $time, clk, clr, q);
    clk = 0;
    #10 clr = 1;
    #10 clr = 0;
    for (i = 0; i < 10; i = i+1) begin
        clk = 0;
        #10 clk = 1;
        #10 clk = 0;
    end
    #100 $finish;
end
endmodule