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

  rtlpp_02851 dut (
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
    stim[0] = 228'h71eaff7d32787d60deabaa25d05e97cdb0b984ea53ad4d2bb54aca4fd;
    stim[1] = 228'h7485f1c57e8dbae73a957d65bf3d4ec02eebef763b49317117147e00c;
    stim[2] = 228'hc5527da6e47fe2a2d2403e8ff7abb1e583d05e7ba0dcd06059b33aff8;
    stim[3] = 228'hcbc3d5c28525d73f0fc8e993f1c100373b0a6f8a0f454deb256548765;
    stim[4] = 228'haaba603653b08f522ea0d027efe7c907e2e2766a8c93d450dd13b6ae0;
    stim[5] = 228'hb26bd13c5f13a3298960211c53d38220bfb127004c4fc19c00ec64d53;
    stim[6] = 228'he297a60c64ad24e429331d2f658f7d48409e94eca1b5bee511b45c8d9;
    stim[7] = 228'h90406dcb9d7c3c7477c66c55640b2432c60ed2c677d124217e00d61bd;
    stim[8] = 228'hfd37e7ae7826dac9d60d6ee7442006d4f79106318749a02509d1c9af3;
    stim[9] = 228'hacb063ac63db783b1099392258d922e7f6f728b137304c382da040014;
    stim[10] = 228'h943fa70d9fc8451a3a3d6bc6a25a059012db8a28a7ab0394850b56136;
    stim[11] = 228'he36e519dccf95090b34910fa0226a517bdcb854a5eedcf4108be8aa3d;
    stim[12] = 228'hfab438f3033af26d71c3979012b40fecf262da5c67de4e40bf7e84b12;
    stim[13] = 228'he7cb12653422d64bbfb2106be67da4fae1a426e1b42540e30daa470ae;
    stim[14] = 228'hd8d0293c660638ba76a9298819eaa2f1e10f968fd96e7f3aba1dcac7e;
    stim[15] = 228'hf8c37077a75c43e64c643a393fcba5160434d8ccf485a5aa3dee5d56b;
    stim[16] = 228'h9bacf72e7492ba391e2bf1321550d7df6dd96fa8c752684dafd89e9fe;
    stim[17] = 228'hfb30c85cacf1d61c266d87c2d64dec6cbf98a21afa065c9ae128068f4;
    stim[18] = 228'hfd476e7b39a8aacc6637e9a04247f88a94cc14e06d0f6ee16387b33a7;
    stim[19] = 228'h8ce40500cacadcfd8e6ba8028ca6e921e00d04c4d930e53964c4d5e38;
    stim[20] = 228'he2d786b2aa8ad1afdeb196a61c0ecca5a3ca554c07e0ed2352eaf9de9;
    stim[21] = 228'hcca540a4630fa663f672cde3e99734776140c13acff5346e933674fa6;
    stim[22] = 228'h933d14a6ee198ba78a78ee00abb566a0406751968589281689d804a64;
    stim[23] = 228'hd892afb144a43c4ea78a3d6cab974b2cb870de0bb5352653cf53766b9;
    stim[24] = 228'hb2deaaf16a903e924b7f830d7a5cda69b0188bbb8dc466b593989f7e8;
    stim[25] = 228'hf7e00742b3af5efade63b5aed2264e748fdf018744b8657375c4c2b42;
    stim[26] = 228'hd46cbd5850f3dfbf3933a55e3d2286a55b77fadfb00de90cd40ee5d30;
    stim[27] = 228'hb024b30455e87a2ef6e034d165d260bd9b7b6783366b6f0930a151654;
    stim[28] = 228'hf30f3940a83996f153074efdff605772038a2ea5dbcfcd9d89f072a40;
    stim[29] = 228'hfbd626686e571a16260f1f45b24c04fe71be5a04bf67b158cbbab61e5;
    stim[30] = 228'ha695c95b0afd019f328461d15174f62be2cf514640a4bb9d326c4de84;
    stim[31] = 228'hbb10a8ec5c607c78924663e3275b5b09b14a321bfe1e5d77fa8de1f10;
    stim[32] = 228'h857c73e8fdc1b17ac848c4a4f3ebe1e735c3fdf3e6219b1b3c37376fa;
    stim[33] = 228'h8326f9a3005433a3c61342610f17c8b0214c26ead3d9f0ba59a97391d;
    stim[34] = 228'h995ef043eec635830afb507a7ed308440e90b5923140485c3df38105b;
    stim[35] = 228'hb1c0dab064a025a7fec30a8e431223346721a4f775ea69026fe36ff2b;
    stim[36] = 228'he7fe9fa2ea41685e3bdb35da14660f9f86762082eb8664ce405511204;
    stim[37] = 228'hf77ba5bec184d0fc5843e90504c8a9421130f5f232b874dc6a138174b;
    stim[38] = 228'h9817fa03f7807dcdf182942ec6ddcfec19dbe939bdaa7b8f1b35e9fb0;
    stim[39] = 228'hec69a247bb979672631fd0010e108a9ad99ef9a6a88f5424e58e38be8;
    stim[40] = 228'hf11c8a6896eb415c65e99296aba09ca9f3e4a97bb80576ca8cbeee622;
    stim[41] = 228'hc66bc16aacfea320e910912f62a19c43fa7d06fae2a28adcbb4e40764;
    stim[42] = 228'h9fe0664fcf2408c2d38b4332fbacf8a577a36e56e02ae487952972692;
    stim[43] = 228'hb15febfa6b0f95db72f7c42e02379442dd0f3c6d703ff4efeecf01c3d;
    stim[44] = 228'hfcfddbea9ed760839d18278d4b4db50ad9e05da29beed17f1a17ee284;
    stim[45] = 228'he67fb6cabc592dabdaf483917289ac4951c46d8b8cdb31594a9f87225;
    stim[46] = 228'hb7b849da50642eef2765b283727b7b317a0f1937c21e2d3873c51e10c;
    stim[47] = 228'hec10cfe302833a80d532b7c03691bce3bef8eacec807e63365ac12e4d;
    stim[48] = 228'hac3f055e66c0c24a10b313a30c203ab460b36c8f54a5589b1a3eddd78;
    stim[49] = 228'h845a85d646d36ff2104d1de176063afc37daa35d32d177a9d141f8cc8;
    stim[50] = 228'hf73f34600efab9657a1226e01256cf5b37068b0b29e2970ed321006b1;
    stim[51] = 228'hffea8f4a486ef69eb9ad121fd70b251a85b2ccdb31e8e672a42f679f7;
    stim[52] = 228'ha788a2f9cad251a83a01cf47cc80d40e60ad01d067682e594d7d93168;
    stim[53] = 228'h9434035beaf7ec0c42eab597d59c092f7ed4a8d341553ca34c2193d9a;
    stim[54] = 228'he821672b2233344945857a38f6ebe11a19a613f2491f31397e04e6af3;
    stim[55] = 228'he3c859118b93ca1774619b70df7e44e6701dc3acefa84e4bb1bb03000;
    stim[56] = 228'hd4c243d2c79a6807062649688fe759335c4ce64053ee85d99a95612c8;
    stim[57] = 228'hf7b2f1fed57c46ba7591f09c48bbc6c356230fe06fe31eb6b2849645f;
    stim[58] = 228'h86369e689531e288d372b78ec98da4df2344667108d6253867b168ee4;
    stim[59] = 228'hcbd46e06e92267b8ec9287ca4f8d2c41be60c765f3b537d07196e38ac;
    stim[60] = 228'hdb8fb4e99b6a9635b06b692698ccd2463144eaf73c6abfc2d2018e88f;
    stim[61] = 228'hdaa6a764f017399a158977c464c92642b1b5587b1389b760f8a81c807;
    stim[62] = 228'h97938af93bf02c57f3012472b3087aa6b822c2ed8b7aa010dc780bede;
    stim[63] = 228'h8db23ecb74c98b874d799589790655f5171397f3b243f87c5f2d848cf;
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
      expv[0] = 177'h071e87368000000002ff7d32785512e82f4b0b984ea45;
      expv[1] = 177'h074803008000000005f1c57e8b3eb2df9ea2eebef7638;
      expv[2] = 177'h0455079600000000027da6e4791f47fbd5d83d05e7ba8;
      expv[3] = 177'h04bc00dc8000000003d5c2852774c9f8e081b0a6f8a05;
      expv[4] = 177'h02ab841f8000000002603653b16813f7f3e02e2766a88;
      expv[5] = 177'h032680828000000003d13c5f14108e29e9c1fb1270040;
      expv[6] = 177'h062905210000000007a60c64aa0e97b2c7b809e94ecbd;
      expv[7] = 177'h010400cb00000000006dcb9d7a362ab2059060ed2c671;
      expv[8] = 177'h07d303538000000007e7ae78243773a21003791063191;
      expv[9] = 177'h02cb039f800000000063ac63dd1c912c6c916f728b124;
      expv[10] = 177'h014386400000000007a70d9fcd35e3512d012db8a28a0;
      expv[11] = 177'h0636845e8000000006519dccf8087d011351dcb854a44;
      expv[12] = 177'h07ab07b3800000000438f3033e4bc8095a01262da5c64;
      expv[13] = 177'h067c83eb8000000003126534250835f33ed01a426e1a0;
      expv[14] = 177'h058d03c78000000000293c660514c40cf55010f968fdc;
      expv[15] = 177'h078c045800000000037077a75b1d1c9fe5d0434d8ccf1;
      expv[16] = 177'h01ba877d8000000004f72e749478990aa86add96fa8d4;
      expv[17] = 177'h07b301b28000000000c85cacf643e16b26f1f98a21aec;
      expv[18] = 177'h07d4022a00000000076e7b39ae74d02123f94cc14e075;
      expv[19] = 177'h00ce048780000000040500cace540146537000d04c4d0;
      expv[20] = 177'h062d0296800000000786b2aa8f4b530e07603ca554c15;
      expv[21] = 177'h04ca01dd800000000540a4630966f1f4cb98140c13ad8;
      expv[22] = 177'h01338281000000000514a6ee1b770055dab0067519694;
      expv[23] = 177'h058904b28000000002afb144a71eb655cba3870de0bb0;
      expv[24] = 177'h032d81a68000000006aaf16a914186bd2e6b0188bbb90;
      expv[25] = 177'h077e01d200000000000742b3ad5ad7691322fdf018750;
      expv[26] = 177'h054682950000000004bd5850f752af1e9141b77fadfb4;
      expv[27] = 177'h030202f60000000004b30455ef1a68b2e931b7b678334;
      expv[28] = 177'h073085c800000000073940a838277effb02a38a2ea5c4;
      expv[29] = 177'h07bd03f9800000000626686e530fa2d926011be5a04b8;
      expv[30] = 177'h026900af8000000005c95b0aff30e8a8ba7a2cf51465c;
      expv[31] = 177'h03b104268000000000a8ec5c6431f193adab14a321bec;
      expv[32] = 177'h0057879c800000000473e8fdc5625279f5f15c3fdf3ec;
      expv[33] = 177'h003202c08000000006f9a300512130878be014c26ead9;
      expv[34] = 177'h019581100000000006f043eec1283d3f6980e90b59224;
      expv[35] = 177'h031c04d18000000000dab064a30547218910721a4f774;
      expv[36] = 177'h067f867e00000000069fa2ea471aed0a33006762082f0;
      expv[37] = 177'h077785080000000003a5bec1867482826451130f5f238;
      expv[38] = 177'h018107b00000000007fa03f7864a17636ee39dbe939bc;
      expv[39] = 177'h06c6826b0000000001a247bb91680087084199ef9a6a8;
      expv[40] = 177'h071182a780000000048a6896ee494b55d0493e4a97bb8;
      expv[41] = 177'h0466810f8000000003c16aacf84897b150c9a7d06fae4;
      expv[42] = 177'h01fe02958000000000664fcf2121997dd6797a36e56f0;
      expv[43] = 177'h0315810b0000000007ebfa6b0d6217011bc9d0f3c6d79;
      expv[44] = 177'h07cf842b0000000005dbea9ed113c6a5a6d99e05da288;
      expv[45] = 177'h066781250000000007b6cabc5d41c8b944d11c46d8b98;
      expv[46] = 177'h037b84c5800000000049da50675941b93db9a0f1937d4;
      expv[47] = 177'h06c1038e8000000000cfe302805be01b48d9ef8eaced1;
      expv[48] = 177'h02c382d18000000007055e66c509d186101a0b36c8f4c;
      expv[49] = 177'h004583f0800000000285d646d10ef0bb031b7daa35d38;
      expv[50] = 177'h0773856c800000000734600efa1370092b617068b0b28;
      expv[51] = 177'h07fe846a00000000028f4a486f090feb85905b2ccdb31;
      expv[52] = 177'h027880398000000000a2f9cad467a3e640680ad01d074;
      expv[53] = 177'h014304bd8000000004035beaf65acbeace01ed4a8d35c;
      expv[54] = 177'h068204680000000001672b22343d1c7b75f19a613f259;
      expv[55] = 177'h063c8399800000000059118b934db86fbf2101dc3ace4;
      expv[56] = 177'h054c04cd000000000243d2c79b24b447f3a9c4ce64040;
      expv[57] = 177'h077b030d0000000002f1fed57d784e245de16230fe06d;
      expv[58] = 177'h0063037c80000000069e6895345bc764c6d0344667110;
      expv[59] = 177'h04bd010680000000046e06e92443e527c691e60c765f8;
      expv[60] = 177'h05b881188000000007b4e99b6a34934c6669144eaf73c;
      expv[61] = 177'h05aa010a8000000006a764f0153be23264911b5587b19;
      expv[62] = 177'h0179029a80000000038af93bf31239598439822c2ed90;
      expv[63] = 177'h00db07d400000000023ecb74cb4ac4bc832971397f3bd;
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
