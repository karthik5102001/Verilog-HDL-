`timescale 10ps/1ps
`include "Example_1.v"
module Example_1_();      
reg [0:1] Status;
wire [0:1] Flag;
Example__1 DUT(Status, Flag);
initial begin
$dumpfile("Example_1_TB.vcd");
$dumpvars(0,Example_1_);
$monitor("Status = %b, Flag = %b", Status, Flag);
Status = 0;
#10 Status = 1;
#10 Status = 2;
#10 Status = 3;
#10 Status = 0;
end
endmodule
