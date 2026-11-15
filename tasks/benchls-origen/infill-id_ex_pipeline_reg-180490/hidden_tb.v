// Hidden tests: 5000 cycles of seeded random inputs (seed 556538586); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 154;
  reg clk;
  reg [0:0] i_0;
  reg [1:0] i_1;
  reg [1:0] i_2;
  reg [6:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [4:0] i_6;
  reg [4:0] i_7;
  reg [4:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_180490 dut (
    .clk(clk),
    .Reset(i_0),
    .WB(i_1),
    .Mem(i_2),
    .EX(i_3),
    .PC_id(i_4),
    .Imm_id(i_5),
    .rdAddr_id(i_6),
    .rs1Addr_id(i_7),
    .rs2Addr_id(i_8),
    .rs1Data_id(i_9),
    .rs2Data_id(i_10),
    .WB_out_ID_EX(out_dut[153:152]),
    .Mem_out_ID_EX(out_dut[151:150]),
    .EX_out(out_dut[149:143]),
    .PC_ex(out_dut[142:111]),
    .Imm_ex(out_dut[110:79]),
    .rdAddr_ex(out_dut[78:74]),
    .rs1Addr_ex(out_dut[73:69]),
    .rs2Addr_ex(out_dut[68:64]),
    .rs1Data_ex(out_dut[63:32]),
    .rs2Data_ex(out_dut[31:0])
  );
  origen_180490__ref ref_i (
    .clk(clk),
    .Reset(i_0),
    .WB(i_1),
    .Mem(i_2),
    .EX(i_3),
    .PC_id(i_4),
    .Imm_id(i_5),
    .rdAddr_id(i_6),
    .rs1Addr_id(i_7),
    .rs2Addr_id(i_8),
    .rs1Data_id(i_9),
    .rs2Data_id(i_10),
    .WB_out_ID_EX(out_ref[153:152]),
    .Mem_out_ID_EX(out_ref[151:150]),
    .EX_out(out_ref[149:143]),
    .PC_ex(out_ref[142:111]),
    .Imm_ex(out_ref[110:79]),
    .rdAddr_ex(out_ref[78:74]),
    .rs1Addr_ex(out_ref[73:69]),
    .rs2Addr_ex(out_ref[68:64]),
    .rs1Data_ex(out_ref[63:32]),
    .rs2Data_ex(out_ref[31:0])
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
    seed = 556538586;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
