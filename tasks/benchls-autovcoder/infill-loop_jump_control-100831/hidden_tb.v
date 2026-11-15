// Hidden tests: 5000 cycles of seeded random inputs (seed 2377803473); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 49;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [1:0] i_4;
  reg [7:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_100831 dut (
    .ck(clk),
    .reset_n(i_0),
    .cntr_value(i_1),
    .cntr_load(i_2),
    .reg_select(i_3),
    .reg_load_select(i_4),
    .jump_value(i_5),
    .jump_load(i_6),
    .jump_check(i_7),
    .jump_taken(out_dut[48:48]),
    .jump_address(out_dut[47:40]),
    .cntr_3(out_dut[39:32]),
    .jump_ptr_0_export(out_dut[31:24]),
    .jump_ptr_1_export(out_dut[23:16]),
    .jump_cntr_0_export(out_dut[15:8]),
    .jump_cntr_1_export(out_dut[7:0])
  );
  autovcoder_100831__ref ref_i (
    .ck(clk),
    .reset_n(i_0),
    .cntr_value(i_1),
    .cntr_load(i_2),
    .reg_select(i_3),
    .reg_load_select(i_4),
    .jump_value(i_5),
    .jump_load(i_6),
    .jump_check(i_7),
    .jump_taken(out_ref[48:48]),
    .jump_address(out_ref[47:40]),
    .cntr_3(out_ref[39:32]),
    .jump_ptr_0_export(out_ref[31:24]),
    .jump_ptr_1_export(out_ref[23:16]),
    .jump_cntr_0_export(out_ref[15:8]),
    .jump_cntr_1_export(out_ref[7:0])
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
    seed = 2377803473;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
