// Hidden tests: 5000 cycles of seeded random inputs (seed 1034142735); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 332;
  reg clk;
  reg [3:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  reg [15:0] i_7;
  reg [15:0] i_8;
  reg [15:0] i_9;
  reg [15:0] i_10;
  reg [15:0] i_11;
  reg [15:0] i_12;
  reg [15:0] i_13;
  reg [15:0] i_14;
  reg [15:0] i_15;
  reg [15:0] i_16;
  reg [15:0] i_17;
  reg [15:0] i_18;
  reg [15:0] i_19;
  reg [15:0] i_20;
  reg [15:0] i_21;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_005253 dut (
    .trs(i_0),
    .is_interlaced(i_1),
    .is_serial_output(i_2),
    .is_sample_count_f0(i_3),
    .is_line_count_f0(i_4),
    .is_sample_count_f1(i_5),
    .is_line_count_f1(i_6),
    .is_h_front_porch(i_7),
    .is_h_sync_length(i_8),
    .is_h_blank(i_9),
    .is_v_front_porch(i_10),
    .is_v_sync_length(i_11),
    .is_v_blank(i_12),
    .is_v1_front_porch(i_13),
    .is_v1_sync_length(i_14),
    .is_v1_blank(i_15),
    .is_ap_line(i_16),
    .is_v1_rising_edge(i_17),
    .is_f_rising_edge(i_18),
    .is_f_falling_edge(i_19),
    .is_anc_line(i_20),
    .is_v1_anc_line(i_21),
    .interlaced_nxt(out_dut[331:331]),
    .serial_output_nxt(out_dut[330:330]),
    .h_total_minus_one_nxt(out_dut[329:314]),
    .v_total_minus_one_nxt(out_dut[313:298]),
    .ap_line_nxt(out_dut[297:282]),
    .ap_line_end_nxt(out_dut[281:266]),
    .h_blank_nxt(out_dut[265:250]),
    .sav_nxt(out_dut[249:234]),
    .h_sync_start_nxt(out_dut[233:218]),
    .h_sync_end_nxt(out_dut[217:202]),
    .f2_v_start_nxt(out_dut[201:186]),
    .f1_v_start_nxt(out_dut[185:170]),
    .f1_v_end_nxt(out_dut[169:154]),
    .f2_v_sync_start_nxt(out_dut[153:138]),
    .f2_v_sync_end_nxt(out_dut[137:122]),
    .f1_v_sync_start_nxt(out_dut[121:106]),
    .f1_v_sync_end_nxt(out_dut[105:90]),
    .f_rising_edge_nxt(out_dut[89:74]),
    .f_falling_edge_nxt(out_dut[73:58]),
    .total_line_count_f0_nxt(out_dut[57:45]),
    .total_line_count_f1_nxt(out_dut[44:32]),
    .f2_anc_v_start_nxt(out_dut[31:16]),
    .f1_anc_v_start_nxt(out_dut[15:0])
  );
  autovcoder_005253__ref ref_i (
    .trs(i_0),
    .is_interlaced(i_1),
    .is_serial_output(i_2),
    .is_sample_count_f0(i_3),
    .is_line_count_f0(i_4),
    .is_sample_count_f1(i_5),
    .is_line_count_f1(i_6),
    .is_h_front_porch(i_7),
    .is_h_sync_length(i_8),
    .is_h_blank(i_9),
    .is_v_front_porch(i_10),
    .is_v_sync_length(i_11),
    .is_v_blank(i_12),
    .is_v1_front_porch(i_13),
    .is_v1_sync_length(i_14),
    .is_v1_blank(i_15),
    .is_ap_line(i_16),
    .is_v1_rising_edge(i_17),
    .is_f_rising_edge(i_18),
    .is_f_falling_edge(i_19),
    .is_anc_line(i_20),
    .is_v1_anc_line(i_21),
    .interlaced_nxt(out_ref[331:331]),
    .serial_output_nxt(out_ref[330:330]),
    .h_total_minus_one_nxt(out_ref[329:314]),
    .v_total_minus_one_nxt(out_ref[313:298]),
    .ap_line_nxt(out_ref[297:282]),
    .ap_line_end_nxt(out_ref[281:266]),
    .h_blank_nxt(out_ref[265:250]),
    .sav_nxt(out_ref[249:234]),
    .h_sync_start_nxt(out_ref[233:218]),
    .h_sync_end_nxt(out_ref[217:202]),
    .f2_v_start_nxt(out_ref[201:186]),
    .f1_v_start_nxt(out_ref[185:170]),
    .f1_v_end_nxt(out_ref[169:154]),
    .f2_v_sync_start_nxt(out_ref[153:138]),
    .f2_v_sync_end_nxt(out_ref[137:122]),
    .f1_v_sync_start_nxt(out_ref[121:106]),
    .f1_v_sync_end_nxt(out_ref[105:90]),
    .f_rising_edge_nxt(out_ref[89:74]),
    .f_falling_edge_nxt(out_ref[73:58]),
    .total_line_count_f0_nxt(out_ref[57:45]),
    .total_line_count_f1_nxt(out_ref[44:32]),
    .f2_anc_v_start_nxt(out_ref[31:16]),
    .f1_anc_v_start_nxt(out_ref[15:0])
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
    seed = 1034142735;
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
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
