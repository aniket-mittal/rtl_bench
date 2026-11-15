// Hidden tests: 5000 cycles of seeded random inputs (seed 168404863); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 12;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [1:0] i_2;
  reg [1:0] i_3;
  reg [1:0] i_4;
  reg [1:0] i_5;
  reg [1:0] i_6;
  reg [1:0] i_7;
  reg [1:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_044144 dut (
    .clock(clk),
    .reset(i_0),
    .video_on(i_1),
    .world_pixel(i_2),
    .icon(i_3),
    .icon2(i_4),
    .icon4(i_5),
    .icon5(i_6),
    .icon6(i_7),
    .icon7(i_8),
    .red(out_dut[11:8]),
    .green(out_dut[7:4]),
    .blue(out_dut[3:0])
  );
  origen_044144__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .video_on(i_1),
    .world_pixel(i_2),
    .icon(i_3),
    .icon2(i_4),
    .icon4(i_5),
    .icon5(i_6),
    .icon6(i_7),
    .icon7(i_8),
    .red(out_ref[11:8]),
    .green(out_ref[7:4]),
    .blue(out_ref[3:0])
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
    seed = 168404863;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
