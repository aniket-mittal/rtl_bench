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

  rtlpp_03594 dut (
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
    stim[0] = 235'h1056d1a301a0df2c0b8d28fceb5b70eafcb40fb6a636bd0e92dfd2ad66b;
    stim[1] = 235'h29535e2125127ef8d243b5730d9f244c22c8415eeab32702594c3a9c4ad;
    stim[2] = 235'h5ee56372a7cd92889e0345aa280e5ab43cb5c132a50d7c61fb52871c788;
    stim[3] = 235'h6c75909321072f0e1efe2dfb032545405ba52757a0c54b0c82bce6b7dd1;
    stim[4] = 235'h56335e5e5c50f209bf429768883f5f32987ee2d16cdb4a4aac0338e1511;
    stim[5] = 235'h593b3c29eaf567a3c19386e0fadec8aa70f197cdf2738d349c66b04618c;
    stim[6] = 235'h6b1e846822e178abb22f1c26dab7337e40f0d01531b959103ba8dbe6761;
    stim[7] = 235'h6ea56fe474ae3474aede208326ae58a3c93919a6854064aa08cdd0d014e;
    stim[8] = 235'h53bad081b6d34715cf9c3dfedb9b5bb4949de68789cb134757088f8a915;
    stim[9] = 235'h4583d52b14495dbc1731f1ea5c514d94dcce81d13a35d070fecd8ac7f3f;
    stim[10] = 235'h516cb636dcdef3a60dbff2b9e83690f8f8e6cbd049d6366474ee2590ac1;
    stim[11] = 235'h6037a28c13cadf6337fc383bfadfbbd7639230afa268a4eb3f33a2a8b6d;
    stim[12] = 235'h7da5a5012d9a70d8caf289c72312e8b6e894fcf743ce395f85b32ca4708;
    stim[13] = 235'h7b29cd349ef1017ec360b4fb2e3eab07cfe0cedd063217f48e79be550f0;
    stim[14] = 235'h543975f85eb5edca2a7fa099e3ce06a4dca3670a75f0a42f7eacc6dd15d;
    stim[15] = 235'h40d05078cd3adde6ed513d909002f02c43e9496245eb7decc322095105c;
    stim[16] = 235'h402d6592ce31599ed160614c78352887c0c4552f74753506771c1918dcc;
    stim[17] = 235'h58820fa99b010f4bbb9e2256ac5d667b0323f9d1992715bb61a371daf8c;
    stim[18] = 235'h5a97cbbc67e5f22e32c81b9402cec2dcdc5dcbb32f55738514e1315ce1e;
    stim[19] = 235'h523b91718b5b5837d674f74b8a78703e9e6eb536b647a319cc266c1f59b;
    stim[20] = 235'h6639416db224cdd763ef2df71912d24e72ce9cea98e56ce59ff0eb41c69;
    stim[21] = 235'h42385e3a12475e43cf0510c13e23d6abfa5058dfdb13bdc50fae7f1c1fa;
    stim[22] = 235'h4baae016faa743af2d35c21ec81fff041de73f43f9c65786650f5583fef;
    stim[23] = 235'h65fc5048c58fe4bc66d60995d4e8ddf87b333ded40e7aed12235502dfc5;
    stim[24] = 235'h7c939eb3d170e3d9e780902684b08f32e4d9eed33254fc48410caddd08d;
    stim[25] = 235'h4cd188e64c177c6e38a8a637ddc41fad42ba80ecf736293bb3b43d36fe4;
    stim[26] = 235'h6afb61f4dcec430708fa8a3f8dde7fbf780e103346264894a5afc0f9091;
    stim[27] = 235'h5265a57030012865175bf23612e2123d7f883e2ce13f8e280cd05a6fd5d;
    stim[28] = 235'h41d0f72b788640c9d5b5588e8f2485eb16646c3a738696fe1707c2ce1d6;
    stim[29] = 235'h46ddc95e31227b81e22811133f146ed15aac45cb4b98484c14878a6c588;
    stim[30] = 235'h5893a574788c637d717f18a2e00dadf7ec8ef9f14ae49edd62c511ad97d;
    stim[31] = 235'h77406ffc0f7fa92157f135e201d8bdcf0602d47b89b805a9f8ef0f556a5;
    stim[32] = 235'h590277c5c7d0b4b7cef4f76208016b348ecbebd5d93c39e9fbdbb93b649;
    stim[33] = 235'h69945c57b66a8b9e2849104c6a256cd0abf05b6c2f7b15e06170114d01e;
    stim[34] = 235'h48f1f32aea05dc8591690a63a33c6577fb46649cf5990406f88ac49d4cb;
    stim[35] = 235'h4ddd3a91fa0fda13eb96fc73338f078cb5fae2b81d159d070c21fe8a0ff;
    stim[36] = 235'h5cd2b6737653768b2c4e6bbd8a6164bb9d5d57d930855d9d7855c8fad53;
    stim[37] = 235'h718285f7b70eb0a296753eca3be150d43b360703cc7e154b01ecacbd9a8;
    stim[38] = 235'h7dc64bdc188ed0598673ba3cacbab8ce8f623a5c793091ec923d6052cef;
    stim[39] = 235'h6c5df5d913e7fce874488e7ffabb1ef79a1f2161fd06986c8f042e791b2;
    stim[40] = 235'h53c8d04859f9014e222eebbbc4288ff46ac8f1cc78aa2fa03005c2d756e;
    stim[41] = 235'h76d6d270e71a5a1b39da832e8d6e7ba9a81b476db3573ec58f28412fa96;
    stim[42] = 235'h4005e1e500cea2b045c137d7dcf910b95e31d70f6b396d338713347b3cc;
    stim[43] = 235'h5170434a930412e92eb428ae26cc2ce477129caa3be317584d416d22424;
    stim[44] = 235'h7d15bb9cbbaccf9493e8af8693d03828cb1f28ea3cb0114469a798f9738;
    stim[45] = 235'h1a49521e9728e4bf702565597e96858c989ada3036aa8d3f726d97505f2;
    stim[46] = 235'h4af3ce9c7347f82a4c8d5b02478d1b1679b8289372a9924bc0981d35a23;
    stim[47] = 235'h6053ee4827855b78dad015177c9aa82ba99bbbef491a99e1d621dbb9f5c;
    stim[48] = 235'h5b986a08e1630f82db918dbbb0b6a8402582750e3d57d6abde8dfd4524a;
    stim[49] = 235'h7257566fb543d70a6be2c762040843954a6f4a86692680588c1b991023c;
    stim[50] = 235'h57ea0d071cf00a1268a04d2e1c22a2ddb5c301772c349cc7a453485fe1f;
    stim[51] = 235'h57512a5afc525a8857e3bf9390d292d4f9d7d7d926afc074ffc51737047;
    stim[52] = 235'h73c5f10b5e897a270905c51114a8c6b2848806618d63ea1e7dea8aa3f0d;
    stim[53] = 235'h628be39aae1e6efb76780eb2ef3fd1d78a5988c57b3e7c7ffab554a7adb;
    stim[54] = 235'h5c889a3771925c6a1f32863707e522e6179fa0a0f1c713dcabafd68b835;
    stim[55] = 235'h4e7e12b8e85ddffafb999e33397541baf519dee91c27e30ffc55b4a3fce;
    stim[56] = 235'h6603649642a3e4335a5d1df689c06c4edbbf6134cd921fc06046c3a14ea;
    stim[57] = 235'h4a4cf1119d91c14ce3cb0aafb512c90d1b8bde8ded06bfb0c1eccab27bb;
    stim[58] = 235'h4b603bb341ab683342060a50c72e19dfefc61b30d8bad73de9894fd5682;
    stim[59] = 235'h74bf65bc0b93e5e6b8568b2079ab50fe999b2e69d0934fe4f703dc01b08;
    stim[60] = 235'h733e4b26feebfe1e6acecc01bc6666abcdfbc217c81e8bf907f597231f8;
    stim[61] = 235'h7ec386fd8fe7817c17752208b4474fd17edea0e46db56578ab962bec6d8;
    stim[62] = 235'h6b2748297a8ddfcff7ae6e3c577685f5c87310e53f568d863b80aaee549;
    stim[63] = 235'h53a05da16e65b993dce430a85f544f444eee29f3e8fee59190ec86d5dfe;
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
      expv[0] = 374'h01d28fceb5282b68d1882b68d1882b68d18000d06f9604d06f9604d06f9605ddc06947e75ae947e75ae947e75adb78;
      expv[1] = 374'h213b5730d934a9af1094a9af1094a9af10924e893f7c68893f7c68893f7c6933201dab986c9dab986c9dab986cfff8;
      expv[2] = 374'h20345aa2800f72b1b94f72b1b94f72b1b9524fe6c9444fe6c9444fe6c9444f11001a2d51401a2d51401a2d51407fc0;
      expv[3] = 374'h13e2dfb032363ac849963ac849963ac84992408397870e8397870e8397870f777ff16fd819716fd819716fd81924b8;
      expv[4] = 374'h21297688832b19af2f2b19af2f2b19af2f2dbe287904de287904de287904dfbba014bb444194bb444194bb4441fff8;
      expv[5] = 374'h00386e0fad0c9d9e14ec9d9e14ec9d9e14f6d17ab3d1e17ab3d1e17ab3d1e0ccc39c3707d69c3707d69c3707d6ffc7;
      expv[6] = 374'h13f1c26dab358f4234158f4234158f4234124170bc55d970bc55d970bc55d9111c78e136d5f8e136d5f8e136d5b6f8;
      expv[7] = 374'h20e208326a1752b7f23752b7f23752b7f23b6e571a3a56571a3a56571a3a577763f104193571041935710419357fc0;
      expv[8] = 374'h21c3dfedb929dd6840c9dd6840c9dd6840db6f69a38ae769a38ae769a38ae7ddc3e1eff6dce1eff6dce1eff6dcdb78;
      expv[9] = 374'h331f1ea5c522c1ea9582c1ea9582c1ea95892e24aede0a24aede0a24aede0b999f8f8f52e28f8f52e28f8f52e28038;
      expv[10] = 374'h32ff2b9e8308b65b1b68b65b1b68b65b1b6dbe6f79d3066f79d3066f79d306ccdfff95cf41ff95cf41ff95cf41b6c7;
      expv[11] = 374'h13c383bfad301bd146101bd146101bd1460921e56fb19be56fb19be56fb19bffffe1c1dfd6e1c1dfd6e1c1dfd6ffff;
      expv[12] = 374'h32289c72311ed2d2809ed2d2809ed2d28096decd386c64cd386c64cd386c65777f944e3918944e3918944e39189247;
      expv[13] = 374'h320b4fb2e31d94e69a5d94e69a5d94e69a4dbf7880bf617880bf617880bf61bbbc05a7d97185a7d97185a7d971ffc7;
      expv[14] = 374'h32fa099e3c0a1cbafc2a1cbafc2a1cbafc2dbf5af6e5155af6e5155af6e515333ffd04cf1e7d04cf1e7d04cf1e7fc0;
      expv[15] = 374'h2013d909000068283c6068283c6068283c649e9d6ef3769d6ef3769d6ef376aaa389ec848009ec848009ec84801247;
      expv[16] = 374'h330614c7832016b2c96016b2c96016b2c9649f18accf6918accf6918accf68aabc030a63c1830a63c1830a63c1a4b8;
      expv[17] = 374'h01e2256ac52c4107d4cc4107d4cc4107d4cdb18087a5dd8087a5dd8087a5ddddc3f112b562f112b562f112b562edb8;
      expv[18] = 374'h2081b9402c0d4be5de2d4be5de2d4be5de324ff2f91719f2f91719f2f91719776040dca01640dca01640dca0167fc7;
      expv[19] = 374'h124f74b8a7091dc8b8c91dc8b8c91dc8b8c491adac1bebadac1bebadac1beb333fa7ba5c53a7ba5c53a7ba5c53c900;
      expv[20] = 374'h12f2df7191131ca0b6d31ca0b6d31ca0b6db611266ebb11266ebb11266ebb1fffc796fb8c8f96fb8c8f96fb8c89247;
      expv[21] = 374'h01510c13e2211c2f1d011c2f1d011c2f1d092123af21e723af21e723af21e79980288609f1288609f1288609f1127f;
      expv[22] = 374'h135c21ec8125d5700b65d5700b65d5700b7ff153a1d79753a1d79753a1d796889fae10f640ae10f640ae10f640ffff;
      expv[23] = 374'h2060995d4e12fe282472fe282472fe2824600ec7f25e32c7f25e32c7f25e337763b04caea7304caea7304caea74907;
      expv[24] = 374'h000902684b1e49cf59fe49cf59fe49cf59e920b871ecf2b871ecf2b871ecf3ddc00481342584813425848134258007;
      expv[25] = 374'h328a637ddc0668c4732668c4732668c473249e0bbe371c0bbe371c0bbe371c445c4531beee4531beee4531beee2480;
      expv[26] = 374'h32a8a3f8dd157db0fa757db0fa757db0fa6dbe762183847621838476218384667fd451fc6ed451fc6ed451fc6effc0;
      expv[27] = 374'h00bf23612e0932d2b80932d2b80932d2b81b600094328a0094328a0094328bbba3df91b0975f91b0975f91b0971240;
      expv[28] = 374'h125588e8f200e87b95a0e87b95a0e87b95bff0432064ea432064ea432064eaccdfaac474792ac474792ac474792487;
      expv[29] = 374'h12811133f1036ee4af036ee4af036ee4af1b60913dc0f0913dc0f0913dc0f1111c408899f8c08899f8c08899f8a480;
      expv[30] = 374'h13f18a2e002c49d2ba2c49d2ba2c49d2ba3ff04631beb84631beb84631beb8aabff8c5170078c5170078c517006dbf;
      expv[31] = 374'h32135e201d1ba037fe1ba037fe1ba037fe049fbfd490abbfd490abbfd490abffff89af100e89af100e89af100ec907;
      expv[32] = 374'h334f7620802c813be2ec813be2ec813be2e00fe85a5be7e85a5be7e85a5be7777fa7bb104027bb104027bb10400038;
      expv[33] = 374'h219104c6a234ca2e2bd4ca2e2bd4ca2e2bdb6f3545cf153545cf153545cf14222048826351488263514882635124b8;
      expv[34] = 374'h1290a63a330478f9956478f9956478f99576d102ee42c902ee42c902ee42c8aabc48531d19c8531d19c8531d19ed80;
      expv[35] = 374'h016fc7333826ee9d48e6ee9d48e6ee9d48fff107ed09f507ed09f507ed09f5ddc3b7e3999c37e3999c37e3999c7ff8;
      expv[36] = 374'h21e6bbd8a62e695b39ae695b39ae695b39bb6f29bb459729bb459729bb45962220735dec53735dec53735dec530038;
      expv[37] = 374'h3353eca3be38c142fbd8c142fbd8c142fbdb6f8758514b8758514b8758514b333fa9f651df29f651df29f651df0038;
      expv[38] = 374'h123ba3cacb1ee325ee1ee325ee1ee325ee0db047682cc247682cc247682cc3333f9dd1e5659dd1e5659dd1e565db47;
      expv[39] = 374'h0188e7ffab362efaec962efaec962efaec8921f3fe743bf3fe743bf3fe743a22204473ffd5c473ffd5c473ffd5db78;
      expv[40] = 374'h12eebbbc4209e4682429e4682429e468242db0fc80a710fc80a710fc80a711111c775dde21775dde21775dde214907;
      expv[41] = 374'h20a832e8d61b6b69387b6b69387b6b6938724f8d2d0d9d8d2d0d9d8d2d0d9ceee3d419746b5419746b5419746b7fc0;
      expv[42] = 374'h01137d7dcf2002f0f28002f0f28002f0f28000675158226751582267515822eee009bebee789bebee789bebee7c938;
      expv[43] = 374'h12428ae26c08b821a548b821a548b821a54921820974978209749782097497555fa145713621457136214571366d80;
      expv[44] = 374'h128af8693d1e8addce5e8addce5e8addce5ff1d667ca49d667ca49d667ca49fffc457c349ec57c349ec57c349e8000;
      expv[45] = 374'h32565597e90d24a90f4d24a90f4d24a90f492f94725fb994725fb994725fb8001c2b2acbf4ab2acbf4ab2acbf4b6c7;
      expv[46] = 374'h01d5b024782579e74e2579e74e2579e74e3b61a3fc1527a3fc1527a3fc152644406ad8123c6ad8123c6ad8123c6db8;
      expv[47] = 374'h20015177c91029f7241029f7241029f724124fc2adbc6dc2adbc6dc2adbc6d776380a8bbe480a8bbe480a8bbe4db47;
      expv[48] = 374'h0018dbbb0b0dcc35046dcc35046dcc35047240b187c16cb187c16cb187c16dddc38c6ddd858c6ddd858c6ddd85b6c7;
      expv[49] = 374'h322c762040192bab37d92bab37d92bab37db6ea1eb8534a1eb8534a1eb8535fffc163b1020163b1020163b10204900;
      expv[50] = 374'h3204d2e1c20bf506838bf506838bf506838dbe780509347805093478050934445c026970e1026970e1026970e11247;
      expv[51] = 374'h323bf9390d0ba8952d6ba8952d6ba8952d7ffe292d442a292d442a292d442bfffc1dfc9c869dfc9c869dfc9c869247;
      expv[52] = 374'h205c51114a19e2f885b9e2f885b9e2f885adbf44bd138544bd138544bd138488802e2888a52e2888a52e2888a54907;
      expv[53] = 374'h3380eb2ef33145f1cd5145f1cd5145f1cd56df0f377dbb0f377dbb0f377dbb333fc0759779c0759779c0759779ffff;
      expv[54] = 374'h132863707e2e444d1bae444d1bae444d1bbb60c92e350ec92e350ec92e350f999f9431b83f1431b83f1431b83f24b8;
      expv[55] = 374'h0199e33397273f095c673f095c673f095c76d02eeffd7c2eeffd7c2eeffd7dddc3ccf199cbccf199cbccf199cba4b8;
      expv[56] = 374'h00d1df689c1301b24b3301b24b3301b24b200151f219ad51f219ad51f219ad3323e8efb44e68efb44e68efb44e0000;
      expv[57] = 374'h20b0aafb5105267888c5267888c5267888cdbec8e0a670c8e0a670c8e0a671ffe058557da8d8557da8d8557da89247;
      expv[58] = 374'h0060a50c7205b01dd9a5b01dd9a5b01dd9a000d5b419a0d5b419a0d5b419a111003052863930528639305286397fc0;
      expv[59] = 374'h0168b2079a3a5fb2de1a5fb2de1a5fb2de0491c9f2f35dc9f2f35dc9f2f35c2223b45903cd345903cd345903cd5b78;
      expv[60] = 374'h20ecc01bc6199f2593799f2593799f25937fff75ff0f3575ff0f3575ff0f35776076600de376600de376600de336c0;
      expv[61] = 374'h3352208b443f61c37edf61c37edf61c37ec49ff3c0be0bf3c0be0bf3c0be0bbbbfa91045a2291045a2291045a236f8;
      expv[62] = 374'h12e6e3c5771593a414b593a414b593a414bff146efe7fb46efe7fb46efe7fbdddc7371e2bbf371e2bbf371e2bbb6c7;
      expv[63] = 374'h32430a85f509d02ed0a9d02ed0a9d02ed0b6df32dcc9ef32dcc9ef32dcc9ee667c218542faa18542faa18542faa480;
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
