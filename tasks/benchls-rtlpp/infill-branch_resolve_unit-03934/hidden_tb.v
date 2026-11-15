// Hidden tests: 5000 cycles of seeded random inputs (seed 3106879987); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 35;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [15:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03934 dut (
    .in_valid(i_0),
    .in_pr(i_1),
    .in_t(i_2),
    .in_raw(i_3),
    .in_opl(i_4),
    .in_oph(i_5),
    .out_taken(out_dut[34:34]),
    .out_target(out_dut[33:2]),
    .out_delayslot(out_dut[1:1]),
    .out_write_pr(out_dut[0:0])
  );
  rtlpp_03934__ref ref_i (
    .in_valid(i_0),
    .in_pr(i_1),
    .in_t(i_2),
    .in_raw(i_3),
    .in_opl(i_4),
    .in_oph(i_5),
    .out_taken(out_ref[34:34]),
    .out_target(out_ref[33:2]),
    .out_delayslot(out_ref[1:1]),
    .out_write_pr(out_ref[0:0])
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
    seed = 3106879987;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
