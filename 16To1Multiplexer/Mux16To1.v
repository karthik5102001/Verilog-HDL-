`include "mux4To1.v"
module mux16To1 (in , sel , out);
     input [15:0] in;
        input [3:0] sel;
        output out;
        wire [3:0] t;
        
mux4To1 m0 (in[3:0], sel[1:0], t[0]);  
mux4To1 m1 (in[7:4], sel[1:0], t[1]);
mux4To1 m2 (in[11:8], sel[1:0], t[2]);
mux4To1 m3 (in[15:12], sel[1:0], t[3]);
mux4To1 m4 (t[3:0], sel[3:2], out);
endmodule
