// Hidden tests: 5000 cycles of seeded random inputs (seed 2738576647); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [0:0] i_0;
  reg [3:0] i_1;
  reg [9:0] i_2;
  reg [9:0] i_3;
  reg [9:0] i_4;
  reg [9:0] i_5;
  reg [9:0] i_6;
  reg [9:0] i_7;
  reg [9:0] i_8;
  reg [9:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_165531 dut (
    .VSync(clk),
    .OriginalClk(i_0),
    .State(i_1),
    .BirdXPosition(i_2),
    .BirdYPosition(i_3),
    .PipeXPosition(i_4),
    .PipeYPosition(i_5),
    .SpeedUpXPosition(i_6),
    .SpeedUpYPosition(i_7),
    .HealthXPosition(i_8),
    .HealthYPosition(i_9),
    .RequestSpeedUp(out_dut[13:13]),
    .RequestHealth(out_dut[12:12]),
    .RequestDie(out_dut[11:11]),
    .Score(out_dut[10:3]),
    .Health(out_dut[2:0])
  );
  origen_165531__ref ref_i (
    .VSync(clk),
    .OriginalClk(i_0),
    .State(i_1),
    .BirdXPosition(i_2),
    .BirdYPosition(i_3),
    .PipeXPosition(i_4),
    .PipeYPosition(i_5),
    .SpeedUpXPosition(i_6),
    .SpeedUpYPosition(i_7),
    .HealthXPosition(i_8),
    .HealthYPosition(i_9),
    .RequestSpeedUp(out_ref[13:13]),
    .RequestHealth(out_ref[12:12]),
    .RequestDie(out_ref[11:11]),
    .Score(out_ref[10:3]),
    .Health(out_ref[2:0])
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
    seed = 2738576647;
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
