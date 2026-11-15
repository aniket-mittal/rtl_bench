module autovcoder_005670 (
    ctl_alu_oe,
    ctl_alu_shift_oe,
    ctl_alu_op2_oe,
    ctl_alu_res_oe,
    ctl_alu_op1_oe,
    ctl_alu_bs_oe,
    ctl_alu_op1_sel_bus,
    ctl_alu_op1_sel_low,
    ctl_alu_op1_sel_zero,
    ctl_alu_op2_sel_zero,
    ctl_alu_op2_sel_bus,
    ctl_alu_op2_sel_lq,
    ctl_alu_sel_op2_neg,
    ctl_alu_sel_op2_high,
    ctl_alu_core_R,
    ctl_alu_core_V,
    ctl_alu_core_S,
    alu_oe,
    alu_shift_oe,
    alu_op2_oe,
    alu_res_oe,
    alu_op1_oe,
    alu_bs_oe,
    alu_op1_sel_bus,
    alu_op1_sel_low,
    alu_op1_sel_zero,
    alu_op2_sel_zero,
    alu_op2_sel_bus,
    alu_op2_sel_lq,
    alu_sel_op2_neg,
    alu_sel_op2_high,
    alu_core_R,
    alu_core_V,
    alu_core_S
);


  input wire ctl_alu_oe;
  input wire ctl_alu_shift_oe;
  input wire ctl_alu_op2_oe;
  input wire ctl_alu_res_oe;
  input wire ctl_alu_op1_oe;
  input wire ctl_alu_bs_oe;
  input wire ctl_alu_op1_sel_bus;
  input wire ctl_alu_op1_sel_low;
  input wire ctl_alu_op1_sel_zero;
  input wire ctl_alu_op2_sel_zero;
  input wire ctl_alu_op2_sel_bus;
  input wire ctl_alu_op2_sel_lq;
  input wire ctl_alu_sel_op2_neg;
  input wire ctl_alu_sel_op2_high;
  input wire ctl_alu_core_R;
  input wire ctl_alu_core_V;
  input wire ctl_alu_core_S;
  output wire alu_oe;
  output wire alu_shift_oe;
  output wire alu_op2_oe;
  output wire alu_res_oe;
  output wire alu_op1_oe;
  output wire alu_bs_oe;
  output wire alu_op1_sel_bus;
  output wire alu_op1_sel_low;
  output wire alu_op1_sel_zero;
  output wire alu_op2_sel_zero;
  output wire alu_op2_sel_bus;
  output wire alu_op2_sel_lq;
  output wire alu_sel_op2_neg;
  output wire alu_sel_op2_high;
  output wire alu_core_R;
  output wire alu_core_V;
  output wire alu_core_S;


  assign alu_oe = ctl_alu_oe;
  assign alu_shift_oe = ctl_alu_shift_oe;
  assign alu_op2_oe = ctl_alu_op2_oe;
  assign alu_res_oe = ctl_alu_res_oe;
  assign alu_op1_oe = ctl_alu_op1_oe;
  assign alu_bs_oe = ctl_alu_bs_oe;
  assign alu_op1_sel_bus = ctl_alu_op1_sel_bus;
  assign alu_op1_sel_low = ctl_alu_op1_sel_low;
  assign alu_op1_sel_zero = ctl_alu_op1_sel_zero;
  assign alu_op2_sel_zero = ctl_alu_op2_sel_zero;
  assign alu_op2_sel_bus = ctl_alu_op2_sel_bus;
  assign alu_op2_sel_lq = ctl_alu_op2_sel_lq;
  assign alu_sel_op2_neg = ctl_alu_sel_op2_neg;
  assign alu_sel_op2_high = ctl_alu_sel_op2_high;
  assign alu_core_R = ctl_alu_core_R;
  assign alu_core_V = ctl_alu_core_V;
  assign alu_core_S = ctl_alu_core_S;




endmodule

