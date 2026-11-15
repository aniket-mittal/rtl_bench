// Hidden tests: 5000 cycles of seeded random inputs (seed 911284038); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 41;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [23:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [13:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_11639 dut (
    .clk(clk),
    .resetn(i_0),
    .phase(i_1),
    .phase_valid(i_2),
    .data(i_3),
    .data_valid(i_4),
    .data_filtered(i_5),
    .data_filtered_valid(i_6),
    .i_q(i_7),
    .i_q_valid(i_8),
    .i_q_filtered(i_9),
    .i_q_filtered_valid(i_10),
    .dma_wr_overflow(i_11),
    .dma_wr_xfer_req(i_12),
    .channel_enable(i_13),
    .phase_ready(out_dut[40:40]),
    .data_ready(out_dut[39:39]),
    .data_filtered_ready(out_dut[38:38]),
    .i_q_ready(out_dut[37:37]),
    .i_q_filtered_ready(out_dut[36:36]),
    .overflow(out_dut[35:35]),
    .dma_wr_data(out_dut[34:3]),
    .dma_wr_en(out_dut[2:2]),
    .dma_wr_sync(out_dut[1:1]),
    .processing_resetn(out_dut[0:0])
  );
  rtlpp_11639__ref ref_i (
    .clk(clk),
    .resetn(i_0),
    .phase(i_1),
    .phase_valid(i_2),
    .data(i_3),
    .data_valid(i_4),
    .data_filtered(i_5),
    .data_filtered_valid(i_6),
    .i_q(i_7),
    .i_q_valid(i_8),
    .i_q_filtered(i_9),
    .i_q_filtered_valid(i_10),
    .dma_wr_overflow(i_11),
    .dma_wr_xfer_req(i_12),
    .channel_enable(i_13),
    .phase_ready(out_ref[40:40]),
    .data_ready(out_ref[39:39]),
    .data_filtered_ready(out_ref[38:38]),
    .i_q_ready(out_ref[37:37]),
    .i_q_filtered_ready(out_ref[36:36]),
    .overflow(out_ref[35:35]),
    .dma_wr_data(out_ref[34:3]),
    .dma_wr_en(out_ref[2:2]),
    .dma_wr_sync(out_ref[1:1]),
    .processing_resetn(out_ref[0:0])
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
    seed = 911284038;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
