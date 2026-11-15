// Hidden tests: 5000 cycles of seeded random inputs (seed 3733955223); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 110;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [4:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_09954 dut (
    .clk(clk),
    .rst(i_0),
    .ex_exu_result(i_1),
    .ex_mem_store_data(i_2),
    .ex_mem_write(i_3),
    .ex_mem_read(i_4),
    .ex_mem_byte(i_5),
    .ex_mem_halfword(i_6),
    .ex_mem_sign_ext(i_7),
    .ex_mem_exu_mem_select(i_8),
    .ex_gpr_wa(i_9),
    .ex_gpr_we(i_10),
    .ex_kernel_mode(i_11),
    .ex_pc_current(i_12),
    .ex_mem_can_exc(i_13),
    .ex_flush(i_14),
    .ex_stall(i_15),
    .mem_stall(i_16),
    .mem_exu_result(out_dut[109:78]),
    .mem_mem_store_data(out_dut[77:46]),
    .mem_mem_write(out_dut[45:45]),
    .mem_mem_read(out_dut[44:44]),
    .mem_mem_byte(out_dut[43:43]),
    .mem_mem_halfword(out_dut[42:42]),
    .mem_mem_sign_ext(out_dut[41:41]),
    .mem_mem_exu_mem_select(out_dut[40:40]),
    .mem_gpr_wa(out_dut[39:35]),
    .mem_gpr_we(out_dut[34:34]),
    .mem_kernel_mode(out_dut[33:33]),
    .mem_pc_current(out_dut[32:1]),
    .mem_mem_can_exc(out_dut[0:0])
  );
  mg_09954__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .ex_exu_result(i_1),
    .ex_mem_store_data(i_2),
    .ex_mem_write(i_3),
    .ex_mem_read(i_4),
    .ex_mem_byte(i_5),
    .ex_mem_halfword(i_6),
    .ex_mem_sign_ext(i_7),
    .ex_mem_exu_mem_select(i_8),
    .ex_gpr_wa(i_9),
    .ex_gpr_we(i_10),
    .ex_kernel_mode(i_11),
    .ex_pc_current(i_12),
    .ex_mem_can_exc(i_13),
    .ex_flush(i_14),
    .ex_stall(i_15),
    .mem_stall(i_16),
    .mem_exu_result(out_ref[109:78]),
    .mem_mem_store_data(out_ref[77:46]),
    .mem_mem_write(out_ref[45:45]),
    .mem_mem_read(out_ref[44:44]),
    .mem_mem_byte(out_ref[43:43]),
    .mem_mem_halfword(out_ref[42:42]),
    .mem_mem_sign_ext(out_ref[41:41]),
    .mem_mem_exu_mem_select(out_ref[40:40]),
    .mem_gpr_wa(out_ref[39:35]),
    .mem_gpr_we(out_ref[34:34]),
    .mem_kernel_mode(out_ref[33:33]),
    .mem_pc_current(out_ref[32:1]),
    .mem_mem_can_exc(out_ref[0:0])
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
    seed = 3733955223;
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
      i_16 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
