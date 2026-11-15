// Hidden tests: 5000 cycles of seeded random inputs (seed 2332569781); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 164;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [1:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [5:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [1:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_08794 dut (
    .clk(clk),
    .instructionin(i_0),
    .datahazard(i_1),
    .DatabusAin(i_2),
    .DatabusBin(i_3),
    .immin(i_4),
    .PCplusin(i_5),
    .RegDstin(i_6),
    .RegWrin(i_7),
    .ALUSrc1in(i_8),
    .ALUSrc2in(i_9),
    .ALUFunin(i_10),
    .Signin(i_11),
    .MemWrin(i_12),
    .MemRdin(i_13),
    .MemtoRegin(i_14),
    .RegDstout(out_dut[163:162]),
    .RegWrout(out_dut[161:161]),
    .ALUSrc1out(out_dut[160:160]),
    .ALUSrc2out(out_dut[159:159]),
    .ALUFunout(out_dut[158:153]),
    .Signout(out_dut[152:152]),
    .MemWrout(out_dut[151:151]),
    .MemRdout(out_dut[150:150]),
    .MemtoRegout(out_dut[149:148]),
    .shamt(out_dut[147:143]),
    .Rsout(out_dut[142:138]),
    .Rtout(out_dut[137:133]),
    .Rdout(out_dut[132:128]),
    .DatabusAout(out_dut[127:96]),
    .DatabusBout(out_dut[95:64]),
    .immout(out_dut[63:32]),
    .PCplusout(out_dut[31:0])
  );
  mg_08794__ref ref_i (
    .clk(clk),
    .instructionin(i_0),
    .datahazard(i_1),
    .DatabusAin(i_2),
    .DatabusBin(i_3),
    .immin(i_4),
    .PCplusin(i_5),
    .RegDstin(i_6),
    .RegWrin(i_7),
    .ALUSrc1in(i_8),
    .ALUSrc2in(i_9),
    .ALUFunin(i_10),
    .Signin(i_11),
    .MemWrin(i_12),
    .MemRdin(i_13),
    .MemtoRegin(i_14),
    .RegDstout(out_ref[163:162]),
    .RegWrout(out_ref[161:161]),
    .ALUSrc1out(out_ref[160:160]),
    .ALUSrc2out(out_ref[159:159]),
    .ALUFunout(out_ref[158:153]),
    .Signout(out_ref[152:152]),
    .MemWrout(out_ref[151:151]),
    .MemRdout(out_ref[150:150]),
    .MemtoRegout(out_ref[149:148]),
    .shamt(out_ref[147:143]),
    .Rsout(out_ref[142:138]),
    .Rtout(out_ref[137:133]),
    .Rdout(out_ref[132:128]),
    .DatabusAout(out_ref[127:96]),
    .DatabusBout(out_ref[95:64]),
    .immout(out_ref[63:32]),
    .PCplusout(out_ref[31:0])
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
    seed = 2332569781;
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
