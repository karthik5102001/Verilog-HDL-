module cyclic_lamp (clock,light);
input clock;
output reg [0:2] light;
parameter Red = 3'b100, Green = 3'b010, Yellow = 3'b001;
reg [0:1] state;
parameter S0 = 0, S1 = 1, S2 = 3;
always @ (posedge clock)
case (state)
S0 : state <= S1;
S1 : state <= S2;
S2 : state <= S0;
default : state <= S0;
endcase
always @ (state)
case (state)
S0 : light <= Red;
S1 : light <= Green;
S2 : light <= Yellow;
default : light <= Red;
endcase
endmodule
