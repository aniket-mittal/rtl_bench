// Hidden tests: 5000 cycles of seeded random inputs (seed 3470782288); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 181;
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
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [4:0] i_14;
  reg [31:0] i_15;
  reg [31:0] i_16;
  reg [31:0] i_17;
  reg [3:0] i_18;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_070832 dut (
    .Clk(clk),
    .MemRead_in(i_0),
    .MemWrite_in(i_1),
    .RegWrite_in(i_2),
    .regWrite_jal_in(i_3),
    .MemToReg_in(i_4),
    .HiOrLo_in(i_5),
    .HiLoReg_in(i_6),
    .Add64_in(i_7),
    .HiLoSelect_in(i_8),
    .HiRsSel_in(i_9),
    .WriteHi_in(i_10),
    .WriteLo_in(i_11),
    .ALU_in(i_12),
    .ALU_hi_in(i_13),
    .RtRd_in(i_14),
    .Read1_in(i_15),
    .Read2_in(i_16),
    .PC_in(i_17),
    .MEMop_in(i_18),
    .MemRead_out(out_dut[180:180]),
    .MemWrite_out(out_dut[179:179]),
    .RegWrite_out(out_dut[178:178]),
    .regWrite_jal_out(out_dut[177:177]),
    .MemToReg_out(out_dut[176:176]),
    .HiOrLo_out(out_dut[175:175]),
    .HiLoReg_out(out_dut[174:174]),
    .Add64_out(out_dut[173:173]),
    .HiLoSelect_out(out_dut[172:172]),
    .HiRsSel_out(out_dut[171:171]),
    .WriteHi_out(out_dut[170:170]),
    .WriteLo_out(out_dut[169:169]),
    .ALU_out(out_dut[168:137]),
    .ALU_hi_out(out_dut[136:105]),
    .RtRd_out(out_dut[104:100]),
    .Read1_out(out_dut[99:68]),
    .Read2_out(out_dut[67:36]),
    .PC_out(out_dut[35:4]),
    .MEMop_out(out_dut[3:0])
  );
  origen_070832__ref ref_i (
    .Clk(clk),
    .MemRead_in(i_0),
    .MemWrite_in(i_1),
    .RegWrite_in(i_2),
    .regWrite_jal_in(i_3),
    .MemToReg_in(i_4),
    .HiOrLo_in(i_5),
    .HiLoReg_in(i_6),
    .Add64_in(i_7),
    .HiLoSelect_in(i_8),
    .HiRsSel_in(i_9),
    .WriteHi_in(i_10),
    .WriteLo_in(i_11),
    .ALU_in(i_12),
    .ALU_hi_in(i_13),
    .RtRd_in(i_14),
    .Read1_in(i_15),
    .Read2_in(i_16),
    .PC_in(i_17),
    .MEMop_in(i_18),
    .MemRead_out(out_ref[180:180]),
    .MemWrite_out(out_ref[179:179]),
    .RegWrite_out(out_ref[178:178]),
    .regWrite_jal_out(out_ref[177:177]),
    .MemToReg_out(out_ref[176:176]),
    .HiOrLo_out(out_ref[175:175]),
    .HiLoReg_out(out_ref[174:174]),
    .Add64_out(out_ref[173:173]),
    .HiLoSelect_out(out_ref[172:172]),
    .HiRsSel_out(out_ref[171:171]),
    .WriteHi_out(out_ref[170:170]),
    .WriteLo_out(out_ref[169:169]),
    .ALU_out(out_ref[168:137]),
    .ALU_hi_out(out_ref[136:105]),
    .RtRd_out(out_ref[104:100]),
    .Read1_out(out_ref[99:68]),
    .Read2_out(out_ref[67:36]),
    .PC_out(out_ref[35:4]),
    .MEMop_out(out_ref[3:0])
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
    seed = 3470782288;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
