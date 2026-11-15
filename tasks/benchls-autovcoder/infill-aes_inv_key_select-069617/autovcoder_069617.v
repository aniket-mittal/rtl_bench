module autovcoder_069617 (
    input               rst,                  // input reset
    input               enableInvKeyControl,
    input      [0:1919] keyExp,               // unsigned 176-byte expanded key
    input      [   2:0] keySize,
    output reg [ 0:127] invNewKey
);  // output key for invRounds

  integer bottom;
  integer bottom128 = 1280;  // bottom limit of bit-range
  integer bottom192 = 1536;
  integer bottom256 = 1792;

  [MASKED]

endmodule

