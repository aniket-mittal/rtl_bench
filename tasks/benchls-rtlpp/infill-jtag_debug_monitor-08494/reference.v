module rtlpp_08494 (
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

  output  [37:0] jdo;
  output         jrst_n;
  output         st_ready_test_idle;
  output         take_action_break_a;
  output         take_action_break_b;
  output         take_action_break_c;
  output         take_action_ocimem_a;
  output         take_action_ocimem_b;
  output         take_action_tracectrl;
  output         take_action_tracemem_a;
  output         take_action_tracemem_b;
  output         take_no_action_break_a;
  output         take_no_action_break_b;
  output         take_no_action_break_c;
  output         take_no_action_ocimem_a;
  output         take_no_action_tracemem_a;
  input  [31:0]  MonDReg;
  input  [31:0]  break_readreg;
  input          clk;
  input          dbrk_hit0_latch;
  input          dbrk_hit1_latch;
  input          dbrk_hit2_latch;
  input          dbrk_hit3_latch;
  input          debugack;
  input          monitor_error;
  input          monitor_ready;
  input          reset_n;
  input          resetlatch;
  input          tracemem_on;
  input  [35:0]  tracemem_trcdata;
  input          tracemem_tw;
  input  [6:0]   trc_im_addr;
  input          trc_on;
  input          trc_wrap;
  input          trigbrktype;
  input          trigger_state_1;

  wire    [37:0] sr;
  wire           vji_cdr;
  wire    [1:0]  vji_ir_in;
  wire    [1:0]  vji_ir_out;
  wire           vji_rti;
  wire           vji_sdr;
  wire           vji_tck;
  wire           vji_tdi;
  wire           vji_tdo;
  wire           vji_udr;
  wire           vji_uir;

  assign vji_tck = 1'b0;
  assign vji_tdi = 1'b0;
  assign vji_sdr = 1'b0;
  assign vji_cdr = 1'b0;
  assign vji_rti = 1'b0;
  assign vji_uir = 1'b0;
  assign vji_udr = 1'b0;
  assign vji_ir_in = 2'b0;

  // qsys_block_NIOS_jtag_debug_module_tck Module Replacement
  assign jrst_n = ~reset_n & ~resetlatch;
  assign sr = {MonDReg, break_readreg, debugack, dbrk_hit0_latch, dbrk_hit1_latch, dbrk_hit2_latch, dbrk_hit3_latch,
               monitor_error, monitor_ready, tracemem_on, tracemem_trcdata, tracemem_tw, trc_im_addr, trc_on, trc_wrap,
               trigbrktype, trigger_state_1};

  // qsys_block_NIOS_jtag_debug_module_sysclk Module Replacement
  assign jdo = sr;
  assign take_action_break_a = vji_udr;
  assign take_action_break_b = vji_udr;
  assign take_action_break_c = vji_udr;
  assign take_action_ocimem_a = vji_udr;
  assign take_action_ocimem_b = vji_udr;
  assign take_action_tracectrl = vji_udr;
  assign take_action_tracemem_a = vji_udr;
  assign take_action_tracemem_b = vji_udr;
  assign take_no_action_break_a = vji_uir;
  assign take_no_action_break_b = vji_uir;
  assign take_no_action_break_c = vji_uir;
  assign take_no_action_ocimem_a = vji_uir;
  assign take_no_action_tracemem_a = vji_uir;
  assign st_ready_test_idle = ~vji_rti;

endmodule