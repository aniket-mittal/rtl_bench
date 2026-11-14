// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 228;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08378 dut (
    .aclk(clk),
    .aresetn(in_vec[227:227]),
    .s_axi_awid(in_vec[226:215]),
    .s_axi_awaddr(in_vec[214:183]),
    .s_axi_awlen(in_vec[182:179]),
    .s_axi_awsize(in_vec[178:176]),
    .s_axi_awburst(in_vec[175:174]),
    .s_axi_awlock(in_vec[173:172]),
    .s_axi_awcache(in_vec[171:168]),
    .s_axi_awprot(in_vec[167:165]),
    .s_axi_awqos(in_vec[164:161]),
    .s_axi_awvalid(in_vec[160:160]),
    .s_axi_wid(in_vec[159:148]),
    .s_axi_wdata(in_vec[147:116]),
    .s_axi_wstrb(in_vec[115:112]),
    .s_axi_wlast(in_vec[111:111]),
    .s_axi_wvalid(in_vec[110:110]),
    .s_axi_bready(in_vec[109:109]),
    .s_axi_arid(in_vec[108:97]),
    .s_axi_araddr(in_vec[96:65]),
    .s_axi_arlen(in_vec[64:61]),
    .s_axi_arsize(in_vec[60:58]),
    .s_axi_arburst(in_vec[57:56]),
    .s_axi_arlock(in_vec[55:54]),
    .s_axi_arcache(in_vec[53:50]),
    .s_axi_arprot(in_vec[49:47]),
    .s_axi_arqos(in_vec[46:43]),
    .s_axi_arvalid(in_vec[42:42]),
    .s_axi_rready(in_vec[41:41]),
    .m_axi_awready(in_vec[40:40]),
    .m_axi_wready(in_vec[39:39]),
    .m_axi_bresp(in_vec[38:37]),
    .m_axi_bvalid(in_vec[36:36]),
    .m_axi_arready(in_vec[35:35]),
    .m_axi_rdata(in_vec[34:3]),
    .m_axi_rresp(in_vec[2:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[176:176]),
    .s_axi_wready(out_vec[175:175]),
    .s_axi_bid(out_vec[174:163]),
    .s_axi_bresp(out_vec[162:161]),
    .s_axi_bvalid(out_vec[160:160]),
    .s_axi_arready(out_vec[159:159]),
    .s_axi_rid(out_vec[158:147]),
    .s_axi_rdata(out_vec[146:115]),
    .s_axi_rresp(out_vec[114:113]),
    .s_axi_rlast(out_vec[112:112]),
    .s_axi_rvalid(out_vec[111:111]),
    .m_axi_awaddr(out_vec[110:79]),
    .m_axi_awprot(out_vec[78:76]),
    .m_axi_awvalid(out_vec[75:75]),
    .m_axi_wdata(out_vec[74:43]),
    .m_axi_wstrb(out_vec[42:39]),
    .m_axi_wvalid(out_vec[38:38]),
    .m_axi_bready(out_vec[37:37]),
    .m_axi_araddr(out_vec[36:5]),
    .m_axi_arprot(out_vec[4:2]),
    .m_axi_arvalid(out_vec[1:1]),
    .m_axi_rready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 228'h302f7c715d76b9c79b0df7a7e53b658abe9f9a0c92042c02e765ad0d7;
    stim[1] = 228'h63c11b187ee252bda5a7be35227970fe4c96b53c3d4b10745fbb0c5d8;
    stim[2] = 228'hc9326da34bf9c31e9981057e4540c61bf60dcd6b120b12ef3633b0dda;
    stim[3] = 228'h824ed19b457e5fa12a4d6815272ae30a0d54a47bb2696e82fe166d1b1;
    stim[4] = 228'h9b504019c4e01a1d8d5feba670ac9c049f9f689b343b255b646a6edd8;
    stim[5] = 228'ha9ded27f2ad867ecb3467cbd4ccc453845392ae0aaa2a645600356533;
    stim[6] = 228'h8e67f27898985f620c83f5f41180fec5ecb8fd7dfc63b3239528f5165;
    stim[7] = 228'haa7774839313636e3dd5e5d691123d9fcedd72d0a7c63d2082426bae2;
    stim[8] = 228'hd6f5d86d4d38e6f70f736615cbe65cceefdd027fa2c098bff3f276650;
    stim[9] = 228'hade1783f951073fe2a0a2c13ce633664c7e4c1cf4e02d0a1428cfdf18;
    stim[10] = 228'ha16d336980c52002fd997440cb156df6002e85e60646edefc08600153;
    stim[11] = 228'hd525a8bbda063eead8c133890f230da73ff5c2ece72953a0c3f84e7b4;
    stim[12] = 228'h83c1c16d4cc8e624cbefae21704d6a135a26f4f3f7a05d165de24d836;
    stim[13] = 228'h8f7b12e1811640ed94fc79edfb39b51fa30c1b3801bf3411ae1ac1610;
    stim[14] = 228'h976303541bfc61516ea2640bc56b8822b614c2a328596f2bfa5c28922;
    stim[15] = 228'hefea4946ea42de42bb6dab8f0da6bce27ba1d663c20bfbf2e6992cdf9;
    stim[16] = 228'hd3eaee7eb28352e3a5101285597d2308143b32d4d346339e1c5315751;
    stim[17] = 228'hdf66be52b7524d5a7ee1ff4c23c7a29517360df3d9cc699de983b7712;
    stim[18] = 228'hb627f0edeb7f7b72b4473fddc90131cee770f700137a657b9f3c6d339;
    stim[19] = 228'h8493108ff8275e8b8e8e9627d90d9dcaf955575454c56879939744480;
    stim[20] = 228'hb2558ac3e57ee46a43fbf97a31bb29a4ea4e96b74826ce95880229a47;
    stim[21] = 228'h8132f5e93678d9e80ab240cdb4689f4eef8ceb3ab4923e59ebcb008fe;
    stim[22] = 228'hc20e93248638669479a86db0e526d41bfe8ded3f1493e881db3124329;
    stim[23] = 228'ha09b071d9c7dc35eac3f709e3661ea8930a4b1abdfd4ea40d91df1b4d;
    stim[24] = 228'heda4f548ff0d6b3937ac0d90c8a7ee6fb39932709f5ff28b3151b91a9;
    stim[25] = 228'hc149ebe3cbcb29f72572d0e38a3310fb55d52461245fc78bceb700921;
    stim[26] = 228'h9f81e67aa971f5eed56f48c2e919fb2b1d366770e2393f4330e9f5c4c;
    stim[27] = 228'hf920c523d91189cfd0a06578f9c4c6fb543bbdc14fb42ded7cf7891f3;
    stim[28] = 228'hfde80ca5e66a09d02a6d779154f06b1aa364a748afad7497ab451ab37;
    stim[29] = 228'h8f359fe74ee143c7b24530d0ca652be14a56e7e9f74f228a966e8f500;
    stim[30] = 228'hd3eb6584be437fdc9b497fc3b6adc6f935dcd6ff0e75247c429f2eb17;
    stim[31] = 228'ha9946974ab40f3358c11f1617d1c5dac705a80df4ef94c698a7d53a5a;
    stim[32] = 228'he563e92030378fbd555cf1198331bed3871e2495d9ebc729e3d76ff54;
    stim[33] = 228'hbe9da7658f7e753dc003e53b18dfa3f9ab5d57b2624459175db6874b2;
    stim[34] = 228'hcfd64a4c97c35d28bb9a5441e6148ac6a6adad00f570952146b2e104e;
    stim[35] = 228'hde607bcba5091b544d7f4df051e1b1d2e72ba6438e23fb87c6cfe2352;
    stim[36] = 228'hde23f5913978673d890103ba7cae26c99b0ead91256a4f26ae1d0fcc5;
    stim[37] = 228'heda557107de46257843d2aae6584019405796ad882ef53347d98f3518;
    stim[38] = 228'hfd65ee8522cc49e4d78e5076b260a6dcf58df412a335b02a0c76340e0;
    stim[39] = 228'he60756d9dad6e02e1b6baf8a08b703541fc026885648247f456d736ff;
    stim[40] = 228'hebebea0c1b676048268267b8ef6b390d68363a15b318e8b450c84aa39;
    stim[41] = 228'hf13fee03f2191017dcbe5f34c0dde9e8966db682c4412a4259ffef0c0;
    stim[42] = 228'hbacd2240a04f60669b78403870d9b864fe17dc724accbf4c440dcb0fe;
    stim[43] = 228'h9e3c4b6fbb65afca7c6bdcab6d161b956ec15fb627316c028e8a79b42;
    stim[44] = 228'ha29b35c0b547670a613efd94361a318d453a5e9f933c78995fbafec5f;
    stim[45] = 228'hfe221d286c7f945dd8d5ff9e166298957ebe70fcd7769ef26018597bd;
    stim[46] = 228'hecc0ce43ecfb3cbda65b5d56802031118b9a4ce7cee13e8cf91fb6ee9;
    stim[47] = 228'hae65b7d10f7cf320a8e06226d7218421257a84809b9e0fe4462d0a974;
    stim[48] = 228'haf86a2a7809898f3b3ceb39a1396448cedf52697138ac777f5039120a;
    stim[49] = 228'he59be578ee26694e31f16a76d3f47de9d6a1162be49e22ba667c6faef;
    stim[50] = 228'h942e5b85b9ab8e9b5c1dae1abd4a7d3cb07c089c15ab97b451828dd56;
    stim[51] = 228'hd5030485e3099e4c6fdc96928a70b286e0234ce210e290f9345c20c45;
    stim[52] = 228'hde6dd7f73fec529c79d084f1fcb2a77d376df7e6309b7dc1db7932180;
    stim[53] = 228'ha016a41547f5a84005a46d7a869814205482a5a9eeb25027e1c50f6df;
    stim[54] = 228'h8c5ba07d7723a424ecbfa1fe09a6c463b94921f7e0921f38e386cc1f2;
    stim[55] = 228'h9f0415f01f0890e8c578ced6bc353e30f8e82e9cbb9daa100d5e16d15;
    stim[56] = 228'he3d63884d5b54c19e081512d6cb6722a4a19fa4a9322cd1ed9d294ac2;
    stim[57] = 228'ha4769a09d24dd127cb3c23797da841daa9d961239790b1fde95ab67d9;
    stim[58] = 228'ha350b200a8ce1a0eaa16c1fd7bc862695857d90c6f116a228204e4298;
    stim[59] = 228'he729bda8319cf32392246b02786b1a449d3bfc9a864d812d81cada1fa;
    stim[60] = 228'ha0fc9f562e4312546e8abaf0437dfb5be6b7d66470616e7b7e88bcf86;
    stim[61] = 228'h9e59c9e802b3ee2fd34c1df24f9e83c0751fe707b2fa0e9e5b96571ed;
    stim[62] = 228'heb8a1c67eabc334550b358538a67490ce6263aee6856780636462aeef;
    stim[63] = 228'h9340f8a77dfb5a6d774537f9451733e5647fce1fc96152d9673ca7d20;
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
      expv[0] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 177'h000000000000000000000000000000000000000000000;
      expv[2] = 177'h000000000000000000000000000000000000000000000;
      expv[3] = 177'h1c93786fb633b0dda26da34bff82bf22a06760dcd6b0b;
      expv[4] = 177'h0024a4287e166d1b0ed19b4578340a939572d54a47bb4;
      expv[5] = 177'h09b53812646a6edd804019c4e675d338564df9f689b32;
      expv[6] = 177'h129dd4e1600356532ed27f2adebe5ea666245392ae0b2;
      expv[7] = 177'h08e633179528f5164ff27898997afa08c07ecb8fd7df9;
      expv[8] = 177'h12a7067f02426bae2774839317f2eb48891cedd72d0bd;
      expv[9] = 177'h0d6f733bf3f2766505d86d4d3b330ae5f32cfdd027fad;
      expv[10] = 177'h02de1193428cfdf181783f95171609e7319e7e4c1cf49;
      expv[11] = 177'h1a16ffd8408600152d336980c1ba20658ab402e85e617;
      expv[12] = 177'h0552069cc3f84e7b45a8bbda0599c4879185ff5c2ece9;
      expv[13] = 177'h003c604d5de24d8361c16d4cca5710b826b3a26f4f3ec;
      expv[14] = 177'h18f7947eae1ac1611312e18116bcf6fd9cdc30c1b3818;
      expv[15] = 177'h0176308afa5c28922303541bf83205e2b5c1614c2a335;
      expv[16] = 177'h1efeab89e6992cdf8a4946ea41d5c786d35dba1d663df;
      expv[17] = 177'h053ee4201c5315750aee7eb2810942acbe9343b32d4d8;
      expv[18] = 177'h15f652546983b77126be52b755ffa611e3d37360df3d4;
      expv[19] = 177'h03623f3b9f3c6d338ff0edeb799feee48098770f70013;
      expv[20] = 177'h0849172b9397444803108ff8254b13ec86cd955575457;
      expv[21] = 177'h03255693880229a46d8ac3e57d7cbd18dd90a4e96b744;
      expv[22] = 177'h08131d3bebcb008fe2f5e9367c2066da344ef8ceb3abe;
      expv[23] = 177'h1420906fdb3124328e9324863ab6d872936de8ded3f14;
      expv[24] = 177'h02098a24d91df1b4cb071d9c7f384f1b30f30a4b1abd6;
      expv[25] = 177'h1eda31beb151b91a8cf548ff0c86c86453f7399327098;
      expv[26] = 177'h0414b3ed4eb7009209ebe3cbcb6871c519895d5246120;
      expv[27] = 177'h11f83cac30e9f5c4c1e67aa977a461748cfbd366770fe;
      expv[28] = 177'h0f9253ed7cf7891f28c523d917b2bc7ce26743bbdc157;
      expv[29] = 177'h07def46aab451ab3680ca5e6683bc8aa7832364a748b8;
      expv[30] = 177'h10f32785166e8f50059fe74ee39868653292a56e7e9f0;
      expv[31] = 177'h0d3ecbe4c29f2eb16b6584be46bfe1db56e75dcd6ff13;
      expv[32] = 177'h029916b18a7d53a5a46974ab4278b0be8e2d05a80df47;
      expv[33] = 177'h1e56134e63d76ff543e9203036f88cc198de71e2495c1;
      expv[34] = 177'h03e9f7e6ddb6874b25a7658f7e729d8c6fd2b5d57b26c;
      expv[35] = 177'h14fd131ac6b2e104e64a4c97c4aa20f30a426adad00e9;
      expv[36] = 177'h05e6774bc6cfe235207bcba50a26f828f0d872ba6439c;
      expv[37] = 177'h0de263262e1d0fcc4bf591397e01dd3e5717b0ead9125;
      expv[38] = 177'h06da46507d98f3518557107de3155732c2005796ad889;
      expv[39] = 177'h1fd623738c76340e05ee8522caa83b59305758df412b9;
      expv[40] = 177'h06607d50456d736fef56d9dad7d7c5045b83fc0268853;
      expv[41] = 177'h06bec435d0c84aa38bea0c1b6433dc77b5988363a15b5;
      expv[42] = 177'h1713afa259ffef0c07ee03f21baf9a606ef166db682d6;
      expv[43] = 177'h03acc193c40dcb0fe52240a04ba01c386cd9e17dc725e;
      expv[44] = 177'h11e3a6558e8a79b4244b6fbb65ee55b68b0aec15fb634;
      expv[45] = 177'h022996355fbafec5eb35c0b5457eca1b0d1853a5e9f9c;
      expv[46] = 177'h17e22a55e018597bca1d286c7effcf0b3149ebe70fccf;
      expv[47] = 177'h06cc4446791fb6ee88ce43ecfe2eab401018b9a4ce7dc;
      expv[48] = 177'h0ae64884c62d0a9745b7d10f7831136b90c457a848087;
      expv[49] = 177'h12f87233f5039120a6a2a78099d9cd09cb24df5269703;
      expv[50] = 177'h0e59a7a7667c6faeebe578ee27b53b69fa3d6a1162bf1;
      expv[51] = 177'h1142c4f2d1828dd5665b85b9add70d5ea53d07c089c09;
      expv[52] = 177'h05501a1bb45c20c44b0485e30e4b4945385a0234ce20b;
      expv[53] = 177'h1de695f4db79321805d7f73feec278fe595776df7e63e;
      expv[54] = 177'h0201708161c50f6deea41547f036bd434c0d482a5a9e9;
      expv[55] = 177'h08c5818ee386cc1f33a07d772250ff04d36594921f7ed;
      expv[56] = 177'h01f000c38d5e16d14c15f01f0c676b5e1a9f8e82e9cb4;
      expv[57] = 177'h063d60a959d294ac263884d5b42896b65b3aa19fa4a84;
      expv[58] = 177'h02475f6ae95ab67d8e9a09d24b11bcbed4209d961239b;
      expv[59] = 177'h023521a50204e42980b200a8cf60febde433857d90c75;
      expv[60] = 177'h1672d11201cada1fa1bda83199b5813c358bd3bfc9a81;
      expv[61] = 177'h020fbd6ffe88bcf8649f562e425d7821befa6b7d66477;
      expv[62] = 177'h11e5e701db96571ec9c9e802b78ef927cf4351fe707a4;
      expv[63] = 177'h06b8e433b6462aeeea1c67eabaac29c533a06263aee7c;
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
