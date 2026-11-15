// Hidden tests: 5000 cycles of seeded random inputs (seed 367673666); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 100;
  reg clk;
  reg [7:0] i_0;
  reg [7:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_022909 dut (
    .cmd_type_bus(i_0),
    .cmd_op_memory(i_1),
    .exu_pause(i_2),
    .exu_rs1_data(i_3),
    .exu_rs2_data(i_4),
    .exu_imm32(i_5),
    .lsu_load_data(i_6),
    .lsu_store_addr(out_dut[99:68]),
    .lsu_store_en(out_dut[67:67]),
    .lsu_store_data(out_dut[66:35]),
    .lsu_store_size(out_dut[34:33]),
    .lsu_rd_valid(out_dut[32:32]),
    .lsu_rd_data(out_dut[31:0])
  );
  autovcoder_022909__ref ref_i (
    .cmd_type_bus(i_0),
    .cmd_op_memory(i_1),
    .exu_pause(i_2),
    .exu_rs1_data(i_3),
    .exu_rs2_data(i_4),
    .exu_imm32(i_5),
    .lsu_load_data(i_6),
    .lsu_store_addr(out_ref[99:68]),
    .lsu_store_en(out_ref[67:67]),
    .lsu_store_data(out_ref[66:35]),
    .lsu_store_size(out_ref[34:33]),
    .lsu_rd_valid(out_ref[32:32]),
    .lsu_rd_data(out_ref[31:0])
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
    seed = 367673666;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
