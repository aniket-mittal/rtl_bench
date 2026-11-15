// Hidden tests: 5000 cycles of seeded random inputs (seed 3670848788); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 640;
  reg clk;
  reg [0:0] i_0;
  reg [63:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_015115 dut (
    .clk(clk),
    .valid_box(i_0),
    .bbox_in(i_1),
    .bbox_out_0(out_dut[639:576]),
    .bbox_out_1(out_dut[575:512]),
    .bbox_out_2(out_dut[511:448]),
    .bbox_out_3(out_dut[447:384]),
    .bbox_out_4(out_dut[383:320]),
    .bbox_out_5(out_dut[319:256]),
    .bbox_out_6(out_dut[255:192]),
    .bbox_out_7(out_dut[191:128]),
    .bbox_out_8(out_dut[127:64]),
    .bbox_out_9(out_dut[63:0])
  );
  origen_015115__ref ref_i (
    .clk(clk),
    .valid_box(i_0),
    .bbox_in(i_1),
    .bbox_out_0(out_ref[639:576]),
    .bbox_out_1(out_ref[575:512]),
    .bbox_out_2(out_ref[511:448]),
    .bbox_out_3(out_ref[447:384]),
    .bbox_out_4(out_ref[383:320]),
    .bbox_out_5(out_ref[319:256]),
    .bbox_out_6(out_ref[255:192]),
    .bbox_out_7(out_ref[191:128]),
    .bbox_out_8(out_ref[127:64]),
    .bbox_out_9(out_ref[63:0])
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
    seed = 3670848788;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
