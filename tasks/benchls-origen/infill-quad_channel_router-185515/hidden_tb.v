// Hidden tests: 5000 cycles of seeded random inputs (seed 3257376330); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 72;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [7:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_185515 dut (
    .clk(clk),
    .IDL(i_0),
    .data_in0(i_1),
    .data_in1(i_2),
    .data_in2(i_3),
    .data_in3(i_4),
    .valid0(i_5),
    .valid1(i_6),
    .valid2(i_7),
    .valid3(i_8),
    .L1_in0(out_dut[71:64]),
    .L1_in1(out_dut[63:56]),
    .L1_in2(out_dut[55:48]),
    .L1_in3(out_dut[47:40]),
    .L1_valid0(out_dut[39:39]),
    .L1_valid1(out_dut[38:38]),
    .L1_valid2(out_dut[37:37]),
    .L1_valid3(out_dut[36:36]),
    .probador_in0(out_dut[35:28]),
    .probador_in1(out_dut[27:20]),
    .probador_in2(out_dut[19:12]),
    .probador_in3(out_dut[11:4]),
    .probador_valid0(out_dut[3:3]),
    .probador_valid1(out_dut[2:2]),
    .probador_valid2(out_dut[1:1]),
    .probador_valid3(out_dut[0:0])
  );
  origen_185515__ref ref_i (
    .clk(clk),
    .IDL(i_0),
    .data_in0(i_1),
    .data_in1(i_2),
    .data_in2(i_3),
    .data_in3(i_4),
    .valid0(i_5),
    .valid1(i_6),
    .valid2(i_7),
    .valid3(i_8),
    .L1_in0(out_ref[71:64]),
    .L1_in1(out_ref[63:56]),
    .L1_in2(out_ref[55:48]),
    .L1_in3(out_ref[47:40]),
    .L1_valid0(out_ref[39:39]),
    .L1_valid1(out_ref[38:38]),
    .L1_valid2(out_ref[37:37]),
    .L1_valid3(out_ref[36:36]),
    .probador_in0(out_ref[35:28]),
    .probador_in1(out_ref[27:20]),
    .probador_in2(out_ref[19:12]),
    .probador_in3(out_ref[11:4]),
    .probador_valid0(out_ref[3:3]),
    .probador_valid1(out_ref[2:2]),
    .probador_valid2(out_ref[1:1]),
    .probador_valid3(out_ref[0:0])
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
    seed = 3257376330;
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
