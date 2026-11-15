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

  rtlpp_03414 dut (
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
    stim[0] = 235'h15b6ec8ddab26aa5ea73566292a9bd5635c07c0d31319abf728948660c4;
    stim[1] = 235'h01e738a5b9fc40f7c3128abc2fe0eeb469ce4e79fde175e6a7a81524a4c;
    stim[2] = 235'h74234022aa637a74d0f01be9575285ca5dd25aeb0f4a0a9f26d78f525fe;
    stim[3] = 235'h6be538455dd5b80545dca705f3494077ecf5163675fc928b3986ed2fa98;
    stim[4] = 235'h49ba70d6b643a24472277e2873ead8ab3d179c6e3610ab98e7286394dab;
    stim[5] = 235'h6bb81dc015c8fdc429941b0e82a7b926b4863663a3c2e5e84b53ea23ded;
    stim[6] = 235'h43dafc1a9f82d715b01d4663046b7ddee67f17a19da2d0d3652a9c5289d;
    stim[7] = 235'h4206be01056b5897b803a601c8c8ad9b6ef3885a96591253b8bc58b5c63;
    stim[8] = 235'h6aa1d3695684a37b87943b978e72944bc3c11a836e19f3920d6f3cbb423;
    stim[9] = 235'h75896ef8ad1a3d1e2c08d353c6fd49f34b05390c0017b39a1355fe02756;
    stim[10] = 235'h687c4f814235cb9ddcfa52cf95cce1643c53a19fdd09b544752aae48886;
    stim[11] = 235'h66ed03ca3df8391a975ebc6f4a0b110aa133c4e1fb45d455798e75f6201;
    stim[12] = 235'h765a13793da97702ad2e67d2fc99318533a33e2bf9919fe103982072308;
    stim[13] = 235'h465b078a244723cb58b2c2dbf04ec57bc34e70f2cdd8c8905d2a4eae8b4;
    stim[14] = 235'h411e8fc59e96dd6f429e309c9c3e9ce81a8ca7287f8211b85f5608ddb67;
    stim[15] = 235'h585c43df1c08956c3e82835a1c5ec3d09f77f5ac99759b3f6c77e0e034b;
    stim[16] = 235'h4e20133c2f614ad5cea583c78069b72e4e28beb37b82b261c485da4a784;
    stim[17] = 235'h54f07ecdbd111d4a51c742ad77de93a3dc7086512320228f7731a899292;
    stim[18] = 235'h6fb2b37105540856d9040af80e499e09c2c37c14dd2042f49a662e41f1f;
    stim[19] = 235'h705faa53ad5ae2a4d6c18e0f45b85e6f8a3b7d6277b60e49cfda26d9597;
    stim[20] = 235'h416358f479ea49793392bed18813b1c1717746455727f656d08945381a6;
    stim[21] = 235'h4e1b2e3dbafccb294dc7bdc81131fd38a4bff55e88faad338ee543b20de;
    stim[22] = 235'h405eb6d9ccc866d357a026c5286759b34d926c51a60fe0e2a3ae3385360;
    stim[23] = 235'h4c090ebeedc3e9faae7ec4a72c90c9d89e2eed15ca8060136fae97059a1;
    stim[24] = 235'h521bf5830eecfa38513fdd14ab4612f7170e1f6516bb4c3d9b527f4898a;
    stim[25] = 235'h48361f3d5bcf84a173b77f2d33a8f1a8af3e4a2509c816e2d472faccdd9;
    stim[26] = 235'h4df29e312652ae6d8d832286ea657ed4827f41d2912e0b77b59551a7870;
    stim[27] = 235'h70bb112535968d8a9c1cab6668831cf92b14e82c706b35486f6818df802;
    stim[28] = 235'h6e036c2ef3377d12f76b3a78dfcb1370bf8f7d3caea82a0666a4db34905;
    stim[29] = 235'h5ea9470dd4f51ee6fc76c123e3251061524fa3bc9ab8e88d8790d28d371;
    stim[30] = 235'h466e0409b4eb1946531b058e1ac13a878237d96d6693ad77b6e04f4bfde;
    stim[31] = 235'h548645f47b6449b04a64ac40c86f8d2336f5184c4d05b399d31ea6e8829;
    stim[32] = 235'h4cd0f22798b7568152fbc013c6c9b93443af4eba725155b4dca4c3835a1;
    stim[33] = 235'h4cd7a0d03c2d48e954200df539026666226abb3310038dcf6c6d024219f;
    stim[34] = 235'h7d956120654f4bf7531d834e3e63b6f1d80d5c6bb4e06f15a4d78092eb3;
    stim[35] = 235'h42e5931f05d82376d0c632b9d5935fd9a3cc5d8175ad40b1ffd151c83c4;
    stim[36] = 235'h405f9b5c11e526f9c02604b7efe9afb93456562789035aab7d61a419f16;
    stim[37] = 235'h61b9cedf6f57a973bbd85b47a94d9a8b94010b077482dea63684a2a7739;
    stim[38] = 235'h59a1f8b5d06542553ba7c70a521a8285919a8986e707586bb8127f16ba2;
    stim[39] = 235'h799e873115e8a945a287dca55d1c6e7e6865e6c5abeb41cdfd1b1e589ab;
    stim[40] = 235'h55ba3abe4cf135ba7c51df34b74cdff89f948a788c4cd938a90ee9a24d6;
    stim[41] = 235'h53aae7f94def2d0fd87ce9d6457b72ab6fade2d9613dc1f45c82b7a64a4;
    stim[42] = 235'h6f56f734ceb3d5e27272abf92653ac5136096b1c8adcd0615fc6969d1f1;
    stim[43] = 235'h631f55afa18a85589096446a2951f0d5c2b7532241ef753d9c999f0d542;
    stim[44] = 235'h41caa7c741f17135433d76d3e4b8f6f6b96708dfe8137fcde9e156246f8;
    stim[45] = 235'h50d2c85edb96663715739f6b4d15d8c09ff7329fc607a67c637fa3db697;
    stim[46] = 235'h4b2e3dc30da8ee564c40b3ac348ba6c1d7d88753090cc525b74ed8817a5;
    stim[47] = 235'h718a6f1a15acff65ddc7222fb62f1f27ac09f350b5f93f7df978e419b70;
    stim[48] = 235'h5daf6993f951ccab7ee2aa1c74b8ca75c0cc5f9562cb48a4a10853f56a7;
    stim[49] = 235'h76807f54b2951569afc77bc77b116f7e85f60e6705013d0d0c946cd8801;
    stim[50] = 235'h5d8ff5b2cb1a44fcc114242268cc25e5d1e909a103f4f504ad0e07f18be;
    stim[51] = 235'h7fe644976924bf3a83688c5886fba22a7445c97f5ecfaf08249ca526841;
    stim[52] = 235'h53b7bc8255e347aa85b4f854b6e28e38aad31c3285f6c1267e6cf6be2d2;
    stim[53] = 235'h51b6e47c9cab6d14a8544b57d6de3dbdf95c3b3fd1848836caf67ccf370;
    stim[54] = 235'h458914d333c7d2296d49b24b9a9fd777ffbf71f716be816834539313582;
    stim[55] = 235'h6da565b4f8680064ae86b6df2dc74a0a1b0434706d15166c52998857a75;
    stim[56] = 235'h606aff9f4f7da1b37ad5fdad6f053ccfbe7429da078cb09a44801e3ff44;
    stim[57] = 235'h626d2432b4248b66640d5b65731377556875fb514aafff9ea0f3dfbb149;
    stim[58] = 235'h54ee80a6834208e5cd51d7360f614b94eff038c26f2daa4b6d03e29b91d;
    stim[59] = 235'h425d16b5bf04e0a8266de1598e60ba26d219844ea44dabca1876829c8e6;
    stim[60] = 235'h40ae469cc33ca0a15020c0b0a59f7af8d8e0b5b1e0d079e538953a450ed;
    stim[61] = 235'h6997725c2fd896d6c8fadd2b60e110a44a9f87ff7df6fb4de9f5dc4d930;
    stim[62] = 235'h5ce5396094e8cbdfd4d86f12304c559ba4e424d21003d22c4593b33ccd1;
    stim[63] = 235'h61b67b8ca0809c381f0938e7228aaecb6ec119439a039a85a9856db46a3;
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
      expv[1] = 374'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[2] = 374'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      expv[3] = 374'h12000000001a11a0115a11a0115a11a01156d131bd3a6931bd3a6931bd3a68667f80df4aba80df4aba80df4aba9247;
      expv[4] = 374'h210000000015f29c22b5f29c22b5f29c22adbeeadc02a2eadc02a2eadc02a2eee3e5382f9a65382f9a65382f9a4938;
      expv[5] = 374'h100000000004dd386b44dd386b44dd386b5b6f21d1223921d1223921d12239111c3bf1439f3bf1439f3bf1439f5b47;
      expv[6] = 374'h230000000015dc0ee015dc0ee015dc0ee0092ee47ee214e47ee214e47ee214ccc3a0d8741520d8741520d8741536ff;
      expv[7] = 374'h00deadbeef21ed7e0d41ed7e0d41ed7e0d4dbfc16b8ad9c16b8ad9c16b8ad80003ea3318236a3318236a3318235b78;
      expv[8] = 374'h20deadbeef01035f0081035f0081035f00800eb5ac4bdcb5ac4bdcb5ac4bdc00001d300e461d300e461d300e464907;
      expv[9] = 374'h02deadbeef1550e9b4b550e9b4b550e9b4a92f4251bdc34251bdc34251bdc3ddc3a1dcbc73a1dcbc73a1dcbc739247;
      expv[10] = 374'h23deadbeef1ac4b77c5ac4b77c5ac4b77c56de8d1e8f168d1e8f168d1e8f160000469a9e37c69a9e37c69a9e37edb8;
      expv[11] = 374'h10deadbeef143e27c0b43e27c0b43e27c0a0011ae5ceef1ae5ceef1ae5ceee667fd2967cae52967cae52967cae6d87;
      expv[12] = 374'h23deadbeef137681e5137681e5137681e51ffefc1c8d4afc1c8d4afc1c8d4bbba3f5e37a5075e37a5075e37a505b78;
      expv[13] = 374'h12deadbeef3b2d09bc9b2d09bc9b2d09bc9ffed4bb8156d4bb8156d4bb8156889c733e97e4f33e97e4f33e97e4c938;
      expv[14] = 374'h20deadbeef032d83c5032d83c5032d83c5124e2391e5ac2391e5ac2391e5ac445f9616df821616df821616df827fc7;
      expv[15] = 374'h02deadbeef008f47e2c08f47e2c08f47e2cdbf4b6eb7a14b6eb7a14b6eb7a15543f184e4e1f184e4e1f184e4e1ffc7;
      expv[16] = 374'h22deadbeef0c2e21ef8c2e21ef8c2e21ef8dbe044ab61e044ab61e044ab61f5540141ad0e2941ad0e2941ad0e2ffc7;
      expv[17] = 374'h13deadbeef0710099e0710099e0710099e16dfb0a56ae7b0a56ae7b0a56ae7555c2c1e3c032c1e3c032c1e3c03493f;
      expv[18] = 374'h22deadbeef0a783f66ca783f66ca783f66dffe888ea528888ea528888ea528eee03a156bbeba156bbeba156bbeffc7;
      expv[19] = 374'h03deadbeef17d959b897d959b897d959b8800eaa042b6caa042b6caa042b6c88802057c0722057c0722057c072493f;
      expv[20] = 374'h22deadbeef182fd529d82fd529d82fd529d6dead71526aad71526aad71526b77600c707a2d8c707a2d8c707a2dc900;
      expv[21] = 374'h01deadbeef00b1ac7a20b1ac7a20b1ac7a3ff0f524bc98f524bc98f524bc99ddc395f68c4095f68c4095f68c40927f;
      expv[22] = 374'h00deadbeef270d971ec70d971ec70d971edff17e6594a77e6594a77e6594a6eee03dee4089bdee4089bdee4089803f;
      expv[23] = 374'h31deadbeef202f5b6ce02f5b6ce02f5b6ce49e643369aa643369aa643369abdddc01362943013629430136294336f8;
      expv[24] = 374'h02deadbeef0604875f6604875f6604875f76dee1f4fd56e1f4fd56e1f4fd57333ff6253964f6253964f62539648007;
      expv[25] = 374'h30deadbeef090dfac1890dfac1890dfac1849f767d1c29767d1c29767d1c28889ffee8a55a7ee8a55a7ee8a55a36c0;
      expv[26] = 374'h02deadbeef041b0f9ea41b0f9ea41b0f9eadb1e7c250b9e7c250b9e7c250b9dddfbbf9699d3bf9699d3bf9699d4907;
      expv[27] = 374'h23deadbeef06f94f1886f94f1886f94f18924f295736c7295736c7295736c6ccc019143753191437531914375324b8;
      expv[28] = 374'h00deadbeef385d8892985d8892985d88929b6ecb46c54ecb46c54ecb46c54e0003e55b3344655b3344655b33441278;
      expv[29] = 374'h11deadbeef3701b6177701b6177701b6177b619bbe897b9bbe897b9bbe897bbbbc59d3c6fe59d3c6fe59d3c6fe5b78;
      expv[30] = 374'h22deadbeef2f54a386ef54a386ef54a386e92e7a8f737e7a8f737e7a8f737e223fb6091f1936091f1936091f1924b8;
      expv[31] = 374'h01deadbeef23370204c3370204c3370204db6e758ca328758ca328758ca3299983d82c70d6582c70d6582c70d60038;
      expv[32] = 374'h10deadbeef0a4322fa2a4322fa2a4322fa3ff1b224d825b224d825b224d825333c2562064325620643256206437fff;
      expv[33] = 374'h03deadbeef06687913c6687913c6687913cdb05bab40a85bab40a85bab40a9777fde009e365e009e365e009e36493f;
      expv[34] = 374'h32deadbeef066bd068066bd068066bd0681ffe16a474aa16a474aa16a474aa001c006fa9c8006fa9c8006fa9c81240;
      expv[35] = 374'h01deadbeef1ecab0903ecab0903ecab090324ea7a5fba8a7a5fba8a7a5fba99983ec1a71f36c1a71f36c1a71f3127f;
      expv[36] = 374'h20deadbeef2172c98f8172c98f8172c98f800eec11bb68ec11bb68ec11bb6866603195ceacb195ceacb195ceac9278;
      expv[37] = 374'h11deadbeef002fcdae002fcdae002fcdae0920f2937ce0f2937ce0f2937ce0001c3025bf7f3025bf7f3025bf7f493f;
      expv[38] = 374'h22deadbeef30dce76fb0dce76fb0dce76fb6dfabd4b9ddabd4b9ddabd4b9ddffe3c2da3d4a42da3d4a42da3d4a6dbf;
      expv[39] = 374'h12deadbeef0cd0fc5aecd0fc5aecd0fc5ae92032a12a9c32a12a9c32a12a9ddddc3e385290be385290be385290db47;
      expv[40] = 374'h22deadbeef1ccf43989ccf43989ccf4398892ef454a2d0f454a2d0f454a2d155403ee52ae8bee52ae8bee52ae8ed80;
      expv[41] = 374'h00deadbeef0add1d5f2add1d5f2add1d5f249e789add3e789add3e789add3e22238ef9a5ba0ef9a5ba0ef9a5ba6d87;
      expv[42] = 374'h33deadbeef09d573fca9d573fca9d573fca49ef79687ecf79687ecf79687ec223fe74eb22be74eb22be74eb22bdb78;
      expv[43] = 374'h00deadbeef37ab7b9a77ab7b9a77ab7b9a649f59eaf13959eaf13959eaf139333f955fc932955fc932955fc932927f;
      expv[44] = 374'h03deadbeef118faad7d18faad7d18faad7d240c542ac48c542ac48c542ac484443b223514ab223514ab223514a803f;
      expv[45] = 374'h10deadbeef00e553e3a0e553e3a0e553e3a000f8b89aa0f8b89aa0f8b89aa1999febb69f25ebb69f25ebb69f25c907;
      expv[46] = 374'h03deadbeef0869642f6869642f6869642f6db1cb331b8bcb331b8bcb331b8aaabf9cfb5a689cfb5a689cfb5a68a4bf;
      expv[47] = 374'h22deadbeef25971ee185971ee185971ee1849ed4772b26d4772b26d4772b262220059d61a4059d61a4059d61a45b7f;
      expv[48] = 374'h03deadbeef38c5378d18c5378d18c5378d092ed67fb2eed67fb2eed67fb2eeeee039117db139117db139117db17ff8;
      expv[49] = 374'h12deadbeef0ed7b4c9eed7b4c9eed7b4c9fff0a8e655bea8e655bea8e655bf777c1550e3a59550e3a59550e3a5c907;
      expv[50] = 374'h03deadbeef1b403faa5b403faa5b403faa5b614a8ab4d74a8ab4d74a8ab4d7ffe03bde3bd8bbde3bd8bbde3bd88038;
      expv[51] = 374'h00deadbeef0ec7fad96ec7fad96ec7fad964918d227e618d227e618d227e608883a121134621211346212113466d80;
      expv[52] = 374'h11deadbeef1ff3224bbff3224bbff3224bb6d0925f9d40925f9d40925f9d41bbbc4462c437c462c437c462c437db7f;
      expv[53] = 374'h22deadbeef09dbde4129dbde4129dbde41292ef1a3d542f1a3d542f1a3d542ccdfa7c2a5b727c2a5b727c2a5b71247;
      expv[54] = 374'h00deadbeef08db723e48db723e48db723e4dbe55b68a5455b68a5455b68a542223a25abeb6a25abeb6a25abeb6ffc0;
      expv[55] = 374'h01deadbeef02c48a6982c48a6982c48a699b61e3e914b7e3e914b7e3e914b6aaa04d925cd4cd925cd4cd925cd4ffff;
      expv[56] = 374'h00deadbeef36d2b2da76d2b2da76d2b2da7ff0340032563400325634003257554035b6f96e35b6f96e35b6f96e36f8;
      expv[57] = 374'h23deadbeef30357fcfb0357fcfb0357fcfa49fbed0d9bdbed0d9bdbed0d9bd7763afed6b782fed6b782fed6b7824b8;
      expv[58] = 374'h02deadbeef3136921951369219513692195b6e1245b3321245b3321245b33200006adb2b98eadb2b98eadb2b989278;
      expv[59] = 374'h01deadbeef2a7740534a7740534a7740534001a10472e7a10472e7a10472e6aaa38eb9b07b0eb9b07b0eb9b07b0038;
      expv[60] = 374'h30deadbeef012e8b5ac12e8b5ac12e8b5adfff827054138270541382705413333c6f0acc736f0acc736f0acc730007;
      expv[61] = 374'h01deadbeef0057234e6057234e6057234e60019e5050a99e5050a99e5050a8001c0605852c8605852c8605852cfff8;
      expv[62] = 374'h32deadbeef34cbb92e14cbb92e14cbb92e16dfec4b6b65ec4b6b65ec4b6b64667fd6e95b0756e95b0756e95b070038;
      expv[63] = 374'h00deadbeef2e729cb04e729cb04e729cb0492e7465efea7465efea7465efea6663c378918243789182437891826d80;
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
