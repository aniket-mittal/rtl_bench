// Hidden tests: 5000 cycles of seeded random inputs (seed 2971958309); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 72;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  reg [0:0] i_2;
  reg [15:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_105216 dut (
    .i_clk(clk),
    .i_rst(i_0),
    .adc_left_data(i_1),
    .adc_left_valid(i_2),
    .adc_right_data(i_3),
    .adc_right_valid(i_4),
    .dac_left_ready(i_5),
    .dac_right_ready(i_6),
    .record_audio_ready(i_7),
    .play_audio_data(i_8),
    .play_audio_valid(i_9),
    .adc_left_ready(out_dut[71:71]),
    .adc_right_ready(out_dut[70:70]),
    .dac_left_data(out_dut[69:54]),
    .dac_left_valid(out_dut[53:53]),
    .dac_right_data(out_dut[52:37]),
    .dac_right_valid(out_dut[36:36]),
    .record_audio_data(out_dut[35:4]),
    .record_audio_valid(out_dut[3:3]),
    .play_audio_ready(out_dut[2:2]),
    .debug_state(out_dut[1:0])
  );
  origen_105216__ref ref_i (
    .i_clk(clk),
    .i_rst(i_0),
    .adc_left_data(i_1),
    .adc_left_valid(i_2),
    .adc_right_data(i_3),
    .adc_right_valid(i_4),
    .dac_left_ready(i_5),
    .dac_right_ready(i_6),
    .record_audio_ready(i_7),
    .play_audio_data(i_8),
    .play_audio_valid(i_9),
    .adc_left_ready(out_ref[71:71]),
    .adc_right_ready(out_ref[70:70]),
    .dac_left_data(out_ref[69:54]),
    .dac_left_valid(out_ref[53:53]),
    .dac_right_data(out_ref[52:37]),
    .dac_right_valid(out_ref[36:36]),
    .record_audio_data(out_ref[35:4]),
    .record_audio_valid(out_ref[3:3]),
    .play_audio_ready(out_ref[2:2]),
    .debug_state(out_ref[1:0])
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
    seed = 2971958309;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
