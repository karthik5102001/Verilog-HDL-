`timescale 10ns/ 1ns
`include "Status_flag_Generator_Adder.v"
module alutest;
 reg [15:0] x,y;
 wire [15:0] z;
 wire sign,zero,overflow,carry,parity;
 alu alu1(x,y,z,sign,zero,overflow,carry,parity);
 initial
      begin
        $dumpfile("alutest.vcd");
        $dumpvars(0,alutest);
        $monitor($time," x=%h y=%h z=%h sign=%h zero=%b overflow=%b carry=%b parity=%b",x,y,z,sign,zero,overflow,carry,parity);
        #5 x=16'h8fff ;y=16'h0000;   // sign
        #5 x=16'h0000 ;y=16'h0000;   // zero
        #5 x=16'hffff ;y=16'h8000;   // overflow
        #5 x=16'hffff;y=16'hffff;    // carry
        #5 x=16'h0fff ;y=16'hf000;   // parity
        #5 $finish;
      end
endmodule

