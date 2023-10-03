`include "DataPath_Mul.v"
`include "ControllerPath_Mul.v"
module Mul_test;
reg [15:0] data_in;
reg clk, start;
wire done;
 
MUL_datapath MUL (eqz, ldA, ldB, ldP, clrP, decB, data_in, clk);
controller CTRL (ldA, ldB, ldP, clrP, decB, done, clk, eqz, start);
initial 
begin
clk = 0;
#3 start = 1;
#100 $finish;
end
always #5 clk = ~clk;
initial 
begin 
    #17 data_in = 17;
    #10  data_in = 5;
end

initial begin
   $monitor ($time,"%d %b",MUL.y, done);
    $dumpfile("mul.vcd");
    $dumpvars(0, Mul_test);
end
endmodule
