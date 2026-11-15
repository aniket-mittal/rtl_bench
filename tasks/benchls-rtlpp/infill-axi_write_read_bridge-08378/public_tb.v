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
    stim[0] = 228'h3f4d2b4dc7346d386ae20d856b19c4322a5ef68c48e55b71a48e43533;
    stim[1] = 228'h636bbde4139faa4420b22547e274769d8c1fa5fd25073975fccba7abc;
    stim[2] = 228'hbf0db4bae7e3d8b96f17e936619364a4ff71e9ef03b08af586832d3a9;
    stim[3] = 228'hd3b28f7afa60fdf42048a3ba02c6fc846373ed38adb438d74b5abc0dc;
    stim[4] = 228'h971b5a7571c094519c270d1722ca639d6a4795432ef396001db557caa;
    stim[5] = 228'hac18657a6d82ace6a10869fdfe39fef9ffabb3f53e8c032a4e920c489;
    stim[6] = 228'h86144506011cdd6c231cb784697a2f9846cbd0e375be4bfd50cad09c5;
    stim[7] = 228'hc70d323f65732af8a82d931d62f618a8b95180032226b3c9b0da81802;
    stim[8] = 228'ha0c338b1f147f18cef777b32c1022a4b97a2ee222ff4a0d57a0746da1;
    stim[9] = 228'hd5ed8fb6d28962e196f132a3cd10cc48b6c926c29f8909fbcdd98cffb;
    stim[10] = 228'h9d25b79557d6b31fec8caa41ed6c806e5abc36881df595ab89080fb92;
    stim[11] = 228'hcc4e0e37eea6076b98bc0f26185067d04ae8379ba12893fb874f93bee;
    stim[12] = 228'hfaaef630f29ec4e17d649e3f6d357da859a95605b2f08860383e0996f;
    stim[13] = 228'h9c910838b2af71e61192219a7726c2e8fd9a267309e48ba80db2f5375;
    stim[14] = 228'h85befc01a456babfb31a95966538e903ae8994bd35dee7af4ff8054d9;
    stim[15] = 228'hd830cfd99fedf59a2477fa026dd2d32d1de174558dede9e232dc37fef;
    stim[16] = 228'hf984dc0abcb6e28c5d38018e71ff91c420e0c9cfd4b7720fa33a0b12b;
    stim[17] = 228'hc39fe629e4fa08c6229c7244a2702bce03acdeb3f21abe18305def69f;
    stim[18] = 228'hdbb2f6446f00fcbddef9b49737ce367f5a5fb410ee40d27ac8eb1051f;
    stim[19] = 228'he18d8fdb3f289883810db0beb19f42e875a5e946d9c8903cd37ebf240;
    stim[20] = 228'hb75171eb323e16e03577b09f85aaf27bdfe3397f0698b9c8317974a09;
    stim[21] = 228'h8a39b6773bcc33934e1f27060ca8238c87c75d6b5f7e409eda297ab0d;
    stim[22] = 228'hdc3cdf37621470bcf1f039038230eb561355cb7f09d698b2e52978b70;
    stim[23] = 228'hff432abd5fa4566cedf0e063ce596471e61b5f071723bc0ac526f9b1f;
    stim[24] = 228'hdb098339035dd9dc21d7f137b1825542ffed7be1412201b1da474ef18;
    stim[25] = 228'h8160290ccecb6333dcd6fdc7a3fd9bf2551cb39775a4caf2d8be04630;
    stim[26] = 228'hcccb3a349ec6a22da9a26d2859e1cc8950366a62cb737e00730ce3842;
    stim[27] = 228'hb6bc347c70801a44999e39db4d23c7b46b0ccd0a66a85f7db51005eb7;
    stim[28] = 228'h91b108ea584bc4ce7103164de1b97a625a5f4ce3dfc7764e1858d423a;
    stim[29] = 228'h8604a6daf6989ef13c517ed8367711b5609cdde808f4333989e97dd40;
    stim[30] = 228'headc00a30e0408b9d8da96929402f40782a4c21474241fa691d6f55c3;
    stim[31] = 228'hc902a8fa8e18a2ce552ff162a07d652a250e6b6340ff1d52214c0718a;
    stim[32] = 228'hbe92f590b748eeefe34b47bf6097744a3470bbaba85effe2bef18527e;
    stim[33] = 228'hf087a19bb8954ef6e170d32bb31f97cf0131910aafe7b17e1c094a813;
    stim[34] = 228'h8c66ae0f5667714c511c9d1edef3ef0c1a64f17e46e63df679fd1945d;
    stim[35] = 228'hcd9a18bd3b207428f2e878f5bec41940f78a9dad8fb99bb191595ee5d;
    stim[36] = 228'hacdbc2a2227b67409ec3688bc9c23e789b04928d612b37081abc6ec12;
    stim[37] = 228'hb434bec14ca9d1081b702b25f78ae08bea2a965dc6d227610e0487aeb;
    stim[38] = 228'h8df10fd456015de3975f03ada6ae0a4d5f4bf37f5caec594217a59c18;
    stim[39] = 228'h8e6ac7bb7c23c02caa8304a6cd4901a9dfa7e2907234134555798c84f;
    stim[40] = 228'ha01d913aa446f027dbed6eb9de0df75810942f423e5732be444d8c7c7;
    stim[41] = 228'h96277d8d6ae7476a6c50445ce07ecc4599f8d0ff74f0907b91d9f7efb;
    stim[42] = 228'hdc2428bbca89998f8f52977e6f9aac927c5c721d28e7c5a2c6883e945;
    stim[43] = 228'hf1005d79d0b1a947054cff3d707989424e40b56754e4df7a0ad454293;
    stim[44] = 228'hf842c7a94edbf88bfef5cfff61896eccdd21ae4edbcde7f2b38c6f865;
    stim[45] = 228'hcbd8e030a65a732a91da7803117c7599673dfa83f551fe0481693779e;
    stim[46] = 228'hab76319aec8a6b358344de889315aee73539ce21e298f3559ba0d9f0a;
    stim[47] = 228'hb6be4b9a61b2f5229dd6e14a87e3d0e2e598ebb3be02ed83cf7bc0734;
    stim[48] = 228'hb979ca745c360f6e9ea842a16993935e5e4f8aa58aec9e01b879e3f07;
    stim[49] = 228'hfd46bb1cae954b356b1a0854b6e0a16b1020bdcf76b23f7c3453d8ada;
    stim[50] = 228'h880bae74dc21b271fd7fb57fe5941224ad4d3ec11d82ea8225a59630f;
    stim[51] = 228'h9ba3e7a53c112219a6e4ee2bc0ef5ebdbb62a73e04cd95a45a407fc37;
    stim[52] = 228'h9438abe2bdb0db0d1ffd6582275b6c987950e3a3c55cc25169c347927;
    stim[53] = 228'hde39e22c9be93162cd40468dfacd83d4d105d7a28d71bbf7ffb159e42;
    stim[54] = 228'h9f1cb1e4fece54bab6187f7060a798235bebd37b0559fb1f0137d07b9;
    stim[55] = 228'hcf4aee92e22d562cbd5e37bf67dad9f507d27ea22a6ec9620ba97d485;
    stim[56] = 228'hc83eb47ed49946b8c6ce757bfc17f0fc7df5d74e45d91e0ab681d75cc;
    stim[57] = 228'hd4e2346b518c95764a5625cee0b390242a483cd9e5ad4c247e887d9a2;
    stim[58] = 228'hb5b54bfa05332d9b33540fc4817282f451ac945b628212fba7a18cfe8;
    stim[59] = 228'hbcb63bbbe56803c496b0f7b8e29e11920013b306cac84ee6418764242;
    stim[60] = 228'h844d7a984ff783db975bfb784d4d828fbd2061449cf991ee2a5b86163;
    stim[61] = 228'hf0e69611d7022adb9d96833c8f840c725f1ff83cb3c4145da80b61ec2;
    stim[62] = 228'hc175e3834e24a6fff23fae124ef431beb3c9330a511228cfb2bac9976;
    stim[63] = 228'h5f8faeb2c6f625613c9d49703785dfa1073e95e8ef6f31ddab00e11f6;
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
      expv[3] = 177'h0bf0da9386832d3a8db4bae7e4749b30c9b5f71e9ef07;
      expv[4] = 177'h053b7211cb5abc0dc28f7afa6251dd01637c373ed38be;
      expv[5] = 177'h117186759db557caa35a7571c0868b916532a47954328;
      expv[6] = 177'h0ac1a3e7ce920c4888657a6d8334feff1cfffabb3f521;
      expv[7] = 177'h00615e6150cad09c4c4506011e5bc234bd166cbd0e367;
      expv[8] = 177'h047092a2b0da818025323f6574498eb17b0995180033a;
      expv[9] = 177'h020c592e7a0746da0b38b1f1463d996081137a2ee2232;
      expv[10] = 177'h1d5eb122cdd98cffad8fb6d2889951e688656c926c287;
      expv[11] = 177'h01d231b909080fb925b79557d75520f6b641abc368809;
      expv[12] = 177'h1cc4bf41074f93bef60e37eea587930c2836ae8379bab;
      expv[13] = 177'h07aa86a1383e0996eef630f298cf1fb69abd9a95605a7;
      expv[14] = 177'h11c903a38db2f537490838b2ab90cd3b9363d9a267305;
      expv[15] = 177'h005bf40ecff8054d8efc01a457cacb329c70e8994bd31;
      expv[16] = 177'h05832cb432dc37fee8cfd99fed7d0136e96bde1745597;
      expv[17] = 177'h17987710a33a0b12acdc0abcb680c738ffc80e0c9cfd8;
      expv[18] = 177'h04398738305def69efe629e4fb39225138123acdeb3fc;
      expv[19] = 177'h1dbb29fd48eb1051eaf6446f06da4b9be71fa5fb410eb;
      expv[20] = 177'h0618c3a1d37ebf24058fdb3f29585f58cfa35a5e946c9;
      expv[21] = 177'h137509ef317974a08971eb3238d84fc2d57bfe3397f1e;
      expv[22] = 177'h00a3e6325a297ab0c9b6773bc913830654127c75d6b40;
      expv[23] = 177'h15c3a558652978b704df3762169c81c11873355cb7f0d;
      expv[24] = 177'h0ff421c7c526f9b1eb2abd5fa67031e72cb461b5f071c;
      expv[25] = 177'h05b0950bda474ef1918339035e789bd8c12dfed7be141;
      expv[26] = 177'h10162fc958be046300290ccec9fee3d1fecb51cb39767;
      expv[27] = 177'h0ccc8225730ce384233a349ec636942cf0e50366a62dc;
      expv[28] = 177'h136bded1b51005eb6c347c70829ceda691e6b0ccd0a6f;
      expv[29] = 177'h011b61891858d423a108ea584f8b26f0dcbba5f4ce3da;
      expv[30] = 177'h106016d589e97dd404a6daf698bf6c1b3b8809cdde819;
      expv[31] = 177'h0eade01e11d6f55c2c00a30e04cb494a017c2a4c2146d;
      expv[32] = 177'h14902ca8a14c0718b2a8fa8e1ff8b1503eb450e6b634e;
      expv[33] = 177'h0be92128bef18527e2f590b74f23dfb04bbd470bbabbf;
      expv[34] = 177'h07086f3c1c094a812fa19bb8936995d98fce131910abb;
      expv[35] = 177'h18c6643079fd1945ceae0f5666ce8f6f79f7a64f17e5f;
      expv[36] = 177'h04d9950391595ee5ca18bd3b24bc7adf620978a9dad8d;
      expv[37] = 177'h1acd81e21abc6ec133c2a22278b445e4e11fb04928d78;
      expv[38] = 177'h03431a2f8e0487aeacbec14cac9592fbc570a2a965dd3;
      expv[39] = 177'h10df4135217a59c1810fd4560181d6d35703f4bf37f40;
      expv[40] = 177'h00e6dea755798c84eac7bb7c26025366a481fa7e2906a;
      expv[41] = 177'h1a01e560444d8c7c6d913aa443b75cef06ff0942f4239;
      expv[42] = 177'h0162391611d9f7efaf7d8d6ae5222e703f659f8d0ff6b;
      expv[43] = 177'h0dc22249c6883e944c28bbca8f4bbf37cd55c5c721d21;
      expv[44] = 177'h07102d090ad45429285d79d0b37f9eb83cc0e40b5674f;
      expv[45] = 177'h1f842333338c6f864ac7a94edde7ffb0c4b7d21ae4ed3;
      expv[46] = 177'h04bdc66581693779e0e030a65dbc0188be3c73dfa83fc;
      expv[47] = 177'h0ab75b9c9ba0d9f0a6319aec8a6f44498ad7539ce21fa;
      expv[48] = 177'h136bb38bcf7bc073464b9a61b1f0a543f1e8598ebb3b4;
      expv[49] = 177'h039795793879e3f069ca745c37a150b4c9cbe4f8aa58c;
      expv[50] = 177'h07d44dac3453d8ada6bb1cae92042a5b7051020bdcf7f;
      expv[51] = 177'h1080a092a5a59630ebae74dc20dabff2ca0ad4d3ec114;
      expv[52] = 177'h09ba42f6da407fc36be7a53c147715e077afb62a73e09;
      expv[53] = 177'h11439a61e9c3479268abe2bdb6b2c113adb5950e3a3c2;
      expv[54] = 177'h05e3f7537fb159e421e22c9be92346fd66c3105d7a29f;
      expv[55] = 177'h11f1f08d0137d07b8cb1e4fecdbfb83053c9bebd37b1c;
      expv[56] = 177'h04f4afd40ba97d484aee92e22e9bdfb3ed687d27ea227;
      expv[57] = 177'h0483a3f1b681d75cc6b47ed49c3abdfe0bf9df5d74e4c;
      expv[58] = 177'h054e4090fe887d9a22346b518b12e77059c8a483cd9e5;
      expv[59] = 177'h135b3bd127a18cfe854bfa053587e240b9431ac945b6b;
      expv[60] = 177'h03cb664841876424263bbbe56afbdc714f08013b306c7;
      expv[61] = 177'h1044ea3eaa5b86162d7a984ff5fdbc26a6c3d2061448b;
      expv[62] = 177'h0f0e51c9280b61ec269611d705c19e47c205f1ff83caa;
      expv[63] = 177'h14177efab2bac99765e3834e27d709277a193c9330a56;
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
