module rtlpp_10358 (
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

  // Internal logic to replace altera_mult_add the_altmult_add_part_1
  reg [31:0] result_part_1;
  always @(posedge clk or posedge mul_clr) begin
    if (mul_clr) begin
      result_part_1 <= 32'b0;
    end else begin
      result_part_1 <= A_mul_src1[15:0] * A_mul_src2[15:0];
    end
  end

  assign A_mul_cell_result_part_1 = result_part_1;

  // Internal logic to replace altera_mult_add the_altmult_add_part_2
  reg [31:0] result_part_2;
  always @(posedge clk or posedge mul_clr) begin
    if (mul_clr) begin
      result_part_2 <= 32'b0;
    end else begin
      result_part_2 <= A_mul_src1[31:16] * A_mul_src2[15:0];
    end
  end

  assign A_mul_cell_result_part_2 = result_part_2[15:0];

  // Final result assembly
  assign A_mul_cell_result = {A_mul_cell_result_part_1[31:16] + A_mul_cell_result_part_2, A_mul_cell_result_part_1[15:0]};

endmodule