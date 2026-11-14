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

  always @(*) begin

    Func_res_output = 32'h00000000;
    F_output = 32'h00000000;

    func_sel = 2'b11;
    if (i_input < 48) func_sel = 2'b10;
    if (i_input < 32) func_sel = 2'b01;
    if (i_input < 16) func_sel = 2'b00;

    case (func_sel)

      2'b00: Func_res_output = (B_input & C_input) | ((~B_input) & D_input);
      2'b01: Func_res_output = (B_input & D_input) | (C_input & (~D_input));
      2'b10: Func_res_output = B_input ^ C_input ^ D_input;
      2'b11: Func_res_output = C_input ^ (B_input | (~D_input));

    endcase

    F_output = Func_res_output + A_input + Xk_plus_Ti_input;

    // to perform circular shift - as circular shift is not readily available in Verilog
    shifter_mask = ~(input_shifter_base >> s_input);
    F_shift_lower = F_output & shifter_mask;
    F_shift_lower = F_shift_lower >> (31 - s_input + 1);
    F_shifted_output = F_output << s_input;
    F_circular_shifted_output = F_shifted_output + F_shift_lower;

    int_B_output = B_input + F_circular_shifted_output;

  end

endmodule

