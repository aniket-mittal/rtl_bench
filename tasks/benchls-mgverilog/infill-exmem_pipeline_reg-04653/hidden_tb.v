// Hidden tests: 5000 cycles of seeded random inputs (seed 1388814551); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 95;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [15:0] i_5;
  reg [2:0] i_6;
  reg [15:0] i_7;
  reg [15:0] i_8;
  reg [3:0] i_9;
  reg [15:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [15:0] i_13;
  reg [0:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04653 dut (
    .clk(clk),
    .s7_idex(i_0),
    .dmem_wen_idex(i_1),
    .rf_wen_idex(i_2),
    .branch2_idex(i_3),
    .mem2reg_idex(i_4),
    .aluout(i_5),
    .flag(i_6),
    .extended_16_idex(i_7),
    .rdata2_idex(i_8),
    .rf_waddr(i_9),
    .branch_target_final_muxout(i_10),
    .nop_lw_idex(i_11),
    .nop_sw_idex(i_12),
    .pc_added_idex(i_13),
    .jal_idex(i_14),
    .dmem_wen_exmem(out_dut[94:94]),
    .rf_wen_exmem(out_dut[93:93]),
    .branch2_exmem(out_dut[92:92]),
    .mem2reg_exmem(out_dut[91:91]),
    .aluout_exmem(out_dut[90:75]),
    .flag_exmem(out_dut[74:72]),
    .rdata2_exmem(out_dut[71:56]),
    .rf_waddr_exmem(out_dut[55:52]),
    .extended_exmem(out_dut[51:36]),
    .s7_exmem(out_dut[35:35]),
    .branch_target_exmem(out_dut[34:19]),
    .nop_lw_exmem(out_dut[18:18]),
    .nop_sw_exmem(out_dut[17:17]),
    .pc_added_exmem(out_dut[16:1]),
    .jal_exmem(out_dut[0:0])
  );
  mg_04653__ref ref_i (
    .clk(clk),
    .s7_idex(i_0),
    .dmem_wen_idex(i_1),
    .rf_wen_idex(i_2),
    .branch2_idex(i_3),
    .mem2reg_idex(i_4),
    .aluout(i_5),
    .flag(i_6),
    .extended_16_idex(i_7),
    .rdata2_idex(i_8),
    .rf_waddr(i_9),
    .branch_target_final_muxout(i_10),
    .nop_lw_idex(i_11),
    .nop_sw_idex(i_12),
    .pc_added_idex(i_13),
    .jal_idex(i_14),
    .dmem_wen_exmem(out_ref[94:94]),
    .rf_wen_exmem(out_ref[93:93]),
    .branch2_exmem(out_ref[92:92]),
    .mem2reg_exmem(out_ref[91:91]),
    .aluout_exmem(out_ref[90:75]),
    .flag_exmem(out_ref[74:72]),
    .rdata2_exmem(out_ref[71:56]),
    .rf_waddr_exmem(out_ref[55:52]),
    .extended_exmem(out_ref[51:36]),
    .s7_exmem(out_ref[35:35]),
    .branch_target_exmem(out_ref[34:19]),
    .nop_lw_exmem(out_ref[18:18]),
    .nop_sw_exmem(out_ref[17:17]),
    .pc_added_exmem(out_ref[16:1]),
    .jal_exmem(out_ref[0:0])
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
    seed = 1388814551;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
