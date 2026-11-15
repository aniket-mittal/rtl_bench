// Hidden tests: 5000 cycles of seeded random inputs (seed 79123232); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 130;
  reg clk;
  reg [0:0] i_0;
  reg [1:0] i_1;
  reg [63:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [63:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_086456 dut (
    .clk(clk),
    .reset(i_0),
    .addr(i_1),
    .d_in(i_2),
    .nicEN(i_3),
    .nicWrEn(i_4),
    .net_ro(i_5),
    .net_polarity(i_6),
    .net_si(i_7),
    .net_di(i_8),
    .d_out(out_dut[129:66]),
    .net_so(out_dut[65:65]),
    .net_do(out_dut[64:1]),
    .net_ri(out_dut[0:0])
  );
  autovcoder_086456__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .addr(i_1),
    .d_in(i_2),
    .nicEN(i_3),
    .nicWrEn(i_4),
    .net_ro(i_5),
    .net_polarity(i_6),
    .net_si(i_7),
    .net_di(i_8),
    .d_out(out_ref[129:66]),
    .net_so(out_ref[65:65]),
    .net_do(out_ref[64:1]),
    .net_ri(out_ref[0:0])
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
    seed = 79123232;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
