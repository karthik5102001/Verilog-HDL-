`timescale 10ps/1ps
`include "Single_Port_RAM_With_Sync_R_W.v"

module RAM_test;
  
   parameter add_size = 10;                       // 10 address lines
   parameter word_size = 8;                       // 8 bit data
   parameter memory_size = 1024;                  // 1024 bytes of memory

   reg clk, write_enable, cs, read_enable;     // write enable, chip select, read enable
   reg [add_size-1:0] addr;                     // address
   reg [word_size-1:0] data_in;                 // input data
   wire [word_size-1:0] Data;                                   // output data
   wire [word_size-1:0] data_out;          // output data for procedural block
   tri [7:0] bus; 
   //integer myseed =  36;

   RAM_1 RAM_1_inst (addr, data_in, data_out, write_enable, cs, read_enable, clk, Data);
   initial begin
      clk = 1'b1;
   forever begin
      #5 clk <= ~clk;
    end
   end
     
   initial begin               // lets put only one value in memory at location 0
      read_enable = 0;
        write_enable = 1;
        cs = 1;
        read_enable = 0;
        addr = 0;
        data_in = 7; 
                               // Now we extract the data from memory from location 0
      #2 write_enable = 0;
        #2 cs = 1;
        #2 read_enable = 1;
        #2 addr = 0;
         end
    initial begin
    //$display ("addr = %d, data_out = %d", addr, Data);
    $dumpfile("RAM_test.vcd");
    $dumpvars(0, RAM_test);
    $monitor ( $time," addr = %d, data_in = %d, data_out = %d", addr, data_in, Data);
    #100 $finish;
    end

    endmodule