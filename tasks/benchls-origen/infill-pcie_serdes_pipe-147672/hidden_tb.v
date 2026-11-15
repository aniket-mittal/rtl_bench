// Hidden tests: 5000 cycles of seeded random inputs (seed 1290371774); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 22;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [7:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_147672 dut (
    .pll_inclk(clk),
    .cal_blk_clk(i_0),
    .gxb_powerdown(i_1),
    .pipe8b10binvpolarity(i_2),
    .powerdn(i_3),
    .rx_analogreset(i_4),
    .rx_cruclk(i_5),
    .rx_datain(i_6),
    .rx_digitalreset(i_7),
    .tx_ctrlenable(i_8),
    .tx_datain(i_9),
    .tx_detectrxloop(i_10),
    .tx_digitalreset(i_11),
    .tx_forcedispcompliance(i_12),
    .tx_forceelecidle(i_13),
    .pipedatavalid(out_dut[21:21]),
    .pipeelecidle(out_dut[20:20]),
    .pipephydonestatus(out_dut[19:19]),
    .pipestatus(out_dut[18:16]),
    .pll_locked(out_dut[15:15]),
    .rx_ctrldetect(out_dut[14:14]),
    .rx_dataout(out_dut[13:6]),
    .rx_freqlocked(out_dut[5:5]),
    .rx_patterndetect(out_dut[4:4]),
    .rx_pll_locked(out_dut[3:3]),
    .rx_syncstatus(out_dut[2:2]),
    .tx_clkout(out_dut[1:1]),
    .tx_dataout(out_dut[0:0])
  );
  origen_147672__ref ref_i (
    .pll_inclk(clk),
    .cal_blk_clk(i_0),
    .gxb_powerdown(i_1),
    .pipe8b10binvpolarity(i_2),
    .powerdn(i_3),
    .rx_analogreset(i_4),
    .rx_cruclk(i_5),
    .rx_datain(i_6),
    .rx_digitalreset(i_7),
    .tx_ctrlenable(i_8),
    .tx_datain(i_9),
    .tx_detectrxloop(i_10),
    .tx_digitalreset(i_11),
    .tx_forcedispcompliance(i_12),
    .tx_forceelecidle(i_13),
    .pipedatavalid(out_ref[21:21]),
    .pipeelecidle(out_ref[20:20]),
    .pipephydonestatus(out_ref[19:19]),
    .pipestatus(out_ref[18:16]),
    .pll_locked(out_ref[15:15]),
    .rx_ctrldetect(out_ref[14:14]),
    .rx_dataout(out_ref[13:6]),
    .rx_freqlocked(out_ref[5:5]),
    .rx_patterndetect(out_ref[4:4]),
    .rx_pll_locked(out_ref[3:3]),
    .rx_syncstatus(out_ref[2:2]),
    .tx_clkout(out_ref[1:1]),
    .tx_dataout(out_ref[0:0])
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
    seed = 1290371774;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
