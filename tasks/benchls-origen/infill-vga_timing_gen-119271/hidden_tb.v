// Hidden tests: 5000 cycles of seeded random inputs (seed 1117182523); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 23;
  reg clk;

  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_119271 dut (
    .clk(clk),
    .vga_h_sync(out_dut[22:22]),
    .vga_v_sync(out_dut[21:21]),
    .inDisplayArea(out_dut[20:20]),
    .HCounterX(out_dut[19:10]),
    .HCounterY(out_dut[9:0])
  );
  origen_119271__ref ref_i (
    .clk(clk),
    .vga_h_sync(out_ref[22:22]),
    .vga_v_sync(out_ref[21:21]),
    .inDisplayArea(out_ref[20:20]),
    .HCounterX(out_ref[19:10]),
    .HCounterY(out_ref[9:0])
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
    seed = 1117182523;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      ;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
