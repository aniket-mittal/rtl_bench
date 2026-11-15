// Hidden tests: 5000 cycles of seeded random inputs (seed 1029013450); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 100;
  reg clk;
  reg [3:0] i_0;
  reg [4:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_066374 dut (
    .currentFrame(i_0),
    .address0(i_1),
    .startPixel0(out_dut[99:90]),
    .startPixel1(out_dut[89:80]),
    .startPixel2(out_dut[79:70]),
    .rowPixelPanel0(out_dut[69:60]),
    .rowPixelPanel1(out_dut[59:50]),
    .rowPixelPanel2(out_dut[49:40]),
    .rowPixelPanel3(out_dut[39:30]),
    .rowPixelPanel4(out_dut[29:20]),
    .rowPixelPanel5(out_dut[19:10]),
    .rowPixelPanel7(out_dut[9:0])
  );
  origen_066374__ref ref_i (
    .currentFrame(i_0),
    .address0(i_1),
    .startPixel0(out_ref[99:90]),
    .startPixel1(out_ref[89:80]),
    .startPixel2(out_ref[79:70]),
    .rowPixelPanel0(out_ref[69:60]),
    .rowPixelPanel1(out_ref[59:50]),
    .rowPixelPanel2(out_ref[49:40]),
    .rowPixelPanel3(out_ref[39:30]),
    .rowPixelPanel4(out_ref[29:20]),
    .rowPixelPanel5(out_ref[19:10]),
    .rowPixelPanel7(out_ref[9:0])
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
    seed = 1029013450;
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
