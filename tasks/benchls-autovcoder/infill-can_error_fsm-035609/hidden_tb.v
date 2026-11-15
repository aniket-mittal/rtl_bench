// Hidden tests: 5000 cycles of seeded random inputs (seed 1375026902); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 6;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_035609 dut (
    .clock(clk),
    .reset(i_0),
    .rec_lt96(i_1),
    .rec_ge96(i_2),
    .rec_ge128(i_3),
    .tec_lt96(i_4),
    .tec_ge96(i_5),
    .tec_ge128(i_6),
    .tec_ge256(i_7),
    .erb_eq128(i_8),
    .resetcount(out_dut[5:5]),
    .erroractive(out_dut[4:4]),
    .errorpassive(out_dut[3:3]),
    .busoff(out_dut[2:2]),
    .warnsig(out_dut[1:1]),
    .irqsig(out_dut[0:0])
  );
  autovcoder_035609__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .rec_lt96(i_1),
    .rec_ge96(i_2),
    .rec_ge128(i_3),
    .tec_lt96(i_4),
    .tec_ge96(i_5),
    .tec_ge128(i_6),
    .tec_ge256(i_7),
    .erb_eq128(i_8),
    .resetcount(out_ref[5:5]),
    .erroractive(out_ref[4:4]),
    .errorpassive(out_ref[3:3]),
    .busoff(out_ref[2:2]),
    .warnsig(out_ref[1:1]),
    .irqsig(out_ref[0:0])
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
    seed = 1375026902;
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
