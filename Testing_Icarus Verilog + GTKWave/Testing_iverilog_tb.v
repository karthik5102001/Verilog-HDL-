`timescale 1ns / 1ns
`include "Testing_iverilog.v"
 
module Testing_iverilog_tb;
 
reg A;
wire b;
 
Testing_iverilog dut (A,b); 
 
 initial begin
    $dumpfile("Testing_iverilog_tb.vcd");
    $dumpvars(0,Testing_iverilog_tb);
    $display("A b");
    A = 0;
    #10 ;
    A = 1;
    #20 ;
    A = 0 ;
    #20 ;
    $display("TestComplete");
    $finish;
 end
endmodule

