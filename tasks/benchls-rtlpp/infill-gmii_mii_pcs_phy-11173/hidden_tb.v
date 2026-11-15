// Hidden tests: 5000 cycles of seeded random inputs (seed 2619204391); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 69;
  reg clk;
  reg [7:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [3:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [4:0] i_8;
  reg [0:0] i_9;
  reg [15:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [3:0] i_18;
  reg [0:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_11173 dut (
    .clk(clk),
    .gmii_tx_d(i_0),
    .gmii_tx_en(i_1),
    .gmii_tx_err(i_2),
    .mii_tx_d(i_3),
    .mii_tx_en(i_4),
    .mii_tx_err(i_5),
    .reset_tx_clk(i_6),
    .reset_rx_clk(i_7),
    .address(i_8),
    .read(i_9),
    .writedata(i_10),
    .write(i_11),
    .reset(i_12),
    .rxp(i_13),
    .ref_clk(i_14),
    .gxb_pwrdn_in(i_15),
    .gxb_cal_blk_clk(i_16),
    .reconfig_clk(i_17),
    .reconfig_togxb(i_18),
    .reconfig_busy(i_19),
    .gmii_rx_d(out_dut[68:61]),
    .gmii_rx_dv(out_dut[60:60]),
    .gmii_rx_err(out_dut[59:59]),
    .tx_clk(out_dut[58:58]),
    .rx_clk(out_dut[57:57]),
    .mii_rx_d(out_dut[56:53]),
    .mii_rx_dv(out_dut[52:52]),
    .mii_rx_err(out_dut[51:51]),
    .mii_col(out_dut[50:50]),
    .mii_crs(out_dut[49:49]),
    .set_10(out_dut[48:48]),
    .set_100(out_dut[47:47]),
    .set_1000(out_dut[46:46]),
    .hd_ena(out_dut[45:45]),
    .led_col(out_dut[44:44]),
    .led_crs(out_dut[43:43]),
    .led_an(out_dut[42:42]),
    .led_disp_err(out_dut[41:41]),
    .led_char_err(out_dut[40:40]),
    .led_link(out_dut[39:39]),
    .tx_clkena(out_dut[38:38]),
    .rx_clkena(out_dut[37:37]),
    .rx_recovclkout(out_dut[36:36]),
    .readdata(out_dut[35:20]),
    .waitrequest(out_dut[19:19]),
    .txp(out_dut[18:18]),
    .pcs_pwrdn_out(out_dut[17:17]),
    .reconfig_fromgxb(out_dut[16:0])
  );
  rtlpp_11173__ref ref_i (
    .clk(clk),
    .gmii_tx_d(i_0),
    .gmii_tx_en(i_1),
    .gmii_tx_err(i_2),
    .mii_tx_d(i_3),
    .mii_tx_en(i_4),
    .mii_tx_err(i_5),
    .reset_tx_clk(i_6),
    .reset_rx_clk(i_7),
    .address(i_8),
    .read(i_9),
    .writedata(i_10),
    .write(i_11),
    .reset(i_12),
    .rxp(i_13),
    .ref_clk(i_14),
    .gxb_pwrdn_in(i_15),
    .gxb_cal_blk_clk(i_16),
    .reconfig_clk(i_17),
    .reconfig_togxb(i_18),
    .reconfig_busy(i_19),
    .gmii_rx_d(out_ref[68:61]),
    .gmii_rx_dv(out_ref[60:60]),
    .gmii_rx_err(out_ref[59:59]),
    .tx_clk(out_ref[58:58]),
    .rx_clk(out_ref[57:57]),
    .mii_rx_d(out_ref[56:53]),
    .mii_rx_dv(out_ref[52:52]),
    .mii_rx_err(out_ref[51:51]),
    .mii_col(out_ref[50:50]),
    .mii_crs(out_ref[49:49]),
    .set_10(out_ref[48:48]),
    .set_100(out_ref[47:47]),
    .set_1000(out_ref[46:46]),
    .hd_ena(out_ref[45:45]),
    .led_col(out_ref[44:44]),
    .led_crs(out_ref[43:43]),
    .led_an(out_ref[42:42]),
    .led_disp_err(out_ref[41:41]),
    .led_char_err(out_ref[40:40]),
    .led_link(out_ref[39:39]),
    .tx_clkena(out_ref[38:38]),
    .rx_clkena(out_ref[37:37]),
    .rx_recovclkout(out_ref[36:36]),
    .readdata(out_ref[35:20]),
    .waitrequest(out_ref[19:19]),
    .txp(out_ref[18:18]),
    .pcs_pwrdn_out(out_ref[17:17]),
    .reconfig_fromgxb(out_ref[16:0])
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
    seed = 2619204391;
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
      i_12 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
