// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 253;
  localparam OW = 254;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01320 dut (
    .aclk(clk),
    .aresetn(in_vec[252:252]),
    .s_axi_awid(in_vec[251:240]),
    .s_axi_awaddr(in_vec[239:208]),
    .s_axi_awlen(in_vec[207:204]),
    .s_axi_awsize(in_vec[203:201]),
    .s_axi_awburst(in_vec[200:199]),
    .s_axi_awlock(in_vec[198:197]),
    .s_axi_awcache(in_vec[196:193]),
    .s_axi_awprot(in_vec[192:190]),
    .s_axi_awqos(in_vec[189:186]),
    .s_axi_awvalid(in_vec[185:185]),
    .s_axi_wid(in_vec[184:173]),
    .s_axi_wdata(in_vec[172:141]),
    .s_axi_wstrb(in_vec[140:137]),
    .s_axi_wlast(in_vec[136:136]),
    .s_axi_wvalid(in_vec[135:135]),
    .s_axi_bready(in_vec[134:134]),
    .s_axi_arid(in_vec[133:122]),
    .s_axi_araddr(in_vec[121:90]),
    .s_axi_arlen(in_vec[89:86]),
    .s_axi_arsize(in_vec[85:83]),
    .s_axi_arburst(in_vec[82:81]),
    .s_axi_arlock(in_vec[80:79]),
    .s_axi_arcache(in_vec[78:75]),
    .s_axi_arprot(in_vec[74:72]),
    .s_axi_arqos(in_vec[71:68]),
    .s_axi_arvalid(in_vec[67:67]),
    .s_axi_rready(in_vec[66:66]),
    .m_axi_awready(in_vec[65:65]),
    .m_axi_wready(in_vec[64:64]),
    .m_axi_bid(in_vec[63:52]),
    .m_axi_bresp(in_vec[51:50]),
    .m_axi_bvalid(in_vec[49:49]),
    .m_axi_arready(in_vec[48:48]),
    .m_axi_rid(in_vec[47:36]),
    .m_axi_rdata(in_vec[35:4]),
    .m_axi_rresp(in_vec[3:2]),
    .m_axi_rlast(in_vec[1:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[253:253]),
    .s_axi_wready(out_vec[252:252]),
    .s_axi_bid(out_vec[251:240]),
    .s_axi_bresp(out_vec[239:238]),
    .s_axi_bvalid(out_vec[237:237]),
    .s_axi_arready(out_vec[236:236]),
    .s_axi_rid(out_vec[235:224]),
    .s_axi_rdata(out_vec[223:192]),
    .s_axi_rresp(out_vec[191:190]),
    .s_axi_rlast(out_vec[189:189]),
    .s_axi_rvalid(out_vec[188:188]),
    .m_axi_awid(out_vec[187:176]),
    .m_axi_awaddr(out_vec[175:144]),
    .m_axi_awlen(out_vec[143:136]),
    .m_axi_awsize(out_vec[135:133]),
    .m_axi_awburst(out_vec[132:131]),
    .m_axi_awlock(out_vec[130:130]),
    .m_axi_awcache(out_vec[129:126]),
    .m_axi_awprot(out_vec[125:123]),
    .m_axi_awregion(out_vec[122:119]),
    .m_axi_awqos(out_vec[118:115]),
    .m_axi_awvalid(out_vec[114:114]),
    .m_axi_wdata(out_vec[113:82]),
    .m_axi_wstrb(out_vec[81:78]),
    .m_axi_wlast(out_vec[77:77]),
    .m_axi_wvalid(out_vec[76:76]),
    .m_axi_bready(out_vec[75:75]),
    .m_axi_arid(out_vec[74:63]),
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
    stim[0] = 253'h0f8cb531cb87e446dbbcbed5d726b520d108849581e17357145563d93f4feb30;
    stim[1] = 253'h0b8986a6d5d95da34f94b15cdf1ac3775a2a8160163c2ad6a9e78d1556dcfce1;
    stim[2] = 253'h1254a5580593dbb611bff92ada1320437572feaeb443d912df7ef7797d04b9a1;
    stim[3] = 253'h100604aa24fbcedaabf333a6f0d814c80020f07bd18022e45feb94f69bdd91c5;
    stim[4] = 253'h1bcd2fe124f6e4eedc12a53c9e7c6eb11f666cdcfbb85ce2075fe6689629f89a;
    stim[5] = 253'h1b14fd8676fa4db12a773d9a3d175a702decb12babb4475be28f59336bbc2592;
    stim[6] = 253'h1143ad7aff7724dc572c284270b1d4609f7b50eaa669c836e6d3f1fe193ca2c9;
    stim[7] = 253'h1fa26933104865f4a37d677a55fcfbd37b80f3328e741840fbb42803afcb60d6;
    stim[8] = 253'h19e968677dafc3c56e6347257169fe35822c42f5738b2bb400f6be14013111ed;
    stim[9] = 253'h1e9f9cfc6f4a981aa5e41faf7c354c37b7f966c8024ffebfce0aee69840edc3e;
    stim[10] = 253'h1bd65f87d0ccbeba00aaeb06f359543d33a2127c97147f3d563bfe7280046157;
    stim[11] = 253'h1367a97b202f9a593811f0485e185bc1f3254b98a15a1a791504a9ff163cb2fb;
    stim[12] = 253'h11b9ead744d9cec2eb708db210406fc56f79b36c0f4b21ecb0f13527258fe001;
    stim[13] = 253'h1b87bad68fc9515179f476634a94c7d6f78aa9825757fa881f7e338846423de7;
    stim[14] = 253'h185e469995f421bc44493b86f57515ab05000bc3d7931bdc237dc43cac12c532;
    stim[15] = 253'h18d76dd0c06dd365e0f4fe90041ced083d269b1a88c1715a226d851e7fddbb6b;
    stim[16] = 253'h1e153101cb51d4eeddb3698dd8d3481d6d8d929ea8ea20545571289a4e629fdc;
    stim[17] = 253'h11fd141efb4c846ca3f3abe2fa579461d732368401401bc3bf149825721cd41b;
    stim[18] = 253'h1c3a59aea7e36c1d4f793dffff77d9628ec9a8f900bf82ea1bd2d508c9a5ce14;
    stim[19] = 253'h1c317887cb40ce94e037d99a36753db3f8b608a3407710231de6e26a6af0412e;
    stim[20] = 253'h1337df4eb73a444a88cccf0ece24021eafa71dc345a67d7ef80645624aa4bcf6;
    stim[21] = 253'h16a2a9cc63aad3d1c156f6d82a8bbfca08cc1f0121e561bb14c3eddff4061db2;
    stim[22] = 253'h1830799787a45d99289a689c5ea15fa5aa574b57771388c60ee908f20438b593;
    stim[23] = 253'h1a2cc01568b58d437cf21cda8d3f7844ed051736783e57138e6a1a4fd6fdf5b0;
    stim[24] = 253'h1f7d3fabfe0c2f72f157eaaeffa5cb2b334accb930417912bb4ea49382245cdb;
    stim[25] = 253'h1a69453f3778a7181ba3a4b3188241cad4e2711f31a6ef80efc5c5e02d5126f1;
    stim[26] = 253'h17418aa5d9813cf0d9bd28a074b5b591e5a76088ac8ab27eca027225e344b6d5;
    stim[27] = 253'h1f47fc6150d8ca6329f68c0d534524ac5ba2a3ecfa2ae72c1d2c6d95c1674f7e;
    stim[28] = 253'h1564b01be7cd002ac1e2d1fd7f2b6d1a62d13260e21548d13a5c68f16c81d66b;
    stim[29] = 253'h1a56f8c8f19750375c1a77b3b56ba37f3b712076e83608597427af123f65c93a;
    stim[30] = 253'h1e676ee3253b3506cd9263c9fb978f620b441f951b44e646458e5b5f7a7490c8;
    stim[31] = 253'h19277effb96dc61d24eec477a6e3c1eb5e65c8ee8be60cf3c368fa3c84531f9d;
    stim[32] = 253'h144279e8752c15095dc3b61c27c70d30658ca40fc86972e5851f61fa39bbdfbc;
    stim[33] = 253'h183db94b55f7f39b30c49e286ee5a1565321bc45b0e537363d03ecd4c93e79ca;
    stim[34] = 253'h1db37cafae1052da3cae49a5c49d0b54f25252ce753fa03e2d0a059b763820a4;
    stim[35] = 253'h1f0c6a1dd7793e279e65fe1e984a01240dc6f36a89fde0b5953b3b55f07a6689;
    stim[36] = 253'h1e7206a065fd94d11c96252652dc9f900372226ed66597630bc8de5f7f0a1dfc;
    stim[37] = 253'h1d1c337d3573119e93cdaac0db2dcfb3408b9966a7f6dfd75ad5e142b0485a0f;
    stim[38] = 253'h1c7b2b66408319d46cc49665e610c0157984510f7efdee509746237457b88594;
    stim[39] = 253'h1a30d8d720359529d7f5ac15499b2b7265de3b6a7f159b73b0ea73e14648bcd4;
    stim[40] = 253'h1d21ee1c12c037aa1ff5f6bad27d90a094eb6a945c1fcb10dd7e08614832a404;
    stim[41] = 253'h1622b9750d73e8d2691e18db549ca84bc9d094e58ae26dab44e1bc420e4a3a96;
    stim[42] = 253'h19a4e9e919e13471994463118dc32340a3cc6078fddcdd214d5f953b2b95d6f9;
    stim[43] = 253'h132621580d98985083883f5114ce0f5d35877a993d4658abdb76d2a2155c87f3;
    stim[44] = 253'h18d5c569939f16de060e5a18ae292fd9cecbd7c019cdb86b4b7dff560a5878b1;
    stim[45] = 253'h1145fcb053faa4c90cbd943a0e2fd27670f9bd19534a7aa505bc56d59adaaa81;
    stim[46] = 253'h1b62e9f2dd81c6b4d4cc159a1f0914c9a38378b57d7617f09f24d80f6f4f6eeb;
    stim[47] = 253'h1666b643440d94cdbf1f4af97305f01e5527c44f823235aa484f7672f68dc180;
    stim[48] = 253'h19ace5c9f717f3d81f928cc080616223997b4640bcf3c0e1b4e8e39ee001981f;
    stim[49] = 253'h18df778fd32f926675de8ef26d7c51818feb98cbac4e1d8d6354c164879082e4;
    stim[50] = 253'h1b87d1869251f4bd105256518e3b75faca296b959ec9a3321e6ca1719973307c;
    stim[51] = 253'h10174c93202d50ca4344a3b61adb15d7f68b3ff72c2625e6ab5ebb520abae392;
    stim[52] = 253'h18c826b481b90e2f960599ef21150f24ab3669808bc27b4dbd8d0050dbb39abb;
    stim[53] = 253'h1fd7c420182ab478677bc167cb869a5c72ce083eb3d70c196f65a901d91f89da;
    stim[54] = 253'h165a5eb1b8cd347204fb81fd834ecfe95cd9705d8231dc58156c88b529472775;
    stim[55] = 253'h1917886b65652d5820fec0f94c358492e3db4fa30845c111c4c5c54850512a5c;
    stim[56] = 253'h1d8680d2b3e57295a57e87234354628d74eb61c85ae57a04f8f6757ec9ddba0a;
    stim[57] = 253'h1a0ae2c86848f3fca6a6c24a11a86d7ebc7f0bcf0fe935ec201071b2a29973d8;
    stim[58] = 253'h14bbe30dbdf4be97b08b2aa67f4e9c26555d6579e706a0a2fdb229e9b8219c04;
    stim[59] = 253'h14322f486d5e1aa09a2047b18921c0aa62e0a770a363af485e1ba7e34e8c61d5;
    stim[60] = 253'h1c9259b222ebca56a750c683a2dba95eed27b39221da7dfa3ea56027606df846;
    stim[61] = 253'h188606fbf3b0d98eee29bf5a891c320148b512325a5ad72a7692a27958bc34a5;
    stim[62] = 253'h1a00e167e3ab9e3462e98272fb1a90e988533cd193f67b9bd2e86131cebcab2b;
    stim[63] = 253'h106a03f7cc73ab6d4f76c46f41bdc8bb59e702281bc15bbaab61615369dd62c7;
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
      expv[0] = 254'h00000000000000000f8cb531cb870e40d837dabae4d6a41a211092b003c1cc15;
      expv[1] = 254'h00000000000000000b8986a6d5d905dc681e2b9be3586eeb45502c028478a835;
      expv[2] = 254'h00000000000000000254a55805930dbec023255b4264086eae5fd5d680876404;
      expv[3] = 254'h0254200000000000000604aa24fb0ceb505674de1b029900041e0f7a03008839;
      expv[4] = 254'h32540000000000000bcd2fe124f60e4dd838a793cf8dd623eccd9b9f07717038;
      expv[5] = 254'h02540000000000000b14fd8676fa04de2057b347a2eb4e05bd96257507691c16;
      expv[6] = 254'h2b143000000000000143ad7aff77024b882d084e163a8c13ef6a1d5484d3200d;
      expv[7] = 254'h0b140000000000000fa269331048065e9044ef4abf9f7a6f701e665184e86010;
      expv[8] = 254'h3fa220000000000009e968677daf0c38a85ce4ae2d3fc6b045885eae0714ac2d;
      expv[9] = 254'h0fa22000000000000e9f9cfc6f4a0983504bf5ef86a986f6ff2cd900049ff82f;
      expv[10] = 254'h0fa23000000000000bd65f87d0cc0bef400160de6b2a87a674424f928629fc0f;
      expv[11] = 254'h0fa22f4cdeadbeef3367a97b202f09a32072090bc30b783e64a9731402b4681e;
      expv[12] = 254'h1fa21f4cdeadbeef31b9ead744d90ce85855b642080df8adef366d818694843b;
      expv[13] = 254'h21b9215bdeadbeef3b87bad68fc905122872cc695298fadef155304a86afe822;
      expv[14] = 254'h11b9115bdeadbeef385e469995f4021f880b70deaea2b560a001787a87246c37;
      expv[15] = 254'h01b90ac1deadbeef38d76dd0c06d0d34b843d200839da107a4d363510181c416;
      expv[16] = 254'h01b91ac1deadbeef3e153101cb510d4dd83931bb1a6903adb1b253d501d48015;
      expv[17] = 254'h01b90ac1deadbeef01fd141efb4c084590457c5f4af28c3ae646d08002806c30;
      expv[18] = 254'h21fd2ac1deadbeef0c3a59aea7e306c3a81fbfffeefb2c51d9351f20017e083a;
      expv[19] = 254'h01fd1ac1deadbeef0c317887cb400cea98433346cea7b67f16c1146800ec4008;
      expv[20] = 254'h11fd0ac1deadbeef0337df4eb73a04415011e1d9c48043d5f4e3b868834df41f;
      expv[21] = 254'h01fd1ac1deadbeef06a2a9cc63aa0d3a3802db055177f9411983e02403c9842e;
      expv[22] = 254'h16a22282deadbeef3830799787a405db2051138bd42bf4b54ae96aee86262031;
      expv[23] = 254'h06a22282deadbeef0a2cc01568b508d0687b9b51a7ef089da0a2e6cf007d5c04;
      expv[24] = 254'h06a20282deadbeef0f7d3fabfe0c02f6586155dff4b96566695997260081e404;
      expv[25] = 254'h06a20282deadbeef0a69453f37780a73003496631048395a9c4e23e6034fbc20;
      expv[26] = 254'h3a692282deadbeef07418aa5d98103ce1831140e96b6b23cb4ec11158116c81f;
      expv[27] = 254'h0a693282deadbeef0f47fc6150d80ca4605181aa68a4958b74547d9f04579c0b;
      expv[28] = 254'h1a692b16deadbeef3564b01be7cd000558023fafe56da34c5a264c1c04292034;
      expv[29] = 254'h0a692b16deadbeef3a56f8c8f1970506e83af676ad746fe76e240edd006c2016;
      expv[30] = 254'h0a691b16deadbeef3e676ee3253b0350d818793f72f1ec416883f2a3068b9811;
      expv[31] = 254'h0e672b16deadbeef09277effb96d0c63a0488ef4dc783d6bccb91dd107cc303c;
      expv[32] = 254'h1e670b16deadbeef044279e8752c0151283ac384f8e1a60cb19481f900d1c839;
      expv[33] = 254'h0e670b16deadbeef083db94b55f70f3b6063c50ddcb42aca643788b601c8dc0d;
      expv[34] = 254'h083d2b16deadbeef0db37cafae10052b407934b893a16a9e4a4a59ce827e800f;
      expv[35] = 254'h083d1b16deadbeef0f0c6a1dd77903e4f03fc3d309402481b8de6d5103fb802d;
      expv[36] = 254'h283d0b16deadbeef0e7206a065fd094a2038a4ca5b93f2006e444dda84ca5c18;
      expv[37] = 254'h183d0b16deadbeef0d1c337d3573011bd025581b65b9f66811732cd487ef7c35;
      expv[38] = 254'h283d0b16deadbeef0c7b2b664083019a885accbcc21802af308a21ef85fbb814;
      expv[39] = 254'h083d0b16deadbeef0a30d8d720350955382d82a933656e4cbbc76d4f862a6c1c;
      expv[40] = 254'h2a302b16deadbeef0d21ee1c12c0037d403ed75a4fb214129d6d528b803f2c04;
      expv[41] = 254'h1a302b16deadbeef0622b9750d730e8a48531b6a939509793a129cb105c5b42a;
      expv[42] = 254'h0a301b16deadbeef09a4e9e919e1034630306231b8646814798c0f1f83bb7408;
      expv[43] = 254'h09a42b16deadbeef032621580d9809821007ea2299c1eba6b0ef5327828d602a;
      expv[44] = 254'h29a41b16deadbeef08d5c569939f016bc00f4315c525fb39d97af803039ae01a;
      expv[45] = 254'h18d52673deadbeef3145fcb053fa0a49201a8741c5fa4ece1f37a32a0695e829;
      expv[46] = 254'h08d50673deadbeef0b62e9f2dd810c6e982ab343e1229934706f16af82ec5c3c;
      expv[47] = 254'h1b622673deadbeef0666b643440d0949b07d5f2e60be03caa4f889f00464d42a;
      expv[48] = 254'h2b623673deadbeef09ace5c9f7170f3b003d98100c2c44732f68c81781e70038;
      expv[49] = 254'h0b622673deadbeef08df778fd32f0924c869de4daf8a3031fd731975809c7423;
      expv[50] = 254'h1b623673deadbeef0b87d18692510f4fa022ca31c76ebf59452d72b385928c0c;
      expv[51] = 254'h0b620673deadbeef00174c93202d0509480476c35b62bafed167fee5804c9439;
      expv[52] = 254'h30172673deadbeef08c826b481b900e5f02f3de422a1e49566cd30110785ec13;
      expv[53] = 254'h00173673deadbeef0fd7c420182a0b47084c2cf970d34b8e59c107d607ac3006;
      expv[54] = 254'h2017071cdeadbeef365a5eb1b8cd034640083fb069d9fd2b9b2e0bb004637016;
      expv[55] = 254'h165a371cdeadbeef3917886b656502d300401f2986b0925c7b69f461008b0404;
      expv[56] = 254'h065a271cdeadbeef3d8680d2b3e5072ab048e4686a8c51ae9d6c390b05c9e801;
      expv[57] = 254'h165a271cdeadbeef0a0ae2c868480f3f904c4942350dafd78fe179e187d0d43b;
      expv[58] = 254'h265a171cdeadbeef04bbe30dbdf40beaf06154cfe9d384caabacaf3c860e8028;
      expv[59] = 254'h065a071cdeadbeef04322f486d5e01ac1034f6312438154c5c14ee1406c6bc12;
      expv[60] = 254'h365a171cdeadbeef0c9259b222eb0ca2d04cd0745b752bdda4f6724403b5f43e;
      expv[61] = 254'h0c9227bbdeadbeef388606fbf3b00d99d85feb512386402916a2464b04b75c0a;
      expv[62] = 254'h2c9237bbdeadbeef3a00e167e3ab09e688444e5f63521d310a679a3207edec26;
      expv[63] = 254'h1c920a62deadbeef306a03f7cc730ab5a81c8de837b9176b3ce0450307816c2e;
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
