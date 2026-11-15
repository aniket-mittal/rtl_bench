// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 361;
  localparam OW = 254;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03650 dut (
    .aclk(clk),
    .aresetn(in_vec[360:360]),
    .s_axi_awid(in_vec[359:358]),
    .s_axi_awaddr(in_vec[357:294]),
    .s_axi_awlen(in_vec[293:278]),
    .s_axi_awsize(in_vec[277:272]),
    .s_axi_awburst(in_vec[271:268]),
    .s_axi_awlock(in_vec[267:266]),
    .s_axi_awcache(in_vec[265:258]),
    .s_axi_awprot(in_vec[257:252]),
    .s_axi_awqos(in_vec[251:244]),
    .s_axi_awvalid(in_vec[243:242]),
    .s_axi_wdata(in_vec[241:178]),
    .s_axi_wstrb(in_vec[177:170]),
    .s_axi_wlast(in_vec[169:168]),
    .s_axi_wvalid(in_vec[167:166]),
    .s_axi_bready(in_vec[165:164]),
    .s_axi_arid(in_vec[163:162]),
    .s_axi_araddr(in_vec[161:98]),
    .s_axi_arlen(in_vec[97:82]),
    .s_axi_arsize(in_vec[81:76]),
    .s_axi_arburst(in_vec[75:72]),
    .s_axi_arlock(in_vec[71:70]),
    .s_axi_arcache(in_vec[69:62]),
    .s_axi_arprot(in_vec[61:56]),
    .s_axi_arqos(in_vec[55:48]),
    .s_axi_arvalid(in_vec[47:46]),
    .s_axi_rready(in_vec[45:44]),
    .m_axi_awready(in_vec[43:43]),
    .m_axi_wready(in_vec[42:42]),
    .m_axi_bid(in_vec[41:41]),
    .m_axi_bresp(in_vec[40:39]),
    .m_axi_bvalid(in_vec[38:38]),
    .m_axi_arready(in_vec[37:37]),
    .m_axi_rid(in_vec[36:36]),
    .m_axi_rdata(in_vec[35:4]),
    .m_axi_rresp(in_vec[3:2]),
    .m_axi_rlast(in_vec[1:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[253:252]),
    .s_axi_wready(out_vec[251:250]),
    .s_axi_bid(out_vec[249:248]),
    .s_axi_bresp(out_vec[247:244]),
    .s_axi_bvalid(out_vec[243:242]),
    .s_axi_arready(out_vec[241:240]),
    .s_axi_rid(out_vec[239:238]),
    .s_axi_rdata(out_vec[237:174]),
    .s_axi_rresp(out_vec[173:170]),
    .s_axi_rlast(out_vec[169:168]),
    .s_axi_rvalid(out_vec[167:166]),
    .m_axi_awid(out_vec[165:165]),
    .m_axi_awaddr(out_vec[164:133]),
    .m_axi_awlen(out_vec[132:125]),
    .m_axi_awsize(out_vec[124:122]),
    .m_axi_awburst(out_vec[121:120]),
    .m_axi_awlock(out_vec[119:119]),
    .m_axi_awcache(out_vec[118:115]),
    .m_axi_awprot(out_vec[114:112]),
    .m_axi_awregion(out_vec[111:108]),
    .m_axi_awqos(out_vec[107:104]),
    .m_axi_awvalid(out_vec[103:103]),
    .m_axi_wdata(out_vec[102:71]),
    .m_axi_wstrb(out_vec[70:67]),
    .m_axi_wlast(out_vec[66:66]),
    .m_axi_wvalid(out_vec[65:65]),
    .m_axi_bready(out_vec[64:64]),
    .m_axi_arid(out_vec[63:63]),
    .m_axi_araddr(out_vec[62:31]),
    .m_axi_arlen(out_vec[30:23]),
    .m_axi_arsize(out_vec[22:20]),
    .m_axi_arburst(out_vec[19:18]),
    .m_axi_arlock(out_vec[17:17]),
    .m_axi_arcache(out_vec[16:13]),
    .m_axi_arprot(out_vec[12:10]),
    .m_axi_arregion(out_vec[9:6]),
    .m_axi_arqos(out_vec[5:2]),
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
    stim[0] = 361'h0c8a1f8102df783f7531954658af3a83b950471dfa2ab89f64e38bee373d93b6369c87ce9804731218c66ceff56;
    stim[1] = 361'h030b6db2644614fa4deec88e294adbf2cc30c99d7c48c7f96f8968d222f15473054d12a7242767b581d3407b55f;
    stim[2] = 361'h0d50a250fac80f2a6d194d80d55b344b23cd167ab8ae3d6484b729696c26fe4b34254288d815f5162b253427f70;
    stim[3] = 361'h11986e5a7e27804c396dc6598514528aabba70c5682806a9bc8f83aa7dc8a34fb2c8cfb4c6233af27d587d4ea3e;
    stim[4] = 361'h1baaea2becddc9fb320c2a25515ef3d1287ea12aa085478173bd649c933ea2c7610d8c856c5c9985e4115a4e5a5;
    stim[5] = 361'h1980947aa8506f6d2cffb4e0e85d97699caec1b4e7771cb7dfb5697499a881bbea217cc268e72a4577b4943b8e0;
    stim[6] = 361'h1b882e5f0ad450d5bc09d5289c973119723c4ac6458df251ecd0c73347be90c5b0afe03fa5ff6fad098c34815c5;
    stim[7] = 361'h12609d3485fda2cf534d6fa778b876ea985d4802f872541bd90d2b8bc01749f7b59c48d492628ca27ce4c628d28;
    stim[8] = 361'h14066549dd6f773efa0ef22df7a5cb639f47bf630d7dc6b4a52bd2ce62903ee680cc80aafa7fea6ce57b95941b8;
    stim[9] = 361'h127cef98fa10d1e60c2ddf9b8f7de147280a90f61fedece972c6c906a8cd358915585512c808804a3813c315940;
    stim[10] = 361'h14d770f4e98f4143e25322bad043ffe0ddcdc0e8332d2893d4d8ac7f03736ffe4792260ae15701ac5b795fc7773;
    stim[11] = 361'h161c8ff82522a1f48642cea63bc8532c94e2426bd4155944e79c4aaf975ac4997dcdc5a3ed853fc461cd034da5e;
    stim[12] = 361'h16649a7f7b48557d098d4caa6e7b925329744a4261823d06d016c9b5256f2171bae883027aa2180e954459f6fc6;
    stim[13] = 361'h18d929d8c567e3c9558cf09395039b10e5171421ad1997e3f9506f03d5a94e4aa85cbb2f0ba6d9eb46024593966;
    stim[14] = 361'h1e08e4772dd38b47318c382890af223b7187f2041c16acbba58bd1912051503c2c3754bde9d3c3c649c60593d66;
    stim[15] = 361'h1e60d76a9b72fb9b6463093915145f3f342ed19bf47d593e297bc775ea243d532cf11772ef70eb1d6e38054b599;
    stim[16] = 361'h1001d9c425bcdcd8a200c52afdd5a1addd9d9e4192a0c6cf6498bb26306b9365e4a059411d19ed64544d50b3c78;
    stim[17] = 361'h11946841621c364b4f6a4b40fd832c356ed227f52f31d74fef4b51a9516d4304066537c39e657579f8570c47ed2;
    stim[18] = 361'h1c6cb403c7b487feced661c504e4a7da97cdd3c4c5d806edf878e7b8ef737af7bf51f5f50bf7e3b873880695f94;
    stim[19] = 361'h106aa0e69e6a2ba7cfb92405f02200bea28ae324f25bf9af50d1e9251d71be46a6346c74be47983ef7b9e0bf4e1;
    stim[20] = 361'h121491a7606ed4e04d3d4b1f6780f12034738c26ce56812a4cef89944053ef322642cde8bc944c4c5c4a4a2f21c;
    stim[21] = 361'h137e55325a7714717d0bf6161fb1b3c869877994b8b45269fd14d6adaad06a5e7853c5a0a261b9931cc733e631b;
    stim[22] = 361'h142324f134929b76cd5a0d96220d5635cdcfee2ea2fe9df561307bede210d90064e934df6e927cdfb05315f37c3;
    stim[23] = 361'h14bf4bd7351e73788603c5bb75520ea1c24b03f7d4563b7d5c41657c067a4991932fa20731aa499c1062e7ce24e;
    stim[24] = 361'h113a19a5dc67f1906e84603366b32631771149c83bfcdcf3fb4d8a33924587f4af22c7f4abad5df9e63257ac0f4;
    stim[25] = 361'h1d88e933133429c94d05e4dd99f203015811414066520a3423176cfd7853a6c095e0b4f64c1a7bad4b243020c14;
    stim[26] = 361'h1202b4701d0b706bb35bfdf38674d358a4b8c1f10157fac7f36aa419e76da1303e55ea12f7f16dfa02e4bcaa389;
    stim[27] = 361'h19ae917bb9d47ddb6ddcc3811e54f84ed765002e0edf65877443fc94b55bffafd14eff328e0aab261c6473c43af;
    stim[28] = 361'h12e1428eb8f896b0226ddc81ac3820ff52037a3f3a002d13bf59bcbb306f1bc07c30a254e192a2a1c85cf468727;
    stim[29] = 361'h1e522c12c9619b3d71bdeebae63753095b10241c91f0bf11ebd59d119c670e963025d4babafe9d1f59cf2d303ae;
    stim[30] = 361'h102db1b7cc074d48d0e6008cf6157a3f6ad9dbc6767998a04aed2ed168d646b0dcf91d98f4970be9bce214c0f36;
    stim[31] = 361'h14b57d921bd0bf429233ea8acef9ac43099f31b46ccdaa3243ed2b926830cdaa70e195152a03d769cc0632d13d8;
    stim[32] = 361'h1ac89ed9d6912ed8bbddc519f2117082744f7579facd626ffb08e9787bfda2a248f4b2b7650b7c8e68b43682992;
    stim[33] = 361'h1370dc80c86810600b2f42d35742ffdd28979c3e57551cb4a41ef7e9749564dc813a7079e54bdb885a9211c2113;
    stim[34] = 361'h1221cd4b5597e02869a1ba7e085cfecd75dcc511b2ecbbb76be65fbeab733fa8f72f254d66694473668cd1d2277;
    stim[35] = 361'h1c55455e5fe0a6abf0b6b15848c1d5c91e511bcb86fb414f2a8c08c676c7234fc545ee04411d3b3d060712bd5e6;
    stim[36] = 361'h1b3a1cb002bd431538b52f3df2faf23afca2b9158b732c6062e8d621f6a2c5fffcd1bcd8b8fd545f7718aef9247;
    stim[37] = 361'h1cff916d4b5333204aaf6f86d519f193b640d448d5d54229d29a929572b9fa84dd66bbddb4b2219925ea28c5eff;
    stim[38] = 361'h1c76e1ae63734c0869bc3afdbaee01303475969789a9d7f011e06227619b9f144850299b318a8285b408a744772;
    stim[39] = 361'h1d150b9a1f39ec536e18630a047a16b4a2815174db6016a73aa4817682e47c226658c80eab7255ef03f5e0700b6;
    stim[40] = 361'h1d2f800d08a563d2dd5b284dff2f81c28a7a46a4cc0059de1299c79f82e484a40842fb2d44ba0e104b7284edd6e;
    stim[41] = 361'h16ca5a28ba9142548d51e75e752ac0462d29e0b57c5f80ca7dd834135918326fa06a0609bc94518cb1b07853dc5;
    stim[42] = 361'h171819f892242f02f2c07d0c2949bd12a05af228636a6c6de0bcd3c2f97928faf46da03040184bcda58c50fdcce;
    stim[43] = 361'h1268dc1846ad9c0a2591be92ff97ac3873acf8bd7f536bd908576e5ef4a92ff80f25148146f5ddda7f3d877a2e6;
    stim[44] = 361'h1eddd8deb948331f50a39d87022a86065dbd2fb8964c2be4ea0bcfae2cf6e267d61e98f418a4e0162fa6ebbb595;
    stim[45] = 361'h1f353b26cfcdc664e0b25967b2e1236f8872d425d5ee8d4371c44bef0312a7532cc82d7f36b41216c90a4d0f014;
    stim[46] = 361'h128b7957cac0f4b9ed1227ca7d21eabdb763709298cee868b6b3854f76e97c238588735125a3bbcd1ec652e65a0;
    stim[47] = 361'h120322b35f17655d57dcd35db4490032f2537715ef4c0b47e85d908f353008761b100564797ed9a0d252b8f950d;
    stim[48] = 361'h1896f2fd76025c98dcd02e5dd88b42b87171c67400405a32aeb7cc4bb354622df5c1427ed89e6cb1592bdbe3b1c;
    stim[49] = 361'h1ec99c1558fdfbbb8d1aa871db036ae889a3f99aabfa873ecbbcf37b9d84779b4341cfc2c26709b366f1e8adb4a;
    stim[50] = 361'h176b99f2b72ee6a1d465c65688d3dd8ade6c17a69d7c2b1b0fe01d1e458dad0bcd3265c89884d4bd1ba25e16547;
    stim[51] = 361'h1b587df6084d803894210ac4172e02209cbc8aa0eb96cad8425b82b553c8e32776ad20a91fef744444f4cef0f49;
    stim[52] = 361'h151bc4bfd88f94bd9e8788db452578bdc9fc050fd3332686752a0cf11bd404d4a2a63685c39d74cf795b7531c74;
    stim[53] = 361'h15c0ca0236ad417afd8a13b6de2ba6bcc38c79f21f809dd9fb598632c3f96a249f450937dcf9c83550ca95c9463;
    stim[54] = 361'h1a815d54667184e32b72d2e230ac82ffc312d9c00839bf43ecc5ef04972a7f3ffc8d8cf51709ad91a9707ba9ab8;
    stim[55] = 361'h165ca11fea0a16ab7ad54505650b51cfe54f65691a3af1b2a496b1afd9f47de69462498bdbf36f7f9237bcf2764;
    stim[56] = 361'h07cc601f90abce6d832f64691561554bc82838f9ba436a7f4716bd8eb90f577bed7967d2aa52ef96e597ddf28c6;
    stim[57] = 361'h1c7f4920f7868f0b4199de4ee4e5b34b8941eed340caeeeb1d380d27bafa27ed2cee817ad5fe51b9e4ab06448ab;
    stim[58] = 361'h114973f203ed865c6e30b483a64f331a5540f0fe73264812540fc4dc3c4dad9eda320074fbf2b2b5a88aec3910d;
    stim[59] = 361'h1c4aa9c6a38917f0d1c0a98fc87fc836b4091ed643d57f7030a968ee656a59a3248987b6ddb9f0b61cc81d8e466;
    stim[60] = 361'h137a2ac98652756590596b5c59b763a375e253ce6d7126ef9c763d59c2ee72877ddc3f97d313c69dc4c9d507995;
    stim[61] = 361'h185a63df69978bb146be40f7720f5046b398e55a2ccef2523ec8176395e26d0e75eac596906bc85670f05a8b9ee;
    stim[62] = 361'h12e569cd004f7787264aecd764af925fa48c13269a7266bca3821bf674abc67cecf115341adab9bac8e7b318833;
    stim[63] = 361'h1b62cb783f1ae12ce75230700d4f518f58654ece71df2806c5019291d8c2c837443cdcfafe7c356567748e8ac17;
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
      expv[0] = 254'h00f0319b3bfd719b3bfd5736fbc1fbacb2970a3bf455716afb276c6d0fe43c04;
      expv[1] = 254'h3000f4d01ed574d01ed57fc230a7d276422a0bbaf8918fab62a8e60aa57b382f;
      expv[2] = 254'h0353c94d09fdc94d09fdc0364079536a60ab04f5715c7a924dfc96680504bc06;
      expv[3] = 254'h0ffcd61f53a8d61f53a8ff113c0261ce3524020ad0500d3611469f659f430c3c;
      expv[4] = 254'h3f0c045693968456939694c6ee4fd98149ae03d5410a8f2d7d458ec2195ae423;
      expv[5] = 254'h0fafed250ee3ad250ee38002837b697db88d07e9ceee397f510377d479a92813;
      expv[6] = 254'h0050e30d2057230d205714d6a286adeea817010c8b1be4bafd218b61407bf82b;
      expv[7] = 254'h0ffc39318a34b9318a34a80fed167a8b6b900685f0e4a87d2e93ef6b11c50028;
      expv[8] = 254'h3f0cdee56506dee56506e82b7bb9f7d789f50bc61afb8d13207dcd01812df81a;
      expv[9] = 254'h03f004f0c56504f0c5650010868f306ee76d01ec3fdbd9ac9a6b122aaa204010;
      expv[10] = 254'h0cf3de57f1ddde57f1ddc3ec7a0a1f190e8b0fd0665a517ee6dffc8f4c28a02a;
      expv[11] = 254'h0f00f340d3697340d3697f29150fa4366a780357a82ab29b358932fb8b3a2c32;
      expv[12] = 254'h30acd1167dbf11167dbf173a42abe84a6acb0284c3047a5c5e42e375862d0402;
      expv[13] = 254'h0c0f009164e5809164e5970b3f1e4aa787230b435a332ffdd29c9550f6713439;
      expv[14] = 254'h0c50f18164f5b18164f5972e9c5a3981c8170208382d597322a0785829589032;
      expv[15] = 254'h0f5f0e0152d64e0152d668fb97dcdb384d240f37e8fab241c87aa659aeab9807;
      expv[16] = 254'h0cac13542cf1d3542cf1e80de6e6c5062abd010325418dea5726cbc93296d81a;
      expv[17] = 254'h3ff015c311fb55c311fb4310e1b25a7250b30c6a5e63aefbda86080cefb73c1d;
      expv[18] = 254'h0fa3e201a57e6201a57e543da43ff673111c07898bb00dbce6f5ef7eebd1b82c;
      expv[19] = 254'h3fafee782fd3ae782fd380d3515d3e6921820049e4b7f36ce37c8d4c58ce240e;
      expv[20] = 254'h0cfc12928bc852928bc87c0376a7026a47f0014d9cad024aa7de644c9b8eb012;
      expv[21] = 254'h00fc31ccf98c71ccf98c6bd3b8a38bffa67103a97168a4bf20d4bcf08b090c25;
      expv[22] = 254'h33a014c57cdf14c57cdf03e494dbb6706645065d45fd3ba921b200c9e9fa9c37;
      expv[23] = 254'h00a018b9f38918b9f3893f28f39bc43e2faa0e6fa8ac76aef4932326447d5026;
      expv[24] = 254'h3f0f0c95eb03cc95eb03d4033f8c83630fd3061077f9b9fd8b0fe95e0fc9743d;
      expv[25] = 254'h0c53c90c0830490c08305439a14e4a6f353a0300cca41401274d812be9e2dc2b;
      expv[26] = 254'h0003392f2a8e392f2a8e28c85b835d9fff4c03e202aff5fddb42607cd42f983c;
      expv[27] = 254'h00fc191cf10e991cf10ebfcea3eedb66014c08dc1dbecb6eb7ff5fa2fe22480a;
      expv[28] = 254'h3c50173d1a1c973d1a1c97c7c4b5810ee10000fe74005a77de3780f844c88829;
      expv[29] = 254'h0cf0f3cb4c0eb3cb4c0ebf2b0cd9eb8f6ec7033923e17e39ce1d2c60292de407;
      expv[30] = 254'h33fc3885303cf885303cd7003a6a469000c50a0cecf33108ac8d61b9bb0ea039;
      expv[31] = 254'h3c5c018cb44f418cb44f683e85fa149f42d90ce8d99b5449e19b54e1aa581419;
      expv[32] = 254'h0f502d0da0a66d0da0a643148976c5ce25c10073f59ac4fd7b454491e57a5c22;
      expv[33] = 254'h0cf3248470846484708443c34083005a17ea0ffcaeaa39122ac9b902609a5420;
      expv[34] = 254'h0f0f23347489e3347489d7ccbf01434dde0c0ea365d97769e67f51ee4adb501d;
      expv[35] = 254'h000f01c4af5781c4af57973f05355f95949905970df682e00e469f8adc40ec0f;
      expv[36] = 254'h0fafc62bbe49062bbe4917d5ea18a9c96dda022b16e65888c58bfff9f98df417;
      expv[37] = 254'h030cfa8a317bfa8a317bfffa9999025b62a10111abaa843c73f509baf7df8825;
      expv[38] = 254'h33ac0229d11dc229d11dc33b9a604341dd5e012f1353af85b73e2890d33c4023;
      expv[39] = 254'h0003fd781c02fd781c02d739cf629b63020a0669b6c02d6448f844cc9069943b;
      expv[40] = 254'h0c53dca13b759ca13b75bf252b1e96f951e701c99800b3c449094810f653c004;
      expv[41] = 254'h33a0ec1e14f72c1e14f714f48a12a46f36a200eaf8bf01cfb064df408c1eb422;
      expv[42] = 254'h330ce3143f7323143f733f3121781783e0290d50c6d4d8b87251f5e8c000d033;
      expv[43] = 254'h0fffcf61de8b8f61de8b97156ce0512de6f70c7afea6d7a0d25ff01e2913b434;
      expv[44] = 254'h035fe9baeed669baeed654ea4198fa9ce34206712c9857986dc4cfac31c53806;
      expv[45] = 254'h3c50c29343c0429343c0543e6e332712db5903cbabdd1aeda54ea659daffa406;
      expv[46] = 254'h00ff3194b996b194b996801607a5cf7132a10a25319dd09652f8470b669b0c33;
      expv[47] = 254'h3ca314ae3e5414ae3e543cd8bb2aeaa69509002bde9816f8e010ec360acdf428;
      expv[48] = 254'h0cf0caf6f8ec4af6f8ec7c1012e4c6e1759302680080b45228c45beb84e4f82d;
      expv[49] = 254'h0f0f3c7a2b6d3c7a2b6d2b27efdddc755de30ab557f50e5908ef36869fa1202d;
      expv[50] = 254'h00f3e89785952897859517f977350eae361b0d4d3af856639b5a179a4b84342f;
      expv[51] = 254'h0c0c3d33bc3d3d33bc3d28c26c01c4a850660241d72d958891c64eed41177c12;
      expv[52] = 254'h0ff0d6dd4c71d6dd4c71d4247ca5ecfc57a5081fa6664d4f2809a9456d50fc33;
      expv[53] = 254'h0ca032a57251b2a5725183f56a0bd7f08ec306643f013bbdf2d4493e9277d00f;
      expv[54] = 254'h3350dc1eea6adc1eea6ae8138c2719569a14028010737efad4fe7ff919d64825;
      expv[55] = 254'h30a30def3c9d8def3c9d943050b55bca21a301d23475e35268fbcd289335981f;
      expv[56] = 254'h3f0ce5f77ca325f77ca317255e736c1b392905f37486d4eb1eaef7dacfa89826;
      expv[57] = 254'h3f0c2ac19122aac19122abfc34785a0ef29d03a68195dde7744fda5982a7f42d;
      expv[58] = 254'h335022bb0e4422bb0e443cdf6c32e365a34f037ce64c904e1b5b3db400cd8c2f;
      expv[59] = 254'h00fc32076391b2076391973c48bf8685438f082c87aafe8454b346490f67dc2e;
      expv[60] = 254'h3c0c327541e6727541e654d293ab2c8b54b7031cdae24df6dce50efbff749027;
      expv[61] = 254'h0fa03c16a2e7bc16a2e7bf0cbc5d8a321fc700b4599de4c6c4da1ceb8b655016;
      expv[62] = 254'h3c5039ecc620f9ecc620c3c27bbc3937779702cd34e4cd11578cf9d9aa44cc2c;
      expv[63] = 254'h0f0fdd23a2b05d23a2b057d8d70967319c2f011ce3be505b05906e8839afec1b;
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
