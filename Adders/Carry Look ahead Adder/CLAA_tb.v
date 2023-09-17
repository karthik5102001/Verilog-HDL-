`timescale 10ns / 1ns
`include "CLAA.v"
module alutest;
 reg [3:0] x, y;
   reg cin;
    wire [3:0] z;
    wire carry;
    adder4  alu1 ( z, carry, x, y, cin);
  
    initial
        begin
            $dumpfile("alutest.vcd");
            $dumpvars(0,alutest);
            $monitor ($time," x=%h y=%h cin=%h z=%h carry=%h",x,y,cin,z,carry);
            #5 x=4'h8;      y=4'h8;      cin=1'b0;
            #5 x=4'hf;      y=4'h0;     cin=1'b0;
            #5 x=4'h1;      y=4'h5;     cin=1'b1;
            #5 x=4'h8;      y=4'h2;     cin=1'b0;
            #5 x=4'h1;     y=4'hf;     cin=1'b1;
            #5 $finish;
        end
endmodule
