// Hidden tests: 5000 cycles of seeded random inputs (seed 678813058); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [0:0] i_0;
  reg [3:0] i_1;
  reg [1:0] i_2;
  reg [422:0] i_3;
  reg [1:0] i_4;
  reg [1679:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [1:0] i_8;
  reg [8:0] i_9;
  reg [0:0] i_10;
  reg [1:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  flash_mp dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .flash_disable_i(i_1),
    .if_sel_i(i_2),
    .region_cfgs_i(i_3),
    .bank_cfgs_i(i_4),
    .info_page_cfgs_i(i_5),
    .erase_suspend_i(i_6),
    .req_i(i_7),
    .phase_i(i_8),
    .req_addr_i(i_9),
    .req_part_i(i_10),
    .info_sel_i(i_11),
    .addr_ovfl_i(i_12),
    .rd_i(i_13),
    .prog_i(i_14),
    .pg_erase_i(i_15),
    .bk_erase_i(i_16),
    .rd_done_i(i_17),
    .prog_done_i(i_18),
    .erase_done_i(i_19),
    .erase_suspend_done_o(out_dut[13:13]),
    .rd_done_o(out_dut[12:12]),
    .prog_done_o(out_dut[11:11]),
    .erase_done_o(out_dut[10:10]),
    .error_o(out_dut[9:9]),
    .req_o(out_dut[8:8]),
    .rd_o(out_dut[7:7]),
    .prog_o(out_dut[6:6]),
    .scramble_en_o(out_dut[5:5]),
    .ecc_en_o(out_dut[4:4]),
    .he_en_o(out_dut[3:3]),
    .pg_erase_o(out_dut[2:2]),
    .bk_erase_o(out_dut[1:1]),
    .erase_suspend_o(out_dut[0:0])
  );
  flash_mp__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .flash_disable_i(i_1),
    .if_sel_i(i_2),
    .region_cfgs_i(i_3),
    .bank_cfgs_i(i_4),
    .info_page_cfgs_i(i_5),
    .erase_suspend_i(i_6),
    .req_i(i_7),
    .phase_i(i_8),
    .req_addr_i(i_9),
    .req_part_i(i_10),
    .info_sel_i(i_11),
    .addr_ovfl_i(i_12),
    .rd_i(i_13),
    .prog_i(i_14),
    .pg_erase_i(i_15),
    .bk_erase_i(i_16),
    .rd_done_i(i_17),
    .prog_done_i(i_18),
    .erase_done_i(i_19),
    .erase_suspend_done_o(out_ref[13:13]),
    .rd_done_o(out_ref[12:12]),
    .prog_done_o(out_ref[11:11]),
    .erase_done_o(out_ref[10:10]),
    .error_o(out_ref[9:9]),
    .req_o(out_ref[8:8]),
    .rd_o(out_ref[7:7]),
    .prog_o(out_ref[6:6]),
    .scramble_en_o(out_ref[5:5]),
    .ecc_en_o(out_ref[4:4]),
    .he_en_o(out_ref[3:3]),
    .pg_erase_o(out_ref[2:2]),
    .bk_erase_o(out_ref[1:1]),
    .erase_suspend_o(out_ref[0:0])
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
    seed = 678813058;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
