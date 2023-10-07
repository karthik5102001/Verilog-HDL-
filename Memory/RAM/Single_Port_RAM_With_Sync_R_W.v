// FILE NAME : Single_Port_RAM_With_Sync_R_W.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : A single port RAM with synchronous read and write
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************

module RAM_1 (addr, data_in, data_out, write_enable, cs, read_enable, clk); 

   parameter add_size = 10;                       // 10 address lines
   parameter word_size = 8;                       // 8 bit data
   parameter memory_size = 1024;                  // 1024 bytes of memory

   input clk, write_enable, cs, read_enable;     // write enable, chip select, read enable
   input [add_size-1:0] addr;                     // address
   input [word_size-1:0] data_in;                 // input data
   output [word_size-1:0] Data;                                   // output data
   output  reg [word_size-1:0] data_out;          // output data for procedural block
    tri [7:0] bus;                                 // bidirectional bus

   reg [word_size-1:0] mem [memory_size-1:0];       // memory array

   assign Data = (cs && read_enable) ? data_out : 8'bz;      // output data

   always @(posedge clk) begin
      if (cs && write_enable && !read_enable)
       begin
        mem[addr] <= data_in;              // write data to memory                                             
         end
   end
    always @(posedge clk) begin     
        if (cs && read_enable && !write_enable) begin                // read operation = If Read is enable then read data from memory
            data_out <= mem[addr];             // read data from memory
         end
      end    

   assign bus = read_enable ? Data : 8'bz;         // bidirectional bus
   assign data_in = write_enable ? bus : 8'bz;     // bidirectional bus

    endmodule
