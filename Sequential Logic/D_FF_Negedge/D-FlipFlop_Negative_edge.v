module DFF_negedge (D, CLK, Q, Qbar);
input D, CLK;
output reg Q, Qbar;
always @(negedge CLK)
begin
Q = D;
Qbar = ~D;
end
endmodule