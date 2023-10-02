`timescale 10ns / 1ns
`include "16bit_Adder.v"
module alutest;
 reg [15:0] x, y;
   reg cin;
    wire [15:0] z;
    wire carry;
   Adder_16bit alu1 (x,y,z,cin,carry);
    initial
        begin
            $dumpfile("alutest.vcd");
            $dumpvars(0,alutest);
            $monitor ($time," x=%h y=%h cin=%h z=%h carry=%h",x,y,cin,z,carry);
            #5 x=16'h8fff ;y=16'h8000; cin=1'b0;
            #5 x=16'h0000 ;y=16'h0002; cin=1'b1;
            #5 x=16'h0001 ;y=16'h5555; cin=1'b1;
            #5 x=16'h0001 ;y=16'h1111;  cin=1'b0;
            #10 x=16'h0000;y=16'hffff;  cin=1'b1;
            #5 $finish;
        end
endmodule
