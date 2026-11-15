module rtlpp_09347 (
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
                                                                take_no_action_break_a,
                                                                take_no_action_break_b,
                                                                take_no_action_break_c,
                                                                take_no_action_ocimem_a
                                                             );

  input [31:0] MonDReg;
  input [31:0] break_readreg;
  input clk;
  input dbrk_hit0_latch;
  input dbrk_hit1_latch;
  input dbrk_hit2_latch;
  input dbrk_hit3_latch;
  input debugack;
  input monitor_error;
  input monitor_ready;
  input reset_n;
  input resetlatch;
  input tracemem_on;
  input [35:0] tracemem_trcdata;
  input tracemem_tw;
  input [6:0] trc_im_addr;
  input trc_on;
  input trc_wrap;
  input trigbrktype;
  input trigger_state_1;
  output [37:0] jdo;
  output jrst_n;
  output st_ready_test_idle;
  output take_action_break_a;
  output take_action_break_b;
  output take_action_break_c;
  output take_action_ocimem_a;
  output take_action_ocimem_b;
  output take_action_tracectrl;
  output take_no_action_break_a;
  output take_no_action_break_b;
  output take_no_action_break_c;
  output take_no_action_ocimem_a;

  wire [37:0] sr;
  wire vji_sdr, vji_tck, vji_tdi, vji_rti, vji_cdr, vji_udr, vji_uir;
  wire [1:0] vji_ir_in, vji_ir_out;

  // Logic corresponding to the module "the_FTOP_MSOC_CPU_1b_p2_sub_cpu_0_cpu_debug_slave_tck"
  reg [37:0] sr_reg;
  reg jrst_n_reg, st_ready_test_idle_reg, take_action_break_a_reg;
  reg take_action_break_b_reg, take_action_break_c_reg, take_action_ocimem_a_reg;
  reg take_action_ocimem_b_reg, take_action_tracectrl_reg, take_no_action_break_a_reg;
  reg take_no_action_break_b_reg, take_no_action_break_c_reg, take_no_action_ocimem_a_reg;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      jrst_n_reg <= 1'b0;
      st_ready_test_idle_reg <= 1'b0;
      take_action_break_a_reg <= 1'b0;
      take_action_break_b_reg <= 1'b0;
      take_action_break_c_reg <= 1'b0;
      take_action_ocimem_a_reg <= 1'b0;
      take_action_ocimem_b_reg <= 1'b0;
      take_action_tracectrl_reg <= 1'b0;
      take_no_action_break_a_reg <= 1'b0;
      take_no_action_break_b_reg <= 1'b0;
      take_no_action_break_c_reg <= 1'b0;
      take_no_action_ocimem_a_reg <= 1'b0;
      sr_reg <= 38'b0;
    end else begin
      jrst_n_reg <= jrst_n;
      st_ready_test_idle_reg <= st_ready_test_idle;
      take_action_break_a_reg <= take_action_break_a;
      take_action_break_b_reg <= take_action_break_b;
      take_action_break_c_reg <= take_action_break_c;
      take_action_ocimem_a_reg <= take_action_ocimem_a;
      take_action_ocimem_b_reg <= take_action_ocimem_b;
      take_action_tracectrl_reg <= take_action_tracectrl;
      take_no_action_break_a_reg <= take_no_action_break_a;
      take_no_action_break_b_reg <= take_no_action_break_b;
      take_no_action_break_c_reg <= take_no_action_break_c;
      take_no_action_ocimem_a_reg <= take_no_action_ocimem_a;
      sr_reg <= sr;
    end
  end

  // Logic corresponding to the module "the_FTOP_MSOC_CPU_1b_p2_sub_cpu_0_cpu_debug_slave_sysclk"
  reg [37:0] jdo_reg;

  always @(posedge clk) begin
    jdo_reg <= jdo;
  end

  // Assignments
  assign jdo = jdo_reg;
  assign jrst_n = jrst_n_reg;
  assign st_ready_test_idle = st_ready_test_idle_reg;
  assign take_action_break_a = take_action_break_a_reg;
  assign take_action_break_b = take_action_break_b_reg;
  assign take_action_break_c = take_action_break_c_reg;
  assign take_action_ocimem_a = take_action_ocimem_a_reg;
  assign take_action_ocimem_b = take_action_ocimem_b_reg;
  assign take_action_tracectrl = take_action_tracectrl_reg;
  assign take_no_action_break_a = take_no_action_break_a_reg;
  assign take_no_action_break_b = take_no_action_break_b_reg;
  assign take_no_action_break_c = take_no_action_break_c_reg;
  assign take_no_action_ocimem_a = take_no_action_ocimem_a_reg;
  assign sr = sr_reg;

  // VJI signals logic
  assign vji_tck = 1'b0;
  assign vji_tdi = 1'b0;
  assign vji_sdr = 1'b0;
  assign vji_cdr = 1'b0;
  assign vji_rti = 1'b0;
  assign vji_uir = 1'b0;
  assign vji_udr = 1'b0;
  assign vji_ir_in = 2'b0;

endmodule