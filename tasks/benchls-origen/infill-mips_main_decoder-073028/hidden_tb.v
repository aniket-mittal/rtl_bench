// Hidden tests: 5000 cycles of seeded random inputs (seed 2120028720); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 20;
  reg clk;
  reg [5:0] i_0;
  reg [5:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_073028 dut (
    .Op(i_0),
    .Funct(i_1),
    .Equal(i_2),
    .EQZ(i_3),
    .LTZ(i_4),
    .NPCOp(out_dut[19:18]),
    .RegWrite(out_dut[17:17]),
    .ALUOp(out_dut[16:13]),
    .MemWrite(out_dut[12:12]),
    .OpWidth(out_dut[11:10]),
    .LoadSigned(out_dut[9:9]),
    .ExtOp(out_dut[8:7]),
    .PCSrc(out_dut[6:5]),
    .RegDst(out_dut[4:3]),
    .RegSrc(out_dut[2:1]),
    .ALUSrc(out_dut[0:0])
  );
  origen_073028__ref ref_i (
    .Op(i_0),
    .Funct(i_1),
    .Equal(i_2),
    .EQZ(i_3),
    .LTZ(i_4),
    .NPCOp(out_ref[19:18]),
    .RegWrite(out_ref[17:17]),
    .ALUOp(out_ref[16:13]),
    .MemWrite(out_ref[12:12]),
    .OpWidth(out_ref[11:10]),
    .LoadSigned(out_ref[9:9]),
    .ExtOp(out_ref[8:7]),
    .PCSrc(out_ref[6:5]),
    .RegDst(out_ref[4:3]),
    .RegSrc(out_ref[2:1]),
    .ALUSrc(out_ref[0:0])
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
    seed = 2120028720;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
