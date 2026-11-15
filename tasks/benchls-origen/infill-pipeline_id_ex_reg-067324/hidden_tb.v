// Hidden tests: 5000 cycles of seeded random inputs (seed 2213558432); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 146;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [3:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [31:0] i_14;
  reg [4:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_067324 dut (
    .clk(clk),
    .Reset(i_0),
    .PCSrc_in(i_1),
    .RegDst_in(i_2),
    .RegWr_in(i_3),
    .ALUSrc1_in(i_4),
    .ALUSrc2_in(i_5),
    .Sign_in(i_6),
    .MemWr_in(i_7),
    .MemRd_in(i_8),
    .MemToReg_in(i_9),
    .ALUFun_in(i_10),
    .PC4_in(i_11),
    .R1_in(i_12),
    .R2_in(i_13),
    .Imm_in(i_14),
    .RdAdress_in(i_15),
    .PCSrc_out(out_dut[145:145]),
    .RegDst_out(out_dut[144:144]),
    .RegWr_out(out_dut[143:143]),
    .ALUSrc1_out(out_dut[142:142]),
    .ALUSrc2_out(out_dut[141:141]),
    .Sign_out(out_dut[140:140]),
    .MemWr_out(out_dut[139:139]),
    .MemRd_out(out_dut[138:138]),
    .MemToReg_out(out_dut[137:137]),
    .ALUFun_out(out_dut[136:133]),
    .PC4_out(out_dut[132:101]),
    .R1_out(out_dut[100:69]),
    .R2_out(out_dut[68:37]),
    .Imm_out(out_dut[36:5]),
    .RdAdress_out(out_dut[4:0])
  );
  origen_067324__ref ref_i (
    .clk(clk),
    .Reset(i_0),
    .PCSrc_in(i_1),
    .RegDst_in(i_2),
    .RegWr_in(i_3),
    .ALUSrc1_in(i_4),
    .ALUSrc2_in(i_5),
    .Sign_in(i_6),
    .MemWr_in(i_7),
    .MemRd_in(i_8),
    .MemToReg_in(i_9),
    .ALUFun_in(i_10),
    .PC4_in(i_11),
    .R1_in(i_12),
    .R2_in(i_13),
    .Imm_in(i_14),
    .RdAdress_in(i_15),
    .PCSrc_out(out_ref[145:145]),
    .RegDst_out(out_ref[144:144]),
    .RegWr_out(out_ref[143:143]),
    .ALUSrc1_out(out_ref[142:142]),
    .ALUSrc2_out(out_ref[141:141]),
    .Sign_out(out_ref[140:140]),
    .MemWr_out(out_ref[139:139]),
    .MemRd_out(out_ref[138:138]),
    .MemToReg_out(out_ref[137:137]),
    .ALUFun_out(out_ref[136:133]),
    .PC4_out(out_ref[132:101]),
    .R1_out(out_ref[100:69]),
    .R2_out(out_ref[68:37]),
    .Imm_out(out_ref[36:5]),
    .RdAdress_out(out_ref[4:0])
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
    seed = 2213558432;
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
