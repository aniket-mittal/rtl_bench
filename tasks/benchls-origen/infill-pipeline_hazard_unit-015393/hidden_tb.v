// Hidden tests: 5000 cycles of seeded random inputs (seed 3919917308); the submission must match reference.v
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
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [4:0] i_6;
  reg [4:0] i_7;
  reg [4:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_015393 dut (
    .branch_d(i_0),
    .regwrite_e(i_1),
    .memtoreg_e(i_2),
    .memtoreg_m(i_3),
    .writereg_e(i_4),
    .rs_d(i_5),
    .rt_d(i_6),
    .rt_e(i_7),
    .writereg_m(i_8),
    .memread_m(i_9),
    .memwrite_m(i_10),
    .memready_m(i_11),
    .branchtaken_e(i_12),
    .branchfound_e(i_13),
    .jump_d(i_14),
    .stall_f(out_dut[9:9]),
    .stall_d(out_dut[8:8]),
    .stall_e(out_dut[7:7]),
    .stall_m(out_dut[6:6]),
    .stall_w(out_dut[5:5]),
    .flush_f(out_dut[4:4]),
    .flush_d(out_dut[3:3]),
    .flush_e(out_dut[2:2]),
    .flush_m(out_dut[1:1]),
    .flush_w(out_dut[0:0])
  );
  origen_015393__ref ref_i (
    .branch_d(i_0),
    .regwrite_e(i_1),
    .memtoreg_e(i_2),
    .memtoreg_m(i_3),
    .writereg_e(i_4),
    .rs_d(i_5),
    .rt_d(i_6),
    .rt_e(i_7),
    .writereg_m(i_8),
    .memread_m(i_9),
    .memwrite_m(i_10),
    .memready_m(i_11),
    .branchtaken_e(i_12),
    .branchfound_e(i_13),
    .jump_d(i_14),
    .stall_f(out_ref[9:9]),
    .stall_d(out_ref[8:8]),
    .stall_e(out_ref[7:7]),
    .stall_m(out_ref[6:6]),
    .stall_w(out_ref[5:5]),
    .flush_f(out_ref[4:4]),
    .flush_d(out_ref[3:3]),
    .flush_e(out_ref[2:2]),
    .flush_m(out_ref[1:1]),
    .flush_w(out_ref[0:0])
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
    seed = 3919917308;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
