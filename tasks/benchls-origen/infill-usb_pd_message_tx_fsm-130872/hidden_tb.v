// Hidden tests: 5000 cycles of seeded random inputs (seed 791543614); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 48;
  reg clk;
  reg [2:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [7:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [7:0] i_8;
  reg [7:0] i_9;
  reg [7:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_130872 dut (
    .CLK(clk),
    .TRANSMIT(i_0),
    .PRL_Rx_Message_Discard(i_1),
    .Hard_Reset_received(i_2),
    .Cable_Reset_received(i_3),
    .RetryCounter(i_4),
    .CRCReceiveTimer_Timeout(i_5),
    .GoodCRC_Response_from_PHY(i_6),
    .Message_discarded_bus_Idle(i_7),
    .TX_BUF_HEADER_BYTE_1(i_8),
    .RX_BUF_HEADER_BYTE_1(i_9),
    .RX_BUF_FRAME_TYPE(i_10),
    .RESET(i_11),
    .ALERT_TransmitSOP_MessageFailed(out_dut[47:47]),
    .ALERT_TransmitSuccessful(out_dut[46:46]),
    .MessageID_mismatch(out_dut[45:45]),
    .SOP_mismatch(out_dut[44:44]),
    .MessageID_SOP_match(out_dut[43:43]),
    .TRANSMIT_BYTE_COUNT(out_dut[42:35]),
    .TRANSMIT_HEADER_LOW(out_dut[34:27]),
    .TRANSMIT_HEADER_HIGH(out_dut[26:19]),
    .TRANSMIT_DATA_OBJECTS(out_dut[18:11]),
    .Start_CRCReceiveTimer(out_dut[10:10]),
    .Stop_CRCReceiverTimer(out_dut[9:9]),
    .MessageIDCounter(out_dut[8:8]),
    .MessageID(out_dut[7:0])
  );
  origen_130872__ref ref_i (
    .CLK(clk),
    .TRANSMIT(i_0),
    .PRL_Rx_Message_Discard(i_1),
    .Hard_Reset_received(i_2),
    .Cable_Reset_received(i_3),
    .RetryCounter(i_4),
    .CRCReceiveTimer_Timeout(i_5),
    .GoodCRC_Response_from_PHY(i_6),
    .Message_discarded_bus_Idle(i_7),
    .TX_BUF_HEADER_BYTE_1(i_8),
    .RX_BUF_HEADER_BYTE_1(i_9),
    .RX_BUF_FRAME_TYPE(i_10),
    .RESET(i_11),
    .ALERT_TransmitSOP_MessageFailed(out_ref[47:47]),
    .ALERT_TransmitSuccessful(out_ref[46:46]),
    .MessageID_mismatch(out_ref[45:45]),
    .SOP_mismatch(out_ref[44:44]),
    .MessageID_SOP_match(out_ref[43:43]),
    .TRANSMIT_BYTE_COUNT(out_ref[42:35]),
    .TRANSMIT_HEADER_LOW(out_ref[34:27]),
    .TRANSMIT_HEADER_HIGH(out_ref[26:19]),
    .TRANSMIT_DATA_OBJECTS(out_ref[18:11]),
    .Start_CRCReceiveTimer(out_ref[10:10]),
    .Stop_CRCReceiverTimer(out_ref[9:9]),
    .MessageIDCounter(out_ref[8:8]),
    .MessageID(out_ref[7:0])
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
    seed = 791543614;
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
      i_11 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
