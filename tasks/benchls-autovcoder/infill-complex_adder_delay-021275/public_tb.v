// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 150;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021275 dut (
    .clk(clk),
    .reset_x(in_vec[149:149]),
    .enb(in_vec[148:148]),
    .In1_re(in_vec[147:111]),
    .In1_im(in_vec[110:74]),
    .In2_re(in_vec[73:37]),
    .In2_im(in_vec[36:0]),
    .Out1_re(out_vec[73:37]),
    .Out1_im(out_vec[36:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 150'h27c62df59a393cb5d4a79fd2ae3ad89338bb03;
    stim[1] = 150'h325fa52135dbd326784a33737c1a6324f37be3;
    stim[2] = 150'h0957396140f59a45ff8908a2beffa89d374939;
    stim[3] = 150'h04fc17213039b3dd70833f27f0773dfd443420;
    stim[4] = 150'h1f669a194d8a14216fdd4b77fde7aa73a62ff5;
    stim[5] = 150'h2a724335fbf9247b354a65d86b4fdb28bfa0f2;
    stim[6] = 150'h02f6d11b86dca8057291e70bcb78b4f92d4892;
    stim[7] = 150'h08f0bd98279cb4b805ebe236e41396dfcff468;
    stim[8] = 150'h1f5659ee4b3d9e06d0c554fb88fb9f84d39d7d;
    stim[9] = 150'h1969e9ecc4e38b81765cdf945a5a5bb878d6f6;
    stim[10] = 150'h1d9a373d4c8ffd9f56ebf4aa85080b0a6c4349;
    stim[11] = 150'h120c4be7a178a6dbfb8073adada8d3375e3e36;
    stim[12] = 150'h0b25b27511e9b31e0b66138329f57afacb7e80;
    stim[13] = 150'h097f09760a7a3a28fa11c1f8bcc84c3227c9d4;
    stim[14] = 150'h1402710d979c5cbec178e1ab7d16fc24c736ad;
    stim[15] = 150'h0b1fef48e75f685b06c6591cc48ac44e4c8715;
    stim[16] = 150'h015cf0de787458a3dc911385dae5416ec5bae8;
    stim[17] = 150'h1060ab9dd24c409746abb552a5886a794c8cec;
    stim[18] = 150'h096cf70d074412a5c7bb9dd272efe74112c3da;
    stim[19] = 150'h0e652b414959314ab2fca81a4e5e36b1951121;
    stim[20] = 150'h1262f21539d83336d019dba7b26249e9aabdd6;
    stim[21] = 150'h0662c7b42c05f0f0b6f8528c3e1ec87e8d183e;
    stim[22] = 150'h0761de514e19ac078d9484ac31e4c3a944412e;
    stim[23] = 150'h1f2ea067cc6ebc3f393ac0baffc36e2b6eddb6;
    stim[24] = 150'h1f53f5848fb9d3db965ebf95ce58d4c3b25e80;
    stim[25] = 150'h07c2b0bc4e567f3bf8444f951e090eb0d98af6;
    stim[26] = 150'h11444d352c42c19b9666ac80f85663d67c6545;
    stim[27] = 150'h06b7a170590465d301f2e2b1840f1f537727f2;
    stim[28] = 150'h0af3b0c1d2fff3dae856caa0662a16eea061de;
    stim[29] = 150'h31fc17d3d00c10a4f8587b07f164c58dc6ad77;
    stim[30] = 150'h07519999fc666cfcafa60c17531a44c7222821;
    stim[31] = 150'h12dc308e6e53217c90a3009b7bc4c41e49f028;
    stim[32] = 150'h075dee7aeea7544bb6716bfae27d2ec177bfd6;
    stim[33] = 150'h08fdc601a9ea59ce1dd58356c67d9d5c4078db;
    stim[34] = 150'h1e11cfea40c2952d084532bca0d71db51dee26;
    stim[35] = 150'h10a954c8853ee3eb43b1c2bc0feeee3ed8bdb3;
    stim[36] = 150'h0bf4cb0f3cd885b453b79c1c88f39d441e6acf;
    stim[37] = 150'h101681af65692623a8f03d8b0af6181c021598;
    stim[38] = 150'h100041f9fdb54242b2c4a93d90e5a118c6e539;
    stim[39] = 150'h059c042af63752a4be776628ece9ef78586747;
    stim[40] = 150'h1a541db84fa5c99d6face279ab7b93d56bc596;
    stim[41] = 150'h03e44c85aec84e2714c0370cef74644feb9111;
    stim[42] = 150'h162c0fdd3976d1dae0c9493e518d1c8efc7b95;
    stim[43] = 150'h1d39f03508169ac43419b1d323ba31cd037531;
    stim[44] = 150'h16c1e4d59e7ebba11329304c5ce72bd82a771b;
    stim[45] = 150'h0777667d346d010aa2a1938b470e733a9773f4;
    stim[46] = 150'h1ac882368ceb7e3bea2876cd456427ce816959;
    stim[47] = 150'h3347a673881f9f46a82731f130b9538d5bf0d3;
    stim[48] = 150'h11e541885d85bc101ec2a5c7093a721f7ad0ab;
    stim[49] = 150'h07b98c4f687493cf84d9553538292c0d91b72b;
    stim[50] = 150'h1a02ee4ffb896e26dad0ba31e326a1fa7bc6fb;
    stim[51] = 150'h08f844fbaa830c9a584f515bedfb91a84569b5;
    stim[52] = 150'h0ea9eb75f47152567ae56abded3fbbee8e288c;
    stim[53] = 150'h1dbdc743cb680aaac258e2df7bdf5171fed3ad;
    stim[54] = 150'h0b755e9b549ea956a99c778981cd3c8090e7f6;
    stim[55] = 150'h18e5d3a2fa5533968cce7b35ba2a4ef3fb7fd2;
    stim[56] = 150'h0861315d7f18cde30208a511cb8754fe89c15d;
    stim[57] = 150'h0dbc429f9e608c6ba3dd5b7cd861511b2a045a;
    stim[58] = 150'h09a4d3b2ee4284450ceb6e350f4aa08a19b4d6;
    stim[59] = 150'h13aefac41f2de17609b25da15efa229c2a01f7;
    stim[60] = 150'h0a5c83f3121711ef93fbbc5d5b6ef9f2b6e670;
    stim[61] = 150'h1f0e6e68388910d6f53fff124f400122c4907d;
    stim[62] = 150'h020a73c4f26bd2b2aa9d7ea44773fcd6eaf5a4;
    stim[63] = 150'h1d171ce5f9acd17be845506a874bc5ed5f73d7;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h233737c1a6324f37be3;
      expv[2] = 74'h108a2beffa89d374939;
      expv[3] = 74'h33f27f0773dfd443420;
      expv[4] = 74'h14b77fde7aa73a62ff5;
      expv[5] = 74'h23f7ef1a33dadc7fce9;
      expv[6] = 74'h1e70bcb78b4f92d4892;
      expv[7] = 74'h3e236e41396dfcff468;
      expv[8] = 74'h154fb88fb9f84d39d7d;
      expv[9] = 74'h0b52ad5ed0b1ffa8b27;
      expv[10] = 74'h24f25003923ed4ca0e0;
      expv[11] = 74'h3da3b7cfbf736c613f0;
      expv[12] = 74'h2969623ddb924827d60;
      expv[13] = 74'h2450bb6b08a5bdec8b4;
      expv[14] = 74'h164be76ff3a4e7e358d;
      expv[15] = 74'h359b907f0ab657c3773;
      expv[16] = 74'h214221e4b2885f56b46;
      expv[17] = 74'h0b5eee8ee51907c3d4a;
      expv[18] = 74'h3b5fd5a647a51389584;
      expv[19] = 74'h0c04535d2a9c1bae2cb;
      expv[20] = 74'h1f3d299d6dcf9d08f80;
      expv[21] = 74'h0eb48c36d3e8b5acc44;
      expv[22] = 74'h11d68b73339b611f534;
      expv[23] = 74'h359778511c4383c91bc;
      expv[24] = 74'h28b3de84bd072c22cce;
      expv[25] = 74'h024927f2cfd25d0708d;
      expv[26] = 74'h2817e597a524b734adc;
      expv[27] = 74'h333c4d15a1003de0d8b;
      expv[28] = 74'h31bb3b375079f074777;
      expv[29] = 74'h0cc1b3eafd63e2d9310;
      expv[30] = 74'h20c17531a44c7222821;
      expv[31] = 74'h3009b7bc4c41e49f028;
      expv[32] = 74'h223070618a389d6e3fe;
      expv[33] = 74'h23a62ea1912249f9d03;
      expv[34] = 74'h1e9c8c472927d7d124e;
      expv[35] = 74'h147300a7f1ee423ffc4;
      expv[36] = 74'h3c671bb14ccfd193bbb;
      expv[37] = 74'h067e03d1747d4fce684;
      expv[38] = 74'h0aeddfcbefb624fcf75;
      expv[39] = 74'h366396b695cc8e913f8;
      expv[40] = 74'h0e28a29fae125fc7247;
      expv[41] = 74'h2cc145d884dc252ecfc;
      expv[42] = 74'h3de45bfa0e60163d780;
      expv[43] = 74'h33cd71b086f817a2d63;
      expv[44] = 74'h07ec86a29317edb8421;
      expv[45] = 74'h344047c75f2e97fb8be;
      expv[46] = 74'h227467acba77d69ae23;
      expv[47] = 74'h1e411be5c6e6ceaeb5d;
      expv[48] = 74'h2a5c7093a721f7ad0ab;
      expv[49] = 74'h1ce859a408d7c95bedb;
      expv[50] = 74'h13382453e03697fceab;
      expv[51] = 74'h1d21781fa7403cf2069;
      expv[52] = 74'h3eb79813e9e4a17df40;
      expv[53] = 74'h3639b0fde33cd888a61;
      expv[54] = 74'h3e6fb52bff6833b988c;
      expv[55] = 74'h1eaa78b1d08f6a63068;
      expv[56] = 74'h2de86b445ca4b6f6490;
      expv[57] = 74'h394f1c11fc6680fa78d;
      expv[58] = 74'h1a7a9f80935d6ff5809;
      expv[59] = 74'h0971647b8b7e90fa52a;
      expv[60] = 74'h0a81c0c76a56b1468dc;
      expv[61] = 74'h0ead10047cc9b2212e9;
      expv[62] = 74'h1423fe1821f1b20b2f3;
      expv[63] = 74'h114062159e831953126;
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
