`include "Asyc_Counter.v"
`timescale 10ps/1ps
module Asyn_tb;
    reg clk, reset;
    wire [3:0] count;
    asyc_count uut (clk, reset, count);
    initial begin
        $dumpfile("Asyn_Counter_tb.vcd");
        $dumpvars(0, Asyn_tb);
        clk = 0;    
        reset = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 reset = 1;
    end
    always #5 clk = ~clk;
endmodule
