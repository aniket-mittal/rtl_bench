// Hidden tests: 5000 cycles of seeded random inputs (seed 588403805); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 135;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [1:0] i_4;
  reg [1:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_169579 dut (
    .clock(clk),
    .cout_Multiply(i_0),
    .zout_Multiply(i_1),
    .sout_Multiply(i_2),
    .productout_Multiply(i_3),
    .modeout_Multiply(i_4),
    .operationout_Multiply(i_5),
    .NatLogFlagout_Multiply(i_6),
    .InsTag_Multiply(i_7),
    .idle_Multiply(i_8),
    .idle_NormaliseProd(out_dut[134:134]),
    .cout_NormaliseProd(out_dut[133:102]),
    .zout_NormaliseProd(out_dut[101:70]),
    .sout_NormaliseProd(out_dut[69:38]),
    .productout_NormaliseProd(out_dut[37:6]),
    .modeout_NormaliseProd(out_dut[5:4]),
    .operationout_NormaliseProd(out_dut[3:2]),
    .NatLogFlagout_NormaliseProd(out_dut[1:1]),
    .InsTag_NormaliseProd(out_dut[0:0])
  );
  origen_169579__ref ref_i (
    .clock(clk),
    .cout_Multiply(i_0),
    .zout_Multiply(i_1),
    .sout_Multiply(i_2),
    .productout_Multiply(i_3),
    .modeout_Multiply(i_4),
    .operationout_Multiply(i_5),
    .NatLogFlagout_Multiply(i_6),
    .InsTag_Multiply(i_7),
    .idle_Multiply(i_8),
    .idle_NormaliseProd(out_ref[134:134]),
    .cout_NormaliseProd(out_ref[133:102]),
    .zout_NormaliseProd(out_ref[101:70]),
    .sout_NormaliseProd(out_ref[69:38]),
    .productout_NormaliseProd(out_ref[37:6]),
    .modeout_NormaliseProd(out_ref[5:4]),
    .operationout_NormaliseProd(out_ref[3:2]),
    .NatLogFlagout_NormaliseProd(out_ref[1:1]),
    .InsTag_NormaliseProd(out_ref[0:0])
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
    seed = 588403805;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
