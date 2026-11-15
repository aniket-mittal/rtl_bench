// Hidden tests: 5000 cycles of seeded random inputs (seed 3565129269); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 43;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [1:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [35:0] i_15;
  reg [0:0] i_16;
  reg [6:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00544 dut (
    .tck(clk),
    .MonDReg(i_0),
    .break_readreg(i_1),
    .dbrk_hit0_latch(i_2),
    .dbrk_hit1_latch(i_3),
    .dbrk_hit2_latch(i_4),
    .dbrk_hit3_latch(i_5),
    .debugack(i_6),
    .ir_in(i_7),
    .jtag_state_rti(i_8),
    .monitor_error(i_9),
    .monitor_ready(i_10),
    .reset_n(i_11),
    .resetlatch(i_12),
    .tdi(i_13),
    .tracemem_on(i_14),
    .tracemem_trcdata(i_15),
    .tracemem_tw(i_16),
    .trc_im_addr(i_17),
    .trc_on(i_18),
    .trc_wrap(i_19),
    .trigbrktype(i_20),
    .trigger_state_1(i_21),
    .vs_cdr(i_22),
    .vs_sdr(i_23),
    .vs_uir(i_24),
    .ir_out(out_dut[42:41]),
    .jrst_n(out_dut[40:40]),
    .sr(out_dut[39:2]),
    .st_ready_test_idle(out_dut[1:1]),
    .tdo(out_dut[0:0])
  );
  rtlpp_00544__ref ref_i (
    .tck(clk),
    .MonDReg(i_0),
    .break_readreg(i_1),
    .dbrk_hit0_latch(i_2),
    .dbrk_hit1_latch(i_3),
    .dbrk_hit2_latch(i_4),
    .dbrk_hit3_latch(i_5),
    .debugack(i_6),
    .ir_in(i_7),
    .jtag_state_rti(i_8),
    .monitor_error(i_9),
    .monitor_ready(i_10),
    .reset_n(i_11),
    .resetlatch(i_12),
    .tdi(i_13),
    .tracemem_on(i_14),
    .tracemem_trcdata(i_15),
    .tracemem_tw(i_16),
    .trc_im_addr(i_17),
    .trc_on(i_18),
    .trc_wrap(i_19),
    .trigbrktype(i_20),
    .trigger_state_1(i_21),
    .vs_cdr(i_22),
    .vs_sdr(i_23),
    .vs_uir(i_24),
    .ir_out(out_ref[42:41]),
    .jrst_n(out_ref[40:40]),
    .sr(out_ref[39:2]),
    .st_ready_test_idle(out_ref[1:1]),
    .tdo(out_ref[0:0])
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
    seed = 3565129269;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed), $random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
