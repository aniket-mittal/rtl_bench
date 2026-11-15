// Hidden tests: 5000 cycles of seeded random inputs (seed 2525293889); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 165;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [3:0] i_6;
  reg [3:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [31:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_179398 dut (
    .RegWrite_in(i_0),
    .Memory_write_in(i_1),
    .DR_MDR_immi_in(i_2),
    .RegJump_in(i_3),
    .RegJump_cond_in(i_4),
    .memory_input_in(i_5),
    .branchcondition(i_6),
    .szcv(i_7),
    .DR_in(i_8),
    .outerInput(i_9),
    .memoryContent(i_10),
    .din(i_11),
    .Regdst_in(i_12),
    .increPC_in(i_13),
    .out_PC4(out_dut[164:133]),
    .MDR(out_dut[132:101]),
    .DR(out_dut[100:69]),
    .RegWrite(out_dut[68:68]),
    .DR_MDR_immi(out_dut[67:67]),
    .Memory_write(out_dut[66:66]),
    .RegJump(out_dut[65:65]),
    .d(out_dut[64:33]),
    .Regdst(out_dut[32:32]),
    .increPC_out(out_dut[31:0])
  );
  origen_179398__ref ref_i (
    .RegWrite_in(i_0),
    .Memory_write_in(i_1),
    .DR_MDR_immi_in(i_2),
    .RegJump_in(i_3),
    .RegJump_cond_in(i_4),
    .memory_input_in(i_5),
    .branchcondition(i_6),
    .szcv(i_7),
    .DR_in(i_8),
    .outerInput(i_9),
    .memoryContent(i_10),
    .din(i_11),
    .Regdst_in(i_12),
    .increPC_in(i_13),
    .out_PC4(out_ref[164:133]),
    .MDR(out_ref[132:101]),
    .DR(out_ref[100:69]),
    .RegWrite(out_ref[68:68]),
    .DR_MDR_immi(out_ref[67:67]),
    .Memory_write(out_ref[66:66]),
    .RegJump(out_ref[65:65]),
    .d(out_ref[64:33]),
    .Regdst(out_ref[32:32]),
    .increPC_out(out_ref[31:0])
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
    seed = 2525293889;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
