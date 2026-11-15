module autovcoder_073720 (
    input [4:0] tone_idx,
    output reg [31:0] tone
);

  parameter NM1 = 32'd262;  // C_freq
  parameter NM2 = 32'd294;  // D_freq
  parameter NM3 = 32'd330;  // E_freq
  parameter NM4 = 32'd349;  // F_freq
  parameter NM5 = 32'd392;  // G_freq
  parameter NM6 = 32'd440;  // A_freq
  parameter NM7 = 32'd494;  // B_freq
  parameter NM0 = 32'd10000;  // obvious high freq tone
  [MASKED]

endmodule

