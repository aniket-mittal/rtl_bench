// Hidden tests: 5000 cycles of seeded random inputs (seed 3720365748); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 69;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_190982 dut (
    .clk(clk),
    .instruction(i_0),
    .ir_w(i_1),
    .jumpAddress(out_dut[68:43]),
    .opcode(out_dut[42:37]),
    .funct(out_dut[36:31]),
    .rs(out_dut[30:26]),
    .rt(out_dut[25:21]),
    .rd(out_dut[20:16]),
    .immediate(out_dut[15:0])
  );
  origen_190982__ref ref_i (
    .clk(clk),
    .instruction(i_0),
    .ir_w(i_1),
    .jumpAddress(out_ref[68:43]),
    .opcode(out_ref[42:37]),
    .funct(out_ref[36:31]),
    .rs(out_ref[30:26]),
    .rt(out_ref[25:21]),
    .rd(out_ref[20:16]),
    .immediate(out_ref[15:0])
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
    seed = 3720365748;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
