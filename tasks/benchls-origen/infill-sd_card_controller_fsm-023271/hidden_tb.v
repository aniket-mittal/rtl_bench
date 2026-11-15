// Hidden tests: 5000 cycles of seeded random inputs (seed 460527318); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 10;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [7:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_023271 dut (
    .clk(clk),
    .start(i_0),
    .empty(i_1),
    .endCRC(i_2),
    .block(i_3),
    .hasNext(i_4),
    .bytes(i_5),
    .resetAll(i_6),
    .response(i_7),
    .count(out_dut[9:9]),
    .byteEnable(out_dut[8:8]),
    .reset(out_dut[7:7]),
    .loadCmd(out_dut[6:6]),
    .shiftCmd(out_dut[5:5]),
    .nextAddr(out_dut[4:4]),
    .dataSelect(out_dut[3:3]),
    .tokenSelect(out_dut[2:2]),
    .oe(out_dut[1:1]),
    .startCountData(out_dut[0:0])
  );
  origen_023271__ref ref_i (
    .clk(clk),
    .start(i_0),
    .empty(i_1),
    .endCRC(i_2),
    .block(i_3),
    .hasNext(i_4),
    .bytes(i_5),
    .resetAll(i_6),
    .response(i_7),
    .count(out_ref[9:9]),
    .byteEnable(out_ref[8:8]),
    .reset(out_ref[7:7]),
    .loadCmd(out_ref[6:6]),
    .shiftCmd(out_ref[5:5]),
    .nextAddr(out_ref[4:4]),
    .dataSelect(out_ref[3:3]),
    .tokenSelect(out_ref[2:2]),
    .oe(out_ref[1:1]),
    .startCountData(out_ref[0:0])
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
    seed = 460527318;
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
      i_6 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_7 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
