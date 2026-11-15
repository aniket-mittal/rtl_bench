// Hidden tests: 5000 cycles of seeded random inputs (seed 1895950575); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 109;
  reg clk;
  reg [0:0] i_0;
  reg [1:0] i_1;
  reg [4:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [4:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_041289 dut (
    .clk(clk),
    .rst(i_0),
    .WBE(i_1),
    .MemE(i_2),
    .PCAdderE(i_3),
    .zeroE(i_4),
    .ALUResultE(i_5),
    .ReadData2E(i_6),
    .RegDstE(i_7),
    .WBM(out_dut[108:107]),
    .MemWrite(out_dut[106:106]),
    .MemRead(out_dut[105:105]),
    .Branch(out_dut[104:104]),
    .PCAdderM(out_dut[103:72]),
    .zeroM(out_dut[71:71]),
    .ALUResultM(out_dut[70:39]),
    .ReadData2M(out_dut[38:7]),
    .RegDstM(out_dut[6:2]),
    .lbSel(out_dut[1:0])
  );
  origen_041289__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .WBE(i_1),
    .MemE(i_2),
    .PCAdderE(i_3),
    .zeroE(i_4),
    .ALUResultE(i_5),
    .ReadData2E(i_6),
    .RegDstE(i_7),
    .WBM(out_ref[108:107]),
    .MemWrite(out_ref[106:106]),
    .MemRead(out_ref[105:105]),
    .Branch(out_ref[104:104]),
    .PCAdderM(out_ref[103:72]),
    .zeroM(out_ref[71:71]),
    .ALUResultM(out_ref[70:39]),
    .ReadData2M(out_ref[38:7]),
    .RegDstM(out_ref[6:2]),
    .lbSel(out_ref[1:0])
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
    seed = 1895950575;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
