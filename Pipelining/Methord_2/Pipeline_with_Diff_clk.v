module pipelining_2 (Zout, rs1, rs2, rd, func, addr, CLK_1, CLK_2);

input [3:0] rs1, rs2, rd, func;
input [7:0] addr;
input CLK_1, CLK_2;
output [15:0] Zout;

reg [15:0] l12_a, l12_b, l23_z, l34_z;
reg [7:0] l12_addr, l23_addr, l34_addr;
reg [3:0] l12_rd, l12_func, l23_rd;

reg [15:0] regBank[0:15];
reg [15:0] mem[0:255];

assign Zout = l34_z;

always @(posedge CLK_1)
begin
    l12_a <= #2 regBank[rs1];
    l12_b <= #2 regBank[rs2];
    l12_rd <= #2 rd;
    l12_func <= #2 func;
    l12_addr <= #2 addr;
end

always @(negedge CLK_2)
begin
    l23_rd <= #2 l12_rd;
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
    regBank[l23_rd] <= #2 l23_z;
    l34_addr <= #2 l23_addr;
    l34_z <= #2 l23_z;
end

always @(negedge CLK_2)
begin 
    mem[l34_addr] <= #2 l34_z;
end
endmodule
