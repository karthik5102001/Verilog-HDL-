`include "4-bit_ShiftReg.v"
module Bit_test;
reg a, clock, clear;
wire e;
bitshift uut (a, e, clock, clear);


initial begin
  clock = 0; #2 clear = 0; #5 clear = 1; end


  always #5 clock = ~clock;
 
 
initial begin #2
  repeat (2) begin
    #10 a = 1'b0; #10 a = 1'b0; #10 a= 1'b1; #10 a = 1'b1;  end
 end


 initial begin
    $dumpfile("4_Bit_test.vcd");
    $dumpvars(0, Bit_test);
    $monitor($time, " a=%b, e=%b ", a, e);
    #150 $finish;
    end
endmodule


