// Hidden tests: 5000 cycles of seeded random inputs (seed 2423303321); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 56;
  reg clk;
  reg [31:0] i_0;
  reg [3:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_026719 dut (
    .instr(i_0),
    .flag(i_1),
    .jmp_en(out_dut[55:55]),
    .jmp_reg_en(out_dut[54:54]),
    .flag_en(out_dut[53:53]),
    .data_w_en(out_dut[52:52]),
    .data_mem(out_dut[51:51]),
    .data_mem_en(out_dut[50:50]),
    .op(out_dut[49:48]),
    .cmd(out_dut[47:44]),
    .src_addr(out_dut[43:40]),
    .dest_reg(out_dut[39:36]),
    .imm_instr_mem(out_dut[35:24]),
    .imm_instr(out_dut[23:0])
  );
  autovcoder_026719__ref ref_i (
    .instr(i_0),
    .flag(i_1),
    .jmp_en(out_ref[55:55]),
    .jmp_reg_en(out_ref[54:54]),
    .flag_en(out_ref[53:53]),
    .data_w_en(out_ref[52:52]),
    .data_mem(out_ref[51:51]),
    .data_mem_en(out_ref[50:50]),
    .op(out_ref[49:48]),
    .cmd(out_ref[47:44]),
    .src_addr(out_ref[43:40]),
    .dest_reg(out_ref[39:36]),
    .imm_instr_mem(out_ref[35:24]),
    .imm_instr(out_ref[23:0])
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
    seed = 2423303321;
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
