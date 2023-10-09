// FILE NAME : 4x32_Registor_file.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : 4 cross 32 bit register file
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 02/10/2023
// *******************************************************


module  reg_bank_4x32 (rdData1, rdData2, wrData, Sr1, Sr2, dr, write, clk);
    
    input write, clk;
    input [1:0] Sr1, Sr2, dr;
    input [31:0] wrData;
    output reg [31:0] rdData1, rdData2;
    reg [31:0] R0, R1, R2, R3;

    
    assign rdData1 = (Sr1 == 0) ? R0 :       // 4x32 register file
                     (Sr1 == 1) ? R1 :       // Sr1, Sr2 are the select lines
                     (Sr1 == 2) ? R2 :       
                     (Sr1 == 3) ? R3 : z;

    assign rdData2 = (Sr2 == 0) ? R0 :
                     (Sr2 == 1) ? R1 :
                     (Sr2 == 2) ? R2 :
                     (Sr2 == 3) ? R3 : z;

    always @(posedge clk)
        begin
            if (write)
                begin
                    case (dr)                      // dr is the destination register
                        2'b00: R0 <= wrData;       // wrData is the data to be written
                        2'b01: R1 <= wrData;       // into the register file
                        2'b10: R2 <= wrData;       // write is the write enable signal
                        2'b11: R3 <= wrData;       // clk is the clock signal
                    endcase                        // rdData1, rdData2 are the output
                end                                // data from the register file
        end                                        // R0, R1, R2, R3 are the registers
endmodule