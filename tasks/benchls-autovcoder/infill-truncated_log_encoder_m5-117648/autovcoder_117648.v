module autovcoder_117648 #(
    parameter M = 5
) (
    input wire [15:0] o,
    input wire [15:0] x,

    output wire [16+3-1-M+1:0] tlog  /* truncated logarithm, M=5 , tlog[14:0] */
);
  reg [3:0] k;
  reg [16-1-M-1+1:0] y;  /* M=5 , y[10:0] */
  assign tlog = {k, y};

  [MASKED]




endmodule

