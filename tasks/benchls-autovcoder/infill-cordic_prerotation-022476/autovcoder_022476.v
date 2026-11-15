module autovcoder_022476 #(
    parameter W = 32
) (
    input signed [W-1:0] x,
    input signed [W-1:0] y,
    input signed [W-1:0] z,
    input clk,
    input rst_n,
    input mode,
    input en,
    output reg [1:0] phase,
    output reg en_out,
    output reg mode_out,
    output reg signed [W-1:0] xt,
    output reg signed [W-1:0] yt,
    output reg signed [W-1:0] zt
);
  wire signed [W-1:0] deg90;
  wire signed [W-1:0] deg181;
  assign deg90  = 32'd2949120;
  assign deg181 = 32'd5931008;

  [MASKED]  //end always 
endmodule

