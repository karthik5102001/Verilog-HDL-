// FILE NAME :  Pipeline_with_Diff_clk.v
// TYPE : Verilog
// *******************************************************
// DESCRIPTION : Pipeline with different clock
// *******************************************************
// AUTHOR : KARTHIK S
// *******************************************************
// DATE : 12/10/2023
// *******************************************************


module pipelining_2 (Zout, rs1, rs2, rd, func, addr, CLK_1, CLK_2);

input [3:0] rs1, rs2, rd, func;
input [7:0] addr;
input CLK_1, CLK_2;
output [15:0] Zout;

reg [15:0] l12_a, l12_b, l23_z, l34_z;             // introducing latches in the pipeline
reg [7:0] l12_addr, l23_addr, l34_addr;            // introducing latches in the pipeline
reg [3:0] l12_rd, l12_func, l23_rd;                // introducing latches in the pipeline

reg [15:0] regBank[0:15];                          // 16 registers
reg [15:0] mem[0:255];                             // 256 memory locations

assign Zout = l34_z;                               // output of the pipeline

always @(posedge CLK_1)
begin
    l12_a <= #2 regBank[rs1];                      // ---------------------> STAGE 1
    l12_b <= #2 regBank[rs2];
    l12_rd <= #2 rd;
    l12_func <= #2 func;
    l12_addr <= #2 addr;
end

always @(posedge CLK_2)
begin
    l23_rd <= #2 l12_rd;                          // ---------------------> STAGE 2
    l23_addr <= #2 l12_addr;

    case(l12_func)
    0 : l23_z <= #2 l12_a + l12_b;
    1 : l23_z <= #2 l12_a - l12_b;
    2 : l23_z <= #2 l12_a * l12_b;
    3 : l23_z <= #2 l12_a;
    4 : l23_z <= #2 l12_b;
    5 : l23_z <= #2 l12_a & l12_b;
    6 : l23_z <= #2 l12_a | l12_b;
    7 : l23_z <= #2 l12_a ^ l12_b;
    8 : l23_z <= #2 ~l12_a;
    9 : l23_z <= #2 ~l12_b;
    10 : l23_z <= #2 l12_a >> 1;
    11 : l23_z <= #2 l12_a << 1;
    default : l23_z <= #2 4'bzzzz;
    endcase
end

always @(posedge CLK_1)
begin
    regBank[l23_rd] <= #2 l23_z;                       // ---------------------> STAGE 3
    l34_addr <= #2 l23_addr;
    l34_z <= #2 l23_z;
end

always @(posedge CLK_2)
begin 
    mem[l34_addr] <= #2 l34_z;                          // ---------------------> STAGE 4
end
endmodule
