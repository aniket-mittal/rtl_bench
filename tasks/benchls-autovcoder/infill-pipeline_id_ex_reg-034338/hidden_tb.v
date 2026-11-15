// Hidden tests: 5000 cycles of seeded random inputs (seed 9667070); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 119;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [2:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [4:0] i_10;
  reg [4:0] i_11;
  reg [4:0] i_12;
  reg [31:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_034338 dut (
    .clk(clk),
    .reset(i_0),
    .clr(i_1),
    .reg_write_d(i_2),
    .mem2reg_d(i_3),
    .mem_wr_d(i_4),
    .alu_control_d(i_5),
    .alu_src_d(i_6),
    .reg_dst_d(i_7),
    .rd1_d(i_8),
    .rd2_d(i_9),
    .rsd_d(i_10),
    .rtd_d(i_11),
    .rde_d(i_12),
    .sign_extend_d(i_13),
    .reg_write(out_dut[118:118]),
    .mem2reg(out_dut[117:117]),
    .mem_wr(out_dut[116:116]),
    .alu_control(out_dut[115:113]),
    .alu_src(out_dut[112:112]),
    .reg_dst(out_dut[111:111]),
    .rd1_e(out_dut[110:79]),
    .rd2_e(out_dut[78:47]),
    .rse(out_dut[46:42]),
    .rte(out_dut[41:37]),
    .rdE(out_dut[36:32]),
    .sign_extend(out_dut[31:0])
  );
  autovcoder_034338__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .clr(i_1),
    .reg_write_d(i_2),
    .mem2reg_d(i_3),
    .mem_wr_d(i_4),
    .alu_control_d(i_5),
    .alu_src_d(i_6),
    .reg_dst_d(i_7),
    .rd1_d(i_8),
    .rd2_d(i_9),
    .rsd_d(i_10),
    .rtd_d(i_11),
    .rde_d(i_12),
    .sign_extend_d(i_13),
    .reg_write(out_ref[118:118]),
    .mem2reg(out_ref[117:117]),
    .mem_wr(out_ref[116:116]),
    .alu_control(out_ref[115:113]),
    .alu_src(out_ref[112:112]),
    .reg_dst(out_ref[111:111]),
    .rd1_e(out_ref[110:79]),
    .rd2_e(out_ref[78:47]),
    .rse(out_ref[46:42]),
    .rte(out_ref[41:37]),
    .rdE(out_ref[36:32]),
    .sign_extend(out_ref[31:0])
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
    seed = 9667070;
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
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
