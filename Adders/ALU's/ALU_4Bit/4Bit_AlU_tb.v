`include "4Bit_AlU.v"
`timescale 1ps/1ps
module Bit_AlU_tb;
reg [3:0] a,b;  
reg [1:0] op;
wire [3:0] f;
parameter ADD = 2'b00, SUB = 2'b01, MUL = 2'b10, DIV = 2'b11;
ALU_4bit DUT(f,a,b,op);   
initial
begin
    $dumpfile("4Bit_AlU_tb.vcd");
    $dumpvars(0,Bit_AlU_tb);
    $monitor("a=%b, b=%b, op=%b, f=%b",a,b,op,f);
    a = 4'b0000; b = 4'b0000; op = ADD; #10;
    a = 4'b0000; b = 4'b0001; op = ADD; #10;
    a = 4'b0001; b = 4'b0000; op = ADD; #10;
    a = 4'b0001; b = 4'b0001; op = ADD; #10;
    a = 4'b0000; b = 4'b0000; op = SUB; #10;
    a = 4'b0000; b = 4'b0001; op = SUB; #10;
    a = 4'b0001; b = 4'b0000; op = SUB; #10;
    a = 4'b0001; b = 4'b0001; op = SUB; #10;
    a = 4'b0000; b = 4'b0000; op = MUL; #10;
    a = 4'b0000; b = 4'b0001; op = MUL; #10;
    a = 4'b0001; b = 4'b0000; op = MUL; #10;
    a = 4'b0001; b = 4'b0001; op = MUL; #10;
    a = 4'b0000; b = 4'b0000; op = DIV; #10;
    a = 4'b0000; b = 4'b0001; op = DIV; #10;
    a = 4'b0001; b = 4'b0000; op = DIV; #10;
    a = 4'b0001; b = 4'b0001; op = DIV; #10;
end
endmodule