module pll_model (
  output locked,
  output [4:0] outclk,
  input refclk,
  input rst
);

  reg locked_reg;
  reg [4:0] outclk_reg;

  initial begin
    locked_reg = 0;
    outclk_reg = 5'b00000;
  end

  always @(posedge refclk or posedge rst) begin
    if (rst) begin
      locked_reg <= 0;
      outclk_reg <= 5'b00000;
    end else begin
      // Assuming lock signal is high after some cycles
      locked_reg <= 1;
      
      // Generate 5 different clocks
      outclk_reg[0] <= ~outclk_reg[0]; // Example clock logic
      outclk_reg[1] <= outclk_reg[0];  // Example clock logic
      outclk_reg[2] <= outclk_reg[1];  // Example clock logic
      outclk_reg[3] <= outclk_reg[2];  // Example clock logic
      outclk_reg[4] <= outclk_reg[3];  // Example clock logic
    end
  end

  assign locked = locked_reg;
  assign outclk = outclk_reg;

endmodule