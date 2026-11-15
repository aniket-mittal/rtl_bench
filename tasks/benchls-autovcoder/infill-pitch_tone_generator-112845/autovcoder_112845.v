module autovcoder_112845 (
    clk,
    on,
    pitch,
    out
);

  input clk, on;
  input [3:0] pitch;
  output reg out;

  reg [31:0] counter;
  reg [31:0] maxCounter;

  initial begin
    counter = 32'd0;
    maxCounter = 32'd113636;
    out = 0;
  end

  [MASKED]

  always @(posedge clk) begin
    if (counter >= maxCounter) begin
      if (on) out <= ~out;
      else out <= 0;
      counter <= 32'd0;
    end else counter <= counter + 32'd1;
  end

endmodule

