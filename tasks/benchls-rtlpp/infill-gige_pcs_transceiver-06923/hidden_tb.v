// Hidden tests: 5000 cycles of seeded random inputs (seed 3054524878); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 51;
  reg clk;
  reg [7:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [4:0] i_5;
  reg [0:0] i_6;
  reg [15:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [3:0] i_13;
  reg [0:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_06923 dut (
    .clk(clk),
    .gmii_tx_d(i_0),
    .gmii_tx_en(i_1),
    .gmii_tx_err(i_2),
    .reset_tx_clk(i_3),
    .reset_rx_clk(i_4),
    .address(i_5),
    .read(i_6),
    .writedata(i_7),
    .write(i_8),
    .reset(i_9),
    .rxp(i_10),
    .ref_clk(i_11),
    .reconfig_clk(i_12),
    .reconfig_togxb(i_13),
    .gxb_cal_blk_clk(i_14),
    .gmii_rx_d(out_dut[50:43]),
    .gmii_rx_dv(out_dut[42:42]),
    .gmii_rx_err(out_dut[41:41]),
    .tx_clk(out_dut[40:40]),
    .rx_clk(out_dut[39:39]),
    .readdata(out_dut[38:23]),
    .waitrequest(out_dut[22:22]),
    .txp(out_dut[21:21]),
    .reconfig_fromgxb(out_dut[20:4]),
    .led_an(out_dut[3:3]),
    .led_disp_err(out_dut[2:2]),
    .led_char_err(out_dut[1:1]),
    .led_link(out_dut[0:0])
  );
  rtlpp_06923__ref ref_i (
    .clk(clk),
    .gmii_tx_d(i_0),
    .gmii_tx_en(i_1),
    .gmii_tx_err(i_2),
    .reset_tx_clk(i_3),
    .reset_rx_clk(i_4),
    .address(i_5),
    .read(i_6),
    .writedata(i_7),
    .write(i_8),
    .reset(i_9),
    .rxp(i_10),
    .ref_clk(i_11),
    .reconfig_clk(i_12),
    .reconfig_togxb(i_13),
    .gxb_cal_blk_clk(i_14),
    .gmii_rx_d(out_ref[50:43]),
    .gmii_rx_dv(out_ref[42:42]),
    .gmii_rx_err(out_ref[41:41]),
    .tx_clk(out_ref[40:40]),
    .rx_clk(out_ref[39:39]),
    .readdata(out_ref[38:23]),
    .waitrequest(out_ref[22:22]),
    .txp(out_ref[21:21]),
    .reconfig_fromgxb(out_ref[20:4]),
    .led_an(out_ref[3:3]),
    .led_disp_err(out_ref[2:2]),
    .led_char_err(out_ref[1:1]),
    .led_link(out_ref[0:0])
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
    seed = 3054524878;
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
      i_9 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
