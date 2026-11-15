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

  rtlpp_02911 dut (
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
    stim[0] = 228'h2b6a26ff0d605cedb1525e73a7a3a62f3b1746733c21683b7349890f5;
    stim[1] = 228'h06bad4003f2d3bf450831410d247f7c14165d538872b305e36cc6b236;
    stim[2] = 228'hc3cd8c5219cf0b31774d351febe7f9e4b70f130e9114e8817d6154de2;
    stim[3] = 228'hb14b4dccdaaad089284b7da466324523759dd9adb01fedcb23194c496;
    stim[4] = 228'hda2517bb74beae11a0e0ab3407f5e6e93b79d4c1f8c79bf66c697463c;
    stim[5] = 228'hd2f8ab0ba10966cac66bb874f83258bdf4137c31c292c3bfa68b70da2;
    stim[6] = 228'hb9f0e70f07084aac6e1f10951f41f5c8aa916552359418e2c79c926bf;
    stim[7] = 228'hc743c1c21605f70d7cfa80e788fdaa9d474eea08393e5be5d51c7eda3;
    stim[8] = 228'h97fd14eaf23378868c8e5bc3ce85a9b64b585a77b609f964747049b24;
    stim[9] = 228'hfad8c608ab2c5e71937867a5fcb6b103965c35d48269dffa440f3552f;
    stim[10] = 228'hbf0399042dfce3642d4744d52154075d0a1525a4529ec86338ccc2078;
    stim[11] = 228'ha16f2c954fe2c80c40bf97682d581870503056803ece9c4e9f34d08c2;
    stim[12] = 228'hc328eb1e97b492191979debac3872a3726651bca09e81ed9c9ab702f1;
    stim[13] = 228'hb030642c46fb62696bf039c01ee3ca758c5a189e89c3df200312bd95e;
    stim[14] = 228'hb5f884f7a69fde721590f41ba5c8340c1c47192ab46dfff3a22fdec8d;
    stim[15] = 228'h3ca67d2e8ad1cae9d0886dea28ecc735d582fe48e10efccd798966b23;
    stim[16] = 228'h94b0914df8db9940591265c2d63fe42c87d847e3801819ed1f63c6f00;
    stim[17] = 228'h934ec4d6a8832c1a29fe078ad8267a249841effe4ef9e6f35e606185a;
    stim[18] = 228'hf1ea577d10907b2dc439b679c922e7258f4669ab22cc37eee0c5ac860;
    stim[19] = 228'hb456f49e4ec1d67858e553e09261cb6cb0977e63afbe35aeede2bd9f5;
    stim[20] = 228'hd9726dd95ea5d4e0411252529075a364d7f01004bf7ea53b6000f536f;
    stim[21] = 228'hde4f5457a71acb461bce0be9da28c713d49de2f815c20be805bae121f;
    stim[22] = 228'hbaa585eaa94e7062bbd5f15f22c250218244b5c643ff9b9899309dbbb;
    stim[23] = 228'h83ab87192331f565efcdf64a015b3003c0da14ead4404295d9d804c70;
    stim[24] = 228'h8a0df1b64dd2a435e4e5da6108670aa73a068e6a41c5e4f02702a3d81;
    stim[25] = 228'h9e2f93469e260c9993b2360176baf9abfbc86ccbd7b9e38ddbd6522ed;
    stim[26] = 228'h8fd24ca660729fc0ac891456a017785789dc3e731aa1b7dfda1e6f826;
    stim[27] = 228'h8f2f66d67df1dac71e1cb2d58fe4a3a407146a91dc067f83ac78473bf;
    stim[28] = 228'hb1dba16b7b55806bbcd096f72dbe9d31a2683aa411c0b31cb78f8655f;
    stim[29] = 228'hba191d336961f002de46489498ab8eedb08233305ef4690bbfe5624d0;
    stim[30] = 228'hdb55fcf93ce75fffffbe0f35127d473c5dc00c86c6f60b622335ef4b4;
    stim[31] = 228'hc53b9680a2b2a11f1df3437d186b769a143d4ee3bf621b70fcd60eeb5;
    stim[32] = 228'hdd3985a8654ac5d29bd29aba80d1e237d4f5ed04477959fc69193c6a7;
    stim[33] = 228'hb12f9435ea0b995661df55da35dd4e7d044cb5280f4e989cae4dfcf98;
    stim[34] = 228'had7059e328a04eaf6a8dba6c721996da52e98f618da7ae8c3365c4175;
    stim[35] = 228'he4441be892738abf2377ddbb029f02c459621ac38fa65025e86586fdd;
    stim[36] = 228'hf509fe184d2734dfa1589d20cb7bd0bce54c2379773b4d747088c2ab3;
    stim[37] = 228'he7c33aa7d919fbed193b0968931b0b0d66aa558d80ddd7f78325c1451;
    stim[38] = 228'ha35d75ead4e12a63eeb3c35e738f23bf22aa79cd63e0506b468f90957;
    stim[39] = 228'hdb60a60cb211f238de923e5c8dd1d9d1980e14ad6de71ced550d23721;
    stim[40] = 228'h83d086078a0a7bf7293be0585b7c6590ac49f1edd7b6d10b4ebd81603;
    stim[41] = 228'hdf21816c46396d19d407505f4da760ebe1a23d9a3c7fbdee497cdf3ff;
    stim[42] = 228'ha03cc72efd96b3d74f7b05bd036181b4fe2f3ca3cedc74fb9f2f565a6;
    stim[43] = 228'hacc74d716bc04d7f0cf2fbdc84e5393ec280669c4e8dbf88d194046c7;
    stim[44] = 228'hef323be391619beb5bf03d510787b69a1811b009815997a8ee598a698;
    stim[45] = 228'hff8b4186bb1ebc013f30c902ad5bcdb9402f8ece1927541a3a9cfe69e;
    stim[46] = 228'haaf8671f82413ad963796daa63b81acdd75a236f8f483f0a89e48600e;
    stim[47] = 228'h8bdfd08e107ad68d5f3486205376b4f63d4886992bfa35f815c2b2923;
    stim[48] = 228'hb34d1365392d121f9a94d8de21c04c71d719b5891dd26315e8f1679f1;
    stim[49] = 228'hf89e6b0d9d53c2c2171c0939cd1393dc152eb2ab5309d46ac6135be76;
    stim[50] = 228'hcddcbaa6c5f0c6875e77a1df6fe70d991d2143f4f69d41bc851bfc6f4;
    stim[51] = 228'hc5307d9550c82023a4ced107074b4f9dbd7a8451423cc8fdd2c11a1c4;
    stim[52] = 228'hb5dd4076197e816d66744326a4b5d8fc47765d9c2d4e60864da29c7c2;
    stim[53] = 228'h55669119d3c4077fb9cc6d9a447c9531e6b6b9d0d9238822f39acc2d4;
    stim[54] = 228'hc470f8d99283ac95cf54423094164d926dd91415568fa6ead9e795327;
    stim[55] = 228'hd91a96846827f4d2232157c101226a176f1f87b7970606d6e5df8a7a9;
    stim[56] = 228'h8b83d0b2d1777919fae99816d14f40ab046ea7728aceb229bde46c4fc;
    stim[57] = 228'he03c700256231d123c8787cdcc61c87b5e35dd7082d18305315d83b00;
    stim[58] = 228'heecf219f91db0c49a038bac17460ce5a74d1959d34d3c48b263677000;
    stim[59] = 228'he0f504308f4855b6a8f168b80cd15679b0d1ac8958af305cefd2bd1ea;
    stim[60] = 228'hfd5b231e52a3f8c9513ed34a61ec08e933648d9b284b1c8eb02a2b7d2;
    stim[61] = 228'h8d3797ed555e66b88805c50e8c2336723ddf60b5277b0b947ccdd9000;
    stim[62] = 228'hf4fd065d2b14993988211d2d97bce97adcddef4bc0caaa82be66e1a08;
    stim[63] = 228'hc76fcab3e43acdbdc6da6ae8623b4e49bc0891afa82b3f36d0235b164;
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
      expv[0] = 177'h1ab6b0bcf349890f5a26ff0d66af39d3d1d7b17467335;
      expv[1] = 177'h186be70536cc6b2372d4003f2a8a086923fe165d5389a;
      expv[2] = 177'h043c9792fd6154de358c5219c89a8ff5f3f970f130e94;
      expv[3] = 177'h0b14b48da3194c49734dccdaac3ed233192559dd9adb6;
      expv[4] = 177'h15a263a4ec697463d517bb74b8559a03faf7b79d4c1ef;
      expv[5] = 177'h1d2ffaf7a68b70da30ab0ba10d5c3a7c19294137c31c1;
      expv[6] = 177'h039f2f22c79c926bf8e70f070e084a8fa0fca9165522f;
      expv[7] = 177'h04745a75551c7eda3bc1c21606c073c47ed274eea082f;
      expv[8] = 177'h017fc6d9747049b25514eaf2332de1e742d0b585a77bf;
      expv[9] = 177'h1fada40e440f3552f8c608ab28b3d2fe5b5965c35d48f;
      expv[10] = 177'h03f0357438ccc2079399042dfa226a90aa06a1525a447;
      expv[11] = 177'h0a16e9c11f34d08c372c954fe64bb416ac0903056802e;
      expv[12] = 177'h1c3298dcc9ab702f18eb1e97b4ef5d61c3926651bca0e;
      expv[13] = 177'h030301d60312bd95f0642c46fc1ce00f71e2c5a189e8d;
      expv[14] = 177'h135fb830222fdec8d884f7a699fa0dd2e41dc47192abf;
      expv[15] = 177'h0bca54d7798966b23e7d2e8ad4b6f5147667582fe48fe;
      expv[16] = 177'h094b50b21f63c6f010914df8d8b2e16b1ff47d847e38f;
      expv[17] = 177'h1134b0925e606185b6c4d6a88503c56c133b841effe53;
      expv[18] = 177'h0f1eec9660c5ac8612577d10965b3ce49176f4669ab3b;
      expv[19] = 177'h0b456db2ede2bd9f5ef49e4ec4a9f04930e30977e63b9;
      expv[20] = 177'h1d9735936000f536fa6dd95ea02929483ad37f01004b1;
      expv[21] = 177'h0de4844f05bae121ff5457a71b85f4ed146749de2f807;
      expv[22] = 177'h1baa088619309dbbbd85eaa949f8af916128244b5c64c;
      expv[23] = 177'h103ad80f59d804c713871923327b2500ad980da14eac0;
      expv[24] = 177'h10a0829ca702a3d81df1b64dd26d30843383a068e6a53;
      expv[25] = 177'h09e2deafdbd6522edf93469e249b00bb5d79bc86ccbd0;
      expv[26] = 177'h18fd795e5a1e6f82724ca660700a2b500bb89dc3e731a;
      expv[27] = 177'h00f2be902c78473bff66d67df3d96ac7f2527146a91dc;
      expv[28] = 177'h1b1dccc6b78f8655fba16b7b55cb7b96df4c2683aa418;
      expv[29] = 177'h0ba1bbb6bfe5624d111d336961a44a4c55c7082333054;
      expv[30] = 177'h05b524f12335ef4b55fcf93ce7879a893ea7dc00c86c7;
      expv[31] = 177'h14538a687cd60eeb5b9680a2b7a1be8c35bf43d4ee3af;
      expv[32] = 177'h1dd3c0df69193c6a7985a86549cd5d4068f34f5ed044f;
      expv[33] = 177'h1b12c9f42e4dfcf9979435ea0b2aed1aeea644cb5280c;
      expv[34] = 177'h0ad743693365c4175859e328a75d36390ccf2e98f6194;
      expv[35] = 177'h06445b11686586fddc1be892776edd814f839621ac389;
      expv[36] = 177'h1750c2f3f088c2ab39fe184d274e9065bde854c237967;
      expv[37] = 177'h167c7c358325c1451b3aa7d91e84b4498d826aa558d8b;
      expv[38] = 177'h0a35b6fcc68f90957d75ead4e161af39c7922aa79cd6b;
      expv[39] = 177'h0db65746550d237218a60cb2149f2e46e8e980e14ad6f;
      expv[40] = 177'h083d3642cebd81603886078a0b702c2dbe34c49f1edc8;
      expv[41] = 177'h0df263afc97cdf3ff9816c463ca82fa6d3b01a23d9a3f;
      expv[42] = 177'h1a03bed39f2f565a74c72efd9302de81b0c1e2f3ca3db;
      expv[43] = 177'h0acc0cfb5194046c7f4d716bc77dee427298280669c5c;
      expv[44] = 177'h0ef30a686e598a69923be391659ea883c3df811b00989;
      expv[45] = 177'h1ff8a6e53a9cfe69f34186bb18e48156ade402f8ece08;
      expv[46] = 177'h0aafab3709e48600f0671f824436d531dc0b75a236f9c;
      expv[47] = 177'h18bd83d895c2b2923fd08e107ec31029bb5dd4886993b;
      expv[48] = 177'h1334d9c768f1679f1d1365392fec6f10e025719b58910;
      expv[49] = 177'h0f89af7046135be7766b0d9d51849ce689cb52eb2ab4b;
      expv[50] = 177'h1cddce64051bfc6f54baa6c5f3d0efb7f385d2143f4e1;
      expv[51] = 177'h1c535e76d2c11a1c507d9550c9688383a5a7d7a845147;
      expv[52] = 177'h035de3f14da29c7c354076197e2193525ae87765d9c30;
      expv[53] = 177'h05562cc7f39acc2d569119d3c7b6cd223e4c6b6b9d0c5;
      expv[54] = 177'h0c472e49d9e7953278f8d9928221184a0b24dd9141553;
      expv[55] = 177'h1591e85de5df8a7a9a968468212be0809132f1f87b782;
      expv[56] = 177'h08b81aac3de46c4fd3d0b2d174cc0b68a7a046ea77299;
      expv[57] = 177'h0603d1ed315d83b01470025621c3e6e630e1e35dd7080;
      expv[58] = 177'h0eecb169a636770017219f91dc5d60ba30674d1959d20;
      expv[59] = 177'h1e0f49e6efd2bd1eb504308f4b345c0668af0d1ac895a;
      expv[60] = 177'h0fd5eba4b02a2b7d33231e52a4e9a530f6013648d9b2c;
      expv[61] = 177'h10d341c8fccdd9001797ed555c628746119fddf60b524;
      expv[62] = 177'h074fadeb3e66e1a095065d2b140e96cbde71cddef4bd4;
      expv[63] = 177'h1476e926d0235b1657cab3e43e3574311da7c0891afbd;
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
