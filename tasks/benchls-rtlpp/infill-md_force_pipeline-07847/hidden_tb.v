// Hidden tests: 5000 cycles of seeded random inputs (seed 1093504247); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 97;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_07847 dut (
    .clk(clk),
    .coeff_14(i_0),
    .coeff_8(i_1),
    .dx(i_2),
    .dy(i_3),
    .dz(i_4),
    .r2(i_5),
    .term_0_14(i_6),
    .term_0_8(i_7),
    .term_1_14(i_8),
    .term_1_8(i_9),
    .term_valid(i_10),
    .frc_valid(out_dut[96:96]),
    .fx(out_dut[95:64]),
    .fy(out_dut[63:32]),
    .fz(out_dut[31:0])
  );
  rtlpp_07847__ref ref_i (
    .clk(clk),
    .coeff_14(i_0),
    .coeff_8(i_1),
    .dx(i_2),
    .dy(i_3),
    .dz(i_4),
    .r2(i_5),
    .term_0_14(i_6),
    .term_0_8(i_7),
    .term_1_14(i_8),
    .term_1_8(i_9),
    .term_valid(i_10),
    .frc_valid(out_ref[96:96]),
    .fx(out_ref[95:64]),
    .fy(out_ref[63:32]),
    .fz(out_ref[31:0])
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
    seed = 1093504247;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
