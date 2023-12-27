module Timer_LED (
  input wire clk,
  input wire rst,
  output reg [3:0] count,
  output reg led
);

  reg led_delay;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 4'b1111;  // Initialize counter to 0F
      led <= 1'b0;       // Initialize LED to OFF
      led_delay <= 1'b0;  // Initialize LED delay flag to 0
    end else begin
      if (count == 4'b0000) begin
        // Perform clear operation here
        // For example, set a flag or perform necessary actions
        // Then reset the counter or perform other tasks
        // ...

        led_delay <= 1'b1;  // Enable LED delay
        count <= 4'b1111;   // Reset counter to 0F
      end else begin
        if (led_delay) begin
          // Implement your LED delay here
          // For example, use a counter or another mechanism
          // ...

          led_delay <= 1'b0;  // Disable LED delay after small delay
          led <= 1'b1;        // Turn LED ON
        end else begin
          led <= 1'b0;        // Turn LED OFF
        end

        count <= count - 1;  // Decrement counter
      end
    end
  end
    initial begin
        $dumpfile("LED.vcd");
        $dumpvars(0, Timer_LED);
            end
endmodule