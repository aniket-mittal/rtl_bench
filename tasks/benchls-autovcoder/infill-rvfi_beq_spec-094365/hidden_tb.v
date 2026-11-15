// Hidden tests: 5000 cycles of seeded random inputs (seed 302572643); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 153;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_094365 dut (
    .rvfi_valid(i_0),
    .rvfi_insn(i_1),
    .rvfi_pc_rdata(i_2),
    .rvfi_rs1_rdata(i_3),
    .rvfi_rs2_rdata(i_4),
    .rvfi_mem_rdata(i_5),
    .spec_valid(out_dut[152:152]),
    .spec_trap(out_dut[151:151]),
    .spec_rs1_addr(out_dut[150:146]),
    .spec_rs2_addr(out_dut[145:141]),
    .spec_rd_addr(out_dut[140:136]),
    .spec_rd_wdata(out_dut[135:104]),
    .spec_pc_wdata(out_dut[103:72]),
    .spec_mem_addr(out_dut[71:40]),
    .spec_mem_rmask(out_dut[39:36]),
    .spec_mem_wmask(out_dut[35:32]),
    .spec_mem_wdata(out_dut[31:0])
  );
  autovcoder_094365__ref ref_i (
    .rvfi_valid(i_0),
    .rvfi_insn(i_1),
    .rvfi_pc_rdata(i_2),
    .rvfi_rs1_rdata(i_3),
    .rvfi_rs2_rdata(i_4),
    .rvfi_mem_rdata(i_5),
    .spec_valid(out_ref[152:152]),
    .spec_trap(out_ref[151:151]),
    .spec_rs1_addr(out_ref[150:146]),
    .spec_rs2_addr(out_ref[145:141]),
    .spec_rd_addr(out_ref[140:136]),
    .spec_rd_wdata(out_ref[135:104]),
    .spec_pc_wdata(out_ref[103:72]),
    .spec_mem_addr(out_ref[71:40]),
    .spec_mem_rmask(out_ref[39:36]),
    .spec_mem_wmask(out_ref[35:32]),
    .spec_mem_wdata(out_ref[31:0])
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
    seed = 302572643;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
