// Hidden tests: 5000 cycles of seeded random inputs (seed 2113483994); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 34;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [1:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_187197 dut (
    .HRDATA1(i_0),
    .HRDATA2(i_1),
    .HRDATA3(i_2),
    .HRDATA4(i_3),
    .HRESP1(i_4),
    .HRESP2(i_5),
    .HRESP3(i_6),
    .HRESP4(i_7),
    .HREADY1(i_8),
    .HREADY2(i_9),
    .HREADY3(i_10),
    .HREADY4(i_11),
    .addr(i_12),
    .HRDATA(out_dut[33:2]),
    .HRESP(out_dut[1:1]),
    .HREADY(out_dut[0:0])
  );
  origen_187197__ref ref_i (
    .HRDATA1(i_0),
    .HRDATA2(i_1),
    .HRDATA3(i_2),
    .HRDATA4(i_3),
    .HRESP1(i_4),
    .HRESP2(i_5),
    .HRESP3(i_6),
    .HRESP4(i_7),
    .HREADY1(i_8),
    .HREADY2(i_9),
    .HREADY3(i_10),
    .HREADY4(i_11),
    .addr(i_12),
    .HRDATA(out_ref[33:2]),
    .HRESP(out_ref[1:1]),
    .HREADY(out_ref[0:0])
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
    seed = 2113483994;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
