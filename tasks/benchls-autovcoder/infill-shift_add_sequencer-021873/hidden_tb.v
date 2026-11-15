// Hidden tests: 5000 cycles of seeded random inputs (seed 3446596046); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 37;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_021873 dut (
    .clk(clk),
    .fov(i_0),
    .fcarry(i_1),
    .fneg(i_2),
    .fzero(i_3),
    .rst_in(i_4),
    .selection_sr(out_dut[36:29]),
    .selection_multa(out_dut[28:21]),
    .selection_alu(out_dut[20:13]),
    .selection_multb(out_dut[12:5]),
    .rst_out(out_dut[4:4]),
    .writer(out_dut[3:0])
  );
  autovcoder_021873__ref ref_i (
    .clk(clk),
    .fov(i_0),
    .fcarry(i_1),
    .fneg(i_2),
    .fzero(i_3),
    .rst_in(i_4),
    .selection_sr(out_ref[36:29]),
    .selection_multa(out_ref[28:21]),
    .selection_alu(out_ref[20:13]),
    .selection_multb(out_ref[12:5]),
    .rst_out(out_ref[4:4]),
    .writer(out_ref[3:0])
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
    seed = 3446596046;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
