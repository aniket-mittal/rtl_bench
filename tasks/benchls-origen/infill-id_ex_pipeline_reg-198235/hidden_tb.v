// Hidden tests: 5000 cycles of seeded random inputs (seed 908485736); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 143;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [4:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_198235 dut (
    .clk(clk),
    .rst(i_0),
    .En(i_1),
    .Clr(i_2),
    .RefAddr_i(i_3),
    .rData1_i(i_4),
    .rData2_i(i_5),
    .Offset_i(i_6),
    .RsAddr_i(i_7),
    .RtAddr_i(i_8),
    .RdAddr_i(i_9),
    .RefAddr(out_dut[142:111]),
    .rData1(out_dut[110:79]),
    .rData2(out_dut[78:47]),
    .Offset(out_dut[46:15]),
    .RsAddr(out_dut[14:10]),
    .RtAddr(out_dut[9:5]),
    .RdAddr(out_dut[4:0])
  );
  origen_198235__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .En(i_1),
    .Clr(i_2),
    .RefAddr_i(i_3),
    .rData1_i(i_4),
    .rData2_i(i_5),
    .Offset_i(i_6),
    .RsAddr_i(i_7),
    .RtAddr_i(i_8),
    .RdAddr_i(i_9),
    .RefAddr(out_ref[142:111]),
    .rData1(out_ref[110:79]),
    .rData2(out_ref[78:47]),
    .Offset(out_ref[46:15]),
    .RsAddr(out_ref[14:10]),
    .RtAddr(out_ref[9:5]),
    .RdAddr(out_ref[4:0])
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
    seed = 908485736;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
