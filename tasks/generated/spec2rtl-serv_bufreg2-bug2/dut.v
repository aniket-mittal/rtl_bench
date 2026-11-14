// Starter skeleton: implement dut as described in spec.md.
module dut (
  input i_clk,
  input i_en,
  input i_init,
  input i_cnt7,
  input i_cnt_done,
  input i_sh_right,
  input [1:0] i_lsb,
  input [1:0] i_bytecnt,
  input i_op_b_sel,
  input i_shift_op,
  input i_rs2,
  input i_imm,
  input i_load,
  input [31:0] i_dat,
  output o_sh_done,
  output o_op_b,
  output o_q,
  output [31:0] o_dat
);

endmodule
