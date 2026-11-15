module rtlpp_10426 (
                                        E_src1,
                                        E_src2,
                                        M_en,
                                        clk,
                                        reset_n,
                                        M_mul_cell_p1,
                                        M_mul_cell_p2,
                                        M_mul_cell_p3
                                     )
;

  output  [31:0] M_mul_cell_p1;
  output  [31:0] M_mul_cell_p2;
  output  [31:0] M_mul_cell_p3;
  input   [31:0] E_src1;
  input   [31:0] E_src2;
  input          M_en;
  input          clk;
  input          reset_n;

  reg     [31:0] M_mul_cell_p1;
  reg     [31:0] M_mul_cell_p2;
  reg     [31:0] M_mul_cell_p3;
  wire           mul_clr;
  wire    [31:0] mul_src1;
  wire    [31:0] mul_src2;

  assign mul_clr = ~reset_n;
  assign mul_src1 = E_src1;
  assign mul_src2 = E_src2;

  always @(posedge clk or posedge mul_clr) begin
    if (mul_clr) begin
      M_mul_cell_p1 <= 32'b0;
      M_mul_cell_p2 <= 32'b0;
      M_mul_cell_p3 <= 32'b0;
    end
    else if (M_en) begin
      M_mul_cell_p1 <= mul_src1[15:0] * mul_src2[15:0];
      M_mul_cell_p2 <= mul_src1[15:0] * mul_src2[31:16];
      M_mul_cell_p3 <= mul_src1[31:16] * mul_src2[15:0];
    end
  end

endmodule