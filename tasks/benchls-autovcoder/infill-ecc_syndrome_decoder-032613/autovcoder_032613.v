module autovcoder_032613 (
    s,
    e,
    fatal
);

  input [7:0] s;
  output [63:0] e;
  output fatal;
  wire [63:0] e;

  // decode the lower part of syndrome
  reg  [63:0] d;
  wire [63:0] dw  /* synthesis keep */;
  always @(s) begin
    d = 64'b0;
    d[s[5:0]] = 1'b1;
  end
  assign dw = d;

  // Identify uncorrectable errors
  // and unroll the s[6] ODC condition to help
  // synthesis get minimum depth
  wire or_syn50 = |(s[5:0])  /* synthesis keep */;
  wire fatal = (s[6] & !s[7]) | (or_syn50 & !s[7]);
  wire fatal_s6_cold = (or_syn50 & !s[7]);
  wire fatal_s6_hot = !s[7];
  [MASKED]


endmodule

