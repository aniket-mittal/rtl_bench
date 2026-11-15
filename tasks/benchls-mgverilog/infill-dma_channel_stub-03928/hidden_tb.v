// Hidden tests: 5000 cycles of seeded random inputs (seed 462690801); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 291;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [7:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [4:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [11:0] i_12;
  reg [31:0] i_13;
  reg [31:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03928 dut (
    .clk(clk),
    .rst(i_0),
    .wb_rf_din(i_1),
    .wb_rf_adr(i_2),
    .wb_rf_we(i_3),
    .wb_rf_re(i_4),
    .ch_sel(i_5),
    .ndnr(i_6),
    .dma_busy(i_7),
    .dma_err(i_8),
    .dma_done(i_9),
    .dma_done_all(i_10),
    .de_csr(i_11),
    .de_txsz(i_12),
    .de_adr0(i_13),
    .de_adr1(i_14),
    .de_csr_we(i_15),
    .de_txsz_we(i_16),
    .de_adr0_we(i_17),
    .de_adr1_we(i_18),
    .de_fetch_descr(i_19),
    .dma_rest(i_20),
    .ptr_set(i_21),
    .pointer(out_dut[290:259]),
    .pointer_s(out_dut[258:227]),
    .ch_csr(out_dut[226:195]),
    .ch_txsz(out_dut[194:163]),
    .ch_adr0(out_dut[162:131]),
    .ch_adr1(out_dut[130:99]),
    .ch_am0(out_dut[98:67]),
    .ch_am1(out_dut[66:35]),
    .sw_pointer(out_dut[34:3]),
    .ch_stop(out_dut[2:2]),
    .ch_dis(out_dut[1:1]),
    .irq(out_dut[0:0])
  );
  mg_03928__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .wb_rf_din(i_1),
    .wb_rf_adr(i_2),
    .wb_rf_we(i_3),
    .wb_rf_re(i_4),
    .ch_sel(i_5),
    .ndnr(i_6),
    .dma_busy(i_7),
    .dma_err(i_8),
    .dma_done(i_9),
    .dma_done_all(i_10),
    .de_csr(i_11),
    .de_txsz(i_12),
    .de_adr0(i_13),
    .de_adr1(i_14),
    .de_csr_we(i_15),
    .de_txsz_we(i_16),
    .de_adr0_we(i_17),
    .de_adr1_we(i_18),
    .de_fetch_descr(i_19),
    .dma_rest(i_20),
    .ptr_set(i_21),
    .pointer(out_ref[290:259]),
    .pointer_s(out_ref[258:227]),
    .ch_csr(out_ref[226:195]),
    .ch_txsz(out_ref[194:163]),
    .ch_adr0(out_ref[162:131]),
    .ch_adr1(out_ref[130:99]),
    .ch_am0(out_ref[98:67]),
    .ch_am1(out_ref[66:35]),
    .sw_pointer(out_ref[34:3]),
    .ch_stop(out_ref[2:2]),
    .ch_dis(out_ref[1:1]),
    .irq(out_ref[0:0])
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
    seed = 462690801;
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
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
