// Hidden tests: 5000 cycles of seeded random inputs (seed 3971572786); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 70;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [4:0] i_3;
  reg [255:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_149862 dut (
    .clock_i(clk),
    .reset_i(i_0),
    .enable_i(i_1),
    .shouldStalled_i(i_2),
    .byteAddr_i(i_3),
    .block_i(i_4),
    .shouldStalled_o(out_dut[69:69]),
    .backDisable_o(out_dut[68:68]),
    .nextByteOffset_o(out_dut[67:64]),
    .InstructionA_o(out_dut[63:34]),
    .InstructionB_o(out_dut[33:4]),
    .InstructionAFormat_o(out_dut[3:3]),
    .InstructionBFormat_o(out_dut[2:2]),
    .enableA_o(out_dut[1:1]),
    .enableB_o(out_dut[0:0])
  );
  origen_149862__ref ref_i (
    .clock_i(clk),
    .reset_i(i_0),
    .enable_i(i_1),
    .shouldStalled_i(i_2),
    .byteAddr_i(i_3),
    .block_i(i_4),
    .shouldStalled_o(out_ref[69:69]),
    .backDisable_o(out_ref[68:68]),
    .nextByteOffset_o(out_ref[67:64]),
    .InstructionA_o(out_ref[63:34]),
    .InstructionB_o(out_ref[33:4]),
    .InstructionAFormat_o(out_ref[3:3]),
    .InstructionBFormat_o(out_ref[2:2]),
    .enableA_o(out_ref[1:1]),
    .enableB_o(out_ref[0:0])
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
    seed = 3971572786;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
