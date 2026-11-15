module convenc
(
  input  wire clk,
  input  wire rst,

  input  wire enc_en,
  input  wire bit_in,
  output wire [1:0] bits_out
);

  reg [5:0] state;
  [MASKED]
  assign bits_out[0] =  bit_in ^ state[0] ^ state[1] ^ state[2] ^ state[5];
  assign bits_out[1] =  bit_in ^ state[1] ^ state[2] ^ state[4] ^ state[5];

endmodule