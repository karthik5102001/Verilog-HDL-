module combinational_mux2 (input in1,in0, select, output reg out);
    always @ (in1 or in0 or select)
    begin
        if (select)
            out = in1;
        else
            out = in0;
    end
endmodule
