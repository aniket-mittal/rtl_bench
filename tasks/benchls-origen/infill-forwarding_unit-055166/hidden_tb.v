// Hidden tests: 5000 cycles of seeded random inputs (seed 32784705); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 10;
  reg clk;
  reg [4:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [4:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_055166 dut (
    .rs1_id(i_0),
    .rs2_id(i_1),
    .rs1_ex(i_2),
    .rs2_ex(i_3),
    .rd_ex(i_4),
    .rd_mem(i_5),
    .rd_wb(i_6),
    .RegWrite_ex(i_7),
    .RegWrite_mem(i_8),
    .RegWrite_wb(i_9),
    .AluSrcB_ex(i_10),
    .Forward_A_ex(out_dut[9:8]),
    .Forward_B_ex(out_dut[7:6]),
    .Forward_MemWriteData_ex(out_dut[5:4]),
    .Forward_RegWriteData_A_id(out_dut[3:2]),
    .Forward_RegWriteData_B_id(out_dut[1:0])
  );
  origen_055166__ref ref_i (
    .rs1_id(i_0),
    .rs2_id(i_1),
    .rs1_ex(i_2),
    .rs2_ex(i_3),
    .rd_ex(i_4),
    .rd_mem(i_5),
    .rd_wb(i_6),
    .RegWrite_ex(i_7),
    .RegWrite_mem(i_8),
    .RegWrite_wb(i_9),
    .AluSrcB_ex(i_10),
    .Forward_A_ex(out_ref[9:8]),
    .Forward_B_ex(out_ref[7:6]),
    .Forward_MemWriteData_ex(out_ref[5:4]),
    .Forward_RegWriteData_A_id(out_ref[3:2]),
    .Forward_RegWriteData_B_id(out_ref[1:0])
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
    seed = 32784705;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
