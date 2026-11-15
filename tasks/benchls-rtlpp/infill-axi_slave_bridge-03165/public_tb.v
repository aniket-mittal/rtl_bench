// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 230;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03165 dut (
    .aclk(clk),
    .aresetn(in_vec[229:229]),
    .s_axi_awid(in_vec[228:217]),
    .s_axi_awaddr(in_vec[216:185]),
    .s_axi_awlen(in_vec[184:177]),
    .s_axi_awsize(in_vec[176:174]),
    .s_axi_awburst(in_vec[173:172]),
    .s_axi_awlock(in_vec[171:171]),
    .s_axi_awcache(in_vec[170:167]),
    .s_axi_awprot(in_vec[166:164]),
    .s_axi_awregion(in_vec[163:160]),
    .s_axi_awqos(in_vec[159:156]),
    .s_axi_awvalid(in_vec[155:155]),
    .s_axi_wdata(in_vec[154:123]),
    .s_axi_wstrb(in_vec[122:119]),
    .s_axi_wlast(in_vec[118:118]),
    .s_axi_wvalid(in_vec[117:117]),
    .s_axi_bready(in_vec[116:116]),
    .s_axi_arid(in_vec[115:104]),
    .s_axi_araddr(in_vec[103:72]),
    .s_axi_arlen(in_vec[71:64]),
    .s_axi_arsize(in_vec[63:61]),
    .s_axi_arburst(in_vec[60:59]),
    .s_axi_arlock(in_vec[58:58]),
    .s_axi_arcache(in_vec[57:54]),
    .s_axi_arprot(in_vec[53:51]),
    .s_axi_arregion(in_vec[50:47]),
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
    stim[0] = 230'h0203a97f4596719a69faf452cca85cc391f5594b93b21e00ee2ee98f0c;
    stim[1] = 230'h0fcb38c795ebed809910553bdeb660e3bd1a9e0bbf064251b3f3986d56;
    stim[2] = 230'h1c3bba3963e7c3753d92646261f30cbcab0f5f3721ccbf116637404c9b;
    stim[3] = 230'h26289b18316e2d7e47a6b6549d3ede9312912ecfc0f2691aa636e053a9;
    stim[4] = 230'h09b0eff0c2cb2c373aa1a7f89d03fba6c16415dc749ee1bf136315c9af;
    stim[5] = 230'h32fa46e45a3e34c5d9953f810ad41912cd6c82b24888500dec8043f562;
    stim[6] = 230'h3d511e961a39b710355d66e4ea1dce8a1d5cf1f34554bdff99063eb655;
    stim[7] = 230'h324f0b74627905eb3a080792de36233b0d757e25c5d7ee6c04d03998fc;
    stim[8] = 230'h2a5a96dd3d88867c45023edcedab775cf6e563078a2736fc65a583c132;
    stim[9] = 230'h32d5f8ebd25ffe4e721462629d11f958f31f26ab3b75dcc264eb416651;
    stim[10] = 230'h2e8da57f8fa85f29cf10cc983609468bf88c3506623e717968172d3c39;
    stim[11] = 230'h316f1945241769c817a7d399a7b961f3b316b1fdbb7271ed349105cb0b;
    stim[12] = 230'h2b0484ffdefd9f4c133cdd7a13c108f329c8c4ab63112a27e9e4c09d0c;
    stim[13] = 230'h30392b5e4106586458c7bd3d2dee5ac06c3f7f43d7cc1cbdc7fe5075f8;
    stim[14] = 230'h2acc16121c1e345bf9acebde87bf9e3804e0efb9847438480c9dbe6dc4;
    stim[15] = 230'h23c1714dad27a86850d700c895e1aca8492a61bfebc8599ccc6b571ee5;
    stim[16] = 230'h2c8fbeb7436ee7b9a6779016499ec9d75aa3fad44a183808b127e34b4f;
    stim[17] = 230'h3a09ea10e4d26e43ea030e88c543e0fb0ad6afc7d69dd3dd35b40061f0;
    stim[18] = 230'h3a80942af3fafd99423c2f1f3731aaac1f2e582ca6816d1c6b3f360c1f;
    stim[19] = 230'h3741b6392f516ccdd94f38d41c140b2c0d9d1b1325451b036017edb8e0;
    stim[20] = 230'h251c9fd3589d5639ddad446362d09216a61dbb3e3309a364b36c9b507a;
    stim[21] = 230'h29e3ee3f445dba5f9a99e54816fdb42e5bc9fa4b95c1e154f0f2158c7b;
    stim[22] = 230'h33763a437bdba59d3bb23aece9731a56c5384cadf856f526b5a4c1f9e7;
    stim[23] = 230'h2a7ce7b35352dfb596762ffcba785c2cf2d12c41408428ba43e23578c5;
    stim[24] = 230'h25bf7083ff6a3b81a0e53a392d5ecd1fbc85b68e768082f9c348f11041;
    stim[25] = 230'h29d8978314388de6ecf1f124b0f834a41b3232801f1c56a3b4ffe1528d;
    stim[26] = 230'h275197a4cc8f44f8965498f2c60f34137289131d3e54b993f8799ef7de;
    stim[27] = 230'h384c0cb2841493ea465694a958aad4bf8cfb47a57cdd38b642a929fe76;
    stim[28] = 230'h340b265a28d935ce526b5c86631e21692925a93187189c01423a7f396c;
    stim[29] = 230'h22ae3057e598d4da6a606b04ee6613e2feb9338fa8f728ff7e8d438937;
    stim[30] = 230'h36130d3a160ff17e4251d003a124addb16bf8518fba5d0d7599076057f;
    stim[31] = 230'h361bc713071493737929d23a3995488a1effc21a9c64864caf4aad474f;
    stim[32] = 230'h3fec8ab9ecba28a508ce3534c4c09c3921921494984c46c34da3f6e4cd;
    stim[33] = 230'h34a5b4bc75afb974db794528482e34236aa4d14e066acd58fffcd7b593;
    stim[34] = 230'h2ef743a6e69da2d3be3c9bc47f5b943abfe26ab85c492c57499ccfd14c;
    stim[35] = 230'h2364b02e2f558ef0ed3618b65ce4849d72c65bed4492304ddcdd5f2da0;
    stim[36] = 230'h3e78628fc6590d045548c2d8a0eeb22c54a5f8c041a36b04fe1271efa3;
    stim[37] = 230'h36273d22efc606b1ca730924a206c206c79a1f97459b0d569951961d22;
    stim[38] = 230'h2b3583e8013a06e016697f95bb22c0c9428ef4bb4fd57f8feda86c2b43;
    stim[39] = 230'h32abfa12b81f2119f220f37684dcce03195c0b7b90eb59e4c04820b442;
    stim[40] = 230'h25c0e92ca6fca10db7075b87d9016ad4598c672445c7cf802381c6f40f;
    stim[41] = 230'h338c9f5235a05538abfc82a811629e1a423e32eea6b3c5a1cb152afda4;
    stim[42] = 230'h23bb4f4dfba64201e19276cfda34a1d217ba67b999c117bece97d32eee;
    stim[43] = 230'h36e05011a7f75b093a779e19f0946b198588a4221798e9efff1f839b19;
    stim[44] = 230'h20c1ebfefc0ba4c7f5459173e789b507bba29561aac11861cfbc9a4f80;
    stim[45] = 230'h2c52fee0ebf94a54dcf69891579bb6b1ea8eeb8383137e86d50c2a8b4f;
    stim[46] = 230'h2907fec0c45c717a1acee0f91e2eb82f1d97cd03b978de3b29154cf906;
    stim[47] = 230'h32bc7d02e04f724073b151765fdd46b41f31a59df71324e9d95530e295;
    stim[48] = 230'h25d52df973228bb4056d90d70aee761f64be047035a42e7f7ba0b12dd0;
    stim[49] = 230'h2d7d43202dac6e63ab2a0159074da322d4bb28ae68258b839590c1329e;
    stim[50] = 230'h2a2830faca198e7dd21b0355681e9499176913168f32bb872fd9b74355;
    stim[51] = 230'h3ff8cbb7bdecbcdaa794e34ebd265b464dec17ae9c13206ff1f353391a;
    stim[52] = 230'h2cfa530ada595505d2d7878b895cb5e020d94de506923fe0260bdb7f0f;
    stim[53] = 230'h2cc3c664748261fe3eeff58d27710b0a31346924ddc7aadd3ee87f3a14;
    stim[54] = 230'h2a73ac95be24463aff91dcf27de334171b3d10da9cd60106edd203b6da;
    stim[55] = 230'h2654c8e6e61bf5d6cf82bb9709571e3a2b9916c74426b507290034df0c;
    stim[56] = 230'h38404d824ef1da47835965f393c1772e55b80be72816d047e8b274fd22;
    stim[57] = 230'h284f82021a2e683752a48095cd12772ecbb371831f086c63f9c5b45abb;
    stim[58] = 230'h3ed19465330e8178144dba4776016e5f1c49cca545aa4bba88ac9f1467;
    stim[59] = 230'h3813e98349d1a5430eeca99b8c4c5f7b2d7062cab83d1478e6339dd631;
    stim[60] = 230'h3b0bb5edb1d7672a8f50dac19fc2735835783e1ca05bcfaff79c21a9ec;
    stim[61] = 230'h3512a31cd5abee87eec5894f0a6b1df3fd6178abd08c7414706d79ff98;
    stim[62] = 230'h26afdbc32da15438988aa5e271e4f2fffd8a40a6350f1768da63025cf0;
    stim[63] = 230'h3c19d143b9656be57762d519a8dd88115b94f2e34130243d82f008c65a;
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
      expv[3] = 177'h000000000000000000000000000000000000000000000;
      expv[4] = 177'h000000000000000000000000000000000000000000000;
      expv[5] = 177'h000000000000000000000000000000000000000000000;
      expv[6] = 177'h0000080000000000000000000000000000019ad90564a;
      expv[7] = 177'h100010001063eb654c7a5868e380000000039ad905649;
      expv[8] = 177'h180018001063eb654c7a5868e380792de3661aeafc4b7;
      expv[9] = 177'h180008001063eb654c7a5868e380792de3641aeafc4b7;
      expv[10] = 177'h180008001063eb65447a5868e380792de3641aeafc4b6;
      expv[11] = 177'h080000000172d3c38c7a5868e300792de3641aeafc4b5;
      expv[12] = 177'h080038000172d3c38c7a5868e300792de367662d63fbb;
      expv[13] = 177'h100030000172d3c38213ff7bf180792de363662d63fb8;
      expv[14] = 177'h000028000172d3c38213ff7bf100792de360d87efe86e;
      expv[15] = 177'h100020000172d3c3805848707f80792de360d87efe86c;
      expv[16] = 177'h1800280046b571ee485848707ff00c895e1c9254c37ef;
      expv[17] = 177'h1000380046b571ee485848707ff00c895e1a9254c37ef;
      expv[18] = 177'h0800380046b571ee485848707f30e88c543e9254c37ef;
      expv[19] = 177'h1800300046b571ee4a50abcfecb0e88c543e9254c37ed;
      expv[20] = 177'h0800300046b571ee4250abcfec30e88c543e9254c37ec;
      expv[21] = 177'h1000280046b571ee427f4d6275b0e88c54394c3b767d2;
      expv[22] = 177'h180078000f2158c7aa7f4d62759e54816fdf4c3b767d3;
      expv[23] = 177'h100068000f2158c7a27f4d62759e54816fd94c3b767d2;
      expv[24] = 177'h100068003e23578c4a7f4d62759e54816fd94c3b767d3;
      expv[25] = 177'h000068003e23578c4a7f4d62751e54816fd94c3b767d3;
      expv[26] = 177'h080038003e23578c427f4d62751f124b0f874c3b767d2;
      expv[27] = 177'h000020003e23578c427f4d62751f124b0f814c3b767d0;
      expv[28] = 177'h000028003e23578c427f4d62751f124b0f8119f68f4be;
      expv[29] = 177'h180028003e23578c449968a365b5c86631e519f68f4be;
      expv[30] = 177'h0800700068d438936c9968a36535c86631e719f68f4bd;
      expv[31] = 177'h0800780068d43893649968a36535c86631e62d7f0a30a;
      expv[32] = 177'h1000700074aad474ef1c4c1c57b5c86631e22d7f0a309;
      expv[33] = 177'h0000600074aad474e71c4c1c5735c86631e02d7f0a308;
      expv[34] = 177'h180070007fcd7b592ed2f1d6bd94528482e62d7f0a309;
      expv[35] = 177'h080068007fcd7b5926d2f1d6bd14528482e57fc4d5716;
      expv[36] = 177'h000050007fcd7b5926d2f1d6bd14528482e37fc4d5714;
      expv[37] = 177'h1800480061271efa298a3f19658c2d8a0eeca94bf1817;
      expv[38] = 177'h1000100061271efa218a3f19658c2d8a0eeaa94bf1814;
      expv[39] = 177'h000018005a86c2b4298a3f19650c2d8a0eea851de977f;
      expv[40] = 177'h000018005a86c2b4298a3f19650c2d8a0eea851de977f;
      expv[41] = 177'h080018005a86c2b4298a3f196575b87d9016851de977f;
      expv[42] = 177'h100000005a86c2b42a7d48d682f5b87d9010851de977d;
      expv[43] = 177'h180008005a86c2b4227d48d682a76cfda34c2f74cf72a;
      expv[44] = 177'h0000700071f839b18a7d48d682276cfda34a2f74cf729;
      expv[45] = 177'h0800600071f839b18a7d48d68259173e789c2f74cf729;
      expv[46] = 177'h0000580071f839b1827d48d68259173e789bd51dd707e;
      expv[47] = 177'h1800400071f839b187fb031171ee0f91e2edd51dd707c;
      expv[48] = 177'h0000500015530e294ffb0311716e0f91e2ebd51dd707d;
      expv[49] = 177'h1800480015530e2944b7e5cc88d90d70aee4c97c08e16;
      expv[50] = 177'h0000180015530e2944b7e5cc88590d70aee2c97c08e16;
      expv[51] = 177'h100000007d9b743548c3eb2865d90d70aee0c97c08e15;
      expv[52] = 177'h000078007d9b743540c3eb2865590d70aee29bd82f5d2;
      expv[53] = 177'h0800680060bdb7f0e8c3eb28657878b895cc9bd82f5d3;
      expv[54] = 177'h1800300060bdb7f0ef1991d20bf878b895ce9bd82f5d1;
      expv[55] = 177'h1000280060bdb7f0e71991d20bf878b895c8367a21b42;
      expv[56] = 177'h0000200060bdb7f0e71991d20b7878b895c8367a21b40;
      expv[57] = 177'h1800280060bdb7f0e136093bc0965f393c14ab7017cea;
      expv[58] = 177'h000070001c5b45aba936093bc0165f393c12ab7017ce9;
      expv[59] = 177'h180070001c5b45aba65194cc39dba4776016ab7017ce8;
      expv[60] = 177'h100060006339dd630e5194cc39dba4776010ab7017ce9;
      expv[61] = 177'h080078006339dd63065194cc390dac19fc266af07c386;
      expv[62] = 177'h080068006339dd63065194cc390dac19fc246af07c386;
      expv[63] = 177'h100050006339dd63076f0cb6818dac19fc226af07c384;
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
