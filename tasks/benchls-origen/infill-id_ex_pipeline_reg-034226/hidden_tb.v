// Hidden tests: 5000 cycles of seeded random inputs (seed 1591109169); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 120;
  reg clk;
  reg [0:0] i_0;
  reg [1:0] i_1;
  reg [1:0] i_2;
  reg [4:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [4:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_034226 dut (
    .clk(clk),
    .rst(i_0),
    .WB(i_1),
    .M(i_2),
    .EX(i_3),
    .readData1(i_4),
    .readData2(i_5),
    .S_EXTEND_out_b(i_6),
    .rs(i_7),
    .rt(i_8),
    .rd(i_9),
    .EX_WB(out_dut[119:118]),
    .EX_M(out_dut[117:116]),
    .EX_EX(out_dut[115:111]),
    .EX_SRC_A(out_dut[110:79]),
    .EX_SRC_B(out_dut[78:47]),
    .EX_SE(out_dut[46:15]),
    .EX_rs(out_dut[14:10]),
    .EX_rt(out_dut[9:5]),
    .EX_rd(out_dut[4:0])
  );
  origen_034226__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .WB(i_1),
    .M(i_2),
    .EX(i_3),
    .readData1(i_4),
    .readData2(i_5),
    .S_EXTEND_out_b(i_6),
    .rs(i_7),
    .rt(i_8),
    .rd(i_9),
    .EX_WB(out_ref[119:118]),
    .EX_M(out_ref[117:116]),
    .EX_EX(out_ref[115:111]),
    .EX_SRC_A(out_ref[110:79]),
    .EX_SRC_B(out_ref[78:47]),
    .EX_SE(out_ref[46:15]),
    .EX_rs(out_ref[14:10]),
    .EX_rt(out_ref[9:5]),
    .EX_rd(out_ref[4:0])
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
    seed = 1591109169;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
