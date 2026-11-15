// Hidden tests: 5000 cycles of seeded random inputs (seed 1063628358); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 133;
  reg clk;
  reg [0:0] i_0;
  reg [5:0] i_1;
  reg [5:0] i_2;
  reg [4:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [15:0] i_6;
  reg [25:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_027756 dut (
    .clk(clk),
    .stall(i_0),
    .OPin(i_1),
    .FUNCTin(i_2),
    .A1in(i_3),
    .A2in(i_4),
    .RDin(i_5),
    .IMMin(i_6),
    .ADin(i_7),
    .PCADD4in(i_8),
    .PCin(i_9),
    .OPout(out_dut[132:127]),
    .FUNCTout(out_dut[126:121]),
    .A1out(out_dut[120:116]),
    .A2out(out_dut[115:111]),
    .RDout(out_dut[110:106]),
    .IMMout(out_dut[105:90]),
    .ADout(out_dut[89:64]),
    .PCADD4out(out_dut[63:32]),
    .PCout(out_dut[31:0])
  );
  origen_027756__ref ref_i (
    .clk(clk),
    .stall(i_0),
    .OPin(i_1),
    .FUNCTin(i_2),
    .A1in(i_3),
    .A2in(i_4),
    .RDin(i_5),
    .IMMin(i_6),
    .ADin(i_7),
    .PCADD4in(i_8),
    .PCin(i_9),
    .OPout(out_ref[132:127]),
    .FUNCTout(out_ref[126:121]),
    .A1out(out_ref[120:116]),
    .A2out(out_ref[115:111]),
    .RDout(out_ref[110:106]),
    .IMMout(out_ref[105:90]),
    .ADout(out_ref[89:64]),
    .PCADD4out(out_ref[63:32]),
    .PCout(out_ref[31:0])
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
    seed = 1063628358;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
