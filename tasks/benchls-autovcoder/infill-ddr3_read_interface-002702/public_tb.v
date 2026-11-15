// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 170;
  localparam OW = 162;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002702 dut (
    .sclk(clk),
    .rst(in_vec[169:169]),
    .rd_cmd_start(in_vec[168:168]),
    .rd_cmd_instr(in_vec[167:165]),
    .rd_cmd_bl(in_vec[164:158]),
    .rd_cmd_addr(in_vec[157:130]),
    .app_rd_data(in_vec[129:2]),
    .app_rd_data_valid(in_vec[1:1]),
    .app_rdy(in_vec[0:0]),
    .rd_data_128bit(out_vec[161:34]),
    .rd_data_valid(out_vec[33:33]),
    .rd_end(out_vec[32:32]),
    .app_en(out_vec[31:31]),
    .app_addr(out_vec[30:3]),
    .app_cmd(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 170'h23f38a26f960b546c8b474a1cd538dfdb4ceff89df1;
    stim[1] = 170'h20d612bb8f01d440cd702b7429526e0ed526ef3bab0;
    stim[2] = 170'h17919792a86c0c3128fa3ca8c41ec9b04fbfa3cd16c;
    stim[3] = 170'h1d70049712899415527ce289b3c3953e9a150f6eb47;
    stim[4] = 170'h05a8d255e468c9779c3674a8e0a19fabf1b44788a18;
    stim[5] = 170'h0df9168d6b60e6d9d955a865c242a9d502517dfeba5;
    stim[6] = 170'h1004d006d516001f8a0d381211c2c26bc9af460d355;
    stim[7] = 170'h07c0016bde849710f34175902f0c75251125be3ed44;
    stim[8] = 170'h1455bc41e4b2fa86ca49a7dd4e523e2e9a1062a0a51;
    stim[9] = 170'h1eba8792eec6d1b95097d7ae30338299c247b3ffd62;
    stim[10] = 170'h08160c14a86da538838794266970264292286092120;
    stim[11] = 170'h0b74f1a1f82021f68cd752d8ddf0d1e69201931f9d2;
    stim[12] = 170'h16d5dcb4fbdbf8f9be4e33f9034f4e788a74dc6eaf9;
    stim[13] = 170'h035b1250129a90c069da16599d46383c5f8ade7195c;
    stim[14] = 170'h1594f055d2c9c9c75f94789ef9560d02872f8aae6fd;
    stim[15] = 170'h0d3a85fd545761af59f1998164e3124749d48760a4a;
    stim[16] = 170'h1d26426dca128dd057f04f72b525c072520967a8819;
    stim[17] = 170'h017c012f2492768830a0c98039bdb01b5ac6877c3cb;
    stim[18] = 170'h074fb386d10fd794f76fe8febf577d745cba99a2b71;
    stim[19] = 170'h0b3e8f2c26e7f63890eefc9f69da41cd2b9e8e3f488;
    stim[20] = 170'h0eac86da82337a4763cdf13e8b3c3a2639b8731f053;
    stim[21] = 170'h198d306bb6ff78420ec8291c9e55585385870053f79;
    stim[22] = 170'h0833b8074837a672a913494498c813be01c922e787a;
    stim[23] = 170'h1c35d6ecf439b3eef4d5852bc01b3c876e9271d111e;
    stim[24] = 170'h0dfcdc53b3c1046a9781b166753ea167b95d8d33d6c;
    stim[25] = 170'h0ee35caa117b09b8f528cc2879f7b1a9c8e49df314e;
    stim[26] = 170'h079f1aaee1648292c78a92d39d6d9b8ef53c90edae4;
    stim[27] = 170'h0d981eb4f77906c243189e38185e8e426ad2bfb4a4c;
    stim[28] = 170'h1b6fb5caeef8597d15e5400f92a6f29e0117f04bf47;
    stim[29] = 170'h04dc6c05968e2ea9c282fde1fdce401339672bac7a1;
    stim[30] = 170'h0e042dd100682a08056445c1be3e038aaabdcb04684;
    stim[31] = 170'h07c37a0de5e539618eec299c808e747d9b2d2b07be9;
    stim[32] = 170'h1980226ab734239dc23298d57756eb9db4fa1d9c1b4;
    stim[33] = 170'h1619181db6cbed20064ec3af8f4a7fd2e4e7ea6afa3;
    stim[34] = 170'h0c8c5c7dc821863d5ed6dddd085da17d25fd13143d2;
    stim[35] = 170'h082284eca207950959d0836afec568048c724a354f4;
    stim[36] = 170'h010705fb88989d9f0b3ea386120dfcae104e2a8ccfa;
    stim[37] = 170'h0a77d7adb541d2b7ab6f16ce8a7907a06144813c5a1;
    stim[38] = 170'h163a395268ead2281a7639708a440df427b9f46b513;
    stim[39] = 170'h1cb9bf2a366a61ba2ab28d45e9d9e777c81c6dc956a;
    stim[40] = 170'h0d8fc7b1cf3bb87cfe65117582f3a4a8344c542ab3b;
    stim[41] = 170'h1ac5157f79187054cc1abf4e524c52f2d88c8cd3d6f;
    stim[42] = 170'h05218e14f83b0b0c165d082fdcf24fec7721dc9480e;
    stim[43] = 170'h1025e340af0d1c9b1e9a6658aba259c9d9e190d9e0c;
    stim[44] = 170'h108e9406e52c9011fa42fbbbea532e27d5d293f62cc;
    stim[45] = 170'h16ffbe329178c9270860a912fd9a5b10677d5afd649;
    stim[46] = 170'h0feeb2e3eddd7c24cb48558909ce34d9769ffa29563;
    stim[47] = 170'h093c9f64378c37d38d4b01ddd14f4e7ad38bba7636b;
    stim[48] = 170'h18f550f9bdf04bfd75d05aa453a5743079be619b63b;
    stim[49] = 170'h1da053d43d03838cfa33afa82e75dd4bdd2b755bf3d;
    stim[50] = 170'h0c02122b44dd2ae3ae3d533b1a7bc18b89d1e468f6e;
    stim[51] = 170'h08f11e45652ca5f2c52d4e58524f20e3c0d77a0e3f1;
    stim[52] = 170'h04a1c62366d117aca99f968cd35204fdbefe1e1550b;
    stim[53] = 170'h004c9fe0c3c212acc2bd41e97143ffd96361a211701;
    stim[54] = 170'h0c3a2764f3c31ecfac0ca221a391b7ebd67e1cf38dc;
    stim[55] = 170'h18e88fae5e3ec6f5b9aa5a5d71417600f2d1f1e17ca;
    stim[56] = 170'h10699c8fdc1150f398d6310f949e9bcf37e1020fe94;
    stim[57] = 170'h131004cb45d5794867131f5ea9586f495bdb94e6478;
    stim[58] = 170'h06ef8b2a77175796f44840c8f5af40154575c0973d6;
    stim[59] = 170'h0d6f91ffa4c73bf766cd4119d925205cf5dfb64e749;
    stim[60] = 170'h066ad2f33d3aefda2ac9768087dc97692ba01429a3f;
    stim[61] = 170'h1aba6f1ec6727a8692483338c86779d8801bf2acb92;
    stim[62] = 170'h17392469b121918c4e6cbd6de1e2c63b07f57fd86fd;
    stim[63] = 170'h08dffc4a4f632a80eea51a98a8ebf2957c88a755748;
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
      expv[0] = 162'h20b546c8b474a1cd538dfdb4ceff89dfxxxxxxxxx;
      expv[1] = 162'h01d440cd702b7429526e0ed526ef3bab000000000;
      expv[2] = 162'h2c0c3128fa3ca8c41ec9b04fbfa3cd16c00000000;
      expv[3] = 162'h099415527ce289b3c3953e9a150f6eb46b2f2550b;
      expv[4] = 162'h28c9779c3674a8e0a19fabf1b44788a188092e256;
      expv[5] = 162'h20e6d9d955a865c242a9d502517dfeba48092e256;
      expv[6] = 162'h16001f8a0d381211c2c26bc9af460d3548092e296;
      expv[7] = 162'h049710f34175902f0c75251125be3ed449a00daa0;
      expv[8] = 162'h32fa86ca49a7dd4e523e2e9a1062a0a509a00daa0;
      expv[9] = 162'h06d1b95097d7ae30338299c247b3ffd62b7883c92;
      expv[10] = 162'h2da538838794266970264292286092120d0f25ddf;
      expv[11] = 162'h2021f68cd752d8ddf0d1e69201931f9d2d0f25ddf;
      expv[12] = 162'h1bf8f9be4e33f9034f4e788a74dc6eaf8d0f25ddf;
      expv[13] = 162'h1a90c069da16599d46383c5f8ade7195cbb969f7b;
      expv[14] = 162'h09c9c75f94789ef9560d02872f8aae6fcbb969f7b;
      expv[15] = 162'h1761af59f1998164e3124749d48760a4a9e0aba5a;
      expv[16] = 162'h128dd057f04f72b525c072520967a88189e0aba5a;
      expv[17] = 162'h12768830a0c98039bdb01b5ac6877c3cac84db946;
      expv[18] = 162'h0fd794f76fe8febf577d745cba99a2b70c84db986;
      expv[19] = 162'h27f63890eefc9f69da41cd2b9e8e3f488c84db9c6;
      expv[20] = 162'h337a4763cdf13e8b3c3a2639b8731f052c84db9c6;
      expv[21] = 162'h3f78420ec8291c9e55585385870053f78c84dba06;
      expv[22] = 162'h37a672a913494498c813be01c922e787aa60d76dc;
      expv[23] = 162'h39b3eef4d5852bc01b3c876e9271d111ea60d76dc;
      expv[24] = 162'h01046a9781b166753ea167b95d8d33d6cbadd9e86;
      expv[25] = 162'h3b09b8f528cc2879f7b1a9c8e49df314ebadd9e86;
      expv[26] = 162'h248292c78a92d39d6d9b8ef53c90edae4badd9e86;
      expv[27] = 162'h3906c243189e38185e8e426ad2bfb4a4cbadd9e86;
      expv[28] = 162'h38597d15e5400f92a6f29e0117f04bf46badd9e86;
      expv[29] = 162'h0e2ea9c282fde1fdce401339672bac7a0f6b95ddd;
      expv[30] = 162'h282a08056445c1be3e038aaabdcb04684f6b95e1d;
      expv[31] = 162'h2539618eec299c808e747d9b2d2b07be8f6b95e1d;
      expv[32] = 162'h34239dc23298d57756eb9db4fa1d9c1b4f6b95e5d;
      expv[33] = 162'h0bed20064ec3af8f4a7fd2e4e7ea6afa2844d56e4;
      expv[34] = 162'h21863d5ed6dddd085da17d25fd13143d2a303b6db;
      expv[35] = 162'h07950959d0836afec568048c724a354f4a303b6db;
      expv[36] = 162'h189d9f0b3ea386120dfcae104e2a8ccfaa303b6db;
      expv[37] = 162'h01d2b7ab6f16ce8a7907a06144813c5a0a303b6db;
      expv[38] = 162'h2ad2281a7639708a440df427b9f46b512a303b71b;
      expv[39] = 162'h2a61ba2ab28d45e9d9e777c81c6dc956ac72a4d1b;
      expv[40] = 162'h3bb87cfe65117582f3a4a8344c542ab3ab7e546ce;
      expv[41] = 162'h187054cc1abf4e524c52f2d88c8cd3d6eb7e5470e;
      expv[42] = 162'h3b0b0c165d082fdcf24fec7721dc9480ea2afef25;
      expv[43] = 162'h0d1c9b1e9a6658aba259c9d9e190d9e0ca2afef25;
      expv[44] = 162'h2c9011fa42fbbbea532e27d5d293f62ccbc6815e0;
      expv[45] = 162'h38c9270860a912fd9a5b10677d5afd648d280dca0;
      expv[46] = 162'h1d7c24cb48558909ce34d9769ffa29562f7c6522b;
      expv[47] = 162'h0c37d38d4b01ddd14f4e7ad38bba7636af7c6526b;
      expv[48] = 162'h304bfd75d05aa453a5743079be619b63af7c652ab;
      expv[49] = 162'h03838cfa33afa82e75dd4bdd2b755bf3caa1f37bc;
      expv[50] = 162'h1d2ae3ae3d533b1a7bc18b89d1e468f6e8a7a87a6;
      expv[51] = 162'h2ca5f2c52d4e58524f20e3c0d77a0e3f08a7a87a6;
      expv[52] = 162'h1117aca99f968cd35204fdbefe1e1550a8a7a87e6;
      expv[53] = 162'h0212acc2bd41e97143ffd96361a2117008a7a8826;
      expv[54] = 162'h031ecfac0ca221a391b7ebd67e1cf38dc8a7a8866;
      expv[55] = 162'h3ec6f5b9aa5a5d71417600f2d1f1e17ca8a7a8866;
      expv[56] = 162'h1150f398d6310f949e9bcf37e1020fe9491f5cbc4;
      expv[57] = 162'h15794867131f5ea9586f495bdb94e6478b391fb80;
      expv[58] = 162'h175796f44840c8f5af40154575c0973d6809968b9;
      expv[59] = 162'h073bf766cd4119d925205cf5dfb64e748809968b9;
      expv[60] = 162'h3aefda2ac9768087dc97692ba01429a3e809968f9;
      expv[61] = 162'h327a8692483338c86779d8801bf2acb9280996939;
      expv[62] = 162'h21918c4e6cbd6de1e2c63b07f57fd86fccde3d8cd;
      expv[63] = 162'h232a80eea51a98a8ebf2957c88a755748a48d3623;
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
