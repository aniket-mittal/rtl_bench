module rtlpp_11228 (
  output  [37:0] jdo,
  output         jrst_n,
  output         st_ready_test_idle,
  output         take_action_break_a,
  output         take_action_break_b,
  output         take_action_break_c,
  output         take_action_ocimem_a,
  output         take_action_ocimem_b,
  output         take_action_tracectrl,
  output         take_action_tracemem_a,
  output         take_action_tracemem_b,
  output         take_no_action_break_a,
  output         take_no_action_break_b,
  output         take_no_action_break_c,
  output         take_no_action_ocimem_a,
  output         take_no_action_tracemem_a,
  input   [31:0] MonDReg,
  input   [31:0] break_readreg,
  input          clk,
  input          dbrk_hit0_latch,
  input          dbrk_hit1_latch,
  input          dbrk_hit2_latch,
  input          dbrk_hit3_latch,
  input          debugack,
  input          monitor_error,
  input          monitor_ready,
  input          reset_n,
  input          resetlatch,
  input          tracemem_on,
  input   [35:0] tracemem_trcdata,
  input          tracemem_tw,
  input   [6:0]  trc_im_addr,
  input          trc_on,
  input          trc_wrap,
  input          trigbrktype,
  input          trigger_state_1
);

  wire    [37:0] sr;
  wire    [1:0]  vji_ir_in;
  wire    [1:0]  vji_ir_out;
  wire           vji_rti;
  wire           vji_sdr;
  wire           vji_tck;
  wire           vji_tdi;
  wire           vji_tdo;
  wire           vji_udr;
  wire           vji_uir;
  wire           vji_cdr;

  // Internal module nios_system_cpu_jtag_debug_module_tck logic
  assign jrst_n = 1'b0;
  assign sr = {38{1'b0}};
  assign st_ready_test_idle = 1'b0;
  assign vji_ir_in = 2'b0;
  assign vji_ir_out = 2'b0;
  assign vji_rti = 1'b0;
  assign vji_sdr = 1'b0;
  assign vji_tck = 1'b0;
  assign vji_tdi = 1'b0;
  assign vji_tdo = 1'b0;
  assign vji_udr = 1'b0;
  assign vji_uir = 1'b0;
  assign vji_cdr = 1'b0;

  // Internal module nios_system_cpu_jtag_debug_module_sysclk logic
  assign jdo = {38{1'b0}};
  assign take_action_break_a = 1'b0;
  assign take_action_break_b = 1'b0;
  assign take_action_break_c = 1'b0;
  assign take_action_ocimem_a = 1'b0;
  assign take_action_ocimem_b = 1'b0;
  assign take_action_tracectrl = 1'b0;
  assign take_action_tracemem_a = 1'b0;
  assign take_action_tracemem_b = 1'b0;
  assign take_no_action_break_a = 1'b0;
  assign take_no_action_break_b = 1'b0;
  assign take_no_action_break_c = 1'b0;
  assign take_no_action_ocimem_a = 1'b0;
  assign take_no_action_tracemem_a = 1'b0;

endmodule