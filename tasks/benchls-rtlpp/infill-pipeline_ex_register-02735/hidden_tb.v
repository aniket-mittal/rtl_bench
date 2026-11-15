// Hidden tests: 5000 cycles of seeded random inputs (seed 1067597096); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 90;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [5:0] i_8;
  reg [1:0] i_9;
  reg [1:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [15:0] i_16;
  reg [4:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02735 dut (
    .clk(clk),
    .rst(i_0),
    .enable_CPU(i_1),
    .flush(i_2),
    .rs_inw(i_3),
    .rt_inw(i_4),
    .imm_inw(i_5),
    .write_back_data(i_6),
    .alu_result_back(i_7),
    .alu_op_inw(i_8),
    .rs_forward_inw(i_9),
    .rt_forward_inw(i_10),
    .alu_src_inw(i_11),
    .memory_write_inw(i_12),
    .memory_to_reg_inw(i_13),
    .reg_write_inw(i_14),
    .branch_isc_flag_inw(i_15),
    .pc_next_inw(i_16),
    .write_reg_addr_in_inw(i_17),
    .rd_value(out_dut[89:58]),
    .write_data(out_dut[57:26]),
    .branch_jump_flag(out_dut[25:25]),
    .branch_PC(out_dut[24:24]),
    .branch_addr(out_dut[23:8]),
    .write_reg_addr_out(out_dut[7:3]),
    .memory_write(out_dut[2:2]),
    .memory_to_reg(out_dut[1:1]),
    .reg_write(out_dut[0:0])
  );
  rtlpp_02735__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .enable_CPU(i_1),
    .flush(i_2),
    .rs_inw(i_3),
    .rt_inw(i_4),
    .imm_inw(i_5),
    .write_back_data(i_6),
    .alu_result_back(i_7),
    .alu_op_inw(i_8),
    .rs_forward_inw(i_9),
    .rt_forward_inw(i_10),
    .alu_src_inw(i_11),
    .memory_write_inw(i_12),
    .memory_to_reg_inw(i_13),
    .reg_write_inw(i_14),
    .branch_isc_flag_inw(i_15),
    .pc_next_inw(i_16),
    .write_reg_addr_in_inw(i_17),
    .rd_value(out_ref[89:58]),
    .write_data(out_ref[57:26]),
    .branch_jump_flag(out_ref[25:25]),
    .branch_PC(out_ref[24:24]),
    .branch_addr(out_ref[23:8]),
    .write_reg_addr_out(out_ref[7:3]),
    .memory_write(out_ref[2:2]),
    .memory_to_reg(out_ref[1:1]),
    .reg_write(out_ref[0:0])
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
    seed = 1067597096;
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
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
