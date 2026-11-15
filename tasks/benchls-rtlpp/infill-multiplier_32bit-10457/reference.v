module rtlpp_10457 (
    input [31:0] A_mul_src1,
    input [31:0] A_mul_src2,
    input clk,
    input reset_n,
    output [31:0] A_mul_cell_result
);

  wire [31:0] A_mul_cell_result_part_1;
  wire [15:0] A_mul_cell_result_part_2;
  wire mul_clr;

  assign mul_clr = ~reset_n;

  // Internal multiplier logic for part 1
  wire [15:0] A_mul_src1_part1 = A_mul_src1[15:0];
  wire [15:0] A_mul_src2_part1 = A_mul_src2[15:0];
  assign A_mul_cell_result_part_1 = A_mul_src1_part1 * A_mul_src2_part1;

  // Internal multiplier logic for part 2
  wire [15:0] A_mul_src1_part2 = A_mul_src1[31:16];
  wire [15:0] A_mul_src2_part2 = A_mul_src2[15:0];
  assign A_mul_cell_result_part_2 = A_mul_src1_part2 * A_mul_src2_part2;

  // Final result combining partial results
  assign A_mul_cell_result = {A_mul_cell_result_part_1[31:16] + A_mul_cell_result_part_2, A_mul_cell_result_part_1[15:0]};

endmodule