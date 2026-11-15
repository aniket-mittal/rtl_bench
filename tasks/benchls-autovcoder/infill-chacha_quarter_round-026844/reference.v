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
  always @(posedge clk) begin : qr

    //a ? a + b + (msr(2i) ? csr(2i+1))
    //d ? (d?a)»16
    //c?c+d
    //b ? (b?c)»12
    //a ? a + b + (msr(2i+1) ? csr(2i))
    //d ? (d?a)»8
    //c?c+d
    //b ? (b?c)»7

    a_reg[0] <= (a + b + (m0 ^ cs1));
    b_reg[0] <= b;
    c_reg[0] <= c;
    d_reg[0] <= d;
    // register duplication
    a_reg2[0] <= (a + b + (m0 ^ cs1));
    c_reg2[0] <= c;
    d_reg2[0] <= d;
    m1_cs0_reg[0] <= (m1 ^ cs0);

    a_reg[1] <= a_reg[0];
    b_reg[1] <= (b_reg[0] ^ (c_reg2[0] + (((d_reg2[0] ^ a_reg2[0]) << 16) | ((d_reg2[0] ^ a_reg2[0])  >> 16))));
    c_reg[1] <= (c_reg[0] + (((d_reg[0] ^ a_reg[0]) << 16) | ((d_reg[0] ^ a_reg[0]) >> 16)));
    d_reg[1] <= (((d_reg[0] ^ a_reg[0]) << 16) | ((d_reg[0] ^ a_reg[0]) >> 16));
    m1_cs0_reg[1] <= m1_cs0_reg[0];

    a_reg[2] <= (a_reg[1] + ((b_reg[1] << 20) | (b_reg[1] >> 12)) + m1_cs0_reg[1]);
    b_reg[2] <= ((b_reg[1] << 20) | (b_reg[1] >> 12));
    c_reg[2] <= c_reg[1];
    d_reg[2] <= (d_reg[1] ^ (a_reg[1] + ((b_reg[1] << 20) | (b_reg[1] >> 12)) + m1_cs0_reg[1]));

    internal_a_prim <= a_reg[2];
    internal_b_prim <= (((b_reg[2] ^ (c_reg[2] + ((d_reg[2] << 24) | (d_reg[2] >> 8)))) << 25) | ((b_reg[2] ^ (c_reg[2] + ((d_reg[2] << 24) | (d_reg[2] >> 8)))) >> 7));
    internal_c_prim <= (c_reg[2] + ((d_reg[2] << 24) | (d_reg[2] >> 8)));
    internal_d_prim <= ((d_reg[2] << 24) | (d_reg[2] >> 8));

    /*a_reg[0] <= (a + b + (m0 ^ cs1));
		b_reg[0] <= (b ^ (c + (((d ^ (a + b + (m0 ^ cs1))) << 16) | ((d ^ (a + b + (m0 ^ cs1)))  >> 16))));
		c_reg[0] <= (c + (((d ^ (a + b + (m0 ^ cs1))) << 16) | ((d ^ (a + b + (m0 ^ cs1)))  >> 16)));
		d_reg[0] <= (((d ^ (a + b + (m0 ^ cs1))) << 16) | ((d ^ (a + b + (m0 ^ cs1)))  >> 16));
		m1_cs0_reg <= (m1 ^ cs0);

		a_reg[1] <= (a_reg[0] + ((b_reg[0] << 20) | (b_reg[0] >> 12)) + m1_cs0_reg);
		b_reg[1] <= ((b_reg[0] << 20) | (b_reg[0] >> 12));
		c_reg[1] <= c_reg[0];
		d_reg[1] <= (d_reg[0] ^ (a_reg[0] + ((b_reg[0] << 20) | (b_reg[0] >> 12)) + m1_cs0_reg));

      internal_a_prim <= a_reg[1];
      internal_b_prim <= (((b_reg[1] ^ (c_reg[1] + ((d_reg[1] << 24) | (d_reg[1] >> 8)))) << 25) | ((b_reg[1] ^ (c_reg[1] + ((d_reg[1] << 24) | (d_reg[1] >> 8)))) >> 7));
      internal_c_prim <= (c_reg[1] + ((d_reg[1] << 24) | (d_reg[1] >> 8)));
      internal_d_prim <= ((d_reg[1] << 24) | (d_reg[1] >> 8));
		*/

  end  // qr
endmodule

