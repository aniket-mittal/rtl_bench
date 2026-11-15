module autovcoder_104006 (
    in_data,
    shift_amt_reg,
    shift_control,
    shift_amt_imm,
    enable,
    carry_flag,
    out_data,
    carry_out_flag
);
  input [31:0] in_data, shift_amt_reg;
  input [2:0] shift_control;
  input [4:0] shift_amt_imm;
  input enable, carry_flag;
  output [31:0] out_data;
  output carry_out_flag;

  wire [31:0] in_data, shift_amt_reg;
  wire [2:0] shift_control;
  wire [4:0] shift_amt_imm;
  wire enable, carry_flag;
  reg sign_bit;
  reg [31:0] out_data;
  reg carry_out_flag;

  [MASKED]  //end always block
endmodule

