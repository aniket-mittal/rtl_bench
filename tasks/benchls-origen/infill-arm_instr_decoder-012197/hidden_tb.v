// Hidden tests: 5000 cycles of seeded random inputs (seed 2233192728); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 63;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_012197 dut (
    .i_instr(i_0),
    .i_valid(i_1),
    .is_dp(out_dut[62:62]),
    .is_branch(out_dut[61:61]),
    .is_ls(out_dut[60:60]),
    .o_rn(out_dut[59:56]),
    .o_rm(out_dut[55:52]),
    .o_rd(out_dut[51:48]),
    .o_alu_op(out_dut[47:44]),
    .o_alu_b_imm(out_dut[43:43]),
    .cond(out_dut[42:39]),
    .o_write_nzcv(out_dut[38:38]),
    .o_branch_offset(out_dut[37:14]),
    .o_link(out_dut[13:13]),
    .o_ls_flags(out_dut[12:9]),
    .o_load(out_dut[8:8]),
    .o_store(out_dut[7:7]),
    .o_mrs(out_dut[6:6]),
    .o_psr_field_mask(out_dut[5:2]),
    .o_spsr_sel(out_dut[1:1]),
    .o_invalid_instruction(out_dut[0:0])
  );
  origen_012197__ref ref_i (
    .i_instr(i_0),
    .i_valid(i_1),
    .is_dp(out_ref[62:62]),
    .is_branch(out_ref[61:61]),
    .is_ls(out_ref[60:60]),
    .o_rn(out_ref[59:56]),
    .o_rm(out_ref[55:52]),
    .o_rd(out_ref[51:48]),
    .o_alu_op(out_ref[47:44]),
    .o_alu_b_imm(out_ref[43:43]),
    .cond(out_ref[42:39]),
    .o_write_nzcv(out_ref[38:38]),
    .o_branch_offset(out_ref[37:14]),
    .o_link(out_ref[13:13]),
    .o_ls_flags(out_ref[12:9]),
    .o_load(out_ref[8:8]),
    .o_store(out_ref[7:7]),
    .o_mrs(out_ref[6:6]),
    .o_psr_field_mask(out_ref[5:2]),
    .o_spsr_sel(out_ref[1:1]),
    .o_invalid_instruction(out_ref[0:0])
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
    seed = 2233192728;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
