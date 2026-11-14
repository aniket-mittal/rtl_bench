// Hidden tests: 5000 cycles of seeded random inputs (seed 1587218428); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 32;
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
  reg [1:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [4:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [4:0] i_21;
  reg [4:0] i_22;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  dut dut (
    .i_cnt_en(i_0),
    .i_rdata0(i_1),
    .i_rdata1(i_2),
    .i_trap(i_3),
    .i_mret(i_4),
    .i_mepc(i_5),
    .i_mtval_pc(i_6),
    .i_bufreg_q(i_7),
    .i_bad_pc(i_8),
    .i_csr_en(i_9),
    .i_csr_addr(i_10),
    .i_csr(i_11),
    .i_rd_wen(i_12),
    .i_rd_waddr(i_13),
    .i_ctrl_rd(i_14),
    .i_alu_rd(i_15),
    .i_rd_alu_en(i_16),
    .i_csr_rd(i_17),
    .i_rd_csr_en(i_18),
    .i_mem_rd(i_19),
    .i_rd_mem_en(i_20),
    .i_rs1_raddr(i_21),
    .i_rs2_raddr(i_22),
    .o_wreg0(out_dut[31:26]),
    .o_wreg1(out_dut[25:20]),
    .o_wen0(out_dut[19:19]),
    .o_wen1(out_dut[18:18]),
    .o_wdata0(out_dut[17:17]),
    .o_wdata1(out_dut[16:16]),
    .o_rreg0(out_dut[15:10]),
    .o_rreg1(out_dut[9:4]),
    .o_csr_pc(out_dut[3:3]),
    .o_csr(out_dut[2:2]),
    .o_rs1(out_dut[1:1]),
    .o_rs2(out_dut[0:0])
  );
  dut__ref ref_i (
    .i_cnt_en(i_0),
    .i_rdata0(i_1),
    .i_rdata1(i_2),
    .i_trap(i_3),
    .i_mret(i_4),
    .i_mepc(i_5),
    .i_mtval_pc(i_6),
    .i_bufreg_q(i_7),
    .i_bad_pc(i_8),
    .i_csr_en(i_9),
    .i_csr_addr(i_10),
    .i_csr(i_11),
    .i_rd_wen(i_12),
    .i_rd_waddr(i_13),
    .i_ctrl_rd(i_14),
    .i_alu_rd(i_15),
    .i_rd_alu_en(i_16),
    .i_csr_rd(i_17),
    .i_rd_csr_en(i_18),
    .i_mem_rd(i_19),
    .i_rd_mem_en(i_20),
    .i_rs1_raddr(i_21),
    .i_rs2_raddr(i_22),
    .o_wreg0(out_ref[31:26]),
    .o_wreg1(out_ref[25:20]),
    .o_wen0(out_ref[19:19]),
    .o_wen1(out_ref[18:18]),
    .o_wdata0(out_ref[17:17]),
    .o_wdata1(out_ref[16:16]),
    .o_rreg0(out_ref[15:10]),
    .o_rreg1(out_ref[9:4]),
    .o_csr_pc(out_ref[3:3]),
    .o_csr(out_ref[2:2]),
    .o_rs1(out_ref[1:1]),
    .o_rs2(out_ref[0:0])
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
    seed = 1587218428;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
