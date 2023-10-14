// FILE NAME :  NAND_gate.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : Simple Transmission NAND Gate
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 14/10/2023
// *******************************************************
 module NAND (X, A, B);
    
    input A, B;
    output X;
    supply0 GND;
    supply1 VDD;
    wire xy;

    pmos P1 ( X, VDD, A);
    pmos P2 ( X, VDD, B);

    nmos N1 ( X,xy, A);
    nmos N2 ( xy, GND, B);
  
 endmodule
