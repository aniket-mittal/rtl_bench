// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 228;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06485 dut (
    .aclk(clk),
    .aresetn(in_vec[227:227]),
    .s_axi_awid(in_vec[226:215]),
    .s_axi_awaddr(in_vec[214:183]),
    .s_axi_awlen(in_vec[182:179]),
    .s_axi_awsize(in_vec[178:176]),
    .s_axi_awburst(in_vec[175:174]),
    .s_axi_awlock(in_vec[173:172]),
    .s_axi_awcache(in_vec[171:168]),
    .s_axi_awprot(in_vec[167:165]),
    .s_axi_awqos(in_vec[164:161]),
    .s_axi_awvalid(in_vec[160:160]),
    .s_axi_wid(in_vec[159:148]),
    .s_axi_wdata(in_vec[147:116]),
    .s_axi_wstrb(in_vec[115:112]),
    .s_axi_wlast(in_vec[111:111]),
    .s_axi_wvalid(in_vec[110:110]),
    .s_axi_bready(in_vec[109:109]),
    .s_axi_arid(in_vec[108:97]),
    .s_axi_araddr(in_vec[96:65]),
    .s_axi_arlen(in_vec[64:61]),
    .s_axi_arsize(in_vec[60:58]),
    .s_axi_arburst(in_vec[57:56]),
    .s_axi_arlock(in_vec[55:54]),
    .s_axi_arcache(in_vec[53:50]),
    .s_axi_arprot(in_vec[49:47]),
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
    .s_axi_awready(out_vec[176:176]),
    .s_axi_wready(out_vec[175:175]),
    .s_axi_bid(out_vec[174:163]),
    .s_axi_bresp(out_vec[162:161]),
    .s_axi_bvalid(out_vec[160:160]),
    .s_axi_arready(out_vec[159:159]),
    .s_axi_rid(out_vec[158:147]),
    .s_axi_rdata(out_vec[146:115]),
    .s_axi_rresp(out_vec[114:113]),
    .s_axi_rlast(out_vec[112:112]),
    .s_axi_rvalid(out_vec[111:111]),
    .m_axi_awaddr(out_vec[110:79]),
    .m_axi_awprot(out_vec[78:76]),
    .m_axi_awvalid(out_vec[75:75]),
    .m_axi_wdata(out_vec[74:43]),
    .m_axi_wstrb(out_vec[42:39]),
    .m_axi_wvalid(out_vec[38:38]),
    .m_axi_bready(out_vec[37:37]),
    .m_axi_araddr(out_vec[36:5]),
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
    stim[0] = 228'h2dddf47d8f45c52e40e472e8332499f835461edbbfe1ef98920567c1f;
    stim[1] = 228'h0c5b7595bf83179fa3e8e1312352978aa4f66dde6c27ca77d864e1c20;
    stim[2] = 228'h874700944701a2c276787c0ad9117b146b4a5ac7abb4113865594dbb7;
    stim[3] = 228'hb83dd03ce1b3155df2950b41aecb18b0e49296aa067aa2134b38ddc1f;
    stim[4] = 228'haece8ccf82befd379157cfad384c56e6a7cbda35dc80f23afe98595b5;
    stim[5] = 228'he11f85abecc228936b1c59ab0623d9c726ade0ed7d6bc60844f3cb4e2;
    stim[6] = 228'ha70a93a37f82efa5875bc83f9b0278213ffeb628743bf88c33a4fe621;
    stim[7] = 228'hd2496be9a6c14a072d88d4c431806d8c615df56b9bb0c239dd0d0aac1;
    stim[8] = 228'hca785c6e1ba89d7a3ef327b6eb7d6e3c0f8d17f8dd11a3a5f2ed36122;
    stim[9] = 228'h91d6dc7205ef637e1d82fb005b49a4345738b16bea53058a54b461f76;
    stim[10] = 228'hca29212c7f8872c8b19792a059ebe1221c941faee064b2b818be7ab34;
    stim[11] = 228'hc7ce7c1335ba7304245ab9461955c106eadc1581c0fbab53d63cc5aa5;
    stim[12] = 228'h8e4c50acbfe70cc45d18438ccee89434e017058241b16e140c7d3ec21;
    stim[13] = 228'hec2c0e5a90946b16c04cc6ec0461b7d00d6e34638a8a1a214d27e6409;
    stim[14] = 228'he7d0292356edd60a100c676908637350a6b55493da82f84e134be6f31;
    stim[15] = 228'h97f3aff3ced00b8e55caca3b017a1e9eb1bb7dff1daed857f2ab2959f;
    stim[16] = 228'he0cd6af13f40d224e23dfe0fba7721cc734a967e72aacddf261b90c7d;
    stim[17] = 228'h89a1b59e85d8f266bfa79d0bc55402cd5d15eeae332542ef8f690bb0c;
    stim[18] = 228'hb59aed049b6949b40de9118fce427e3b7803b7f4ca20f2bda359494e9;
    stim[19] = 228'h9d228e91941980cd1278dd71fa281dcd00b641053122ed3f7377a61e7;
    stim[20] = 228'hbeb863d10b899d79b5841828fcd9fa07725fcdf8fa6c7a413bf8d0ffc;
    stim[21] = 228'h902401872f01b7003eceaa5aa232547e42ed2bafe0526b0f2585f0216;
    stim[22] = 228'hec27a49100ca43f5a9cae0738f0fef21e3100316e99c177ab36cda0e6;
    stim[23] = 228'hf70b9ba3a5fa351cc5d825c45ecdfbf49224940754bec648179f85a04;
    stim[24] = 228'hcb64c6e1d324ad57aeaa50f8cd6f89549cdb745c5f2922fb3ca552d6e;
    stim[25] = 228'hb1545559d849fb9c96553258b41e9982e0a27f78c06717705c82e6357;
    stim[26] = 228'h9744022665f138c015efe6279b5418414bbce4277e32b72e07a8615ba;
    stim[27] = 228'hd68c49ec0172d4310f6e9105d118dfc7bdb37305afc6c1b76214de23f;
    stim[28] = 228'hf74be531ca3f5b51c72e0137d11c91382961d3af8273c39897dc809e6;
    stim[29] = 228'h98998e4374a347558ba0ab8573e1d693c618fe1267e6552015c18afa5;
    stim[30] = 228'hd68e226e30f5ba4d4940791c56bc4d9856fc49720b9788a9178df6b97;
    stim[31] = 228'h8e3611d193b6f8aa89a8f79341c0fad74fc547ebbb54e54b70e623323;
    stim[32] = 228'hdc050c21b63e4ca09ce7a8bf8ef6cfb29717be574986f82d6c725a2e0;
    stim[33] = 228'hdc991df2f7863d9706ff769f8e5beb8d7ba958d4fb5e5d14caa674294;
    stim[34] = 228'h9e80752234d23617269fa90ae5159a3d4efa345a0c4fc24f110ddf60a;
    stim[35] = 228'ha26c6c0f55d1b64e625b3b5462968426606716a08c4e11e420b5ddf98;
    stim[36] = 228'he5768d0fbe7b5aecf34e206c18e6bad996b8dba938b9aab18191f35bc;
    stim[37] = 228'hb1a033b06ca42e6da5caceae69da95d33725196d07208534cde982615;
    stim[38] = 228'he0377479faeabaaf0fc5b348843065c11727c1e73cc942a27b13d18d2;
    stim[39] = 228'hdf33e2578e773ed8b81730056ca699ba3e9ba38e54f9fb0c934c3f4d3;
    stim[40] = 228'hb0494e549d1121b47a032b357d8146e2280b811ede183ece0fd047389;
    stim[41] = 228'hb4664edf555c2bb2c034cc377ad424d1e776d84247a583a8e272692cd;
    stim[42] = 228'hd9b7ef72455002c4fb532dd1345252f9193076ac208d0d5954ab5268d;
    stim[43] = 228'heea5c055dedfb769b7a6ab8a9b172d03b736f4c418ed68ac091d71d90;
    stim[44] = 228'hb889a742aa7d1e29646ac978a1a5c606276f2d0d1dff3ee2656540f76;
    stim[45] = 228'h90a0f30c5b9a1eb8584b3b900040370018298a842f807d8c53ac0de60;
    stim[46] = 228'h8043735a9cb57c687dd4081689f213da81223eedf929dcd13f51f2372;
    stim[47] = 228'hfd318e4d71ce0ea6acead9796cfee9ebb1b2acf4ab6b313e74b574bf5;
    stim[48] = 228'h877f1232ca481d39ade562f1f8d80234bbad0f2993454111f529cfcc3;
    stim[49] = 228'hd74c5ac1a414dac846d2c56f715e74c176c0ef0520c87359d9959a522;
    stim[50] = 228'hfdefff959988c91a8147881dce809db558b14125184968ee41d8401e9;
    stim[51] = 228'hb1b8da06376a0f1dcdb27e065f0a6c70821dff41306c7362b6d324d3a;
    stim[52] = 228'hd426498fff92de0758e1e31b622fdd3b2e4503e26852e9971317f3f23;
    stim[53] = 228'ha519c8fc14cea21143a1cacb7ac5fcf0ee6551058e061d037c6f86416;
    stim[54] = 228'h936ae98309b791dda02ed36075f892faafbdb1df31107e41851b06bfc;
    stim[55] = 228'hb8bd019e5b9e97e42b5bb52cb4d3560fd92daa22c7fe24a74bc243cec;
    stim[56] = 228'hf3a6ffa364eea96003499e1c9bc1f19e123003d5d1075559b0d057b5c;
    stim[57] = 228'he96d306e84c12f77e37778e605f625006a1aa9dbaa466d6f91c685bf0;
    stim[58] = 228'hb177d28367cf22513e70a4f6c52d2e3a031d0d676ab6eea80138a0342;
    stim[59] = 228'h93fcc78ef2d63552c9c0e0ca4f628c84bf1ba4728607e69e8d0246bf3;
    stim[60] = 228'hb3e21bb6ec955f3e95e8c66b5c0b1dce8f8467f2558b45071cc1e09d0;
    stim[61] = 228'h94be3d5dac242a2e5b056a771f89535bc39c0f673357e8b0b9599ac8f;
    stim[62] = 228'h85e5f65605895cd75563738f51733eb74d306a2c418ac6550903829d7;
    stim[63] = 228'he7c9b718f376d5466f2b34923d0ddb9579b424e22ba319f594ab9b533;
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
      expv[0] = 177'h000000000000000000000000000000000000000000000;
      expv[1] = 177'h000000000000000000000000000000000000000000000;
      expv[2] = 177'h000000000000000000000000000000000000000000000;
      expv[3] = 177'h18740c51ad296b1e8700944701be056c88bab4a5ac7a9;
      expv[4] = 177'h038382c3924a5aa805d03ce1b685a0d7658849296aa10;
      expv[5] = 177'h1aec8b9a9f2f68d7068ccf82bbe7d69c262e7cbda35d9;
      expv[6] = 177'h0611871c9ab783b58785abecc12cd58311e86ade0ed60;
      expv[7] = 177'h1a708884fffad8a18293a37f82641fcd8139ffeb6287c;
      expv[8] = 177'h052496318577d5ae016be9a6c36a6218c03415df56b81;
      expv[9] = 177'h1ca798f03e345fe3005c6e1bad93db75beb6f8d17f8d1;
      expv[10] = 177'h011d00d15ce2c5af86dc7205effd802da4d5738b16be0;
      expv[11] = 177'h1ca28c8872507ebb91212c7f8cc9502cf5f1c941faef9;
      expv[12] = 177'h047c841bab7056071e7c1335ba5ca30caae0adc1581d6;
      expv[13] = 177'h18e488d3805c16091450acbfe2a1c667744c017058254;
      expv[14] = 177'h06c2874035b8d18e040e5a909363760230ded6e34638d;
      expv[15] = 177'h1e7d0d429ad5524f08292356edb3b48431ba6b55493de;
      expv[16] = 177'h017f127ac6edf7fc0baff3ced7e51d80bd0f1bb7dff0e;
      expv[17] = 177'h1e0c8f31cd2a59f98d6af13f427f07dd3b9134a967e66;
      expv[18] = 177'h009a03357457bab889b59e85dbce85e2aa03d15eeae23;
      expv[19] = 177'h1b5998ede00edfd302ed049b6a08c7e7213f803b7f4d9;
      expv[20] = 177'h01d2173402d90414828e91941eeeb8fd140c0b6410535;
      expv[21] = 177'h1beb881dc97f37e38863d10b8c8c147e6cfb25fcdf8fe;
      expv[22] = 177'h010201f90bb4aebf9401872f00d52d51192c2ed2baff4;
      expv[23] = 177'h1ec21c878c400c5b8fa49100ca7039c787f63100316eb;
      expv[24] = 177'h077087d24892501d0b9ba3a5fe12e22f66fb224940742;
      expv[25] = 177'h1cb60d52736dd1710cc6e1d323287c66b7c1cdb745c53;
      expv[26] = 177'h0315060b8289fde31c5559d84e992c5a0f480a27f78cb;
      expv[27] = 177'h197409052ef3909d84022665f0f313cdaa08bbce42779;
      expv[28] = 177'h0568971ef6cdcc168449ec01704882e88c6fdb37305a1;
      expv[29] = 177'h1f748ce0a5874ebe03e531ca38009be88e48961d3af80;
      expv[30] = 177'h0189824f1863f849818e4374a255c2b9f0ee618fe1269;
      expv[31] = 177'h1d689e615bf125c806226e30f63c8e2b5e256fc497205;
      expv[32] = 177'h00e3035d3f151fae8e11d193b57bc9a0e07afc547ebb2;
      expv[33] = 177'h1dc01eca5c5ef95d050c21b638d45fc77b67717be575d;
      expv[34] = 177'h05c98635eea56353811df2f7833b4fc72df3ba958d4ec;
      expv[35] = 177'h19e808f53be8d16808752234d35485728acaefa345a02;
      expv[36] = 177'h02268099819c5a820c6c0f55d71daa314b4406716a08b;
      expv[37] = 177'h1e570b665ae36ea4868d0fbe7e90360c735b6b8dba935;
      expv[38] = 177'h031a074cdc9465b40033b06ca6675734ed4d725196d01;
      expv[39] = 177'h1e030f045c9f079c877479faef59a4421835727c1e721;
      expv[40] = 177'h05f306e8fa6e8e3903e2578e749802b65349e9ba38e5c;
      expv[41] = 177'h1b048b88a02e047b094e549d12959abec0a680b811ede;
      expv[42] = 177'h034603479ddb6109064edf5559661bbd6a14776d84241;
      expv[43] = 177'h1d9b0be464c1dab09fef72455296e89a292b93076ac26;
      expv[44] = 177'h06ea140edcdbd31005c055dedcd5c54d8b95736f4c415;
      expv[45] = 177'h1b8888189dbcb43409a742aa7c64bc50d2e676f2d0d1f;
      expv[46] = 177'h010a040060a62a1080f30c5b9c9dc800201f8298a843c;
      expv[47] = 177'h18040f6a0488fbb78b735a9cb4840b44f90a1223eedee;
      expv[48] = 177'h07d307aec6cab3d2818e4d71cb6cbcb67f711b2acf4b9;
      expv[49] = 177'h187788d2eeb43ca6071232ca4c3178fc6c03bad0f2980;
      expv[50] = 177'h05748305db03bc149c5ac1a41462b7b8af3d6c0ef053a;
      expv[51] = 177'h1fde9ed562c504940fff95998d440ee7404d8b1412517;
      expv[52] = 177'h031b91c20877fd0488da06376e3f032f853421dff413b;
      expv[53] = 177'h1d421cecb9140f8986498fff93f18db117ece4503e274;
      expv[54] = 177'h025193c3b995441601c8fc14c86565bd62fce6551058c;
      expv[55] = 177'h19368beabef6c77c8ae98309b669b03afc4afbdb1df3e;
      expv[56] = 177'h038b803f64b6a88b05019e5b9a5a965a69af92daa22d1;
      expv[57] = 177'h1f3a0e7848c00f570effa364e84f0e4de0f923003d5ca;
      expv[58] = 177'h06968401a86aa76e8d306e84c33c7302fb14a1aa9dbb7;
      expv[59] = 177'h1b1718e80c74359d87d28367c8d27b62969631d0d6775;
      expv[60] = 177'h013f9212fc6e91ca04c78ef2d1706527b145f1ba47290;
      expv[61] = 177'h1b3e1f3a3e119fc9021bb6ec97e335ae058cf8467f240;
      expv[62] = 177'h014b856f0e703d9c863d5dac27b53b8fc4aa39c0f6735;
      expv[63] = 177'h185e1add34c1a8b11df656058bb9c7a8b99ed306a2c42;
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
