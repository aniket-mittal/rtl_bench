// Hidden tests: 5000 cycles of seeded random inputs (seed 3253547734); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 53;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [35:0] i_12;
  reg [0:0] i_13;
  reg [6:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_07459 dut (
    .clk(clk),
    .MonDReg(i_0),
    .break_readreg(i_1),
    .dbrk_hit0_latch(i_2),
    .dbrk_hit1_latch(i_3),
    .dbrk_hit2_latch(i_4),
    .dbrk_hit3_latch(i_5),
    .debugack(i_6),
    .monitor_error(i_7),
    .monitor_ready(i_8),
    .reset_n(i_9),
    .resetlatch(i_10),
    .tracemem_on(i_11),
    .tracemem_trcdata(i_12),
    .tracemem_tw(i_13),
    .trc_im_addr(i_14),
    .trc_on(i_15),
    .trc_wrap(i_16),
    .trigbrktype(i_17),
    .trigger_state_1(i_18),
    .jdo(out_dut[52:15]),
    .jrst_n(out_dut[14:14]),
    .st_ready_test_idle(out_dut[13:13]),
    .take_action_break_a(out_dut[12:12]),
    .take_action_break_b(out_dut[11:11]),
    .take_action_break_c(out_dut[10:10]),
    .take_action_ocimem_a(out_dut[9:9]),
    .take_action_ocimem_b(out_dut[8:8]),
    .take_action_tracectrl(out_dut[7:7]),
    .take_action_tracemem_a(out_dut[6:6]),
    .take_action_tracemem_b(out_dut[5:5]),
    .take_no_action_break_a(out_dut[4:4]),
    .take_no_action_break_b(out_dut[3:3]),
    .take_no_action_break_c(out_dut[2:2]),
    .take_no_action_ocimem_a(out_dut[1:1]),
    .take_no_action_tracemem_a(out_dut[0:0])
  );
  rtlpp_07459__ref ref_i (
    .clk(clk),
    .MonDReg(i_0),
    .break_readreg(i_1),
    .dbrk_hit0_latch(i_2),
    .dbrk_hit1_latch(i_3),
    .dbrk_hit2_latch(i_4),
    .dbrk_hit3_latch(i_5),
    .debugack(i_6),
    .monitor_error(i_7),
    .monitor_ready(i_8),
    .reset_n(i_9),
    .resetlatch(i_10),
    .tracemem_on(i_11),
    .tracemem_trcdata(i_12),
    .tracemem_tw(i_13),
    .trc_im_addr(i_14),
    .trc_on(i_15),
    .trc_wrap(i_16),
    .trigbrktype(i_17),
    .trigger_state_1(i_18),
    .jdo(out_ref[52:15]),
    .jrst_n(out_ref[14:14]),
    .st_ready_test_idle(out_ref[13:13]),
    .take_action_break_a(out_ref[12:12]),
    .take_action_break_b(out_ref[11:11]),
    .take_action_break_c(out_ref[10:10]),
    .take_action_ocimem_a(out_ref[9:9]),
    .take_action_ocimem_b(out_ref[8:8]),
    .take_action_tracectrl(out_ref[7:7]),
    .take_action_tracemem_a(out_ref[6:6]),
    .take_action_tracemem_b(out_ref[5:5]),
    .take_no_action_break_a(out_ref[4:4]),
    .take_no_action_break_b(out_ref[3:3]),
    .take_no_action_break_c(out_ref[2:2]),
    .take_no_action_ocimem_a(out_ref[1:1]),
    .take_no_action_tracemem_a(out_ref[0:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 3253547734;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed), $random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
