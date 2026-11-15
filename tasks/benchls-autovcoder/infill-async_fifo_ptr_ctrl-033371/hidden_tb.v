// Hidden tests: 5000 cycles of seeded random inputs (seed 3394910679); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_033371 dut (
    .wclk(clk),
    .wrst_n(i_0),
    .wen(i_1),
    .rclk(i_2),
    .rrst_n(i_3),
    .ren(i_4),
    .wfull(out_dut[13:13]),
    .walmost_full(out_dut[12:12]),
    .mem_wen(out_dut[11:11]),
    .mem_waddr(out_dut[10:7]),
    .rempty(out_dut[6:6]),
    .ralmost_empty(out_dut[5:5]),
    .mem_ren(out_dut[4:4]),
    .mem_raddr(out_dut[3:0])
  );
  autovcoder_033371__ref ref_i (
    .wclk(clk),
    .wrst_n(i_0),
    .wen(i_1),
    .rclk(i_2),
    .rrst_n(i_3),
    .ren(i_4),
    .wfull(out_ref[13:13]),
    .walmost_full(out_ref[12:12]),
    .mem_wen(out_ref[11:11]),
    .mem_waddr(out_ref[10:7]),
    .rempty(out_ref[6:6]),
    .ralmost_empty(out_ref[5:5]),
    .mem_ren(out_ref[4:4]),
    .mem_raddr(out_ref[3:0])
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
    seed = 3394910679;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
