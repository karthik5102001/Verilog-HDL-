`include "D-FlipFlop_Negative_edge.v"
`timescale 1ns/10ps
module DFF_negedge_TB;
reg D, CLK;
wire Q, Qbar;
DFF_negedge DFF_negedge_0 (D, CLK, Q, Qbar);
initial
begin
$dumpfile("D-FlipFlop_Negative_edge_TB.vcd");
$dumpvars(0, DFF_negedge_TB);
CLK = 0;
D = 0;
#10
D = 1;
#10
D = 0;
#10
D = 1;
#10
D = 0;
#10
D = 1;
#10
D = 0;
end
always
#5 CLK = ~CLK;
initial
#100 $finish;
endmodule