// Hidden tests: 5000 cycles of seeded random inputs (seed 1300789935); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 225;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  reg [0:0] i_13;
  reg [31:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  sirv_rtc dut (
    .clock(clk),
    .reset(i_0),
    .io_regs_cfg_write_valid(i_1),
    .io_regs_cfg_write_bits(i_2),
    .io_regs_countLo_write_valid(i_3),
    .io_regs_countLo_write_bits(i_4),
    .io_regs_countHi_write_valid(i_5),
    .io_regs_countHi_write_bits(i_6),
    .io_regs_s_write_valid(i_7),
    .io_regs_s_write_bits(i_8),
    .io_regs_cmp_0_write_valid(i_9),
    .io_regs_cmp_0_write_bits(i_10),
    .io_regs_feed_write_valid(i_11),
    .io_regs_feed_write_bits(i_12),
    .io_regs_key_write_valid(i_13),
    .io_regs_key_write_bits(i_14),
    .io_regs_cfg_read(out_dut[224:193]),
    .io_regs_countLo_read(out_dut[192:161]),
    .io_regs_countHi_read(out_dut[160:129]),
    .io_regs_s_read(out_dut[128:97]),
    .io_regs_cmp_0_read(out_dut[96:65]),
    .io_regs_feed_read(out_dut[64:33]),
    .io_regs_key_read(out_dut[32:1]),
    .io_ip_0(out_dut[0:0])
  );
  sirv_rtc__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .io_regs_cfg_write_valid(i_1),
    .io_regs_cfg_write_bits(i_2),
    .io_regs_countLo_write_valid(i_3),
    .io_regs_countLo_write_bits(i_4),
    .io_regs_countHi_write_valid(i_5),
    .io_regs_countHi_write_bits(i_6),
    .io_regs_s_write_valid(i_7),
    .io_regs_s_write_bits(i_8),
    .io_regs_cmp_0_write_valid(i_9),
    .io_regs_cmp_0_write_bits(i_10),
    .io_regs_feed_write_valid(i_11),
    .io_regs_feed_write_bits(i_12),
    .io_regs_key_write_valid(i_13),
    .io_regs_key_write_bits(i_14),
    .io_regs_cfg_read(out_ref[224:193]),
    .io_regs_countLo_read(out_ref[192:161]),
    .io_regs_countHi_read(out_ref[160:129]),
    .io_regs_s_read(out_ref[128:97]),
    .io_regs_cmp_0_read(out_ref[96:65]),
    .io_regs_feed_read(out_ref[64:33]),
    .io_regs_key_read(out_ref[32:1]),
    .io_ip_0(out_ref[0:0])
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
    seed = 1300789935;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
