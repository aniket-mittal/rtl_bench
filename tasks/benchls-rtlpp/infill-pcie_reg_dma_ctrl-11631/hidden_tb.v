// Hidden tests: 5000 cycles of seeded random inputs (seed 2687408701); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 71;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [7:0] i_4;
  reg [7:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [15:0] i_9;
  reg [63:0] i_10;
  reg [63:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_11631 dut (
    .clk_in(clk),
    .rstn(i_0),
    .sel_ep_reg(i_1),
    .reg_wr_ena(i_2),
    .reg_rd_ena(i_3),
    .reg_rd_addr(i_4),
    .reg_wr_addr(i_5),
    .reg_wr_data(i_6),
    .dma_rd_prg_rddata(i_7),
    .dma_wr_prg_rddata(i_8),
    .rx_ecrc_bad_cnt(i_9),
    .read_dma_status(i_10),
    .write_dma_status(i_11),
    .reg_rd_data(out_dut[70:39]),
    .reg_rd_data_valid(out_dut[38:38]),
    .dma_prg_wrdata(out_dut[37:6]),
    .dma_prg_addr(out_dut[5:2]),
    .dma_rd_prg_wrena(out_dut[1:1]),
    .dma_wr_prg_wrena(out_dut[0:0])
  );
  rtlpp_11631__ref ref_i (
    .clk_in(clk),
    .rstn(i_0),
    .sel_ep_reg(i_1),
    .reg_wr_ena(i_2),
    .reg_rd_ena(i_3),
    .reg_rd_addr(i_4),
    .reg_wr_addr(i_5),
    .reg_wr_data(i_6),
    .dma_rd_prg_rddata(i_7),
    .dma_wr_prg_rddata(i_8),
    .rx_ecrc_bad_cnt(i_9),
    .read_dma_status(i_10),
    .write_dma_status(i_11),
    .reg_rd_data(out_ref[70:39]),
    .reg_rd_data_valid(out_ref[38:38]),
    .dma_prg_wrdata(out_ref[37:6]),
    .dma_prg_addr(out_ref[5:2]),
    .dma_rd_prg_wrena(out_ref[1:1]),
    .dma_wr_prg_wrena(out_ref[0:0])
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
    seed = 2687408701;
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
      i_10 = {$random(seed), $random(seed)};
      i_11 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
