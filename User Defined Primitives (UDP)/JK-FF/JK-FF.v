primitive JK ( q, j, k, clk, clr );
input j, k, clk, clr;
output  q;
reg q;
table 
       ? ? ? 1 : ? : 0;
       ? ? ? 0 : ? : -;
       0 0 1 0 : ? : -;
       0 1 1 0 : 0 : 1;
       1 0 1 0 : 1 : 0;
       1 1 1 0 : 1 : 0;
       1 1 1 0 : 0 : 1;
       ? ? 1 0 : ? : -;
endtable
endprimitive
