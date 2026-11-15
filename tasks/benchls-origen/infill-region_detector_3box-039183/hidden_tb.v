// Hidden tests: 5000 cycles of seeded random inputs (seed 338255133); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 3;
  reg clk;
  reg [0:0] i_0;
  reg [10:0] i_1;
  reg [9:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_039183 dut (
    .clk(clk),
    .enable(i_0),
    .gr_x(i_1),
    .gr_y(i_2),
    .out_five(out_dut[2:2]),
    .out_ten(out_dut[1:1]),
    .out_f_teen(out_dut[0:0])
  );
  origen_039183__ref ref_i (
    .clk(clk),
    .enable(i_0),
    .gr_x(i_1),
    .gr_y(i_2),
    .out_five(out_ref[2:2]),
    .out_ten(out_ref[1:1]),
    .out_f_teen(out_ref[0:0])
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
    seed = 338255133;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
