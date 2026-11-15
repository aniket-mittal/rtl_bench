// Hidden tests: 5000 cycles of seeded random inputs (seed 665300958); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 8;
  reg clk;
  reg [0:0] i_0;
  reg [2:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_214792 dut (
    .Data_in(i_0),
    .sel(i_1),
    .Data_out_0(out_dut[7:7]),
    .Data_out_1(out_dut[6:6]),
    .Data_out_2(out_dut[5:5]),
    .Data_out_3(out_dut[4:4]),
    .Data_out_4(out_dut[3:3]),
    .Data_out_5(out_dut[2:2]),
    .Data_out_6(out_dut[1:1]),
    .Data_out_7(out_dut[0:0])
  );
  origen_214792__ref ref_i (
    .Data_in(i_0),
    .sel(i_1),
    .Data_out_0(out_ref[7:7]),
    .Data_out_1(out_ref[6:6]),
    .Data_out_2(out_ref[5:5]),
    .Data_out_3(out_ref[4:4]),
    .Data_out_4(out_ref[3:3]),
    .Data_out_5(out_ref[2:2]),
    .Data_out_6(out_ref[1:1]),
    .Data_out_7(out_ref[0:0])
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
    seed = 665300958;
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
