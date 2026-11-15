// Hidden tests: 5000 cycles of seeded random inputs (seed 1092850768); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 2;
  reg clk;
  reg [0:0] i_0;
  reg [5:0] i_1;
  reg [2:0] i_2;
  reg [5:0] i_3;
  reg [2:0] i_4;
  reg [2:0] i_5;
  reg [5:0] i_6;
  reg [2:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_061170 dut (
    .wb_pr_CCR_write(i_0),
    .wb_pr_op(i_1),
    .wb_pr_regC(i_2),
    .mem_wb_op(i_3),
    .mem_wb_regA(i_4),
    .mem_wb_regC(i_5),
    .ex_mem_op(i_6),
    .ex_mem_regA(i_7),
    .mem_wb_CCR_write(i_8),
    .ex_mem_CCR_write(i_9),
    .F3(out_dut[1:0])
  );
  autovcoder_061170__ref ref_i (
    .wb_pr_CCR_write(i_0),
    .wb_pr_op(i_1),
    .wb_pr_regC(i_2),
    .mem_wb_op(i_3),
    .mem_wb_regA(i_4),
    .mem_wb_regC(i_5),
    .ex_mem_op(i_6),
    .ex_mem_regA(i_7),
    .mem_wb_CCR_write(i_8),
    .ex_mem_CCR_write(i_9),
    .F3(out_ref[1:0])
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
    seed = 1092850768;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
