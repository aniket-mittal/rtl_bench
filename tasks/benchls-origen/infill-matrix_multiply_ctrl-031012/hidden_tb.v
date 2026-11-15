// Hidden tests: 5000 cycles of seeded random inputs (seed 961712029); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 84;
  reg clk;
  reg [0:0] i_0;
  reg [19:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_031012 dut (
    .clk(clk),
    .reset(i_0),
    .read_data(i_1),
    .i(out_dut[83:64]),
    .j(out_dut[63:44]),
    .read(out_dut[43:43]),
    .write(out_dut[42:42]),
    .index(out_dut[41:41]),
    .finish(out_dut[40:40]),
    .write_data(out_dut[39:0])
  );
  origen_031012__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .read_data(i_1),
    .i(out_ref[83:64]),
    .j(out_ref[63:44]),
    .read(out_ref[43:43]),
    .write(out_ref[42:42]),
    .index(out_ref[41:41]),
    .finish(out_ref[40:40]),
    .write_data(out_ref[39:0])
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
    seed = 961712029;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
