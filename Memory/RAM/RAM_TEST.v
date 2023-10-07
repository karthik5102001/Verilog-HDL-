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
   integer k, myseed;

   RAM_1 RAM_1_inst (addr, data_in, data_out, write_enable, cs, read_enable, clk);
   
   // assign clk = 1'b0;
   // always #5 clk = ~clk;

   initial begin
    for (k=0; k<= 1023 ; k=k+1) begin
      data_in = (k+k) % 256; 
      read_enable = 0;
        write_enable = 1;
        cs = 1;

      #2 write_enable = 0;
        #2 cs = 0;
        #2 read_enable = 1;
        #2 addr = k;
         end

         repeat (20)
          begin
            #2 addr = $random(myseed) % memory_size-1;
            write_enable = 0;
            cs = 1;
            read_enable = 1;
            $display ("addr = %d, data_out = %d", addr, Data);
          end
    end
    initial myseed = 35; 
  
  //   $dumpfile("RAM_test.vcd");
   //     $dumpvars(0, RAM_test);
   // $finish;

    endmodule