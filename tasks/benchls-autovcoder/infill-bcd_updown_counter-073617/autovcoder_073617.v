module autovcoder_073617 (
    clk,
    reset,
    en,
    dir,
    BCD,
    cout
);
  input clk, reset, en, dir;
  output [3:0] BCD;
  output reg cout;
  reg [3:0] BCD, outputs;

  [MASKED]

  always @(negedge clk, posedge reset) begin
    if (reset == 1) BCD <= 4'b0000;
    else BCD <= outputs;
  end
endmodule

