// Hidden tests: 5000 cycles of seeded random inputs (seed 3837104926); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 62;
  reg clk;
  reg [7:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [7:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_09637 dut (
    .clk(clk),
    .ff_tx_data(i_0),
    .ff_tx_eop(i_1),
    .ff_tx_err(i_2),
    .ff_tx_sop(i_3),
    .ff_tx_wren(i_4),
    .ff_tx_clk(i_5),
    .ff_rx_rdy(i_6),
    .ff_rx_clk(i_7),
    .address(i_8),
    .read(i_9),
    .writedata(i_10),
    .write(i_11),
    .reset(i_12),
    .mdio_in(i_13),
    .rxp(i_14),
    .ref_clk(i_15),
    .ff_tx_rdy(out_dut[61:61]),
    .ff_rx_data(out_dut[60:53]),
    .ff_rx_dval(out_dut[52:52]),
    .ff_rx_eop(out_dut[51:51]),
    .ff_rx_sop(out_dut[50:50]),
    .rx_err(out_dut[49:44]),
    .readdata(out_dut[43:12]),
    .waitrequest(out_dut[11:11]),
    .mdio_out(out_dut[10:10]),
    .mdio_oen(out_dut[9:9]),
    .mdc(out_dut[8:8]),
    .led_an(out_dut[7:7]),
    .led_char_err(out_dut[6:6]),
    .led_link(out_dut[5:5]),
    .led_disp_err(out_dut[4:4]),
    .led_crs(out_dut[3:3]),
    .led_col(out_dut[2:2]),
    .txp(out_dut[1:1]),
    .rx_recovclkout(out_dut[0:0])
  );
  rtlpp_09637__ref ref_i (
    .clk(clk),
    .ff_tx_data(i_0),
    .ff_tx_eop(i_1),
    .ff_tx_err(i_2),
    .ff_tx_sop(i_3),
    .ff_tx_wren(i_4),
    .ff_tx_clk(i_5),
    .ff_rx_rdy(i_6),
    .ff_rx_clk(i_7),
    .address(i_8),
    .read(i_9),
    .writedata(i_10),
    .write(i_11),
    .reset(i_12),
    .mdio_in(i_13),
    .rxp(i_14),
    .ref_clk(i_15),
    .ff_tx_rdy(out_ref[61:61]),
    .ff_rx_data(out_ref[60:53]),
    .ff_rx_dval(out_ref[52:52]),
    .ff_rx_eop(out_ref[51:51]),
    .ff_rx_sop(out_ref[50:50]),
    .rx_err(out_ref[49:44]),
    .readdata(out_ref[43:12]),
    .waitrequest(out_ref[11:11]),
    .mdio_out(out_ref[10:10]),
    .mdio_oen(out_ref[9:9]),
    .mdc(out_ref[8:8]),
    .led_an(out_ref[7:7]),
    .led_char_err(out_ref[6:6]),
    .led_link(out_ref[5:5]),
    .led_disp_err(out_ref[4:4]),
    .led_crs(out_ref[3:3]),
    .led_col(out_ref[2:2]),
    .txp(out_ref[1:1]),
    .rx_recovclkout(out_ref[0:0])
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
    seed = 3837104926;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
