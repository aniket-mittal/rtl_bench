// Hidden tests: 5000 cycles of seeded random inputs (seed 4214409866); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 102;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_032613 dut (
    .clk_a(clk),
    .clk_b(i_0),
    .rst_n(i_1),
    .mem_valid_a(i_2),
    .mem_addr_a(i_3),
    .mem_wdata_a(i_4),
    .mem_wstrb_a(i_5),
    .mem_ready_b(i_6),
    .mem_rdata_b(i_7),
    .mem_ready_a(out_dut[101:101]),
    .mem_rdata_a(out_dut[100:69]),
    .mem_valid_b(out_dut[68:68]),
    .mem_addr_b(out_dut[67:36]),
    .mem_wdata_b(out_dut[35:4]),
    .mem_wstrb_b(out_dut[3:0])
  );
  origen_032613__ref ref_i (
    .clk_a(clk),
    .clk_b(i_0),
    .rst_n(i_1),
    .mem_valid_a(i_2),
    .mem_addr_a(i_3),
    .mem_wdata_a(i_4),
    .mem_wstrb_a(i_5),
    .mem_ready_b(i_6),
    .mem_rdata_b(i_7),
    .mem_ready_a(out_ref[101:101]),
    .mem_rdata_a(out_ref[100:69]),
    .mem_valid_b(out_ref[68:68]),
    .mem_addr_b(out_ref[67:36]),
    .mem_wdata_b(out_ref[35:4]),
    .mem_wstrb_b(out_ref[3:0])
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
    seed = 4214409866;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
