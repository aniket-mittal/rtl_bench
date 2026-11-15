// Hidden tests: 5000 cycles of seeded random inputs (seed 1186058724); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 2;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [0:0] i_4;
  reg [17:0] i_5;
  reg [17:0] i_6;
  reg [17:0] i_7;
  reg [17:0] i_8;
  reg [17:0] i_9;
  reg [6:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_11645 dut (
    .clk(clk),
    .reset(i_0),
    .data(i_1),
    .data_valid(i_2),
    .trigger_i(i_3),
    .trigger_in(i_4),
    .edge_detect_enable(i_5),
    .rise_edge_enable(i_6),
    .fall_edge_enable(i_7),
    .low_level_enable(i_8),
    .high_level_enable(i_9),
    .trigger_logic(i_10),
    .trigger_out(out_dut[1:1]),
    .trigger_out_adc(out_dut[0:0])
  );
  rtlpp_11645__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .data(i_1),
    .data_valid(i_2),
    .trigger_i(i_3),
    .trigger_in(i_4),
    .edge_detect_enable(i_5),
    .rise_edge_enable(i_6),
    .fall_edge_enable(i_7),
    .low_level_enable(i_8),
    .high_level_enable(i_9),
    .trigger_logic(i_10),
    .trigger_out(out_ref[1:1]),
    .trigger_out_adc(out_ref[0:0])
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
    seed = 1186058724;
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
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
