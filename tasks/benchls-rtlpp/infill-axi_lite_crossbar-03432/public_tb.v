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

  rtlpp_03432 dut (
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
    stim[0] = 235'h3aba80e9b76d5c64b320054a906c959192176e59b2901441c221a072afd;
    stim[1] = 235'h1e2cdca364f214b575ad160b5e8a74fc9df2d3e04d348bb74832596e011;
    stim[2] = 235'h7d340bfc9061a88a9c0d5a6a469b51b4b37928f974590f248f74a0322cd;
    stim[3] = 235'h63ea8a5d7c540c3a9fe89b637bf8e2f58a1618a19954e6ed5dbd386012e;
    stim[4] = 235'h78224fc4c8161049bd0e6b49868640e11e7a3c868b13bb8862c34fa7219;
    stim[5] = 235'h6fd0f519bb77e79a834a286f0761620d3b8fa424215102e6ac5ed283d43;
    stim[6] = 235'h5a6ee35e1c82040784803029e90f50059fa26aa755c89f25ad2a961ee28;
    stim[7] = 235'h528f308a7f07cf1a97819af78bb009ea1ad1634fcba0c0f448a5b62b113;
    stim[8] = 235'h7edfc199d952824d1c884b0886df329090c5f1c792c1b5aaaa08cf70638;
    stim[9] = 235'h5249b872d3cb1d24212b644c1f6da828b8e685ebf484f82242d65bec080;
    stim[10] = 235'h558a82aa200afcbd4c08851e5d7520cceb658d755d153ded714ba1219db;
    stim[11] = 235'h6ce169e165b4d14f827c8696e56a8043dacb4eb16677d47d65fdbf2ad4f;
    stim[12] = 235'h5bef358a0db1f35504dc0c0933146255afd5f32dc74ac373ae4371251bc;
    stim[13] = 235'h5c44040cddefdbe1828fc900360f816b89817d5985cd3c338b54bfd6897;
    stim[14] = 235'h43a89c5bc885c21b9bc87f9918f0cb442ff00d194c2f979e65156b826fb;
    stim[15] = 235'h6d28b32661bd3f1f3e2504cd20ad6a06630572f842e9e9f2c6a4b91fc32;
    stim[16] = 235'h7bd042ed84ade9ab86f89ce5a22dcd78dd736cc683ed29aa9abc937789b;
    stim[17] = 235'h7331f0f82c0eb16304207a67fed68bdcd07bff781836e1a8c5832c396a2;
    stim[18] = 235'h4cd7ce1d37cefb9f7400a9489a4eea963036863f7d5ceb3b6218830258e;
    stim[19] = 235'h496592ab1476c8da6aea3fb6a3f1c5a06ee85839ee1cf4c10934e49a630;
    stim[20] = 235'h5f2aa861c4d82ef7abc632fff8511d242e23da2d0796ebcca4818fb8c6b;
    stim[21] = 235'h7622b4d1ca0ffaaa49bdf3b673fa5c5d3cf8585c7fb11af225dfa7e03e4;
    stim[22] = 235'h7e8fbc47f1fd90530a3b70072b21ba4b5e533c6d4ba81429321c7dc1ffd;
    stim[23] = 235'h5fd3ce2ee22d3fb4f1e3012846f3c7d3f868d115593e1a95adb8144a6af;
    stim[24] = 235'h55ef8e81f8f7bc9e6aea054469c1b8638c4264dcf80cb450beace5de0f0;
    stim[25] = 235'h53d5bd98cb3512627041df4164b08e315f93eb553de323edabc84ad6d49;
    stim[26] = 235'h7b8a871a64047120731cea36561d20035d81fe1d5ec3bb8d5cb4e515110;
    stim[27] = 235'h6f0b604bbd7a8f11a215c70af6d22517e1957f6c7842a92ecea5512549d;
    stim[28] = 235'h454c589f2628e860ad54bac8277372c335e46be6da544f7a9463f7fea60;
    stim[29] = 235'h66dd19d5088cca2862ca675c64410c67d0659763d3c98944ce292ebfdf4;
    stim[30] = 235'h58a5f1d2aa449754f03167f9ca7421d257cf6021efb6dcc2add7c84960c;
    stim[31] = 235'h5f20a155e4b57b257a048037fb0570e12235134e9636a7ec1460b870ab5;
    stim[32] = 235'h592945b667632292e777269ad2391876192dfe6ad6b29b0a62584f4a215;
    stim[33] = 235'h6dfe127a73c63f601af9488a49605a731d7a1c8600d8cf5568917e5a554;
    stim[34] = 235'h5238a245a00db16958a4e0781f014af766914a75af50f99bdb0d45c4bf0;
    stim[35] = 235'h4180139677ccf3b3bba842e8157961917db46024392453a15abd04ed639;
    stim[36] = 235'h75262311a9b15bdf84a4f7005a00ab6b0d1086bc9c61938065d1f8a1cde;
    stim[37] = 235'h613539ee2b82eb778d96b9414f9e8841685ab324d4d1a2de1eff99883b8;
    stim[38] = 235'h77f234e4358aa670c25367a1f4fc0d9caa4890a82f5de5f5b1be2f25469;
    stim[39] = 235'h4091f16ea2b92b1fab904bec687f778250a8af0a3c1bf4236f7431697fa;
    stim[40] = 235'h6a767f54be9c4105bfbafe5ce7a3c817ebc3f57928e78c5db192df94ee3;
    stim[41] = 235'h5d125b8ecf4452f05f102867b68d8b0f20d0bf29d4b62bc6982b76713a3;
    stim[42] = 235'h492b1f552a41ff9223f327207f5ca1e0b8941a644d3ea86e3b013b65617;
    stim[43] = 235'h6e80bbfbc1197428c1bdb1a1cddf61379dfdf56d40b19e6519b7557c55d;
    stim[44] = 235'h487e0873250c86d2b8d7e954a506526f4502e352df7e137c5216d96ca60;
    stim[45] = 235'h5742eea71767d4b70bd840869ffdc42c7bc85ad935bdf25e1f588adf6f4;
    stim[46] = 235'h7006c8197ba58266aaa3cd1ee9fa3a81f7c8904a2c5294de1cf65391b08;
    stim[47] = 235'h506adccdcbea54f909e87a25518599be5480b767241f5c15a6cf1a214b2;
    stim[48] = 235'h48b8988d12f10a71383804ab67a73d8dbec26d570e8d1fc1d4a2d340157;
    stim[49] = 235'h5c666a0cc7f25f97cf2c862a53d7e859e9a3abbf1a554604850d39d9f63;
    stim[50] = 235'h505de3dc4e81f7ee0347893cf6cac98a9c7ef08724e4a981742d70207c7;
    stim[51] = 235'h649680baaef9c848f60757a0c99488fad988330baffdc4e3d307092801e;
    stim[52] = 235'h74743ffb57883a9880549129d4cea7c3789416cb061d6ecdd330fb367de;
    stim[53] = 235'h430008e2a26f5e0cad318775d45115cb76584d6c276eda4ceaf6e44c4aa;
    stim[54] = 235'h4db94361f0485ae9c1bb8ffedcfbf41c62c88c2707dca38818072e45924;
    stim[55] = 235'h6af42e211e1bff23c33916f1d345943e1814980d452a15bb805ef12478b;
    stim[56] = 235'h60edf6262e391d8eb46f7d1d71c76fffbf68e1a556829bc3407b1de8244;
    stim[57] = 235'h74d0acdc6b2003c45cdbbc62bdd7d1f57ea98a601a85ece0b49cef2bd4f;
    stim[58] = 235'h707a7d693c5e98d3cf6afb102f5f95c7698ce73aa4064132cb1247bb2ce;
    stim[59] = 235'h7f8df67bf3f07c8fabaa63ff98b1a347a36a8224bb5a3b5f10226203512;
    stim[60] = 235'h7175fd5adc4b269093617db8eb8594d961ed9055895f880bfb0d0dfcc0e;
    stim[61] = 235'h6eca5d3cb196ca31d19888bf5a148749189194f8889384f5c8d3979e345;
    stim[62] = 235'h6e5aea139c2fc12dfc2c405c4dd4f9e852c05a370cbb4e22f9cf38f1b47;
    stim[63] = 235'h4507bb2c231120c742cdfb5ca4de5b3cbecf6375fa1e890edba436eb3d6;
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
      expv[0] = 374'h2a110d0395fd5d4074dd5d4074dd5d4074db6fb6ae3259b6ae3259b6ae3259999c002a5483002a5483002a54836d87;
      expv[1] = 374'h2c4192cb70af166e51af166e51af166e51b24e790a5aba790a5aba790a5abaccdc68b05af468b05af468b05af45b40;
      expv[2] = 374'h297ba501917e9a05fe5e9a05fe5e9a05fe492030d4454e30d4454e30d4454e00006ad35234ead35234ead35234db78;
      expv[3] = 374'h1aede9c30051f5452eb1f5452eb1f5452ebffe2a061d4e2a061d4e2a061d4ffffc44db1bdfc4db1bdfc4db1bdfc907;
      expv[4] = 374'h02161a7d39fc1127e27c1127e27c1127e264900b0824de0b0824de0b0824de8880735a4c34735a4c34735a4c3436c0;
      expv[5] = 374'h1762f6941e37e87a8cd7e87a8cd7e87a8cdff1bbf3cd41bbf3cd41bbf3cd41bba05143783b5143783b5143783b0038;
      expv[6] = 374'h226954b0f74d3771af0d3771af0d3771af0dbe410203c2410203c2410203c2444001814f4801814f4801814f487ff8;
      expv[7] = 374'h04452db158a947984529479845294798453fff83e78d4b83e78d4b83e78d4bddc00cd7bc5d8cd7bc5d8cd7bc5d8000;
      expv[8] = 374'h3850467b83df6fe0ccff6fe0ccff6fe0ccedb0a941268ea941268ea941268e444042584436c2584436c2584436fff8;
      expv[9] = 374'h0516b2df600924dc396924dc396924dc396921e58e9211e58e9211e58e9210889c5b2260fb5b2260fb5b2260fb6dbf;
      expv[10] = 374'h058a5d090ceac541550ac541550ac541551240057e5ea6057e5ea6057e5ea600004428f2ebc428f2ebc428f2eba4b8;
      expv[11] = 374'h022fedf9567670b4f0b670b4f0b670b4f0b24eda68a7c0da68a7c0da68a7c1333fe434b72b6434b72b6434b72b5b47;
      expv[12] = 374'h1b721b8928cdf79ac50df79ac50df79ac5049ed8f9aa82d8f9aa82d8f9aa826663e0604998e0604998e0604998a480;
      expv[13] = 374'h065aa5feb4ae2202066e2202066e2202066dbef7edf0c0f7edf0c0f7edf0c155407e4801b07e4801b07e4801b07fff;
      expv[14] = 374'h1128ab5c13e1d44e2de1d44e2de1d44e2de49042e10dcc42e10dcc42e10dcdffe043fcc8c7c3fcc8c7c3fcc8c78007;
      expv[15] = 374'h113525c8fe9694599336945993369459933240de9f8f9ede9f8f9ede9f8f9f111c2826690528266905282669056db8;
      expv[16] = 374'h0cd5e49bbcfde82176dde82176dde82176c00e56f4d5c256f4d5c256f4d5c3777fc4e72d1144e72d1144e72d116dbf;
      expv[17] = 374'h1c2c1961cb1998f87c1998f87c1998f87c16de0758b1820758b1820758b182001c03d33ff683d33ff683d33ff6b6c7;
      expv[18] = 374'h1910c41812466be70e866be70e866be70e9b6fe77dcfbbe77dcfbbe77dcfba0000054a44d2054a44d2054a44d27fc7;
      expv[19] = 374'h0149a724d384b2c95584b2c95584b2c955892e3b646d343b646d343b646d35777c51fdb51fd1fdb51fd1fdb51f803f;
      expv[20] = 374'h21240c7dc66f955430ef955430ef955430e00e6c177bd46c177bd46c177bd5ffe03197ffc2b197ffc2b197ffc28038;
      expv[21] = 374'h2f2efd3f011b115a68fb115a68fb115a68e49107fd552507fd552507fd5524ccdfef9db39fef9db39fef9db39fdb40;
      expv[22] = 374'h3690e3ee0fff47de23ff47de23ff47de23fb60fec82984fec82984fec82985111fdb8039595b8039595b803959003f;
      expv[23] = 374'h1b6dc0a2536fe9e7176fe9e7176fe9e7177241169fda79169fda79169fda78eefc180942379809423798094237927f;
      expv[24] = 374'h22f5672ef08af7c740eaf7c740eaf7c740fff07bde4f347bde4f347bde4f35777c502a234e502a234e502a234e003f;
      expv[25] = 374'h1a5e4256b669eadecc69eadecc69eadecc64919a8931399a8931399a89313822200efa0b258efa0b258efa0b258007;
      expv[26] = 374'h02e5a728a89dc5438d3dc5438d3dc5438d324e0238903802389038023890399983e751b2b0e751b2b0e751b2b0edb8;
      expv[27] = 374'h0b752a892af785b025d785b025d785b025dffebd4788d0bd4788d0bd4788d11103ae3857b6ae3857b6ae3857b69240;
      expv[28] = 374'h33a31fbff502a62c4f82a62c4f82a62c4f924f147430571474305714743056aaa3a5d6413ba5d6413ba5d6413b9278;
      expv[29] = 374'h02714975fe936e8cea936e8cea936e8cea84904665143046651430466514317760533ae322533ae322533ae3220038;
      expv[30] = 374'h086ebe424b4c52f8e94c52f8e94c52f8e956d1224baa79224baa79224baa78001f8b3fce538b3fce538b3fce53a480;
      expv[31] = 374'h23a305c385af9050aaef9050aaef9050aaf24e5abd92bc5abd92bc5abd92bd11002401bfd82401bfd82401bfd824b8;
      expv[32] = 374'h2812c27a51ac94a2db2c94a2db2c94a2db324fb1914973b1914973b1914973bbbfb934d691b934d691b934d691c938;
      expv[33] = 374'h3a448bf2d296ff093d36ff093d36ff093d3b61e31fb00de31fb00de31fb00d777fca44524b4a44524b4a44524b0000;
      expv[34] = 374'h1bd86a2e25891c5122c91c5122c91c5122d24006d8b4ac06d8b4ac06d8b4ac445c2703c0f82703c0f82703c0f80038;
      expv[35] = 374'h0bd5e8276be0c009cb20c009cb20c009cb3b6fe679d9dde679d9dde679d9dddddc421740abc21740abc21740abc938;
      expv[36] = 374'h162e8fc50eda931188da931188da931188d6d0d8adefc2d8adefc2d8adefc2445c27b802d027b802d027b802d00007;
      expv[37] = 374'h03f7fccc41d09a9cf7109a9cf7109a9cf716d1c175bbc7c175bbc7c175bbc6ccc3b5ca0a7cb5ca0a7cb5ca0a7cffc7;
      expv[38] = 374'h0d8df1792a7bf91a721bf91a721bf91a721b6ec5533860c5533860c553386133239b3d0fa79b3d0fa79b3d0fa7ed80;
      expv[39] = 374'h307ba18b4bc048f8b74048f8b74048f8b752415c958fd55c958fd55c958fd5ddc3825f6343825f6343825f6343fff8;
      expv[40] = 374'h0b8c96fca7353b3faa553b3faa553b3faa5fff4e2082df4e2082df4e2082dfdddfd7f2e73d57f2e73d57f2e73d127f;
      expv[41] = 374'h17c15bb3892e892dc76e892dc76e892dc7649fa229782fa229782fa229782f998381433db401433db401433db46dbf;
      expv[42] = 374'h01d809db2ba4958faa84958faa84958faa96d120ffc91120ffc91120ffc911ffff993903fa993903fa993903faed87;
      expv[43] = 374'h0acdbaabe2f7405dfdf7405dfdf7405dfde0008cba14608cba14608cba1460ccdfed8d0e6eed8d0e6eed8d0e6efff8;
      expv[44] = 374'h3690b6cb65043f0439843f0439843f0439924e8643695c8643695c8643695c6663bf4aa5283f4aa5283f4aa52836c0;
      expv[45] = 374'h05fac456fb8ba177538ba177538ba17753892fb3ea5b85b3ea5b85b3ea5b85ffe3c20434ffc20434ffc20434ffedbf;
      expv[46] = 374'h33e7b29c8d5803640cb803640cb803640cbff1d2c13355d2c13355d2c13355555c1e68f74f9e68f74f9e68f74fdb40;
      expv[47] = 374'h2c3678d10a88356e66e8356e66e8356e66e491f52a7c85f52a7c85f52a7c84eefc43d12a8c43d12a8c43d12a8c24bf;
      expv[48] = 374'h27a5169a00a45c4c46845c4c46845c4c4689217885389d7885389d7885389c001fc0255b3d40255b3d40255b3d36f8;
      expv[49] = 374'h0f2869cecf2e3335066e3335066e333506600ff92fcbe7f92fcbe7f92fcbe7999c6431529ee431529ee431529eb6ff;
      expv[50] = 374'h04a16b8103282ef1ee282ef1ee282ef1ee249f40fbf70140fbf70140fbf701bba03c49e7b63c49e7b63c49e7b65b47;
      expv[51] = 374'h0c98384940d24b405d524b405d524b405d56df7ce4247b7ce4247b7ce4247b11003abd064cbabd064cbabd064ca487;
      expv[52] = 374'h139987d9b3da3a1ffdba3a1ffdba3a1ffda92fc41d4c41c41d4c41c41d4c402223a4894ea624894ea624894ea67fc7;
      expv[53] = 374'h2757b72262418004714180047141800471524137af065737af065737af0656889f8c3baea28c3baea28c3baea28038;
      expv[54] = 374'h2dc039722c06dca1b0e6dca1b0e6dca1b0fb60242d74e0242d74e0242d74e0ccdfdc7ff6e7dc7ff6e7dc7ff6e7db7f;
      expv[55] = 374'h2c02f78923757a1710957a1710957a17108dbf0dff91e10dff91e10dff91e1999fc8b78e9a48b78e9a48b78e9a24bf;
      expv[56] = 374'h1f03d8ef411076fb131076fb131076fb1316df1c8ec75b1c8ec75b1c8ec75a223c7be8eb8e7be8eb8e7be8eb8e36f8;
      expv[57] = 374'h2ba4e7795e7a68566e3a68566e3a68566e36d19001e22f9001e22f9001e22e6663dde315eedde315eedde315eeb6ff;
      expv[58] = 374'h2358923dd9583d3eb4983d3eb4983d3eb49ffe2f4c69e62f4c69e62f4c69e7bbbc57d8817ad7d8817ad7d8817affff;
      expv[59] = 374'h138113101a9fc6fb3dffc6fb3dffc6fb3dfb61f83e47d5f83e47d5f83e47d5dddc531ffcc5d31ffcc5d31ffcc5803f;
      expv[60] = 374'h2fd8686fe658bafead78bafead78bafead6dbe259348482593484825934849bbbc0bedc75c0bedc75c0bedc75c24bf;
      expv[61] = 374'h16469cbcf137652e9e57652e9e57652e9e5b60cb6518e8cb6518e8cb6518e8ccc3c445fad0c445fad0c445fad0a487;
      expv[62] = 374'h24ce79c78d372d7509d72d7509d72d7509cdbe17e096fe17e096fe17e096fe001c6202e26ee202e26ee202e26ea487;
      expv[63] = 374'h3ddd21b7598283dd960283dd960283dd961241889063a1889063a1889063a177606fdae526efdae526efdae526ffc0;
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
