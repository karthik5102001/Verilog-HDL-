// FILE NAME :  Full_Adder.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : Simple Full Adder
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 15/10/2023
// *******************************************************

`include "Sum.v"
`include "Carry.v"
`timescale 10ps/1ps

module Full_Adder( sum, carry, a, b, cin);
    output sum, carry;
    input a, b, cin;

    FA_sum FA1(sum, a, b, cin);              // FA_sum is a module
    FA_carry FA2(carry, a, b, cin);          // FA_carry is a module

endmodule


