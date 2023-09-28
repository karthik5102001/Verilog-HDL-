module RCA_G(carry_out, sum_out, a, b, carry_in);
parameter N = 8 ;
input [N-1:0] a, b;
input carry_in;
output [N-1:0] sum_out;
wire [N:0] carry ;
output carry_out;
assign carry[0] = carry_in;
assign carry_out = carry[N];
genvar i;
generate for (i = 0; i < N; i = i + 1)
    begin
        wire t1, t2, t3;
        xor g1 (t1, a[i], b[i]);
        xor g2 (sum_out[i], t1, carry[i]);
        and g3 (t2, a[i], b[i]);
        and g4 (t3, t1, carry[i]);
        or  g5 (carry[i+1], t2, t3);
    end
endgenerate
endmodule