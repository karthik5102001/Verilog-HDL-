`timescale 10ns/1ns
module GCD ( gt, lt, eq, lda, ldb, sel_1, sel_2, sel_in, data_in, clk);

input lda, ldb, sel_1, sel_2, sel_in, clk;
input [15:0] data_in;
output gt, lt, eq;
wire [15:0] aout, Bout, x, y, bus, subout;
assign bus = data_in;

pipo a (aout, bus, lda,clk);
pipo b (Bout, bus, ldb,clk);
mux mux_1  (x, aout, Bout, sel_1);
mux mux_2 (y, aout, Bout, sel_2);
mux mux_load (bus, subout, data_in, sel_in);
sub sb (subout, x, y );
compare comp(gt, lt, eq, aout, Bout);

endmodule
 

// Path: mux.v
`timescale 10ns/1ns
module mux (out, in1, in2, sel);

input [15:0] in1, in2;
input sel;
output [15:0] out;
assign out = sel ? in1 : in2;

endmodule


// Path: pipo_1.v
`timescale 10ns/1ns
module pipo (out, in, load, clk);

input [15:0] in;
input load, clk;
output reg [15:0] out;
always @(posedge clk)
begin
if (load)
out <= in;
end

endmodule

// Path: sub.v
`timescale 10ns/1ns
module sub (out, in1, in2);

input [15:0] in1, in2;
output reg [15:0]  out;
always @(*)
      out = in1 - in2;

endmodule


// Path: compare.v
`timescale 10ns/1ns
module compare (gt, lt, eq, in1, in2);

input [15:0] in1, in2;
output gt, lt, eq;
assign gt = (in1 > in2);
assign lt = (in1 < in2);
assign eq = (in1 == in2);

endmodule