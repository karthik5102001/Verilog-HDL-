`include "Pipeline_with_Diff_clk.v"
//`timescale 10ps/1ps

module Test_pipeline;

reg [3:0] rs1, rs2, rd, func;
reg [7:0] addr;
reg CLK_1, CLK_2;
wire [15:0] Zout;
integer i;

pipelining_2 MYPIPE(Zout, rs1, rs2, rd, func, addr, CLK_1, CLK_2);

initial
begin 
    CLK_1 = 0; CLK_2 = 0;
    repeat(20)
    begin
    #5  CLK_1 = 1 ; #5  CLK_1 = 0;
    #5 CLK_2 = 1 ; #5 CLK_2 = 0;
end
end

initial 
begin 
    for(i=0; i<16; i=i+1)
    MYPIPE.regBank[i] = i;
end

initial
begin
    #5 rs1 = 3; rs2 = 5; rd = 10; func = 10; addr = 10;
    #10 rs1 = 2; rs2 = 3; rd = 1; func = 1; addr = 1;
    #10 rs1 = 1; rs2 = 2; rd = 2; func = 2; addr = 2;
    #10 rs1 = 0; rs2 = 1; rd = 3; func = 3; addr = 3;
    #10 rs1 = 15; rs2 = 14; rd = 4; func = 4; addr = 4;
    #10 rs1 = 14; rs2 = 13; rd = 5; func = 5; addr = 5;
    #10 rs1 = 13; rs2 = 12; rd = 6; func = 6; addr = 6;
    #10 rs1 = 12; rs2 = 11; rd = 7; func = 7; addr = 7;
    #10 rs1 = 11; rs2 = 10; rd = 8; func = 8; addr = 8;
    #10 rs1 = 10; rs2 = 9; rd = 9; func = 9; addr = 9;

#60  for( i=0; i<12; i=i+1 )
      $display("mem[%3d] = %d", i, MYPIPE.mem[i]);
end

initial 
begin
    $dumpfile("Test_pipeline.vcd");
    $dumpvars(0, Test_pipeline);
    $monitor("Time:%3d, Zout=%d",$time, Zout);
end

endmodule
    