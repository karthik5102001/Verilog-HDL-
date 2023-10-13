// Testbench for Basic_Pipelining.v
`include"Basic_Pipelining.v"
`timescale 10ps/1ps

module Test_pipe;

parameter n = 10;

reg [n-1:0] A, B, C, D;
reg clk;
wire [n-1:0] F;


initial clk = 0;    
always #10 clk = ~clk;

Pipelining U1 (F, A, B, C, D, clk);

initial begin
    #5 A = 10; B = 12; C = 6; D = 3;
    #20 A = 20; B = 30; C = 40; D = 50;
    #20 A = 30; B = 40; C = 50; D = 60;
    #20 A = 40; B = 50; C = 60; D = 70;
    #20 A = 50; B = 60; C = 70; D = 80;
    #20 A = 60; B = 70; C = 80; D = 90;
    #20 A = 70; B = 80; C = 90; D = 100;
    #20 A = 80; B = 90; C = 100; D = 110;
    #20 A = 90; B = 100; C = 110; D = 120;

end

initial  begin
    $monitor ("Time=%0d, F=%0d", $time, F);
    $dumpfile("Test_pipeline.vcd");
    $dumpvars(0, Test_pipe);
     #300 $finish;
end
endmodule   