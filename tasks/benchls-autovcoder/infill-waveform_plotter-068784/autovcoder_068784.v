module autovcoder_068784 (
    clk,
    enable,
    reset,
    soundwave,
    enable_draw,
    X_out,
    Y_out
);

  input clk, enable, reset, soundwave;
  output reg enable_draw;
  output [7:0] X_out;
  output [6:0] Y_out;
  reg  [7:0] X_;
  reg  [6:0] Y_;
  wire [6:0] y_increase = 7'd4;
  reg  [6:0] y_shift;

  [MASKED]

  assign X_out = X_;
  assign Y_out = Y_ - y_shift;


endmodule

