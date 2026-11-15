// Hidden tests: 5000 cycles of seeded random inputs (seed 1815866324); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 52;
  reg clk;
  reg [9:0] i_0;
  reg [3:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_107406 dut (
    .SW(i_0),
    .KEY(i_1),
    .LEDR(out_dut[51:42]),
    .HEX0(out_dut[41:35]),
    .HEX1(out_dut[34:28]),
    .HEX2(out_dut[27:21]),
    .HEX3(out_dut[20:14]),
    .HEX4(out_dut[13:7]),
    .HEX5(out_dut[6:0])
  );
  origen_107406__ref ref_i (
    .SW(i_0),
    .KEY(i_1),
    .LEDR(out_ref[51:42]),
    .HEX0(out_ref[41:35]),
    .HEX1(out_ref[34:28]),
    .HEX2(out_ref[27:21]),
    .HEX3(out_ref[20:14]),
    .HEX4(out_ref[13:7]),
    .HEX5(out_ref[6:0])
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
    seed = 1815866324;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
