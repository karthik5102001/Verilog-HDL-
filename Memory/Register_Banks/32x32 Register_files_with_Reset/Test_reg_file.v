`include "_32x32_Reg_file_with_rst.v"
`timescale 10ps/1ps

module Test_reg_file;

    reg write, clk, reset;
    reg [4:0] Sr1, Sr2, dr;
    reg [31:0] wrData;
    wire [31:0] rdData1, rdData2;
    integer k ;
    
    regbank_32x32_rst _32x32_rst (rdData1, rdData2, wrData, Sr1, Sr2, dr, write, clk, reset);
    
    initial clk = 0;

    always #5 clk = ~clk;
    initial
    begin 
        $dumpfile("Test_reg_file.vcd");
        $dumpvars(0, Test_reg_file);

        #1 reset = 1; write = 0;
        #5 reset = 0;
    end

    initial begin 
        #7 
        for (k=0; k<32; k=k+1) begin
            wrData = k;
            dr = k;
            write = 1;
            #10 write = 0;
        end

        #20 
        for (k=0; k<32; k=k+2) begin
            Sr1 = k;
            Sr2 = k+1;
            #10 $display("regfile1[%d]=%d, regfile2[%d]=%d", Sr1, rdData1, Sr2, rdData2);
        end
       #200 $finish;
    end
    
        endmodule
