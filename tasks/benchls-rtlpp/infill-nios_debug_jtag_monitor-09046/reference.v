module rtlpp_09046 (
  MonDReg,
  break_readreg,
  clk,
  dbrk_hit0_latch,
  dbrk_hit1_latch,
  dbrk_hit2_latch,
  dbrk_hit3_latch,
  debugack,
  monitor_error,
  monitor_ready,
  reset_n,
  resetlatch,
  tracemem_on,
  tracemem_trcdata,
  tracemem_tw,
  trc_im_addr,
  trc_on,
  trc_wrap,
  trigbrktype,
  trigger_state_1,

  jdo,
  jrst_n,
  st_ready_test_idle,
  take_action_break_a,
  take_action_break_b,
  take_action_break_c,
  take_action_ocimem_a,
  take_action_ocimem_b,
  take_action_tracectrl,
  take_action_tracemem_a,
  take_action_tracemem_b,
  take_no_action_break_a,
  take_no_action_break_b,
  take_no_action_break_c,
  take_no_action_ocimem_a,
  take_no_action_tracemem_a
);

  output  [ 37: 0] jdo;
  output           jrst_n;
  output           st_ready_test_idle;
  output           take_action_break_a;
  output           take_action_break_b;
  output           take_action_break_c;
  output           take_action_ocimem_a;
  output           take_action_ocimem_b;
  output           take_action_tracectrl;
  output           take_action_tracemem_a;
  output           take_action_tracemem_b;
  output           take_no_action_break_a;
  output           take_no_action_break_b;
  output           take_no_action_break_c;
  output           take_no_action_ocimem_a;
  output           take_no_action_tracemem_a;
  input   [ 31: 0] MonDReg;
  input   [ 31: 0] break_readreg;
  input            clk;
  input            dbrk_hit0_latch;
  input            dbrk_hit1_latch;
  input            dbrk_hit2_latch;
  input            dbrk_hit3_latch;
  input            debugack;
  input            monitor_error;
  input            monitor_ready;
  input            reset_n;
  input            resetlatch;
  input            tracemem_on;
  input   [ 35: 0] tracemem_trcdata;
  input            tracemem_tw;
  input   [  6: 0] trc_im_addr;
  input            trc_on;
  input            trc_wrap;
  input            trigbrktype;
  input            trigger_state_1;

  wire    [ 37: 0] jdo;
  wire             jrst_n;
  wire    [ 37: 0] sr;
  wire             st_ready_test_idle;
  wire             take_action_break_a;
  wire             take_action_break_b;
  wire             take_action_break_c;
  wire             take_action_ocimem_a;
  wire             take_action_ocimem_b;
  wire             take_action_tracectrl;
  wire             take_action_tracemem_a;
  wire             take_action_tracemem_b;
  wire             take_no_action_break_a;
  wire             take_no_action_break_b;
  wire             take_no_action_break_c;
  wire             take_no_action_ocimem_a;
  wire             take_no_action_tracemem_a;
  wire             vji_cdr;
  wire    [  1: 0] vji_ir_in;
  wire    [  1: 0] vji_ir_out;
  wire             vji_rti;
  wire             vji_sdr;
  wire             vji_tck;
  wire             vji_tdi;
  wire             vji_tdo;
  wire             vji_udr;
  wire             vji_uir;

  // Internal module logic for ddr2_v11_0_p0_qsys_sequencer_cpu_inst_jtag_debug_module_tck
  assign vji_tdo = 1'b0;
  assign sr = {38{1'b0}};
  // Internal module logic for jrst_n and st_ready_test_idle signals
  assign jrst_n = ~reset_n & ~resetlatch;
  assign st_ready_test_idle = monitor_ready & ~monitor_error;

  // Internal module logic for other outputs
  assign take_action_break_a = (vji_udr & vji_uir & break_readreg[0] & debugack);
  assign take_action_break_b = (vji_udr & vji_uir & break_readreg[1] & debugack);
  assign take_action_break_c = (vji_udr & vji_uir & break_readreg[2] & debugack);
  assign take_action_ocimem_a = (vji_udr & vji_uir & MonDReg[0] & debugack);
  assign take_action_ocimem_b = (vji_udr & vji_uir & MonDReg[1] & debugack);
  assign take_action_tracectrl = (vji_udr & vji_uir & tracemem_on & debugack);
  assign take_action_tracemem_a = (vji_udr & vji_uir & tracemem_trcdata[0] & debugack);
  assign take_action_tracemem_b = (vji_udr & vji_uir & tracemem_trcdata[1] & debugack);
  assign take_no_action_break_a = ~(take_action_break_a);
  assign take_no_action_break_b = ~(take_action_break_b);
  assign take_no_action_break_c = ~(take_action_break_c);
  assign take_no_action_ocimem_a = ~(take_action_ocimem_a);
  assign take_no_action_tracemem_a = ~(take_action_tracemem_a);

  assign jdo = sr;

  // Fixed assignments for inputs which don't change
  assign vji_tck = 1'b0;
  assign vji_tdi = 1'b0;
  assign vji_sdr = 1'b0;
  assign vji_cdr = 1'b0;
  assign vji_rti = 1'b0;
  assign vji_uir = 1'b0;
  assign vji_udr = 1'b0;
  assign vji_ir_in = 2'b00;

endmodule