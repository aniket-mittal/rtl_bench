// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 86;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06275 dut (
    .clk(clk),
    .reset(in_vec[85:85]),
    .sw_reset(in_vec[84:84]),
    .sw_stop(in_vec[83:83]),
    .length(in_vec[82:51]),
    .eop_enabled(in_vec[50:50]),
    .eop(in_vec[49:49]),
    .ready(in_vec[48:48]),
    .valid(in_vec[47:47]),
    .early_termination(in_vec[46:46]),
    .address_in(in_vec[45:14]),
    .write_in(in_vec[13:13]),
    .max_burst_count(in_vec[12:10]),
    .write_fifo_used(in_vec[9:4]),
    .waitrequest(in_vec[3:3]),
    .short_first_access_enable(in_vec[2:2]),
    .short_last_access_enable(in_vec[1:1]),
    .short_first_and_last_access_enable(in_vec[0:0]),
    .address_out(out_vec[38:7]),
    .write_out(out_vec[6:6]),
    .burst_count(out_vec[5:3]),
    .stall(out_vec[2:2]),
    .reset_taken(out_vec[1:1]),
    .stopped(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 86'h2112a93861025e5cf7c8f8;
    stim[1] = 86'h3e23d32151d38198442740;
    stim[2] = 86'h119a7ffde041d6d81b192c;
    stim[3] = 86'h1c5ba04f6f6ce48f5f968b;
    stim[4] = 86'h052f564e5dfd2a33954fdf;
    stim[5] = 86'h0bf30538e6f59b9544eb34;
    stim[6] = 86'h136c99e602e80c4c9df203;
    stim[7] = 86'h10ad7825a29d1918eae613;
    stim[8] = 86'h2079a44648fd14c3daed4e;
    stim[9] = 86'h00e2d740acfcf7282d2b33;
    stim[10] = 86'h0434dd9554f0886ae85740;
    stim[11] = 86'h17511e337dcc98365bfd76;
    stim[12] = 86'h0170f96918a3dd73a7fbcf;
    stim[13] = 86'h2cdcfbce57c30fec26990d;
    stim[14] = 86'h0ac8703617d24333aea8c8;
    stim[15] = 86'h0fc5b8e6647b4a9f99bba0;
    stim[16] = 86'h11d65951303cd2359e7e40;
    stim[17] = 86'h062131a4c305c017dccd4b;
    stim[18] = 86'h1bd3d3737c61c3f3686271;
    stim[19] = 86'h001ac9e90bb976547e8056;
    stim[20] = 86'h052b08160eee81ab1582b7;
    stim[21] = 86'h13aaa9e7c7550528158cc1;
    stim[22] = 86'h13f0872a509989c6527ac5;
    stim[23] = 86'h00664e593f029e14b1cd39;
    stim[24] = 86'h0b307341a7f2c2065ab8d6;
    stim[25] = 86'h093f7b5d11f1ea9e6d92f1;
    stim[26] = 86'h1eb7d848f7d6a32fe95fc9;
    stim[27] = 86'h0c050583f677213072b25e;
    stim[28] = 86'h1a6a3f1499adea1e73d6ac;
    stim[29] = 86'h1529542a3e1d6a2accb272;
    stim[30] = 86'h1a37983100530bd55c637c;
    stim[31] = 86'h1e9a9ab09a041afd1a7d48;
    stim[32] = 86'h11ca5875ecfb5367fbd64c;
    stim[33] = 86'h0b5ee83ccb79d89165e746;
    stim[34] = 86'h0db6c807251a5c5b011924;
    stim[35] = 86'h0f5fbb4a525d3bda8739c3;
    stim[36] = 86'h1285f946b05b54145fff67;
    stim[37] = 86'h19333f31d97cad9e0bf964;
    stim[38] = 86'h01ee23d5cf67ada4b6f3a7;
    stim[39] = 86'h153be36f2a6df6fc6c8a00;
    stim[40] = 86'h0d0fcf2b2328dca2bb8c0b;
    stim[41] = 86'h0fe9d8026c043f626fff5f;
    stim[42] = 86'h0049b8ea704905434a102c;
    stim[43] = 86'h04deecdf9682ea1c3bc402;
    stim[44] = 86'h0f563f2009dfd3ca9c203d;
    stim[45] = 86'h0494ac9a3c6aaffff921fe;
    stim[46] = 86'h0b098803169134fd791afa;
    stim[47] = 86'h04621cc24d0ec50e8dfb7d;
    stim[48] = 86'h06d507f06a1a759c399855;
    stim[49] = 86'h064fda06d53bf8cad7a15e;
    stim[50] = 86'h03432a8e0e44102dc04d92;
    stim[51] = 86'h1649b35a3352903784f9ec;
    stim[52] = 86'h194c93d4796672d1aaaa89;
    stim[53] = 86'h1a69da332cd4cb1e802d5b;
    stim[54] = 86'h166c880f8cab6a68ab0bb1;
    stim[55] = 86'h3d57f95da7b357a743200e;
    stim[56] = 86'h148793ff5c7e0cf9827d45;
    stim[57] = 86'h0d69e41ae67f5e0573a7e5;
    stim[58] = 86'h16c4696f95bb9b7dbb13d7;
    stim[59] = 86'h1a00374dc32bbe3325c0af;
    stim[60] = 86'h1094691533f6bf53ad9e3d;
    stim[61] = 86'h0b9f1daa24200435b967f8;
    stim[62] = 86'h03236fdc76c3f061c76016;
    stim[63] = 86'h06860a1405cdc29fda9cf2;
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
      expv[0] = 39'h0000000004;
      expv[1] = 39'h0000000007;
      expv[2] = 39'h0000000006;
      expv[3] = 39'h0000000007;
      expv[4] = 39'h0000000004;
      expv[5] = 39'h0000000005;
      expv[6] = 39'h6b372a898e;
      expv[7] = 39'h5018993b8e;
      expv[8] = 39'h0000000004;
      expv[9] = 39'h0000000004;
      expv[10] = 39'h79ee505a48;
      expv[11] = 39'h79ee505a0e;
      expv[12] = 39'h19306cb78c;
      expv[13] = 39'h0000000005;
      expv[14] = 39'h0000000005;
      expv[15] = 39'h2486675d0d;
      expv[16] = 39'h76953f330e;
      expv[17] = 39'h79a46b3c8c;
      expv[18] = 39'h79a46b3c8f;
      expv[19] = 39'h4387e6d08c;
      expv[20] = 39'h4387e6d08c;
      expv[21] = 39'h4387e6d08e;
      expv[22] = 39'h4387e6d08e;
      expv[23] = 39'h33138ca48c;
      expv[24] = 39'h33138ca48d;
      expv[25] = 39'h65840cb50d;
      expv[26] = 39'h65840cb50f;
      expv[27] = 39'h65840cb50d;
      expv[28] = 39'h6e4260e50f;
      expv[29] = 39'h6e4260e50e;
      expv[30] = 39'h3ad455990f;
      expv[31] = 39'h2617aab88f;
      expv[32] = 39'h0835fa348e;
      expv[33] = 39'h0835fa348d;
      expv[34] = 39'h73b122cb8d;
      expv[35] = 39'h73b122cb8d;
      expv[36] = 39'h3a77b50e0e;
      expv[37] = 39'h36a828bf8f;
      expv[38] = 39'h795b3c178c;
      expv[39] = 39'h4f5b496dc8;
      expv[40] = 39'h4f5b496d8d;
      expv[41] = 39'h4f5b496d8d;
      expv[42] = 39'h087ec4df8c;
      expv[43] = 39'h087ec4df8c;
      expv[44] = 39'h087ec4df8d;
      expv[45] = 39'h3fa795380c;
      expv[46] = 39'h555ffff248;
      expv[47] = 39'h555ffff248;
      expv[48] = 39'h555ffff248;
      expv[49] = 39'h555ffff20c;
      expv[50] = 39'h77f195af48;
      expv[51] = 39'h77f195af0e;
      expv[52] = 39'h25206f098f;
      expv[53] = 39'h4ce5a3550f;
      expv[54] = 39'h29963d000e;
      expv[55] = 39'h0000000007;
      expv[56] = 39'h0000000006;
      expv[57] = 39'h7c19f3048d;
      expv[58] = 39'h7ebc0ae70e;
      expv[59] = 39'h7ebc0ae70f;
      expv[60] = 39'h7ebc0ae70e;
      expv[61] = 39'h7ebc0ae70d;
      expv[62] = 39'h40086b728c;
      expv[63] = 39'h07e0c38ec8;
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
