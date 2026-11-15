// Hidden tests: 5000 cycles of seeded random inputs (seed 4104519928); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 18;
  reg clk;
  reg [3:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_128142 dut (
    .ClockIn(clk),
    .Rows(i_0),
    .Start(i_1),
    .Reset(i_2),
    .Columns(out_dut[17:14]),
    .Locked(out_dut[13:13]),
    .Found(out_dut[12:12]),
    .Display(out_dut[11:4]),
    .Transistors(out_dut[3:0])
  );
  origen_128142__ref ref_i (
    .ClockIn(clk),
    .Rows(i_0),
    .Start(i_1),
    .Reset(i_2),
    .Columns(out_ref[17:14]),
    .Locked(out_ref[13:13]),
    .Found(out_ref[12:12]),
    .Display(out_ref[11:4]),
    .Transistors(out_ref[3:0])
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
    seed = 4104519928;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
