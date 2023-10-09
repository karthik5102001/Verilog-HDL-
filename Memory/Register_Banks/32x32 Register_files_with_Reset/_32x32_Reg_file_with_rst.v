// FILE NAME : _32x32_Reg_file_with_rst.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : 32 cross 32 bit register file with reset
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 02/10/2023
// *******************************************************



module regbank_32x32_rst (rdData1, rdData2, wrData, Sr1, Sr2, dr, write, clk, reset);
    
    input write, clk, reset;
    input [4:0] Sr1, Sr2, dr;
    input [31:0] wrData;
    output [31:0] rdData1, rdData2;
    integer k ;
    
    reg [31:0] regfile [0:31] ;

    assign rdData1 = regfile[Sr1];     // assign rdData1 = regfile[Sr1];
    assign rdData2 = regfile[Sr2];     // assign rdData2 = regfile[Sr2];
 
    always @(posedge clk)
        begin
            if (reset) begin 
                for (k=0; k<32; k=k+1)
                    regfile[k] <= 0;      // regfile[k] <= 0;
                 end
            else begin if (write)
                begin
                    regfile[dr] <= wrData;   // regfile[dr] <= wrData;
                end
        end
        end
endmodule
