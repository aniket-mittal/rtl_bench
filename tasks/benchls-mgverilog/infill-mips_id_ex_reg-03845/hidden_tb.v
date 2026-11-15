// Hidden tests: 5000 cycles of seeded random inputs (seed 4043321716); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 121;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [1:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [4:0] i_13;
  reg [4:0] i_14;
  reg [4:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03845 dut (
    .clk(clk),
    .rst(i_0),
    .wb_reg_write(i_1),
    .wb_memtoreg(i_2),
    .mem_memread(i_3),
    .mem_memwrite(i_4),
    .mem_ll_mem(i_5),
    .mem_sc_mem(i_6),
    .regdst(i_7),
    .aluop(i_8),
    .alusrc(i_9),
    .regread1(i_10),
    .regread2(i_11),
    .sign_extend(i_12),
    .reg_rs(i_13),
    .reg_rt(i_14),
    .reg_rd(i_15),
    .ex_wb_reg_write(out_dut[120:120]),
    .ex_wb_memtoreg(out_dut[119:119]),
    .ex_mem_memread(out_dut[118:118]),
    .ex_mem_memwrite(out_dut[117:117]),
    .ex_mem_ll_mem(out_dut[116:116]),
    .ex_mem_sc_mem(out_dut[115:115]),
    .ex_regdst(out_dut[114:114]),
    .ex_aluop(out_dut[113:112]),
    .ex_alusrc(out_dut[111:111]),
    .ex_regread1(out_dut[110:79]),
    .ex_regread2(out_dut[78:47]),
    .ex_sign_extend(out_dut[46:15]),
    .ex_reg_rs(out_dut[14:10]),
    .ex_reg_rt(out_dut[9:5]),
    .ex_reg_rd(out_dut[4:0])
  );
  mg_03845__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .wb_reg_write(i_1),
    .wb_memtoreg(i_2),
    .mem_memread(i_3),
    .mem_memwrite(i_4),
    .mem_ll_mem(i_5),
    .mem_sc_mem(i_6),
    .regdst(i_7),
    .aluop(i_8),
    .alusrc(i_9),
    .regread1(i_10),
    .regread2(i_11),
    .sign_extend(i_12),
    .reg_rs(i_13),
    .reg_rt(i_14),
    .reg_rd(i_15),
    .ex_wb_reg_write(out_ref[120:120]),
    .ex_wb_memtoreg(out_ref[119:119]),
    .ex_mem_memread(out_ref[118:118]),
    .ex_mem_memwrite(out_ref[117:117]),
    .ex_mem_ll_mem(out_ref[116:116]),
    .ex_mem_sc_mem(out_ref[115:115]),
    .ex_regdst(out_ref[114:114]),
    .ex_aluop(out_ref[113:112]),
    .ex_alusrc(out_ref[111:111]),
    .ex_regread1(out_ref[110:79]),
    .ex_regread2(out_ref[78:47]),
    .ex_sign_extend(out_ref[46:15]),
    .ex_reg_rs(out_ref[14:10]),
    .ex_reg_rt(out_ref[9:5]),
    .ex_reg_rd(out_ref[4:0])
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
    seed = 4043321716;
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
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
