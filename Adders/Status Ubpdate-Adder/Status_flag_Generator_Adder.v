module alu (x,y,z,sign,zero,overflow,carry,parity);
input [15:0] x,y;
output [15:0] z;
output sign,zero,overflow,carry,parity;
wire [15:0] z;
wire sign,zero,overflow,carry,parity;
assign {carry,z} = x + y;
assign sign = z[15];
assign zero = ~|z;
assign overflow = (x[15] == y[15]) && (z[15] != x[15]);
assign carry = (x[15] && y[15]) || (x[15] && ~z[15]) || (y[15] && ~z[15]);
assign parity = ~^z;
endmodule