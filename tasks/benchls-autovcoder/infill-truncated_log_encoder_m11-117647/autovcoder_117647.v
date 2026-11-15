module autovcoder_117647 #(
    parameter M = 11
) (
    input wire [15:0] o,
    input wire [15:0] x,

    output wire [16+3-1-M+1:0] tlog  /* truncated logarithm, M=11, tlog[8:0] */
);
  reg [3:0] k;
  reg [16-1-M-1+1:0] y;  /* M=11, y[4:0] */
  assign tlog = {k, y};

  [MASKED]




endmodule

