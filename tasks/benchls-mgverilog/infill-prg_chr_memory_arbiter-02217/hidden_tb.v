// Hidden tests: 5000 cycles of seeded random inputs (seed 2633134957); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 33;
  reg clk;
  reg [0:0] i_0;
  reg [21:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [7:0] i_4;
  reg [21:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [7:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02217 dut (
    .clk(clk),
    .ce(i_0),
    .prg_addr(i_1),
    .prg_read(i_2),
    .prg_write(i_3),
    .prg_din(i_4),
    .chr_addr(i_5),
    .chr_read(i_6),
    .chr_write(i_7),
    .chr_din(i_8),
    .memory_addr(out_dut[32:11]),
    .memory_read_cpu(out_dut[10:10]),
    .memory_read_ppu(out_dut[9:9]),
    .memory_write(out_dut[8:8]),
    .memory_dout(out_dut[7:0])
  );
  mg_02217__ref ref_i (
    .clk(clk),
    .ce(i_0),
    .prg_addr(i_1),
    .prg_read(i_2),
    .prg_write(i_3),
    .prg_din(i_4),
    .chr_addr(i_5),
    .chr_read(i_6),
    .chr_write(i_7),
    .chr_din(i_8),
    .memory_addr(out_ref[32:11]),
    .memory_read_cpu(out_ref[10:10]),
    .memory_read_ppu(out_ref[9:9]),
    .memory_write(out_ref[8:8]),
    .memory_dout(out_ref[7:0])
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
    seed = 2633134957;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
