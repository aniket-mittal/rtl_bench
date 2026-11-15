// Hidden tests: 5000 cycles of seeded random inputs (seed 1641712729); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 614;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [255:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [14:0] i_13;
  reg [2:0] i_14;
  reg [3:0] i_15;
  reg [287:0] i_16;
  reg [4:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_10553 dut (
    .io_dram_data_valid(i_0),
    .io_dram_ecc_in(i_1),
    .io_dram_data_in(i_2),
    .dram_io_cas_l(i_3),
    .dram_io_channel_disabled(i_4),
    .dram_io_cke(i_5),
    .dram_io_clk_enable(i_6),
    .dram_io_drive_data(i_7),
    .dram_io_drive_enable(i_8),
    .dram_io_pad_clk_inv(i_9),
    .dram_io_pad_enable(i_10),
    .dram_io_ras_l(i_11),
    .dram_io_write_en_l(i_12),
    .dram_io_addr(i_13),
    .dram_io_bank(i_14),
    .dram_io_cs_l(i_15),
    .dram_io_data_out(i_16),
    .dram_io_ptr_clk_inv(i_17),
    .io_dram_data_valid_buf(out_dut[613:613]),
    .io_dram_ecc_in_buf(out_dut[612:581]),
    .io_dram_data_in_buf(out_dut[580:325]),
    .dram_io_cas_l_buf(out_dut[324:324]),
    .dram_io_channel_disabled_buf(out_dut[323:323]),
    .dram_io_cke_buf(out_dut[322:322]),
    .dram_io_clk_enable_buf(out_dut[321:321]),
    .dram_io_drive_data_buf(out_dut[320:320]),
    .dram_io_drive_enable_buf(out_dut[319:319]),
    .dram_io_pad_clk_inv_buf(out_dut[318:318]),
    .dram_io_pad_enable_buf(out_dut[317:317]),
    .dram_io_ras_l_buf(out_dut[316:316]),
    .dram_io_write_en_l_buf(out_dut[315:315]),
    .dram_io_addr_buf(out_dut[314:300]),
    .dram_io_bank_buf(out_dut[299:297]),
    .dram_io_cs_l_buf(out_dut[296:293]),
    .dram_io_data_out_buf(out_dut[292:5]),
    .dram_io_ptr_clk_inv_buf(out_dut[4:0])
  );
  mg_10553__ref ref_i (
    .io_dram_data_valid(i_0),
    .io_dram_ecc_in(i_1),
    .io_dram_data_in(i_2),
    .dram_io_cas_l(i_3),
    .dram_io_channel_disabled(i_4),
    .dram_io_cke(i_5),
    .dram_io_clk_enable(i_6),
    .dram_io_drive_data(i_7),
    .dram_io_drive_enable(i_8),
    .dram_io_pad_clk_inv(i_9),
    .dram_io_pad_enable(i_10),
    .dram_io_ras_l(i_11),
    .dram_io_write_en_l(i_12),
    .dram_io_addr(i_13),
    .dram_io_bank(i_14),
    .dram_io_cs_l(i_15),
    .dram_io_data_out(i_16),
    .dram_io_ptr_clk_inv(i_17),
    .io_dram_data_valid_buf(out_ref[613:613]),
    .io_dram_ecc_in_buf(out_ref[612:581]),
    .io_dram_data_in_buf(out_ref[580:325]),
    .dram_io_cas_l_buf(out_ref[324:324]),
    .dram_io_channel_disabled_buf(out_ref[323:323]),
    .dram_io_cke_buf(out_ref[322:322]),
    .dram_io_clk_enable_buf(out_ref[321:321]),
    .dram_io_drive_data_buf(out_ref[320:320]),
    .dram_io_drive_enable_buf(out_ref[319:319]),
    .dram_io_pad_clk_inv_buf(out_ref[318:318]),
    .dram_io_pad_enable_buf(out_ref[317:317]),
    .dram_io_ras_l_buf(out_ref[316:316]),
    .dram_io_write_en_l_buf(out_ref[315:315]),
    .dram_io_addr_buf(out_ref[314:300]),
    .dram_io_bank_buf(out_ref[299:297]),
    .dram_io_cs_l_buf(out_ref[296:293]),
    .dram_io_data_out_buf(out_ref[292:5]),
    .dram_io_ptr_clk_inv_buf(out_ref[4:0])
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
    seed = 1641712729;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
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
      i_16 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_17 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
