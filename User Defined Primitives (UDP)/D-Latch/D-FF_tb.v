`include "D-FF.v"
module tb;  
  reg clk, d;  
  reg [1:0] dly;  
  wire q;  
  integer i;  
  
  d_flop u_flop (q, clk, d);  
  
  always #10 clk = ~clk;  
  
  initial begin  
    $dumpfile("D-FF_tb.vcd");
    $dumpvars(0, tb);
    clk = 0;  
  
    $monitor ("[T=%0t] clk=%0b d=%0b q=%0b", $time, clk, d, q);  
  
    #10;   
  
    for (i = 0; i < 10; i = i+1) begin  
      dly = $random;  
      repeat(dly) @(posedge clk);  
      d <= $random;  
    end  
  
    #20 $finish;  
  end  
endmodule  