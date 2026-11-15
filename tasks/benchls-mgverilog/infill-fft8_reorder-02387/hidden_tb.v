// Hidden tests: 5000 cycles of seeded random inputs (seed 1935444018); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 128;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  reg [15:0] i_7;
  reg [15:0] i_8;
  reg [15:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02387 dut (
    .enable(i_0),
    .inverse(i_1),
    .i_0(i_2),
    .i_1(i_3),
    .i_2(i_4),
    .i_3(i_5),
    .i_4(i_6),
    .i_5(i_7),
    .i_6(i_8),
    .i_7(i_9),
    .o_0(out_dut[127:112]),
    .o_1(out_dut[111:96]),
    .o_2(out_dut[95:80]),
    .o_3(out_dut[79:64]),
    .o_4(out_dut[63:48]),
    .o_5(out_dut[47:32]),
    .o_6(out_dut[31:16]),
    .o_7(out_dut[15:0])
  );
  mg_02387__ref ref_i (
    .enable(i_0),
    .inverse(i_1),
    .i_0(i_2),
    .i_1(i_3),
    .i_2(i_4),
    .i_3(i_5),
    .i_4(i_6),
    .i_5(i_7),
    .i_6(i_8),
    .i_7(i_9),
    .o_0(out_ref[127:112]),
    .o_1(out_ref[111:96]),
    .o_2(out_ref[95:80]),
    .o_3(out_ref[79:64]),
    .o_4(out_ref[63:48]),
    .o_5(out_ref[47:32]),
    .o_6(out_ref[31:16]),
    .o_7(out_ref[15:0])
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
    seed = 1935444018;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
