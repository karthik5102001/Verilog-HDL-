// FILE NAME :  Sum.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : calculating Sum   
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 15/10/2023
// *******************************************************

`include "XOR.v"
`timescale 10ps/1ps


module FA_sum(sum, a, b, cin);
    output sum; 
    input a, b, cin;
    wire t1;

    myXOR X1 (t1, a, b);
    myXOR X2 (sum, t1, cin);

endmodule