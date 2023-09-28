`include "GenerateRipplecarry.v"
`timescale 10ns/1ns
module GenerateRipplecarry_tb;
parameter N = 8 ;
reg  [N-1:0] a, b;
reg carry_in;
wire [N-1:0] sum_out;
wire [N:0] carry ;
wire carry_out;
RCA_G dut(carry_out, sum_out, a, b, carry_in);
initial begin
    $dumpfile("GenerateRipplecarry_tb.vcd");
    $dumpvars(0, GenerateRipplecarry_tb);
    $monitor("a=%d, b=%d, carry_in=%b, sum_out=%d, carry_out=%b", a, b, carry_in, sum_out, carry_out);
    a = 0; b = 0; carry_in = 0;
    #10 a = 1; b = 1; carry_in = 0;
    #10 a = 2; b = 2; carry_in = 0;
    #10 a = 3; b = 3; carry_in = 0;
    #10 a = 11; b = 11; carry_in = 0;
    #10 a = 22; b = 22; carry_in = 0;
    #10 a = 32; b = 32; carry_in = 0;
    #10 a = 32; b = 32; carry_in = 1;
    #10 a = 32; b = 0; carry_in = 1;
    #10 a = 32; b = 1; carry_in = 1;
 /*   #10 a = 10; b = 10; carry_in = 0 ;
    #10 a = 11; b = 11; carry_in = 0 ;
    #10 a = 12; b = 12; carry_in = 0 ;
    #10 a = 13; b = 13; carry_in = 0 ;
    #10 a = 14; b = 14; carry_in = 0 ;
    #10 a = 15; b = 15; carry_in = 0 ;
    #10 a = 16; b = 16; carry_in = 0 ;
    #10 a = 17; b = 17; carry_in = 0 ;
    #10 a = 18; b = 18; carry_in = 0 ;
    #10 a = 19; b = 19; carry_in = 0 ;
    #10 a = 20; b = 20; carry_in = 0 ;   */
end
endmodule
