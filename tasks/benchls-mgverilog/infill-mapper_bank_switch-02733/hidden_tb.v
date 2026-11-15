// Hidden tests: 5000 cycles of seeded random inputs (seed 3601998917); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 48;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [15:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [13:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02733 dut (
    .clk(clk),
    .ce(i_0),
    .flags(i_1),
    .prg_ain(i_2),
    .prg_read(i_3),
    .prg_write(i_4),
    .prg_din(i_5),
    .chr_ain(i_6),
    .prg_aout(out_dut[47:26]),
    .prg_allow(out_dut[25:25]),
    .chr_aout(out_dut[24:3]),
    .chr_allow(out_dut[2:2]),
    .vram_a10(out_dut[1:1]),
    .vram_ce(out_dut[0:0])
  );
  mg_02733__ref ref_i (
    .clk(clk),
    .ce(i_0),
    .flags(i_1),
    .prg_ain(i_2),
    .prg_read(i_3),
    .prg_write(i_4),
    .prg_din(i_5),
    .chr_ain(i_6),
    .prg_aout(out_ref[47:26]),
    .prg_allow(out_ref[25:25]),
    .chr_aout(out_ref[24:3]),
    .chr_allow(out_ref[2:2]),
    .vram_a10(out_ref[1:1]),
    .vram_ce(out_ref[0:0])
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
    seed = 3601998917;
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
