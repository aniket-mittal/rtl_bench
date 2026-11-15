// Hidden tests: 5000 cycles of seeded random inputs (seed 1244836637); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 66;
  reg clk;
  reg [0:0] i_0;
  reg [63:0] i_1;
  reg [63:0] i_2;
  reg [63:0] i_3;
  reg [63:0] i_4;
  reg [63:0] i_5;
  reg [63:0] i_6;
  reg [63:0] i_7;
  reg [63:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_020933 dut (
    .clk(clk),
    .rst(i_0),
    .input_update0(i_1),
    .input_update1(i_2),
    .input_update2(i_3),
    .input_update3(i_4),
    .input_update4(i_5),
    .input_update5(i_6),
    .input_update6(i_7),
    .input_update7(i_8),
    .input_valid0(i_9),
    .input_valid1(i_10),
    .input_valid2(i_11),
    .input_valid3(i_12),
    .input_valid4(i_13),
    .input_valid5(i_14),
    .input_valid6(i_15),
    .input_valid7(i_16),
    .output_word(out_dut[65:2]),
    .output_valid(out_dut[1:1]),
    .se_stall_request(out_dut[0:0])
  );
  autovcoder_020933__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .input_update0(i_1),
    .input_update1(i_2),
    .input_update2(i_3),
    .input_update3(i_4),
    .input_update4(i_5),
    .input_update5(i_6),
    .input_update6(i_7),
    .input_update7(i_8),
    .input_valid0(i_9),
    .input_valid1(i_10),
    .input_valid2(i_11),
    .input_valid3(i_12),
    .input_valid4(i_13),
    .input_valid5(i_14),
    .input_valid6(i_15),
    .input_valid7(i_16),
    .output_word(out_ref[65:2]),
    .output_valid(out_ref[1:1]),
    .se_stall_request(out_ref[0:0])
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
    seed = 1244836637;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed), $random(seed)};
      i_2 = {$random(seed), $random(seed)};
      i_3 = {$random(seed), $random(seed)};
      i_4 = {$random(seed), $random(seed)};
      i_5 = {$random(seed), $random(seed)};
      i_6 = {$random(seed), $random(seed)};
      i_7 = {$random(seed), $random(seed)};
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
