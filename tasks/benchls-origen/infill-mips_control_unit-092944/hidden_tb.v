// Hidden tests: 5000 cycles of seeded random inputs (seed 1290030566); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 15;
  reg clk;
  reg [5:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_092944 dut (
    .op(i_0),
    .Zero(i_1),
    .Sign(i_2),
    .ExtSel(out_dut[14:14]),
    .PCWre(out_dut[13:13]),
    .InsMemRW(out_dut[12:12]),
    .RegDst(out_dut[11:11]),
    .RegWre(out_dut[10:10]),
    .AluOp(out_dut[9:7]),
    .AluSrcA(out_dut[6:6]),
    .AluSrcB(out_dut[5:5]),
    .RD(out_dut[4:4]),
    .WR(out_dut[3:3]),
    .DBDataSrc(out_dut[2:2]),
    .PCSrc(out_dut[1:0])
  );
  origen_092944__ref ref_i (
    .op(i_0),
    .Zero(i_1),
    .Sign(i_2),
    .ExtSel(out_ref[14:14]),
    .PCWre(out_ref[13:13]),
    .InsMemRW(out_ref[12:12]),
    .RegDst(out_ref[11:11]),
    .RegWre(out_ref[10:10]),
    .AluOp(out_ref[9:7]),
    .AluSrcA(out_ref[6:6]),
    .AluSrcB(out_ref[5:5]),
    .RD(out_ref[4:4]),
    .WR(out_ref[3:3]),
    .DBDataSrc(out_ref[2:2]),
    .PCSrc(out_ref[1:0])
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
    seed = 1290030566;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
