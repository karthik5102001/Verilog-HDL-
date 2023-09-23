`include "Combinational_EX.v"
`timescale 1ns / 1ps
module mux_2;
    reg in1, in0, select;
    wire out;
    combinational_mux2 mux_2_0 (in1, in0, select, out);
    initial begin
        $dumpfile("mux_2.vcd");
        $dumpvars(0, mux_2);
        in1 = 0;
        in0 = 0;
        select = 0;
        #10 in1 = 1;
        #10 in0 = 1;
        #10 select = 1;
        #10 in1 = 0;
        #10 in0 = 0;
        #10 select = 0;
        #10 $finish;
    end
endmodule
