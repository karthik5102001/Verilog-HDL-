`timescale 10ns/1ns
module controller (lda, ldb, sel_1,sel_2, sel_in, done, clk, gt, lt, eq, start);

input clk, gt, lt, eq, start;
output reg lda, ldb, sel_1, sel_2, sel_in, done;
reg [2:0] state, next_state;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

always @(posedge clk)
begin
  state <= next_state ;
end
always @(state)
begin 
case (state)
S0 : begin sel_in = 1; lda = 1; ldb = 0; done = 0; end

S1 : begin sel_in = 1; lda = 0; ldb = 1; done = 0; end

S2 : if (eq) begin done = 1; next_state = S5 ; end
     else if (lt) begin sel_1 = 1; sel_2 = 0; sel_in = 0; done = 0; next_state = S3 ; 
     #1 lda = 0; ldb = 1; end 
     else if (gt) begin sel_1 = 0; sel_2 = 1; sel_in = 0; done = 0; next_state = S4 ;
        #1 lda = 1; ldb = 0; end
        
S3 : if (eq) begin done = 1; next_state = S5 ; end
     else if (lt) begin sel_1 = 1; sel_2 = 0; sel_in = 0; done = 0; next_state = S3 ; 
     #1 lda = 0; ldb = 1; end 
     else if (gt) begin sel_1 = 0; sel_2 = 1; sel_in = 0; done = 0; next_state = S4 ;
        #1 lda = 1; ldb = 0; end

S4 : if (eq) begin done = 1; next_state = S5 ; end
     else if (lt) begin sel_1 = 1; sel_2 = 0; sel_in = 0; done = 0; next_state = S3 ; 
     #1 lda = 0; ldb = 1; end 
     else if (gt) begin sel_1 = 0; sel_2 = 1; sel_in = 0; done = 0; next_state = S4 ;
        #1 lda = 1; ldb = 0; end     

S5 : begin sel_in = 0; lda = 0; ldb = 0; done = 1; sel_1 = 0; sel_2 = 0; next_state = S5; end 

default : begin lda = 0; ldb = 0; next_state = S0; end

endcase
end
endmodule
