module autovcoder_116861 (
    input clk_mul4,
    input en_mul4,

    input signed [25:0] i11,
    i12,
    i13,
    i14,
    input signed [25:0] i21,
    i22,
    i23,
    i24,
    input signed [25:0] i31,
    i32,
    i33,
    i34,
    input signed [25:0] i41,
    i42,
    i43,
    i44,

    output reg signed [25:0] o11,
    o12,
    o13,
    o14,
    output reg signed [25:0] o21,
    o22,
    o23,
    o24,
    output reg signed [25:0] o31,
    o32,
    o33,
    o34,
    output reg signed [25:0] o41,
    o42,
    o43,
    o44,

    output signed [25:0] o11_2,
    o12_2,
    o13_2,
    o14_2,
    output signed [25:0] o21_2,
    o22_2,
    o23_2,
    o24_2,
    output signed [25:0] o31_2,
    o32_2,
    o33_2,
    o34_2,
    output signed [25:0] o41_2,
    o42_2,
    o43_2,
    o44_2
);

  reg [51:0]
      dot11,
      dot12,
      dot13,
      dot14,
      dot21,
      dot22,
      dot23,
      dot24,
      dot31,
      dot32,
      dot33,
      dot34,
      dot41,
      dot42,
      dot43,
      dot44;

  assign o11_2 = dot11[38:13];
  assign o12_2 = dot12[38:13];
  assign o13_2 = dot13[38:13];
  assign o14_2 = dot14[38:13];
  assign o21_2 = dot21[38:13];
  assign o22_2 = dot22[38:13];
  assign o23_2 = dot23[38:13];
  assign o24_2 = dot24[38:13];
  assign o31_2 = dot31[38:13];
  assign o32_2 = dot32[38:13];
  assign o33_2 = dot33[38:13];
  assign o34_2 = dot34[38:13];
  assign o41_2 = dot41[38:13];
  assign o42_2 = dot42[38:13];
  assign o43_2 = dot43[38:13];
  assign o44_2 = dot44[38:13];

  [MASKED]

endmodule

