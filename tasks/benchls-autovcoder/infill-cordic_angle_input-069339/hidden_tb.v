// Hidden tests: 5000 cycles of seeded random inputs (seed 800135732); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 51;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_069339 dut (
    .in_interface(i_0),
    .valid_in_interface(i_1),
    .degree_in(out_dut[50:35]),
    .x_in(out_dut[34:19]),
    .y_in(out_dut[18:3]),
    .flip_in(out_dut[2:2]),
    .arctan_en_in(out_dut[1:1]),
    .valid_in(out_dut[0:0])
  );
  autovcoder_069339__ref ref_i (
    .in_interface(i_0),
    .valid_in_interface(i_1),
    .degree_in(out_ref[50:35]),
    .x_in(out_ref[34:19]),
    .y_in(out_ref[18:3]),
    .flip_in(out_ref[2:2]),
    .arctan_en_in(out_ref[1:1]),
    .valid_in(out_ref[0:0])
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
    seed = 800135732;
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
