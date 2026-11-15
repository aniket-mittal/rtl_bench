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
  assign e = {
    dw[7] & s[6] & !fatal_s6_hot,
    dw[6] & s[6] & !fatal_s6_hot,
    dw[5] & s[6] & !fatal_s6_hot,
    dw[4] & s[6] & !fatal_s6_hot,
    dw[3] & s[6] & !fatal_s6_hot,
    dw[2] & s[6] & !fatal_s6_hot,
    dw[1] & s[6] & !fatal_s6_hot,
    dw[63] & !s[6] & !fatal_s6_cold,
    dw[62] & !s[6] & !fatal_s6_cold,
    dw[61] & !s[6] & !fatal_s6_cold,
    dw[60] & !s[6] & !fatal_s6_cold,
    dw[59] & !s[6] & !fatal_s6_cold,
    dw[58] & !s[6] & !fatal_s6_cold,
    dw[57] & !s[6] & !fatal_s6_cold,
    dw[56] & !s[6] & !fatal_s6_cold,
    dw[55] & !s[6] & !fatal_s6_cold,
    dw[54] & !s[6] & !fatal_s6_cold,
    dw[53] & !s[6] & !fatal_s6_cold,
    dw[52] & !s[6] & !fatal_s6_cold,
    dw[51] & !s[6] & !fatal_s6_cold,
    dw[50] & !s[6] & !fatal_s6_cold,
    dw[49] & !s[6] & !fatal_s6_cold,
    dw[48] & !s[6] & !fatal_s6_cold,
    dw[47] & !s[6] & !fatal_s6_cold,
    dw[46] & !s[6] & !fatal_s6_cold,
    dw[45] & !s[6] & !fatal_s6_cold,
    dw[44] & !s[6] & !fatal_s6_cold,
    dw[43] & !s[6] & !fatal_s6_cold,
    dw[42] & !s[6] & !fatal_s6_cold,
    dw[41] & !s[6] & !fatal_s6_cold,
    dw[40] & !s[6] & !fatal_s6_cold,
    dw[39] & !s[6] & !fatal_s6_cold,
    dw[38] & !s[6] & !fatal_s6_cold,
    dw[37] & !s[6] & !fatal_s6_cold,
    dw[36] & !s[6] & !fatal_s6_cold,
    dw[35] & !s[6] & !fatal_s6_cold,
    dw[34] & !s[6] & !fatal_s6_cold,
    dw[33] & !s[6] & !fatal_s6_cold,
    dw[31] & !s[6] & !fatal_s6_cold,
    dw[30] & !s[6] & !fatal_s6_cold,
    dw[29] & !s[6] & !fatal_s6_cold,
    dw[28] & !s[6] & !fatal_s6_cold,
    dw[27] & !s[6] & !fatal_s6_cold,
    dw[26] & !s[6] & !fatal_s6_cold,
    dw[25] & !s[6] & !fatal_s6_cold,
    dw[24] & !s[6] & !fatal_s6_cold,
    dw[23] & !s[6] & !fatal_s6_cold,
    dw[22] & !s[6] & !fatal_s6_cold,
    dw[21] & !s[6] & !fatal_s6_cold,
    dw[20] & !s[6] & !fatal_s6_cold,
    dw[19] & !s[6] & !fatal_s6_cold,
    dw[18] & !s[6] & !fatal_s6_cold,
    dw[17] & !s[6] & !fatal_s6_cold,
    dw[15] & !s[6] & !fatal_s6_cold,
    dw[14] & !s[6] & !fatal_s6_cold,
    dw[13] & !s[6] & !fatal_s6_cold,
    dw[12] & !s[6] & !fatal_s6_cold,
    dw[11] & !s[6] & !fatal_s6_cold,
    dw[10] & !s[6] & !fatal_s6_cold,
    dw[9] & !s[6] & !fatal_s6_cold,
    dw[7] & !s[6] & !fatal_s6_cold,
    dw[6] & !s[6] & !fatal_s6_cold,
    dw[5] & !s[6] & !fatal_s6_cold,
    dw[3] & !s[6] & !fatal_s6_cold
  };


endmodule

