// Hidden tests: 5000 cycles of seeded random inputs (seed 4171838773); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 203;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [3:0] i_13;
  reg [4:0] i_14;
  reg [4:0] i_15;
  reg [31:0] i_16;
  reg [31:0] i_17;
  reg [4:0] i_18;
  reg [15:0] i_19;
  reg [25:0] i_20;
  reg [4:0] i_21;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_010967 dut (
    .clk(clk),
    .rst(i_0),
    .en(i_1),
    .IRin(i_2),
    .PCin(i_3),
    .JRin(i_4),
    .JMPin(i_5),
    .LBUin(i_6),
    .BEQin(i_7),
    .BNEin(i_8),
    .BGEZin(i_9),
    .MemToRegin(i_10),
    .MemWritein(i_11),
    .RegWritein(i_12),
    .AluOpin(i_13),
    .R1_numin(i_14),
    .R2_numin(i_15),
    .R1in(i_16),
    .R2in(i_17),
    .W_numin(i_18),
    .imm16in(i_19),
    .imm26in(i_20),
    .shamtin(i_21),
    .IRout(out_dut[202:171]),
    .PCout(out_dut[170:139]),
    .JRout(out_dut[138:138]),
    .JMPout(out_dut[137:137]),
    .LBUout(out_dut[136:136]),
    .BEQout(out_dut[135:135]),
    .BNEout(out_dut[134:134]),
    .BGEZout(out_dut[133:133]),
    .MemToRegout(out_dut[132:132]),
    .MemWriteout(out_dut[131:131]),
    .RegWriteout(out_dut[130:130]),
    .AluOpout(out_dut[129:126]),
    .R1_numout(out_dut[125:121]),
    .R2_numout(out_dut[120:116]),
    .R1out(out_dut[115:84]),
    .R2out(out_dut[83:52]),
    .W_numout(out_dut[51:47]),
    .imm16out(out_dut[46:31]),
    .imm26out(out_dut[30:5]),
    .shamtout(out_dut[4:0])
  );
  origen_010967__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .en(i_1),
    .IRin(i_2),
    .PCin(i_3),
    .JRin(i_4),
    .JMPin(i_5),
    .LBUin(i_6),
    .BEQin(i_7),
    .BNEin(i_8),
    .BGEZin(i_9),
    .MemToRegin(i_10),
    .MemWritein(i_11),
    .RegWritein(i_12),
    .AluOpin(i_13),
    .R1_numin(i_14),
    .R2_numin(i_15),
    .R1in(i_16),
    .R2in(i_17),
    .W_numin(i_18),
    .imm16in(i_19),
    .imm26in(i_20),
    .shamtin(i_21),
    .IRout(out_ref[202:171]),
    .PCout(out_ref[170:139]),
    .JRout(out_ref[138:138]),
    .JMPout(out_ref[137:137]),
    .LBUout(out_ref[136:136]),
    .BEQout(out_ref[135:135]),
    .BNEout(out_ref[134:134]),
    .BGEZout(out_ref[133:133]),
    .MemToRegout(out_ref[132:132]),
    .MemWriteout(out_ref[131:131]),
    .RegWriteout(out_ref[130:130]),
    .AluOpout(out_ref[129:126]),
    .R1_numout(out_ref[125:121]),
    .R2_numout(out_ref[120:116]),
    .R1out(out_ref[115:84]),
    .R2out(out_ref[83:52]),
    .W_numout(out_ref[51:47]),
    .imm16out(out_ref[46:31]),
    .imm26out(out_ref[30:5]),
    .shamtout(out_ref[4:0])
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
    seed = 4171838773;
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
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
