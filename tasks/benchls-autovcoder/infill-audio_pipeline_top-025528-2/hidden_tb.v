// Hidden tests: 5000 cycles of seeded random inputs (seed 3943295583); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 247;
  reg clk;
  reg [0:0] i_0;
  reg [127:0] i_1;
  reg [127:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [0:0] i_6;
  reg [103:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_025528 dut (
    .clk_i(clk),
    .rst_n_i(i_0),
    .la_data_in_i(i_1),
    .la_oenb_i(i_2),
    .ctl_pipeline_en_i(i_3),
    .mic_pdm_data_i(i_4),
    .dfe_data_i(i_5),
    .dfe_valid_i(i_6),
    .aco_data_i(i_7),
    .aco_valid_i(i_8),
    .aco_last_i(i_9),
    .wrd_wake_i(i_10),
    .wrd_wake_valid_i(i_11),
    .la_data_out_o(out_dut[246:119]),
    .ctl_pipeline_en_o(out_dut[118:118]),
    .mic_pdm_data_o(out_dut[117:117]),
    .dfe_data_o(out_dut[116:109]),
    .dfe_valid_o(out_dut[108:108]),
    .aco_data_o(out_dut[107:4]),
    .aco_valid_o(out_dut[3:3]),
    .aco_last_o(out_dut[2:2]),
    .wrd_wake_o(out_dut[1:1]),
    .wrd_wake_valid_o(out_dut[0:0])
  );
  autovcoder_025528__ref ref_i (
    .clk_i(clk),
    .rst_n_i(i_0),
    .la_data_in_i(i_1),
    .la_oenb_i(i_2),
    .ctl_pipeline_en_i(i_3),
    .mic_pdm_data_i(i_4),
    .dfe_data_i(i_5),
    .dfe_valid_i(i_6),
    .aco_data_i(i_7),
    .aco_valid_i(i_8),
    .aco_last_i(i_9),
    .wrd_wake_i(i_10),
    .wrd_wake_valid_i(i_11),
    .la_data_out_o(out_ref[246:119]),
    .ctl_pipeline_en_o(out_ref[118:118]),
    .mic_pdm_data_o(out_ref[117:117]),
    .dfe_data_o(out_ref[116:109]),
    .dfe_valid_o(out_ref[108:108]),
    .aco_data_o(out_ref[107:4]),
    .aco_valid_o(out_ref[3:3]),
    .aco_last_o(out_ref[2:2]),
    .wrd_wake_o(out_ref[1:1]),
    .wrd_wake_valid_o(out_ref[0:0])
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
    seed = 3943295583;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_2 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
