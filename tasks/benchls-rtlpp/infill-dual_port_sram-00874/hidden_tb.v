// Hidden tests: 5000 cycles of seeded random inputs (seed 2213439008); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 41;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [7:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [18:0] i_6;
  reg [2:0] i_7;
  reg [0:0] i_8;
  reg [2:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [7:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [7:0] i_15;
  reg [18:0] i_16;
  reg [0:0] i_17;
  reg [1:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [1:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00874 dut (
    .CLKA(i_0),
    .CENA(i_1),
    .AA(i_2),
    .CLKB(i_3),
    .CENB(i_4),
    .AB(i_5),
    .DB(i_6),
    .EMAA(i_7),
    .EMASA(i_8),
    .EMAB(i_9),
    .TENA(i_10),
    .TCENA(i_11),
    .TAA(i_12),
    .TENB(i_13),
    .TCENB(i_14),
    .TAB(i_15),
    .TDB(i_16),
    .RET1N(i_17),
    .SIA(i_18),
    .SEA(i_19),
    .DFTRAMBYP(i_20),
    .SIB(i_21),
    .SEB(i_22),
    .COLLDISN(i_23),
    .CENYA(out_dut[40:40]),
    .AYA(out_dut[39:32]),
    .CENYB(out_dut[31:31]),
    .AYB(out_dut[30:23]),
    .QA(out_dut[22:4]),
    .SOA(out_dut[3:2]),
    .SOB(out_dut[1:0])
  );
  rtlpp_00874__ref ref_i (
    .CLKA(i_0),
    .CENA(i_1),
    .AA(i_2),
    .CLKB(i_3),
    .CENB(i_4),
    .AB(i_5),
    .DB(i_6),
    .EMAA(i_7),
    .EMASA(i_8),
    .EMAB(i_9),
    .TENA(i_10),
    .TCENA(i_11),
    .TAA(i_12),
    .TENB(i_13),
    .TCENB(i_14),
    .TAB(i_15),
    .TDB(i_16),
    .RET1N(i_17),
    .SIA(i_18),
    .SEA(i_19),
    .DFTRAMBYP(i_20),
    .SIB(i_21),
    .SEB(i_22),
    .COLLDISN(i_23),
    .CENYA(out_ref[40:40]),
    .AYA(out_ref[39:32]),
    .CENYB(out_ref[31:31]),
    .AYB(out_ref[30:23]),
    .QA(out_ref[22:4]),
    .SOA(out_ref[3:2]),
    .SOB(out_ref[1:0])
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
    seed = 2213439008;
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
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
