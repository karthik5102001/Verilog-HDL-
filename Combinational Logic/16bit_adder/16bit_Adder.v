`include "4bit_Adder.v"
module Adder_16bit  ( x, y, z, c1, carry);
   input [15:0] x, y;
   input c1;
    output [15:0] z;
    output carry;
    wire [15:0] z;
    wire [2:0] c;
   Adder_4bit a1(x[3:0], y[3:0], c[0], z[3:0], c1);
    Adder_4bit a2(x[7:4], y[7:4], c[1], z[7:4], c[0]);
   Adder_4bit a3(x[11:8], y[11:8], c[2], z[11:8], c[1]);
   Adder_4bit a4(x[15:12], y[15:12], carry, z[15:12], c[2]);
endmodule
