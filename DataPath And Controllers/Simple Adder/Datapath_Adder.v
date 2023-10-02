/*  module MUL_datapath (eqz, ldA, ldB, ldP, clrP, decB, Data_in, clk);
input ldA, ldB, ldP, clrP, decB, clk;
input [15:0] Data_in;   
output  eqz;
wire [15:0] x, y, z, Bout, Bus;
PiPo_1 A (x, Bus, ldA,clk);
PiPo_2 B (y, Z, ldP, clrP, clk);
CNTR B (Bout, Bus, ldB, decB, clk);
Adder A (z, x, y);
eqz Comp (eqz, Bout);
endmodule
    */
// PiPo for A data path 
module PiPo_1 (dout, din, ld, clk);
input [15:0] din;
input ld, clk;
output reg [15:0] dout;
always @(posedge clk)
if (ld) dout <= din;
endmodule

//PiPo for B data path
module PiPo_2 (dout, din, ld, clr, clk);
input [15:0] din;
input ld, clr, clk;
output reg [15:0] dout;
always @(posedge clk)
if (ld) dout <= din;
else if (clr) dout <= 16'b0;
endmodule

//Counter for B data path
module CNTR (dout, din, ld, dec, clk);
input [15:0] din;   
input ld, dec, clk;
output reg [15:0] dout;
always @(posedge clk)
if (ld) dout <= din;
else if (dec) dout <= dout - 1;
endmodule

//Adder for A and B data path
module Adder (dout, din1, din2);
input [15:0] din1, din2;
output reg [15:0] dout;
always @(*)
dout = din1 + din2;
endmodule

//Comparator for B data path
module Comp (eqz, din);
input [15:0] din;
output reg eqz;
assign eqz = din ^ 16'b0;
endmodule

// Path: Datapath_Multiplier.v
module MUL_datapath (eqz, ldA, ldB, ldP, clrP, decB, Data_in, clk);
input ldA, ldB, ldP, clrP, decB, clk;
input [15:0] Data_in;
output  eqz;
wire [15:0] x, y, z, Bout, Bus;
PiPo_1 A (x, Bus, ldA,clk);
PiPo_2 B (y, Z, ldP, clrP, clk);
CNTR B (Bout, Bus, ldB, decB, clk);
Multiplier A (z, x, y);
eqz Comp (eqz, Bout);
endmodule

