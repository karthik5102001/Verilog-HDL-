`include "JK-FF.v"
`timescale 10ps/1ps
module JKFF;
reg  i;
integer l;
reg j, k, clk, clr;
wire q;
JK jk0 (q, j, k, clk, clr);
initial begin
    $dumpfile("JK-FF_tb.vcd");
    $dumpvars(0, JKFF);
    $monitor ("[T=%0t] j=%b k=%b clk=%b clr=%b q=%b", $time, j, k, clk, clr, q);        
        #1 clr <= 1;
        #1 clr <= 0; 
        #1 clk <= 0;
        #3 clk <= 1;
     #3 j <= 0;  
     #3 k <= 0;  
     #3 clk <= 0;
     #5 clk <= 1;
      #5 j <= 0;  
         k <= 1; 
        #5 clk <= 0;
        #20 clk <= 1; 
      #20 j <= 1;  
          k <= 0;
        #20 clk <= 0;
        #22 clk <= 1;  
      #22 j <= 1;  
          k <= 1;
        #22 clk <= 0;  
         #25 clk <= 1;  
      #25 j <= 1;  
          k <= 1;
        #25 clk <= 0; 
      #30 $finish;  
   end
endmodule

