// Hidden tests: 5000 cycles of seeded random inputs (seed 3407734992); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_189580 dut (
    .clk(clk),
    .Sensor_Sync(i_0),
    .WR(i_1),
    .Prog_Sync(i_2),
    .Reset_Sync(i_3),
    .expired(i_4),
    .WR_Reset(out_dut[10:10]),
    .LEDs(out_dut[9:3]),
    .interval(out_dut[2:1]),
    .start_timer(out_dut[0:0])
  );
  origen_189580__ref ref_i (
    .clk(clk),
    .Sensor_Sync(i_0),
    .WR(i_1),
    .Prog_Sync(i_2),
    .Reset_Sync(i_3),
    .expired(i_4),
    .WR_Reset(out_ref[10:10]),
    .LEDs(out_ref[9:3]),
    .interval(out_ref[2:1]),
    .start_timer(out_ref[0:0])
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
    seed = 3407734992;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
