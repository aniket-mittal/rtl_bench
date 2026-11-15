// Hidden tests: 5000 cycles of seeded random inputs (seed 3519807987); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 25;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [3:0] i_2;
  reg [3:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [7:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02592 dut (
    .reset(i_0),
    .generated_clk(i_1),
    .phy_rxd_rising(i_2),
    .phy_rxd_falling(i_3),
    .phy_rx_ctl_rising(i_4),
    .phy_rx_ctl_falling(i_5),
    .phy_rx_clk(i_6),
    .mac_tx_er(i_7),
    .mac_txd(i_8),
    .mac_tx_en(i_9),
    .phy_txd_rising(out_dut[24:21]),
    .phy_txd_falling(out_dut[20:17]),
    .phy_tx_ctl_rising(out_dut[16:16]),
    .phy_tx_ctl_falling(out_dut[15:15]),
    .phy_gtx_clk(out_dut[14:14]),
    .mac_tx_clk(out_dut[13:13]),
    .mac_col(out_dut[12:12]),
    .mac_rxd(out_dut[11:4]),
    .mac_rx_er(out_dut[3:3]),
    .mac_rx_clk(out_dut[2:2]),
    .mac_crs(out_dut[1:1]),
    .mac_rx_dv(out_dut[0:0])
  );
  mg_02592__ref ref_i (
    .reset(i_0),
    .generated_clk(i_1),
    .phy_rxd_rising(i_2),
    .phy_rxd_falling(i_3),
    .phy_rx_ctl_rising(i_4),
    .phy_rx_ctl_falling(i_5),
    .phy_rx_clk(i_6),
    .mac_tx_er(i_7),
    .mac_txd(i_8),
    .mac_tx_en(i_9),
    .phy_txd_rising(out_ref[24:21]),
    .phy_txd_falling(out_ref[20:17]),
    .phy_tx_ctl_rising(out_ref[16:16]),
    .phy_tx_ctl_falling(out_ref[15:15]),
    .phy_gtx_clk(out_ref[14:14]),
    .mac_tx_clk(out_ref[13:13]),
    .mac_col(out_ref[12:12]),
    .mac_rxd(out_ref[11:4]),
    .mac_rx_er(out_ref[3:3]),
    .mac_rx_clk(out_ref[2:2]),
    .mac_crs(out_ref[1:1]),
    .mac_rx_dv(out_ref[0:0])
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
    seed = 3519807987;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
