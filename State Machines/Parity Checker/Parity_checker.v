module checker(x, clk, z);
input x, clk;
output reg z;
parameter odd = 1, even = 0;
reg even_odd;
always @(posedge clk)
case (even_odd) 
  even : even_odd  <= x ? odd : even;
    odd  : even_odd  <= x ? even : odd;
    default: even_odd <= even;
endcase
always @(even_odd)
  case (even_odd)
    even : z <= 0;
    odd  : z <= 1;
    endcase
endmodule
