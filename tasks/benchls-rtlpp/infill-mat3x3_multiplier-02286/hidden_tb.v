// Hidden tests: 5000 cycles of seeded random inputs (seed 473105012); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 144;
  reg clk;
  reg [15:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  reg [15:0] i_7;
  reg [15:0] i_8;
  reg [15:0] i_9;
  reg [15:0] i_10;
  reg [15:0] i_11;
  reg [15:0] i_12;
  reg [15:0] i_13;
  reg [15:0] i_14;
  reg [15:0] i_15;
  reg [15:0] i_16;
  reg [15:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02286 dut (
    .A11(i_0),
    .A12(i_1),
    .A13(i_2),
    .A21(i_3),
    .A22(i_4),
    .A23(i_5),
    .A31(i_6),
    .A32(i_7),
    .A33(i_8),
    .B11(i_9),
    .B12(i_10),
    .B13(i_11),
    .B21(i_12),
    .B22(i_13),
    .B23(i_14),
    .B31(i_15),
    .B32(i_16),
    .B33(i_17),
    .Y11(out_dut[143:128]),
    .Y12(out_dut[127:112]),
    .Y13(out_dut[111:96]),
    .Y21(out_dut[95:80]),
    .Y22(out_dut[79:64]),
    .Y23(out_dut[63:48]),
    .Y31(out_dut[47:32]),
    .Y32(out_dut[31:16]),
    .Y33(out_dut[15:0])
  );
  rtlpp_02286__ref ref_i (
    .A11(i_0),
    .A12(i_1),
    .A13(i_2),
    .A21(i_3),
    .A22(i_4),
    .A23(i_5),
    .A31(i_6),
    .A32(i_7),
    .A33(i_8),
    .B11(i_9),
    .B12(i_10),
    .B13(i_11),
    .B21(i_12),
    .B22(i_13),
    .B23(i_14),
    .B31(i_15),
    .B32(i_16),
    .B33(i_17),
    .Y11(out_ref[143:128]),
    .Y12(out_ref[127:112]),
    .Y13(out_ref[111:96]),
    .Y21(out_ref[95:80]),
    .Y22(out_ref[79:64]),
    .Y23(out_ref[63:48]),
    .Y31(out_ref[47:32]),
    .Y32(out_ref[31:16]),
    .Y33(out_ref[15:0])
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
    seed = 473105012;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
