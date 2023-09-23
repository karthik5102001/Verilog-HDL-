module ALU_4bit(f,a,b,op);
input [3:0] a,b;
input [1:0] op;
output reg [3:0] f;
parameter ADD = 2'b00, SUB = 2'b01, MUL = 2'b10, DIV = 2'b11;
always @ (*)
begin
    case (op)
        ADD: f = a + b;
        SUB: f = a - b;
        MUL: f = a * b;
        DIV: f = a / b;
    endcase
end
endmodule