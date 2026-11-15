// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 194;
  localparam OW = 263;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03532 dut (
    .aclk(clk),
    .aresetn(in_vec[193:193]),
    .s_axi_awaddr(in_vec[192:161]),
    .s_axi_awprot(in_vec[160:158]),
    .s_axi_awvalid(in_vec[157:157]),
    .s_axi_wdata(in_vec[156:125]),
    .s_axi_wstrb(in_vec[124:121]),
    .s_axi_wvalid(in_vec[120:120]),
    .s_axi_bready(in_vec[119:119]),
    .s_axi_araddr(in_vec[118:87]),
    .s_axi_arprot(in_vec[86:84]),
    .s_axi_arvalid(in_vec[83:83]),
    .s_axi_rready(in_vec[82:82]),
    .m_axi_awready(in_vec[81:80]),
    .m_axi_wready(in_vec[79:78]),
    .m_axi_bresp(in_vec[77:74]),
    .m_axi_bvalid(in_vec[73:72]),
    .m_axi_arready(in_vec[71:70]),
    .m_axi_rdata(in_vec[69:6]),
    .m_axi_rresp(in_vec[5:2]),
    .m_axi_rvalid(in_vec[1:0]),
    .s_axi_awready(out_vec[262:262]),
    .s_axi_wready(out_vec[261:261]),
    .s_axi_bresp(out_vec[260:259]),
    .s_axi_bvalid(out_vec[258:258]),
    .s_axi_arready(out_vec[257:257]),
    .s_axi_rdata(out_vec[256:225]),
    .s_axi_rresp(out_vec[224:223]),
    .s_axi_rvalid(out_vec[222:222]),
    .m_axi_awaddr(out_vec[221:158]),
    .m_axi_awprot(out_vec[157:152]),
    .m_axi_awvalid(out_vec[151:150]),
    .m_axi_wdata(out_vec[149:86]),
    .m_axi_wstrb(out_vec[85:78]),
    .m_axi_wvalid(out_vec[77:76]),
    .m_axi_bready(out_vec[75:74]),
    .m_axi_araddr(out_vec[73:10]),
    .m_axi_arprot(out_vec[9:4]),
    .m_axi_arvalid(out_vec[3:2]),
    .m_axi_rready(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 194'h0e479a619f8bf889274ea951f2a5a439ec9bca5125e0cd9c9;
    stim[1] = 194'h1f28ed99caa19ce5f835b13ebdeddb00ca75ec9c4072cb03b;
    stim[2] = 194'h3abde0e0f6685d824966bf22dcbb26ea803b688ec525a5bab;
    stim[3] = 194'h28876f09ed8fcdb6d37c8ccbb866d1977ac63275415f9b05b;
    stim[4] = 194'h2c07bead39e1b49210c0e2cf013b2d60c76b13041cb47bdb4;
    stim[5] = 194'h201289b6703bbf8b5fe6387fb8eabe7df3bef4ed2f127296d;
    stim[6] = 194'h2f3d93ee515aab9f711feb37d1a961d170fa0921c0a9a5d9f;
    stim[7] = 194'h3c81224814939732ec31a709d082f08b42eb6ca686efea5ba;
    stim[8] = 194'h29d282b0e3d63aa72868feac9363a676081aba38f60424891;
    stim[9] = 194'h219154a26589964585e644a7e0a922fa3ea9cc6e290130b17;
    stim[10] = 194'h2e51382d0bb7fda5b3bd79f848cbf7d505f70705cc5d6d2c9;
    stim[11] = 194'h3fc0f0df7ae5a1f34aae0b1ac3dbd866711fc0c5042d89a94;
    stim[12] = 194'h3b9eaa8cec79d8579ed281e2e39a48cb337925b96ec977d4b;
    stim[13] = 194'h23369217f651ee7c2ae0720a0b8626f3ad2429dbc3c68e10a;
    stim[14] = 194'h3a0a99f564b72f2918be82cfa4748abdff95f2403cba4323b;
    stim[15] = 194'h1f43ad3002472d0536e5b4f2765d74394ae306a9758ec9cc9;
    stim[16] = 194'h2f6d4fb45e6fc967f65b4c3d9ffa8b15e1f5b924bcdbf0bc8;
    stim[17] = 194'h22ec9f12cab4afc1cebb17256eb9e8cc02034096c48525134;
    stim[18] = 194'h20aa32544176f5e9c4ac9e4adb175ee09a0b228ef30fbb99a;
    stim[19] = 194'h3705e39cff3c42112ad603c2938c92f9b5f575f99baf1f37b;
    stim[20] = 194'h382be171a1b0ab22cadead10149c4db58760d4f7e592df4b0;
    stim[21] = 194'h2bace47eb90120c99cf9bec77e0a136a67d0ed8edcfc72f0d;
    stim[22] = 194'h2f9b3d12c4dd9d99b3fd52b205d59b73d3a948c7a1c71dfab;
    stim[23] = 194'h31f796013dfa83f70c1b857883cd69871203bd5d78a84d2b8;
    stim[24] = 194'h27f08a813d3d8e34b8d55c4abea039398911f89eb7eb35a91;
    stim[25] = 194'h2bd3564a01df906008add80fb759cf7ab4e2a9b6ab5d62326;
    stim[26] = 194'h28aa924b8504ad299f33e66491729118af2509df0f1f10fc6;
    stim[27] = 194'h2547ab51f7f4298f452855d4d78d65822d5e139bebbf9834d;
    stim[28] = 194'h38ba5fdde0f2a9c13d2cfa6aa7b08073008ac32e0f782b1bd;
    stim[29] = 194'h29384e376a7c782a81e377328498f4a3aaf2cdeb76c95bf76;
    stim[30] = 194'h283534eb0fa436d70cd82dd35e1e28c128a45bb0493a338f1;
    stim[31] = 194'h2d129e152ef77254a99c67869b82b999b1b94140818ba7942;
    stim[32] = 194'h237a204338e7863f246e315de281314dff0840f53433c04de;
    stim[33] = 194'h36742dece3f06764c9676c8f5e4f053bc2e287563985ca05c;
    stim[34] = 194'h359db2075f2afbf435b9aa53b3f088b344e37e1ced86e87bc;
    stim[35] = 194'h2d0e1409450800b72b8d8a1cce71f3390a29c71f3859cd1f9;
    stim[36] = 194'h2519e944396da9dd87312af40e7b2431acea4d899121ea58a;
    stim[37] = 194'h301f945fa91a15d0ac16e29e682a241d90d582f4e28fa98be;
    stim[38] = 194'h054181d0b37f8e22cac486e3ae49ffe1fc0ba4c287c5226b4;
    stim[39] = 194'h369e1c6785def46ddc7d7dc0ea8b06c3a3c7b1e7c9885f1ff;
    stim[40] = 194'h32df2aa3ad659d4d03a7b885d496404fa5e075d1208dee1e7;
    stim[41] = 194'h2eca621a412c462477401c6a06787fc06af7d63d3d46411ab;
    stim[42] = 194'h2e248a87201923e9336bb15ee388c270c1ca798acf0d65742;
    stim[43] = 194'h310069271379a39be3c62b8b6ecfe387e3a0aa65f086536bf;
    stim[44] = 194'h3ab1c6ef381434f2bc0262d887167cc22ee1b39cdd7767e49;
    stim[45] = 194'h2fea6903e78e3a371633d1b3f7ae5ee36284f698ee291d972;
    stim[46] = 194'h20caf0089c63293f0c7621962b2fa42c4720aa3ddaf8f76e4;
    stim[47] = 194'h22e44bfd0275933c4d7ba62f5666afdf1a1879a1e0149c5b8;
    stim[48] = 194'h3aefcc42fe45c62227d89e11e69053390ba436c1df7093b7e;
    stim[49] = 194'h2c497cc6bd75abf3a7f09793cf555472220fd07527c498cf5;
    stim[50] = 194'h36f433dfa6fa99732672b4efb6a45fe1d1874dae1ea7def3e;
    stim[51] = 194'h2618abbdd071f5194d47a21eab6274b586efbebbcdf449827;
    stim[52] = 194'h309ce9e0a16a4dcf24b61e216bab9203c07fc0829e07a6174;
    stim[53] = 194'h263fbbb19bd36dd70ef3782456583f92773abef0855a7c1a0;
    stim[54] = 194'h2be9cad364962856e3b418e018cd13bc2923dbaebc41daed2;
    stim[55] = 194'h373fb3884269797478c5faae80f17b387f430648177ebd53b;
    stim[56] = 194'h37d5c1202dfb690f7018b3453a357c70881862f5cd22df7fa;
    stim[57] = 194'h3de31601da224666d2d3c527832a6a94cb7242753378b6fd6;
    stim[58] = 194'h2b528e677c23cd726a88fe76391731e0893910b2a59ddaa10;
    stim[59] = 194'h3d77fd3507263436a8eef854e91807dc78fda3feed92ef424;
    stim[60] = 194'h3e921fa112d57c0e0d247fbef4b942bc12d13ed2324ddc4d3;
    stim[61] = 194'h32f332ba109a22e489ba6365161c4fcda0e12d09d684513b5;
    stim[62] = 194'h3015f288c1dc6be704b2a1e09dd100a7d363a1d11fa43771f;
    stim[63] = 194'h2e61dad7a4173429c544a555e393ef78da8a36b1232cdd23a;
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
      expv[0] = 263'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[2] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[3] = 263'h63afc8b72e357bc1c1f57bc1c1edcd0bb0490d0bb0492ec35f916e5f5f916e5db0;
      expv[4] = 263'h632332ee18510ede13d10ede13db31f9b6da71f9b6da6efe4665dc324665dc336f;
      expv[5] = 263'h6238b3c04e180f7d5a580f7d5a763c3692423c36924219807167809c7167809db0;
      expv[6] = 263'h638e1fee3a4025136cc025136ce40777f16bc777f16bffc31c3fdc771c3fdc752c;
      expv[7] = 263'h63facdf46a1e7b27dc9e7b27dca42b5573ee2b5573ee223ff59be8d7f59be8d493;
      expv[8] = 263'h6269c2742079024490390244902d1272e65d9272e65d8470d384e840d384e8412f;
      expv[9] = 263'h623fab24d853a50561d3a50561c0fac754e53ac754e50ccc7f5649b07f5649b1bc;
      expv[10] = 263'h639129f82a0322a944c322a944c93132c8b0b132c8b0bfc32253f0572253f05490;
      expv[11] = 263'h675e7e12325ca2705a1ca2705a12f6ffb4b676ffb4b6777ebcfc2466bcfc2465bf;
      expv[12] = 263'h6382c6b0f67f81e1beff81e1bef6dcb43e695cb43e69554f058d61ef058d61edbf;
      expv[13] = 263'h62a078b8e6373d5519f73d5519db0f3b0af3cf3b0af3d9b140f171cd40f171cd23;
      expv[14] = 263'h621c8282e0066d242fc66d242fedca3dcf854a3dcf855dc0390505c0390505c360;
      expv[15] = 263'h63a0b3e91c741533eaf41533eac916e5e52316e5e523157f4167d23b4167d23a4c;
      expv[16] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[17] = 263'h66d30f67fe5eda9f689eda9f68bfcdf92cfecdf92cfec8bda61ecffda61ecffd2c;
      expv[18] = 263'h66c5c95bae45d93e2585d93e2592d695f839d695f839d57d8b92b75d8b92b75c9f;
      expv[19] = 263'h632792b6c4015464a8815464a8802edebd38aedebd38954e4f256d8a4f256d8bf3;
      expv[20] = 263'h6780f0a4e26e0bc739ee0bc739ffe78842256788422559b301e149c701e149c64c;
      expv[21] = 263'h63ab4405263057c2e37057c2e340361564597615645959bf56880a4f56880a4e43;
      expv[22] = 263'h626fb1df821759c8fd5759c8fd7620241933a02419339dfcdf63bf04df63bf0520;
      expv[23] = 263'h6354ac81745f367a259f367a25891bb3b3365bb3b3367ffea95902eaa95902eadc;
      expv[24] = 263'h62e15e20f223ef2c0263ef2c027f3f507ee1bf507ee1803dc2bc41e5c2bc41e6d3;
      expv[25] = 263'h635712afa80fe115024fe115027f27b1c69727b1c69719b2ae255f52ae255f5000;
      expv[26] = 263'h637603edd657a6ac9417a6ac94003bf20c013bf20c01154eec07dbaeec07dbac9f;
      expv[27] = 263'h62f999245c5155249711552497092095a533e095a533e671f33248b9f33248b92c;
      expv[28] = 263'h62157535e20a8f56a3ca8f56a3edfe8531e8be8531e8a64c2aea6bc42aea6bc6d3;
      expv[29] = 263'h633e9aa9ec7174bfbbf174bfbbc01e5538279e553827a64e7d3553da7d3553d80c;
      expv[30] = 263'h62ddcca12652709c6ed2709c6ed2cf8f05500f8f05503fc1bb99424dbb99424c0f;
      expv[31] = 263'h660b74d786106a69d6106a69d61bf486dae1b486dae199bc16e9af0c16e9af0f60;
      expv[32] = 263'h6719e1a6e05a253c2a5a253c2a5bdeee4a951eee4a95333e33c34dc233c34dc12c;
      expv[33] = 263'h638c5778a006f4408646f44086761cf0c7e49cf0c7e48ccf18aef14318aef14090;
      expv[34] = 263'h63db23d7922ce85bd9ece85bd9c0fe0cec993e0cec992ec3b647af27b647af27f0;
      expv[35] = 263'h666a94ecfc6b3b640eab3b640ebfe55f7e86a55f7e86b77cd529d9f8d529d9f80c;
      expv[36] = 263'h636287339c5a1c28129a1c281289210016e5610016e5730ec50e673ac50e67389f;
      expv[37] = 263'h624abd039e0a33d2884a33d288762db53bb0edb53bb0e670957a073c957a073db0;
      expv[38] = 263'h63b8a79a0a203f28bf603f28bf522342ba15a342ba158033714f3417714f341520;
      expv[39] = 263'h000000000000000000000000000000000000000000000000000000000000000000;
      expv[40] = 263'h635f703aa22d3c38cf2d3c38cf093bde8dbbbbde8dbb8cfebee07546bee07545b0;
      expv[41] = 263'h63ee21752425be554765be55475b2cb3a9a06cb3a9a07743dc42ea4bdc42ea4b63;
      expv[42] = 263'h62071a819e1d94c4349d94c434802588c48ee588c48eea800e35033c0e35033c03;
      expv[43] = 263'h62ec57b8e25c49150e5c49150e4003247d2643247d266ecdd8af71c5d8af71c40f;
      expv[44] = 263'h638ae2dbb26200d24e2200d24e24ef34737c6f34737c7b8315c5b76715c5b767ff;
      expv[45] = 263'h6298b621c435638dde75638dde7602869e5782869e578001316c4389316c438b63;
      expv[46] = 263'h66f46cfdea1fd4d207dfd4d207c9f1c746e2f1c746e2c471e8d9fbd5e8d9fbd763;
      expv[47] = 263'h6388658aca4195e0110195e0113f0c6527e18c6527e18cf310cb159710cb1597fc;
      expv[48] = 263'h66e98bd59845c897fa05c897fa00ceb267898eb26789aefdd317ab31d317ab336c;
      expv[49] = 263'h66278479a435df9885f5df9885ffc8b8c444c8b8c444fbbc4f08f3484f08f34803;
      expv[50] = 263'h6225e4f3d41892f98d5892f98d7f2eb57e74eeb57e74fff04bc9e7a84bc9e7aad3;
      expv[51] = 263'h66ad3beda82de867bf6de867bf49df532e64df532e64ccf15a77db515a77db5243;
      expv[52] = 263'h63e887aad80c31577b8c31577ba40e3ea3298e3ea329aa83d10f55b3d10f55b123;
      expv[53] = 263'h6387885aea6139d3c16139d3c1402d49b9e4ad49b9e495730f10b5d70f10b5d5bc;
      expv[54] = 263'h66de0915960c7f77630c7f776336fa6dbae1fa6dbae1ddf1bc122b2dbc122b2c00;
      expv[55] = 263'h630638063217d395a6d7d395a6c912c50adc52c50adc77720c700c660c700c66d0;
      expv[56] = 263'h637eaba03c2e7f6710ae7f671080cd2f2e8f0d2f2e8f1982fd57407afd57407893;
      expv[57] = 263'h622cd14e8c2fab82406fab82405b3f6d21ee3f6d21ee003c59a29d1859a29d1ad3;
      expv[58] = 263'h66f149e0ca3bc62c03bbc62c03b6c448ccda4448ccda59b1e293c195e293c19523;
      expv[59] = 263'h623f9d8e4416a51cced6a51cceff0479ae4d4479ae4d510c7f3b1c887f3b1c8bf0;
      expv[60] = 263'h63be153a463aeffa6a3aeffa6a09e4c686d524c686d51dcf7c2a748f7c2a748c00;
      expv[61] = 263'h631fefbd2e3d243f423d243f4224daaf81c19aaf81c1a6423fdf7a5e3fdf7a5c93;
      expv[62] = 263'h6298d9458625e6657425e665742413445c9113445c91377d31b28b0d31b28b0e43;
      expv[63] = 263'h62a8782774202be511a02be511803b8d7ce0bb8d7ce0957150f04ee950f04ee890;
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
