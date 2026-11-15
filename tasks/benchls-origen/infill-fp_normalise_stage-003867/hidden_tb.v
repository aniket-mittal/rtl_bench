// Hidden tests: 5000 cycles of seeded random inputs (seed 3277735718); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 168;
  reg clk;
  reg [35:0] i_0;
  reg [35:0] i_1;
  reg [31:0] i_2;
  reg [49:0] i_3;
  reg [1:0] i_4;
  reg [1:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [7:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_003867 dut (
    .clock(clk),
    .cout_Multiply(i_0),
    .zout_Multiply(i_1),
    .sout_Multiply(i_2),
    .productout_Multiply(i_3),
    .modeout_Multiply(i_4),
    .idle_Multiply(i_5),
    .operationout_Multiply(i_6),
    .NatLogFlagout_Multiply(i_7),
    .InsTag_Multiply(i_8),
    .cout_Normalise(out_dut[167:132]),
    .zout_Normalise(out_dut[131:96]),
    .sout_Normalise(out_dut[95:64]),
    .productout_Normalise(out_dut[63:14]),
    .modeout_Normalise(out_dut[13:12]),
    .idle_Normalise(out_dut[11:10]),
    .operationout_Normalise(out_dut[9:9]),
    .NatLogFlagout_Normalise(out_dut[8:8]),
    .InsTag_Normalise(out_dut[7:0])
  );
  origen_003867__ref ref_i (
    .clock(clk),
    .cout_Multiply(i_0),
    .zout_Multiply(i_1),
    .sout_Multiply(i_2),
    .productout_Multiply(i_3),
    .modeout_Multiply(i_4),
    .idle_Multiply(i_5),
    .operationout_Multiply(i_6),
    .NatLogFlagout_Multiply(i_7),
    .InsTag_Multiply(i_8),
    .cout_Normalise(out_ref[167:132]),
    .zout_Normalise(out_ref[131:96]),
    .sout_Normalise(out_ref[95:64]),
    .productout_Normalise(out_ref[63:14]),
    .modeout_Normalise(out_ref[13:12]),
    .idle_Normalise(out_ref[11:10]),
    .operationout_Normalise(out_ref[9:9]),
    .NatLogFlagout_Normalise(out_ref[8:8]),
    .InsTag_Normalise(out_ref[7:0])
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
    seed = 3277735718;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed)};
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
