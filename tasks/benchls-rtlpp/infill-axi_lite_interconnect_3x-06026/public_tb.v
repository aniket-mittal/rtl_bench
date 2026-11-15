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

  rtlpp_06026 dut (
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
    stim[0] = 235'h305156bb1e83b2856eb4510503c8824a1f5666e8b105bba520ea25c43d0;
    stim[1] = 235'h22075b4e5057cb669a8e9fe78f669c845ebe9434b31f4220038e2369bbd;
    stim[2] = 235'h6c481c3ca73498167e4cd470c091b370777fd6d3a1503ecb2defa32da55;
    stim[3] = 235'h49daaf7ba0546d7a9351529098304019a936cf46ccc4774091d51097ec3;
    stim[4] = 235'h75bcac941281905c7563ac79a507f2d80aea3e9c61f9c09b071ead8709b;
    stim[5] = 235'h403dacc957b14f11f8560a60ae6e7b5f053129d97723475d80b18ba3598;
    stim[6] = 235'h7195f8c00ca297042bc212c9b99b29cfa011b1b8790779f619d82887590;
    stim[7] = 235'h5f5b322c89e4ead7e756bf179185ac24f8f0659b228a9eeca28941ee944;
    stim[8] = 235'h59076dc8410ecf73ebc76fabdc3d2c1aaca74fc88088e9fa37d714594ff;
    stim[9] = 235'h5c95bee28b54ac6f0cc1a446bb6a41aebf023666cc26f656a10cd7e1444;
    stim[10] = 235'h6520b45a533fe0dc1020df81e1666054dc9aa59c48374bb181c87fc2c48;
    stim[11] = 235'h604a3662409d0c16a32e13f1aa13b2aee763042f510e37bf64fe468359a;
    stim[12] = 235'h6c23fc148d357a6216b85962667a6792c1ac823a52d984076a60f2f2f75;
    stim[13] = 235'h5a3297075ab736e6133bd67fe43da48f563d1164413de6d564ea7c115a6;
    stim[14] = 235'h489e1785b6c21003ed4dec11ea181fd6f10849129c9b2281e61c6511580;
    stim[15] = 235'h4e5300b1ee1965b911d278100664ab96e68fc0871d71e84031d99564410;
    stim[16] = 235'h6178e20ca77fe17f1b9714812000450ebaada1fbc63411ae5bdc54025ab;
    stim[17] = 235'h717d5b3c3cee790517fb66268d18c13ff050a060b9f389bba52c7520cc6;
    stim[18] = 235'h698f01f9fd958c295ee84dad9ab0690adc8d71a6c98160143b02506d2a3;
    stim[19] = 235'h09ad1e3c91d6c7eca7482939cf2b840ea3f53df2ac76dba4d68d8f6c62c;
    stim[20] = 235'h4d1a16c9101d8359399c6dc6da77deeec46125084777d88ff15acb8ab87;
    stim[21] = 235'h61cefa673f31fde5c63c1b3eabb9c44f5ea1da5f4f89782ddfe07456b96;
    stim[22] = 235'h780f0004ca0ee315fbc57bc04f1b434b1965a5e30e137043a91e77fd2db;
    stim[23] = 235'h6c6f6a53947b133ec16f7834f4edfb988b104325a691fcd29e4ac3f9515;
    stim[24] = 235'h78007a9a83bd92f7b2f36b06a199904379dcd1754b430d6ddc21f676c5b;
    stim[25] = 235'h7eba7f6c45c33cd9deeed43fc05b7779cf7404723fd3ecd666c22789ecd;
    stim[26] = 235'h6dd8e06def82a22361df29064e0dfafac012c7cc344da379d9277ebb101;
    stim[27] = 235'h0bfcbec22f7ffa231c0e72458d46d814e3737b903abc8a97b06c114c4d0;
    stim[28] = 235'h4a5003e6529c0c19cf7431c91f73b98e05dc8c13774825641f5c3ce95eb;
    stim[29] = 235'h54d65723770e012a816f1e307944efbaad3677325ce6b7008859e35b543;
    stim[30] = 235'h52e8707e46ee329d91609f93b6cb1cc6257fb0b47b42276f98363963459;
    stim[31] = 235'h639f8dfc4c56f9bbf927c111a104e68c897ecf0fb950eccba2f5411289f;
    stim[32] = 235'h7987086eb3cd4c2705fb81bd325c5894a775335f00a500f98f39728d499;
    stim[33] = 235'h6da2fe472d39774c21b02bb76222ad71a0ce919759457c21e4e50f84c20;
    stim[34] = 235'h5436fee3a6c8c0e7939696ab93925be150e7a9e14eebe305b1432651d4b;
    stim[35] = 235'h7775b232484b02b0268c47c92f67ccfaf9bd866a75d4528c88070a95697;
    stim[36] = 235'h496aed97cacdd5f014c150a6983154cf98e103c1da01702ab0e28304650;
    stim[37] = 235'h706eeee50c7dc50b36539a9c302c968e072aff234ce2b473cd0f36c2874;
    stim[38] = 235'h596a01e660397581e4b8f07c2b86c15e4f53685521db93295f576f23f0f;
    stim[39] = 235'h4e0526cd1c9c84872089de6b7327b162a55f6c713a10f75b585bb4e8d37;
    stim[40] = 235'h6b7e1c6b0a24aad2d2a0ac94d3cf2a2b7cddac1e490d369aec93ebd4474;
    stim[41] = 235'h5da2f5035db8f3f67a7b09d56e0c09106bf89766fadd2f2b006a24330c8;
    stim[42] = 235'h59a69c96122eda7b8745009c9fdb5f43642b73c4ff212739252321aae5b;
    stim[43] = 235'h5ba863f4533d534ef5f3055cb7ec25d80df74aca44f8e52c5707037f55f;
    stim[44] = 235'h49b5c7e703cd969434e0e84da6804fd74de8926a3f42df42b2abf8fd3a0;
    stim[45] = 235'h4f25331465085f2b1b1c1bb7d62b6db4459738d3192b66fceb7fdc72fc3;
    stim[46] = 235'h78e3f2beb52ceb5787f6cba4e3e7386f7626a59ee18c4607ed690193b5c;
    stim[47] = 235'h67004662dedae273be4e0684cada11b687e67d356bff6bef469f3f35928;
    stim[48] = 235'h62ce0df19b7f50c54fc2cc334be9dbe1ea73bc97a3058389ee9bfd181a6;
    stim[49] = 235'h7b89779a192ad54c60a04f38ad5c97e3dfa208e567f9031e8fa361c6b9a;
    stim[50] = 235'h5f39218e479e355c9fbc5d3ee9a99e137b5c6eee024e2efdcc26f9a937f;
    stim[51] = 235'h6db24b56e7c9c1e0c4dc9bb21a56d5c3248ce3c21db4c5c43afd7e8eaa5;
    stim[52] = 235'h4f6770a65655181a8035be1d9d602b94fbab50b4795ea53749d2176a1c3;
    stim[53] = 235'h47c6d0d393529f2097437c4c8ec9b65ae3069b35e9241607220bd1ae30a;
    stim[54] = 235'h7b107ce8aa5264e7ffbb7d3f0964680e4d2cc678822069e7c91fc8c9a7d;
    stim[55] = 235'h578e788bc3eb44b5e575a2acb6f0d6818ced87815157fe9e908603fdf62;
    stim[56] = 235'h5b24a1945709011ce98c57afb9dcf53e2517d510828cfe4d9b6d7666d4b;
    stim[57] = 235'h48d5b5d4f99822b97a039a439568dd2cfd5476047fceae58acdce6e5813;
    stim[58] = 235'h775840412571dd3efe3be794863bb3260476fe8626aacfbcd8ae9939cb9;
    stim[59] = 235'h4f10389a87e9b076cf7822a2a6946d9f84302a67d4c72ac6bda587077bb;
    stim[60] = 235'h64ebd20682f9a20cc19490770b4c0659167676cf8acbd4faa2e8c8576fd;
    stim[61] = 235'h4eb50c1957ee7df38fd3f96671d15e7ea4ec0b5e105311fa1f1481f76d2;
    stim[62] = 235'h4932afec1f264a1aa5acb6bf7b2476ba07b92f458b6c5ea53cc756ec5be;
    stim[63] = 235'h6c3cab3d37f44b729484eae6f2055680f15fe2387378ad577f4b8c8f103;
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
      expv[0] = 374'h3507512e219828ab5d9828ab5d9828ab5d8dbf41d942b741d942b741d942b7555fa288281e2288281e2288281e4907;
      expv[1] = 374'h311c711b4df103ada73103ada73103ada729202be5b34c2be5b34c2be5b34d554074ff3c7b74ff3c7b74ff3c7b36c7;
      expv[2] = 374'h396f7d196db6240e1e56240e1e56240e1e524f9a4c0b3f9a4c0b3f9a4c0b3f332066a38604e6a38604e6a38604803f;
      expv[3] = 374'h3f8ea884bf24ed57bdc4ed57bdc4ed57bdd2402a36bd482a36bd482a36bd49bba38a9484c18a9484c18a9484c18000;
      expv[4] = 374'h3d38f56c38fade564a1ade564a1ade564a092140c82e3b40c82e3b40c82e3aaabc1d63cd281d63cd281d63cd2836ff;
      expv[5] = 374'h3f058c5d1ac01ed664a01ed664a01ed664a92fd8a788fdd8a788fdd8a788fc2223b053057330530573305305737fc0;
      expv[6] = 374'h37cec1443a98cafc6018cafc6018cafc60049e514b8214514b8214514b8215ffe010964dcc90964dcc90964dccdb78;
      expv[7] = 374'h31144a0f740fad99164fad99164fad99164490f2756bf2f2756bf2f2756bf3bba3b5f8bc8c35f8bc8c35f8bc8c24bf;
      expv[8] = 374'h3dbeb8a2caec83b6e42c83b6e42c83b6e420008767b9f48767b9f48767b9f5ffe03b7d5ee1bb7d5ee1bb7d5ee1edb8;
      expv[9] = 374'h350866bf0a0e4adf714e4adf714e4adf714491aa563787aa563787aa56378666600d2235db0d2235db0d2235db5b40;
      expv[10] = 374'h390e43fe1652905a2d32905a2d32905a2d29219ff06e099ff06e099ff06e08001c06fc0f0b06fc0f0b06fc0f0b36c0;
      expv[11] = 374'h3527f2341ad0251b3130251b3130251b3120004e860b504e860b504e860b51999c709f8d50f09f8d50f09f8d50927f;
      expv[12] = 374'h3953079797b611fe0a5611fe0a5611fe0a449e9abd310a9abd310a9abd310b555fc2cb1333c2cb1333c2cb1333db40;
      expv[13] = 374'h372753e08a0d194b83ad194b83ad194b83adb15b9b73095b9b73095b9b7309999fdeb3ff21deb3ff21deb3ff21edbf;
      expv[14] = 374'h3930e3288a044f0bc2c44f0bc2c44f0bc2db6f610801f7610801f7610801f6aaa06f608f50ef608f50ef608f50c900;
      expv[15] = 374'h398eccab2287298058e7298058e7298058f6df0cb2dc890cb2dc890cb2dc88eee393c0803313c0803313c080332487;
      expv[16] = 374'h35dee2a01270bc710650bc710650bc7106524fbff0bf8dbff0bf8dbff0bf8dddc3b8a4090038a4090038a409000000;
      expv[17] = 374'h3f2963a90618bead9e18bead9e18bead9e1ffe773c828a773c828a773c828bffffdb313468db313468db313468c907;
      expv[18] = 374'h35d812836934c780fcf4c780fcf4c780fcfffecac614aecac614aecac614af777c426d6cd5c26d6cd5c26d6cd58000;
      expv[19] = 374'h35b46c7b6344d68f1e44d68f1e44d68f1e4920eb63f652eb63f652eb63f653bba04149ce794149ce794149ce795b7f;
      expv[20] = 374'h358ad65c55268d0b64868d0b64868d0b6489200ec1ac9c0ec1ac9c0ec1ac9cccc3e36e36d3e36e36d3e36e36d3b6ff;
      expv[21] = 374'h37ff03a2b590e77d3390e77d3390e77d339fff98fef2e398fef2e398fef2e3111fe0d9f55de0d9f55de0d9f55dc93f;
      expv[22] = 374'h3748f3bfe9fc0780027c0780027c078002649107718afd07718afd07718afdffe02bde0278abde0278abde0278db78;
      expv[23] = 374'h3df2561fcab637b529d637b529d637b529c92e3d899f603d899f603d899f60aabc7bc1a7a77bc1a7a77bc1a7a76dbf;
      expv[24] = 374'h33e10fb3b6fc003d4d5c003d4d5c003d4d4001dec97bd9dec97bd9dec97bd9777f9b58350c9b58350c9b58350cc93f;
      expv[25] = 374'h3f36113c4f7f5d3fb63f5d3fb63f5d3fb6200ee19e6ceee19e6ceee19e6cef777c76a1fe02f6a1fe02f6a1fe02db78;
      expv[26] = 374'h3dc93bf5d836ec7036f6ec7036f6ec7036f6dfc15111b1c15111b1c15111b0eee3f948327079483270794832706dbf;
      expv[27] = 374'h3983608a6285fe5f6105fe5f6105fe5f6116dfbffd118fbffd118fbffd118e000073922c6a73922c6a73922c6a36c7;
      expv[28] = 374'h35fae1e74a652801f3252801f3252801f329214e060ce74e060ce74e060ce7bbbfa18e48fba18e48fba18e48fb927f;
      expv[29] = 374'h3d42cf1ada2a6b2b91aa6b2b91aa6b2b91bb6f870095418700954187009540aabc78f183ca78f183ca78f183ca2487;
      expv[30] = 374'h31c1b1cb1ae974383f2974383f2974383f200f77194ec977194ec977194ec8aabc04fc9db604fc9db604fc9db65b78;
      expv[31] = 374'h3517aa0894f1cfc6fe31cfc6fe31cfc6fe249e2b7cddfc2b7cddfc2b7cddfc889c3e088d083e088d083e088d082487;
      expv[32] = 374'h3979cb946afcc384375cc384375cc384375b61e6a61383e6a61383e6a61382eeffdc0de992dc0de992dc0de992ed80;
      expv[33] = 374'h3b27287c2616d17f2396d17f2396d17f2396de9cbba6109cbba6109cbba610ccdf815dbb11015dbb11015dbb111247;
      expv[34] = 374'h338a19328e6a1b7f71ca1b7f71ca1b7f71d24f646073c9646073c9646073c9ddc3b4b55c9cb4b55c9cb4b55c9c9240;
      expv[35] = 374'h3d403854abbbbad9193bbad9193bbad91924902581581225815812258158135540623e497b623e497b623e497b36ff;
      expv[36] = 374'h378714182384b576cbe4b576cbe4b576cbe49166eaf80b66eaf80b66eaf80a66600a8534c18a8534c18a8534c18038;
      expv[37] = 374'h356879b614983777729837777298377772849e3ee2859a3ee2859a3ee2859b33239cd4e1811cd4e1811cd4e1816d87;
      expv[38] = 374'h3dfabb791f6cb500f32cb500f32cb500f332401cbac0f21cbac0f21cbac0f2445fc783e15c4783e15c4783e15c36c7;
      expv[39] = 374'h31c2dda746a702936687029366870293668dbe4e4243904e4243904e42439044404ef35b994ef35b994ef35b9936ff;
      expv[40] = 374'h37649f5ea295bf0e3595bf0e3595bf0e358491125569691255696912556969555c0564a69e0564a69e0564a69e7ff8;
      expv[41] = 374'h39035121984ed17a81aed17a81aed17a81adbedc79fb3cdc79fb3cdc79fb3d333fd84eab70584eab70584eab706d80;
      expv[42] = 374'h3329190d57ecd34e4b0cd34e4b0cd34e4b0921176d3dc3176d3dc3176d3dc3bba02804e4fea804e4fea804e4fedb78;
      expv[43] = 374'h3db8381bfaedd431fa2dd431fa2dd431fa29219ea9a77b9ea9a77b9ea9a77aeeff982ae5bf182ae5bf182ae5bf6d80;
      expv[44] = 374'h3b955fc7e904dae3f384dae3f384dae3f38001e6cb4a1be6cb4a1be6cb4a1a667c07426d3407426d3407426d340000;
      expv[45] = 374'h395bfee3972792998a2792998a2792998a324e842f958c842f958c842f958d9983e0ddbeb160ddbeb160ddbeb15b78;
      expv[46] = 374'h376b480c9ddc71f95f5c71f95f5c71f95f5b6e9675abc29675abc29675abc3ffffb65d271f365d271f365d271f36f8;
      expv[47] = 374'h3934f9f9ac5380233173802331738023316dbf6d7139df6d7139df6d7139df332070342656f0342656f0342656db40;
      expv[48] = 374'h3374dfe8c0116706f8d16706f8d16706f8cdb1bfa862a7bfa862a7bfa862a7ffe016619a5f16619a5f16619a5f493f;
      expv[49] = 374'h337d1b0e35ddc4bbcd1dc4bbcd1dc4bbcd0db0956aa630956aa630956aa630445c0279c56a8279c56a8279c56aed87;
      expv[50] = 374'h3b6137cd49ef9c90c72f9c90c72f9c90c7200fcf1aae4fcf1aae4fcf1aae4fdddfe2e9f74d62e9f74d62e9f74d493f;
      expv[51] = 374'h33d7ebf47536d925ab76d925ab76d925ab724fe4e0f063e4e0f063e4e0f0626663e4dd90d2e4dd90d2e4dd90d2b6c7;
      expv[52] = 374'h394e90bb5027b3b85327b3b85327b3b853292f2a8c0d412a8c0d412a8c0d40001fadf0eceb2df0eceb2df0eceb0000;
      expv[53] = 374'h3d105e8d7143e36869c3e36869c3e36869c921a94f904ba94f904ba94f904bbba01be264761be264761be26476493f;
      expv[54] = 374'h3548fe464dfd883e745d883e745d883e7456d1293273ff293273ff293273ffdddfdbe9f84b5be9f84b5be9f84b2480;
      expv[55] = 374'h3384301fef0bc73c45ebc73c45ebc73c45e001f5a25af3f5a25af3f5a25af2aabfad1565b7ad1565b7ad1565b78007;
      expv[56] = 374'h3ddb6bb3366d9250ca2d9250ca2d9250ca292f84808e7584808e7584808e74ccc062bd7dcee2bd7dcee2bd7dceed87;
      expv[57] = 374'h3566e7372ca46adaea646adaea646adaea7ff0cc115cbccc115cbccc115cbd11001cd21cab1cd21cab1cd21cab4907;
      expv[58] = 374'h31c574c9cefbac20209bac20209bac2020924eb8ee9f7eb8ee9f7eb8ee9f7f111fdf3ca431df3ca431df3ca431db7f;
      expv[59] = 374'h3fed2c383be7881c4d47881c4d47881c4d400ff4d83b67f4d83b67f4d83b67bbbfc1151534c1151534c1151534a480;
      expv[60] = 374'h3f174642bbf275e9035275e9035275e90340017cd106617cd106617cd10660ccc3a483b85a2483b85a2483b85a6d80;
      expv[61] = 374'h3df8a40fbb875a860ca75a860ca75a860ca92ff73ef9c7f73ef9c7f73ef9c7ffe39fcb338e9fcb338e9fcb338e8038;
      expv[62] = 374'h3de63ab762c49957f6049957f6049957f60dbf93250d5393250d5393250d52ccdc65b5fbd965b5fbd965b5fbd92480;
      expv[63] = 374'h31fa5c6478361e559e961e559e961e559e9b6ffa25b94bfa25b94bfa25b94a444027573790275737902757379024b8;
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
