// Hidden tests: 5000 cycles of seeded random inputs (seed 2392224070); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 191;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [1:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [4:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [31:0] i_16;
  reg [4:0] i_17;
  reg [4:0] i_18;
  reg [4:0] i_19;
  reg [31:0] i_20;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_158808 dut (
    .clk(clk),
    .rst(i_0),
    .stall(i_1),
    .id_inst(i_2),
    .id_RFRD1(i_3),
    .id_RFRD2(i_4),
    .id_RegDst(i_5),
    .id_MemRead(i_6),
    .id_MemtoReg(i_7),
    .id_ALUOp(i_8),
    .id_MemWrite(i_9),
    .id_ALUSrc(i_10),
    .id_RegWrite(i_11),
    .id_ShiftIndex(i_12),
    .id_ShiftDirection(i_13),
    .id_ALUasrc(i_14),
    .id_call(i_15),
    .id_EXTOUT(i_16),
    .id_RegisterRd(i_17),
    .id_RegisterRs(i_18),
    .id_RegisterRt(i_19),
    .id_pcplus4(i_20),
    .exe_imm32(out_dut[190:159]),
    .exe_inst(out_dut[158:127]),
    .exe_RFRD1(out_dut[126:95]),
    .exe_RFRD2(out_dut[94:63]),
    .exe_RegDst(out_dut[62:62]),
    .exe_MemRead(out_dut[61:61]),
    .exe_MemtoReg(out_dut[60:60]),
    .exe_ALUOp(out_dut[59:58]),
    .exe_MemWrite(out_dut[57:57]),
    .exe_ALUSrc(out_dut[56:56]),
    .exe_RegWrite(out_dut[55:55]),
    .exe_ShiftIndex(out_dut[54:50]),
    .exe_ShiftDirection(out_dut[49:49]),
    .exe_ALUasrc(out_dut[48:48]),
    .exe_call(out_dut[47:47]),
    .exe_RegisterRd(out_dut[46:42]),
    .exe_RegisterRs(out_dut[41:37]),
    .exe_RegisterRt(out_dut[36:32]),
    .exe_pcplus4(out_dut[31:0])
  );
  origen_158808__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .stall(i_1),
    .id_inst(i_2),
    .id_RFRD1(i_3),
    .id_RFRD2(i_4),
    .id_RegDst(i_5),
    .id_MemRead(i_6),
    .id_MemtoReg(i_7),
    .id_ALUOp(i_8),
    .id_MemWrite(i_9),
    .id_ALUSrc(i_10),
    .id_RegWrite(i_11),
    .id_ShiftIndex(i_12),
    .id_ShiftDirection(i_13),
    .id_ALUasrc(i_14),
    .id_call(i_15),
    .id_EXTOUT(i_16),
    .id_RegisterRd(i_17),
    .id_RegisterRs(i_18),
    .id_RegisterRt(i_19),
    .id_pcplus4(i_20),
    .exe_imm32(out_ref[190:159]),
    .exe_inst(out_ref[158:127]),
    .exe_RFRD1(out_ref[126:95]),
    .exe_RFRD2(out_ref[94:63]),
    .exe_RegDst(out_ref[62:62]),
    .exe_MemRead(out_ref[61:61]),
    .exe_MemtoReg(out_ref[60:60]),
    .exe_ALUOp(out_ref[59:58]),
    .exe_MemWrite(out_ref[57:57]),
    .exe_ALUSrc(out_ref[56:56]),
    .exe_RegWrite(out_ref[55:55]),
    .exe_ShiftIndex(out_ref[54:50]),
    .exe_ShiftDirection(out_ref[49:49]),
    .exe_ALUasrc(out_ref[48:48]),
    .exe_call(out_ref[47:47]),
    .exe_RegisterRd(out_ref[46:42]),
    .exe_RegisterRs(out_ref[41:37]),
    .exe_RegisterRt(out_ref[36:32]),
    .exe_pcplus4(out_ref[31:0])
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
    seed = 2392224070;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
