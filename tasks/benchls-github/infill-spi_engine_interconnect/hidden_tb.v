// Hidden tests: 5000 cycles of seeded random inputs (seed 109809134); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 68;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [0:0] i_6;
  reg [7:0] i_7;
  reg [0:0] i_8;
  reg [15:0] i_9;
  reg [0:0] i_10;
  reg [7:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [15:0] i_15;
  reg [0:0] i_16;
  reg [7:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  spi_engine_interconnect dut (
    .clk(clk),
    .resetn(i_0),
    .interconnect_dir(i_1),
    .m_cmd_ready(i_2),
    .m_sdo_ready(i_3),
    .m_sdi_valid(i_4),
    .m_sdi_data(i_5),
    .m_sync_valid(i_6),
    .m_sync(i_7),
    .s0_cmd_valid(i_8),
    .s0_cmd_data(i_9),
    .s0_sdo_valid(i_10),
    .s0_sdo_data(i_11),
    .s0_sdi_ready(i_12),
    .s0_sync_ready(i_13),
    .s1_cmd_valid(i_14),
    .s1_cmd_data(i_15),
    .s1_sdo_valid(i_16),
    .s1_sdo_data(i_17),
    .s1_sdi_ready(i_18),
    .s1_sync_ready(i_19),
    .m_cmd_valid(out_dut[67:67]),
    .m_cmd_data(out_dut[66:51]),
    .m_sdo_valid(out_dut[50:50]),
    .m_sdo_data(out_dut[49:42]),
    .m_sdi_ready(out_dut[41:41]),
    .m_sync_ready(out_dut[40:40]),
    .s0_cmd_ready(out_dut[39:39]),
    .s0_sdo_ready(out_dut[38:38]),
    .s0_sdi_valid(out_dut[37:37]),
    .s0_sdi_data(out_dut[36:29]),
    .s0_sync_valid(out_dut[28:28]),
    .s0_sync(out_dut[27:20]),
    .s1_cmd_ready(out_dut[19:19]),
    .s1_sdo_ready(out_dut[18:18]),
    .s1_sdi_valid(out_dut[17:17]),
    .s1_sdi_data(out_dut[16:9]),
    .s1_sync_valid(out_dut[8:8]),
    .s1_sync(out_dut[7:0])
  );
  spi_engine_interconnect__ref ref_i (
    .clk(clk),
    .resetn(i_0),
    .interconnect_dir(i_1),
    .m_cmd_ready(i_2),
    .m_sdo_ready(i_3),
    .m_sdi_valid(i_4),
    .m_sdi_data(i_5),
    .m_sync_valid(i_6),
    .m_sync(i_7),
    .s0_cmd_valid(i_8),
    .s0_cmd_data(i_9),
    .s0_sdo_valid(i_10),
    .s0_sdo_data(i_11),
    .s0_sdi_ready(i_12),
    .s0_sync_ready(i_13),
    .s1_cmd_valid(i_14),
    .s1_cmd_data(i_15),
    .s1_sdo_valid(i_16),
    .s1_sdo_data(i_17),
    .s1_sdi_ready(i_18),
    .s1_sync_ready(i_19),
    .m_cmd_valid(out_ref[67:67]),
    .m_cmd_data(out_ref[66:51]),
    .m_sdo_valid(out_ref[50:50]),
    .m_sdo_data(out_ref[49:42]),
    .m_sdi_ready(out_ref[41:41]),
    .m_sync_ready(out_ref[40:40]),
    .s0_cmd_ready(out_ref[39:39]),
    .s0_sdo_ready(out_ref[38:38]),
    .s0_sdi_valid(out_ref[37:37]),
    .s0_sdi_data(out_ref[36:29]),
    .s0_sync_valid(out_ref[28:28]),
    .s0_sync(out_ref[27:20]),
    .s1_cmd_ready(out_ref[19:19]),
    .s1_sdo_ready(out_ref[18:18]),
    .s1_sdi_valid(out_ref[17:17]),
    .s1_sdi_data(out_ref[16:9]),
    .s1_sync_valid(out_ref[8:8]),
    .s1_sync(out_ref[7:0])
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
    seed = 109809134;
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
