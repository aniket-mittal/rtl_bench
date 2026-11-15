// Hidden tests: 5000 cycles of seeded random inputs (seed 458354855); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 195;
  reg clk;
  reg [10:0] i_0;
  reg [63:0] i_1;
  reg [127:0] i_2;
  reg [127:0] i_3;
  reg [15:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_109870 dut (
    .opcode(i_0),
    .pc_in(i_1),
    .ra(i_2),
    .rc(i_3),
    .imm(i_4),
    .pc(out_dut[194:131]),
    .result(out_dut[130:3]),
    .branch_jump_signal(out_dut[2:2]),
    .take_or_not(out_dut[1:1]),
    .stop(out_dut[0:0])
  );
  origen_109870__ref ref_i (
    .opcode(i_0),
    .pc_in(i_1),
    .ra(i_2),
    .rc(i_3),
    .imm(i_4),
    .pc(out_ref[194:131]),
    .result(out_ref[130:3]),
    .branch_jump_signal(out_ref[2:2]),
    .take_or_not(out_ref[1:1]),
    .stop(out_ref[0:0])
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
    seed = 458354855;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed), $random(seed)};
      i_2 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_3 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_4 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
