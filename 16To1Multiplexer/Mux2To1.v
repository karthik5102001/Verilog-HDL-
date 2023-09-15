module mux2To1 (in , sel , out);
    input [1:0] in;
    input sel;
    output out;
    wire [2:0] t ;
    
    not g0 (t[0] , sel);
    and g1 (t[1] , in[0] , t[0]);
    and g2 (t[2], sel, in[1]);
    or g3 (out, t[1], t[2]);
endmodule    
