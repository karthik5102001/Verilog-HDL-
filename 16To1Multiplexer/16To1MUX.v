module mux16To1 (in , sel , out);
input [15:0] in;
input [3:0] sel;
output out;
  
  assign out = in[sel];

endmodule