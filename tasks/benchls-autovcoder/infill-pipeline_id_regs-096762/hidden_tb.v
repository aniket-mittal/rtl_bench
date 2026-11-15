// Hidden tests: 5000 cycles of seeded random inputs (seed 1826920967); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 152;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [3:0] i_7;
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
  reg [4:0] i_20;
  reg [0:0] i_21;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_096762 dut (
    .clk(clk),
    .clr(i_0),
    .newPC(i_1),
    .busA(i_2),
    .busB(i_3),
    .Inst(i_4),
    .ExtOp(i_5),
    .ALUSrc(i_6),
    .ALUop(i_7),
    .RegDst(i_8),
    .MemWr(i_9),
    .RegWr(i_10),
    .RegWr_4(i_11),
    .RegWr_3(i_12),
    .RegWr_2(i_13),
    .RegWr_1(i_14),
    .MemtoReg(i_15),
    .Branch(i_16),
    .Jump(i_17),
    .l_r(i_18),
    .lorr(i_19),
    .shift(i_20),
    .OVSel(i_21),
    .newPC_f(out_dut[151:120]),
    .busA_f(out_dut[119:88]),
    .busB_f(out_dut[87:56]),
    .Inst_f(out_dut[55:24]),
    .ExtOp_f(out_dut[23:23]),
    .ALUSrc_f(out_dut[22:22]),
    .ALUop_f(out_dut[21:18]),
    .RegDst_f(out_dut[17:17]),
    .MemWr_f(out_dut[16:16]),
    .RegWr_f(out_dut[15:15]),
    .RegWr_4f(out_dut[14:14]),
    .RegWr_3f(out_dut[13:13]),
    .RegWr_2f(out_dut[12:12]),
    .RegWr_1f(out_dut[11:11]),
    .MemtoReg_f(out_dut[10:10]),
    .Branch_f(out_dut[9:9]),
    .Jump_f(out_dut[8:8]),
    .l_rf(out_dut[7:7]),
    .lorr_f(out_dut[6:6]),
    .shift_f(out_dut[5:1]),
    .OVSel_f(out_dut[0:0])
  );
  autovcoder_096762__ref ref_i (
    .clk(clk),
    .clr(i_0),
    .newPC(i_1),
    .busA(i_2),
    .busB(i_3),
    .Inst(i_4),
    .ExtOp(i_5),
    .ALUSrc(i_6),
    .ALUop(i_7),
    .RegDst(i_8),
    .MemWr(i_9),
    .RegWr(i_10),
    .RegWr_4(i_11),
    .RegWr_3(i_12),
    .RegWr_2(i_13),
    .RegWr_1(i_14),
    .MemtoReg(i_15),
    .Branch(i_16),
    .Jump(i_17),
    .l_r(i_18),
    .lorr(i_19),
    .shift(i_20),
    .OVSel(i_21),
    .newPC_f(out_ref[151:120]),
    .busA_f(out_ref[119:88]),
    .busB_f(out_ref[87:56]),
    .Inst_f(out_ref[55:24]),
    .ExtOp_f(out_ref[23:23]),
    .ALUSrc_f(out_ref[22:22]),
    .ALUop_f(out_ref[21:18]),
    .RegDst_f(out_ref[17:17]),
    .MemWr_f(out_ref[16:16]),
    .RegWr_f(out_ref[15:15]),
    .RegWr_4f(out_ref[14:14]),
    .RegWr_3f(out_ref[13:13]),
    .RegWr_2f(out_ref[12:12]),
    .RegWr_1f(out_ref[11:11]),
    .MemtoReg_f(out_ref[10:10]),
    .Branch_f(out_ref[9:9]),
    .Jump_f(out_ref[8:8]),
    .l_rf(out_ref[7:7]),
    .lorr_f(out_ref[6:6]),
    .shift_f(out_ref[5:1]),
    .OVSel_f(out_ref[0:0])
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
    seed = 1826920967;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
