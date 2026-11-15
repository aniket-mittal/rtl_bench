// Hidden tests: 5000 cycles of seeded random inputs (seed 1771815432); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 259;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [4:0] i_6;
  reg [4:0] i_7;
  reg [4:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [4:0] i_16;
  reg [0:0] i_17;
  reg [4:0] i_18;
  reg [0:0] i_19;
  reg [4:0] i_20;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_032515 dut (
    .clk(clk),
    .rst(i_0),
    .stallE(i_1),
    .flushE(i_2),
    .pcD(i_3),
    .rd1D(i_4),
    .rd2D(i_5),
    .rsD(i_6),
    .rtD(i_7),
    .rdD(i_8),
    .immD(i_9),
    .pc_plus4D(i_10),
    .instrD(i_11),
    .pc_branchD(i_12),
    .pred_takeD(i_13),
    .branchD(i_14),
    .jump_conflictD(i_15),
    .saD(i_16),
    .is_in_delayslot_iD(i_17),
    .alu_controlD(i_18),
    .jumpD(i_19),
    .branch_judge_controlD(i_20),
    .pcE(out_dut[258:227]),
    .rd1E(out_dut[226:195]),
    .rd2E(out_dut[194:163]),
    .rsE(out_dut[162:158]),
    .rtE(out_dut[157:153]),
    .rdE(out_dut[152:148]),
    .immE(out_dut[147:116]),
    .pc_plus4E(out_dut[115:84]),
    .instrE(out_dut[83:52]),
    .pc_branchE(out_dut[51:20]),
    .pred_takeE(out_dut[19:19]),
    .branchE(out_dut[18:18]),
    .jump_conflictE(out_dut[17:17]),
    .saE(out_dut[16:12]),
    .is_in_delayslot_iE(out_dut[11:11]),
    .alu_controlE(out_dut[10:6]),
    .jumpE(out_dut[5:5]),
    .branch_judge_controlE(out_dut[4:0])
  );
  autovcoder_032515__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .stallE(i_1),
    .flushE(i_2),
    .pcD(i_3),
    .rd1D(i_4),
    .rd2D(i_5),
    .rsD(i_6),
    .rtD(i_7),
    .rdD(i_8),
    .immD(i_9),
    .pc_plus4D(i_10),
    .instrD(i_11),
    .pc_branchD(i_12),
    .pred_takeD(i_13),
    .branchD(i_14),
    .jump_conflictD(i_15),
    .saD(i_16),
    .is_in_delayslot_iD(i_17),
    .alu_controlD(i_18),
    .jumpD(i_19),
    .branch_judge_controlD(i_20),
    .pcE(out_ref[258:227]),
    .rd1E(out_ref[226:195]),
    .rd2E(out_ref[194:163]),
    .rsE(out_ref[162:158]),
    .rtE(out_ref[157:153]),
    .rdE(out_ref[152:148]),
    .immE(out_ref[147:116]),
    .pc_plus4E(out_ref[115:84]),
    .instrE(out_ref[83:52]),
    .pc_branchE(out_ref[51:20]),
    .pred_takeE(out_ref[19:19]),
    .branchE(out_ref[18:18]),
    .jump_conflictE(out_ref[17:17]),
    .saE(out_ref[16:12]),
    .is_in_delayslot_iE(out_ref[11:11]),
    .alu_controlE(out_ref[10:6]),
    .jumpE(out_ref[5:5]),
    .branch_judge_controlE(out_ref[4:0])
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
    seed = 1771815432;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
