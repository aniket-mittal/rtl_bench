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

  rtlpp_01103 dut (
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
    stim[0] = 23'h0e244c;
    stim[1] = 23'h1cd466;
    stim[2] = 23'h38a611;
    stim[3] = 23'h71554e;
    stim[4] = 23'h77a174;
    stim[5] = 23'h36cd14;
    stim[6] = 23'h710548;
    stim[7] = 23'h6c9ea9;
    stim[8] = 23'h246ff3;
    stim[9] = 23'h6f639b;
    stim[10] = 23'h29913e;
    stim[11] = 23'h7776dd;
    stim[12] = 23'h22a473;
    stim[13] = 23'h347291;
    stim[14] = 23'h61de17;
    stim[15] = 23'h6b74ff;
    stim[16] = 23'h3343cb;
    stim[17] = 23'h7507f7;
    stim[18] = 23'h2b46eb;
    stim[19] = 23'h6d0ca6;
    stim[20] = 23'h77fce6;
    stim[21] = 23'h2551c6;
    stim[22] = 23'h33211e;
    stim[23] = 23'h2bb259;
    stim[24] = 23'h6f6ca9;
    stim[25] = 23'h23a63e;
    stim[26] = 23'h7d9543;
    stim[27] = 23'h3a4219;
    stim[28] = 23'h30182c;
    stim[29] = 23'h31aac6;
    stim[30] = 23'h2afde5;
    stim[31] = 23'h39d075;
    stim[32] = 23'h356e5b;
    stim[33] = 23'h71ef36;
    stim[34] = 23'h25d745;
    stim[35] = 23'h612b89;
    stim[36] = 23'h2c1c29;
    stim[37] = 23'h25bd9a;
    stim[38] = 23'h3fa2cf;
    stim[39] = 23'h37ad2c;
    stim[40] = 23'h317d45;
    stim[41] = 23'h268d90;
    stim[42] = 23'h758d93;
    stim[43] = 23'h2a74c9;
    stim[44] = 23'h270362;
    stim[45] = 23'h7b8bdf;
    stim[46] = 23'h7796bb;
    stim[47] = 23'h397260;
    stim[48] = 23'h341c4c;
    stim[49] = 23'h27d0a4;
    stim[50] = 23'h2005cf;
    stim[51] = 23'h70e9bf;
    stim[52] = 23'h6efb90;
    stim[53] = 23'h37c323;
    stim[54] = 23'h391b95;
    stim[55] = 23'h34b258;
    stim[56] = 23'h62dae7;
    stim[57] = 23'h65c087;
    stim[58] = 23'h72fdcb;
    stim[59] = 23'h3cf3bb;
    stim[60] = 23'h2ba4de;
    stim[61] = 23'h21013e;
    stim[62] = 23'h7c3c94;
    stim[63] = 23'h653e96;
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
      expv[3] = 20'h8a54e;
      expv[4] = 20'h1554e;
      expv[5] = 20'h7a14e;
      expv[6] = 20'h6cd48;
      expv[7] = 20'h10548;
      expv[8] = 20'h10548;
      expv[9] = 20'h1079b;
      expv[10] = 20'h1079b;
      expv[11] = 20'h106dd;
      expv[12] = 20'h776dd;
      expv[13] = 20'h776dd;
      expv[14] = 20'h47217;
      expv[15] = 20'h47217;
      expv[16] = 20'h47217;
      expv[17] = 20'h343f7;
      expv[18] = 20'h507f7;
      expv[19] = 20'h504a6;
      expv[20] = 20'h504a6;
      expv[21] = 20'h7fca6;
      expv[22] = 20'h7fca6;
      expv[23] = 20'h320a6;
      expv[24] = 20'h320a9;
      expv[25] = 20'h320a9;
      expv[26] = 20'h32143;
      expv[27] = 20'hd9543;
      expv[28] = 20'ha4143;
      expv[29] = 20'h01943;
      expv[30] = 20'h1a943;
      expv[31] = 20'h1a943;
      expv[32] = 20'h9d143;
      expv[33] = 20'h56f36;
      expv[34] = 20'h1ef36;
      expv[35] = 20'h1ef89;
      expv[36] = 20'h1ef89;
      expv[37] = 20'h1ef89;
      expv[38] = 20'h1ef89;
      expv[39] = 20'hfa389;
      expv[40] = 20'h7af89;
      expv[41] = 20'h17f89;
      expv[42] = 20'h17d93;
      expv[43] = 20'h58d93;
      expv[44] = 20'h58d93;
      expv[45] = 20'h58fdf;
      expv[46] = 20'hb8bdf;
      expv[47] = 20'h797df;
      expv[48] = 20'h973df;
      expv[49] = 20'h41fdf;
      expv[50] = 20'h41fdf;
      expv[51] = 20'h41dbf;
      expv[52] = 20'h0e9bf;
      expv[53] = 20'h0e9bf;
      expv[54] = 20'h7c1bf;
      expv[55] = 20'h919bf;
      expv[56] = 20'h4b2e7;
      expv[57] = 20'h4b2e7;
      expv[58] = 20'h4b2e7;
      expv[59] = 20'h2fee7;
      expv[60] = 20'hcf2e7;
      expv[61] = 20'hcf2e7;
      expv[62] = 20'hcf094;
      expv[63] = 20'hc3c94;
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
