`include  "Traffic_light.v"
`timescale 10ns/1ns
module test;
reg clock;
wire [0:2] light;
cyclic_lamp cyclic_lamp(clock,light);
always #5 clock = ~clock;
initial begin
clock = 0;
#100 $finish;
end
initial begin 
    $dumpfile("Test_traffic.vcd");
    $dumpvars(0,test);
    if (light == 3'b100) $display("Red");
    else  if (light == 3'b010) $display("Green");
    else if (light == 3'b001) $display("Yellow");
    $monitor("[Time=%0t] clock = %b, light = %b",$time, clock,light);
end
endmodule
