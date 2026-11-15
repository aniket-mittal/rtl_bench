// Hidden tests: 5000 cycles of seeded random inputs (seed 1847576512); the submission must match reference.v
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
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [15:0] i_12;
  reg [15:0] i_13;
  reg [15:0] i_14;
  reg [15:0] i_15;
  reg [2:0] i_16;
  reg [2:0] i_17;
  reg [2:0] i_18;
  reg [0:0] i_19;
  reg [1:0] i_20;
  reg [15:0] i_21;
  reg [15:0] i_22;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_210351 dut (
    .clk(clk),
    .idex_en(i_0),
    .memtoreg(i_1),
    .reg_write(i_2),
    .mem_read(i_3),
    .mem_write(i_4),
    .reg_dst(i_5),
    .alusrc_a(i_6),
    .branch(i_7),
    .jump(i_8),
    .halt(i_9),
    .word_en(i_10),
    .ld_en(i_11),
    .pc_plus2(i_12),
    .read_data1(i_13),
    .read_data2(i_14),
    .sign_extend(i_15),
    .instr_rt(i_16),
    .instr_rd(i_17),
    .rs(i_18),
    .alusrc_b(i_19),
    .aluop(i_20),
    .branch_label(i_21),
    .jump_addr(i_22),
    .memtoreg_reg(out_dut[118:118]),
    .reg_write_reg(out_dut[117:117]),
    .mem_read_reg(out_dut[116:116]),
    .mem_write_reg(out_dut[115:115]),
    .reg_dst_reg(out_dut[114:114]),
    .alusrc_a_reg(out_dut[113:113]),
    .branch_reg(out_dut[112:112]),
    .jump_reg(out_dut[111:111]),
    .halt_reg(out_dut[110:110]),
    .word_en_reg(out_dut[109:109]),
    .ld_en_reg(out_dut[108:108]),
    .pc_plus2_reg(out_dut[107:92]),
    .read_data1_reg(out_dut[91:76]),
    .read_data2_reg(out_dut[75:60]),
    .sign_extend_reg(out_dut[59:44]),
    .instr_rt_reg(out_dut[43:41]),
    .instr_rd_reg(out_dut[40:38]),
    .rs_reg(out_dut[37:35]),
    .alusrc_b_reg(out_dut[34:34]),
    .aluop_reg(out_dut[33:32]),
    .branch_label_reg(out_dut[31:16]),
    .jump_addr_reg(out_dut[15:0])
  );
  origen_210351__ref ref_i (
    .clk(clk),
    .idex_en(i_0),
    .memtoreg(i_1),
    .reg_write(i_2),
    .mem_read(i_3),
    .mem_write(i_4),
    .reg_dst(i_5),
    .alusrc_a(i_6),
    .branch(i_7),
    .jump(i_8),
    .halt(i_9),
    .word_en(i_10),
    .ld_en(i_11),
    .pc_plus2(i_12),
    .read_data1(i_13),
    .read_data2(i_14),
    .sign_extend(i_15),
    .instr_rt(i_16),
    .instr_rd(i_17),
    .rs(i_18),
    .alusrc_b(i_19),
    .aluop(i_20),
    .branch_label(i_21),
    .jump_addr(i_22),
    .memtoreg_reg(out_ref[118:118]),
    .reg_write_reg(out_ref[117:117]),
    .mem_read_reg(out_ref[116:116]),
    .mem_write_reg(out_ref[115:115]),
    .reg_dst_reg(out_ref[114:114]),
    .alusrc_a_reg(out_ref[113:113]),
    .branch_reg(out_ref[112:112]),
    .jump_reg(out_ref[111:111]),
    .halt_reg(out_ref[110:110]),
    .word_en_reg(out_ref[109:109]),
    .ld_en_reg(out_ref[108:108]),
    .pc_plus2_reg(out_ref[107:92]),
    .read_data1_reg(out_ref[91:76]),
    .read_data2_reg(out_ref[75:60]),
    .sign_extend_reg(out_ref[59:44]),
    .instr_rt_reg(out_ref[43:41]),
    .instr_rd_reg(out_ref[40:38]),
    .rs_reg(out_ref[37:35]),
    .alusrc_b_reg(out_ref[34:34]),
    .aluop_reg(out_ref[33:32]),
    .branch_label_reg(out_ref[31:16]),
    .jump_addr_reg(out_ref[15:0])
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
    seed = 1847576512;
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
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
