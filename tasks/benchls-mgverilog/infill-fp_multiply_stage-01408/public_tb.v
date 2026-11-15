// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 184;
  localparam OW = 168;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01408 dut (
    .clock(clk),
    .aout_Special(in_vec[183:151]),
    .bout_Special(in_vec[150:118]),
    .cout_Special(in_vec[117:82]),
    .zout_Special(in_vec[81:46]),
    .sout_Special(in_vec[45:14]),
    .modeout_Special(in_vec[13:12]),
    .operationout_Special(in_vec[11:11]),
    .NatLogFlagout_Special(in_vec[10:10]),
    .InsTag_Special(in_vec[9:2]),
    .idle_Special(in_vec[1:0]),
    .idle_Multiply(out_vec[167:166]),
    .cout_Multiply(out_vec[165:130]),
    .zout_Multiply(out_vec[129:94]),
    .sout_Multiply(out_vec[93:62]),
    .modeout_Multiply(out_vec[61:60]),
    .operationout_Multiply(out_vec[59:59]),
    .NatLogFlagout_Multiply(out_vec[58:58]),
    .productout_Multiply(out_vec[57:8]),
    .InsTag_Multiply(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 184'h1ded634ae48c1b409d92c5f50d2a6571012f562f99f08a;
    stim[1] = 184'hf4caf1788c7c873da8c2ad0f613a74f97b95f7602e7f45;
    stim[2] = 184'h4d570605d8113214f8a999004b66c100fe704393972bbf;
    stim[3] = 184'h14360576daebb9b822a14365ca3fe71677b09b5fbda982;
    stim[4] = 184'h011249977f4a8744869c7ef49dd99801a0b377b89af6b1;
    stim[5] = 184'h7ad0592b2913e71e522c281b393150b6925db622dd76c9;
    stim[6] = 184'hac7bd54466e91f9b585709c6250846b25c098ab04b98bd;
    stim[7] = 184'hf88aa95d0816b37eb837591a74baf6be35f0ccd292e4e7;
    stim[8] = 184'hfed529c3c7b88b4aabd4a61299778fdc706595331b2720;
    stim[9] = 184'hb92cb65c0d3848be9ec8f9233c4b4d3351f87f04d8b495;
    stim[10] = 184'h9e8135c3c68ec4625a3292f67888a5d2bfcfce1dd82b98;
    stim[11] = 184'h8f911fc6d20eea5bb534e65436df9c32577999b4af33e9;
    stim[12] = 184'h3319f2172420b9acfd67bebda3eb7dcfd7c73abd2065f4;
    stim[13] = 184'h1cf4e804c924fc51b20ebf4a2623b45ef3a10794359e8e;
    stim[14] = 184'hf4d8d024aabffc2cdda414f5b715df68ea39245b452ea6;
    stim[15] = 184'hcdcaa5615960f67868cfda006a539d93bfdd4d78271de0;
    stim[16] = 184'h8b9faeb227c5b1590fbc5667adbca13ccaee22974f2410;
    stim[17] = 184'hc8a9c580f9c82b537d3044ed4557257301952dc4d945a4;
    stim[18] = 184'h96f9c8488220dea5e66ba8602a60b113688783d3cdbd20;
    stim[19] = 184'h19c7bc52d4788ada8ee7f70b0fcbebac41c8145813d098;
    stim[20] = 184'h8cde88caf7f90e2f2523420a82a25ad283d48fc165bb92;
    stim[21] = 184'h1e932d1299d7356ce40fccdefe9839131713723920787f;
    stim[22] = 184'h7ff4132fb8cf42cb69f1c6557124f7b724804bdb693420;
    stim[23] = 184'h2de986d50caca3a74b2247d0c55a440d9ef23240ae3a37;
    stim[24] = 184'h2843048371de52eacdda821f342fce0465793721a75ed2;
    stim[25] = 184'h5120d24ecc36cc08a31ccba9eb6206cd57a679a796774b;
    stim[26] = 184'h7a36ca350ff19486f3eedb82e3b0e117f9e7769e122878;
    stim[27] = 184'h1c7988918f2559400c273fca40e9ceec9e84baffddadeb;
    stim[28] = 184'h0b47407660bf03dd1db3066ab1a02d32ddb41fed8dd137;
    stim[29] = 184'ha4f13813891290898141da6735b07f06fb80b119d92fb3;
    stim[30] = 184'ha8b5b90f2a3ec263e0493c426743ea32fdba7df5922747;
    stim[31] = 184'h6f2b3d2c50071a91ccbd6633b238863fef0807a950916d;
    stim[32] = 184'hb29d9886d61740b98257acf1f13e551c7896fe5071f1be;
    stim[33] = 184'hb4c6b6022f4b0bb1c8451c4e8e060be2504168f48dc268;
    stim[34] = 184'ha00c34d44d31eb1386a632025fd630f6ec5e261aaa48fc;
    stim[35] = 184'h786bb0de6a82a55d20c509d5c8878d3cc94b2ef87741f8;
    stim[36] = 184'hbfd93e565f368b59426be31900fd1b44123f13a19b3e50;
    stim[37] = 184'h268edb4de9bfdaa63e1972e49d893dfd3a65bef71ba5cb;
    stim[38] = 184'hfbbaf62774099a19e879ca27092448fc0b41340b041131;
    stim[39] = 184'h8cad21512b1a0e3b67f7e2be1d82f6ecd99dcd925f1b0e;
    stim[40] = 184'h8481447dd15b7f5bb786c81cd98858a8a88698e0d5fc50;
    stim[41] = 184'h827623fbf26c2ebc6392778860cbdf22d4cc87435ab059;
    stim[42] = 184'hd574bc58e85b68d149138cc1a5b2c0a22b5121e0a12a27;
    stim[43] = 184'hcd9f8c1e345b1c0c732c7844a670062d791b4df000ed93;
    stim[44] = 184'h33d192c589047b63b60451d447256b3d2be6429efae0f7;
    stim[45] = 184'h288c4adba8beac679903b50a879a305f1aca154c040331;
    stim[46] = 184'h9bfb7889c54a364b59830ec5483a788a66a7c18165fef1;
    stim[47] = 184'h4e77885d427c75c3b7f34f5c72e46408d42f3b3178c1a6;
    stim[48] = 184'h0e22abd39713856fe106348c8f8f30a069613e9df3ca41;
    stim[49] = 184'hb4e7688c312b42e12fc842d16ef689407663c03af6f1dc;
    stim[50] = 184'h1814ad755c0d0097b4fedd3a14015616ab218b897ecc72;
    stim[51] = 184'haf537d74d53e2f987528c3817ac77733ea78f20101f3b1;
    stim[52] = 184'h7c27373dd6314c7cfd4b91f35366331d0126a0f2fa5957;
    stim[53] = 184'h456e6eb09a436c0ab1bf1c88843f8fad93044b4b7910e7;
    stim[54] = 184'h2b6482c4addbea6eaec12228eb2cdcc05cbdf1af0f04f8;
    stim[55] = 184'h454ff917913e27dedd2bb83cd1f23afa088f0fb3348185;
    stim[56] = 184'he34df60eb5aacf92fdcef6ccbdc83d07ad172ef4d3a3f0;
    stim[57] = 184'h715d25abe72b7de908247f22ce2ca1dbcbf11f550f42ca;
    stim[58] = 184'ha42a7ac579ca0f48a97c0d9b8ec07bfe0ca77a8bfe88c4;
    stim[59] = 184'h6ee353094b3f0a17d84934e3d162668fb73d5573239375;
    stim[60] = 184'h4f9391f33c60d00f60dc32b82cd94ccce7cac34e3a6fb5;
    stim[61] = 184'h1fc3e801a7c41964949755f3202a1968baf03c528b7690;
    stim[62] = 184'h953f2897761bfcff637770b7916267535d505679d30c90;
    stim[63] = 184'ha1a30cd8b705b2ccd15618af9ae9df1a2890f2afae332b;
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
      expv[0] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 168'h9d92c5f50d2a6571012f562f99fxxxxxxxxxxxxx22;
      expv[2] = 168'h68c2ad0f613a74f97b95f7602e7xxxxxxxxxxxxxd1;
      expv[3] = 168'hf8a999004b66c100fe704393972xxxxxxxxxxxxxef;
      expv[4] = 168'ha2a14365ca3fe71677b09b5fbdaxxxxxxxxxxxxx60;
      expv[5] = 168'h469c7ef49dd99801a0b377b89afxxxxxxxxxxxxxac;
      expv[6] = 168'h522c281b393150b6925db622dd7xxxxxxxxxxxxxb2;
      expv[7] = 168'h585709c6250846b25c098ab04b9xxxxxxxxxxxxx2f;
      expv[8] = 168'hf837591a74baf6be35f0ccd292exxxxxxxxxxxxx39;
      expv[9] = 168'h2bd4a612983c0000002595331b2659ef2739bc98c8;
      expv[10] = 168'h5ec8f9233c4b4d3351f87f04d8b659ef2739bc9825;
      expv[11] = 168'h1a3292f678b40000000fce1dd828023bca3208fce6;
      expv[12] = 168'h7534e65436df9c32577999b4af30023bca3208fcfa;
      expv[13] = 168'h3d67bebda3f2000000073abd20646a228a9780a87d;
      expv[14] = 168'hb20ebf4a2623b45ef3a10794359c6a228a9780a8a3;
      expv[15] = 168'h9da414f5b715df68ea39245b452c6a228a9780a8a9;
      expv[16] = 168'h28cfda0068060000001d4d78271d3391436c9a0878;
      expv[17] = 168'h0fbc5667ad720000002e22974f24168b88d9bc4004;
      expv[18] = 168'h3d3044ed44f6000000152dc4d9442aa7b8c1f13469;
      expv[19] = 168'h266ba86028700000000783d3cdbdf45e73097e1c48;
      expv[20] = 168'h0ee7f70b0f0e00000008145813d1fb035956ad4826;
      expv[21] = 168'ha523420a82a25ad283d48fc165b9fb035956ad48e4;
      expv[22] = 168'he40fccdefe983913171372392079fb035956ad481f;
      expv[23] = 168'h29f1c65573ca000000004bdb6934dd6d1c5f4ecc08;
      expv[24] = 168'hcb2247d0c55a440d9ef23240ae38dd6d1c5f4ecc8d;
      expv[25] = 168'h8dda821f342fce0465793721a75cdd6d1c5f4eccb4;
      expv[26] = 168'he31ccba9eb6206cd57a679a79674dd6d1c5f4eccd2;
      expv[27] = 168'h33eedb82e26c00000027769e1229538fbc526cb81e;
      expv[28] = 168'hcc273fca40e9ceec9e84baffddad538fbc526cb87a;
      expv[29] = 168'hddb3066ab1a02d32ddb41fed8dd1538fbc526cb84d;
      expv[30] = 168'hc141da6735b07f06fb80b119d92d538fbc526cb8ec;
      expv[31] = 168'he0493c426743ea32fdba7df59225538fbc526cb8d1;
      expv[32] = 168'h4cbd6633b238863fef0807a95091538fbc526cb85b;
      expv[33] = 168'h8257acf1f13e551c7896fe5071f1538fbc526cb86f;
      expv[34] = 168'h08451c4e8c520000000168f48dc061a1a01ebc709a;
      expv[35] = 168'h06a632025cee0000001e261aaa484c2a401444c03f;
      expv[36] = 168'h20c509d5c93a0000000b2ef87740239e3b4ad4c07e;
      expv[37] = 168'h026be31903fc0000003f13a19b3e60774335af7094;
      expv[38] = 168'hfe1972e49d893dfd3a65bef71ba660774335af7072;
      expv[39] = 168'h6879ca27092448fc0b41340b041260774335af704c;
      expv[40] = 168'ha7f7e2be1d82f6ecd99dcd925f1a60774335af70c3;
      expv[41] = 168'h3786c81cdaa20000000698e0d5fc045b5557ab6814;
      expv[42] = 168'h6392778860cbdf22d4cc87435ab0045b5557ab6816;
      expv[43] = 168'hc9138cc1a5b2c0a22b5121e0a128045b5557ab6889;
      expv[44] = 168'hf32c7844a670062d791b4df000ec045b5557ab6864;
      expv[45] = 168'hf60451d447256b3d2be6429efae0045b5557ab683d;
      expv[46] = 168'h5903b50a879a305f1aca154c0400045b5557ab68cc;
      expv[47] = 168'h59830ec5483a788a66a7c18165fc045b5557ab68bc;
      expv[48] = 168'hb7f34f5c72e46408d42f3b3178c0045b5557ab6869;
      expv[49] = 168'h6106348c8f8f30a069613e9df3c8045b5557ab6890;
      expv[50] = 168'h2fc842d16c6000000023c03af6f22f326b5f618077;
      expv[51] = 168'hb4fedd3a14015616ab218b897ece2f326b5f61801c;
      expv[52] = 168'h7528c3817ac77733ea78f20101f22f326b5f6180ec;
      expv[53] = 168'hfd4b91f35366331d0126a0f2fa5a2f326b5f618055;
      expv[54] = 168'hf1bf1c88843f8fad93044b4b79122f326b5f618039;
      expv[55] = 168'h2ec12228e8200000003df1af0f055ebab471da283e;
      expv[56] = 168'h5d2bb83cd1f23afa088f0fb334815ebab471da2861;
      expv[57] = 168'h3dcef6ccbd3e000000172ef4d3a1a132a0f0c9fcfc;
      expv[58] = 168'h88247f22ce2ca1dbcbf11f550f41a132a0f0c9fcb2;
      expv[59] = 168'h297c0d9b8e64000000277a8bfe88356a9d69f95031;
      expv[60] = 168'h584934e3d162668fb73d55732390356a9d69f950dd;
      expv[61] = 168'h60dc32b82cd94ccce7cac34e3a6c356a9d69f950ed;
      expv[62] = 168'h149755f323c2000000303c528b7422cb8ad742d8a4;
      expv[63] = 168'h237770b7920a000000105679d30cdcf65b5b91d824;
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
