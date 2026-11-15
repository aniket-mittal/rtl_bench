// Hidden tests: 5000 cycles of seeded random inputs (seed 3185008618); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 6;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [1:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06163 dut (
    .flush_except(i_0),
    .flush_branch(i_1),
    .if_stall(i_2),
    .lsu_stall(i_3),
    .multicycle_cnt(i_4),
    .asyn_stall(i_5),
    .flushpipe(out_dut[5:5]),
    .pc_freeze(out_dut[4:4]),
    .if_freeze(out_dut[3:3]),
    .id_freeze(out_dut[2:2]),
    .ex_freeze(out_dut[1:1]),
    .wb_freeze(out_dut[0:0])
  );
  mg_06163__ref ref_i (
    .flush_except(i_0),
    .flush_branch(i_1),
    .if_stall(i_2),
    .lsu_stall(i_3),
    .multicycle_cnt(i_4),
    .asyn_stall(i_5),
    .flushpipe(out_ref[5:5]),
    .pc_freeze(out_ref[4:4]),
    .if_freeze(out_ref[3:3]),
    .id_freeze(out_ref[2:2]),
    .ex_freeze(out_ref[1:1]),
    .wb_freeze(out_ref[0:0])
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
    seed = 3185008618;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
