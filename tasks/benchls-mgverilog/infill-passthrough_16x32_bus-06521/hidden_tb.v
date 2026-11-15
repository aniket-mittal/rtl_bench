// Hidden tests: 5000 cycles of seeded random inputs (seed 3892908495); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 514;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [31:0] i_14;
  reg [31:0] i_15;
  reg [31:0] i_16;
  reg [0:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06521 dut (
    .io_ins_0_valid(i_0),
    .io_ins_0_bits_wdata_0(i_1),
    .io_ins_0_bits_wdata_1(i_2),
    .io_ins_0_bits_wdata_2(i_3),
    .io_ins_0_bits_wdata_3(i_4),
    .io_ins_0_bits_wdata_4(i_5),
    .io_ins_0_bits_wdata_5(i_6),
    .io_ins_0_bits_wdata_6(i_7),
    .io_ins_0_bits_wdata_7(i_8),
    .io_ins_0_bits_wdata_8(i_9),
    .io_ins_0_bits_wdata_9(i_10),
    .io_ins_0_bits_wdata_10(i_11),
    .io_ins_0_bits_wdata_11(i_12),
    .io_ins_0_bits_wdata_12(i_13),
    .io_ins_0_bits_wdata_13(i_14),
    .io_ins_0_bits_wdata_14(i_15),
    .io_ins_0_bits_wdata_15(i_16),
    .io_ins_0_bits_wlast(i_17),
    .io_out_valid(out_dut[513:513]),
    .io_out_bits_wdata_0(out_dut[512:481]),
    .io_out_bits_wdata_1(out_dut[480:449]),
    .io_out_bits_wdata_2(out_dut[448:417]),
    .io_out_bits_wdata_3(out_dut[416:385]),
    .io_out_bits_wdata_4(out_dut[384:353]),
    .io_out_bits_wdata_5(out_dut[352:321]),
    .io_out_bits_wdata_6(out_dut[320:289]),
    .io_out_bits_wdata_7(out_dut[288:257]),
    .io_out_bits_wdata_8(out_dut[256:225]),
    .io_out_bits_wdata_9(out_dut[224:193]),
    .io_out_bits_wdata_10(out_dut[192:161]),
    .io_out_bits_wdata_11(out_dut[160:129]),
    .io_out_bits_wdata_12(out_dut[128:97]),
    .io_out_bits_wdata_13(out_dut[96:65]),
    .io_out_bits_wdata_14(out_dut[64:33]),
    .io_out_bits_wdata_15(out_dut[32:1]),
    .io_out_bits_wlast(out_dut[0:0])
  );
  mg_06521__ref ref_i (
    .io_ins_0_valid(i_0),
    .io_ins_0_bits_wdata_0(i_1),
    .io_ins_0_bits_wdata_1(i_2),
    .io_ins_0_bits_wdata_2(i_3),
    .io_ins_0_bits_wdata_3(i_4),
    .io_ins_0_bits_wdata_4(i_5),
    .io_ins_0_bits_wdata_5(i_6),
    .io_ins_0_bits_wdata_6(i_7),
    .io_ins_0_bits_wdata_7(i_8),
    .io_ins_0_bits_wdata_8(i_9),
    .io_ins_0_bits_wdata_9(i_10),
    .io_ins_0_bits_wdata_10(i_11),
    .io_ins_0_bits_wdata_11(i_12),
    .io_ins_0_bits_wdata_12(i_13),
    .io_ins_0_bits_wdata_13(i_14),
    .io_ins_0_bits_wdata_14(i_15),
    .io_ins_0_bits_wdata_15(i_16),
    .io_ins_0_bits_wlast(i_17),
    .io_out_valid(out_ref[513:513]),
    .io_out_bits_wdata_0(out_ref[512:481]),
    .io_out_bits_wdata_1(out_ref[480:449]),
    .io_out_bits_wdata_2(out_ref[448:417]),
    .io_out_bits_wdata_3(out_ref[416:385]),
    .io_out_bits_wdata_4(out_ref[384:353]),
    .io_out_bits_wdata_5(out_ref[352:321]),
    .io_out_bits_wdata_6(out_ref[320:289]),
    .io_out_bits_wdata_7(out_ref[288:257]),
    .io_out_bits_wdata_8(out_ref[256:225]),
    .io_out_bits_wdata_9(out_ref[224:193]),
    .io_out_bits_wdata_10(out_ref[192:161]),
    .io_out_bits_wdata_11(out_ref[160:129]),
    .io_out_bits_wdata_12(out_ref[128:97]),
    .io_out_bits_wdata_13(out_ref[96:65]),
    .io_out_bits_wdata_14(out_ref[64:33]),
    .io_out_bits_wdata_15(out_ref[32:1]),
    .io_out_bits_wlast(out_ref[0:0])
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
    seed = 3892908495;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
