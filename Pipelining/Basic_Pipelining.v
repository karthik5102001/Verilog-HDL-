// FILE NAME : Basic_Pipelining.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : Pipelining of a basic ALU
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 10/10/2023
// *******************************************************



module Pipelining (F, A, B, C, D, Clk);

parameter n = 10;

input [n-1:0] A, B, C, D;
input Clk;
output [n-1:0] F;
reg [n-1:0] L12_x1, L12_x2, L12_D, L23_x3, L23_D, L34_F;     // for 4 stage pipeline, we need 4 registers as a latch
                                                             // tostore the intermediate results
assign F = L34_F;                                            // output of the pipeline is the output of the last stage

always @(posedge Clk)
  begin 
    L12_x1 <= #4 A+B;                                        // STAGE 1
    L12_x2 <= #4 C-D;
    L12_D <= D;
  end

always@(posedge Clk)
  begin
    L23_x3 <= #4 L12_x1 + L12_x2;                             // STAGE 2
    L23_D <= L12_D;
  end

always@(posedge Clk)    
  begin
    L34_F <= #4 L23_x3 * L23_D;                                // STAGE 3
  end 
endmodule
