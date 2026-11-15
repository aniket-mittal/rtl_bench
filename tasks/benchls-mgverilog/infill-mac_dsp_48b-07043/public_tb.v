// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07043 dut (
    .in0(in_vec[56:49]),
    .in1(in_vec[48:29]),
    .in2(in_vec[28:0]),
    .dout(out_vec[28:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h1384bc84d44b1fa;
    stim[1] = 57'h00cbf0d75f59c67;
    stim[2] = 57'h1ca481f92d24a32;
    stim[3] = 57'h0f0341eec4c56cc;
    stim[4] = 57'h13c1806b9a48e7c;
    stim[5] = 57'h0a359de3671a89d;
    stim[6] = 57'h0a226809b8b50fa;
    stim[7] = 57'h0eec34d934bec98;
    stim[8] = 57'h0e6936e14409c31;
    stim[9] = 57'h119c17751bf7e64;
    stim[10] = 57'h169bfbadaea988a;
    stim[11] = 57'h18d40887c52a196;
    stim[12] = 57'h02a0b32dcaf3440;
    stim[13] = 57'h15da54af39e790b;
    stim[14] = 57'h1a9a5ec0fc58dca;
    stim[15] = 57'h01b1271e55d0f4b;
    stim[16] = 57'h1bae217a52466ef;
    stim[17] = 57'h0b20f4e2019b3b1;
    stim[18] = 57'h199a560ce0914e3;
    stim[19] = 57'h08a7bef07a8a8d4;
    stim[20] = 57'h131c5f8c2293bee;
    stim[21] = 57'h1cf27ff3346a738;
    stim[22] = 57'h1c280eedf9a8cd5;
    stim[23] = 57'h1eb36a823a8ee55;
    stim[24] = 57'h10cc7870e19670f;
    stim[25] = 57'h005ab24230ef1cd;
    stim[26] = 57'h164f6a7f0ea56b9;
    stim[27] = 57'h0f06a891f26a0a5;
    stim[28] = 57'h0950cca6a33b6fa;
    stim[29] = 57'h16859e7bf35ae2f;
    stim[30] = 57'h0bc11e44d0c3808;
    stim[31] = 57'h0f67677f4139841;
    stim[32] = 57'h06629d279fd8a39;
    stim[33] = 57'h19dcc03524e1689;
    stim[34] = 57'h14889f7343f242b;
    stim[35] = 57'h14f9ef5bca963fc;
    stim[36] = 57'h08820e2405d3386;
    stim[37] = 57'h137d48259f9ab01;
    stim[38] = 57'h09a0df9e0a2e71d;
    stim[39] = 57'h0d632d8e35fdd06;
    stim[40] = 57'h1ed8e6501709752;
    stim[41] = 57'h05bda3058ceacb8;
    stim[42] = 57'h16168a59c6ca822;
    stim[43] = 57'h04d213f0f39762f;
    stim[44] = 57'h096294fb9393632;
    stim[45] = 57'h08d260492a792e5;
    stim[46] = 57'h1e2df5763979efe;
    stim[47] = 57'h0163fdb2bb01a46;
    stim[48] = 57'h194dc27c76601b0;
    stim[49] = 57'h0a31aefe69b049c;
    stim[50] = 57'h026fa971a46c310;
    stim[51] = 57'h089861557b38d69;
    stim[52] = 57'h0aa2f6fd68dcb27;
    stim[53] = 57'h13763e8ca2619ba;
    stim[54] = 57'h152cd2b5b4c55fc;
    stim[55] = 57'h057a4d0c04bfdf6;
    stim[56] = 57'h09d022dafbdfb0b;
    stim[57] = 57'h01d4213f42f9174;
    stim[58] = 57'h1961e4785cdf1ac;
    stim[59] = 57'h0d1dc7060835238;
    stim[60] = 57'h1b2d8d3712bb45e;
    stim[61] = 57'h169cd42c0cb6049;
    stim[62] = 57'h03bb35f9a563277;
    stim[63] = 57'h099ae631b77e6c4;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 29'h0eb62232;
      expv[1] = 29'h16196ee9;
      expv[2] = 29'h14d66b9e;
      expv[3] = 29'h0d0fca94;
      expv[4] = 29'h1a1b2f32;
      expv[5] = 29'h19dd22de;
      expv[6] = 29'h1becc63e;
      expv[7] = 29'h162234cc;
      expv[8] = 29'h16526f81;
      expv[9] = 29'h196de81c;
      expv[10] = 29'h04c11302;
      expv[11] = 29'h0411ed68;
      expv[12] = 29'h1cb68d8e;
      expv[13] = 29'h1c91402d;
      expv[14] = 29'h1ab0c94a;
      expv[15] = 29'h05cc8d8e;
      expv[16] = 29'h0b3dda18;
      expv[17] = 29'h004444fa;
      expv[18] = 29'h18875dab;
      expv[19] = 29'h08b3e42c;
      expv[20] = 29'h0a95997e;
      expv[21] = 29'h1b9f60e7;
      expv[22] = 29'h03251b8b;
      expv[23] = 29'h0cf3658a;
      expv[24] = 29'h115cec5f;
      expv[25] = 29'h0329a40f;
      expv[26] = 29'h16465c87;
      expv[27] = 29'h00b62265;
      expv[28] = 29'h0ca14af8;
      expv[29] = 29'h012f6513;
      expv[30] = 29'h0d40c684;
      expv[31] = 29'h15daf506;
      expv[32] = 29'h1a403182;
      expv[33] = 29'h1ddf6b75;
      expv[34] = 29'h170236af;
      expv[35] = 29'h051ef5d7;
      expv[36] = 29'h00a3144e;
      expv[37] = 29'h02d701e7;
      expv[38] = 29'h00c48860;
      expv[39] = 29'h0409e233;
      expv[40] = 29'h0d673fc2;
      expv[41] = 29'h1b698092;
      expv[42] = 29'h042c3662;
      expv[43] = 29'h1090f0ff;
      expv[44] = 29'h199a08d1;
      expv[45] = 29'h152abcbd;
      expv[46] = 29'h0a29a909;
      expv[47] = 29'h0bc60d99;
      expv[48] = 29'h0cd3bc9c;
      expv[49] = 29'h096733cb;
      expv[50] = 29'h1adb8cb8;
      expv[51] = 29'h1af07a91;
      expv[52] = 29'h170bcbfd;
      expv[53] = 29'h10e2091c;
      expv[54] = 29'h1f87e266;
      expv[55] = 29'h02817678;
      expv[56] = 29'h12334a41;
      expv[57] = 29'h14bc7a26;
      expv[58] = 29'h068e0740;
      expv[59] = 29'h068fbf70;
      expv[60] = 29'h16ea0dc1;
      expv[61] = 29'h0aedf7c1;
      expv[62] = 29'h1be0c103;
      expv[63] = 29'h1f7611e4;
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
