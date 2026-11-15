module rtlpp_06692 (
    A_mul_src1,
    A_mul_src2,
    clk,
    reset_n,
    A_mul_cell_result
);

  output [31:0] A_mul_cell_result;
  input [31:0] A_mul_src1;
  input [31:0] A_mul_src2;
  input clk;
  input reset_n;

  wire [31:0] A_mul_cell_result_part_1;
  wire [15:0] A_mul_cell_result_part_2;
  wire mul_clr;
  assign mul_clr = ~reset_n;

  // Internal logic for altmult_add the_altmult_add_part_1
  reg [31:0] result_part_1;
  always @(posedge clk or posedge mul_clr) begin
    if (mul_clr)
      result_part_1 <= 32'b0;
    else
      result_part_1 <= A_mul_src1[15:0] * A_mul_src2[15:0];
  end
  assign A_mul_cell_result_part_1 = result_part_1;

  // Internal logic for altmult_add the_altmult_add_part_2
  reg [15:0] result_part_2;
  always @(posedge clk or posedge mul_clr) begin
    if (mul_clr)
      result_part_2 <= 16'b0;
    else
      result_part_2 <= A_mul_src1[31:16] * A_mul_src2[15:0];
  end
  assign A_mul_cell_result_part_2 = result_part_2;

  assign A_mul_cell_result = {A_mul_cell_result_part_1[31:16] + A_mul_cell_result_part_2, A_mul_cell_result_part_1[15:0]};

endmodule