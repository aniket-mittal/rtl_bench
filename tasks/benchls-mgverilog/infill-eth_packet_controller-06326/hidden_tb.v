// Hidden tests: 5000 cycles of seeded random inputs (seed 3437293790); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 611;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [9:0] i_6;
  reg [23:0] i_7;
  reg [15:0] i_8;
  reg [15:0] i_9;
  reg [15:0] i_10;
  reg [7:0] i_11;
  reg [23:0] i_12;
  reg [127:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06326 dut (
    .CLK(clk),
    .OUT_TICK(i_0),
    .ETH_WR_DONE(i_1),
    .ETH_WR_BUSY(i_2),
    .ETH_RD_DONE(i_3),
    .ETH_RD_BUSY(i_4),
    .ETH_RD_READY(i_5),
    .IN_ETH_STREAM(i_6),
    .PROCESS_TIME(i_7),
    .TEMPERATURE(i_8),
    .V_VCCINT(i_9),
    .V_VCCAUX(i_10),
    .BUTTONS(i_11),
    .ETH_RD_PIX(i_12),
    .USER_STATUS(i_13),
    .ETH_WR_CLK(out_dut[610:610]),
    .ETH_WR_STB(out_dut[609:609]),
    .ETH_RD_CLK(out_dut[608:608]),
    .OUT_ETH_STREAM(out_dut[607:598]),
    .ETH_BUSY(out_dut[597:597]),
    .CTRL_BUSY(out_dut[596:596]),
    .CTRL_STRB(out_dut[595:595]),
    .ETH_WR_GO(out_dut[594:594]),
    .ETH_RD_GO(out_dut[593:593]),
    .ETH_RD_STB(out_dut[592:592]),
    .CTRL_ENABLES(out_dut[591:576]),
    .IMG_SIZE_X(out_dut[575:560]),
    .IMG_SIZE_Y(out_dut[559:544]),
    .CTRL_COEFF(out_dut[543:144]),
    .ETH_WR_START_X(out_dut[143:128]),
    .ETH_WR_LINE(out_dut[127:112]),
    .ETH_WR_NUM_PIXELS(out_dut[111:96]),
    .ETH_WR_PIX(out_dut[95:72]),
    .ETH_RD_START_X(out_dut[71:56]),
    .ETH_RD_LINE(out_dut[55:40]),
    .ETH_RD_NUM_PIXELS(out_dut[39:24]),
    .USER_CTRL_EN(out_dut[23:16]),
    .USER_CTRL(out_dut[15:0])
  );
  mg_06326__ref ref_i (
    .CLK(clk),
    .OUT_TICK(i_0),
    .ETH_WR_DONE(i_1),
    .ETH_WR_BUSY(i_2),
    .ETH_RD_DONE(i_3),
    .ETH_RD_BUSY(i_4),
    .ETH_RD_READY(i_5),
    .IN_ETH_STREAM(i_6),
    .PROCESS_TIME(i_7),
    .TEMPERATURE(i_8),
    .V_VCCINT(i_9),
    .V_VCCAUX(i_10),
    .BUTTONS(i_11),
    .ETH_RD_PIX(i_12),
    .USER_STATUS(i_13),
    .ETH_WR_CLK(out_ref[610:610]),
    .ETH_WR_STB(out_ref[609:609]),
    .ETH_RD_CLK(out_ref[608:608]),
    .OUT_ETH_STREAM(out_ref[607:598]),
    .ETH_BUSY(out_ref[597:597]),
    .CTRL_BUSY(out_ref[596:596]),
    .CTRL_STRB(out_ref[595:595]),
    .ETH_WR_GO(out_ref[594:594]),
    .ETH_RD_GO(out_ref[593:593]),
    .ETH_RD_STB(out_ref[592:592]),
    .CTRL_ENABLES(out_ref[591:576]),
    .IMG_SIZE_X(out_ref[575:560]),
    .IMG_SIZE_Y(out_ref[559:544]),
    .CTRL_COEFF(out_ref[543:144]),
    .ETH_WR_START_X(out_ref[143:128]),
    .ETH_WR_LINE(out_ref[127:112]),
    .ETH_WR_NUM_PIXELS(out_ref[111:96]),
    .ETH_WR_PIX(out_ref[95:72]),
    .ETH_RD_START_X(out_ref[71:56]),
    .ETH_RD_LINE(out_ref[55:40]),
    .ETH_RD_NUM_PIXELS(out_ref[39:24]),
    .USER_CTRL_EN(out_ref[23:16]),
    .USER_CTRL(out_ref[15:0])
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
    seed = 3437293790;
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
      i_13 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
