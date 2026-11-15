// Hidden tests: 5000 cycles of seeded random inputs (seed 1025737768); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 204;
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
  reg [3:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [31:0] i_14;
  reg [31:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_168584 dut (
    .clk_i(clk),
    .rst_n(i_0),
    .MemtoReg_i(i_1),
    .MemRead_i(i_2),
    .MemWrite_i(i_3),
    .Branch_i(i_4),
    .RegWrite_i(i_5),
    .BranchType_i(i_6),
    .RegDst_i(i_7),
    .ALUSrc_i(i_8),
    .ALUOP_i(i_9),
    .program_suppose_i(i_10),
    .readData1_i(i_11),
    .readData2_i(i_12),
    .instance_signExtend_i(i_13),
    .instance_zeroFilled_i(i_14),
    .instruction_i(i_15),
    .MemtoReg_o(out_dut[203:203]),
    .MemRead_o(out_dut[202:202]),
    .MemWrite_o(out_dut[201:201]),
    .Branch_o(out_dut[200:200]),
    .RegWrite_o(out_dut[199:199]),
    .BranchType_o(out_dut[198:198]),
    .RegDst_o(out_dut[197:197]),
    .ALUSrc_o(out_dut[196:196]),
    .ALUOP_o(out_dut[195:192]),
    .program_suppose_o(out_dut[191:160]),
    .readData1_o(out_dut[159:128]),
    .readData2_o(out_dut[127:96]),
    .instance_signExtend_o(out_dut[95:64]),
    .instance_zeroFilled_o(out_dut[63:32]),
    .instruction_o(out_dut[31:0])
  );
  origen_168584__ref ref_i (
    .clk_i(clk),
    .rst_n(i_0),
    .MemtoReg_i(i_1),
    .MemRead_i(i_2),
    .MemWrite_i(i_3),
    .Branch_i(i_4),
    .RegWrite_i(i_5),
    .BranchType_i(i_6),
    .RegDst_i(i_7),
    .ALUSrc_i(i_8),
    .ALUOP_i(i_9),
    .program_suppose_i(i_10),
    .readData1_i(i_11),
    .readData2_i(i_12),
    .instance_signExtend_i(i_13),
    .instance_zeroFilled_i(i_14),
    .instruction_i(i_15),
    .MemtoReg_o(out_ref[203:203]),
    .MemRead_o(out_ref[202:202]),
    .MemWrite_o(out_ref[201:201]),
    .Branch_o(out_ref[200:200]),
    .RegWrite_o(out_ref[199:199]),
    .BranchType_o(out_ref[198:198]),
    .RegDst_o(out_ref[197:197]),
    .ALUSrc_o(out_ref[196:196]),
    .ALUOP_o(out_ref[195:192]),
    .program_suppose_o(out_ref[191:160]),
    .readData1_o(out_ref[159:128]),
    .readData2_o(out_ref[127:96]),
    .instance_signExtend_o(out_ref[95:64]),
    .instance_zeroFilled_o(out_ref[63:32]),
    .instruction_o(out_ref[31:0])
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
    seed = 1025737768;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
