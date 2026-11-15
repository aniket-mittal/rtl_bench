module autovcoder_005671 (
    a_in,
    b_in,
    op_in,
    z_flag_in,
    s_flag_in,
    c_flag_in,
    ovr_flag_in,
    c_out,
    z_flag_out,
    s_flag_out,
    c_flag_out,
    ovr_flag_out,
    op_active
);
  parameter data_wl = 16;
  parameter op_wl = 8;

  input [data_wl-1:0] a_in;
  input [data_wl-1:0] b_in;
  input [op_wl	-1:0] op_in;

  input z_flag_in;
  input s_flag_in;
  input c_flag_in;
  input ovr_flag_in;

  output [data_wl-1:0] c_out;

  output z_flag_out;
  output s_flag_out;
  output c_flag_out;
  output ovr_flag_out;
  output op_active;

  reg [data_wl-1:0] c_reg;
  reg               z_flag_out;
  reg               s_flag_out;
  reg               c_flag_out;
  reg               op_active_int;

  // shift ops
  parameter I_SHR0 = 8'h80;
  parameter I_SHR1 = 8'h81;
  parameter I_SHRA = 8'h82;
  parameter I_SHRC = 8'h83;
  parameter I_ROTR = 8'h84;
  parameter I_ROTRC = 8'h85;
  parameter I_SHL0 = 8'h88;
  parameter I_SHL1 = 8'h89;
  parameter I_SHLA = 8'h8A;
  parameter I_SHLC = 8'h8B;
  parameter I_ROTL = 8'h8C;
  parameter I_ROTLC = 8'h8D;

  assign ovr_flag_out = ovr_flag_in;

  [MASKED]

  assign c_out = c_reg;
  assign op_active = op_active_int;
endmodule

