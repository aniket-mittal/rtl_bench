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

  [MASKED]

  assign locked = locked_reg;
  assign outclk = outclk_reg;

endmodule