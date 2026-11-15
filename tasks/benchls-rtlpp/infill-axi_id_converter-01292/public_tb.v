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

  rtlpp_01292 dut (
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
    stim[0] = 228'h0aff4c5a26608cc6a837cbfe39e991f54e65fa37d78f82896f2f694ac;
    stim[1] = 228'h1aa006b4d39f885e4db41b12c40cc90ea4552a0e076a98c74376b93c8;
    stim[2] = 228'hc714d9cffc4a7fd870662b7c261f46d73eabffc22096216ac6b4a6440;
    stim[3] = 228'hd39c3f095f21897ced8b5665b4770dbeeb5d9891e26118a7c460c864b;
    stim[4] = 228'hdc5ccdedc651538cdcd1f0ff33abd828fed0867584778d7b500819002;
    stim[5] = 228'hbb89fbabc609464d6384d7161ae497fa9a7d9f2e0ce1d87059bc7a956;
    stim[6] = 228'he8a2bb8a336ae480c3c536c419ba9076869d2f9f206ba0d402373338d;
    stim[7] = 228'hc9ecc329e354458c6d929f42b03a57f5b250320c07cb6e6dbf16df855;
    stim[8] = 228'hd6b2d41c8fdc544d41b4fefa3d96febd219a8a3182d4421a951fc07e6;
    stim[9] = 228'ha7a7617caaf707b13c00a45cd0cca1b7eed5e5309ce2a4ebef6727a36;
    stim[10] = 228'h9bb27d740d2ef4f14e37ed94a893e9018b3f143de27a77feb56ced0a0;
    stim[11] = 228'hf2f9930444c6ce9d7202444e2b5e4be9f5ecc0364524aee91336b1e63;
    stim[12] = 228'hb3c08b20db84eaf29e4ea33de50cf3730970a7d762e35bf7823134067;
    stim[13] = 228'hb861411eb002388951c547b7d7fd76ffebd351b601149ea27e93826f4;
    stim[14] = 228'h9bc98555c90396917121403ffb1b4134c041b631a1a2a897f82c85b5e;
    stim[15] = 228'he137bf0a9eef665ad7d5a2046f085e9057e60257f90afa8490a9adf98;
    stim[16] = 228'had53304cc967f60c4e57d3238ec6cf1826a9c84a530e3792806b27940;
    stim[17] = 228'hfac3b23fe093d9509614931fa88c7b9b4657a8845bf8acbc80256e42f;
    stim[18] = 228'hebb1cd139c90bbeb769d218c518f600cee1a055835a5f43dfd85a5a04;
    stim[19] = 228'h9a732dafc4327ac55d8766a5562f2b7b824f38f2bcf22f578ba832322;
    stim[20] = 228'hcbe344a71ac7494b09f94b8639680605f82f4e17d3fef2e60c759d153;
    stim[21] = 228'hb9fc987f1856ca80b043e82097fa2a3aa63342eb3cd928a08a5711531;
    stim[22] = 228'hcf3a3cc84c34e7b7ca771c805b6be0a4bb9d0588fb0b8e0d752597ebb;
    stim[23] = 228'h8c3fc7bbd0d0575d258ccbf33c26fe5a26a7c46f4bda3801aa9e44316;
    stim[24] = 228'hb5b8f35f4a4db168fc4a406676b4a80a23c7f6659dd828a67b24da2a0;
    stim[25] = 228'h5cd40c6b239b06b46a4a65dc7c9b3d671b0b95263ab7ed1f22b48de19;
    stim[26] = 228'hc59aba22b2f4ebb81330ca3208b46802669c09b3ab631c50602e0755a;
    stim[27] = 228'ha5ab24ca066bfdf23524ffd4836d666d24f2fa7b3a075ad4e5b5290ab;
    stim[28] = 228'he906f33b93fe1cf832f64deef6868df80bc560a43c01b9c91a5a7f283;
    stim[29] = 228'h8d127f1e9274737ca9178ad9a6cc8c4248a055b9512a23fccedd30a35;
    stim[30] = 228'hb713802a2c4cb20c62a97846099bfbc35dcd9d7d6840a70604eaa316b;
    stim[31] = 228'he557530882169038f01795f757213a9188c8ea7bf085098c55280c98f;
    stim[32] = 228'hf9eaeebf9442d7a526d9cc06f0d2a9644a2abffed61f34f9069604575;
    stim[33] = 228'hb542c0b65425452a652d719daf07f32bc1490ac77e913b8d92c9c3014;
    stim[34] = 228'ha4568ffbb5427096a85c175a88f91d09421fc8a7655d9b309b15050d0;
    stim[35] = 228'hf3a45280ee00e202df79fc8272ca66446ee430e0ab4a0763c49402b39;
    stim[36] = 228'he519e724df71360074a3e41e2a2ff09eaa962b7f53f1fe39f11ad23b5;
    stim[37] = 228'hf753e602fd4144e98aacc8092dfb1e84b655144cb9e8da96cef71f9a2;
    stim[38] = 228'he34a2952730b8979681b9d66d7c51e2a43f02f30314f1c51e98ad70ea;
    stim[39] = 228'h9fdff6ee019ae674387d46cb117a707a0da3d35bd157a99867a32813c;
    stim[40] = 228'hdc9b03ec459a0419cec04a62bffe9a45bd81cd9b6a9497ae90fb30e8d;
    stim[41] = 228'haeded1039d1f0b6634d89ffef41c91155fefdb02805afbc0e63dfa87f;
    stim[42] = 228'hf186a36a17ca679e4e31178861fd0a4afd2690346d7c3ad4025e0c664;
    stim[43] = 228'hcb8346df6e6bb88a1e919bad72f977e6ecbbdeab0005e1808c265a641;
    stim[44] = 228'he96a5d00e52be16d00884a12504b1c2b73ef2beb25f406f66050ea3a8;
    stim[45] = 228'hb2b0acd9b9a5b07dc34e0f8166b6e2cb0d7b49e9ad9039de2ac43d5ad;
    stim[46] = 228'hbab039d0011dc4640eda25ed1c1ac79fd4936502952a744908d5da022;
    stim[47] = 228'hfdb2644874c0f0ee0de82a0d9834b2a89fc106f17bf409ed21710a5d0;
    stim[48] = 228'h932ad375767579f9f3be85c4f49258e5f5565923aeeee186cba0250da;
    stim[49] = 228'hd3ec26cc9181f1188f839f5dd1815de023cb646b1be95bdee5a9b7c2a;
    stim[50] = 228'hea9aa456a5d8ea35f0358589be4cb209ea83e6309bf422d291a8f3251;
    stim[51] = 228'ha15650b1abdcfb8bb0a0a419ffa8c4cc77173ede4d37a99632391425c;
    stim[52] = 228'hfc286d4927a74123b719ff8bca7905cab5abd91f92948c97e11280742;
    stim[53] = 228'hb2e03bc868dcf069d15cc727e4d29a05480bd23931542eb4baa2dd686;
    stim[54] = 228'h8f389930f974f5ce57dac3e08395ca471a13efeb38ed5a482634725ea;
    stim[55] = 228'haa08cf25312ecb18acf74d0c3e421141a2f8c31a4ef75116ea9c36b95;
    stim[56] = 228'h8d96ee037e21de135d6abc115c1aa21a44815a4e1a9e5aed164c19103;
    stim[57] = 228'ha39657564c6df0b26e3064a07ec7c279af13c739307a302510242928c;
    stim[58] = 228'hece95aa3c0d4ad22c67a5cdaf1422d8f909275ccc67e3acd810967852;
    stim[59] = 228'hfdee34c9efac11a78cd9e0e588e0dcc3199321c7e20f822080e427133;
    stim[60] = 228'he5ebe287b08855555b2fcff1b33b92a887f0e845f9ecc4837f32ca5c4;
    stim[61] = 228'hd592a27eeccc4fe786a602017ff2d33596fb19f8dd0ba6fba8a4cb106;
    stim[62] = 228'hb7c03ba990e9fba7511c2c29cdfc8e5a356b46180eece8d66f1f365c3;
    stim[63] = 228'hee2fc45f27fe022eb87400e30ad2088ef2eec1ea9cc12b6877e9733be;
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
      expv[0] = 177'h00af87d500000000074c5a266365ff1cf4c8e65fa37c0;
      expv[1] = 177'h01aa043a800000000006b4d39f0d896206604552a0e0e;
      expv[2] = 177'h0471035c8000000004d9cffc4c95be130fa7eabffc233;
      expv[3] = 177'h053986fb80000000043f095f262b32da3b84b5d9891ed;
      expv[4] = 177'h05c580a38000000004cdedc656f87f99d5e9ed0867587;
      expv[5] = 177'h03b887ea0000000001fbabc60e6b8b0d724fa7d9f2e0f;
      expv[6] = 177'h068a01da0000000002bb8a33681b620cdd4869d2f9f32;
      expv[7] = 177'h049e87d68000000004c329e3564fa1581d2f250320c17;
      expv[8] = 177'h056b02f48000000002d41c8fde7f7d1ecb7e19a8a3180;
      expv[9] = 177'h027a06df8000000007617caaf0d22e686650ed5e53093;
      expv[10] = 177'h01bb040600000000027d740d2876ca5449f0b3f143dfb;
      expv[11] = 177'h072f87a78000000001930444c6a22715af235ecc03657;
      expv[12] = 177'h033c05cc00000000008b20db81d19ef2867a970a7d76f;
      expv[13] = 177'h038603ff8000000001411eb004a3dbebfebebd351b60d;
      expv[14] = 177'h01bc84d300000000018555c900a01ffd8da0041b631b4;
      expv[15] = 177'h061302410000000007bf0a9eedd10237842f7e60257fc;
      expv[16] = 177'h02d504608000000003304cc9666991c763666a9c84a58;
      expv[17] = 177'h07ac066d0000000003b23fe090c98fd4463a657a88455;
      expv[18] = 177'h06bb00338000000001cd139c9590c628c7b0e1a055839;
      expv[19] = 177'h01a705ee00000000032dafc432b352ab179224f38f2b6;
      expv[20] = 177'h04be0017800000000344a71ac525c31cb40782f4e17db;
      expv[21] = 177'h039f80ea8000000004987f1850f4104bfd1263342eb35;
      expv[22] = 177'h04f3829280000000023cc84c330e402db5f1b9d0588e4;
      expv[23] = 177'h00c381688000000007c7bbd0d665f99e137e6a7c46f5c;
      expv[24] = 177'h035b80288000000000f35f4a4ca0333b5a503c7f66595;
      expv[25] = 177'h05cd059c00000000040c6b239a32ee3e4d9db0b952634;
      expv[26] = 177'h045980098000000002ba22b2f4e519045a3069c09b3ae;
      expv[27] = 177'h025a81b4800000000324ca0669ffea41b6b64f2fa7b2e;
      expv[28] = 177'h069007e00000000006f33b93fca6f77b4344bc560a43e;
      expv[29] = 177'h00d1010900000000027f1e9276456cd366448a055b953;
      expv[30] = 177'h0371070d0000000003802a2c4e3c2304cdfbdcd9d7d70;
      expv[31] = 177'h06550246000000000753088214cafbab909a8c8ea7be4;
      expv[32] = 177'h079e85910000000002eebf94426603786950a2abffedb;
      expv[33] = 177'h035404af0000000002c0b6542538ced783fa1490ac77c;
      expv[34] = 177'h0245042500000000068ffbb5430bad447c8c21fc8a76d;
      expv[35] = 177'h073a011180000000045280ee01fe41396536ee430e0a3;
      expv[36] = 177'h0651827a8000000001e724df70f20f1517f8a962b7f5d;
      expv[37] = 177'h077502128000000003e602fd44640496fd8f655144cac;
      expv[38] = 177'h063480a900000000022952730c4eb36be28e3f02f302e;
      expv[39] = 177'h01fd81e80000000007f6ee019aa36588bd38da3d35bd4;
      expv[40] = 177'h05c98116800000000303ec459c25315fff4bd81cd9b69;
      expv[41] = 177'h02ed84550000000006d1039d1bcfff7a0e49fefdb029e;
      expv[42] = 177'h0718012b8000000006a36a17cf0bc430fe83d2690347e;
      expv[43] = 177'h04b8079b800000000346df6e6dcdd6b97cbecbbdeab10;
      expv[44] = 177'h069680ad80000000025d00e52e250928258d3ef2beb23;
      expv[45] = 177'h032b032c0000000000acd9b9a607c0b35b72d7b49e9be;
      expv[46] = 177'h03ab067f000000000039d0011a12f68e0d6749365029a;
      expv[47] = 177'h07db02a20000000002644874c71506cc1a5bfc106f167;
      expv[48] = 177'h013283978000000002d3757674c2e27a49295565923b0;
      expv[49] = 177'h053e8780800000000426cc91844faee8c0ac3cb646b0e;
      expv[50] = 177'h06a980278000000002a456a5dac2c4df265aa83e63092;
      expv[51] = 177'h02150331800000000650b1abddd20cffd4657173ede54;
      expv[52] = 177'h07c2872a80000000006d4927a1ffc5e53c855abd91f84;
      expv[53] = 177'h032e001500000000003bc868dce393f2694a80bd23935;
      expv[54] = 177'h00f3811c00000000009930f977e1f041cae3a13efeb2e;
      expv[55] = 177'h02a085068000000000cf25312c26861f21082f8c31a48;
      expv[56] = 177'h00d900690000000006ee037e21de08ae0d524815a4e0f;
      expv[57] = 177'h023901e6800000000657564c6932503f63e2f13c73939;
      expv[58] = 177'h06ce863e00000000015aa3c0d12e6d78a11509275ccde;
      expv[59] = 177'h07de830c000000000634c9efab7072c4706d99321c7e1;
      expv[60] = 177'h065e82a20000000003e287b08ae7f8d99dca7f0e845e0;
      expv[61] = 177'h055904d60000000002a27eeccb0100bff96b6fb19f8d3;
      expv[62] = 177'h037c016880000000003ba990eb9614e6fe4756b461816;
      expv[63] = 177'h06e2823b8000000007c45f27ff80718569012eec1ea97;
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
