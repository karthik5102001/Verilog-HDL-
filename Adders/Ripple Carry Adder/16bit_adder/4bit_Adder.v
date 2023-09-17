`include "fulladder.v"
module Adder_4bit (a, b, carry, sum, cin);
   input [15:0] a, b;
   input cin;
    output [15:0] sum;
    output carry;
    wire [15:0] sum;
    wire  c1,c2,c3;

    fulladder fa1(a[0], b[0], cin, sum[0], c1);
    fulladder fa2(a[1], b[1], c1, sum[1], c2);
    fulladder fa3(a[2], b[2], c2, sum[2], c3);
    fulladder fa4(a[3], b[3], c3, sum[3], carry);
endmodule
