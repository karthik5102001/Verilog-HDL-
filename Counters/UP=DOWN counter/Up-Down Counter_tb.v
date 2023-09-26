`include "Up-Down Counter.v"
`timescale 10ns/1ns
module Up_Down_Counter_tb;
reg mode, clear, clk, ld;
reg [7:0] d_in;
wire [7:0] count;
up_down uut(mode, clear, clk, ld, d_in, count);
  initial begin
    $dumpfile("Up-Down Counter_tb.vcd");
    $dumpvars(0, Up_Down_Counter_tb);
    $monitor("din=%b, count=%b, mode=%b", d_in, count, mode);  
    mode = 0;
    clear = 0;
    clk = 0;
    ld = 0;
    d_in = 0;
    #10 mode = 1;
    #20 ld=1;
    #20 d_in = 8'b00000001;
    #20 d_in = 8'b00000010;
    #20 d_in = 8'b00000100;
    #30 ld = 0;
    #20 mode = 0;
    #10 clear = 1;
    #20 clear = 0;
  end
    always begin
        #5 clk = ~clk;
    end
    initial begin
        #250 $finish;
    end
endmodule
