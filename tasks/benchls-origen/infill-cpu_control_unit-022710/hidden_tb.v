// Hidden tests: 5000 cycles of seeded random inputs (seed 3178182580); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 12;
  reg clk;
  reg [5:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_022710 dut (
    .operationCode(i_0),
    .zero(i_1),
    .ALUSrcB(out_dut[11:11]),
    .ALUM2Reg(out_dut[10:10]),
    .RegWre(out_dut[9:9]),
    .InsMemRW(out_dut[8:8]),
    .DataMemRW(out_dut[7:7]),
    .ExtSel(out_dut[6:6]),
    .PCSrc(out_dut[5:5]),
    .RegOut(out_dut[4:4]),
    .PCWre(out_dut[3:3]),
    .ALUFlag(out_dut[2:0])
  );
  origen_022710__ref ref_i (
    .operationCode(i_0),
    .zero(i_1),
    .ALUSrcB(out_ref[11:11]),
    .ALUM2Reg(out_ref[10:10]),
    .RegWre(out_ref[9:9]),
    .InsMemRW(out_ref[8:8]),
    .DataMemRW(out_ref[7:7]),
    .ExtSel(out_ref[6:6]),
    .PCSrc(out_ref[5:5]),
    .RegOut(out_ref[4:4]),
    .PCWre(out_ref[3:3]),
    .ALUFlag(out_ref[2:0])
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
    seed = 3178182580;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
