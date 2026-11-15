module rtlpp_01774(
                 input wire           clk,
                 input wire [31 : 0]  a,
                 input wire [31 : 0]  b,
                 input wire [31 : 0]  c,
                 input wire [31 : 0]  d,
                 output wire [31 : 0] a_prim,
                 output wire [31 : 0] b_prim,
                 output wire [31 : 0] c_prim,
                 output wire [31 : 0] d_prim
                );

  reg [31 : 0] a0_reg;
  reg [31 : 0] a0_new;
  reg [31 : 0] a1_reg;
  reg [31 : 0] a1_new;
  reg [31 : 0] c0_reg;
  reg [31 : 0] c0_new;

  reg [31 : 0] internal_a_prim;
  reg [31 : 0] internal_b_prim;
  reg [31 : 0] internal_c_prim;
  reg [31 : 0] internal_d_prim;

  assign a_prim = internal_a_prim;
  assign b_prim = internal_b_prim;
  assign c_prim = internal_c_prim;
  assign d_prim = internal_d_prim;

  always @ (posedge clk)
    begin
      a0_reg <= a0_new;
      a1_reg <= a1_new;
      c0_reg <= c0_new;
    end

  [MASKED]

endmodule