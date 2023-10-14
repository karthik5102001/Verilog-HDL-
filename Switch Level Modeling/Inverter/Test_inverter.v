`include "CMOS_Inverter.v"
`timescale 10ps/1ps

module Test_inverter;   

reg A;
wire Z;

CMOS_Inverter U1(A, Z);

initial
begin
    #5 A = 0;
    #5 A = 1;
    #5 A = 0;
    #5 A = 1;
end

initial
begin
$monitor("A = %b, Z = %b", A, Z);
end

endmodule
