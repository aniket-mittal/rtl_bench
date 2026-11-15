// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 260;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_089915 dut (
    .sel(in_vec[259:256]),
    .in0(in_vec[255:240]),
    .in1(in_vec[239:224]),
    .in2(in_vec[223:208]),
    .in3(in_vec[207:192]),
    .in4(in_vec[191:176]),
    .in5(in_vec[175:160]),
    .in6(in_vec[159:144]),
    .in7(in_vec[143:128]),
    .in8(in_vec[127:112]),
    .in9(in_vec[111:96]),
    .in10(in_vec[95:80]),
    .in11(in_vec[79:64]),
    .in12(in_vec[63:48]),
    .in13(in_vec[47:32]),
    .in14(in_vec[31:16]),
    .in15(in_vec[15:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 260'hf6d70bc9e57d356df0e733f273c43daf5b1ef9c0ed817ad99ea8d31317e5577ac;
    stim[1] = 260'he0db9a9eb6db99e6f7253f1b9cf13c2318ba891a60daddaf690f4e79bbadadb11;
    stim[2] = 260'h06599e3672d207cb50ed7c0ea30e26f442713eb2955e23de4b2104faf6a181a8f;
    stim[3] = 260'h9a61f89cfcc7e69d29c42a6b7fd7300392b053c65139b1460cc9a5841a80aa572;
    stim[4] = 260'h13ba795a9297be0e03cd1f7bc27036e454773c99a52733f334ddabba41e00f995;
    stim[5] = 260'h37feab55aeaeecac65a684ee75d61f6da7bd7426212508add86216e89f1fe5f03;
    stim[6] = 260'h3c75cb57deaf9060837bb426b17ea53b48d50960273c6f20b8368ce21652fa7c1;
    stim[7] = 260'hd0de6cfaeacd6e6a97df6a659c1c1a62f2fd02e09133464fe8c69eb64fe5945db;
    stim[8] = 260'h7a1ae5b28c3a20991c2aa6653880401e9ee411662835cacd66bf5b89f9d48ec6a;
    stim[9] = 260'h46f295c201a65ccf694644bb4c3d4fd0b2127ede0aa601d418c00f953e430c655;
    stim[10] = 260'hd2cfc1554161af4b2bd3557a29e3c5d2c618afd5745090b4c5bcccb61764908b2;
    stim[11] = 260'h0430b6ed8e6d5eeca7ff821e801371a39cf9faf3039c7ca9e7daa8c73c6be192e;
    stim[12] = 260'hff9d37e9a4d1b71800f00310d51213e26ca26177e6cf1b6455f682bb44ae0db04;
    stim[13] = 260'h147b805af27a2f89d4003f5f8390b3250a712b0fab8702619a708cab0527e00e7;
    stim[14] = 260'h09eb8469952ff4567495407d6e568b6bb6e5ab13d54840beaed8ef3d10e6b5145;
    stim[15] = 260'h9082939afe7f88e252efe5b02943f919eaaf0026d6fc0a4f8c17242036aba9727;
    stim[16] = 260'he7de8eff95674d24ef6a10b26b03516cadcc2678850171d41d5d540f280f44417;
    stim[17] = 260'h352d4687008418acd51bb757dcee7c18dd4efb7aad369ddf9e30ca66557ec7943;
    stim[18] = 260'h5457b940f56981939d1b067e2d9f8e4d06e04b02e27218bfd7310c20db42902ae;
    stim[19] = 260'hfcf61c0e2ae51b8dff01aa742b27d3070d95119633e39da1489a5829cb5cdf268;
    stim[20] = 260'h6353b87e15bd2a55fdb66867d029bf5b981466ef63dc7a6f1911b26e6c78c1ca8;
    stim[21] = 260'ha41be1d08a3eda8cac8905eba3f4d948043911bc1e8b802a198d5aed7d4c7d028;
    stim[22] = 260'h53f87b8431741b38469efeafff6d2c56d7f57dcd305e37697a2d62959117e6999;
    stim[23] = 260'h5fa72f2e0886b0ef7a1f177c58b45a7fd62225225b6d7ec212be6b088fcc5bbca;
    stim[24] = 260'h4d36b9f82578822319f2bb0886e9c5b7d945db1e2f64d45535da55e7dd7bdffd1;
    stim[25] = 260'h7e4e981a4ad91276cf1eba647ebede6cd2d50363fbae4ff3cd0b1bdd8d08dadb0;
    stim[26] = 260'h763730d59d82ad72e8db7c345853da8dbd4991654675014ffee90d3d4a1ca0992;
    stim[27] = 260'h7c7cf26e5d7d40cf684c38fe9aacdc41f4a6544756d87ca2a781cc27144d1c49a;
    stim[28] = 260'h27a317fffa93feb9e75620a5c862c827d16a90c7f97ecbaa56f4d45ba824517b4;
    stim[29] = 260'h8e7351905687abade44d3af16235bd882af1d27422c70919f73e14a95f3cbc142;
    stim[30] = 260'h5396e8a6e7c80091ab360b07b418b226d1aaae91b5fbb206f7540c187f573ce71;
    stim[31] = 260'hfec78a93019361968efcc84e855b77d33f06ad9404975cb38f7665384cc95168d;
    stim[32] = 260'h44aa042182c9aab76168c2a5f0beffc9ce186245dfbad09fe8830e9d19c6e5cd7;
    stim[33] = 260'ha34d428e36fce3b94c71c40015db0eab9cb8ce94259d81fe81100b415b91478c1;
    stim[34] = 260'h7ce45949b7f701a095dd3650145341033d54ac69d3f9cbf96fa4fe5c3fab29930;
    stim[35] = 260'h4745e38972c87bf0ae25e7dda76b073f22de504f74b32b8c51e6792cd49554206;
    stim[36] = 260'hf90f1b68e66a0c79ae5cfbe29193d6d6b473c080ba7cbf2e25ff1810ebfc5cd87;
    stim[37] = 260'h86c456fd64912ee15481d157158056043a59220f10b5d1e795f26f2594e5e8834;
    stim[38] = 260'h2e43e2017c65a8fa82dc174b4a605acb928e31584d95e26ae9b1c7b742a3a2a4e;
    stim[39] = 260'hbbab7af4cb8f01f9d5eff55d8a651e9761024c23831a9602074c969c90044499b;
    stim[40] = 260'h15a413474c4a6813791bf334237a2c36dd34b48c52730e44fa484256799325dc3;
    stim[41] = 260'h2440c365061de46c73ff8c1ddb1ca8683f6c8331d825d52a64c1ccebea23c14f6;
    stim[42] = 260'h2f159fd32d9138be2b123a7492c5ad6bcb3db60206b09164b5620dcbade4667ca;
    stim[43] = 260'h42f5c0dc48299ae6ebbbe03eb0253289beaa7d9a1a643c5a387b1258153948e35;
    stim[44] = 260'h6e155db18028c2610649b7a9897d9587a5dd0f10c5cf820726fb49745180803ea;
    stim[45] = 260'h507faa92020e7d74c52ffff908dfe8127c303a6075a0f4891660d39557c317b61;
    stim[46] = 260'h579f73e9216c6f69ed19cf509fc272e6362b617df6397b2520f22a836173ffb9a;
    stim[47] = 260'hefd02920e4ffbf7ccd8ed18d81f5cb126b422645bc00aa03005c57329a3999965;
    stim[48] = 260'hce174d3fa6972f5de8608100690301156f44b21b8e407c0de4e30f12bd1938090;
    stim[49] = 260'h81cccb74c66562a1900798ec5997654b382951b8bd0cc8f205472dc9f6b7d6010;
    stim[50] = 260'h0a93b3b169f6d028e5e6782d1a4fee4493c8034c06fbe89e288f644a5f08397ad;
    stim[51] = 260'h3ac736d232dd1f6e2d827ce19b33e8d69076145d0fdb1b9d1b157be3755f91361;
    stim[52] = 260'h2cdb6b86d25bb84a8e721d9e15ccf874a9d5533c125646a6eaa9ce139c3f6051d;
    stim[53] = 260'hf70d5480264e484c34aac2449e9efded020b8bb0a35402dee92017031651c10da;
    stim[54] = 260'h96f1c140b01305f43cf569beee7516d2a51bb9db0ebf819a8eb583f9cf25dd8bb;
    stim[55] = 260'h12e266436165e8625bb6419367082a291b1ee473de563c781d63c92e6e3a299af;
    stim[56] = 260'hf8b60a7d1f7f982c916ca158e436350064803a807af9bcab2966cd03cf99af25e;
    stim[57] = 260'hd9adcab41509d2b9411e0b8dd930640ec108a5af2bc8ecff1b12bf7a36ef3f180;
    stim[58] = 260'hbe961543a0bebfd6309d04ccf9807319a80feeb0954ca67cc8573d049a510b087;
    stim[59] = 260'h4c3c757298ca16ccd57d8c9e199cf958790d867adc744ed558343b01d7c988301;
    stim[60] = 260'h0e3fb81b8c0ebb155a6edcdc0ccc6d6fe66f0969ff386a820ba23c5e99d054467;
    stim[61] = 260'hb76ba881a05b84e9cd5b448b673194d5695b52d5ce69deb83c92506d9e7c1358a;
    stim[62] = 260'h137ee6c49d6c38ec168038e501d14f4f65d6278cdb29dc4f2e29222b5a7f80d5a;
    stim[63] = 260'h31f3fd58beeb75a14781e2194dbc4591f3895a5300371bc88042be6254121aeea;
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
      expv[0] = 16'h77ac;
      expv[1] = 16'hbada;
      expv[2] = 16'h6599;
      expv[3] = 16'h3c65;
      expv[4] = 16'h95a9;
      expv[5] = 16'hcac6;
      expv[6] = 16'h0608;
      expv[7] = 16'heb64;
      expv[8] = 16'h01e9;
      expv[9] = 16'h9464;
      expv[10] = 16'hcb61;
      expv[11] = 16'h430b;
      expv[12] = 16'hdb04;
      expv[13] = 16'h05af;
      expv[14] = 16'h9eb8;
      expv[15] = 16'h026d;
      expv[16] = 16'h80f4;
      expv[17] = 16'h8acd;
      expv[18] = 16'h67e2;
      expv[19] = 16'hf268;
      expv[20] = 16'h029b;
      expv[21] = 16'he8b8;
      expv[22] = 16'heaff;
      expv[23] = 16'h77c5;
      expv[24] = 16'h9f2b;
      expv[25] = 16'he6cd;
      expv[26] = 16'ha8db;
      expv[27] = 16'hc41f;
      expv[28] = 16'ha93f;
      expv[29] = 16'haf1d;
      expv[30] = 16'hb07b;
      expv[31] = 16'h168d;
      expv[32] = 16'h168c;
      expv[33] = 16'h59d8;
      expv[34] = 16'h1033;
      expv[35] = 16'he25e;
      expv[36] = 16'hcd87;
      expv[37] = 16'ha592;
      expv[38] = 16'hc65a;
      expv[39] = 16'h6020;
      expv[40] = 16'h3474;
      expv[41] = 16'h61de;
      expv[42] = 16'hd913;
      expv[43] = 16'hbbbe;
      expv[44] = 16'h97d9;
      expv[45] = 16'hff90;
      expv[46] = 16'hf509;
      expv[47] = 16'ha399;
      expv[48] = 16'h4e30;
      expv[49] = 16'h8295;
      expv[50] = 16'ha93b;
      expv[51] = 16'hf6e2;
      expv[52] = 16'h25bb;
      expv[53] = 16'h10da;
      expv[54] = 16'h9db0;
      expv[55] = 16'h6436;
      expv[56] = 16'hf25e;
      expv[57] = 16'hf7a3;
      expv[58] = 16'h67cc;
      expv[59] = 16'h57d8;
      expv[60] = 16'he3fb;
      expv[61] = 16'heb83;
      expv[62] = 16'h6c49;
      expv[63] = 16'h5a14;
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
