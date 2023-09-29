module bitshift(a, e,clock , clear);
input a, clock, clear;
output reg e;
reg b, c, d;
always @ (posedge clock , negedge clear)
begin
    if (clear == 0)  begin b<=0; c<=0; d<=0; e<=0; end 
        else begin
            e <= d;
            d <= c;
            c <= b;
            b <= a;         
end
end
endmodule