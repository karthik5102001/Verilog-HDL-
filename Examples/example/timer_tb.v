module Timer_LED_tb;

  reg clk;
  reg rst;
  wire [3:0] count;
  wire led;

  // Instantiate the Timer_LED module
  Timer_LED uut (
    .clk(clk),
    .rst(rst),
    .count(count),
    .led(led)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test scenario
  initial begin
    // Initialize inputs
    rst = 1;
    #10 rst = 0;

    // Simulate for 100 clock cycles
    #100 $finish;
  end

  // Monitor
  always @(posedge clk) begin
    $display("Time=%0t, count=%h, led=%b", $time, count, led);
  end
     initial begin
        $dumpfile("LED.vcd");
        $dumpvars(0, Timer_LED);
            end
endmodule