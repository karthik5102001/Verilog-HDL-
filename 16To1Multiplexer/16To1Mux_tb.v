`timescale 10ns / 1ns
`include "mux16To1.v"
module muxtext;
   reg [15 : 0] A;
   reg [3:0] S;
   wire F;
   mux16To1 M1 (.in(A), .sel(S), .out(F));
   initial begin
     $dumpfile("muxtext.vcd");
        $dumpvars(0, muxtext);
        $monitor($time, " A=%h S=%h F=%b", A, S, F);
        #5 A = 16'h3f0a; S = 4'h0;
        #5 S = 4'h1;
        #5 S = 4'h2;
        #5 S = 4'h6;
        #5 S = 4'hc;
        #5 S = 4'hf;
        #5 $finish;
   end  
    
endmodule