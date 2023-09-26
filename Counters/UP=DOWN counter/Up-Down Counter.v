module up_down(mode, clear, clk, ld, d_in, count);
input mode, clk, ld, clear;
input [7:0] d_in;
output reg [7:0] count;
always @(posedge clk) begin
    if (clear) begin
        count <= 8'b00000000;
    end
    else if (ld) begin
        count <= d_in;
    end
    else if (mode) begin
        count <= count + 1;
    end
    else begin
        count <= count - 1;
    end    
end

endmodule