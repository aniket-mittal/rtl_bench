// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 207;
  localparam OW = 199;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128254 dut (
    .clk(clk),
    .reset(in_vec[206:206]),
    .sel(in_vec[205:205]),
    .addr(in_vec[204:199]),
    .w(in_vec[198:198]),
    .data(in_vec[197:0]),
    .out(out_vec[198:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 207'h4124da504e8e0506d682c40179d7fa9446225d8662f2773d254b;
    stim[1] = 207'h7c01abf1fc58311997c5f5d27c3700dceb4cc315848d3de2733d;
    stim[2] = 207'h19a7d246ceb0172c1dfa53f35b3f452eeedc643853b7d3151f19;
    stim[3] = 207'h12cb15e5fa6e551440a0a34c9132a1564bad12e7534adc560d94;
    stim[4] = 207'h23c080da0fbe9218a83ccd9803f9e437c313858a4dcd62e31236;
    stim[5] = 207'h14f88c83847a9347d93d1e696437351e8845d5abc8afce3094ca;
    stim[6] = 207'h261ef89297938037999961c966c4efe04e7ac019ddde5dd9ca84;
    stim[7] = 207'h3a146ca8f947bf28ff5640e409e2ed80584daeb6c40fe869807e;
    stim[8] = 207'h02d8253115cfb650c35b481303dae2b3d0b5de41eaf740bd3b46;
    stim[9] = 207'h0f4dc00d2fdee770ee822da05f0198d088e5c0facff54d286273;
    stim[10] = 207'h17d2ce442e2e2ac0248471737880fedb77c4be51bf28b9bd6d25;
    stim[11] = 207'h28b96af2f18e78353965221a67f3cd8fa029b80bddf6591d7cd8;
    stim[12] = 207'h3bcc5d0f27029810b4800a9400711f56c7ed3e777bb3963926f8;
    stim[13] = 207'h3c05f4fa598a816059d923b5e7203a9447858b43591189ffc019;
    stim[14] = 207'h217f6afb0a6502ccb282c3cc560d1d36d643165496faae09e325;
    stim[15] = 207'h370286ff62877f71c8f7ebc84da5649d6e8dd9f13d76d9f94ebc;
    stim[16] = 207'h221213b080d1bac2d6ae98912c3996a4c3d7d961d41449cd9500;
    stim[17] = 207'h0f83d21beb8429f6da96e59dabe135cfee2ba76e85ae7c1bfbff;
    stim[18] = 207'h218c29641ff6ff29a2fb08df64c504b0556c467b8899c369df72;
    stim[19] = 207'h12acd91c2180537518a51b36c389844cde37343bdb8f29444881;
    stim[20] = 207'h32fe7d3b0c052d3c94b051329a19a89b412701b5c329e0963472;
    stim[21] = 207'h39a59a37782ab5c05f937003dae7f3eb31ae0544c8fefb8cfc66;
    stim[22] = 207'h06f9943142c251d21988ad0f4c92787a2c75fbf913c4a7f9409a;
    stim[23] = 207'h2de737145c789db1d466b2129192fcb0f21bffe6d66279daba55;
    stim[24] = 207'h3b5f3f82e9d67de2f7ee5c56b6c05de3623654ff366338b4644b;
    stim[25] = 207'h37e03b2aa4977ddb7bf8e8a08f225403aba7f475ee3dacbed269;
    stim[26] = 207'h2e46eba7436f760911fbea5e7db4eed5134da0f11a13318cb409;
    stim[27] = 207'h2addc985058a6484c79444b91f4c4f805c61f68fcb9227bb01a7;
    stim[28] = 207'h2bca373723076731f818deb6c090d193df199350ef3d982b5d2b;
    stim[29] = 207'h23f4db0ea6b3e66835a10abc5716cd4a890756ef0becd9c4f82a;
    stim[30] = 207'h735d3e96957f93c3b04232d00246c861de5f1e9dcae995a9c3b2;
    stim[31] = 207'h14971161ed2755cea4ca3d27bfcc0c1e99fdcc045164637a465d;
    stim[32] = 207'h15a8f536de7880f05989761ba95f8e5e4bf576033d2beac24311;
    stim[33] = 207'h11a689d87dbcfb203104db4fa0ae42de981ce37adc3918da741a;
    stim[34] = 207'h37234991e2e83536d36e00d692e33c272aee07e4dd6b0bf62a81;
    stim[35] = 207'h075d25e4bdc6d1c183c51d062deb5dc4498a1928b3ac4648751c;
    stim[36] = 207'h3ba2320379df7d9167dfb3db3e680ede72a1194d8f306d0b2a0a;
    stim[37] = 207'h2384f87f602b1362d68be141525343588b202867ea5c87953560;
    stim[38] = 207'h03a9aac63643bc6b6ab48cb3fabd054e29675b9b320659cf16f5;
    stim[39] = 207'h308ff059cabf9010eb5d726bc9d0cc1bafd78beec143fe9dae33;
    stim[40] = 207'h2c176b776191fff614ae2d8c65032a343c6aeba85fda8157f34c;
    stim[41] = 207'h2b13d1dbb014e04e8a4d33ab8ed2e7caa72237acb1204fa14b68;
    stim[42] = 207'h230af29bdd8b0ac473da7af02ca7d5c8ccfd0cdd9e46bd624f13;
    stim[43] = 207'h02748ae84a97016a37458ac588ebd978be4f13cbbd84daa1fdc3;
    stim[44] = 207'h1fed3b96a5507ffce273fbb67a4a7b86fcbf5790f6746e79d34e;
    stim[45] = 207'h360d37173ed08d5e4895540f90531afc2595b911ff12e925d764;
    stim[46] = 207'h0c6f753530e3b9bd0915e0894017ed02f448e9830f63d4e8351d;
    stim[47] = 207'h399e5659c83836b429e59bcd93df425aeeb48d6f43139b938342;
    stim[48] = 207'h0b00f04c6af52635fad627dfe4271b56f22e3c3bcaee5fd74e7d;
    stim[49] = 207'h3a651d298a6da6daf8ecfefcffaaa37956fcdcad864e27f4333d;
    stim[50] = 207'h24a942ca37a17b9aac42f87d985fecbe16e1f72b6a9e7e360bf4;
    stim[51] = 207'h083ae2fcd955bccab93200d57124e7479bad403c802668050f7c;
    stim[52] = 207'h1344f0d7c1b49a301da43286eba79878ce6a617b2db7458d593f;
    stim[53] = 207'h2396d27f9f39c86800c4e26fbef0d2fff608a5b0d0bf24461fa7;
    stim[54] = 207'h1695884d2322befa1b185a49817fcd0deec86f13aa7d93956d56;
    stim[55] = 207'h28eb8a5bbf52ae0911df7a2a158304771733eed1075e515dbf44;
    stim[56] = 207'h3b7e6787edd36c3fe7b64c38ab801ce070b4d22382b858ce1ca8;
    stim[57] = 207'h1d516a1baeac8b63b9077ed408a40421f5467829343f2e42559b;
    stim[58] = 207'h11f14f72c5470b40382be8944cb6e177aa85c183f6f04bec73af;
    stim[59] = 207'h368498473aa37295fad619f8b52a24983f6b1962bd2056316fed;
    stim[60] = 207'h09a03d771ab7aabef5052b3dde36d0c09e2ecc3d7d930f70fd2d;
    stim[61] = 207'h3f0d5f735a55572dfb012a9690a80bbff7c91ea6bd0e5c7aa54a;
    stim[62] = 207'h3ce479a5baa20aad299989050f4425d92442e9c30ad84ffe4fd7;
    stim[63] = 207'h0d8badb9301923119a68e1e60e419d342910f5a14613d5878742;
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
      expv[0] = 199'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 199'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 199'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 199'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 199'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 199'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 199'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 199'h172d801459ce59d1bae1c92a590b1c1d8130e342307e723f94;
      expv[8] = 199'h172d801459ce59d1bae1c92a590b1c1d8130e342307e723f94;
      expv[9] = 199'h172d801459ce59d1bae1c92a590b1c1d8130e342307e723f94;
      expv[10] = 199'h172d801459ce59d1bae1c92a590b1c1d8130e342307e723f94;
      expv[11] = 199'h172d801459ce59d1bae1c92a590b1c1d8130e342307e723f95;
      expv[12] = 199'h4777e23ff93afb587171ef320ed083beeced67181effecb620;
      expv[13] = 199'h4777e23ff93afb587171ef320ed083beeced67181effecb620;
      expv[14] = 199'h4777e23ff93afb587171ef320ed083beeced67181effecb620;
      expv[15] = 199'h4777e23ff93afb587171ef320ed083beeced67181effecb621;
      expv[16] = 199'h7ed5f614ca059965058798ac1a3a6dac862ca92df55c13c64a;
      expv[17] = 199'h7ed5f614ca059965058798ac1a3a6dac862ca92df55c13c64a;
      expv[18] = 199'h7ed5f614ca059965058798ac1a3a6dac862ca92df55c13c64a;
      expv[19] = 199'h7ed5f614ca059965058798ac1a3a6dac862ca92df55c13c64a;
      expv[20] = 199'h7ed5f614ca059965058798ac1a3a6dac862ca92df55c13c64a;
      expv[21] = 199'h7ed5f614ca059965058798ac1a3a6dac862ca92df55c13c64a;
      expv[22] = 199'h7ed5f614ca059965058798ac1a3a6dac862ca92df55c13c64a;
      expv[23] = 199'h7ed5f614ca059965058798ac1a3a6dac862ca92df55c13c64b;
      expv[24] = 199'h2296fe7466aff97269854c25354eed71d7800f04a534a7432e;
      expv[25] = 199'h2296fe7466aff97269854c25354eed71d7800f04a534a7432e;
      expv[26] = 199'h2296fe7466aff97269854c25354eed71d7800f04a534a7432e;
      expv[27] = 199'h2296fe7466aff97269854c25354eed71d7800f04a534a7432f;
      expv[28] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[29] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[30] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[31] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[32] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[33] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[34] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[35] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[36] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[37] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196812;
      expv[38] = 199'h0dd74e86deec1223f7d4bcfb69ddaa269b41e2342663196813;
      expv[39] = 199'h74c8f6a68ccb0a680e9fac60644c4c4fd26f8cfd2bb7e4719c;
      expv[40] = 199'h74c8f6a68ccb0a680e9fac60644c4c4fd26f8cfd2bb7e4719c;
      expv[41] = 199'h74c8f6a68ccb0a680e9fac60644c4c4fd26f8cfd2bb7e4719c;
      expv[42] = 199'h74c8f6a68ccb0a680e9fac60644c4c4fd26f8cfd2bb7e4719c;
      expv[43] = 199'h74c8f6a68ccb0a680e9fac60644c4c4fd26f8cfd2bb7e4719c;
      expv[44] = 199'h74c8f6a68ccb0a680e9fac60644c4c4fd26f8cfd2bb7e4719c;
      expv[45] = 199'h74c8f6a68ccb0a680e9fac60644c4c4fd26f8cfd2bb7e4719c;
      expv[46] = 199'h74c8f6a68ccb0a680e9fac60644c4c4fd26f8cfd2bb7e4719d;
      expv[47] = 199'h5ddec73bbacdded699b537723bff3dcc70972478356d286d22;
      expv[48] = 199'h5ddec73bbacdded699b537723bff3dcc70972478356d286d22;
      expv[49] = 199'h5ddec73bbacdded699b537723bff3dcc70972478356d286d22;
      expv[50] = 199'h5ddec73bbacdded699b537723bff3dcc70972478356d286d22;
      expv[51] = 199'h5ddec73bbacdded699b537723bff3dcc70972478356d286d22;
      expv[52] = 199'h5ddec73bbacdded699b537723bff3dcc70972478356d286d23;
      expv[53] = 199'h2924bd76a2c1300405bf0c7f8520f8968b8c612b63f9b8d0b4;
      expv[54] = 199'h2924bd76a2c1300405bf0c7f8520f8968b8c612b63f9b8d0b4;
      expv[55] = 199'h2924bd76a2c1300405bf0c7f8520f8968b8c612b63f9b8d0b4;
      expv[56] = 199'h2924bd76a2c1300405bf0c7f8520f8968b8c612b63f9b8d0b4;
      expv[57] = 199'h2924bd76a2c1300405bf0c7f8520f8968b8c612b63f9b8d0b4;
      expv[58] = 199'h2924bd76a2c1300405bf0c7f8520f8968b8c612b63f9b8d0b5;
      expv[59] = 199'h06b0bf5f100ce00ab4fd7f2e4f6ab27e3e673d60df3cb6ebce;
      expv[60] = 199'h06b0bf5f100ce00ab4fd7f2e4f6ab27e3e673d60df3cb6ebce;
      expv[61] = 199'h06b0bf5f100ce00ab4fd7f2e4f6ab27e3e673d60df3cb6ebce;
      expv[62] = 199'h06b0bf5f100ce00ab4fd7f2e4f6ab27e3e673d60df3cb6ebce;
      expv[63] = 199'h06b0bf5f100ce00ab4fd7f2e4f6ab27e3e673d60df3cb6ebce;
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
