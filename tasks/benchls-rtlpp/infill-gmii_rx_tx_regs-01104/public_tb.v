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

  rtlpp_01104 dut (
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
    stim[0] = 23'h567e2a;
    stim[1] = 23'h463642;
    stim[2] = 23'h686b0a;
    stim[3] = 23'h72108f;
    stim[4] = 23'h2b61df;
    stim[5] = 23'h62f3d0;
    stim[6] = 23'h2448c0;
    stim[7] = 23'h60b3cb;
    stim[8] = 23'h2e1b11;
    stim[9] = 23'h7af9bd;
    stim[10] = 23'h20c9db;
    stim[11] = 23'h7b7bb8;
    stim[12] = 23'h6ded5f;
    stim[13] = 23'h73c444;
    stim[14] = 23'h70c4bf;
    stim[15] = 23'h65359a;
    stim[16] = 23'h7a343b;
    stim[17] = 23'h243d5f;
    stim[18] = 23'h37e205;
    stim[19] = 23'h26bdb6;
    stim[20] = 23'h62a6e6;
    stim[21] = 23'h7ee1b2;
    stim[22] = 23'h676802;
    stim[23] = 23'h37c2a6;
    stim[24] = 23'h298838;
    stim[25] = 23'h71db8e;
    stim[26] = 23'h2b524d;
    stim[27] = 23'h37bda3;
    stim[28] = 23'h2c3d15;
    stim[29] = 23'h79c780;
    stim[30] = 23'h31e860;
    stim[31] = 23'h39eff2;
    stim[32] = 23'h626dfd;
    stim[33] = 23'h272148;
    stim[34] = 23'h6f6091;
    stim[35] = 23'h670d6d;
    stim[36] = 23'h3347d2;
    stim[37] = 23'h349b32;
    stim[38] = 23'h6906fd;
    stim[39] = 23'h19880f;
    stim[40] = 23'h6d6534;
    stim[41] = 23'h72fe67;
    stim[42] = 23'h386e78;
    stim[43] = 23'h13ee76;
    stim[44] = 23'h2a0021;
    stim[45] = 23'h7e3c2a;
    stim[46] = 23'h247812;
    stim[47] = 23'h2ffeb3;
    stim[48] = 23'h3ed12c;
    stim[49] = 23'h287e4c;
    stim[50] = 23'h75d6dd;
    stim[51] = 23'h32ea14;
    stim[52] = 23'h3675e5;
    stim[53] = 23'h680705;
    stim[54] = 23'h02d249;
    stim[55] = 23'h31ca5a;
    stim[56] = 23'h39a382;
    stim[57] = 23'h729be3;
    stim[58] = 23'h63c4b1;
    stim[59] = 23'h264336;
    stim[60] = 23'h6b1e56;
    stim[61] = 23'h770286;
    stim[62] = 23'h67099f;
    stim[63] = 23'h29cba4;
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
      expv[3] = 20'h86800;
      expv[4] = 20'h21000;
      expv[5] = 20'hb63d0;
      expv[6] = 20'h2f3d0;
      expv[7] = 20'h44bcb;
      expv[8] = 20'h0b3cb;
      expv[9] = 20'he19bd;
      expv[10] = 20'haf9bd;
      expv[11] = 20'h0cbb8;
      expv[12] = 20'hb7bb8;
      expv[13] = 20'hdefb8;
      expv[14] = 20'h3c7b8;
      expv[15] = 20'h0c7b8;
      expv[16] = 20'h537b8;
      expv[17] = 20'ha37b8;
      expv[18] = 20'h43fb8;
      expv[19] = 20'h7e3b8;
      expv[20] = 20'h6bee6;
      expv[21] = 20'h2a6e6;
      expv[22] = 20'hee2e6;
      expv[23] = 20'h76ae6;
      expv[24] = 20'h7c2e6;
      expv[25] = 20'h98b8e;
      expv[26] = 20'h1db8e;
      expv[27] = 20'hb538e;
      expv[28] = 20'h7bf8e;
      expv[29] = 20'hc3f80;
      expv[30] = 20'h9c780;
      expv[31] = 20'h1eb80;
      expv[32] = 20'h9edfd;
      expv[33] = 20'h26dfd;
      expv[34] = 20'h72091;
      expv[35] = 20'hf6091;
      expv[36] = 20'h70c91;
      expv[37] = 20'h34491;
      expv[38] = 20'h49afd;
      expv[39] = 20'h00000;
      expv[40] = 20'h00134;
      expv[41] = 20'hd6534;
      expv[42] = 20'h2fd34;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'ha002a;
      expv[46] = 20'he3c2a;
      expv[47] = 20'h4782a;
      expv[48] = 20'hffc2a;
      expv[49] = 20'hed02a;
      expv[50] = 20'h87edd;
      expv[51] = 20'h5d6dd;
      expv[52] = 20'h2eadd;
      expv[53] = 20'h67705;
      expv[54] = 20'h00000;
      expv[55] = 20'h00000;
      expv[56] = 20'h1c800;
      expv[57] = 20'h9a3e3;
      expv[58] = 20'h29be3;
      expv[59] = 20'h3c7e3;
      expv[60] = 20'h64256;
      expv[61] = 20'hb1e56;
      expv[62] = 20'h70256;
      expv[63] = 20'h70a56;
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
