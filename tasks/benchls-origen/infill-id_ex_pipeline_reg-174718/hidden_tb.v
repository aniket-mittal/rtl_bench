// Hidden tests: 5000 cycles of seeded random inputs (seed 4223026530); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 148;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [2:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_174718 dut (
    .clk(clk),
    .inc_pc(i_0),
    .read_data_1(i_1),
    .read_data_2(i_2),
    .sign_extended(i_3),
    .rt(i_4),
    .rd(i_5),
    .mem_to_reg(i_6),
    .reg_write(i_7),
    .branch(i_8),
    .mem_read(i_9),
    .mem_write(i_10),
    .reg_dest(i_11),
    .alu_src(i_12),
    .alu_op(i_13),
    .inc_pc_reg(out_dut[147:116]),
    .read_data_1_reg(out_dut[115:84]),
    .read_data_2_reg(out_dut[83:52]),
    .sign_extended_reg(out_dut[51:20]),
    .rt_reg(out_dut[19:15]),
    .rd_reg(out_dut[14:10]),
    .mem_to_reg_reg(out_dut[9:9]),
    .reg_write_reg(out_dut[8:8]),
    .branch_reg(out_dut[7:7]),
    .mem_read_reg(out_dut[6:6]),
    .mem_write_reg(out_dut[5:5]),
    .reg_dest_reg(out_dut[4:4]),
    .alu_src_reg(out_dut[3:3]),
    .alu_op_reg(out_dut[2:0])
  );
  origen_174718__ref ref_i (
    .clk(clk),
    .inc_pc(i_0),
    .read_data_1(i_1),
    .read_data_2(i_2),
    .sign_extended(i_3),
    .rt(i_4),
    .rd(i_5),
    .mem_to_reg(i_6),
    .reg_write(i_7),
    .branch(i_8),
    .mem_read(i_9),
    .mem_write(i_10),
    .reg_dest(i_11),
    .alu_src(i_12),
    .alu_op(i_13),
    .inc_pc_reg(out_ref[147:116]),
    .read_data_1_reg(out_ref[115:84]),
    .read_data_2_reg(out_ref[83:52]),
    .sign_extended_reg(out_ref[51:20]),
    .rt_reg(out_ref[19:15]),
    .rd_reg(out_ref[14:10]),
    .mem_to_reg_reg(out_ref[9:9]),
    .reg_write_reg(out_ref[8:8]),
    .branch_reg(out_ref[7:7]),
    .mem_read_reg(out_ref[6:6]),
    .mem_write_reg(out_ref[5:5]),
    .reg_dest_reg(out_ref[4:4]),
    .alu_src_reg(out_ref[3:3]),
    .alu_op_reg(out_ref[2:0])
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
    seed = 4223026530;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
