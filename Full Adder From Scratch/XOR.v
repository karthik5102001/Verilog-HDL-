// FILE NAME :  XOR.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : Simple XOR gate    
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 15/10/2023
// *******************************************************


`include "NAND.v"
`timescale 10ps/1ps


module myXOR ( out, a, b );
    output out; 
    input a, b;
    wire T1, T2, T3, T4;

    cmosnand N1 (T1, a,a);
    cmosnand N2 (T2, b,b);
    cmosnand N3 (T3, a, T2);
    cmosnand N4 (T4, b, T1);
    cmosnand N5 (out, T3, T4);

endmodule