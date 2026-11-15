// Hidden tests: 5000 cycles of seeded random inputs (seed 1180548581); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 4;
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
  reg [2:0] i_11;
  reg [2:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_123958 dut (
    .tclk0(clk),
    .cascadein(i_0),
    .nen0(i_1),
    .nen1(i_2),
    .shift0(i_3),
    .shift1(i_4),
    .shiftdone0i(i_5),
    .shiftdone1i(i_6),
    .shiften(i_7),
    .tclk1(i_8),
    .up0(i_9),
    .up1(i_10),
    .vco0ph(i_11),
    .vco1ph(i_12),
    .cascadeout(out_dut[3:3]),
    .divclk(out_dut[2:2]),
    .shiftdone0o(out_dut[1:1]),
    .shiftdone1o(out_dut[0:0])
  );
  origen_123958__ref ref_i (
    .tclk0(clk),
    .cascadein(i_0),
    .nen0(i_1),
    .nen1(i_2),
    .shift0(i_3),
    .shift1(i_4),
    .shiftdone0i(i_5),
    .shiftdone1i(i_6),
    .shiften(i_7),
    .tclk1(i_8),
    .up0(i_9),
    .up1(i_10),
    .vco0ph(i_11),
    .vco1ph(i_12),
    .cascadeout(out_ref[3:3]),
    .divclk(out_ref[2:2]),
    .shiftdone0o(out_ref[1:1]),
    .shiftdone1o(out_ref[0:0])
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
    seed = 1180548581;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
