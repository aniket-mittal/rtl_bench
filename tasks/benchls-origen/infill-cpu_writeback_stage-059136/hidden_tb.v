// Hidden tests: 5000 cycles of seeded random inputs (seed 1465135168); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 103;
  reg clk;
  reg [3:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_059136 dut (
    .rd_num_passthrough(i_0),
    .md_passthrough(i_1),
    .result(i_2),
    .cpsr_in(i_3),
    .dmem_val_passthrough(i_4),
    .taken(i_5),
    .is_alu_op_passthrough(i_6),
    .is_cmp_op_passthrough(i_7),
    .is_jmp_op_passthrough(i_8),
    .is_ld_op_passthrough(i_9),
    .reg_num(out_dut[102:99]),
    .reg_write_en(out_dut[98:98]),
    .reg_val(out_dut[97:66]),
    .pc_out(out_dut[65:34]),
    .pc_write_en(out_dut[33:33]),
    .cpsr_out(out_dut[32:1]),
    .cpsr_write_en(out_dut[0:0])
  );
  origen_059136__ref ref_i (
    .rd_num_passthrough(i_0),
    .md_passthrough(i_1),
    .result(i_2),
    .cpsr_in(i_3),
    .dmem_val_passthrough(i_4),
    .taken(i_5),
    .is_alu_op_passthrough(i_6),
    .is_cmp_op_passthrough(i_7),
    .is_jmp_op_passthrough(i_8),
    .is_ld_op_passthrough(i_9),
    .reg_num(out_ref[102:99]),
    .reg_write_en(out_ref[98:98]),
    .reg_val(out_ref[97:66]),
    .pc_out(out_ref[65:34]),
    .pc_write_en(out_ref[33:33]),
    .cpsr_out(out_ref[32:1]),
    .cpsr_write_en(out_ref[0:0])
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
    seed = 1465135168;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
