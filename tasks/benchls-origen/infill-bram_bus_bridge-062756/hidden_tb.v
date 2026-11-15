// Hidden tests: 5000 cycles of seeded random inputs (seed 1647800035); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 105;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [3:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_062756 dut (
    .g_clk(clk),
    .g_resetn(i_0),
    .bram_stall(i_1),
    .bram_rdata(i_2),
    .enable(i_3),
    .mem_req(i_4),
    .mem_wen(i_5),
    .mem_strb(i_6),
    .mem_wdata(i_7),
    .mem_addr(i_8),
    .bram_cen(out_dut[104:104]),
    .bram_addr(out_dut[103:72]),
    .bram_wdata(out_dut[71:40]),
    .bram_wstrb(out_dut[39:36]),
    .mem_gnt(out_dut[35:35]),
    .mem_recv(out_dut[34:34]),
    .mem_ack(out_dut[33:33]),
    .mem_error(out_dut[32:32]),
    .mem_rdata(out_dut[31:0])
  );
  origen_062756__ref ref_i (
    .g_clk(clk),
    .g_resetn(i_0),
    .bram_stall(i_1),
    .bram_rdata(i_2),
    .enable(i_3),
    .mem_req(i_4),
    .mem_wen(i_5),
    .mem_strb(i_6),
    .mem_wdata(i_7),
    .mem_addr(i_8),
    .bram_cen(out_ref[104:104]),
    .bram_addr(out_ref[103:72]),
    .bram_wdata(out_ref[71:40]),
    .bram_wstrb(out_ref[39:36]),
    .mem_gnt(out_ref[35:35]),
    .mem_recv(out_ref[34:34]),
    .mem_ack(out_ref[33:33]),
    .mem_error(out_ref[32:32]),
    .mem_rdata(out_ref[31:0])
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
    seed = 1647800035;
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
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
