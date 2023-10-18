//`include "Sum.v"
//`include "Carry.v"
`timescale 10ps/1ps

module Full_Adder( sum, carry, a, b, cin);
    output sum, carry;
    input a, b, cin;

    FA_sum FA1(sum, a, b, cin);              // FA_sum is a module
    FA_carry FA2(carry, a, b, cin);          // FA_carry is a module

endmodule


`timescale 10ps/1ps


module FA_sum(sum, a, b, cin);
    output sum; 
    input a, b, cin;
    wire t1;

    myXOR X1 (t1, a, b);
    myXOR X2 (sum, t1, cin);

endmodule


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



 module cmosnand (X, A, B);
    
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