// Hidden tests: 5000 cycles of seeded random inputs (seed 3923339648); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 8;
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
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_076433 dut (
    .A1(i_0),
    .B1(i_1),
    .C1(i_2),
    .D1(i_3),
    .F1(i_4),
    .H1(i_5),
    .J1(i_6),
    .K1(i_7),
    .M1(i_8),
    .N1(i_9),
    .P1(i_10),
    .R1(i_11),
    .D2(i_12),
    .E2(i_13),
    .F2(i_14),
    .H2(i_15),
    .K2(i_16),
    .L2(i_17),
    .M2(i_18),
    .N2(i_19),
    .R2(i_20),
    .S2(i_21),
    .T2(i_22),
    .U2(i_23),
    .E1(out_dut[7:7]),
    .L1(out_dut[6:6]),
    .S1(out_dut[5:5]),
    .U1(out_dut[4:4]),
    .V1(out_dut[3:3]),
    .J2(out_dut[2:2]),
    .P2(out_dut[1:1]),
    .V2(out_dut[0:0])
  );
  autovcoder_076433__ref ref_i (
    .A1(i_0),
    .B1(i_1),
    .C1(i_2),
    .D1(i_3),
    .F1(i_4),
    .H1(i_5),
    .J1(i_6),
    .K1(i_7),
    .M1(i_8),
    .N1(i_9),
    .P1(i_10),
    .R1(i_11),
    .D2(i_12),
    .E2(i_13),
    .F2(i_14),
    .H2(i_15),
    .K2(i_16),
    .L2(i_17),
    .M2(i_18),
    .N2(i_19),
    .R2(i_20),
    .S2(i_21),
    .T2(i_22),
    .U2(i_23),
    .E1(out_ref[7:7]),
    .L1(out_ref[6:6]),
    .S1(out_ref[5:5]),
    .U1(out_ref[4:4]),
    .V1(out_ref[3:3]),
    .J2(out_ref[2:2]),
    .P2(out_ref[1:1]),
    .V2(out_ref[0:0])
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
    seed = 3923339648;
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
