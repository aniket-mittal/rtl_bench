// Hidden tests: 5000 cycles of seeded random inputs (seed 1308284748); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 25;
  reg clk;
  reg [0:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_090202 dut (
    .clk50(clk),
    .reset(i_0),
    .vSync(out_dut[24:24]),
    .hSync(out_dut[23:23]),
    .pClk(out_dut[22:22]),
    .row(out_dut[21:13]),
    .col(out_dut[12:3]),
    .row0(out_dut[2:2]),
    .col0(out_dut[1:1]),
    .active(out_dut[0:0])
  );
  origen_090202__ref ref_i (
    .clk50(clk),
    .reset(i_0),
    .vSync(out_ref[24:24]),
    .hSync(out_ref[23:23]),
    .pClk(out_ref[22:22]),
    .row(out_ref[21:13]),
    .col(out_ref[12:3]),
    .row0(out_ref[2:2]),
    .col0(out_ref[1:1]),
    .active(out_ref[0:0])
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
    seed = 1308284748;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
