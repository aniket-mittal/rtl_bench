// Hidden tests: 5000 cycles of seeded random inputs (seed 1247409369); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 61;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [15:0] i_4;
  reg [0:0] i_5;
  reg [15:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [15:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_166794 dut (
    .clk(clk),
    .rst(i_0),
    .tb_startup(i_1),
    .emif_sdch_rd(i_2),
    .p_q_swi(i_3),
    .p_sdch_dout(i_4),
    .p_sdch_dout_vld(i_5),
    .q_sdch_dout(i_6),
    .q_sdch_dout_vld(i_7),
    .source_valid(i_8),
    .source_sop(i_9),
    .source_eop(i_10),
    .source_data_s(i_11),
    .p_enable(out_dut[60:60]),
    .q_enable(out_dut[59:59]),
    .p_tb_startup(out_dut[58:58]),
    .q_tb_startup(out_dut[57:57]),
    .p_emif_sdch_rd(out_dut[56:56]),
    .q_emif_sdch_rd(out_dut[55:55]),
    .p_source_valid(out_dut[54:54]),
    .p_source_sop(out_dut[53:53]),
    .p_source_eop(out_dut[52:52]),
    .p_source_data_s(out_dut[51:36]),
    .q_source_valid(out_dut[35:35]),
    .q_source_sop(out_dut[34:34]),
    .q_source_eop(out_dut[33:33]),
    .q_source_data_s(out_dut[32:17]),
    .sdch_dout(out_dut[16:1]),
    .sdch_dout_vld(out_dut[0:0])
  );
  origen_166794__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .tb_startup(i_1),
    .emif_sdch_rd(i_2),
    .p_q_swi(i_3),
    .p_sdch_dout(i_4),
    .p_sdch_dout_vld(i_5),
    .q_sdch_dout(i_6),
    .q_sdch_dout_vld(i_7),
    .source_valid(i_8),
    .source_sop(i_9),
    .source_eop(i_10),
    .source_data_s(i_11),
    .p_enable(out_ref[60:60]),
    .q_enable(out_ref[59:59]),
    .p_tb_startup(out_ref[58:58]),
    .q_tb_startup(out_ref[57:57]),
    .p_emif_sdch_rd(out_ref[56:56]),
    .q_emif_sdch_rd(out_ref[55:55]),
    .p_source_valid(out_ref[54:54]),
    .p_source_sop(out_ref[53:53]),
    .p_source_eop(out_ref[52:52]),
    .p_source_data_s(out_ref[51:36]),
    .q_source_valid(out_ref[35:35]),
    .q_source_sop(out_ref[34:34]),
    .q_source_eop(out_ref[33:33]),
    .q_source_data_s(out_ref[32:17]),
    .sdch_dout(out_ref[16:1]),
    .sdch_dout_vld(out_ref[0:0])
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
    seed = 1247409369;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
