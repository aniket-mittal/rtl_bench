// Hidden tests: 5000 cycles of seeded random inputs (seed 456534314); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
  reg clk;
  reg [1:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_086760 dut (
    .Op(i_0),
    .Funct5(i_1),
    .Funct4(i_2),
    .Funct1(i_3),
    .Branch(out_dut[10:10]),
    .RegW(out_dut[9:9]),
    .MemW(out_dut[8:8]),
    .MemtoReg(out_dut[7:7]),
    .ALUSrc(out_dut[6:6]),
    .ALUOp(out_dut[5:5]),
    .link(out_dut[4:4]),
    .ImmSrc(out_dut[3:2]),
    .RegSrc(out_dut[1:0])
  );
  origen_086760__ref ref_i (
    .Op(i_0),
    .Funct5(i_1),
    .Funct4(i_2),
    .Funct1(i_3),
    .Branch(out_ref[10:10]),
    .RegW(out_ref[9:9]),
    .MemW(out_ref[8:8]),
    .MemtoReg(out_ref[7:7]),
    .ALUSrc(out_ref[6:6]),
    .ALUOp(out_ref[5:5]),
    .link(out_ref[4:4]),
    .ImmSrc(out_ref[3:2]),
    .RegSrc(out_ref[1:0])
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
    seed = 456534314;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
