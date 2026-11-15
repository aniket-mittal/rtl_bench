// Hidden tests: 5000 cycles of seeded random inputs (seed 911019592); the submission must match reference.v
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
  reg [7:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_04217 dut (
    .clk(clk),
    .rst(i_0),
    .phy_tx_mode(i_1),
    .rxd(i_2),
    .rxdp(i_3),
    .rxdn(i_4),
    .LineCtrl_i(i_5),
    .DataOut_i(i_6),
    .TxValid_i(i_7),
    .usb_rst(out_dut[21:21]),
    .txdp(out_dut[20:20]),
    .txdn(out_dut[19:19]),
    .txoe(out_dut[18:18]),
    .ce_o(out_dut[17:17]),
    .sync_err_o(out_dut[16:16]),
    .bit_stuff_err_o(out_dut[15:15]),
    .byte_err_o(out_dut[14:14]),
    .TxReady_o(out_dut[13:13]),
    .DataIn_o(out_dut[12:5]),
    .RxValid_o(out_dut[4:4]),
    .RxActive_o(out_dut[3:3]),
    .RxError_o(out_dut[2:2]),
    .LineState_o(out_dut[1:0])
  );
  rtlpp_04217__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .phy_tx_mode(i_1),
    .rxd(i_2),
    .rxdp(i_3),
    .rxdn(i_4),
    .LineCtrl_i(i_5),
    .DataOut_i(i_6),
    .TxValid_i(i_7),
    .usb_rst(out_ref[21:21]),
    .txdp(out_ref[20:20]),
    .txdn(out_ref[19:19]),
    .txoe(out_ref[18:18]),
    .ce_o(out_ref[17:17]),
    .sync_err_o(out_ref[16:16]),
    .bit_stuff_err_o(out_ref[15:15]),
    .byte_err_o(out_ref[14:14]),
    .TxReady_o(out_ref[13:13]),
    .DataIn_o(out_ref[12:5]),
    .RxValid_o(out_ref[4:4]),
    .RxActive_o(out_ref[3:3]),
    .RxError_o(out_ref[2:2]),
    .LineState_o(out_ref[1:0])
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
    seed = 911019592;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
