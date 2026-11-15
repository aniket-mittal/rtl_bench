module autovcoder_002937 (
    clk,
    rst,
    ctrl,
    z,
    dout
);
  input clk;
  input rst;
  input [3:0] ctrl;
  input signed [15:0] z;
  output signed [15:0] dout;

  //wires and regs
  reg [15:0] a1;

  [MASKED]

  assign dout = a1;

endmodule

