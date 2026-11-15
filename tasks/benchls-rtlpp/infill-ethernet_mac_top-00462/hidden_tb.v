// Hidden tests: 5000 cycles of seeded random inputs (seed 289126009); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 88;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [7:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [3:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00462 dut (
    .clk(clk),
    .ff_tx_data(i_0),
    .ff_tx_eop(i_1),
    .ff_tx_err(i_2),
    .ff_tx_mod(i_3),
    .ff_tx_sop(i_4),
    .ff_tx_wren(i_5),
    .ff_tx_clk(i_6),
    .ff_rx_rdy(i_7),
    .ff_rx_clk(i_8),
    .address(i_9),
    .read(i_10),
    .writedata(i_11),
    .write(i_12),
    .reset(i_13),
    .m_rx_d(i_14),
    .m_rx_en(i_15),
    .m_rx_err(i_16),
    .tx_clk(i_17),
    .rx_clk(i_18),
    .set_10(i_19),
    .set_1000(i_20),
    .mdio_in(i_21),
    .m_rx_col(i_22),
    .m_rx_crs(i_23),
    .ff_tx_rdy(out_dut[87:87]),
    .ff_rx_data(out_dut[86:55]),
    .ff_rx_dval(out_dut[54:54]),
    .ff_rx_eop(out_dut[53:53]),
    .ff_rx_mod(out_dut[52:51]),
    .ff_rx_sop(out_dut[50:50]),
    .rx_err(out_dut[49:44]),
    .readdata(out_dut[43:12]),
    .waitrequest(out_dut[11:11]),
    .m_tx_d(out_dut[10:7]),
    .m_tx_en(out_dut[6:6]),
    .m_tx_err(out_dut[5:5]),
    .ena_10(out_dut[4:4]),
    .eth_mode(out_dut[3:3]),
    .mdio_out(out_dut[2:2]),
    .mdio_oen(out_dut[1:1]),
    .mdc(out_dut[0:0])
  );
  rtlpp_00462__ref ref_i (
    .clk(clk),
    .ff_tx_data(i_0),
    .ff_tx_eop(i_1),
    .ff_tx_err(i_2),
    .ff_tx_mod(i_3),
    .ff_tx_sop(i_4),
    .ff_tx_wren(i_5),
    .ff_tx_clk(i_6),
    .ff_rx_rdy(i_7),
    .ff_rx_clk(i_8),
    .address(i_9),
    .read(i_10),
    .writedata(i_11),
    .write(i_12),
    .reset(i_13),
    .m_rx_d(i_14),
    .m_rx_en(i_15),
    .m_rx_err(i_16),
    .tx_clk(i_17),
    .rx_clk(i_18),
    .set_10(i_19),
    .set_1000(i_20),
    .mdio_in(i_21),
    .m_rx_col(i_22),
    .m_rx_crs(i_23),
    .ff_tx_rdy(out_ref[87:87]),
    .ff_rx_data(out_ref[86:55]),
    .ff_rx_dval(out_ref[54:54]),
    .ff_rx_eop(out_ref[53:53]),
    .ff_rx_mod(out_ref[52:51]),
    .ff_rx_sop(out_ref[50:50]),
    .rx_err(out_ref[49:44]),
    .readdata(out_ref[43:12]),
    .waitrequest(out_ref[11:11]),
    .m_tx_d(out_ref[10:7]),
    .m_tx_en(out_ref[6:6]),
    .m_tx_err(out_ref[5:5]),
    .ena_10(out_ref[4:4]),
    .eth_mode(out_ref[3:3]),
    .mdio_out(out_ref[2:2]),
    .mdio_oen(out_ref[1:1]),
    .mdc(out_ref[0:0])
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
    seed = 289126009;
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
      i_13 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
