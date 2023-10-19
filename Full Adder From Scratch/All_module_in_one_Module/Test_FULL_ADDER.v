// FILE NAME :  Test_FULL_ADDER.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : Test bench for Full Adder    
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 15/10/2023
// *******************************************************



//`include "Full_Adder.v"
`include "ALL_Module.v"
`timescale 10ps/1ps

module Test_FULL_ADDER;

    reg a, b, cin;
    wire sum, carry;
    integer i;    

    Full_Adder FA(sum, carry, a, b, cin);

    initial begin
        for (i=0; i<8; i=i+1)
        #5 {a,b,cin} = i;
        $display("Inputs=%3b, sum=%3b, carry=%3b", {a,b,cin}, sum, carry);
    end

    /*initial begin    
        $dumpfile("Full_Adder.vcd");
        $dumpvars(0, Test_FULL_ADDER);
    end */
    
endmodule