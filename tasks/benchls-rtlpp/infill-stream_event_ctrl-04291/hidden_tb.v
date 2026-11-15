// Hidden tests: 5000 cycles of seeded random inputs (seed 2948508974); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 532;
  reg clk;
  reg [128:0] i_0;
  reg [0:0] i_1;
  reg [128:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [128:0] i_6;
  reg [0:0] i_7;
  reg [128:0] i_8;
  reg [0:0] i_9;
  reg [128:0] i_10;
  reg [0:0] i_11;
  reg [128:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [31:0] i_18;
  reg [0:0] i_19;
  reg [31:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_04291 dut (
    .ap_clk(clk),
    .lpcore_init_event_stream_0_dout(i_0),
    .lpcore_init_event_stream_0_empty_n(i_1),
    .lpcore_init_event_stream_1_dout(i_2),
    .lpcore_init_event_stream_1_empty_n(i_3),
    .lpcore_event_queue_full_stream_0_full_n(i_4),
    .lpcore_event_queue_full_stream_1_full_n(i_5),
    .lpcore_anti_message_stream_0_dout(i_6),
    .lpcore_anti_message_stream_0_empty_n(i_7),
    .lpcore_anti_message_stream_1_dout(i_8),
    .lpcore_anti_message_stream_1_empty_n(i_9),
    .lpcore_enqueue_event_stream_0_dout(i_10),
    .lpcore_enqueue_event_stream_0_empty_n(i_11),
    .lpcore_enqueue_event_stream_1_dout(i_12),
    .lpcore_enqueue_event_stream_1_empty_n(i_13),
    .lpcore_output_event_stream_0_full_n(i_14),
    .lpcore_output_event_stream_1_full_n(i_15),
    .lpcore_cancellation_unit_output_stream_0_full_n(i_16),
    .lpcore_cancellation_unit_output_stream_1_full_n(i_17),
    .lpcore_commit_time_stream_0_dout(i_18),
    .lpcore_commit_time_stream_0_empty_n(i_19),
    .lpcore_commit_time_stream_1_dout(i_20),
    .lpcore_commit_time_stream_1_empty_n(i_21),
    .ap_rst(i_22),
    .lpcore_init_event_stream_0_read(out_dut[531:531]),
    .lpcore_init_event_stream_1_read(out_dut[530:530]),
    .lpcore_event_queue_full_stream_0_din(out_dut[529:529]),
    .lpcore_event_queue_full_stream_0_write(out_dut[528:528]),
    .lpcore_event_queue_full_stream_1_din(out_dut[527:527]),
    .lpcore_event_queue_full_stream_1_write(out_dut[526:526]),
    .lpcore_anti_message_stream_0_read(out_dut[525:525]),
    .lpcore_anti_message_stream_1_read(out_dut[524:524]),
    .lpcore_enqueue_event_stream_0_read(out_dut[523:523]),
    .lpcore_enqueue_event_stream_1_read(out_dut[522:522]),
    .lpcore_output_event_stream_0_din(out_dut[521:393]),
    .lpcore_output_event_stream_0_write(out_dut[392:392]),
    .lpcore_output_event_stream_1_din(out_dut[391:263]),
    .lpcore_output_event_stream_1_write(out_dut[262:262]),
    .lpcore_cancellation_unit_output_stream_0_din(out_dut[261:133]),
    .lpcore_cancellation_unit_output_stream_0_write(out_dut[132:132]),
    .lpcore_cancellation_unit_output_stream_1_din(out_dut[131:3]),
    .lpcore_cancellation_unit_output_stream_1_write(out_dut[2:2]),
    .lpcore_commit_time_stream_0_read(out_dut[1:1]),
    .lpcore_commit_time_stream_1_read(out_dut[0:0])
  );
  rtlpp_04291__ref ref_i (
    .ap_clk(clk),
    .lpcore_init_event_stream_0_dout(i_0),
    .lpcore_init_event_stream_0_empty_n(i_1),
    .lpcore_init_event_stream_1_dout(i_2),
    .lpcore_init_event_stream_1_empty_n(i_3),
    .lpcore_event_queue_full_stream_0_full_n(i_4),
    .lpcore_event_queue_full_stream_1_full_n(i_5),
    .lpcore_anti_message_stream_0_dout(i_6),
    .lpcore_anti_message_stream_0_empty_n(i_7),
    .lpcore_anti_message_stream_1_dout(i_8),
    .lpcore_anti_message_stream_1_empty_n(i_9),
    .lpcore_enqueue_event_stream_0_dout(i_10),
    .lpcore_enqueue_event_stream_0_empty_n(i_11),
    .lpcore_enqueue_event_stream_1_dout(i_12),
    .lpcore_enqueue_event_stream_1_empty_n(i_13),
    .lpcore_output_event_stream_0_full_n(i_14),
    .lpcore_output_event_stream_1_full_n(i_15),
    .lpcore_cancellation_unit_output_stream_0_full_n(i_16),
    .lpcore_cancellation_unit_output_stream_1_full_n(i_17),
    .lpcore_commit_time_stream_0_dout(i_18),
    .lpcore_commit_time_stream_0_empty_n(i_19),
    .lpcore_commit_time_stream_1_dout(i_20),
    .lpcore_commit_time_stream_1_empty_n(i_21),
    .ap_rst(i_22),
    .lpcore_init_event_stream_0_read(out_ref[531:531]),
    .lpcore_init_event_stream_1_read(out_ref[530:530]),
    .lpcore_event_queue_full_stream_0_din(out_ref[529:529]),
    .lpcore_event_queue_full_stream_0_write(out_ref[528:528]),
    .lpcore_event_queue_full_stream_1_din(out_ref[527:527]),
    .lpcore_event_queue_full_stream_1_write(out_ref[526:526]),
    .lpcore_anti_message_stream_0_read(out_ref[525:525]),
    .lpcore_anti_message_stream_1_read(out_ref[524:524]),
    .lpcore_enqueue_event_stream_0_read(out_ref[523:523]),
    .lpcore_enqueue_event_stream_1_read(out_ref[522:522]),
    .lpcore_output_event_stream_0_din(out_ref[521:393]),
    .lpcore_output_event_stream_0_write(out_ref[392:392]),
    .lpcore_output_event_stream_1_din(out_ref[391:263]),
    .lpcore_output_event_stream_1_write(out_ref[262:262]),
    .lpcore_cancellation_unit_output_stream_0_din(out_ref[261:133]),
    .lpcore_cancellation_unit_output_stream_0_write(out_ref[132:132]),
    .lpcore_cancellation_unit_output_stream_1_din(out_ref[131:3]),
    .lpcore_cancellation_unit_output_stream_1_write(out_ref[2:2]),
    .lpcore_commit_time_stream_0_read(out_ref[1:1]),
    .lpcore_commit_time_stream_1_read(out_ref[0:0])
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
    seed = 2948508974;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
