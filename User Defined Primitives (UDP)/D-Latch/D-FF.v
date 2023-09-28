primitive d_flop (q, clk, d);  
    output  q;  
    input   clk, d;  
    reg     q;  
  
    table // clk    d       Q       Q_new
            (01)    0   :   ?   :   0;  
            (01)    1   :   ?   :   1;  
            (0?)    1   :   1   :   1;  
            (0?)    0   :   0   :   0;   
            (?0)    ?   :   ?   :   -;  
            ?      (??) :   ?   :   -;  
    endtable  
  
endprimitive  