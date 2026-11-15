// Hidden tests: 5000 cycles of seeded random inputs (seed 4261719641); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 7;
  reg clk;
  reg [0:0] i_0;
  reg [4:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_203191 dut (
    .clock(clk),
    .fifo_comb_empty(i_0),
    .fifo_comb_hitmap(i_1),
    .fifo_comb_ee(i_2),
    .fifo_comb_valid(i_3),
    .fifo_comb45_hfull(i_4),
    .reset(i_5),
    .hitmux_sel(out_dut[6:4]),
    .fifo_comb45_we(out_dut[3:3]),
    .fifo_comb_re(out_dut[2:2]),
    .is_45(out_dut[1:1]),
    .invalid_data(out_dut[0:0])
  );
  origen_203191__ref ref_i (
    .clock(clk),
    .fifo_comb_empty(i_0),
    .fifo_comb_hitmap(i_1),
    .fifo_comb_ee(i_2),
    .fifo_comb_valid(i_3),
    .fifo_comb45_hfull(i_4),
    .reset(i_5),
    .hitmux_sel(out_ref[6:4]),
    .fifo_comb45_we(out_ref[3:3]),
    .fifo_comb_re(out_ref[2:2]),
    .is_45(out_ref[1:1]),
    .invalid_data(out_ref[0:0])
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
    seed = 4261719641;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
