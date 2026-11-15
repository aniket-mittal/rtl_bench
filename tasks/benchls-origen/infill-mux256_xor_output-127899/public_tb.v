// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 266;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_127899 dut (
    .clk(clk),
    .data_in(in_vec[265:10]),
    .select(in_vec[9:2]),
    .a(in_vec[1:1]),
    .b(in_vec[0:0]),
    .final_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 266'h014c3a3d727e8acff091dbcecb6ebe132ded9535026764b177ce3af6b96fc34d60f;
    stim[1] = 266'h24b0a995b1fd630b39545302b688415e8b1998da78cb797e6c3bd86ec219709f34a;
    stim[2] = 266'h006c9b3c416f01f63b8864c9d59e7feb9d426ff578b126e3f9cc0d4a173ec87184d;
    stim[3] = 266'h33ac444eb64c1cf22d852a6969d6964d82945f2a102f0873abf3bf24f61ebce2f66;
    stim[4] = 266'h1633d36e4f314ea33e8fd18ab78b9f395f45e01760d5e5159c375af586d13531da8;
    stim[5] = 266'h010ad9884f10cbcf97ce8eddb2477ab9044488e2b336f5194e26e9273947bcce399;
    stim[6] = 266'h317b5232a3811ab3f22dbd86f5686246a91ebf7c236047de357582b7a3a60bdadab;
    stim[7] = 266'h1c9bea5d54d7f8a1ec85a10d9b8c0939bf2ddf7b16edf0593c055e0415e1127baed;
    stim[8] = 266'h0f9ba366f09dbaa8d5366723b0854f4fcb23b8dc71742f8401d9d1fae38587da2dd;
    stim[9] = 266'h2ae09498b3679861655e37da7a2a7f648b2000de096e2306a5a62047c422bb16fe5;
    stim[10] = 266'h08b6674830b21b9d0cab08983a10d2109db27a21e6612cb67150956cefb6ce2d8cc;
    stim[11] = 266'h3dd66b3b23c7e6b659a2de295eede4c055d273afaf2dc7466f421fbf17077a2cfaa;
    stim[12] = 266'h15be89c09b46dc5dd0e67f4b0063f1cadba7fc60df4457ca83a98b626ecd09dc84e;
    stim[13] = 266'h31925d030e5186d9443cb1394acd8d3857aaa9e9f0c381744df857c0806822f5cac;
    stim[14] = 266'h01f82c73738284eeb80908ce3c08c18000b46d04f548a7dc06bd9af5a9c02072af3;
    stim[15] = 266'h302691100731db8633c3a4cf879a9098ce8070c506391b27a0b8566edf15851cdca;
    stim[16] = 266'h21328c5a1665f75d4aaec01e0a32a5cac4b366ab5ff549c80dec2e2dccbcfd8722f;
    stim[17] = 266'h21af48687738808f2a3118e8e90fdffdafca2dbac5a9f73605b768778f10fa490ce;
    stim[18] = 266'h2998d40f9401a8a48942556543445d02491efb0635d68ca27ed05ecbfe8c26e6e0c;
    stim[19] = 266'h3e33dffb74f18a427d6bb5851541d259943b57b70afc4b2625ed28cda8126a4cb30;
    stim[20] = 266'h2f0d8061b531836b5c4b1b19be0aa166a9a9f955ef77466e76dd3337465678bfcbd;
    stim[21] = 266'h072e371406be9e26b49d752b61ce297ebe854a3de307f00b5f82c7f96cf5a29da78;
    stim[22] = 266'h3a5deade4ccee6c40a7fe60845f04bffc9deab81d0ded366759eb0eb6abde3aa843;
    stim[23] = 266'h3f4cfd4a096f7df4886aed377ea255c0b84f4db527f6f7d0dd76d7a00aa5d606512;
    stim[24] = 266'h06874b2e29f4921a378fbc2dbc54107bf06b992d162f72922e0cdf5d498fb9cb3aa;
    stim[25] = 266'h0b823080a9651f0cbddee6ad040ed1f1a8b6b860b6053e691b7783ef9441a5270ae;
    stim[26] = 266'h218ec8d65390efea5fc7a1e0b168dc4c81e773f98311ef2ee0108c57bfb40e80b8e;
    stim[27] = 266'h1d98156ab0ffbbdc56edbfa2a3d8cb6e7c32371885b881ecd9434d2cd756df291fe;
    stim[28] = 266'h20909f683adead11e9cd8a1bc3668489a438528460c40a910e0da388d34a8ff10cd;
    stim[29] = 266'h309260e4a14523c7f21c6bb1566857e7c2fcc4780cf7cf3d5670a1efc074486cbca;
    stim[30] = 266'h0181bf7a2c8a52c248fd81a43b1fd0dc19432143faa62fc2f159aa30d60215fe8df;
    stim[31] = 266'h37e42d6715b07fac56397e06fbe37a25b7766c3d6548e14472d6abf580a2824da2b;
    stim[32] = 266'h27f1d52afe3ce5296e5837e0aa80468faca93380c080a3f871e0ea084b9d2ada10f;
    stim[33] = 266'h0cf3b8971664692621ff4725c221e4eadbbfcf5ca3a2943c53e0093860e0a8d6485;
    stim[34] = 266'h0b20cc8cf3ab7733a1fb54439242c78ff48b6306e090a151ca7529d8557180af9a2;
    stim[35] = 266'h3b4ed20c287fbd53abe0e95513c9dc76c6f517664ab5b5c2de1ad8cac80adbd689e;
    stim[36] = 266'h17f1a7bdfbc3344e955cdedddf8f3dc0d79f03e4937270bd44abdf36859bf185773;
    stim[37] = 266'h3ca99b02fe63405bde1cd617c270c649b1e8ca019f0d6039233d8a4951abb546b9a;
    stim[38] = 266'h2b6a808fbf4316c0635cf732e5253d73de025fa5168c988d02d9735ea353cadc161;
    stim[39] = 266'h38769076cd7bdb5bb1042c71d2485d0aa60bd3b92ea1039c0862baa5c23a9f136bf;
    stim[40] = 266'h2c9edfa75db210398b4ac3ffa06b76d4501e919d6c425da52a31aff8902c931d402;
    stim[41] = 266'h01b7223c1baf4ccc1223c5ba185e2febd26ad9b6a28103455c825d409106e6c2c5c;
    stim[42] = 266'h0d1702329f1961f1fda69c970aa54b0db13f5c43561b6e7d95920892a50380a9ebd;
    stim[43] = 266'h254c99cd79623b18d99a76d459180b77f61690557a3d54817196a8ff6f020144205;
    stim[44] = 266'h18e19a4ae8893cae71fd82b8814d6692d8a074fbf82e20a2f9391e3368f2d631e75;
    stim[45] = 266'h31f8025019aaca298dc606cc6cf7165e11e0ac6d785a8b4336936648cab11774d77;
    stim[46] = 266'h3a8aaccc29ce41570d1f822dadcdfb0a60a7bfc25ea44fa3025e978387618a81d73;
    stim[47] = 266'h16c23adf522b7bd67eb809ff462f72a4513d16fc1e736ad74d72ccf02e315e38192;
    stim[48] = 266'h0d6f0f92c89dd03e5ffb7175890a4a381f7230534a0681c460a340d4c58808e2fad;
    stim[49] = 266'h2d1348f489f85d8c48b2c3db1eff7995a2b379c47659a5ed5ffeca9240143ce7e51;
    stim[50] = 266'h2bca7756b6fbdf0a44f7291733bd383fff27c33fc0c617a4133d7f12e0e5606d9cd;
    stim[51] = 266'h2f82d620e2704dbf53fa0b58aa67448b1e2894451e5882d0e52006883fa5b69cad4;
    stim[52] = 266'h20ab917b191d1b2dff8ac2fd2dd542332f81dfa4c24143d7530ca2d983f1ced257e;
    stim[53] = 266'h095ee3b5f6c7b592135adef8320d00332149f97b4c93d3b567899d3e3c82dde9808;
    stim[54] = 266'h3746075adbbc98ad458fe80fb5a59855af04f6c2de36d715a6b7a2b6a95cb639c5a;
    stim[55] = 266'h386618fa9a204c932cb1d4dd57e809d6d910262d819ea24cdadf6ff455e311eea95;
    stim[56] = 266'h199f152f12fc47caf0f3998624977970037d260f5b5c5c47ae5d24deafc118e9152;
    stim[57] = 266'h326d4beb9cd333347885b211f669e78033f5d5c9a23f185bcecb5cbf25867f06c72;
    stim[58] = 266'h29a3a1bf07ce52b52c2ef29166eb19e7cc478905af9c668e24465618db0e0c1a39f;
    stim[59] = 266'h1bb765c0cb2f51e4ef3c5a55a7ff9d87e656fa516a2dd03d07adfc391c258d75c8e;
    stim[60] = 266'h2dbeb2097409bd3c9665ce109ee0b0c58998046de1f075dba60ebb3743091946f77;
    stim[61] = 266'h0a5cf62b8d9631accebbcaa139462496a5585bd5fe041861c8061b3a7b7f9a4efc2;
    stim[62] = 266'h2cffb24d18b05101ccfbcd96f6cc455c31e5adafb572944cef69047fbe4eea19d44;
    stim[63] = 266'h10204d7d55960f66011a7dd13d14b25a9ba73bb8be2ac1a681cd086b1e6f0bc315c;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
