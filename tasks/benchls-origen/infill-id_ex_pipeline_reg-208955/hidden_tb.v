// Hidden tests: 5000 cycles of seeded random inputs (seed 3259527428); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 147;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [1:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [4:0] i_12;
  reg [4:0] i_13;
  reg [0:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_208955 dut (
    .clk(clk),
    .RegWrite_in(i_0),
    .MemtoReg_in(i_1),
    .Branch_in(i_2),
    .MemRead_in(i_3),
    .MemWrite_in(i_4),
    .ALUSrc_in(i_5),
    .RegDst_in(i_6),
    .ALUop_in(i_7),
    .PC_4_in(i_8),
    .Read_Data_1_in(i_9),
    .Read_Data_2_in(i_10),
    .SignExtend_in(i_11),
    .Rt_in(i_12),
    .Rd_in(i_13),
    .rst(i_14),
    .RegWrite_out(out_dut[146:146]),
    .MemtoReg_out(out_dut[145:145]),
    .Branch_out(out_dut[144:144]),
    .MemRead_out(out_dut[143:143]),
    .MemWrite_out(out_dut[142:142]),
    .ALUSrc_out(out_dut[141:141]),
    .RegDst_out(out_dut[140:140]),
    .ALUop_out(out_dut[139:138]),
    .PC_4_out(out_dut[137:106]),
    .Read_Data_1_out(out_dut[105:74]),
    .Read_Data_2_out(out_dut[73:42]),
    .SignExtend_out(out_dut[41:10]),
    .Rt_out(out_dut[9:5]),
    .Rd_out(out_dut[4:0])
  );
  origen_208955__ref ref_i (
    .clk(clk),
    .RegWrite_in(i_0),
    .MemtoReg_in(i_1),
    .Branch_in(i_2),
    .MemRead_in(i_3),
    .MemWrite_in(i_4),
    .ALUSrc_in(i_5),
    .RegDst_in(i_6),
    .ALUop_in(i_7),
    .PC_4_in(i_8),
    .Read_Data_1_in(i_9),
    .Read_Data_2_in(i_10),
    .SignExtend_in(i_11),
    .Rt_in(i_12),
    .Rd_in(i_13),
    .rst(i_14),
    .RegWrite_out(out_ref[146:146]),
    .MemtoReg_out(out_ref[145:145]),
    .Branch_out(out_ref[144:144]),
    .MemRead_out(out_ref[143:143]),
    .MemWrite_out(out_ref[142:142]),
    .ALUSrc_out(out_ref[141:141]),
    .RegDst_out(out_ref[140:140]),
    .ALUop_out(out_ref[139:138]),
    .PC_4_out(out_ref[137:106]),
    .Read_Data_1_out(out_ref[105:74]),
    .Read_Data_2_out(out_ref[73:42]),
    .SignExtend_out(out_ref[41:10]),
    .Rt_out(out_ref[9:5]),
    .Rd_out(out_ref[4:0])
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
    seed = 3259527428;
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
      i_14 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
