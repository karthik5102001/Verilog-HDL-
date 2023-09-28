primitive TFF ( q, clk, clrS);
output  q; 
input   clk, clr;
reg     q;
    table
        // clk clr : q : q_new
            ?   1  : ? : 0 ;  // ignore the output if clear is one
            ?  (10): ? : - ;  // ignore the output if clock is unknown
          (10)  0  : 1 : 0 ; 
          (10)  0  : 0 : 1 ;
          (0?)  0  : ? : - ;  // ignore the output if it is positive edge
    endtable
endprimitive
