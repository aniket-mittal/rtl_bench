// Hidden tests: 5000 cycles of seeded random inputs (seed 3845244213); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 47;
  reg clk;
  reg [7:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [9:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_015088 dut (
    .clkMem(clk),
    .progData(i_0),
    .progValid(i_1),
    .progEn(i_2),
    .addrIn(i_3),
    .dataIn(i_4),
    .weIn(i_5),
    .enIn(i_6),
    .addrOut(out_dut[46:37]),
    .dataOut(out_dut[36:5]),
    .weOut(out_dut[4:1]),
    .enOut(out_dut[0:0])
  );
  origen_015088__ref ref_i (
    .clkMem(clk),
    .progData(i_0),
    .progValid(i_1),
    .progEn(i_2),
    .addrIn(i_3),
    .dataIn(i_4),
    .weIn(i_5),
    .enIn(i_6),
    .addrOut(out_ref[46:37]),
    .dataOut(out_ref[36:5]),
    .weOut(out_ref[4:1]),
    .enOut(out_ref[0:0])
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
    seed = 3845244213;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
