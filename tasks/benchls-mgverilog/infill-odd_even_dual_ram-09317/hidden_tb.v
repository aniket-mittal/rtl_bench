// Hidden tests: 5000 cycles of seeded random inputs (seed 1865443760); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 32;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [5:0] i_3;
  reg [5:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_09317 dut (
    .CLK(clk),
    .ED(i_0),
    .WE(i_1),
    .ODD(i_2),
    .ADDRW(i_3),
    .ADDRR(i_4),
    .DR(i_5),
    .DI(i_6),
    .DOR(out_dut[31:16]),
    .DOI(out_dut[15:0])
  );
  mg_09317__ref ref_i (
    .CLK(clk),
    .ED(i_0),
    .WE(i_1),
    .ODD(i_2),
    .ADDRW(i_3),
    .ADDRR(i_4),
    .DR(i_5),
    .DI(i_6),
    .DOR(out_ref[31:16]),
    .DOI(out_ref[15:0])
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
    seed = 1865443760;
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
