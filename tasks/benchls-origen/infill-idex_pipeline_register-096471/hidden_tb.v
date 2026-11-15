// Hidden tests: 5000 cycles of seeded random inputs (seed 2312108029); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 159;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [2:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [31:0] i_15;
  reg [31:0] i_16;
  reg [31:0] i_17;
  reg [31:0] i_18;
  reg [4:0] i_19;
  reg [4:0] i_20;
  reg [4:0] i_21;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_096471 dut (
    .clk(clk),
    .rst(i_0),
    .mem_to_reg_in(i_1),
    .mem_write_in(i_2),
    .mem_read_in(i_3),
    .reg_write_in(i_4),
    .reg_dst_in(i_5),
    .alu_src_in(i_6),
    .alu_op_in(i_7),
    .Rtype_in(i_8),
    .lw_in(i_9),
    .sw_in(i_10),
    .j_in(i_11),
    .beq_in(i_12),
    .bne_in(i_13),
    .nop_in(i_14),
    .pc_plus4_in(i_15),
    .read_data1_in(i_16),
    .read_data2_in(i_17),
    .address_in(i_18),
    .rs_in(i_19),
    .rt_in(i_20),
    .rd_in(i_21),
    .mem_to_reg_out(out_dut[158:158]),
    .mem_write_out(out_dut[157:157]),
    .mem_read_out(out_dut[156:156]),
    .reg_write_out(out_dut[155:155]),
    .reg_dst_out(out_dut[154:154]),
    .alu_src_out(out_dut[153:153]),
    .alu_op_out(out_dut[152:150]),
    .Rtype_out(out_dut[149:149]),
    .lw_out(out_dut[148:148]),
    .sw_out(out_dut[147:147]),
    .j_out(out_dut[146:146]),
    .beq_out(out_dut[145:145]),
    .bne_out(out_dut[144:144]),
    .nop_out(out_dut[143:143]),
    .pc_plus4_out(out_dut[142:111]),
    .read_data1_out(out_dut[110:79]),
    .read_data2_out(out_dut[78:47]),
    .address_out(out_dut[46:15]),
    .rs_out(out_dut[14:10]),
    .rt_out(out_dut[9:5]),
    .rd_out(out_dut[4:0])
  );
  origen_096471__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .mem_to_reg_in(i_1),
    .mem_write_in(i_2),
    .mem_read_in(i_3),
    .reg_write_in(i_4),
    .reg_dst_in(i_5),
    .alu_src_in(i_6),
    .alu_op_in(i_7),
    .Rtype_in(i_8),
    .lw_in(i_9),
    .sw_in(i_10),
    .j_in(i_11),
    .beq_in(i_12),
    .bne_in(i_13),
    .nop_in(i_14),
    .pc_plus4_in(i_15),
    .read_data1_in(i_16),
    .read_data2_in(i_17),
    .address_in(i_18),
    .rs_in(i_19),
    .rt_in(i_20),
    .rd_in(i_21),
    .mem_to_reg_out(out_ref[158:158]),
    .mem_write_out(out_ref[157:157]),
    .mem_read_out(out_ref[156:156]),
    .reg_write_out(out_ref[155:155]),
    .reg_dst_out(out_ref[154:154]),
    .alu_src_out(out_ref[153:153]),
    .alu_op_out(out_ref[152:150]),
    .Rtype_out(out_ref[149:149]),
    .lw_out(out_ref[148:148]),
    .sw_out(out_ref[147:147]),
    .j_out(out_ref[146:146]),
    .beq_out(out_ref[145:145]),
    .bne_out(out_ref[144:144]),
    .nop_out(out_ref[143:143]),
    .pc_plus4_out(out_ref[142:111]),
    .read_data1_out(out_ref[110:79]),
    .read_data2_out(out_ref[78:47]),
    .address_out(out_ref[46:15]),
    .rs_out(out_ref[14:10]),
    .rt_out(out_ref[9:5]),
    .rd_out(out_ref[4:0])
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
    seed = 2312108029;
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
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
