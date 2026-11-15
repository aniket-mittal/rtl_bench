// Hidden tests: 5000 cycles of seeded random inputs (seed 3032252862); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 105;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [3:0] i_10;
  reg [4:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [31:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_212139 dut (
    .clk(clk),
    .rst(i_0),
    .DX_PC(i_1),
    .DX_Branch(i_2),
    .DX_MemWrite(i_3),
    .DX_MemToReg(i_4),
    .DX_RegWrite(i_5),
    .lhWrite(i_6),
    .lhRead(i_7),
    .mflo(i_8),
    .ALUSrc(i_9),
    .ALUCtr(i_10),
    .DX_RD(i_11),
    .A(i_12),
    .B(i_13),
    .Imm(i_14),
    .BAddr(out_dut[104:73]),
    .XF_Branch(out_dut[72:72]),
    .XM_MemWrite(out_dut[71:71]),
    .XM_MemToReg(out_dut[70:70]),
    .XM_RegWrite(out_dut[69:69]),
    .XM_RD(out_dut[68:64]),
    .XM_B(out_dut[63:32]),
    .ALUout(out_dut[31:0])
  );
  origen_212139__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .DX_PC(i_1),
    .DX_Branch(i_2),
    .DX_MemWrite(i_3),
    .DX_MemToReg(i_4),
    .DX_RegWrite(i_5),
    .lhWrite(i_6),
    .lhRead(i_7),
    .mflo(i_8),
    .ALUSrc(i_9),
    .ALUCtr(i_10),
    .DX_RD(i_11),
    .A(i_12),
    .B(i_13),
    .Imm(i_14),
    .BAddr(out_ref[104:73]),
    .XF_Branch(out_ref[72:72]),
    .XM_MemWrite(out_ref[71:71]),
    .XM_MemToReg(out_ref[70:70]),
    .XM_RegWrite(out_ref[69:69]),
    .XM_RD(out_ref[68:64]),
    .XM_B(out_ref[63:32]),
    .ALUout(out_ref[31:0])
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
    seed = 3032252862;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
