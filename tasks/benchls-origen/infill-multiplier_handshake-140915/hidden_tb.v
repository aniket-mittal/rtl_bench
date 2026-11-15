// Hidden tests: 5000 cycles of seeded random inputs (seed 1359688169); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 36;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_140915 dut (
    .ap_clk(clk),
    .ap_rst(i_0),
    .ap_start(i_1),
    .vld_i(i_2),
    .x_i_V(i_3),
    .rat_i_V(i_4),
    .ap_done(out_dut[35:35]),
    .ap_idle(out_dut[34:34]),
    .ap_ready(out_dut[33:33]),
    .vld_o(out_dut[32:32]),
    .y_o_V(out_dut[31:0])
  );
  origen_140915__ref ref_i (
    .ap_clk(clk),
    .ap_rst(i_0),
    .ap_start(i_1),
    .vld_i(i_2),
    .x_i_V(i_3),
    .rat_i_V(i_4),
    .ap_done(out_ref[35:35]),
    .ap_idle(out_ref[34:34]),
    .ap_ready(out_ref[33:33]),
    .vld_o(out_ref[32:32]),
    .y_o_V(out_ref[31:0])
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
    seed = 1359688169;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
