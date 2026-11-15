// Hidden tests: 5000 cycles of seeded random inputs (seed 4058305213); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 22;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [2:0] i_2;
  reg [11:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01501 dut (
    .clk(clk),
    .reset(i_0),
    .EN(i_1),
    .IR(i_2),
    .AC(i_3),
    .LINK(i_4),
    .ckFetch(i_5),
    .ck1(i_6),
    .ck2(i_7),
    .stbFetchA(i_8),
    .stbFetchB(i_9),
    .stb1(i_10),
    .irqRq(i_11),
    .anyDone(i_12),
    .done(out_dut[21:21]),
    .rot2ac(out_dut[20:20]),
    .ac_ck(out_dut[19:19]),
    .clr(out_dut[18:18]),
    .ACclr(out_dut[17:17]),
    .linkclr(out_dut[16:16]),
    .linkcml(out_dut[15:15]),
    .link_ck(out_dut[14:14]),
    .pc_ck(out_dut[13:13]),
    .ACGTF(out_dut[12:1]),
    .irqOverride(out_dut[0:0])
  );
  rtlpp_01501__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .EN(i_1),
    .IR(i_2),
    .AC(i_3),
    .LINK(i_4),
    .ckFetch(i_5),
    .ck1(i_6),
    .ck2(i_7),
    .stbFetchA(i_8),
    .stbFetchB(i_9),
    .stb1(i_10),
    .irqRq(i_11),
    .anyDone(i_12),
    .done(out_ref[21:21]),
    .rot2ac(out_ref[20:20]),
    .ac_ck(out_ref[19:19]),
    .clr(out_ref[18:18]),
    .ACclr(out_ref[17:17]),
    .linkclr(out_ref[16:16]),
    .linkcml(out_ref[15:15]),
    .link_ck(out_ref[14:14]),
    .pc_ck(out_ref[13:13]),
    .ACGTF(out_ref[12:1]),
    .irqOverride(out_ref[0:0])
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
    seed = 4058305213;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
