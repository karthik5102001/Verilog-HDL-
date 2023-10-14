`include "NAND_gate.v"
`timescale 10ps/1ps

module NAND_TEST;

reg A, B;
wire X;
integer i;

NAND U1 (X, A, B);

initial
begin
    for (i=0; i<4; i=i+1)
    begin 
        #5 {A, B} = i;
    #5 $display("X=%b, A=%b, B=%b", X, A, B);
    end

end

endmodule