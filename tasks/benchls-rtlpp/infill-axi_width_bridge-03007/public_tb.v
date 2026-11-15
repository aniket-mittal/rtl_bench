// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 270;
  localparam OW = 217;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03007 dut (
    .aclk(clk),
    .aresetn(in_vec[269:269]),
    .s_axi_awaddr(in_vec[268:205]),
    .s_axi_awlen(in_vec[204:197]),
    .s_axi_awsize(in_vec[196:194]),
    .s_axi_awburst(in_vec[193:192]),
    .s_axi_awlock(in_vec[191:191]),
    .s_axi_awcache(in_vec[190:187]),
    .s_axi_awprot(in_vec[186:184]),
    .s_axi_awregion(in_vec[183:180]),
    .s_axi_awqos(in_vec[179:176]),
    .s_axi_awvalid(in_vec[175:175]),
    .s_axi_wdata(in_vec[174:143]),
    .s_axi_wstrb(in_vec[142:139]),
    .s_axi_wlast(in_vec[138:138]),
    .s_axi_wvalid(in_vec[137:137]),
    .s_axi_bready(in_vec[136:136]),
    .s_axi_araddr(in_vec[135:72]),
    .s_axi_arlen(in_vec[71:64]),
    .s_axi_arsize(in_vec[63:61]),
    .s_axi_arburst(in_vec[60:59]),
    .s_axi_arlock(in_vec[58:58]),
    .s_axi_arcache(in_vec[57:54]),
    .s_axi_arprot(in_vec[53:51]),
    .s_axi_arregion(in_vec[50:47]),
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
    .s_axi_awready(out_vec[216:216]),
    .s_axi_wready(out_vec[215:215]),
    .s_axi_bresp(out_vec[214:213]),
    .s_axi_bvalid(out_vec[212:212]),
    .s_axi_arready(out_vec[211:211]),
    .s_axi_rdata(out_vec[210:179]),
    .s_axi_rresp(out_vec[178:177]),
    .s_axi_rlast(out_vec[176:176]),
    .s_axi_rvalid(out_vec[175:175]),
    .m_axi_awaddr(out_vec[174:111]),
    .m_axi_awprot(out_vec[110:108]),
    .m_axi_awvalid(out_vec[107:107]),
    .m_axi_wdata(out_vec[106:75]),
    .m_axi_wstrb(out_vec[74:71]),
    .m_axi_wvalid(out_vec[70:70]),
    .m_axi_bready(out_vec[69:69]),
    .m_axi_araddr(out_vec[68:5]),
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
    stim[0] = 270'h0af956f1aba016ed4c0538a4bc2aeabfc1181c8bad734ce9f9922088b5324dabb7ad;
    stim[1] = 270'h1c348c1bd12961cd15612700ead77363f0f5d93f6dbffacab7ca29eb4a1775507e03;
    stim[2] = 270'h36ff0cad9f04e16f1d448b449921e92b740decc7ff473bf5af1f1f32c2dc3ef6a1a1;
    stim[3] = 270'h30ae59f787df75c3f3cf730424b8f9902b32043f4eb30a4d4476c3c7052392cd7ae9;
    stim[4] = 270'h2cb582895af03d99f43502bbb4961783330aec34df441cd180d294b73d439d6a4f38;
    stim[5] = 270'h258328993da8c949ac7990c2c0563f1cee67d85205bbe44ae4401b6e4edc5d367ace;
    stim[6] = 270'h3b883f407ea5b84a50eab8c5f5c7b9538849e35d68b55241734c01882be2d1e31b24;
    stim[7] = 270'h26126c41523421ea114b28ba5a30aa5405b7dca6d2008ebf4099067ce0337821620c;
    stim[8] = 270'h227c4435bf0fe54a082820df1bebcef63890dac3ce13731f532bf6dc6affe55bf536;
    stim[9] = 270'h3bc938835b13bcdc7d3203e2c379076b7cba756fee7a792c9cee5922d2251e312021;
    stim[10] = 270'h39959eb3419d58e2ed30d2ca206bb51bac62c01b7f74563e94b5f5408747cab3a047;
    stim[11] = 270'h2b04c2bfa396f72a91a50f94015e206b7111ce1cc4afe461d1e62be122688080774d;
    stim[12] = 270'h3826e7b3625af26d3fb56ad512e0813dc186933cb95784903a1cbd3d607cb0e3bda2;
    stim[13] = 270'h3895de1ef9bb7ad566bae5c1a0273a9eb11217d0a84841074628a7b844f10a58c466;
    stim[14] = 270'h2432a542e134a7f35849d3c0f7cad122b868ba2982b7695051a5f6ae5225fd366ebb;
    stim[15] = 270'h3b5ddf90eda4473361bf22bbe3886b72bf248d0f81b286977c6093b86ea8c8e7cf2e;
    stim[16] = 270'h2c6dfcf31d501ccea64faad52ceb86e5b0d481b5f6678191a3167fe1a2aa993a35f9;
    stim[17] = 270'h3ac945d871c5e4145ca83b7206f662bdbd26b23abc5df4fb18384d55d9a2b61a175e;
    stim[18] = 270'h30b52026a6f6e9347ead557d8af737ab9b890e69b2b696e538541bb897ff380a514b;
    stim[19] = 270'h23a291ffd0e5f1aa44ea5e3716ed233f5be9216c23f9b37078457631d9a6c9c6d950;
    stim[20] = 270'h3de4e408394282a12cddbf72c8960763c354a7d78bfa7663e111737b6a7efa5378b7;
    stim[21] = 270'h3b496ff202afaef930a40f8f113f7dfabc1fd5072ba26d0d57a766097ecd0d960fbd;
    stim[22] = 270'h33a353caf7d5c0c177e11433f8773f7f4f3bd0eb6be750ee0231ce8334b4a0cc6bf3;
    stim[23] = 270'h237b8de4a483020797194a3857941f7fb9206ef53e1eb75f63061ab245cfbe004bd7;
    stim[24] = 270'h33ce6bf32f96746d3a00be28e91931b9fe9b01e7feb66a0181028ac9af8bc13330d6;
    stim[25] = 270'h2642ac1a66a96e44deca866192ececa98b7b8fa29c7f0dd06c03fa49b6006586bb15;
    stim[26] = 270'h231b9c154bc08f7eb5311115f75bd20ee2d48513c3f5e590c358bd1299128dc5dddd;
    stim[27] = 270'h3874cfb3a56a0370b9b4f7d6a6c8cdc6c9dea737dab0e485540f4b16956d0b9e9c54;
    stim[28] = 270'h14da2b9426666ca168413033ef54a9643df5459473e5b42f99bdbe2835aa5a10a57b;
    stim[29] = 270'h299b180bc5b9ba280303390a85c7a1b67425b5fd06942b1888d1ce7ca903e95a2b85;
    stim[30] = 270'h3383e1aae28f47fd36653af2a7028eb5f31920fdacca8f7e24f49bce81fd3da0cbde;
    stim[31] = 270'h34f54da1545e71bd45e38bcf83e76d8ca32d6da5b09547f1305e1c61f3c34bac1885;
    stim[32] = 270'h2a495b0b2ec50829b2b8542a3528bdd507e6b0d00afb4f4219b7372ab51267febf2b;
    stim[33] = 270'h2a4990c5598694e0a0fcfb15b1e879e9567e02df6b348ba1f081c843510d3da4b6bc;
    stim[34] = 270'h3dffa453be6b5d1603c1602561cb1b2017ce347ed2c85beb9267b6b74110fbd6dc98;
    stim[35] = 270'h217d268914527a0ea278590db3c55b3ebf5c561c96c4e6588675480f90e09f455575;
    stim[36] = 270'h2ac9bdb5619a529442b7246bba42eb6a1d20e790801d011160652077d79ac9c3b09b;
    stim[37] = 270'h2ab1b17bfa96c3ca80142db91294b1baae7eacb2eb6792530ef7086eb313f79d49f5;
    stim[38] = 270'h3dfc47ee04a74ae6bc6acb67587f66f50f7f98f0b6478bc08c0ab3eb76d5acadb805;
    stim[39] = 270'h3edf97e2797db3f7e40073d5b1143f49910837ba80391d5b8c180e53e88f474ca37e;
    stim[40] = 270'h3f526c232bbe9c8e720eca34f1f360b772bd77a7eeb01929523e0f74d1c056ec6b7e;
    stim[41] = 270'h21576a3665fcadc71fea3f02a8aeff9e0606e07c952d9c76061998d77d43504a9c16;
    stim[42] = 270'h2d7cdcd043f39d977a34ddac31c4e09950cc08c9f58e0b187c128f688871c9048cc6;
    stim[43] = 270'h34af0ec4b2d462c97c4eec65cb06911d19e75ca2ffd97735eeb127876b8ac24670f9;
    stim[44] = 270'h24b3023d3df605915ce9e577645b9b96342537415e80f510a7ace06e769bc3cabd2e;
    stim[45] = 270'h29dff6fe688c3cce9bc7288379f6ba3e4dcae55092bffc738fb987413eb850d92d5b;
    stim[46] = 270'h2bf23f0f0bad0e17ebfe2c1ad614854475b137a307c969ee88d9cee6d238c227a40a;
    stim[47] = 270'h239b8ded5524c8622b6f7616e5a5818d6b022586e2630aaad6ef12abd58ef01748a8;
    stim[48] = 270'h3dace005b4e9058cc8437bfe78a53c2e814fe9d7893fff83ad0a7833e720ccaee58d;
    stim[49] = 270'h3878dbcaf6f1b4f30b9adadc9a20633eaaedaeeb00f4e9364794035ff6f6b4b1ec8c;
    stim[50] = 270'h2588decffaec9b3049f828c6041672a182f5530242e883a602b7c8301ced1e9cdc14;
    stim[51] = 270'h215737784c55cdd366158dfc789e29f2fe5e363edcc36de5293db24c715fce8bb349;
    stim[52] = 270'h2bdf12a625fadd746e22167f1a27ade8f4b0cea446172f7a9d34b7359f4ea15cc7a9;
    stim[53] = 270'h29a556781169525985b7e5768e73b0bb716d0a0d7739fc6a4a2b87f9be37a9954876;
    stim[54] = 270'h3bd3efc60420ed482549332903ffcd5a76dbb35a5eb9a8c85db8f15c925acd81216c;
    stim[55] = 270'h3f8c3fc2bdbdd565790e3f2adb774f2146f250658ad6c98d8fcb0cdb10b0989f8d16;
    stim[56] = 270'h3462495ac081ce49fae2e8e0994b5add5195ed9578103a0ccf7e0d325ef6531f1e28;
    stim[57] = 270'h37b7f5b311f0a2709130b930332b003070a21e9c7556792548dc5563f72b8fd8143b;
    stim[58] = 270'h3c87fe923c2a10f6eafa8ba729ed23c751de9a1c3ab84c31d291d8c6e8491045a6c8;
    stim[59] = 270'h21e60ec065997539ffefdf9edf95ed704071958288296f9a5a679bbee6a6034fe191;
    stim[60] = 270'h3ce6103641b063b9a1be2e0933b0a9cc90d594d597a78b9d9eff5f544a3b8fa673b3;
    stim[61] = 270'h31f20fb7af772fffac631623b7b90e9b7098ddcf393911413575c60168eae0074bfd;
    stim[62] = 270'h2f065022c433616dcf4c204bb6817a8905530807d0142227c5a12bb7b3238cc76c8b;
    stim[63] = 270'h372b7c7c4799eed1c5114b105e84453d74e0b1ecaa93e8442f36a5a33f2fa2eff5e2;
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
      expv[0] = 217'h000000000002be55bc6ae805bb50bc2aeabfc23039175ae699d3f26;
      expv[1] = 217'h0000000000070d2306f44a587347ead77363f1ebb27edb7ff5956f5;
      expv[2] = 217'h000000000005bfc32b67c1385bc39921e92b701bd98ffe8e77eb5f9;
      expv[3] = 217'h0000000000042b967de1f7dd70fb24b8f9902e64087e9d66149a882;
      expv[4] = 217'h0000000000032d60a256bc0f667ab49617833615d869be8839a301a;
      expv[5] = 217'h00000000000160ca264f6a325268c0563f1ceccfb0a40b77c895c97;
      expv[6] = 217'h000000000006e20fd01fa96e1290f5c7b9538893c6bad16aa482e65;
      expv[7] = 217'h000000000001849b10548d087a805a30aa54036fb94da4011d7e81c;
      expv[8] = 217'h0000000000009f110d6fc3f952801bebcef63921b5879c26e63ea6d;
      expv[9] = 217'h000000000006f24e20d6c4ef371bc379076b7974eadfdcf4f259391;
      expv[10] = 217'h0000000000066567acd0675638ba206bb51ba8c58036fee8ac7d283;
      expv[11] = 217'h000000000002c130afe8e5bdcaa7015e206b72239c39895fc8c3a31;
      expv[12] = 217'h00000000000609b9ecd896bc9b4a12e0813dc30d267972af092075c;
      expv[13] = 217'h000000000006257787be6edeb55da0273a9eb2242fa15090820e8de;
      expv[14] = 217'h0000000000010ca950b84d29fcd3f7cad122b8d17453056ed2a0a35;
      expv[15] = 217'h000000000006d777e43b6911ccdae3886b72be491a1f03650d2ef9f;
      expv[16] = 217'h0000000000031b7f3cc7540733aa2ceb86e5b1a9036beccf0323471;
      expv[17] = 217'h000000000006b251761c7179051306f662bdba4d647578bbe9f6308;
      expv[18] = 217'h0000000000042d4809a9bdba4d1d8af737ab9f121cd3656d2dca71f;
      expv[19] = 217'h000000000000e8a47ff4397c6a9616ed233f5fd242d847f366e0f18;
      expv[20] = 217'h0000000000077939020e50a0a84fc8960763c6a94faf17f4ecc7c3d;
      expv[21] = 217'h000000000006d25bfc80abebbe4f113f7dfab83faa0e5744da1aae7;
      expv[22] = 217'h000000000004e8d4f2bdf570305cf8773f7f4e77a1d6d7cea1dc042;
      expv[23] = 217'h000000000000dee3792920c081e257941f7fba40ddea7c3d6ebec7a;
      expv[24] = 217'h000000000004f39afccbe59d1b4ee91931b9fd3603cffd6cd403027;
      expv[25] = 217'h00000000000190ab0699aa5b913692ececa98ef71f4538fe1ba0d87;
      expv[26] = 217'h000000000000c6e70552f023dfa9f75bd20ee5a90a2787ebcb21868;
      expv[27] = 217'h0000000000061d33ece95a80dc2fa6c8cdc6cbbd4e6fb561c90aa8a;
      expv[28] = 217'h000000000005368ae509999b2858ef54a9643bea8b28e7cb685f336;
      expv[29] = 217'h00000000000266c602f16e6e8a0185c7a1b6704b6bfa0d28563111c;
      expv[30] = 217'h000000000004e0f86ab8a3d1ff4aa7028eb5f63241fb59951efc484;
      expv[31] = 217'h0000000000053d536855179c6f5383e76d8ca65adb4b612a8fe2611;
      expv[32] = 217'h0000000000029256c2cbb1420a6c3528bdd507cd61a015f69e84336;
      expv[33] = 217'h0000000000029264315661a5382bb1e879e954fc05bed6691743e00;
      expv[34] = 217'h0000000000077fe914ef9ad7458061cb1b20179c68fda590b7d7258;
      expv[35] = 217'h0000000000005f49a245149e83a9b3c55b3ebeb8ac392d89ccb10c4;
      expv[36] = 217'h000000000002b26f6d586694a514ba42eb6a1a41cf21003a0222c1b;
      expv[37] = 217'h000000000002ac6c5efea5b0f2a51294b1baacfd5965d6cf24a61d5;
      expv[38] = 217'h0000000000077f11fb8129d2b9ab587f66f50eff31e16c8f1781197;
      expv[39] = 217'h000000000007b7e5f89e5f6cfdfbb1143f4992106f7500723ab7188;
      expv[40] = 217'h000000000007d49b08caefa7239af1f360b7757aef4fdd603252a58;
      expv[41] = 217'h00000000000055da8d997f2b71c7a8aeff9e040dc0f92a5b38ec0ca;
      expv[42] = 217'h0000000000035f373410fce765dd31c4e09951981193eb1c1630f94;
      expv[43] = 217'h0000000000052bc3b12cb518b25ccb06911d1bceb945ffb2ee6bdc1;
      expv[44] = 217'h0000000000012cc08f4f7d816455645b9b96304a6e82bd01ea214f7;
      expv[45] = 217'h00000000000277fdbf9a230f33a079f6ba3e4b95caa1257ff8e71e3;
      expv[46] = 217'h000000000002fc8fc3c2eb4385fcd614854473626f460f92d3dd111;
      expv[47] = 217'h000000000000e6e37b554932188ee5a5818d6e044b0dc4c61555ad6;
      expv[48] = 217'h0000000000076b38016d3a41633378a53c2e829fd3af127fff075bb;
      expv[49] = 217'h0000000000061e36f2bdbc6d3cc29a20633eaddb5dd601e9d26c8ef;
      expv[50] = 217'h0000000000016237b3febb26cc10041672a185eaa60485d1074c05a;
      expv[51] = 217'h00000000000055cdde13157374dd789e29f2fcbc6c7db986dbca524;
      expv[52] = 217'h000000000002f7c4a9897eb75d1e1a27ade8f1619d488c2e5ef53bb;
      expv[53] = 217'h00000000000269559e045a5496658e73b0bb72da141aee73f8d495f;
      expv[54] = 217'h000000000006f4fbf181083b520b03ffcd5a75b766b4bd735190bad;
      expv[55] = 217'h000000000007e30ff0af6f75595fdb774f2145e4a0cb15ad931b1ec;
      expv[56] = 217'h000000000005189256b020739278994b5add532bdb2af02074199fb;
      expv[57] = 217'h000000000005edfd6cc47c289c21332b003071443d38eaacf24a913;
      expv[58] = 217'h00000000000721ffa48f0a843dbb29ed23c753bd343875709863a40;
      expv[59] = 217'h0000000000007983b019665d4e7fdf95ed7040e32b051052df34b5f;
      expv[60] = 217'h00000000000739840d906c18ee6e33b0a9cc91ab29ab2f4f173b3c9;
      expv[61] = 217'h0000000000047c83edebddcbffeeb7b90e9b7131bb9e727222826a0;
      expv[62] = 217'h000000000003c19408b10cd85b70b6817a8902a6100fa028444f8b9;
      expv[63] = 217'h000000000005cadf1f11e67bb4735e84453d71c163d95527d0885f3;
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
