module i3c_controller_unpack (
  input         clk,
  input         reset_n,
  input         stop,

  output        u32_ready,
  input         u32_valid,
  input  [31:0] u32,

  output [11:0] u8_lvl,

  input         u8_ready,
  output        u8_valid,
  output [7:0]  u8
);

  localparam [0:0] SM_GET = 0;
  localparam [0:0] SM_PUT = 1;

  reg [0:0]  sm;
  reg [1:0]  c;
  reg [11:0] u8_lvl_reg;
  reg [31:0] u32_reg;

  [MASKED]

  assign u32_ready = sm == SM_GET & (reset_n | stop);
  assign u8_valid = sm == SM_PUT;
  assign u8_lvl = u8_lvl_reg;
  assign u8 = u32_reg[7:0];

endmodule