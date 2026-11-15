// Hidden tests: 5000 cycles of seeded random inputs (seed 347526458); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 146;
  reg clk;
  reg [0:0] i_0;
  reg [27:0] i_1;
  reg [27:0] i_2;
  reg [15:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_180420 dut (
    .CLK(clk),
    .RST(i_0),
    .DATA_IN_RE(i_1),
    .DATA_IN_IM(i_2),
    .DATA_IN_INDEX(i_3),
    .DATA_IN_VALID(i_4),
    .DATA_OUT_RE(out_dut[145:118]),
    .DATA_OUT_IM(out_dut[117:90]),
    .DATA_OUT_INDEX(out_dut[89:74]),
    .DATA_OUT_VALID(out_dut[73:73]),
    .DATA_OUT_RE_HER(out_dut[72:45]),
    .DATA_OUT_IM_HER(out_dut[44:17]),
    .DATA_OUT_INDEX_HER(out_dut[16:1]),
    .DATA_OUT_VALID_HER(out_dut[0:0])
  );
  origen_180420__ref ref_i (
    .CLK(clk),
    .RST(i_0),
    .DATA_IN_RE(i_1),
    .DATA_IN_IM(i_2),
    .DATA_IN_INDEX(i_3),
    .DATA_IN_VALID(i_4),
    .DATA_OUT_RE(out_ref[145:118]),
    .DATA_OUT_IM(out_ref[117:90]),
    .DATA_OUT_INDEX(out_ref[89:74]),
    .DATA_OUT_VALID(out_ref[73:73]),
    .DATA_OUT_RE_HER(out_ref[72:45]),
    .DATA_OUT_IM_HER(out_ref[44:17]),
    .DATA_OUT_INDEX_HER(out_ref[16:1]),
    .DATA_OUT_VALID_HER(out_ref[0:0])
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
    seed = 347526458;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
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
