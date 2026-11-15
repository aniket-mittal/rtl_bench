module autovcoder_022477 #(
    parameter W = 32
) (
    input signed [W-1:0] x,
    input signed [W-1:0] y,
    input signed [W-1:0] z,
    input clk,
    input rst_n,
    input mode,
    input en,
    input [1:0] phase,
    output reg done,
    output reg mode_out,
    output reg signed [W-1:0] xt,
    output reg signed [W-1:0] yt,
    output reg signed [W-1:0] zt
);
  wire signed [W-1:0] deg180;
  assign deg180 = 32'd5898240;
  [MASKED]
endmodule

