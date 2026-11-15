module rtlpp_06441 (
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

  reg    [ 37: 0] jdo;
  reg             jrst_n;
  reg             st_ready_test_idle;
  reg             take_action_break_a;
  reg             take_action_break_b;
  reg             take_action_break_c;
  reg             take_action_ocimem_a;
  reg             take_action_ocimem_b;
  reg             take_action_tracectrl;
  reg             take_action_tracemem_a;
  reg             take_action_tracemem_b;
  reg             take_no_action_break_a;
  reg             take_no_action_break_b;
  reg             take_no_action_break_c;
  reg             take_no_action_ocimem_a;
  reg             take_no_action_tracemem_a;
  reg    [ 37: 0] sr;

  [MASKED]

endmodule