// FILE NAME :  CMOS_Inverter.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : Simple Transmission Gate Inverter
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 14/10/2023
// *******************************************************


module CMOS_Inverter (A, Z);

input A;
output Z;
supply0 Gnd;
supply1 Vdd;

pmos p1(Z, Vdd, A);   // Z is the output of the inverter and A is the input of the inverter and Vdd is the power supply
nmos n1(Z, Gnd, A);   // Z is the output of the inverter and A is the input of the inverter and Gnd is the ground supply

endmodule

// *******************************************************

