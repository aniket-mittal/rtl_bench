// Hidden tests: 5000 cycles of seeded random inputs (seed 2493666112); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 2;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [3:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_005755 dut (
    .dpram_wclk(clk),
    .mc1_ripmode(i_0),
    .I0(i_1),
    .I1(i_2),
    .I2(i_3),
    .I3(i_4),
    .dpram_mode(i_5),
    .dpram_di(i_6),
    .dpram_we(i_7),
    .dpram_waddr(i_8),
    .lut4_o(out_dut[1:1]),
    .lut00_n(out_dut[0:0])
  );
  autovcoder_005755__ref ref_i (
    .dpram_wclk(clk),
    .mc1_ripmode(i_0),
    .I0(i_1),
    .I1(i_2),
    .I2(i_3),
    .I3(i_4),
    .dpram_mode(i_5),
    .dpram_di(i_6),
    .dpram_we(i_7),
    .dpram_waddr(i_8),
    .lut4_o(out_ref[1:1]),
    .lut00_n(out_ref[0:0])
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
    seed = 2493666112;
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
