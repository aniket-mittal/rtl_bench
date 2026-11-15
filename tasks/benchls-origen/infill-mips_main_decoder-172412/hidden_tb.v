// Hidden tests: 5000 cycles of seeded random inputs (seed 1447753473); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
  reg clk;
  reg [5:0] i_0;
  reg [5:0] i_1;
  reg [21:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_172412 dut (
    .Opcode(i_0),
    .Function_opcode(i_1),
    .Alu_resultHigh(i_2),
    .Jrn(out_dut[16:16]),
    .RegDST(out_dut[15:15]),
    .ALUSrc(out_dut[14:14]),
    .MemorIOtoReg(out_dut[13:13]),
    .RegWrite(out_dut[12:12]),
    .MemRead(out_dut[11:11]),
    .MemWrite(out_dut[10:10]),
    .IORead(out_dut[9:9]),
    .IOWrite(out_dut[8:8]),
    .Branch(out_dut[7:7]),
    .nBranch(out_dut[6:6]),
    .Jmp(out_dut[5:5]),
    .Jal(out_dut[4:4]),
    .I_format(out_dut[3:3]),
    .Sftmd(out_dut[2:2]),
    .ALUOp(out_dut[1:0])
  );
  origen_172412__ref ref_i (
    .Opcode(i_0),
    .Function_opcode(i_1),
    .Alu_resultHigh(i_2),
    .Jrn(out_ref[16:16]),
    .RegDST(out_ref[15:15]),
    .ALUSrc(out_ref[14:14]),
    .MemorIOtoReg(out_ref[13:13]),
    .RegWrite(out_ref[12:12]),
    .MemRead(out_ref[11:11]),
    .MemWrite(out_ref[10:10]),
    .IORead(out_ref[9:9]),
    .IOWrite(out_ref[8:8]),
    .Branch(out_ref[7:7]),
    .nBranch(out_ref[6:6]),
    .Jmp(out_ref[5:5]),
    .Jal(out_ref[4:4]),
    .I_format(out_ref[3:3]),
    .Sftmd(out_ref[2:2]),
    .ALUOp(out_ref[1:0])
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
    seed = 1447753473;
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
