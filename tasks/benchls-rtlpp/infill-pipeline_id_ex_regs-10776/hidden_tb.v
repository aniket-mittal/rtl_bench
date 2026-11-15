// Hidden tests: 5000 cycles of seeded random inputs (seed 666633887); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 180;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [4:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [4:0] i_21;
  reg [4:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [31:0] i_28;
  reg [0:0] i_29;
  reg [0:0] i_30;
  reg [0:0] i_31;
  reg [0:0] i_32;
  reg [0:0] i_33;
  reg [31:0] i_34;
  reg [31:0] i_35;
  reg [16:0] i_36;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_10776 dut (
    .clock(clk),
    .reset(i_0),
    .ID_Flush(i_1),
    .ID_Stall(i_2),
    .EX_Stall(i_3),
    .ID_Link(i_4),
    .ID_RegDst(i_5),
    .ID_ALUSrcImm(i_6),
    .ID_ALUOp(i_7),
    .ID_Movn(i_8),
    .ID_Movz(i_9),
    .ID_LLSC(i_10),
    .ID_MemRead(i_11),
    .ID_MemWrite(i_12),
    .ID_MemByte(i_13),
    .ID_MemHalf(i_14),
    .ID_MemSignExtend(i_15),
    .ID_Left(i_16),
    .ID_Right(i_17),
    .ID_RegWrite(i_18),
    .ID_MemtoReg(i_19),
    .ID_ReverseEndian(i_20),
    .ID_Rs(i_21),
    .ID_Rt(i_22),
    .ID_WantRsByEX(i_23),
    .ID_NeedRsByEX(i_24),
    .ID_WantRtByEX(i_25),
    .ID_NeedRtByEX(i_26),
    .ID_KernelMode(i_27),
    .ID_RestartPC(i_28),
    .ID_IsBDS(i_29),
    .ID_Trap(i_30),
    .ID_TrapCond(i_31),
    .ID_EX_CanErr(i_32),
    .ID_M_CanErr(i_33),
    .ID_ReadData1(i_34),
    .ID_ReadData2(i_35),
    .ID_SignExtImm(i_36),
    .EX_Link(out_dut[179:179]),
    .EX_LinkRegDst(out_dut[178:177]),
    .EX_ALUSrcImm(out_dut[176:176]),
    .EX_ALUOp(out_dut[175:171]),
    .EX_Movn(out_dut[170:170]),
    .EX_Movz(out_dut[169:169]),
    .EX_LLSC(out_dut[168:168]),
    .EX_MemRead(out_dut[167:167]),
    .EX_MemWrite(out_dut[166:166]),
    .EX_MemByte(out_dut[165:165]),
    .EX_MemHalf(out_dut[164:164]),
    .EX_MemSignExtend(out_dut[163:163]),
    .EX_Left(out_dut[162:162]),
    .EX_Right(out_dut[161:161]),
    .EX_RegWrite(out_dut[160:160]),
    .EX_MemtoReg(out_dut[159:159]),
    .EX_ReverseEndian(out_dut[158:158]),
    .EX_Rs(out_dut[157:153]),
    .EX_Rt(out_dut[152:148]),
    .EX_WantRsByEX(out_dut[147:147]),
    .EX_NeedRsByEX(out_dut[146:146]),
    .EX_WantRtByEX(out_dut[145:145]),
    .EX_NeedRtByEX(out_dut[144:144]),
    .EX_KernelMode(out_dut[143:143]),
    .EX_RestartPC(out_dut[142:111]),
    .EX_IsBDS(out_dut[110:110]),
    .EX_Trap(out_dut[109:109]),
    .EX_TrapCond(out_dut[108:108]),
    .EX_EX_CanErr(out_dut[107:107]),
    .EX_M_CanErr(out_dut[106:106]),
    .EX_ReadData1(out_dut[105:74]),
    .EX_ReadData2(out_dut[73:42]),
    .EX_SignExtImm(out_dut[41:10]),
    .EX_Rd(out_dut[9:5]),
    .EX_Shamt(out_dut[4:0])
  );
  rtlpp_10776__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .ID_Flush(i_1),
    .ID_Stall(i_2),
    .EX_Stall(i_3),
    .ID_Link(i_4),
    .ID_RegDst(i_5),
    .ID_ALUSrcImm(i_6),
    .ID_ALUOp(i_7),
    .ID_Movn(i_8),
    .ID_Movz(i_9),
    .ID_LLSC(i_10),
    .ID_MemRead(i_11),
    .ID_MemWrite(i_12),
    .ID_MemByte(i_13),
    .ID_MemHalf(i_14),
    .ID_MemSignExtend(i_15),
    .ID_Left(i_16),
    .ID_Right(i_17),
    .ID_RegWrite(i_18),
    .ID_MemtoReg(i_19),
    .ID_ReverseEndian(i_20),
    .ID_Rs(i_21),
    .ID_Rt(i_22),
    .ID_WantRsByEX(i_23),
    .ID_NeedRsByEX(i_24),
    .ID_WantRtByEX(i_25),
    .ID_NeedRtByEX(i_26),
    .ID_KernelMode(i_27),
    .ID_RestartPC(i_28),
    .ID_IsBDS(i_29),
    .ID_Trap(i_30),
    .ID_TrapCond(i_31),
    .ID_EX_CanErr(i_32),
    .ID_M_CanErr(i_33),
    .ID_ReadData1(i_34),
    .ID_ReadData2(i_35),
    .ID_SignExtImm(i_36),
    .EX_Link(out_ref[179:179]),
    .EX_LinkRegDst(out_ref[178:177]),
    .EX_ALUSrcImm(out_ref[176:176]),
    .EX_ALUOp(out_ref[175:171]),
    .EX_Movn(out_ref[170:170]),
    .EX_Movz(out_ref[169:169]),
    .EX_LLSC(out_ref[168:168]),
    .EX_MemRead(out_ref[167:167]),
    .EX_MemWrite(out_ref[166:166]),
    .EX_MemByte(out_ref[165:165]),
    .EX_MemHalf(out_ref[164:164]),
    .EX_MemSignExtend(out_ref[163:163]),
    .EX_Left(out_ref[162:162]),
    .EX_Right(out_ref[161:161]),
    .EX_RegWrite(out_ref[160:160]),
    .EX_MemtoReg(out_ref[159:159]),
    .EX_ReverseEndian(out_ref[158:158]),
    .EX_Rs(out_ref[157:153]),
    .EX_Rt(out_ref[152:148]),
    .EX_WantRsByEX(out_ref[147:147]),
    .EX_NeedRsByEX(out_ref[146:146]),
    .EX_WantRtByEX(out_ref[145:145]),
    .EX_NeedRtByEX(out_ref[144:144]),
    .EX_KernelMode(out_ref[143:143]),
    .EX_RestartPC(out_ref[142:111]),
    .EX_IsBDS(out_ref[110:110]),
    .EX_Trap(out_ref[109:109]),
    .EX_TrapCond(out_ref[108:108]),
    .EX_EX_CanErr(out_ref[107:107]),
    .EX_M_CanErr(out_ref[106:106]),
    .EX_ReadData1(out_ref[105:74]),
    .EX_ReadData2(out_ref[73:42]),
    .EX_SignExtImm(out_ref[41:10]),
    .EX_Rd(out_ref[9:5]),
    .EX_Shamt(out_ref[4:0])
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
    seed = 666633887;
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
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed)};
      i_36 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
