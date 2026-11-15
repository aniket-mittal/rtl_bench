// Hidden tests: 5000 cycles of seeded random inputs (seed 3025981867); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 5;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [32:0] i_3;
  reg [48:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03992 dut (
    .clk(clk),
    .state_fetch(i_0),
    .ob(i_1),
    .r(i_2),
    .alu(i_3),
    .ir(i_4),
    .aeqm(i_5),
    .destintctl(i_6),
    .nopa(i_7),
    .sintr(i_8),
    .vmaok(i_9),
    .reset(i_10),
    .int_enable(out_dut[4:4]),
    .jcond(out_dut[3:3]),
    .lc_byte_mode(out_dut[2:2]),
    .prog_unibus_reset(out_dut[1:1]),
    .sequence_break(out_dut[0:0])
  );
  rtlpp_03992__ref ref_i (
    .clk(clk),
    .state_fetch(i_0),
    .ob(i_1),
    .r(i_2),
    .alu(i_3),
    .ir(i_4),
    .aeqm(i_5),
    .destintctl(i_6),
    .nopa(i_7),
    .sintr(i_8),
    .vmaok(i_9),
    .reset(i_10),
    .int_enable(out_ref[4:4]),
    .jcond(out_ref[3:3]),
    .lc_byte_mode(out_ref[2:2]),
    .prog_unibus_reset(out_ref[1:1]),
    .sequence_break(out_ref[0:0])
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
    seed = 3025981867;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed)};
      i_4 = {$random(seed), $random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
