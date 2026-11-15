// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 222;
  localparam OW = 169;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09901 dut (
    .aclk(clk),
    .aresetn(in_vec[221:221]),
    .s_axi_awaddr(in_vec[220:181]),
    .s_axi_awlen(in_vec[180:173]),
    .s_axi_awsize(in_vec[172:170]),
    .s_axi_awburst(in_vec[169:168]),
    .s_axi_awlock(in_vec[167:167]),
    .s_axi_awcache(in_vec[166:163]),
    .s_axi_awprot(in_vec[162:160]),
    .s_axi_awregion(in_vec[159:156]),
    .s_axi_awqos(in_vec[155:152]),
    .s_axi_awvalid(in_vec[151:151]),
    .s_axi_wdata(in_vec[150:119]),
    .s_axi_wstrb(in_vec[118:115]),
    .s_axi_wlast(in_vec[114:114]),
    .s_axi_wvalid(in_vec[113:113]),
    .s_axi_bready(in_vec[112:112]),
    .s_axi_araddr(in_vec[111:72]),
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
    .s_axi_awready(out_vec[168:168]),
    .s_axi_wready(out_vec[167:167]),
    .s_axi_bresp(out_vec[166:165]),
    .s_axi_bvalid(out_vec[164:164]),
    .s_axi_arready(out_vec[163:163]),
    .s_axi_rdata(out_vec[162:131]),
    .s_axi_rresp(out_vec[130:129]),
    .s_axi_rlast(out_vec[128:128]),
    .s_axi_rvalid(out_vec[127:127]),
    .m_axi_awaddr(out_vec[126:87]),
    .m_axi_awprot(out_vec[86:84]),
    .m_axi_awvalid(out_vec[83:83]),
    .m_axi_wdata(out_vec[82:51]),
    .m_axi_wstrb(out_vec[50:47]),
    .m_axi_wvalid(out_vec[46:46]),
    .m_axi_bready(out_vec[45:45]),
    .m_axi_araddr(out_vec[44:5]),
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
    stim[0] = 222'h162f8ef3e98a70e1bfe2143f8395970fbd241cda62adb4f2c79cfb4f;
    stim[1] = 222'h095ad3a88b1df06d2da0961c3a7ccc3897a97d221a63139a5d40fc04;
    stim[2] = 222'h29ab532a9aeae2de2e3796b726b677e40733159e574dbdb2ed6591a1;
    stim[3] = 222'h3cdfcb434a144a526f2b262f823f142e2b60131e208abf8d7d1a81a0;
    stim[4] = 222'h273ca06bc96ee368c0726abafddb8821e3bb45170c830bdec6b6c49f;
    stim[5] = 222'h2b907d098291057ca5814ba81c6661aba47b0b3a37024a2e1343e334;
    stim[6] = 222'h072f192fa8e1684f07e5ade5d5353e1aea61fc25a65cbe1b115cdce4;
    stim[7] = 222'h242362c0fc4a47411d7ba8880e46ab9ce66a9bf511c0ae4ee2413b42;
    stim[8] = 222'h2d9d2ba48c85dff0911480228ca3b2cb39930a306f7403557663472a;
    stim[9] = 222'h3e846f96377eace90f1a93ac6d18c508926c72509ea407be6c21e163;
    stim[10] = 222'h3488aae9b96f86ce99a57f2cf97b83b9350008b3f42a0bca2565ffc1;
    stim[11] = 222'h3a046a7de506287a6927841a72e72a5031592366d14a2556bfb4d6f4;
    stim[12] = 222'h22c7cc2aa712e683ad1782c06bcacb846f8b5226ca2e9373c4aa3263;
    stim[13] = 222'h2d7fad8bc2e5080d205ac76085c789a12730ab43b45cb33213aac034;
    stim[14] = 222'h2bfdbd8958c77d03ac8c7db222754bb5caeabb138cf767048a814aba;
    stim[15] = 222'h33996eebc6fa7769d8e657b9331eee803cce979451518f68a25d31c1;
    stim[16] = 222'h33960b222b92118f54f7dfd7d24912f9048821909d179f0bed2ebdc5;
    stim[17] = 222'h3a71541336905c878571bf21d084c5794cb0468713be1582f247fa85;
    stim[18] = 222'h3c6a85a0f97b6b2e10f7b12dd59b087c22049faa8009f5f486fe93cb;
    stim[19] = 222'h28abf96b9d36b3ffef3c6f839a2fa29a3f31a3acd48f4e7601c5c8e8;
    stim[20] = 222'h32a248ac1449a50df0e015459ede013fc1e75a09dd82418be87abe26;
    stim[21] = 222'h319368e95a9c699ed1bb6544b3c5b512c9d2cd70fcc1783d9837c19b;
    stim[22] = 222'h3db8f13b6a2bf53f79fc7cd7fcb2e8e6282f57a7fe7099c5cb007c79;
    stim[23] = 222'h3db0757fb3cc8f9a2e488b47be1c647c64850e4b2ec4cf714577c463;
    stim[24] = 222'h2ef8e8b8cd85c1c26c625e62b19e5fe9e6734cb08bb7aefb077395a2;
    stim[25] = 222'h2250bfd275302eeac3bf79acf1dd12d8e52ae04f7122b4841319a82c;
    stim[26] = 222'h3de4cd7cacd1c4885ff7bd23dc3e43717c5bf42c3de523b35d434ae6;
    stim[27] = 222'h2da15b69fe87b2e3cb212509d89a489d0548f3080f59cb709204c81f;
    stim[28] = 222'h3bac12d8bbbea816f0bfc49870c305e6d00f5bc35ac99fcf8631903d;
    stim[29] = 222'h23704ed594eded8d93e12fe894c654b484f654ab7f6683bfa3667a1b;
    stim[30] = 222'h3f4726e93e192534160d7b7d3c9bb75b42f0212e1d634fa99b7469f2;
    stim[31] = 222'h379b6e4728be60283e0dfb9fbef137965d3b7a96d607fe9071972aef;
    stim[32] = 222'h350483fe8ca364d87cd3ebb694f5b9d69652921b88e8c55bd2bdfb09;
    stim[33] = 222'h380aecd7abd3dd4c7b80eb87f47a7d4953ea1ad3a43809bd18690bdc;
    stim[34] = 222'h37e484f0f40702399a4126226194e12d31bb34a856305cae25126ba0;
    stim[35] = 222'h2d492e9306a809d719ffd4ebdc3c90c042587ffcc9101cb8350c3dcd;
    stim[36] = 222'h33db7045be3cfec93705cf87c73c219a3a344fada8715ede51023b58;
    stim[37] = 222'h2cfbe0bc405b46ac058c6e426ea4e19e01829491353bf9937d3375c9;
    stim[38] = 222'h3a606fad1de962d382ef9d95151bde3d5dcbb8497cef62edc4b40be0;
    stim[39] = 222'h3d3dd928161e272b7461906a5c5fc7dec2ad9aa08f6d8e538e70f66f;
    stim[40] = 222'h37cfa0fb363531020c852e6e8198274c0807e3b379b6f9ab3796cbe8;
    stim[41] = 222'h223b481b18b1d38acbce1738e411b1ccf8f8dd2261f5cba70e01ff1e;
    stim[42] = 222'h28c294e2bf668f3a77f5392244c4b201b3d5f2fb9b4fbed4e335f579;
    stim[43] = 222'h3a11eae0c8fa5018b3c37e98bdb0df2956711f0bcc00b9b78cd6dca5;
    stim[44] = 222'h3ec7ba97c42239c856d487de5ffe16863d27ae4712faf53003cb75a4;
    stim[45] = 222'h3ce3733b65b62684a467905d0f38cf44e5b8ed458c58da189f5212ff;
    stim[46] = 222'h319ef82349871fa667ba82b9ae15a69ea6a3966872735657ecc41e12;
    stim[47] = 222'h3d5162124b4eb49a3ecc1053bd60c3b02311d2d5dafe839ed0651658;
    stim[48] = 222'h2dfb920befec5db8ce3865a12a11dcc049d2533be4db8d756d6adca7;
    stim[49] = 222'h263b9825de0df5b73925fb14ffa346b2acc3dea57ceb7fc2bb471288;
    stim[50] = 222'h2251ed459c9b405ef23c27847158e58345ed2195edb03f0444ba8824;
    stim[51] = 222'h379aaeb3674e4183a2ccea4951dc57c18ac63b9fbdf325214fd27e4c;
    stim[52] = 222'h2c0d5c9ad5e898e8dacbbdc8973b22eb37ea0646855948c814f8cfdb;
    stim[53] = 222'h26ec5c0a38ed292fd3cfa10bfe3f86e26e595d882c43e7ecde5b3e4e;
    stim[54] = 222'h284c618993ea1b839d8c40c0eca69367e08fac74602370bd2372b95e;
    stim[55] = 222'h3480f5e12d5beb60381edca4626076ea12259d3eda59a669e9c2eb22;
    stim[56] = 222'h200d09763242ac2b00307954d366b157d5edace5c124ae9a572ed52b;
    stim[57] = 222'h385b3f0b2dbe03e89c3a5b442a296fc8127398aaf8cd110a5663473d;
    stim[58] = 222'h382f39e83e219ade00faf5d4e469bca78b76be3ad8a65c5d7463f7fd;
    stim[59] = 222'h3b114f252e298f6f19512c0bc316bc583154b1ad4f386de0bc6876ef;
    stim[60] = 222'h2efbe70c9158c8842abe6f672e32aa0e44a45fdfbfe628850d8441cc;
    stim[61] = 222'h3b5899e6e0100d136c3e81f95aa222d147dbbea26d50167881c34693;
    stim[62] = 222'h2a0bda861d2db1023d802a1ceebd204bbf4c3fd156accc42607e3522;
    stim[63] = 222'h28ebcb929e6d9fbfc42911cc68d4fb258d732fb3becafa3e71bccf6a;
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
      expv[0] = 169'h0f2c79cfb4fd8be3bcfa61e2143f83932e1f7a48396;
      expv[1] = 169'h19a5d40fc04256b4ea22c5a0961c3a7998712f52fb1;
      expv[2] = 169'h1b2ed6591a1a6ad4caa6be3796b726b4efc80e662a6;
      expv[3] = 169'h18d7d1a81a0737f2d0d2822b262f823e285c56c0267;
      expv[4] = 169'h1dec6b6c49f9cf281af258726abafddf1043c7768a1;
      expv[5] = 169'h02e1343e3342e41f4260a4814ba81c64c35748f6161;
      expv[6] = 169'h01b115cdce41cbc64bea3fe5ade5d5327c35d4c3f8f;
      expv[7] = 169'h04ee2413b42108d8b03f117ba8880e455739ccd5363;
      expv[8] = 169'h1557663472a3674ae923201480228ca765967326159;
      expv[9] = 169'h1be6c21e163fa11be58dd91a93ac6d198a1124d8e53;
      expv[10] = 169'h1ca2565ffc1d222aba6e5ea57f2cf97f07726a00115;
      expv[11] = 169'h156bfb4d6f46811a9f794227841a72e654a062b2466;
      expv[12] = 169'h173c4aa32638b1f30aa9c31782c06bcd9708df16a55;
      expv[13] = 169'h13213aac03435feb62f0bd5ac76085c713424e6156d;
      expv[14] = 169'h1048a814aba2ff6f6256338c7db22272976b95d577b;
      expv[15] = 169'h168a25d31c1ce65bbaf1b9e657b9331ddd00799d2eb;
      expv[16] = 169'h10bed2ebdc5ce582c88ae7f7dfd7d24a25f2091042b;
      expv[17] = 169'h182f247fa85e9c5504cda771bf21d0818af299608de;
      expv[18] = 169'h1f486fe93cbf1aa1683e5ef7b12dd59e10f844093e6;
      expv[19] = 169'h07601c5c8e822afe5ae74f3c6f839a2f45347e63467;
      expv[20] = 169'h18be87abe264a8922b0515e015459edc027f83ceb40;
      expv[21] = 169'h03d9837c19bc64da3a56a6bb6544b3c36a2593a59a0;
      expv[22] = 169'h1c5cb007c79f6e3c4eda8ffc7cd7fcb5d1cc505eaf8;
      expv[23] = 169'h1714577c463f6c1d5fecf2488b47be18c8f8c90a1c3;
      expv[24] = 169'h0fb077395a23be3a2e3362625e62b19cbfd3cce699b;
      expv[25] = 169'h0841319a82c0942ff49d4abf79acf1da25b1ca55c12;
      expv[26] = 169'h1b35d434ae6779335f2b30f7bd23dc3c86e2f8b7e91;
      expv[27] = 169'h1709204c81fb6856da7fa3212509d89c913a0a91e6d;
      expv[28] = 169'h1cf8631903deeb04b62eeebfc49870c60bcda01eb67;
      expv[29] = 169'h1bfa3667a1b8dc13b5653de12fe894c4a96909eca91;
      expv[30] = 169'h1a99b7469f27d1c9ba4f840d7b7d3c9f6eb685e0433;
      expv[31] = 169'h09071972aefde6db91ca280dfb9fbef26f2cba76f43;
      expv[32] = 169'h15bd2bdfb09d4120ffa328d3ebb694f373ad2ca5256;
      expv[33] = 169'h1bd18690bdc602bb35eaf480eb87f47cfa92a7d435c;
      expv[34] = 169'h0ae25126ba05f9213c3d014126226191c25a637669a;
      expv[35] = 169'h0b8350c3dcdb524ba4c1afffd4ebdc39218084b0fea;
      expv[36] = 169'h0de51023b584f6dc116f8905cf87c738433474689fb;
      expv[37] = 169'h1937d3375c9b3ef82f10148c6e426ea1c33c030529c;
      expv[38] = 169'h0edc4b40be06981beb477bef9d95151fbc7abb97715;
      expv[39] = 169'h0538e70f66ff4f764a058361906a5c5f8fbd855b357;
      expv[40] = 169'h1ab3796cbe85f3e83ecd8a852e6e81984e98100fc78;
      expv[41] = 169'h1a70e01ff1e08ed206c62ace1738e4136399f1f1bb9;
      expv[42] = 169'h0d4e335f579a30a538afdaf5392244c1640367abe47;
      expv[43] = 169'h1b78cd6dca5e847ab83238c37e98bdb1be52ace23e0;
      expv[44] = 169'h13003cb75a47b1eea5f108d487de5ffc2d0c7a4f5de;
      expv[45] = 169'h0189f5212fff38dcced96c67905d0f399e89cb71dad;
      expv[46] = 169'h057ecc41e12467be08d266ba82b9ae134d3d4d472db;
      expv[47] = 169'h19ed0651658754588492d2cc1053bd6187604623a5d;
      expv[48] = 169'h1756d6adca7b7ee482fbf83865a12a13b98093a4a6e;
      expv[49] = 169'h1c2bb47128818ee609778725fb14ffa68d655987bd7;
      expv[50] = 169'h10444ba88240947b5167263c27847159cb068bda43b;
      expv[51] = 169'h1214fd27e4c5e6abacd9d3ccea4951d8af83158c77a;
      expv[52] = 169'h0c814f8cfdbb035726b578cbbdc8973e45d66fd40cc;
      expv[53] = 169'h1ecde5b3e4e1bb17028e3fcfa10bfe3f0dc4dcb2ba3;
      expv[54] = 169'h0bd2372b95e213186264fb8c40c0eca526cfc11f590;
      expv[55] = 169'h069e9c2eb225203d784b501edca46260edd4244b3af;
      expv[56] = 169'h09a572ed52b803425d8c93307954d36562afabdb593;
      expv[57] = 169'h10a5663473de16cfc2cb683a5b442a2adf9024e7304;
      expv[58] = 169'h05d7463f7fde0bce7a0f8efaf5d4e46b794f16ed7d2;
      expv[59] = 169'h1e0bc6876efec453c94b8f512c0bc31578b062a963e;
      expv[60] = 169'h0850d8441cc3bef9c32454be6f672e35541c8948bf0;
      expv[61] = 169'h07881c34693ed62679b8033e81f95aa445a28fb77cb;
      expv[62] = 169'h042607e3522282f6a1874a802a1ceeba40977e987f6;
      expv[63] = 169'h03e71bccf6a23af2e4a79f2911cc68d1f64b1ae65e5;
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
