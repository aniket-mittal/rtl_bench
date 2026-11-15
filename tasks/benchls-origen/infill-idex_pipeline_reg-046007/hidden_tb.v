// Hidden tests: 5000 cycles of seeded random inputs (seed 1118389076); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 153;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [4:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [3:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [1:0] i_12;
  reg [0:0] i_13;
  reg [4:0] i_14;
  reg [4:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_046007 dut (
    .clk(clk),
    .rst(i_0),
    .Flush(i_1),
    .Freeze(i_2),
    .Dest_in(i_3),
    .Val1_in(i_4),
    .Val2_in(i_5),
    .Reg2_in(i_6),
    .PC_in(i_7),
    .EXE_CMD_in(i_8),
    .MEM_R_EN_in(i_9),
    .MEM_W_EN_in(i_10),
    .WB_EN_in(i_11),
    .Branch_Type_in(i_12),
    .is_imm_in(i_13),
    .src1_in(i_14),
    .src2_in(i_15),
    .Dest(out_dut[152:148]),
    .Val1(out_dut[147:116]),
    .Val2(out_dut[115:84]),
    .Reg2(out_dut[83:52]),
    .PC(out_dut[51:20]),
    .EXE_CMD(out_dut[19:16]),
    .MEM_R_EN(out_dut[15:15]),
    .MEM_W_EN(out_dut[14:14]),
    .WB_EN(out_dut[13:13]),
    .Branch_Type(out_dut[12:11]),
    .is_imm(out_dut[10:10]),
    .src1(out_dut[9:5]),
    .src2(out_dut[4:0])
  );
  origen_046007__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .Flush(i_1),
    .Freeze(i_2),
    .Dest_in(i_3),
    .Val1_in(i_4),
    .Val2_in(i_5),
    .Reg2_in(i_6),
    .PC_in(i_7),
    .EXE_CMD_in(i_8),
    .MEM_R_EN_in(i_9),
    .MEM_W_EN_in(i_10),
    .WB_EN_in(i_11),
    .Branch_Type_in(i_12),
    .is_imm_in(i_13),
    .src1_in(i_14),
    .src2_in(i_15),
    .Dest(out_ref[152:148]),
    .Val1(out_ref[147:116]),
    .Val2(out_ref[115:84]),
    .Reg2(out_ref[83:52]),
    .PC(out_ref[51:20]),
    .EXE_CMD(out_ref[19:16]),
    .MEM_R_EN(out_ref[15:15]),
    .MEM_W_EN(out_ref[14:14]),
    .WB_EN(out_ref[13:13]),
    .Branch_Type(out_ref[12:11]),
    .is_imm(out_ref[10:10]),
    .src1(out_ref[9:5]),
    .src2(out_ref[4:0])
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
    seed = 1118389076;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
