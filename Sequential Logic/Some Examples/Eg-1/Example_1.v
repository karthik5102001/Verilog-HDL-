module Example__1(Status, Flag);
input [0:1] Status;
output reg [0:1]Flag;
always @(Status) begin
    case (Status)
       0,1 : Flag = 0;
         3 : Flag = 1; // HERE WHEN THE STATUS IS 2 THE FLAG WILL SHOW THE PREVIOUS VALUE AND ACTS AS LATCH                      
             // SO WE NEED TO ADD A DEFAULT CONDITION TO AVOID LATCH LIKE fLAG = 0; THEN
    endcase            // IT BECOMES COMBINATIONAL CIRCUIT  
end
endmodule