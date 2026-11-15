// Hidden tests: 5000 cycles of seeded random inputs (seed 1933041039); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 9;
  reg clk;
  reg [7:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_081994 dut (
    .dout_vld(clk),
    .dout(i_0),
    .blue_LR(out_dut[8:7]),
    .blue_key_left(out_dut[6:6]),
    .blue_key_down(out_dut[5:5]),
    .blue_key_right(out_dut[4:4]),
    .blue_key_up(out_dut[3:3]),
    .blue_key_unknown(out_dut[2:2]),
    .blue_wendu(out_dut[1:1]),
    .blue_Go(out_dut[0:0])
  );
  origen_081994__ref ref_i (
    .dout_vld(clk),
    .dout(i_0),
    .blue_LR(out_ref[8:7]),
    .blue_key_left(out_ref[6:6]),
    .blue_key_down(out_ref[5:5]),
    .blue_key_right(out_ref[4:4]),
    .blue_key_up(out_ref[3:3]),
    .blue_key_unknown(out_ref[2:2]),
    .blue_wendu(out_ref[1:1]),
    .blue_Go(out_ref[0:0])
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
    seed = 1933041039;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
