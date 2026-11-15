// Hidden tests: 5000 cycles of seeded random inputs (seed 2264881322); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 36;
  reg clk;
  reg [7:0] i_0;
  reg [2:0] i_1;
  reg [23:0] i_2;
  reg [7:0] i_3;
  reg [23:0] i_4;
  reg [23:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03373 dut (
    .CLK(clk),
    .featurebits(i_0),
    .MAPPER(i_1),
    .SNES_ADDR(i_2),
    .SNES_PA(i_3),
    .SAVERAM_MASK(i_4),
    .ROM_MASK(i_5),
    .ROM_ADDR(out_dut[35:12]),
    .ROM_HIT(out_dut[11:11]),
    .IS_SAVERAM(out_dut[10:10]),
    .IS_ROM(out_dut[9:9]),
    .IS_WRITABLE(out_dut[8:8]),
    .msu_enable(out_dut[7:7]),
    .r213f_enable(out_dut[6:6]),
    .snescmd_enable(out_dut[5:5]),
    .nmicmd_enable(out_dut[4:4]),
    .return_vector_enable(out_dut[3:3]),
    .branch1_enable(out_dut[2:2]),
    .branch2_enable(out_dut[1:1]),
    .obc1_enable(out_dut[0:0])
  );
  mg_03373__ref ref_i (
    .CLK(clk),
    .featurebits(i_0),
    .MAPPER(i_1),
    .SNES_ADDR(i_2),
    .SNES_PA(i_3),
    .SAVERAM_MASK(i_4),
    .ROM_MASK(i_5),
    .ROM_ADDR(out_ref[35:12]),
    .ROM_HIT(out_ref[11:11]),
    .IS_SAVERAM(out_ref[10:10]),
    .IS_ROM(out_ref[9:9]),
    .IS_WRITABLE(out_ref[8:8]),
    .msu_enable(out_ref[7:7]),
    .r213f_enable(out_ref[6:6]),
    .snescmd_enable(out_ref[5:5]),
    .nmicmd_enable(out_ref[4:4]),
    .return_vector_enable(out_ref[3:3]),
    .branch1_enable(out_ref[2:2]),
    .branch2_enable(out_ref[1:1]),
    .obc1_enable(out_ref[0:0])
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
    seed = 2264881322;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
