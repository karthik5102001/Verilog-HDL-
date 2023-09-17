`timescale 10ns/ 1ns
module alutest;
 reg [15:0] x,y;
 wire [15:0] z;
 wire sign,zero,overflow,carry,parity;
 alu alu1(x,y,z,sign,zero,overflow,carry,parity);
 initial
      begin
        $dumpfile("alu.vcd");
        $dumpvars(0,alu1);
        $monitor($time," x=%h y=%h z=%h sign=%b zero=%b overflow=%b carry=%b parity=%b",$time,x,y,z,sign,zero,overflow,carry,parity);
        #5 x=16'h8fff ;y=16'h8000;
        #5 x=16'h0000 ;y=16'h0002;
        #5 x=16'h0001 ;y=16'h5555;
        #5 x=16'h0001 ;y=16'h1111;
        #10 x=16'h0000;y=16'hffff;
        #5 $finish;
      end
endmodule

