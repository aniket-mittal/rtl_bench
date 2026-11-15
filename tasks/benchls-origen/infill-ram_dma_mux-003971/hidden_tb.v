// Hidden tests: 5000 cycles of seeded random inputs (seed 3053221753); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 411;
  reg clk;
  reg [127:0] i_0;
  reg [11:0] i_1;
  reg [11:0] i_2;
  reg [127:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [11:0] i_6;
  reg [11:0] i_7;
  reg [127:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_003971 dut (
    .ram_rd_data(i_0),
    .dma_rd_addr(i_1),
    .dma_wr_addr(i_2),
    .dma_wr_data(i_3),
    .dma_rd_en(i_4),
    .dma_wr_en(i_5),
    .custom_rd_addr(i_6),
    .custom_wr_addr(i_7),
    .custom_wr_data(i_8),
    .custom_rd_en(i_9),
    .custom_wr_en(i_10),
    .ram_rd_addr(out_dut[410:399]),
    .ram_wr_addr(out_dut[398:387]),
    .ram_wr_data(out_dut[386:259]),
    .ram_rd_en(out_dut[258:258]),
    .ram_wr_en(out_dut[257:257]),
    .dma_rd_data(out_dut[256:129]),
    .custom_en(out_dut[128:128]),
    .custom_rd_data(out_dut[127:0])
  );
  origen_003971__ref ref_i (
    .ram_rd_data(i_0),
    .dma_rd_addr(i_1),
    .dma_wr_addr(i_2),
    .dma_wr_data(i_3),
    .dma_rd_en(i_4),
    .dma_wr_en(i_5),
    .custom_rd_addr(i_6),
    .custom_wr_addr(i_7),
    .custom_wr_data(i_8),
    .custom_rd_en(i_9),
    .custom_wr_en(i_10),
    .ram_rd_addr(out_ref[410:399]),
    .ram_wr_addr(out_ref[398:387]),
    .ram_wr_data(out_ref[386:259]),
    .ram_rd_en(out_ref[258:258]),
    .ram_wr_en(out_ref[257:257]),
    .dma_rd_data(out_ref[256:129]),
    .custom_en(out_ref[128:128]),
    .custom_rd_data(out_ref[127:0])
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
    seed = 3053221753;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
