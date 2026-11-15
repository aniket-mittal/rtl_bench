// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 385;
  localparam OW = 720;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03612 dut (
    .aclk(clk),
    .aresetn(in_vec[384:384]),
    .s_axi_awaddr(in_vec[383:359]),
    .s_axi_awprot(in_vec[358:356]),
    .s_axi_awvalid(in_vec[355:355]),
    .s_axi_wdata(in_vec[354:323]),
    .s_axi_wstrb(in_vec[322:319]),
    .s_axi_wvalid(in_vec[318:318]),
    .s_axi_bready(in_vec[317:317]),
    .s_axi_araddr(in_vec[316:292]),
    .s_axi_arprot(in_vec[291:289]),
    .s_axi_arvalid(in_vec[288:288]),
    .s_axi_rready(in_vec[287:287]),
    .m_axi_awready(in_vec[286:280]),
    .m_axi_wready(in_vec[279:273]),
    .m_axi_bresp(in_vec[272:259]),
    .m_axi_bvalid(in_vec[258:252]),
    .m_axi_arready(in_vec[251:245]),
    .m_axi_rdata(in_vec[244:21]),
    .m_axi_rresp(in_vec[20:7]),
    .m_axi_rvalid(in_vec[6:0]),
    .s_axi_awready(out_vec[719:719]),
    .s_axi_wready(out_vec[718:718]),
    .s_axi_bresp(out_vec[717:716]),
    .s_axi_bvalid(out_vec[715:715]),
    .s_axi_arready(out_vec[714:714]),
    .s_axi_rdata(out_vec[713:682]),
    .s_axi_rresp(out_vec[681:680]),
    .s_axi_rvalid(out_vec[679:679]),
    .m_axi_awaddr(out_vec[678:504]),
    .m_axi_awprot(out_vec[503:483]),
    .m_axi_awvalid(out_vec[482:476]),
    .m_axi_wdata(out_vec[475:252]),
    .m_axi_wstrb(out_vec[251:224]),
    .m_axi_wvalid(out_vec[223:217]),
    .m_axi_bready(out_vec[216:210]),
    .m_axi_araddr(out_vec[209:35]),
    .m_axi_arprot(out_vec[34:14]),
    .m_axi_arvalid(out_vec[13:7]),
    .m_axi_rready(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 385'h0e1d2044c1c4df376db65fe96914f23a7c986ccb4bee2d72b1c7ac0270aaf273870aac58c277b77dd890295fd1be192e1;
    stim[1] = 385'h0e94b0a0234c95abc7773ac420b3a136639b1cac74f8d4d251961563424ae62b9349ab535db8a7a648993d2665a869457;
    stim[2] = 385'h1f25e9818c23292072e05c258bef78cdb8e672f8d2fbb87490291314316e4483d68ce683a9d4f1a1f6e613092c2214270;
    stim[3] = 385'h15d1f9b98100c68e9e41c79969c1cad0e6bae57d21ac889df2a7de6ed4efd68ef49794be99f02655268ce147292f811a6;
    stim[4] = 385'h17e8f091a83d9e031278b2b13d54e39978688f74d55341d144bd5c8658c58823c36997bd012b9601b6c8274a8a2cdc2c3;
    stim[5] = 385'h1110382cc75e0fe77654564997798d504813639c365233633e2dc3b174753dfd5e34db7dfaac0367069d55368673d7af3;
    stim[6] = 385'h1b00d5220676bbdd85fcee6e5aa8151afad0554da1a2c7cc8574c2b228a0268d39b0fb5bc0f0e3b129f70b2f80cc12d8f;
    stim[7] = 385'h1816c8435d4436ec70ed3f58a5e1c61fe55b8f3455a25523ba271664597adb4517d2b5580691574c868ba6f9abe644888;
    stim[8] = 385'h11cd306c63b07df4610b46109123af2f2740a050999038dc75baff80ab6ffdbf473a820615ba4f62a0b15c73e59c0eb28;
    stim[9] = 385'h1a9584c5e01d9fe23d04c33cb9de11abbdfedd7cddac2d2755c5bff33a00fa2172309e033c1267b12ff2109d4f103d213;
    stim[10] = 385'h1c8b9376a8b061d14ecf1bb8f1b4c2879507366a6c70667388b433eb61b03edfc545cb0639a6ce15b7c2e7fce0abc234b;
    stim[11] = 385'h1b2b1d59e9183a05f62e1e86ed53df8ecb1285aa661700ca043361f2fc262977c686182561476945a696175cac7a09cc2;
    stim[12] = 385'h1e39f7c10bed8608e3fdef17540c6e96229696afd1997aaf4a9524032bae0c549f9eb3ee10ff907999e2a32e9bd3cb733;
    stim[13] = 385'h1a3cf8566ab0420ded8667eb9975a3fdc9ab088e736f3b71bfa6a3b0c708ced2fe48145eb6bfb7b435407bd856ad512e4;
    stim[14] = 385'h157a21970a7229b830a7a22cb720d2a2ec9eb53819ae6a08b75b1fe8a8db2e97fc0f26011dcae5a29239906693ef99c11;
    stim[15] = 385'h15d69f4b1299a73e45b2fca8f9529b26c7c34efd9c5529c5eb4a5c3620d4efe45705f55db3bf2096c8ef2d8d100011b43;
    stim[16] = 385'h1083ce2964f80af4da3d0d158362e97b3fdffcbaa1d23307017cb0631000d050f8b2c6efd9cf3c4f719d75f9ce59e65ea;
    stim[17] = 385'h17e6a50f45dfbacfae8e82e2c5169c65ce5225d5a0bd884c144c5f3715f47fb4d03b5a4afeef93a8ac983de75b69edf18;
    stim[18] = 385'h1b5720f4bed6e71ef123a01b4cf7edc764e9234455c0092ae0388fc7ffe6659ccbd8d89efacc4a5c729eb1f1e81be749e;
    stim[19] = 385'h14bbd8db772def144237f7a7d7171c5b00e4f11c889b92592527a3266fae9ddbdac3533b66521519867bc4bc6b02fd1dc;
    stim[20] = 385'h17855731d1854954fce955a1eda7061027d447d786964593d55befdda79427344ef03a62ff5748fc93d2c9919d5193f0f;
    stim[21] = 385'h1ed77775e367b9cfe1fa82427709e357982012d8eac5c45a18cb30f28466c834dbb9a1e44e4257fc5b281fb871ac243f1;
    stim[22] = 385'h1464692de64de9e1fec7aeb75e51c4bc530f104e1dfcff3916de0c84e5998210680ae0f4c603301835785707960a8ca01;
    stim[23] = 385'h06d9432370d2134988ba6ed2e49ad88fbbdf6d3732c1ef2ae86453fe64092765f9316f17d20b726888b606368b3e043f9;
    stim[24] = 385'h16e154fc6d826926aef604dcfb244c05e57d22cb34df3dc602c5c872af1b5a5df367f686cac45186df8e7d28416f911b0;
    stim[25] = 385'h16b24e4270bf8ec6e020e5dbb2ca3e0269a8157196f62924a5876f59e1e706521373915e092c55a76c892be60aa585674;
    stim[26] = 385'h19617b94f4d619388655c51ae047c937f3546006bc354a99661fe8b2d99faa973df40fb269fc76a216c38ff84da3b674c;
    stim[27] = 385'h1accf48d492ad33646c0ed4608b76040679c328b289b367cb5dea1d953252529d9207cb84f7896b335c18b7b883df219a;
    stim[28] = 385'h16f8167b57f08689ffaab26c94224663d5534af318389edddbc51f19284a1df409ac670fca339aaf813cfce14efbd8cf2;
    stim[29] = 385'h168d365a296e2b71a4e18dcd2fd5f3ec7fed0fcb4145e0767ca276b50cb9b59b8719f1eaca15a4c58763c84d7d8436455;
    stim[30] = 385'h1b0c1b69b2755c78885eec68daafcf0095ae862492fa2310e9599885348765bd2129399f11356667fc2a84b4da9bd72f1;
    stim[31] = 385'h1aedeaebb1af392847de889d5768ac39f60c377a50d18acb7227b9c23b4b29965b649b1c09b732b3058dd05fa9a970572;
    stim[32] = 385'h1fd16d783e91d44b3c899f8bfe9d306d522564740f937e56b2782636bb1ccc4ec909d2fd13d48f4c8c3581103aa12b18c;
    stim[33] = 385'h133d3f3decea10e4d011e6beb7ff9b71e28344d8f111b5559dbd276c5e18c298097695e0613068cfa49082fff1c7fc673;
    stim[34] = 385'h1a4b15d6d92ec6ffe39000b3cd4b63988079afd69ea211b77bc8db2942bb7a9f18c1348ed7bbb2bdb5bf5a6f7c97bd0a2;
    stim[35] = 385'h0fff4e531dcf19312a47f9860b4944a80a458205d357c10a76fef6c26eda43617a06563cf8eb033f21eb7576e21f00a48;
    stim[36] = 385'h158889632a710dfbf46ac5ef43a6ea435b6a30993043784708fc307e2dfd536c15d1277c3961c25820ccf98a4550bbde7;
    stim[37] = 385'h16febbd92c88f612af2af26e50f5a925376f81fd87f8b925a80cc2e6ad62d02264ec996dbbeded7d8664fafea0efecc40;
    stim[38] = 385'h1471224fa98b436e84ab0b78694cde3b3e4d794dfb9a8f944485ad14eab71ed67f0d11360e317b54278e5d42bb763b271;
    stim[39] = 385'h17ce7f6d4064619b0f3b7ab580fbeb09fabe781d797c2d757611413d319ac6ff334a8cc8899dd09c8209de7e358dc5b7e;
    stim[40] = 385'h19a16c6f1c5382508a6bb449735c3e3eb6c8c0a2ec4fa9263f27fa58231e1b38057e2e2808df3eb01f482ab97a13b8fca;
    stim[41] = 385'h199781c6a2fdc444e10a6da34f8dfbe53c89d742ae90ac6859741e62e1c9ca33a84a5dd616343b5d3f7a38daacd4fc043;
    stim[42] = 385'h13fa8baa7c8f739dedc19821da0745724e2ae077c52c1d0e4e0a48ce416c86138f8113d015aa9a8bfc63d4a1cb7472862;
    stim[43] = 385'h1895ce406a476537ca0b71fbf3a69d0e257646500ff74e8e5fa4a025ad2eb3e992b14da9da38445c0fa7b20140d992383;
    stim[44] = 385'h11d37168fff4d2eae4058547e7bd15b252fcea778d89dbb84b52b1a9d87fff2ff560e4028d177c32c8560be6c9686e3df;
    stim[45] = 385'h12af5506ef89333c55d0f676cf2193fae48a06f4b1c1e8b53c3792eb386f54979f485443428f1ef3a97ca464c16f94911;
    stim[46] = 385'h1a2067dd3fe6173a8f6d0d03a9f92425db1c24c0e47dab5f1e4a280949dca239a408ae277e179e9b7f327ce95dbe4fa22;
    stim[47] = 385'h19dca2d9d0dc966972ef2f4e1164204d807238e967282917c06d420706edb09c50fe2c5dfce45557123e149a04466e785;
    stim[48] = 385'h1e7b6009b3d1ba6c80bd299da83456c78285f0cd4feb8cd222840b1bec5e32520e4dbcfaa5d1b02108f2eea10876c08b1;
    stim[49] = 385'h1f83f372793701b429f607634db74203ab2a141673456279f5b1379ee258a285e365542c9a011b49c6bf0ff4645aaf909;
    stim[50] = 385'h1f4af365afc15c460bce5fca17cc8b1f0c0b8eedcd73dc51253b8b474b1ff0126aa91352b22515a1ace3560629aa38826;
    stim[51] = 385'h104fc0da939e183035f8dcf34e1c9a3dfb227854c162802b409b4564edf3bb271199f7050c367c0008a8a0dda2a0738db;
    stim[52] = 385'h1eb0127d5c712afd638c33fa7de7fd03e290a5c5527740a36ff86610a62c4ba96ef6183366d83a8411e3aec109e2b720a;
    stim[53] = 385'h1209815bceffd191ed83c73301fe42456a691fc6ab9304bda75413b49a7bbc2fa4c8ff40e94232659253fddb3692dcf33;
    stim[54] = 385'h1b79af77040f23c1115a962ae8cbd08d5d073e039b399ea1d62936854e4846731dc373a36b283a39bbb46430b7dbda526;
    stim[55] = 385'h1d7507258ea548e545c445d8b60e05721e4bc4b053bc27be7898658dae3fa993cd5e9c146c104fbc7201de924d87450dc;
    stim[56] = 385'h16f3bb54e1b7e7ead0dcb2aecda078cd9caf14541325774687a1198bf80675b0f48fbe67c58f3f0d3a8d862b57d00f7b2;
    stim[57] = 385'h1cf3090fff3fea382e857809e63a93fd7594689837261a6b73b48c91033787b3456214e20dcf8001db3d96e7c3e3d1f12;
    stim[58] = 385'h1841c748eaf5a076ba7b49e7319c1fc42e635a4b9921ee4cb6aff7c42ace4b153387c6afad446c51e3413ec41ddeae917;
    stim[59] = 385'h1da68421a2ec4250ab646db39d1a6402f7982585addf2496bd73c9d68f6b466a5af85e552f61fd87194e7251fa8091f84;
    stim[60] = 385'h1a5290c8b31d6112d2e9f03ed8ff2d240caa264ed58eb8d0570a122c97c944de13953a6808ae55abee5f1c2f981d477c1;
    stim[61] = 385'h159075b59858032fc71599a3453751c38612bfd34798e6a8a9af336d5a86fd4c5e1ef0c1da22190a37de23ff3cb7dec5d;
    stim[62] = 385'h127ca566c958cb8fb62e632279031431ee9249b671a0913a19974363920c3f67682e1db630e2c5f1767cb52d3b2b5a0f3;
    stim[63] = 385'h17916db85afc9612632eae22e7aa6738220353e6c7a7efb78b17c42c1666585318d87fd725e7e879eee68f6772c6d97b6;
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
      expv[0] = 720'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 720'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 720'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 720'h8000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 720'h4800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 720'h8400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 720'h4800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 720'h0c00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 720'h4000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 720'h4000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 720'h4000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 720'h8000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 720'h0800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 720'h4400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 720'h4400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 720'h8400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 720'h4800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 720'h8000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 720'h4000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 720'h8000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 720'h4400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 720'h0800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 720'h4000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 720'h8400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 720'h8400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 720'h4800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 720'hcc00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 720'h0000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 720'h8000000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 720'h0400000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 720'hc800000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 720'h0c00000000xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
