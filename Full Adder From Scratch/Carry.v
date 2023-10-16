// FILE NAME :  Carry.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : Calculating Carry   
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 15/10/2023
// *******************************************************

`include "NAND.v"
`timescale 10ps/1ps


module FA_carry(out, a, b, cin);
    output out; 
    input a, b, cin;
    wire T1, T2, T3, T4, T5;

    cmosnand N1 (T1, a, b);
    cmosnand N2 (T2, a, cin);
    cmosnand N3 (T3, T1, T2);
    cmosnand N4 (T5, b, cin);
    cmosnand N5 (T4, T3, T3);
    cmosnand N6 (out, T4, T5);

endmodule

