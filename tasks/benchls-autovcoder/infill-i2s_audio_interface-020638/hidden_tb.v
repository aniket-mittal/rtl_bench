// Hidden tests: 5000 cycles of seeded random inputs (seed 3941844933); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 70;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_020638 dut (
    .xclk_i(clk),
    .reset_n(i_0),
    .right_i(i_1),
    .left_i(i_2),
    .adcdat_i(i_3),
    .right_o(out_dut[69:38]),
    .left_o(out_dut[37:6]),
    .ready_o(out_dut[5:5]),
    .xck_o(out_dut[4:4]),
    .bclk_o(out_dut[3:3]),
    .daclrck_o(out_dut[2:2]),
    .dacdat_o(out_dut[1:1]),
    .adclrck_o(out_dut[0:0])
  );
  autovcoder_020638__ref ref_i (
    .xclk_i(clk),
    .reset_n(i_0),
    .right_i(i_1),
    .left_i(i_2),
    .adcdat_i(i_3),
    .right_o(out_ref[69:38]),
    .left_o(out_ref[37:6]),
    .ready_o(out_ref[5:5]),
    .xck_o(out_ref[4:4]),
    .bclk_o(out_ref[3:3]),
    .daclrck_o(out_ref[2:2]),
    .dacdat_o(out_ref[1:1]),
    .adclrck_o(out_ref[0:0])
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
    seed = 3941844933;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
