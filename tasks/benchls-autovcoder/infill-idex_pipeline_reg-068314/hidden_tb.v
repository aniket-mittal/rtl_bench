// Hidden tests: 5000 cycles of seeded random inputs (seed 3214888235); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 161;
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
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [6:0] i_13;
  reg [2:0] i_14;
  reg [4:0] i_15;
  reg [4:0] i_16;
  reg [4:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_068314 dut (
    .clk(clk),
    .reset(i_0),
    .write(i_1),
    .RegWrite_in(i_2),
    .MemtoReg_in(i_3),
    .MemRead_in(i_4),
    .MemWrite_in(i_5),
    .ALUSrc_in(i_6),
    .Branch_in(i_7),
    .ALUop_in(i_8),
    .pc_in(i_9),
    .ALU_A_in(i_10),
    .ALU_B_in(i_11),
    .imm_in(i_12),
    .funct7_in(i_13),
    .funct3_in(i_14),
    .rs1_in(i_15),
    .rs2_in(i_16),
    .rd_in(i_17),
    .RegWrite_out(out_dut[160:160]),
    .MemtoReg_out(out_dut[159:159]),
    .MemRead_out(out_dut[158:158]),
    .MemWrite_out(out_dut[157:157]),
    .ALUSrc_out(out_dut[156:156]),
    .Branch_out(out_dut[155:155]),
    .ALUop_out(out_dut[154:153]),
    .pc_out(out_dut[152:121]),
    .ALU_A_out(out_dut[120:89]),
    .ALU_B_out(out_dut[88:57]),
    .imm_out(out_dut[56:25]),
    .funct7_out(out_dut[24:18]),
    .funct3_out(out_dut[17:15]),
    .rs1_out(out_dut[14:10]),
    .rs2_out(out_dut[9:5]),
    .rd_out(out_dut[4:0])
  );
  autovcoder_068314__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .write(i_1),
    .RegWrite_in(i_2),
    .MemtoReg_in(i_3),
    .MemRead_in(i_4),
    .MemWrite_in(i_5),
    .ALUSrc_in(i_6),
    .Branch_in(i_7),
    .ALUop_in(i_8),
    .pc_in(i_9),
    .ALU_A_in(i_10),
    .ALU_B_in(i_11),
    .imm_in(i_12),
    .funct7_in(i_13),
    .funct3_in(i_14),
    .rs1_in(i_15),
    .rs2_in(i_16),
    .rd_in(i_17),
    .RegWrite_out(out_ref[160:160]),
    .MemtoReg_out(out_ref[159:159]),
    .MemRead_out(out_ref[158:158]),
    .MemWrite_out(out_ref[157:157]),
    .ALUSrc_out(out_ref[156:156]),
    .Branch_out(out_ref[155:155]),
    .ALUop_out(out_ref[154:153]),
    .pc_out(out_ref[152:121]),
    .ALU_A_out(out_ref[120:89]),
    .ALU_B_out(out_ref[88:57]),
    .imm_out(out_ref[56:25]),
    .funct7_out(out_ref[24:18]),
    .funct3_out(out_ref[17:15]),
    .rs1_out(out_ref[14:10]),
    .rs2_out(out_ref[9:5]),
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
    seed = 3214888235;
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
