// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 175;
  localparam OW = 165;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_179398 dut (
    .RegWrite_in(in_vec[174:174]),
    .Memory_write_in(in_vec[173:173]),
    .DR_MDR_immi_in(in_vec[172:172]),
    .RegJump_in(in_vec[171:171]),
    .RegJump_cond_in(in_vec[170:170]),
    .memory_input_in(in_vec[169:169]),
    .branchcondition(in_vec[168:165]),
    .szcv(in_vec[164:161]),
    .DR_in(in_vec[160:129]),
    .outerInput(in_vec[128:97]),
    .memoryContent(in_vec[96:65]),
    .din(in_vec[64:33]),
    .Regdst_in(in_vec[32:32]),
    .increPC_in(in_vec[31:0]),
    .out_PC4(out_vec[164:133]),
    .MDR(out_vec[132:101]),
    .DR(out_vec[100:69]),
    .RegWrite(out_vec[68:68]),
    .DR_MDR_immi(out_vec[67:67]),
    .Memory_write(out_vec[66:66]),
    .RegJump(out_vec[65:65]),
    .d(out_vec[64:33]),
    .Regdst(out_vec[32:32]),
    .increPC_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 175'h0b2eaf6b7bd8e97f18212e0f8f38fa3cbe69bdbcf544;
    stim[1] = 175'h079810b1af0df23998956e7d0ecbf5dc921d32e9f18d;
    stim[2] = 175'h78dfc53219341d2136c52d86cfd73cc89418730b7885;
    stim[3] = 175'h1f9bd60f3ff2cbdf0464205d68c7ba00bc92986536a4;
    stim[4] = 175'h68c16cd9dd1cac274bb049f8ddbf5e04ba60967d829b;
    stim[5] = 175'h10e90a8eb14618c39599882c1d9d7ea0d75d1aa2d473;
    stim[6] = 175'h23745e6aa003b35bb8ce01e9f8e7801487c831502e2a;
    stim[7] = 175'h24ec92da8fa968a78d5db7da4c9473b47658b82e5652;
    stim[8] = 175'h174f8f286e78f4afe2e4d1273dfe4a6c5feb09ebd5b9;
    stim[9] = 175'h12326ef9bf9e375b87a0b39fabe6eb3ec56ccc2ddad4;
    stim[10] = 175'h70378d5ff94f795048745885c48aae565c3448672a7c;
    stim[11] = 175'h6106836e8121b3d40e07d3f7746441455af14f489c84;
    stim[12] = 175'h2ad7dc2f477c88688f4822ed942196e88668188576fd;
    stim[13] = 175'h6fcc3749574501fad7c31a75a49eb744428109dd5f2f;
    stim[14] = 175'h42566d7ed9eb24aaf119971e7f08c350b54ca9f1db6e;
    stim[15] = 175'h3cf9db0fed48efb1659a862c9f4836ba821b93a201b1;
    stim[16] = 175'h7bf1fcf40691a5d9c4069bf693bc9eefaf8a503c3c0d;
    stim[17] = 175'h2254c580edb5f35c0be17a88ccb669ffa0940888a44b;
    stim[18] = 175'h1389261efa74b881502b64871986e7205faa9a9b9019;
    stim[19] = 175'h197bf743d956ccb51ee40a2478197dfb54dc7c07c953;
    stim[20] = 175'h30d923267b8aee91965f700c095a99304322c2278eb2;
    stim[21] = 175'h43855fc617656ddceb29d69e4ba98780517da6f0d49f;
    stim[22] = 175'h4c607466af4fe7832e7cf1ef95ce718dba3a64a2acab;
    stim[23] = 175'h3c12f872629662c1ffe3f0ebb4dea5b020d469b9876b;
    stim[24] = 175'h1fc068f746e84c9dbaa78d2896dcf7bf36151feb617b;
    stim[25] = 175'h46aba5e0968a96f974956da400953179f116c43e0f57;
    stim[26] = 175'h27fea8e91781c75fa35ba5a3cbaf179b713bae96306f;
    stim[27] = 175'h2e8806201217890319362e24b9581d570e5af688b7bd;
    stim[28] = 175'h692b1fe9238581c8b2dd815bb5adc5a7a4efd71233f4;
    stim[29] = 175'h510dd70d3b4f7f1837405779cafb429d9b3ab9441b57;
    stim[30] = 175'h7da8a01635fd15d42c7fcf99b5f6a79f8447f35007c8;
    stim[31] = 175'h6ac6d3442217451d7c254a9ba68bd0a26f72652031c6;
    stim[32] = 175'h0eb9d285effc0087e05bd5198c2b354690145e4c8551;
    stim[33] = 175'h721a5c4a6fe0ffaba76b4b51b3bea586f8df327c1f3c;
    stim[34] = 175'h2f40116ad139c549973ec011c553b09f28230e7e9dbc;
    stim[35] = 175'h0b4ba5ad834b11b8a6505bbe3d8490d7ca856436e263;
    stim[36] = 175'h5b08795bb1ab6b7954ea308b7abf2ec720049df657ad;
    stim[37] = 175'h5b22f1e4f4dc1e600d041fb91d0e41b5e47e05bbd9a1;
    stim[38] = 175'h59b569b58a59074a5767172f2237d1cb777952593ebb;
    stim[39] = 175'h6359188ddc5aa1fbc017e622ed912d071e5a2aaa6609;
    stim[40] = 175'h45d9c377f1560caec7f3a4ac8e8beb9edb7b19680fd4;
    stim[41] = 175'h3c50bd673abccf453e2e34f6b18f5ca831f2292e5f1c;
    stim[42] = 175'h033f293396c4fab8570d1e86e8a381dead9a0030be85;
    stim[43] = 175'h4f4bebc5861faad1c16b53a22d0fb809a604c6ed775e;
    stim[44] = 175'h2b161e8f25dcb266359e593b95ef75b1cdee987207c3;
    stim[45] = 175'h0a4065e7e1ab0dd16ef6eb9768181b98091f98a78e18;
    stim[46] = 175'h79c263255e7951614ae3c0b64dad5bec23834d928c9d;
    stim[47] = 175'h5a168de85ff7969b0b3d7b4e51c2fe3566a0b05b330d;
    stim[48] = 175'h6b579be5a39fefd311268c3764fe457432febca09ccd;
    stim[49] = 175'h14cb9e0ebf157fcba589c41bf2924fc436f2f04c7efb;
    stim[50] = 175'h69707b0ac330a0607d1e4eab61821e86be78801aca29;
    stim[51] = 175'h25c0171ea6bef9a3e86e8d5b9f79ca30e5b7c74e88f1;
    stim[52] = 175'h4c7941bf96dd1a04a55439b85174a970b8694c5aabd1;
    stim[53] = 175'h1c0fcc4e5f321cfc48844795bc2efa896f3005138606;
    stim[54] = 175'h15c728e0576bffad6e99b9a03e006efb9ca5d06cc01a;
    stim[55] = 175'h15ba1e2c568e1b9a6c4b82b72f04feaff4b7b1f4e482;
    stim[56] = 175'h11ef634bd29329dffdfb7203e90c4db3923e756b853b;
    stim[57] = 175'h37f5743c62ac0d5bb05c7b8466de61033bb7fded451e;
    stim[58] = 175'h412225e4670fc0af03ead6dcbb04767822bea55aead0;
    stim[59] = 175'h58967e011ed74e4b5747aba06a52fdb0e0c3d7a52f8b;
    stim[60] = 175'h4d63b65f428670412e64041e1c224023ddf2904fc22a;
    stim[61] = 175'h30af27508c11f6c515e3276991b57119d82d6ee22701;
    stim[62] = 175'h7f0c27c422f758a30c2c3611b6e59fa1969c484d91ff;
    stim[63] = 175'h5b59ae0a7799ed0636b060bad4cab496a3792a8371f7;
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
      expv[0] = 165'h0af6b7bd92e0f8f38af6b7bd82fa3cbe69bdbcf544;
      expv[1] = 165'h065d3e31b6e7d0eca10b1af0c1f5dc921d32e9f18d;
      expv[2] = 165'h1c53219341d2136c5c5321935f3cc89418730b7885;
      expv[3] = 165'h130ca6d48205d68c7d60f3ff29ba00bc92986536a4;
      expv[4] = 165'h16cd9dd1cac274bb16cd9dd1d75e04ba60967d829b;
      expv[5] = 165'h03545a8e618c395990a8eb14697ea0d75d1aa2d473;
      expv[6] = 165'h062a05c5401e9f8e65e6aa0025801487c831502e2a;
      expv[7] = 165'h092da8fa968a78d5c92da8fa8673b47658b82e5652;
      expv[8] = 165'h013d7ab72d1273dff8f286e7884a6c5feb09ebd5b9;
      expv[9] = 165'h1985bb5a8b39fabe66ef9bf9e8eb3ec56ccc2ddad4;
      expv[10] = 165'h090ce54f9795048758d5ff94fcae565c3448672a7c;
      expv[11] = 165'h09e913909b3d40e06836e8121441455af14f489c84;
      expv[12] = 165'h1dc2f477c22ed9421dc2f477c796e88668188576fd;
      expv[13] = 165'h013babe5f1a75a49e374957454b744428109dd5f2f;
      expv[14] = 165'h153e3b6dd971e7f086d7ed9eb0c350b54ca9f1db6e;
      expv[15] = 165'h127440362efb1659bdb0fed48c36ba821b93a201b1;
      expv[16] = 165'h1fcf406909bf693bdfcf40691e9eefaf8a503c3c0d;
      expv[17] = 165'h0111148977a88ccb6c580edb4469ffa0940888a44b;
      expv[18] = 165'h13537203364871987261efa748e7205faa9a9b9019;
      expv[19] = 165'h1f743d956ccb51ee5f743d956b7dfb54dc7c07c953;
      expv[20] = 165'h1844f1d64ee91965f23267b8ac99304322c2278eb2;
      expv[21] = 165'h14de1a93fd69e4ba95fc6176518780517da6f0d49f;
      expv[22] = 165'h07466af4fe7832e7c7466af4f2718dba3a64a2acab;
      expv[23] = 165'h0f872629662c1ffe2f8726296ea5b020d469b9876b;
      expv[24] = 165'h03fd6c2f78d2896dc68f746e88f7bf36151feb617b;
      expv[25] = 165'h1887c1eaf6da40095a5e0968b13179f116c43e0f57;
      expv[26] = 165'h15d2c60dfa5a3cbaea8e917805179b713bae96306f;
      expv[27] = 165'h0062012162e24b9580620121661d570e5af688b7bd;
      expv[28] = 165'h11fe9238581c8b2dd1fe923857c5a7a4efd71233f4;
      expv[29] = 165'h1728836af7f183741d70d3b4f9429d9b3ab9441b57;
      expv[30] = 165'h1e6a00f9115d42c7ea01635fdca79f8447f35007c8;
      expv[31] = 165'h0d34422174a9ba68ad34422177d0a26f72652031c6;
      expv[32] = 165'h0bc990aa3d5198c2bd285effc1354690145e4c8551;
      expv[33] = 165'h064f83e794b51b3be5c4a6fe1ca586f8df327c1f3c;
      expv[34] = 165'h01cfd3b78c011c552116ad1385b09f28230e7e9dbc;
      expv[35] = 165'h1a5ad834a5bbe3d85a5ad834a290d7ca856436e263;
      expv[36] = 165'h0795bb1aa308b7abe795bb1abb2ec720049df657ad;
      expv[37] = 165'h0f1e4f4dc1fb91d0ef1e4f4dda41b5e47e05bbd9a1;
      expv[38] = 165'h169b58a59074a576769b58a59bd1cb777952593ebb;
      expv[39] = 165'h05554cc13e622ed91188ddc5b52d071e5a2aaa6609;
      expv[40] = 165'h032d01fa80caec7f3c377f1571eb9edb7b19680fd4;
      expv[41] = 165'h0525cbe38cf453e2ebd673abcd5ca831f2292e5f1c;
      expv[42] = 165'h000617d0b1e86e8a3293396c4181dead9a0030be85;
      expv[43] = 165'h18ddaeebd53a22d0febc5861f1b809a604c6ed775e;
      expv[44] = 165'h01e8f25dc593b95ee1e8f25dc775b1cdee987207c3;
      expv[45] = 165'h065e7e1aaeb97681865e7e1aa21b98091f98a78e18;
      expv[46] = 165'h063255e7951614ae263255e79f5bec23834d928c9d;
      expv[47] = 165'h08de85ff77b4e51c28de85ff7afe3566a0b05b330d;
      expv[48] = 165'h19be5a39e8c3764ff9be5a39f6457432febca09ccd;
      expv[49] = 165'h1e098fdf77fcba5899e0ebf1484fc436f2f04c7efb;
      expv[50] = 165'h07b0ac330a0607d1e7b0ac33161e86be78801aca29;
      expv[51] = 165'h18e9d11e2f9a3e86e171ea6be5ca30e5b7c74e88f1;
      expv[52] = 165'h141bf96dd1a04a55541bf96dd2a970b8694c5aabd1;
      expv[53] = 165'h1cc4e5f321cfc4885cc4e5f32afa896f3005138606;
      expv[54] = 165'h1a0d98035ffad6e9928e0576a86efb9ca5d06cc01a;
      expv[55] = 165'h163e9c9041b9a6c4a1e2c568e8feaff4b7b1f4e482;
      expv[56] = 165'h0ead70a7729dffdfb634bd29284db3923e756b853b;
      expv[57] = 165'h1fbda8a3c7b8466df743c62acc61033bb7fded451e;
      expv[58] = 165'h14ab5d5a1c0af03ea25e4670f0767822bea55aead0;
      expv[59] = 165'h07e011ed74e4b57467e011ed7afdb0e0c3d7a52f8b;
      expv[60] = 165'h1b65f428670412e65b65f428724023ddf2904fc22a;
      expv[61] = 165'h0ddc44e03f6c515e327508c10d7119d82d6ee22701;
      expv[62] = 165'h027c422f63611b6e427c422f7f9fa1969c484d91ff;
      expv[63] = 165'h1ae0a779860bad4cbae0a7799ab496a3792a8371f7;
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
