// Hidden tests: 5000 cycles of seeded random inputs (seed 1998423059); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 28;
  reg clk;
  reg [24:0] i_0;
  reg [24:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [1:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_070348 dut (
    .A_DI(i_0),
    .B_DI(i_1),
    .Div_enable_SI(i_2),
    .Div_start_dly_SI(i_3),
    .Sqrt_enable_SI(i_4),
    .D_DI(i_5),
    .D_DO(out_dut[27:26]),
    .Sum_DO(out_dut[25:1]),
    .Carry_out_DO(out_dut[0:0])
  );
  autovcoder_070348__ref ref_i (
    .A_DI(i_0),
    .B_DI(i_1),
    .Div_enable_SI(i_2),
    .Div_start_dly_SI(i_3),
    .Sqrt_enable_SI(i_4),
    .D_DI(i_5),
    .D_DO(out_ref[27:26]),
    .Sum_DO(out_ref[25:1]),
    .Carry_out_DO(out_ref[0:0])
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
    seed = 1998423059;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
