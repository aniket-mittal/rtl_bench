// Hidden tests: 5000 cycles of seeded random inputs (seed 2641534633); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 256;
  reg clk;
  reg [0:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_047426 dut (
    .clk(clk),
    .rst(i_0),
    .A1(i_1),
    .A2(i_2),
    .RdW(i_3),
    .ResultW(i_4),
    .RegWriteW(i_5),
    .RD1(out_dut[255:224]),
    .RD2(out_dut[223:192]),
    .checkx1(out_dut[191:160]),
    .checkx2(out_dut[159:128]),
    .checkx3(out_dut[127:96]),
    .checkx4(out_dut[95:64]),
    .checkx5(out_dut[63:32]),
    .checkx6(out_dut[31:0])
  );
  origen_047426__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .A1(i_1),
    .A2(i_2),
    .RdW(i_3),
    .ResultW(i_4),
    .RegWriteW(i_5),
    .RD1(out_ref[255:224]),
    .RD2(out_ref[223:192]),
    .checkx1(out_ref[191:160]),
    .checkx2(out_ref[159:128]),
    .checkx3(out_ref[127:96]),
    .checkx4(out_ref[95:64]),
    .checkx5(out_ref[63:32]),
    .checkx6(out_ref[31:0])
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
    seed = 2641534633;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
