// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_130872 dut (
    .CLK(clk),
    .TRANSMIT(in_vec[41:39]),
    .PRL_Rx_Message_Discard(in_vec[38:38]),
    .Hard_Reset_received(in_vec[37:37]),
    .Cable_Reset_received(in_vec[36:36]),
    .RetryCounter(in_vec[35:28]),
    .CRCReceiveTimer_Timeout(in_vec[27:27]),
    .GoodCRC_Response_from_PHY(in_vec[26:26]),
    .Message_discarded_bus_Idle(in_vec[25:25]),
    .TX_BUF_HEADER_BYTE_1(in_vec[24:17]),
    .RX_BUF_HEADER_BYTE_1(in_vec[16:9]),
    .RX_BUF_FRAME_TYPE(in_vec[8:1]),
    .RESET(in_vec[0:0]),
    .ALERT_TransmitSOP_MessageFailed(out_vec[47:47]),
    .ALERT_TransmitSuccessful(out_vec[46:46]),
    .MessageID_mismatch(out_vec[45:45]),
    .SOP_mismatch(out_vec[44:44]),
    .MessageID_SOP_match(out_vec[43:43]),
    .TRANSMIT_BYTE_COUNT(out_vec[42:35]),
    .TRANSMIT_HEADER_LOW(out_vec[34:27]),
    .TRANSMIT_HEADER_HIGH(out_vec[26:19]),
    .TRANSMIT_DATA_OBJECTS(out_vec[18:11]),
    .Start_CRCReceiveTimer(out_vec[10:10]),
    .Stop_CRCReceiverTimer(out_vec[9:9]),
    .MessageIDCounter(out_vec[8:8]),
    .MessageID(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h32523cf4cb3;
    stim[1] = 42'h1bdf653f9bf;
    stim[2] = 42'h3a00024511a;
    stim[3] = 42'h28a9ccf6d5e;
    stim[4] = 42'h151b8a7399a;
    stim[5] = 42'h0a11445b952;
    stim[6] = 42'h05c2da1e936;
    stim[7] = 42'h1e900cb9102;
    stim[8] = 42'h398678d1204;
    stim[9] = 42'h1065c743c86;
    stim[10] = 42'h17bca15ea36;
    stim[11] = 42'h0e99bcfecac;
    stim[12] = 42'h0ffdce07042;
    stim[13] = 42'h2aa1bd7c356;
    stim[14] = 42'h1d0b123955e;
    stim[15] = 42'h268c7e85c68;
    stim[16] = 42'h2f8deb354d2;
    stim[17] = 42'h2ea6837378e;
    stim[18] = 42'h1f32c087bf4;
    stim[19] = 42'h0deceb1b1d4;
    stim[20] = 42'h2eb8908b586;
    stim[21] = 42'h15110bbf030;
    stim[22] = 42'h1940b4abcfc;
    stim[23] = 42'h024a10ed528;
    stim[24] = 42'h3a075f68734;
    stim[25] = 42'h1e76b6c36c4;
    stim[26] = 42'h3462a567616;
    stim[27] = 42'h29077c60524;
    stim[28] = 42'h1e1fbee0786;
    stim[29] = 42'h2e4c774a2ba;
    stim[30] = 42'h2f45c73b042;
    stim[31] = 42'h1c9bc2093e0;
    stim[32] = 42'h069a55b8076;
    stim[33] = 42'h10ad4816f08;
    stim[34] = 42'h257915eacb6;
    stim[35] = 42'h3c92d5ba4de;
    stim[36] = 42'h1107b34f6ac;
    stim[37] = 42'h0f222a5e679;
    stim[38] = 42'h0da175ae5be;
    stim[39] = 42'h024d4d25e4e;
    stim[40] = 42'h39fcf410360;
    stim[41] = 42'h2e6922e8f70;
    stim[42] = 42'h1b9aa5e7e76;
    stim[43] = 42'h152debdd866;
    stim[44] = 42'h1cae97f4ed8;
    stim[45] = 42'h0924ff91962;
    stim[46] = 42'h0fbeb6b14ca;
    stim[47] = 42'h180f249a506;
    stim[48] = 42'h1f3bc6fc066;
    stim[49] = 42'h0404f4601e8;
    stim[50] = 42'h22e53c09560;
    stim[51] = 42'h0332bd14c3e;
    stim[52] = 42'h3c63a22836a;
    stim[53] = 42'h3beafa4fb62;
    stim[54] = 42'h1345887ab36;
    stim[55] = 42'h0ead320138d;
    stim[56] = 42'h28770d8e168;
    stim[57] = 42'h3e413fa9b1e;
    stim[58] = 42'h1c3b63815c2;
    stim[59] = 42'h151360c7970;
    stim[60] = 42'h03d9a6c3c9c;
    stim[61] = 42'h2516a50ffdc;
    stim[62] = 42'h3ea97909e26;
    stim[63] = 42'h28cb8921438;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h001298000400;
      expv[5] = 48'h000000000000;
      expv[6] = 48'h300000000000;
      expv[7] = 48'h000000000000;
      expv[8] = 48'h001630000400;
      expv[9] = 48'h000000000000;
      expv[10] = 48'h000000000000;
      expv[11] = 48'h001738000400;
      expv[12] = 48'h000000000000;
      expv[13] = 48'h000000000000;
      expv[14] = 48'h001488000400;
      expv[15] = 48'h000000000000;
      expv[16] = 48'h000000000000;
      expv[17] = 48'h800000000000;
      expv[18] = 48'h000000000000;
      expv[19] = 48'h000000000000;
      expv[20] = 48'h000000000000;
      expv[21] = 48'h000000000000;
      expv[22] = 48'h000000000000;
      expv[23] = 48'h000000000000;
      expv[24] = 48'h000000000000;
      expv[25] = 48'h000000000000;
      expv[26] = 48'h000000000000;
      expv[27] = 48'h000000000000;
      expv[28] = 48'h000000000000;
      expv[29] = 48'h000000000000;
      expv[30] = 48'h000000000000;
      expv[31] = 48'h000000000000;
      expv[32] = 48'h000000000000;
      expv[33] = 48'h000000000000;
      expv[34] = 48'h001578000400;
      expv[35] = 48'h000000000000;
      expv[36] = 48'h000000000000;
      expv[37] = 48'h000000000000;
      expv[38] = 48'h000000000000;
      expv[39] = 48'h000000000000;
      expv[40] = 48'h000000000000;
      expv[41] = 48'h000000000000;
      expv[42] = 48'h000000000000;
      expv[43] = 48'h000000000000;
      expv[44] = 48'h000000000000;
      expv[45] = 48'h000000000000;
      expv[46] = 48'h000000000000;
      expv[47] = 48'h000000000000;
      expv[48] = 48'h0011b8000400;
      expv[49] = 48'h000000000000;
      expv[50] = 48'h000000000000;
      expv[51] = 48'h001740000400;
      expv[52] = 48'h000000000000;
      expv[53] = 48'h000000000000;
      expv[54] = 48'h001218000400;
      expv[55] = 48'h000000000000;
      expv[56] = 48'h000000000000;
      expv[57] = 48'h0017e8000400;
      expv[58] = 48'h000000000000;
      expv[59] = 48'h000000000000;
      expv[60] = 48'h0011b0000400;
      expv[61] = 48'h000000000000;
      expv[62] = 48'h000000000000;
      expv[63] = 48'h001248000400;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
