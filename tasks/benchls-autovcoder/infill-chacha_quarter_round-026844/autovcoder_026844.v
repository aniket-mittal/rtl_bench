module autovcoder_026844 (
    input wire clk,
    input wire [31 : 0] m0,
    input wire [31 : 0] m1,
    input wire [31 : 0] cs0,
    input wire [31 : 0] cs1,

    input wire [31 : 0] a,
    input wire [31 : 0] b,
    input wire [31 : 0] c,
    input wire [31 : 0] d,

    output wire [31 : 0] a_prim,
    output wire [31 : 0] b_prim,
    output wire [31 : 0] c_prim,
    output wire [31 : 0] d_prim
);

  //----------------------------------------------------------------
  // QR module regs/wires
  //----------------------------------------------------------------
  reg [31 : 0] internal_a_prim;
  reg [31 : 0] internal_b_prim;
  reg [31 : 0] internal_c_prim;
  reg [31 : 0] internal_d_prim;

  assign a_prim = internal_a_prim;
  assign b_prim = internal_b_prim;
  assign c_prim = internal_c_prim;
  assign d_prim = internal_d_prim;

  reg [31 : 0] a_reg[2:0];
  reg [31 : 0] b_reg[2:0];
  reg [31 : 0] c_reg[2:0];
  reg [31 : 0] d_reg[2:0];

  reg [31 : 0] a_reg2[2:0];
  reg [31 : 0] c_reg2[2:0];
  reg [31 : 0] d_reg2[2:0];

  reg [31 : 0] m1_cs0_reg[1:0];

  //----------------------------------------------------------------
  // qr
  //
  // The actual quarterround engine
  //----------------------------------------------------------------
  [MASKED]  // qr
endmodule

