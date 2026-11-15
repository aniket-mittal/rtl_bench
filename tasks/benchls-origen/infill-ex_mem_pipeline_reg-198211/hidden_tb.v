// Hidden tests: 5000 cycles of seeded random inputs (seed 3181089578); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 140;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [4:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_198211 dut (
    .clk(clk),
    .pc_value(i_0),
    .pc_plus_imm(i_1),
    .alu_result(i_2),
    .rd2(i_3),
    .rd(i_4),
    .mem_read(i_5),
    .mem_write(i_6),
    .memToReg(i_7),
    .branch(i_8),
    .reg_write(i_9),
    .zero(i_10),
    .flush(i_11),
    .prediction(i_12),
    .pc_value_reg(out_dut[139:108]),
    .pc_plus_imm_reg(out_dut[107:76]),
    .alu_result_reg(out_dut[75:44]),
    .rd2_reg(out_dut[43:12]),
    .rd_reg(out_dut[11:7]),
    .mem_read_reg(out_dut[6:6]),
    .mem_write_reg(out_dut[5:5]),
    .memToReg_reg(out_dut[4:4]),
    .branch_reg(out_dut[3:3]),
    .reg_write_reg(out_dut[2:2]),
    .zero_reg(out_dut[1:1]),
    .prediction_reg(out_dut[0:0])
  );
  origen_198211__ref ref_i (
    .clk(clk),
    .pc_value(i_0),
    .pc_plus_imm(i_1),
    .alu_result(i_2),
    .rd2(i_3),
    .rd(i_4),
    .mem_read(i_5),
    .mem_write(i_6),
    .memToReg(i_7),
    .branch(i_8),
    .reg_write(i_9),
    .zero(i_10),
    .flush(i_11),
    .prediction(i_12),
    .pc_value_reg(out_ref[139:108]),
    .pc_plus_imm_reg(out_ref[107:76]),
    .alu_result_reg(out_ref[75:44]),
    .rd2_reg(out_ref[43:12]),
    .rd_reg(out_ref[11:7]),
    .mem_read_reg(out_ref[6:6]),
    .mem_write_reg(out_ref[5:5]),
    .memToReg_reg(out_ref[4:4]),
    .branch_reg(out_ref[3:3]),
    .reg_write_reg(out_ref[2:2]),
    .zero_reg(out_ref[1:1]),
    .prediction_reg(out_ref[0:0])
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
    seed = 3181089578;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
