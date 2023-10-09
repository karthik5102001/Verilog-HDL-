// FILE NAME : 32x32_Reg_file.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : 32 cross 32 bit register file
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 02/10/2023
// *******************************************************


module regbank_32x32 (rdData1, rdData2, wrData, Sr1, Sr2, dr, write, clk);
    
    input write, clk;
    input [4:0] Sr1, Sr2, dr;
    input [31:0] wrData;
    output [31:0] rdData1, rdData2;
    
    reg [31:0] regfile [0:31] ;

    assign rdData1 = regfile[Sr1];
    assign rdData2 = regfile[Sr2];

    always @(posedge clk)
        begin
            if (write)
                begin
                    regfile[dr] <= wrData;
                end
        end
endmodule
