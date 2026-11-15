// Hidden tests: 5000 cycles of seeded random inputs (seed 1442660578); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 176;
  reg clk;
  reg [0:0] i_0;
  reg [3:0] i_1;
  reg [15:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_00677 dut (
    .clk(clk),
    .we(i_0),
    .wa(i_1),
    .di(i_2),
    .re(i_3),
    .do0(out_dut[175:160]),
    .do1(out_dut[159:144]),
    .do2(out_dut[143:128]),
    .do3(out_dut[127:112]),
    .do4(out_dut[111:96]),
    .do5(out_dut[95:80]),
    .do6(out_dut[79:64]),
    .do7(out_dut[63:48]),
    .do8(out_dut[47:32]),
    .do9(out_dut[31:16]),
    .do10(out_dut[15:0])
  );
  mg_00677__ref ref_i (
    .clk(clk),
    .we(i_0),
    .wa(i_1),
    .di(i_2),
    .re(i_3),
    .do0(out_ref[175:160]),
    .do1(out_ref[159:144]),
    .do2(out_ref[143:128]),
    .do3(out_ref[127:112]),
    .do4(out_ref[111:96]),
    .do5(out_ref[95:80]),
    .do6(out_ref[79:64]),
    .do7(out_ref[63:48]),
    .do8(out_ref[47:32]),
    .do9(out_ref[31:16]),
    .do10(out_ref[15:0])
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
    seed = 1442660578;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
