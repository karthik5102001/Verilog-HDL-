`include "mux2To1.v"
module mux4To1 (in , sel , out);
    input [3:0] in;
    input [1:0] sel;
    output out;
    wire [1:0] t;

mux2To1 m0 (in[1:0], sel[0], t[0]);
mux2To1 m1 (in[3:2], sel[0], t[1]);
mux2To1 m2 (t[1:0], sel[1], out);
endmodule   