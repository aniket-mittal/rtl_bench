// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 235;
  localparam OW = 374;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03389 dut (
    .aclk(clk),
    .aresetn(in_vec[234:234]),
    .s_axi_awaddr(in_vec[233:202]),
    .s_axi_awprot(in_vec[201:199]),
    .s_axi_awvalid(in_vec[198:198]),
    .s_axi_wdata(in_vec[197:166]),
    .s_axi_wstrb(in_vec[165:162]),
    .s_axi_wvalid(in_vec[161:161]),
    .s_axi_bready(in_vec[160:160]),
    .s_axi_araddr(in_vec[159:128]),
    .s_axi_arprot(in_vec[127:125]),
    .s_axi_arvalid(in_vec[124:124]),
    .s_axi_rready(in_vec[123:123]),
    .m_axi_awready(in_vec[122:120]),
    .m_axi_wready(in_vec[119:117]),
    .m_axi_bresp(in_vec[116:111]),
    .m_axi_bvalid(in_vec[110:108]),
    .m_axi_arready(in_vec[107:105]),
    .m_axi_rdata(in_vec[104:9]),
    .m_axi_rresp(in_vec[8:3]),
    .m_axi_rvalid(in_vec[2:0]),
    .s_axi_awready(out_vec[373:373]),
    .s_axi_wready(out_vec[372:372]),
    .s_axi_bresp(out_vec[371:370]),
    .s_axi_bvalid(out_vec[369:369]),
    .s_axi_arready(out_vec[368:368]),
    .s_axi_rdata(out_vec[367:336]),
    .s_axi_rresp(out_vec[335:334]),
    .s_axi_rvalid(out_vec[333:333]),
    .m_axi_awaddr(out_vec[332:237]),
    .m_axi_awprot(out_vec[236:228]),
    .m_axi_awvalid(out_vec[227:225]),
    .m_axi_wdata(out_vec[224:129]),
    .m_axi_wstrb(out_vec[128:117]),
    .m_axi_wvalid(out_vec[116:114]),
    .m_axi_bready(out_vec[113:111]),
    .m_axi_araddr(out_vec[110:15]),
    .m_axi_arprot(out_vec[14:6]),
    .m_axi_arvalid(out_vec[5:3]),
    .m_axi_rready(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 235'h1f0bb0fb4f7fbf5f8a02def89c48e7ddcf9b94fcabbd8b2015d1f760c35;
    stim[1] = 235'h2fe37533dadba2d1f5cde4d0ad56947441bb07f6466500565be89058eda;
    stim[2] = 235'h5a01596fc2f1f78415f24790b289351c86a84126cb9c87beeac71f71c37;
    stim[3] = 235'h597a4a933d133389182bb000eaf6cb5f53a6317b8b85224264ba44a7c87;
    stim[4] = 235'h5a5f2dd237eb5b662c7656d4dcffb1e6c1ef08a772a6517c8989d3159f5;
    stim[5] = 235'h400ba28379a628413cc93372ab0dcd9f7207bc39c27742a8d839e3ed63e;
    stim[6] = 235'h46d07f55f089759f6ccc1d67f0cf262beba604aced2ea67558ac602c7b6;
    stim[7] = 235'h613330f14cc9062f399f7466453a2a11696c08c18f3ee2727c1c94d3475;
    stim[8] = 235'h5bf7d56079b3199f174a62fb752ee07113d68b18af8b0907e73962a27bc;
    stim[9] = 235'h4e78802b9e3dfe3764a108f385a9523795b17c19bdf3afe23c6a65305e0;
    stim[10] = 235'h5d086efa9926ef6427705f68843b36252e2707fd75be80271d9078d40e0;
    stim[11] = 235'h60dbe18b1f45c1df4f353f1890a71a91d9b3ca36bb325c4f0e33acdcf21;
    stim[12] = 235'h5dfe42208f393b29b8032b3274e2849e710da5c3c71a4f3255d19a07b1f;
    stim[13] = 235'h78a6c7ce461b8a0e0a7c87335a40165fa3717779a191e6e5f8b47485a34;
    stim[14] = 235'h589d7bbe7d91f520420e0b5e8b4a028debbf20195ea9510e16d2d2949e5;
    stim[15] = 235'h7a52e7b30198d516294aa82a154c5fa4879ec2be68b09b32a46953c351d;
    stim[16] = 235'h49a13aab8c8c815a69b8cadeb5a47ea91ecb27d0209ab01baa4493aae78;
    stim[17] = 235'h436d3afcdb713fa3e74c586f473f1f9f98325cbc740d2859ab1dc5e0c79;
    stim[18] = 235'h729f825b3aab8128a12a2f738ec43d1143036773c2f8e7221c71dd1dc0d;
    stim[19] = 235'h6fa057e11becddcc70958e0186567dbe0ff5128d82bf02375dc5cd4781b;
    stim[20] = 235'h7033c31607b4b9a444a0ae59b031e24fe2805476adb7306e4c346ca619c;
    stim[21] = 235'h483ba2a0b51db710df0fc5e303549a0359e5dba3489fa478a2320b05d45;
    stim[22] = 235'h46616a641842150d0db67bb01eb7336a524ab3ec6b19f19c43e163d662b;
    stim[23] = 235'h43bea8d5d941356047d78ecf1e8f40cbcf541f2a209c1c084133193ffd7;
    stim[24] = 235'h7f3fca58d9ec57c66135f08dd6cd8157b33ea9a2d047e84d7f656af139b;
    stim[25] = 235'h7474821658cccfaced60b72eb13e8a24858cc6b1582b3b339c9fc928a8d;
    stim[26] = 235'h4fbda279ea7c7651af472ea7cca5ada0bf3f6e0c522b5357c8e412a56b1;
    stim[27] = 235'h6c6db614d4a5a36e51e5b9211c58088f2e1b58cde86b66d2b2b80332c42;
    stim[28] = 235'h6b669445ea16082541806aa11e6cc2ef889842e13bad241c6a7b41713da;
    stim[29] = 235'h75294705ebc0c5e8137fae7eab6f10a8535077f4e5fede1eb4fdc819f55;
    stim[30] = 235'h652724afbc7ebf821aec1b8745bfd08bdfd0410a350ad1b031c9dacd7f5;
    stim[31] = 235'h41e7bb4a6595cda2e2b51a37ca91028eab73f0dcaa63f3026cad8a9f0fb;
    stim[32] = 235'h74ac26fcf10e2affff5c7f6ba8fe9c016d3c0f915e9862ccea4e126939f;
    stim[33] = 235'h5055a38431522d55a6165f0250c94ba72cb59727a249271ab74b8c53cf3;
    stim[34] = 235'h66678c1788c09ac48934ff98d8490d46b0669a2b55a0a5d915972dc2793;
    stim[35] = 235'h6bd6af7f14c7af31e5ad34419bcdc5f101d823b73b4f798ca64e8f80f5d;
    stim[36] = 235'h72604f889a98b7e33f11989ac1ed268875bdb98a818c356a07e3c67ad69;
    stim[37] = 235'h50e2993966254bef1aef0dd862d3cb06be21d6c59964993e61b9eeff5a9;
    stim[38] = 235'h5b7419a53f4be1ea762f777f055612ca5605d2c2ac2548c9fbba8beda84;
    stim[39] = 235'h6ca349c63576265e5202a610b4d6502bfae0a651f54bdecc6fbebfcf8a3;
    stim[40] = 235'h6bc0a87bd4387b4a9ec133f3c110c83dfa82e19194a82718fce0f5cd619;
    stim[41] = 235'h693761950e0c9bb9b6bc8c10a6d87427ae06559df086c1dc6dac589674e;
    stim[42] = 235'h48bb97858f04b6c3261c8c24f65a44a69396bdfcadebcb16c83fe3b6f3d;
    stim[43] = 235'h44473f3ab6efa8d4d605fe74c139c5cb70b6bbd5ccbc9c071135508fa7c;
    stim[44] = 235'h7f3cb5d583db47c2b785bd67d557e49aadb741184b57cd6e94a09270311;
    stim[45] = 235'h62a896575efeb684618e7e0c83e0fcd687e7fc99f52712a8a61422571e7;
    stim[46] = 235'h6aa2a846e378e7e5e6f9f1e955711148779aae4b44ad0410efbc8b28b52;
    stim[47] = 235'h56c7d58eeb6f3c1fd4225e31141755d7e746bc5bad66004ec16eec6d51d;
    stim[48] = 235'h4a2a6268c54d03b3766a85eb6a2a4838dfd1a2dcf6048dfe776d5e9304f;
    stim[49] = 235'h5666aaa5f044a3f247a3f0d6faade424f3b4ecd6a7c6abde205ccf43343;
    stim[50] = 235'h45cfd4f414188bcfcbae05f3ac34cb741fa11f47c4bb0fe034cfef84c85;
    stim[51] = 235'h7dae6b31afa9987a195c2dc954504100c0222d6ee40d4147aef04327c17;
    stim[52] = 235'h5d72b1dcebe0e1bc56b76c510785834d1055b4074a47666882d8be19e3a;
    stim[53] = 235'h7a5324b108a13825a8ce2caf749918add73554e90efeefe5a874857e030;
    stim[54] = 235'h7a9c7c58f5920f5cbcb90b54fba68b8b7bb4e239d60dc6143d95fae59de;
    stim[55] = 235'h54cf733896997191dbc603dd27940761329ecfc8739e781f392c6e905f4;
    stim[56] = 235'h64419e742c4477e7b97cab026804f61d10069bfccafd4cd079bb330f9af;
    stim[57] = 235'h7a94d91490e0753099e2a3352555c99526ac839a06c6a34792ec4d7f51d;
    stim[58] = 235'h6e3cd81a562d74b75169ff93396b42e4a5a7d2ff1179559c99598f5d419;
    stim[59] = 235'h6f283b1aea0980941f7fa7a0cadc7bc5b35567f8905252021c10a6f383f;
    stim[60] = 235'h48f907c70c832d18ab4526053e26d34e2e4b5129c9a09a410d16c205122;
    stim[61] = 235'h6243a750d4c33628164c9283c656f2b45a5c5010de985ad2b12e0d18088;
    stim[62] = 235'h68cab3a3155ce4a296afb7c75b92bdb0409e9df632595e632c0e171d21a;
    stim[63] = 235'h7c38194192f1aa6b8b6c398b7147a6463031d59fc6952a87109c624839e;
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
      expv[0] = 374'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 374'h0xxxxxxxxxx00000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[2] = 374'h0xxxxxxxxxx00000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[3] = 374'h1xxxxxxxxxxd00acb7ed00acb7ed00acb7e00178fbc20b78fbc20b78fbc20aeeff923c8594123c8594123c85944938;
      expv[4] = 374'h3xxxxxxxxxxcbd25498cbd25498cbd25499ffe8999c48c8999c48c8999c48c001c5d800757dd800757dd800757b6c7;
      expv[5] = 374'h3xxxxxxxxxxd2f96e90d2f96e90d2f96e91b6ff5adb317f5adb317f5adb316223fb2b6a6e7b2b6a6e7b2b6a6e7ffff;
      expv[6] = 374'h0xxxxxxxxxx005d141a005d141a005d141bff0d314209ed314209ed314209e6660499b9558499b9558499b95586dbf;
      expv[7] = 374'h0xxxxxxxxxx3683faae3683faae3683faafb6044bacfb644bacfb644bacfb6666060eb3f8660eb3f8660eb3f867ff8;
      expv[8] = 374'h2xxxxxxxxxx0999878b0999878b0999878a49e6483179c6483179c6483179cccc3fba33229fba33229fba33229db40;
      expv[9] = 374'h0xxxxxxxxxxdfbeab02dfbeab02dfbeab03ff0d98ccf8ad98ccf8ad98ccf8bbba05317dba95317dba95317dba97fc7;
      expv[10] = 374'h3xxxxxxxxxx73c4015c73c4015c73c4015cdbf1eff1bb31eff1bb31eff1bb2445c08479c2d08479c2d08479c2d4938;
      expv[11] = 374'h1xxxxxxxxxxe84377d4e84377d4e84377d4db09377b2129377b2129377b213bbbf82fb442182fb442182fb4421db78;
      expv[12] = 374'h3xxxxxxxxxx06df0c5906df0c5906df0c58dbfa2e0efa7a2e0efa7a2e0efa7999fa9f8c48529f8c48529f8c48536f8;
      expv[13] = 374'h2xxxxxxxxxxeff21104eff21104eff2110449f9c9d94dd9c9d94dd9c9d94dc0000195993a7195993a7195993a71247;
      expv[14] = 374'h3xxxxxxxxxxc5363e73c5363e73c5363e7200f0dc507050dc507050dc50705333fe4399ad264399ad264399ad20000;
      expv[15] = 374'h2xxxxxxxxxxc4ebddf2c4ebddf2c4ebddf3ffec8fa9020c8fa9020c8fa90211100705af45a705af45a705af45a5b40;
      expv[16] = 374'h0xxxxxxxxxxd2973d99d2973d99d2973d98000cc6a8b14cc6a8b14cc6a8b14aaa0554150aa554150aa554150aa6d80;
      expv[17] = 374'h3xxxxxxxxxx4d09d55c4d09d55c4d09d55c49e4640ad344640ad344640ad34ccdfc656f5ad4656f5ad4656f5ad2480;
      expv[18] = 374'h0xxxxxxxxxx1b69d7e61b69d7e61b69d7e6db1b89fd1f3b89fd1f3b89fd1f3bba062c37a39e2c37a39e2c37a39fff8;
      expv[19] = 374'h1xxxxxxxxxx94fc12d994fc12d994fc12d9ff155c0945155c0945155c09450889c517b9c76517b9c76517b9c762480;
      expv[20] = 374'h0xxxxxxxxxx7d02bf097d02bf097d02bf08db1f66ee639f66ee639f66ee6384443ac700c32ac700c32ac700c32b6c0;
      expv[21] = 374'h3xxxxxxxxxx819e18b1819e18b1819e18b000fda5cd223da5cd223da5cd222445c0572cd818572cd818572cd81803f;
      expv[22] = 374'h2xxxxxxxxxx41dd150441dd150441dd1505b6e8edb886e8edb886e8edb886f99807e2f181afe2f181afe2f181aa487;
      expv[23] = 374'h1xxxxxxxxxx330b5320330b5320330b5320db0210a8686210a8686210a8686ccdfb3dd80f5b3dd80f5b3dd80f5b6f8;
      expv[24] = 374'h0xxxxxxxxxx1df546ae1df546ae1df546aedb0a09ab022a09ab022a09ab023ffe3bc7678f43c7678f43c7678f47ff8;
      expv[25] = 374'h1xxxxxxxxxxf9fe52c7f9fe52c7f9fe52c6db0f62be330f62be330f62be330889faf846eb62f846eb62f846eb66dbf;
      expv[26] = 374'h1xxxxxxxxxxa3a410b3a3a410b3a3a410b2db06667d6766667d6766667d676aabc05b9758985b9758985b97589ffc7;
      expv[27] = 374'h0xxxxxxxxxx7ded13ce7ded13ce7ded13cf6d13e3b28d73e3b28d73e3b28d7bba039753e6539753e6539753e6524bf;
      expv[28] = 374'h3xxxxxxxxxx636db0a7636db0a7636db0a692e52d1b72852d1b72852d1b728eefc2dc908e2adc908e2adc908e2c900;
      expv[29] = 374'h0xxxxxxxxxx5b34a22f5b34a22f5b34a22f6d10b0412a10b0412a10b0412a0ccc0035508f3035508f3035508f36d87;
      expv[30] = 374'h1xxxxxxxxxxa94a382fa94a382fa94a382f6d1e062f409e062f409e062f409bbbffd73f55b7d73f55b7d73f55b7ff8;
      expv[31] = 374'h3xxxxxxxxxx2939257d2939257d2939257dffe3f5fc10c3f5fc10c3f5fc10d777c60dc3a2de0dc3a2de0dc3a2dffff;
      expv[32] = 374'h3xxxxxxxxxx0f3dda520f3dda520f3dda5324ecae6d170cae6d170cae6d171555fa8d1be54a8d1be54a8d1be548038;
      expv[33] = 374'h0xxxxxxxxxxa56137e7a56137e7a56137e7b6087157ffe87157ffe87157fffbba3e3fb5d47e3fb5d47e3fb5d47ffc7;
      expv[34] = 374'h0xxxxxxxxxx82ad1c2082ad1c2082ad1c21b60a916aad2a916aad2a916aad31103b2f8128632f8128632f812864938;
      expv[35] = 374'h1xxxxxxxxxx333c60bd333c60bd333c60bc490604d6244604d6244604d6244889fa7fcc6c227fcc6c227fcc6c24938;
      expv[36] = 374'h3xxxxxxxxxx5eb57bf95eb57bf95eb57bf892e63d798f263d798f263d798f2ccdc69a20cde69a20cde69a20cde6dbf;
      expv[37] = 374'h0xxxxxxxxxx93027c4593027c4593027c44db14c5bf19f4c5bf19f4c5bf19f99838cc4d60f0cc4d60f0cc4d60f6db8;
      expv[38] = 374'h3xxxxxxxxxx8714c9ca8714c9ca8714c9cb24f12a5f78d12a5f78d12a5f78d777c786ec316f86ec316f86ec316927f;
      expv[39] = 374'h3xxxxxxxxxxdba0cd28dba0cd28dba0cd29fffa5f0f53ba5f0f53ba5f0f53b111c7bbbf82afbbbf82afbbbf82ab6c0;
      expv[40] = 374'h2xxxxxxxxxx651a4e31651a4e31651a4e31b6ebb132f28bb132f28bb132f291100153085a6953085a6953085a6b6c0;
      expv[41] = 374'h2xxxxxxxxxx5e0543df5e0543df5e0543de92e1c3da54e1c3da54e1c3da54f7760099f9e08899f9e08899f9e088007;
      expv[42] = 374'h3xxxxxxxxxx49bb0ca949bb0ca949bb0ca849f064ddcdb064ddcdb064ddcdb555fe4608536e4608536e4608536c900;
      expv[43] = 374'h2xxxxxxxxxx45dcbc2c45dcbc2c45dcbc2c49f825b6193825b6193825b61931103e46127b2e46127b2e46127b2db40;
      expv[44] = 374'h2xxxxxxxxxx2239f9d42239f9d42239f9d5b6f77d46a6b77d46a6b77d46a6b11002ff3a609aff3a609aff3a609c93f;
      expv[45] = 374'h0xxxxxxxxxxf9e5aeadf9e5aeadf9e5aeac001eda3e15beda3e15beda3e15bddc02deb3eaaadeb3eaaadeb3eaab6ff;
      expv[46] = 374'h2xxxxxxxxxx1544b2bb1544b2bb1544b2badbf7f5b42317f5b42317f5b4230ccc073f0641f73f0641f73f0641f0007;
      expv[47] = 374'h1xxxxxxxxxx551542375515423755154237241bc73f2f3bc73f2f3bc73f2f3777fcf8f4aabcf8f4aabcf8f4aab8038;
      expv[48] = 374'h1xxxxxxxxxxb63eac76b63eac76b63eac776d1b79e0febb79e0febb79e0fea001c12f188a092f188a092f188a0b6f8;
      expv[49] = 374'h3xxxxxxxxxx51531346515313465153134600ea681d9baa681d9baa681d9bb333c542f5b51542f5b51542f5b515b40;
      expv[50] = 374'h1xxxxxxxxxxb335552eb335552eb335552fb602251f9222251f9222251f923dddc1f86b7d51f86b7d51f86b7d56dbf;
      expv[51] = 374'h3xxxxxxxxxx2e7ea7a02e7ea7a02e7ea7a092e0c45e7e40c45e7e40c45e7e5dddc702f9d61f02f9d61f02f9d61a487;
      expv[52] = 374'h2xxxxxxxxxxed73598ded73598ded73598d6dfd4cc3d0dd4cc3d0dd4cc3d0caaa3e16e4aa2e16e4aa2e16e4aa28000;
      expv[53] = 374'h1xxxxxxxxxxeb958ee6eb958ee6eb958ee76d1f070de2bf070de2bf070de2b555fbb62883c3b62883c3b62883c24bf;
      expv[54] = 374'h0xxxxxxxxxxd2992589d2992589d2992588490509c12d4509c12d4509c12d4666071657ba4f1657ba4f1657ba4c938;
      expv[55] = 374'h3xxxxxxxxxxd4e3e2c7d4e3e2c7d4e3e2c7b6ec907ae5ec907ae5ec907ae5e445fc85aa7dd485aa7dd485aa7dd36c7;
      expv[56] = 374'h2xxxxxxxxxxa67b99c4a67b99c4a67b99c492f4cb8c8ed4cb8c8ed4cb8c8edffe0301ee93cb01ee93cb01ee93ca480;
      expv[57] = 374'h3xxxxxxxxxx220cf3a1220cf3a1220cf3a16de223bf3dc223bf3dc223bf3dcaabfe558134065581340655813402487;
      expv[58] = 374'h1xxxxxxxxxxd4a6c8a5d4a6c8a5d4a6c8a4920703a984c703a984c703a984ceefc1519a92a9519a92a9519a92aa4bf;
      expv[59] = 374'h3xxxxxxxxxx71e6c0d371e6c0d371e6c0d292f16ba5ba916ba5ba916ba5ba8aabc4ffc99cb4ffc99cb4ffc99cb5b78;
      expv[60] = 374'h1xxxxxxxxxx7941d8d77941d8d77941d8d76d104c04a0f04c04a0f04c04a0fbbbffd3d0656fd3d0656fd3d0656ed80;
      expv[61] = 374'h2xxxxxxxxxx47c83e3847c83e3847c83e3849e41968c5441968c5441968c55bba0293029f1293029f1293029f136c7;
      expv[62] = 374'h2xxxxxxxxxx121d3a87121d3a87121d3a8692e619b140a619b140a619b140b332064941e32e4941e32e4941e32b6c7;
      expv[63] = 374'h3xxxxxxxxxx46559d1946559d1946559d1892eae72514aae72514aae72514b555c7dbe3adcfdbe3adcfdbe3adc9247;
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
