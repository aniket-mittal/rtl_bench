// Hidden tests: 5000 cycles of seeded random inputs (seed 2673926265); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 15;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
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
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_132739 dut (
    .arbpc1_pcxdp_grant_bufp1_pa_l(i_0),
    .arbpc1_pcxdp_q0_hold_bufp1_pa(i_1),
    .arbpc1_pcxdp_qsel0_bufp1_pa_l(i_2),
    .arbpc1_pcxdp_qsel1_bufp1_pa(i_3),
    .arbpc1_pcxdp_shift_bufp1_px_l(i_4),
    .arbpc3_pcxdp_grant_bufp1_pa_l(i_5),
    .arbpc3_pcxdp_q0_hold_bufp1_pa(i_6),
    .arbpc3_pcxdp_qsel0_bufp1_pa_l(i_7),
    .arbpc3_pcxdp_qsel1_bufp1_pa(i_8),
    .arbpc3_pcxdp_shift_bufp1_px_l(i_9),
    .arbpc4_pcxdp_grant_bufp1_pa_l(i_10),
    .arbpc4_pcxdp_q0_hold_bufp1_pa(i_11),
    .arbpc4_pcxdp_qsel0_bufp1_pa_l(i_12),
    .arbpc4_pcxdp_qsel1_bufp1_pa(i_13),
    .arbpc4_pcxdp_shift_bufp1_px_l(i_14),
    .arbpc1_pcxdp_grant_pa(out_dut[14:14]),
    .arbpc1_pcxdp_q0_hold_pa_l(out_dut[13:13]),
    .arbpc1_pcxdp_qsel0_pa(out_dut[12:12]),
    .arbpc1_pcxdp_qsel1_pa_l(out_dut[11:11]),
    .arbpc1_pcxdp_shift_px(out_dut[10:10]),
    .arbpc3_pcxdp_grant_pa(out_dut[9:9]),
    .arbpc3_pcxdp_q0_hold_pa_l(out_dut[8:8]),
    .arbpc3_pcxdp_qsel0_pa(out_dut[7:7]),
    .arbpc3_pcxdp_qsel1_pa_l(out_dut[6:6]),
    .arbpc3_pcxdp_shift_px(out_dut[5:5]),
    .arbpc4_pcxdp_grant_pa(out_dut[4:4]),
    .arbpc4_pcxdp_q0_hold_pa_l(out_dut[3:3]),
    .arbpc4_pcxdp_qsel0_pa(out_dut[2:2]),
    .arbpc4_pcxdp_qsel1_pa_l(out_dut[1:1]),
    .arbpc4_pcxdp_shift_px(out_dut[0:0])
  );
  origen_132739__ref ref_i (
    .arbpc1_pcxdp_grant_bufp1_pa_l(i_0),
    .arbpc1_pcxdp_q0_hold_bufp1_pa(i_1),
    .arbpc1_pcxdp_qsel0_bufp1_pa_l(i_2),
    .arbpc1_pcxdp_qsel1_bufp1_pa(i_3),
    .arbpc1_pcxdp_shift_bufp1_px_l(i_4),
    .arbpc3_pcxdp_grant_bufp1_pa_l(i_5),
    .arbpc3_pcxdp_q0_hold_bufp1_pa(i_6),
    .arbpc3_pcxdp_qsel0_bufp1_pa_l(i_7),
    .arbpc3_pcxdp_qsel1_bufp1_pa(i_8),
    .arbpc3_pcxdp_shift_bufp1_px_l(i_9),
    .arbpc4_pcxdp_grant_bufp1_pa_l(i_10),
    .arbpc4_pcxdp_q0_hold_bufp1_pa(i_11),
    .arbpc4_pcxdp_qsel0_bufp1_pa_l(i_12),
    .arbpc4_pcxdp_qsel1_bufp1_pa(i_13),
    .arbpc4_pcxdp_shift_bufp1_px_l(i_14),
    .arbpc1_pcxdp_grant_pa(out_ref[14:14]),
    .arbpc1_pcxdp_q0_hold_pa_l(out_ref[13:13]),
    .arbpc1_pcxdp_qsel0_pa(out_ref[12:12]),
    .arbpc1_pcxdp_qsel1_pa_l(out_ref[11:11]),
    .arbpc1_pcxdp_shift_px(out_ref[10:10]),
    .arbpc3_pcxdp_grant_pa(out_ref[9:9]),
    .arbpc3_pcxdp_q0_hold_pa_l(out_ref[8:8]),
    .arbpc3_pcxdp_qsel0_pa(out_ref[7:7]),
    .arbpc3_pcxdp_qsel1_pa_l(out_ref[6:6]),
    .arbpc3_pcxdp_shift_px(out_ref[5:5]),
    .arbpc4_pcxdp_grant_pa(out_ref[4:4]),
    .arbpc4_pcxdp_q0_hold_pa_l(out_ref[3:3]),
    .arbpc4_pcxdp_qsel0_pa(out_ref[2:2]),
    .arbpc4_pcxdp_qsel1_pa_l(out_ref[1:1]),
    .arbpc4_pcxdp_shift_px(out_ref[0:0])
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
    seed = 2673926265;
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
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
