`include "Parity_checker.v"
`timescale 10ns/1ns
module test ;
    reg x, clk;
    wire z;
    checker checker1(x, clk, z);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
       // $monitor("x=%b, z=%b", x, z);   
    end
    initial begin
        $dumpfile("Testing_parity.vcd");
        $dumpvars(0, test);
        begin #2
        x = 0; #10 x=0; #10 x = 1; #10 x = 1; #10 x = 1; #10 x = 1; #10 x = 1;
         #10 x=0; #10 x = 1; #10 x = 1; #10 x = 0; #10 x = 1; #10 x = 1;
        end
        $finish;
    end
endmodule