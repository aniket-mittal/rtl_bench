// Hidden tests: 5000 cycles of seeded random inputs (seed 2134790002); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 48;
  reg clk;

  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06420 dut (
    .o1(out_dut[47:44]),
    .o2(out_dut[43:40]),
    .o3(out_dut[39:36]),
    .o4(out_dut[35:32]),
    .o5(out_dut[31:28]),
    .o6(out_dut[27:24]),
    .o7(out_dut[23:20]),
    .o8(out_dut[19:16]),
    .o9(out_dut[15:12]),
    .yay1(out_dut[11:9]),
    .nay1(out_dut[8:6]),
    .yay2(out_dut[5:3]),
    .nay2(out_dut[2:0])
  );
  mg_06420__ref ref_i (
    .o1(out_ref[47:44]),
    .o2(out_ref[43:40]),
    .o3(out_ref[39:36]),
    .o4(out_ref[35:32]),
    .o5(out_ref[31:28]),
    .o6(out_ref[27:24]),
    .o7(out_ref[23:20]),
    .o8(out_ref[19:16]),
    .o9(out_ref[15:12]),
    .yay1(out_ref[11:9]),
    .nay1(out_ref[8:6]),
    .yay2(out_ref[5:3]),
    .nay2(out_ref[2:0])
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
    seed = 2134790002;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      ;
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
