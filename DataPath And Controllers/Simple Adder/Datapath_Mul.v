
`timescale 1ns / 1ps
module MUL_datapath (eqz, ldA, ldB, ldP, clrP, decB, Data_in, clk);

input ldA, ldB, ldP, clrP, decB, clk;
input [15:0] Data_in;   
output  eqz;
wire [15:0] x, y, z, Bout, Bus;
assign Bus = Data_in;
PiPo_1 A (x, Bus, ldA,clk);
PiPo_2 P (y, z, ldP, clrP, clk);
CNTR B (Bout, Bus, ldB, decB, clk);
Adder AD (z, x, y);
Comp  EQ (eqz, Bout);
endmodule
    
// PiPo for A data path 
`timescale 1ns / 1ps
module PiPo_1 (dout, din, ld, clk);

input [15:0] din;
input ld, clk;
output reg [15:0] dout;
always @(posedge clk)begin  
if (ld) dout <= din; end
endmodule

//PiPo for B data path
`timescale 1ns / 1ps
module PiPo_2 (dout, din, ld, clr, clk);

input [15:0] din;
input ld, clr, clk;
output reg [15:0] dout;
always @(posedge clk)
begin
if (clr) dout <= 16'b0;
else if (ld) dout <= din;
end

endmodule

//Counter for B data path
`timescale 1ns / 1ps
module CNTR (dout, din, ld, dec, clk);

input [15:0] din;   
input ld, dec, clk;
output reg [15:0] dout;
always @(posedge clk) begin
if (ld) dout <= din;
else if (dec) dout <= dout - 1;end

endmodule

//Adder for A and B data path
`timescale 1ns / 1ps
module Adder (dout, din1, din2);

input [15:0] din1, din2;
output reg [15:0] dout;
always @(*)
dout = din1 + din2;

endmodule

//Comparator for B data path
`timescale 1ns / 1ps
module Comp(eqz,data);

input [15:0] data;
output eqz;
assign eqz=(data==0);

endmodule
