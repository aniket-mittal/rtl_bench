module autovcoder_032806 (
    clk,
    i_input,
    A_input,
    B_input,
    C_input,
    D_input,
    Xk_plus_Ti_input,
    s_input,
    input_shifter_base,
    int_B_output
);
  input clk;
  input [5:0] i_input;
  input [31:0] A_input, B_input, C_input, D_input, Xk_plus_Ti_input, input_shifter_base;
  reg [31:0] F_shifted_output, F_output;
  input [4:0] s_input;
  output reg [31:0] int_B_output;
  reg [31:0]
      shifter_mask,
      working_B_reg,
      working_shifted_output,
      Func_res_output,
      F_circular_shifted_output,
      F_shift_lower;
  reg [1:0] func_sel;

  [MASKED]

endmodule

