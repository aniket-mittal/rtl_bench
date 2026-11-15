// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 115;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_161031 dut (
    .o(in_vec[114:83]),
    .d(in_vec[82:51]),
    .insn(in_vec[50:19]),
    .br(in_vec[18:18]),
    .jp(in_vec[17:17]),
    .aluinb(in_vec[16:16]),
    .aluop(in_vec[15:10]),
    .dmwe(in_vec[9:9]),
    .rwe(in_vec[8:8]),
    .rdst(in_vec[7:3]),
    .rwd(in_vec[2:2]),
    .dm_byte(in_vec[1:1]),
    .dm_half(in_vec[0:0]),
    .dataout(out_vec[37:6]),
    .insn_to_d(out_vec[5:1]),
    .rwe_wb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 115'h607eaf8273c2146ed49c47094a6fc;
    stim[1] = 115'h1a8215ae594d7b1f56071c0845721;
    stim[2] = 115'h4983cac9c7f350134325252e7a3e5;
    stim[3] = 115'h459c86b795d48ac577fbddb2cff47;
    stim[4] = 115'h6b4c2c7e3a39c54c410e9cadcc702;
    stim[5] = 115'h2dcc07c021a2fceffeadf5832b61f;
    stim[6] = 115'h3c969f4580fdb93fd1b059823c038;
    stim[7] = 115'h4dfbdc1f698c7b997995e0dc149ea;
    stim[8] = 115'h20fb9843b6fb05d1ca96a7966d0d4;
    stim[9] = 115'h4f6a8f5bea0974878a5b947016aee;
    stim[10] = 115'h197dca023815b1ae3100d89b4761d;
    stim[11] = 115'h0da83569c6b316de36d8af2a71837;
    stim[12] = 115'h49e7746819a017dd2782f2b33ab12;
    stim[13] = 115'h01e6711349b7bc3478dd9e127aa73;
    stim[14] = 115'h61f5cae95350b0192a2dd18b1a31b;
    stim[15] = 115'h6bd005f22dc94f7cb2e05c639e257;
    stim[16] = 115'h403e5419b1b42a5095eb41eb03af0;
    stim[17] = 115'h3f7f850de9f02a606b7b14fab15e2;
    stim[18] = 115'h08b45c8982d51782457dd217529d9;
    stim[19] = 115'h5011e4b5315bcf50eb349f479a515;
    stim[20] = 115'h74146e23bbaff89876e89e9ed0e26;
    stim[21] = 115'h12bf96c1b4fc3a0ef41ab540e4c23;
    stim[22] = 115'h5b0e5abe65419b7b25c4017a13a96;
    stim[23] = 115'h48080f3479fead9bffc0c55d32318;
    stim[24] = 115'h6c13368de8036421b6a38e1fc457b;
    stim[25] = 115'h19cfb44955d2418e166b743331078;
    stim[26] = 115'h20ec992576b5684a52a16b178d496;
    stim[27] = 115'h7d3f08ba63a904d81a5f1966e0a96;
    stim[28] = 115'h21d7ca02d4229b105015fafa0f878;
    stim[29] = 115'h0f36f45b82b6d9412ce4324fdb703;
    stim[30] = 115'h4758599c23ee121f1010b27c17c9e;
    stim[31] = 115'h540a53ce18ce2caa7af1cfe59e2e1;
    stim[32] = 115'h18febe904ff425f20fa5379ccc7b2;
    stim[33] = 115'h1642b376ed279ccfd5ce4c3babe3b;
    stim[34] = 115'h7bdefeab987c04fb5ce4c6d58b667;
    stim[35] = 115'h5a292543442bfb818b2a2aef45432;
    stim[36] = 115'h17e13f481323896c542f806a7245f;
    stim[37] = 115'h681f9ad4cd500889a1f7d430dfd71;
    stim[38] = 115'h68087ed2c730190a65aba129932f6;
    stim[39] = 115'h36a598839642aef826393d2d0f9ea;
    stim[40] = 115'h5757138b7be73389921b2c5b19b47;
    stim[41] = 115'h791399e7fd98ba1d25180cfe8c7b8;
    stim[42] = 115'h493785469d33c879580e0e6f578b0;
    stim[43] = 115'h22e89bcbefa12f165b1f83c9eae0d;
    stim[44] = 115'h13b2b082f6e5b4f3d9a5a2196df79;
    stim[45] = 115'h4597ec939f748a3e8b75af8f8fa9d;
    stim[46] = 115'h5d1069deab54b25c6d0e6a1af9b4c;
    stim[47] = 115'h6e54c3989a44395c3c496b8705d84;
    stim[48] = 115'h3d165bc9191cd4f68bde27de92980;
    stim[49] = 115'h57a4522db2e52389667d9369e3211;
    stim[50] = 115'h614038d446a382d7d7e2113f341ee;
    stim[51] = 115'h0d7476d0a1b770b928987228299f4;
    stim[52] = 115'h0c7c8c9a03fe99455e452a2bb506b;
    stim[53] = 115'h247744c0484e0edc3850e8dbd8299;
    stim[54] = 115'h7329e2015870448ce0e745bcb9a28;
    stim[55] = 115'h426a0c38dca5d9a2ef582f64b62bb;
    stim[56] = 115'h543150aa692bd9204402b29877700;
    stim[57] = 115'h1ed028b970ba7099ba5a976529bdc;
    stim[58] = 115'h6ebe09c8e74b5ad4f4d57d7cccbcd;
    stim[59] = 115'h0689fa34bfe9a52eee64f660ffeae;
    stim[60] = 115'h0e8056eb44a99140353d44075061c;
    stim[61] = 115'h380dea29ed0ad08b49cefb4149a99;
    stim[62] = 115'h02741c170566cfb25ba211ae8269b;
    stim[63] = 115'h36d3a1f734cb9dc3c36c074607ff4;
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
      expv[0] = 38'h303f57c13e;
      expv[1] = 38'h0d410ad709;
      expv[2] = 38'h24c1e564f9;
      expv[3] = 38'h22ce435bd1;
      expv[4] = 38'h35a6163f01;
      expv[5] = 38'h16e603e006;
      expv[6] = 38'h1e4b4fa2ce;
      expv[7] = 38'h26fdee0fbb;
      expv[8] = 38'h107dcc21f4;
      expv[9] = 38'h27b547adfa;
      expv[10] = 38'h0cbee50106;
      expv[11] = 38'h06d41ab4cc;
      expv[12] = 38'h24f3ba3405;
      expv[13] = 38'h00f338899c;
      expv[14] = 38'h30fae57487;
      expv[15] = 38'h35e802f914;
      expv[16] = 38'h201f2a0cfc;
      expv[17] = 38'h1fbfc286f9;
      expv[18] = 38'h045a2e44f7;
      expv[19] = 38'h2808f25a85;
      expv[20] = 38'h3a0a3711c8;
      expv[21] = 38'h095fcb60c8;
      expv[22] = 38'h2d872d5f24;
      expv[23] = 38'h2404079a07;
      expv[24] = 38'h36099b46df;
      expv[25] = 38'h0ce7da249e;
      expv[26] = 38'h10764c92a4;
      expv[27] = 38'h3e9f845d24;
      expv[28] = 38'h10ebe5015e;
      expv[29] = 38'h079b7a2dc1;
      expv[30] = 38'h23ac2cce26;
      expv[31] = 38'h2a0529e738;
      expv[32] = 38'h0c7f5f482d;
      expv[33] = 38'h0b2159bb4e;
      expv[34] = 38'h3def7f55d8;
      expv[35] = 38'h2d1492a18c;
      expv[36] = 38'h0bf09fa416;
      expv[37] = 38'h340fcd6a5d;
      expv[38] = 38'h34043f697c;
      expv[39] = 38'h1b52cc41fb;
      expv[40] = 38'h2bab89c591;
      expv[41] = 38'h3c89ccf3ef;
      expv[42] = 38'h249bc2a36c;
      expv[43] = 38'h11744de5c2;
      expv[44] = 38'h09d958415f;
      expv[45] = 38'h22cbf649e6;
      expv[46] = 38'h2e8834ef53;
      expv[47] = 38'h372a61cc61;
      expv[48] = 38'h1e8b2de4a1;
      expv[49] = 38'h2bd22916c4;
      expv[50] = 38'h30a01c6a3b;
      expv[51] = 38'h06ba3b687d;
      expv[52] = 38'h063e464d1a;
      expv[53] = 38'h123ba26026;
      expv[54] = 38'h3994f1008a;
      expv[55] = 38'h2135061c6e;
      expv[56] = 38'h2a18a85501;
      expv[57] = 38'h0f68145cb7;
      expv[58] = 38'h375f04e473;
      expv[59] = 38'h0344fd1a6a;
      expv[60] = 38'h07402b7586;
      expv[61] = 38'h1c06f514e6;
      expv[62] = 38'h013a0e0ba6;
      expv[63] = 38'h1b69d0fbbd;
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
