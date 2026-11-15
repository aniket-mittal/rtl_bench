// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03311 dut (
    .gmii_rxclk(clk),
    .gmii_txclk(in_vec[22:22]),
    .rst_n(in_vec[21:21]),
    .port_type(in_vec[20:20]),
    .gmii_rx_dv(in_vec[19:19]),
    .gmii_rx_er(in_vec[18:18]),
    .gmii_rxd(in_vec[17:10]),
    .gmii_tx_en_tsnchip2adp(in_vec[9:9]),
    .gmii_tx_er_tsnchip2adp(in_vec[8:8]),
    .gmii_txd_tsnchip2adp(in_vec[7:0]),
    .gmii_rx_dv_adp2tsnchip(out_vec[19:19]),
    .gmii_rx_er_adp2tsnchip(out_vec[18:18]),
    .gmii_rxd_adp2tsnchip(out_vec[17:10]),
    .gmii_tx_en(out_vec[9:9]),
    .gmii_tx_er(out_vec[8:8]),
    .gmii_txd(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h42213e;
    stim[1] = 23'h1cb590;
    stim[2] = 23'h3ad678;
    stim[3] = 23'h7be00d;
    stim[4] = 23'h66cbbc;
    stim[5] = 23'h63daa5;
    stim[6] = 23'h649cf8;
    stim[7] = 23'h72fa3b;
    stim[8] = 23'h20acdb;
    stim[9] = 23'h6dfa10;
    stim[10] = 23'h66e007;
    stim[11] = 23'h2b67be;
    stim[12] = 23'h6995f0;
    stim[13] = 23'h60bad4;
    stim[14] = 23'h2a602b;
    stim[15] = 23'h7c4a6a;
    stim[16] = 23'h72a216;
    stim[17] = 23'h662300;
    stim[18] = 23'h22c88c;
    stim[19] = 23'h3e3448;
    stim[20] = 23'h6a1cea;
    stim[21] = 23'h63382e;
    stim[22] = 23'h7555ee;
    stim[23] = 23'h313b7d;
    stim[24] = 23'h7ca532;
    stim[25] = 23'h60c154;
    stim[26] = 23'h6f7949;
    stim[27] = 23'h62a3fa;
    stim[28] = 23'h64b851;
    stim[29] = 23'h3f786e;
    stim[30] = 23'h36f2db;
    stim[31] = 23'h2e82f5;
    stim[32] = 23'h7e6348;
    stim[33] = 23'h77f7ca;
    stim[34] = 23'h2a76a6;
    stim[35] = 23'h78f39a;
    stim[36] = 23'h7397a7;
    stim[37] = 23'h338726;
    stim[38] = 23'h3f0b0c;
    stim[39] = 23'h20523f;
    stim[40] = 23'h642834;
    stim[41] = 23'h60f0bb;
    stim[42] = 23'h6cb728;
    stim[43] = 23'h28c687;
    stim[44] = 23'h6cd37a;
    stim[45] = 23'h6a17cf;
    stim[46] = 23'h268b7e;
    stim[47] = 23'h3eb5ac;
    stim[48] = 23'h28a6aa;
    stim[49] = 23'h67c7a0;
    stim[50] = 23'h7d8fe0;
    stim[51] = 23'h73f993;
    stim[52] = 23'h3a0e46;
    stim[53] = 23'h21a7c7;
    stim[54] = 23'h3336d8;
    stim[55] = 23'h76a0a4;
    stim[56] = 23'h2381d7;
    stim[57] = 23'h3aa551;
    stim[58] = 23'h3cde0a;
    stim[59] = 23'h70d541;
    stim[60] = 23'h7ac210;
    stim[61] = 23'h31e601;
    stim[62] = 23'h793cf5;
    stim[63] = 23'h2183a9;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00000;
      expv[3] = 20'had40d;
      expv[4] = 20'hbe00d;
      expv[5] = 20'h0000d;
      expv[6] = 20'h0000d;
      expv[7] = 20'h0000d;
      expv[8] = 20'h2f80d;
      expv[9] = 20'h00210;
      expv[10] = 20'h00210;
      expv[11] = 20'h00210;
      expv[12] = 20'h001f0;
      expv[13] = 20'h001f0;
      expv[14] = 20'h001f0;
      expv[15] = 20'h0026a;
      expv[16] = 20'hc4a6a;
      expv[17] = 20'h2a26a;
      expv[18] = 20'h0026a;
      expv[19] = 20'h0026a;
      expv[20] = 20'he34ea;
      expv[21] = 20'h000ea;
      expv[22] = 20'h000ea;
      expv[23] = 20'h554ea;
      expv[24] = 20'h13932;
      expv[25] = 20'hca532;
      expv[26] = 20'h00132;
      expv[27] = 20'h00132;
      expv[28] = 20'h00132;
      expv[29] = 20'h00132;
      expv[30] = 20'hf7932;
      expv[31] = 20'h6f132;
      expv[32] = 20'h00348;
      expv[33] = 20'he6348;
      expv[34] = 20'h7f748;
      expv[35] = 20'h0039a;
      expv[36] = 20'h8f39a;
      expv[37] = 20'h3979a;
      expv[38] = 20'h3879a;
      expv[39] = 20'hf0b9a;
      expv[40] = 20'h00034;
      expv[41] = 20'h00034;
      expv[42] = 20'h00034;
      expv[43] = 20'h00034;
      expv[44] = 20'h0037a;
      expv[45] = 20'h0037a;
      expv[46] = 20'h0037a;
      expv[47] = 20'h0037a;
      expv[48] = 20'heb77a;
      expv[49] = 20'h003a0;
      expv[50] = 20'h003a0;
      expv[51] = 20'hd8fa0;
      expv[52] = 20'h3fba0;
      expv[53] = 20'ha0fa0;
      expv[54] = 20'h003a0;
      expv[55] = 20'h334a4;
      expv[56] = 20'h6a0a4;
      expv[57] = 20'h000a4;
      expv[58] = 20'haa4a4;
      expv[59] = 20'hcdd41;
      expv[60] = 20'h0d541;
      expv[61] = 20'hac141;
      expv[62] = 20'h1e4f5;
      expv[63] = 20'h93cf5;
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
