// Hidden tests: 5000 cycles of seeded random inputs (seed 3438151039); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [5:0] i_0;
  reg [5:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_151687 dut (
    .op(i_0),
    .func(i_1),
    .z(i_2),
    .wreg(out_dut[13:13]),
    .regrt(out_dut[12:12]),
    .jal(out_dut[11:11]),
    .m2reg(out_dut[10:10]),
    .shift(out_dut[9:9]),
    .aluimm(out_dut[8:8]),
    .sext(out_dut[7:7]),
    .wmem(out_dut[6:6]),
    .aluc(out_dut[5:2]),
    .pcsource(out_dut[1:0])
  );
  origen_151687__ref ref_i (
    .op(i_0),
    .func(i_1),
    .z(i_2),
    .wreg(out_ref[13:13]),
    .regrt(out_ref[12:12]),
    .jal(out_ref[11:11]),
    .m2reg(out_ref[10:10]),
    .shift(out_ref[9:9]),
    .aluimm(out_ref[8:8]),
    .sext(out_ref[7:7]),
    .wmem(out_ref[6:6]),
    .aluc(out_ref[5:2]),
    .pcsource(out_ref[1:0])
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
    seed = 3438151039;
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
