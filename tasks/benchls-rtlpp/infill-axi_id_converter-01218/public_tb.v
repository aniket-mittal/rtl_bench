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

  rtlpp_01218 dut (
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
    stim[0] = 228'h3c45d87ba5e82c83d2867aeb84869d13fb7adafe136a4c0ce71d1d1d3;
    stim[1] = 228'h35fafca64889d4b4955611950ac1ae973cd9eae703c5d0cf513ceda3a;
    stim[2] = 228'h8c1e3954589d1c97ac1895b101db894043976bdf0e18ede0904e7dc54;
    stim[3] = 228'h9de6e35d86d59c5bc117e3ceb2aeb754c170981b4463fb24e505ca588;
    stim[4] = 228'hf392dbfe854a26065a76a0cfd94191110e6ddf32cc509e9972354fb91;
    stim[5] = 228'hd3dc93bfd45fbe67f8129b81a8f1555853caad9dc1ed301f432dd0fd7;
    stim[6] = 228'h9b943f620bc6c93eaad36fd9f14fdbc12374eca8e188b8aaf3f7f4128;
    stim[7] = 228'h8129219e343554963f054879633414e1574588fe33911d3faef50ef71;
    stim[8] = 228'hf9db482158de0ccfc156f2fce729217c7bdf510a51e74a2ad76637543;
    stim[9] = 228'h8f8c1854ea85699b49217aa0e7f40a6d84ada60d3adb5ee47c26456e1;
    stim[10] = 228'h9f8c0add3a999ab806293f27665ec8caad15d38b2aa1671bb30ccad95;
    stim[11] = 228'hc7ca43d74a6096c0eb7f20828e27aed10157b9e2bf9458d58b6ef5f92;
    stim[12] = 228'he75731e178cc0998727bbe1330a53fbdb82dbaa080524eb9d240ecff3;
    stim[13] = 228'hfda2e6aa0dc4df6410d5fad9059e749ad29247ef3048aa52d81c48ecd;
    stim[14] = 228'hf67465ef6a5f35d74fc8a4b8db83370f5313b6f019337f76cdc8cb767;
    stim[15] = 228'hf58efcfeaf94fab898b4bffbeeef72b3cb127f78e7dab5bf47c9d3810;
    stim[16] = 228'hce87a126829d4b1f4ff32eecbcf637dd37eb8105eb8117582bd67e86a;
    stim[17] = 228'h999db8c1b86c031e47b029376a714a07e8ff0145fbcfd79da06cc6d3f;
    stim[18] = 228'he337c641e38147f157c47a8773d0558e8a4d5fe7bf0f5144b8656095a;
    stim[19] = 228'hf7a6099cc7788e032ced47b887600b4a457ae2c1c1ffaa9e606462c2f;
    stim[20] = 228'hc3522a3fdfb11611d762b004f1052da94ee46b71c72e3cd816dd9a469;
    stim[21] = 228'h89f4b7a0b4d90374ee60ed8f16cf038c0b221fe6aca2128576bb9dedc;
    stim[22] = 228'hf31ca9eaca4dcaa670490771d0a5569ede6a9d5e75e7ca0be25dc3ded;
    stim[23] = 228'hb45b13e4a2c8b36af9010da7a194c4e074d47de403d5fad7dc67bb2b5;
    stim[24] = 228'hc50e226621b7089d8d90ab08b9b9fe3a860cc7f6a4413488218c48dad;
    stim[25] = 228'hf5eaee778226353cd01cfc06768261f298d2e20d2b136235b25faeb04;
    stim[26] = 228'h828db31b99b7a1ce2a6f7599d04fed61dcfd4a32d5a29d5dbce985dd3;
    stim[27] = 228'hd5880e9dc7b95cc0a5a101590c0a4dcd58a94ab590071251da0f3ac83;
    stim[28] = 228'h8eacf095ab18a7ddb26483efbffb6c4643c638d2fd87a5cf84c181e55;
    stim[29] = 228'ha01b548a2da9f6cf565e642db73d1f56c0d02ee83d810f9898bed9116;
    stim[30] = 228'hae74aa52682a940bda8cd2aa05bdda96da12992718334d75fd1317e88;
    stim[31] = 228'hd89a5bc07905e91277f2809a138fc889dcd53703cedc6a32c218b76a7;
    stim[32] = 228'he2961ec6b953ed7765397a5137962634ff65432f0cfa1bf4c99bbc07b;
    stim[33] = 228'ha45c8fe32d86e51ac4d5b57fc2573a90aba76cae76417345de3c94b40;
    stim[34] = 228'h99a51d5ffcbfcdcd525213fb3e0cbdfef5d119f77dcb763fe7baf2994;
    stim[35] = 228'hea93bad5ecfd3724313f5ba7a75db79304b71d192088ada4c0759c02f;
    stim[36] = 228'hf7b06ab28d20f1ee2d71dde7222f8743bc1b0c7b3f8c0536ced56603b;
    stim[37] = 228'he24d08c48e02cd1c009c39346c3e6eb64f669a306fcdbd42385f32a9f;
    stim[38] = 228'hdcb4b6705b7f2559777a271bfbe37ebeaf857997634691eb9295378f3;
    stim[39] = 228'hbfae2b659379ab303d2e539e2ae06ecb02251fc944e3c8c5a669d8be3;
    stim[40] = 228'he384eca036dc051a20e0ab2e18b9ec436f56a506e0b4d3576761f67eb;
    stim[41] = 228'ha262730c558dc2c11529194095a425e57c34ccc46ea859374c925a2fe;
    stim[42] = 228'hfef11fc301580666be2bc84c47d48f58c2d75ba64b113d2a9d7753dae;
    stim[43] = 228'hc563f63dec3bfc3a699ae98bc8c60b2efb6ad5d85403a3da7ebc7c54e;
    stim[44] = 228'hcee8a6c091f38abb61dbe8cf6b995f7bb0ef65afc2d84970624c56b7b;
    stim[45] = 228'hdff7f7da7ba8a20f6f44750f13a865ddb027e2992bd98242a9b244bdc;
    stim[46] = 228'hc71e857d6cdadd61b92e5670c73640a713a48229025253f315ad37bb8;
    stim[47] = 228'hcd31731b0770f4a3438696a20e0d0a595c378f9f7bb22f616e9562733;
    stim[48] = 228'ha4895e033386a46ce6b0d7dc9540fa4d1e42fc07fb2cc02ef79cfd633;
    stim[49] = 228'hfc182bb0988ba1c8ed020e4a3253e8472d523b6f09f077aced737d475;
    stim[50] = 228'hed89f66d87cc821d13a43e59c8b628a49bf176707925424491997067d;
    stim[51] = 228'h9838ba0a35d954aed2caf28b54b01ee8a25396accd501dbbb0777f239;
    stim[52] = 228'h89f116486504471c8e91de1f4f3fcdb5363eea0b691ad5ae6bf9f20ce;
    stim[53] = 228'hb06e3c73cd262612bd336e72b2c42f4099299becc152fdca7ae4c3eb3;
    stim[54] = 228'h8c46b2fe78720398ea1d52c2ce06d02eb4572a2705c8c81acea21bf84;
    stim[55] = 228'h8ebf0d5ce27d72b5d83718a8b4f5d59c27e5829d59cac6722d1eafdc7;
    stim[56] = 228'hbc310f0286ffa24be980f5a72914b709244ce4b62609411d180287fec;
    stim[57] = 228'hfd26b96f0dbf8c08f114717bd3967cca00b3fd15c6cb3c734751a0361;
    stim[58] = 228'ha9eac736f6eb7fb7fd3c8364c952d703de54ee946b50d9ce19d749f9e;
    stim[59] = 228'ha66e5dbac3566743bd0191ffa8b7dfe03cd6f8eec110a52f2d1031a68;
    stim[60] = 228'hd540ccd010a91369e615d38ff17c44cad23bd9a0135951cff674f2265;
    stim[61] = 228'hcba81ccf01514ff27ddbc0f0d6e6bc545359dfecbf6d398cb0378cc85;
    stim[62] = 228'hc7f8f3c01471beab878625fd6668131a18a18830121567df2dcae0b4e;
    stim[63] = 228'hd0dc907ab16649c0acd837d0dff3f04c72ed556068a65fa124ccd13e8;
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
      expv[0] = 177'h000000000000000000000000000000000000000000000;
      expv[1] = 177'h000000000000000000000000000000000000000000000;
      expv[2] = 177'h000000000000000000000000000000000000000000000;
      expv[3] = 177'h0000080000000000000000000000000000003976bdf16;
      expv[4] = 177'h0800000000000000000000000071e759575c3976bdf14;
      expv[5] = 177'h1739144472354fb91adbfe854bf1e759575a3976bdf15;
      expv[6] = 177'h0f39144472354fb91adbfe854b4dc0d478ae3976bdf15;
      expv[7] = 177'h0739044472354fb902dbfe854b4dc0d478a83976bdf14;
      expv[8] = 177'h1812f3852ef50ef719219e3433a43cb19a0e3976bdf15;
      expv[9] = 177'h1012f3852ef50ef701219e3433a43cb19a0a3976bdf14;
      expv[10] = 177'h1012e9b67c26456e19219e3433a43cb19a084ada60d2f;
      expv[11] = 177'h01f8b1b67c26456e19219e3433243cb19a0a4ada60d2d;
      expv[12] = 177'h09f8a9b67c26456e19219e343310414713d4157b9e2af;
      expv[13] = 177'h167511b67c26456e0731e178cc90414713d2157b9e2ac;
      expv[14] = 177'h0e751a6b581c48ecdf31e178cc7d6c82cf3f29247ef37;
      expv[15] = 177'h0e75026b581c48ecc731e178cc7d6c82cf3d29247ef34;
      expv[16] = 177'h1758f26b581c48ecc6fcfeaf94fd6c82cf3b29247ef34;
      expv[17] = 177'h0f58ea6b581c48ecc6fcfeaf9417765e7b1d7eb8105ea;
      expv[18] = 177'h0199d01fa06cc6d3fefcfeaf9417765e7b1b7eb8105e9;
      expv[19] = 177'h1999d81fa06cc6d3ffc641e380bd43b9e82ea4d5fe7ab;
      expv[20] = 177'h0199c81fa06cc6d3ffc641e3803d43b9e828a4d5fe7ab;
      expv[21] = 177'h1999c81fa06cc6d3fa2a3fdfb0d802788294a4d5fe7ab;
      expv[22] = 177'h189f581fa06cc6d3fa2a3fdfb0d802788296a4d5fe7ab;
      expv[23] = 177'h109f401fa06cc6d3fa2a3fdfb0d802788290a4d5fe7a9;
      expv[24] = 177'h0b45f81fa06cc6d3fa2a3fdfb006d3d0ca674d47de41f;
      expv[25] = 177'h0345e81fa06cc6d3fa2a3fdfb006d3d0ca614d47de41f;
      expv[26] = 177'h175ed01fa06cc6d3e2ee77822686d3d0ca634d47de41c;
      expv[27] = 177'h0f5edd873ce985dd3aee7782263acce827f7cfd4a32cf;
      expv[28] = 177'h0f5ed5873ce985dd3aee7782263acce827f7cfd4a32cd;
      expv[29] = 177'h175edd873ce985dd3cf095ab1ebacce827f23c638d2f3;
      expv[30] = 177'h0f5ec5873ce985dd3cf095ab1e3216db9e8c3c638d2f1;
      expv[31] = 177'h1ae75d873ce985dd24aa52682db216db9e8fa12992706;
      expv[32] = 177'h0ae752274218b76a7caa52682d3216db9e8fa12992705;
      expv[33] = 177'h0ae74a274218b76a64aa52682d3216db9e8df65432f0e;
      expv[34] = 177'h0a45d2274218b76a64aa52682d3216db9e8ff65432f0c;
      expv[35] = 177'h1245d2274218b76a651d5ffcbeb216db9e8bf65432f0c;
      expv[36] = 177'h1a45c64c40759c02fd1d5ffcbeadd3d3aeddf65432f0d;
      expv[37] = 177'h0a45c64c40759c02e51d5ffcbe2dd3d3aeddf65432f0c;
      expv[38] = 177'h0a45cad9385f32a9fd1d5ffcbe2dd3d3aedcf669a307f;
      expv[39] = 177'h15cb32d9385f32a9e4b6705b7cadd3d3aedaf669a307c;
      expv[40] = 177'h1dcb2b2c2669d8be3cb6705b7ca9cf1570342251fc947;
      expv[41] = 177'h0e387b2c2669d8be3cb6705b7c29cf1570362251fc947;
      expv[42] = 177'h1e387b2c2669d8be22730c5588a9cf1570362251fc946;
      expv[43] = 177'h1638632c2669d8be22730c5588a9cf1570302251fc944;
      expv[44] = 177'h06386b2c2669d8be22730c558829cf157031b6ad5d852;
      expv[45] = 177'h0e386deee24c56b7ba730c55887467b5ccadb6ad5d853;
      expv[46] = 177'h0e3865eee24c56b7ba730c55887467b5ccadb6ad5d851;
      expv[47] = 177'h1c71bdeee24c56b7a6857d6cd8f467b5ccaf3a482290a;
      expv[48] = 177'h1c71a9656e9562733e857d6cd8f467b5ccad3a482290b;
      expv[49] = 177'h1471a1656e95627326857d6cd8f467b5cca93a4822908;
      expv[50] = 177'h1471a11ced737d475e857d6cd8f467b5cca93a4822909;
      expv[51] = 177'h1471a91ced737d475e857d6cd8f467b5cca9bf1767063;
      expv[52] = 177'h0983b11ced737d4746857d6cd87945aa580fbf1767060;
      expv[53] = 177'h0183b11ced737d4746857d6cd87945aa580bbf1767060;
      expv[54] = 177'h1983ad027ae4c3eb3e3c73cd21b7395962159299becdf;
      expv[55] = 177'h0183a5027ae4c3eb3e3c73cd2137395962119299becdd;
      expv[56] = 177'h1983ad027ae4c3eb270d5ce27a8c545a7aec7e5829d42;
      expv[57] = 177'h03c35d027ae4c3eb270d5ce27a0c545a7aea7e5829d42;
      expv[58] = 177'h1bc35b284751a0361eb96f0dbcb8bde9cb3e7e5829d43;
      expv[59] = 177'h13c34b284751a0361eb96f0dbcb8bde9cb387e5829d43;
      expv[60] = 177'h1a66fb284751a03606b96f0dbcc8ffd45bee7e5829d42;
      expv[61] = 177'h1266f32b7674f2265eb96f0dbcc8ffd45bea7e5829d41;
      expv[62] = 177'h1a66f32b7674f2265eb96f0dbce0786b735e7e5829d41;
      expv[63] = 177'h0266eb2b7674f2265eb96f0dbc60786b73598a1883013;
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
