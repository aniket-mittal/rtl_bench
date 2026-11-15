// Hidden tests: 5000 cycles of seeded random inputs (seed 727396252); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 152;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [3:0] i_6;
  reg [3:0] i_7;
  reg [3:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [1:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_116070 dut (
    .clk(clk),
    .rst(i_0),
    .A(i_1),
    .B(i_2),
    .C(i_3),
    .ext(i_4),
    .WA3(i_5),
    .ALUControl(i_6),
    .flags(i_7),
    .Cond(i_8),
    .RegWrite(i_9),
    .PlusOne(i_10),
    .Branch(i_11),
    .PCSource(i_12),
    .ALUSrc(i_13),
    .MemtoReg(i_14),
    .FlagW(i_15),
    .AE(out_dut[151:120]),
    .BE(out_dut[119:88]),
    .CE(out_dut[87:56]),
    .extE(out_dut[55:24]),
    .WA3E(out_dut[23:20]),
    .ALUControlE(out_dut[19:16]),
    .flagsE(out_dut[15:12]),
    .CondE(out_dut[11:8]),
    .RegWriteE(out_dut[7:7]),
    .PlusOneE(out_dut[6:6]),
    .BranchE(out_dut[5:5]),
    .PCSourceE(out_dut[4:4]),
    .ALUSrcE(out_dut[3:3]),
    .MemtoRegE(out_dut[2:2]),
    .FlagWE(out_dut[1:0])
  );
  origen_116070__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .A(i_1),
    .B(i_2),
    .C(i_3),
    .ext(i_4),
    .WA3(i_5),
    .ALUControl(i_6),
    .flags(i_7),
    .Cond(i_8),
    .RegWrite(i_9),
    .PlusOne(i_10),
    .Branch(i_11),
    .PCSource(i_12),
    .ALUSrc(i_13),
    .MemtoReg(i_14),
    .FlagW(i_15),
    .AE(out_ref[151:120]),
    .BE(out_ref[119:88]),
    .CE(out_ref[87:56]),
    .extE(out_ref[55:24]),
    .WA3E(out_ref[23:20]),
    .ALUControlE(out_ref[19:16]),
    .flagsE(out_ref[15:12]),
    .CondE(out_ref[11:8]),
    .RegWriteE(out_ref[7:7]),
    .PlusOneE(out_ref[6:6]),
    .BranchE(out_ref[5:5]),
    .PCSourceE(out_ref[4:4]),
    .ALUSrcE(out_ref[3:3]),
    .MemtoRegE(out_ref[2:2]),
    .FlagWE(out_ref[1:0])
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
    seed = 727396252;
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
      i_15 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
