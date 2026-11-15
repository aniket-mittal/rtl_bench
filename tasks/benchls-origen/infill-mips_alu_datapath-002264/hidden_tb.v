// Hidden tests: 5000 cycles of seeded random inputs (seed 2703994109); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 33;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [1:0] i_5;
  reg [1:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_002264 dut (
    .rin_A(i_0),
    .rin_B(i_1),
    .ir_data(i_2),
    .pc(i_3),
    .alu_srcA(i_4),
    .alu_srcB(i_5),
    .alu_ctrl(i_6),
    .zero(out_dut[32:32]),
    .res(out_dut[31:0])
  );
  origen_002264__ref ref_i (
    .rin_A(i_0),
    .rin_B(i_1),
    .ir_data(i_2),
    .pc(i_3),
    .alu_srcA(i_4),
    .alu_srcB(i_5),
    .alu_ctrl(i_6),
    .zero(out_ref[32:32]),
    .res(out_ref[31:0])
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
    seed = 2703994109;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
