module rtlpp_10359 (
                                     A_mul_src1,
                                     A_mul_src2,
                                     clk,
                                     reset_n,
                                     A_mul_cell_result
                                   );

  output  [31:0] A_mul_cell_result;
  input   [31:0] A_mul_src1;
  input   [31:0] A_mul_src2;
  input          clk;
  input          reset_n;

  wire    [31:0] A_mul_cell_result_part_1;
  wire    [15:0] A_mul_cell_result_part_2;
  wire           mul_clr;

  assign mul_clr = ~reset_n;

  // 16-bit unsigned multiplier
  assign A_mul_cell_result_part_1 = A_mul_src1[15:0] * A_mul_src2[15:0];

  // 16-bit unsigned multiplier
  assign A_mul_cell_result_part_2 = A_mul_src1[31:16] * A_mul_src2[15:0];

  assign A_mul_cell_result = {A_mul_cell_result_part_1[31:16] + A_mul_cell_result_part_2, A_mul_cell_result_part_1[15:0]};

endmodule