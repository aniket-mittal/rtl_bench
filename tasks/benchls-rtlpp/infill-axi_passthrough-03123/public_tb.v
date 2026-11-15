// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 206;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03123 dut (
    .aclk(clk),
    .aresetn(in_vec[205:205]),
    .s_axi_awaddr(in_vec[204:173]),
    .s_axi_awlen(in_vec[172:165]),
    .s_axi_awsize(in_vec[164:162]),
    .s_axi_awburst(in_vec[161:160]),
    .s_axi_awlock(in_vec[159:159]),
    .s_axi_awcache(in_vec[158:155]),
    .s_axi_awprot(in_vec[154:152]),
    .s_axi_awregion(in_vec[151:148]),
    .s_axi_awqos(in_vec[147:144]),
    .s_axi_awvalid(in_vec[143:143]),
    .s_axi_wdata(in_vec[142:111]),
    .s_axi_wstrb(in_vec[110:107]),
    .s_axi_wlast(in_vec[106:106]),
    .s_axi_wvalid(in_vec[105:105]),
    .s_axi_bready(in_vec[104:104]),
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
    .s_axi_awready(out_vec[152:152]),
    .s_axi_wready(out_vec[151:151]),
    .s_axi_bresp(out_vec[150:149]),
    .s_axi_bvalid(out_vec[148:148]),
    .s_axi_arready(out_vec[147:147]),
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
    stim[0] = 206'h061cb77e69986c57ae343334f4feb425c0c37476228e655663d9;
    stim[1] = 206'h0c1d8a6b710f6d67bd9f6607e8f9db32ebb03d195eb8463b3d6f;
    stim[2] = 206'h2b9952160ee0598ba826185f1a8c49dc0c1faf534d2b387e9e3e;
    stim[3] = 206'h30deefe92e08acad55c7bec6a00bf67a1373845872273985a874;
    stim[4] = 206'h30bd8938bd56630fd233611151377e12895bf7e6007259a40457;
    stim[5] = 206'h35e818d42e64b1a18a6efb238098728117f972227ef2f1d45533;
    stim[6] = 206'h3b57bc6dfc7f75280e0140e834076027625445466e80c07384f1;
    stim[7] = 206'h2be0c5ad158084f09ce4907e15e99b03badd7b932a8cfaff30a1;
    stim[8] = 206'h3dacdf1ed893e0c3fb76295eed7e0c2e5b7bc1686916f3b08c42;
    stim[9] = 206'h2ecf6fa587633e509d0ad7d04f0e768b7e58c2ae43f940163f65;
    stim[10] = 206'h3e1bf5178e78b795c01a5ed2b341003f9b297cdb5d304cc56c20;
    stim[11] = 206'h3f0e23f4975dfb5d2e6e9f602c333f2f593611f90c20980b24d0;
    stim[12] = 206'h29c0927a74edb8669f07c4e0bdd61ae8c84d479abea08137aee7;
    stim[13] = 206'h355622aa38c5ad0343def64b59d010d29419d3a56ecf970b18f0;
    stim[14] = 206'h372957a2db2c541e9402cfc62a2c06c159ae4a996b14a929e2a1;
    stim[15] = 206'h3f045e24efd388e38f5a7466cc81c3a346cb2de77038b3e778e1;
    stim[16] = 206'h2c466dc1ef259fdf2d1712b35a328a8fce5be134f5385893be1b;
    stim[17] = 206'h3540f98e3f6929651d84b5cab18ef4e40dcea8604d0df48d39d6;
    stim[18] = 206'h2ea3429c0fe10296b304b6128a9ff0a1767f10bfb86a6eee1eee;
    stim[19] = 206'h2f1f1adb5fcec7e45363082b5036a3cd0226b680154428ad263b;
    stim[20] = 206'h36ef8a5689012d1e4873fdb88c575e8820aee751eeff420c2ea8;
    stim[21] = 206'h3d18cea65a35f71ffa09a02568304b0588bcd2545b2437f39a47;
    stim[22] = 206'h206091e7eac23c14a500e27f77d1abdbeb91e165f2cef0d336f3;
    stim[23] = 206'h3bd32aa80820a92cbd2f8fa72ac76b61f70950f1a761fa5da68e;
    stim[24] = 206'h3084e72c3658837dc98595437c11a530142223f437bb8a91f98d;
    stim[25] = 206'h2dfc6a3efe34bedf7c67866f474fa0b23f18a49944f1d4478bf3;
    stim[26] = 206'h26d91feea496c7834af20288ce348b2d7bc84045781ed2227347;
    stim[27] = 206'h306aa541974a0207804c0c1c937531c787ecee96c01bf46a7a37;
    stim[28] = 206'h2d6c9b06c39a1b2056f004988b055cfde16961b5cf597d844bb3;
    stim[29] = 206'h36fbe679928692bffc220494986a763a90ad69ad6ea0025745f9;
    stim[30] = 206'h34926cc3229bb83e3f8355e569c5d2dc106a1a2c88c030231a39;
    stim[31] = 206'h241bb68eda49526505268c3f781528b717890632b68ce0ef44fb;
    stim[32] = 206'h224e49b61b92645ff94c51c6dc8339ff48aaa30157f80ed360d7;
    stim[33] = 206'h2324297f31fac08fd5d95ac7bfb0dde83a13ae6519211bc02fe2;
    stim[34] = 206'h38d0f12caa04e56b88b5b322a29586ad57a8477c1498c9ca6a83;
    stim[35] = 206'h218e63b5cc765947b960fc9fdcac67467880d64ffa1044d090ab;
    stim[36] = 206'h385836726a1a914c86bee339dfb5f7633eb52170f6708a168831;
    stim[37] = 206'h2dfbc731703c0018b03cf7d7f63c77593ab8d69ef0e51ebca777;
    stim[38] = 206'h20a0a451201c56248a0c07015ba68392fbf266315341ec18d598;
    stim[39] = 206'h2aa4033c9f92b302fae09932f59852521106ded6e0617cf58dff;
    stim[40] = 206'h2c07e1c133a209069afa22d329a3287a1f2106a97298d0b3cad3;
    stim[41] = 206'h32f75dba14277ef684371e95bcdfe34df7effaa2e613f132309d;
    stim[42] = 206'h2e4ffb796cbcf0971b7acb1dc5380028b5619923d7a0cb6aee23;
    stim[43] = 206'h382ceb77e78c17cfa7506375ea72532e0ff17277ca081e06380a;
    stim[44] = 206'h130dcf421888320c08016928c678c1e8a1efb5b4566aa89a20aa;
    stim[45] = 206'h219214b9ceb9e81a4fcf925f4658561e82700d3896d986ff9925;
    stim[46] = 206'h2726ec775798305166c3ede3aac9e6391e1b0e10f6854a61bd29;
    stim[47] = 206'h2f3732e48861d006fe68ba733a2dd86c17657bd5cc4aee780f41;
    stim[48] = 206'h21c4a4fbff9e16b46c677c0525666bda2281e55ea01f01377dee;
    stim[49] = 206'h21f314ce0e18b5d56e800a7fb40ee6b7ad1439863f4faeae6c81;
    stim[50] = 206'h370b57c67fc4149f84c8780545d98b8f72cbdafc8c39ad75abe3;
    stim[51] = 206'h26495bd3188d036888b071517ae30bf4c9fe033457b83e812329;
    stim[52] = 206'h360ef81dded1cbfd9a5007e662ebac98969a0af9c2d6d2031372;
    stim[53] = 206'h2d87c79b30c5b44613620396717490f07103441dbf2f3887dc2d;
    stim[54] = 206'h341b8d3dfb6462a1556e1998288f1f8b44376dabb7a1a207d9e8;
    stim[55] = 206'h38c6d66395dbf405464cf5c2e5f6ecf4ab28b9e6ea4967fc9481;
    stim[56] = 206'h383d1fc80202c638083e014b634da023c244e87e48c267a7d5a9;
    stim[57] = 206'h34fdc55971f85ee1df34940f458a2206fa281e9329ac1755137c;
    stim[58] = 206'h36a21f9f10bfbe5ece0da79b49039d3cfa304994196488ca390b;
    stim[59] = 206'h326d678523acbc2f3720100f43b7ff6c9a41667a10b568d33af6;
    stim[60] = 206'h3630bce7e7b3287db8a4e156036c75141d4145014c2c2748505f;
    stim[61] = 206'h20835a6d836cc7f245c6d7d89e6dec9bab1fd51b2fd120779bde;
    stim[62] = 206'h3810fba47e57da0edcabd49475c408aa34f8eb624248f4bc0807;
    stim[63] = 206'h3aede8265dd4d602dbb4d29dd12c06f5092e1fe2d88fbb778d26;
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
      expv[0] = 153'h08e655663d99872ddf9cae343334f1fd684b819;
      expv[1] = 153'h0b8463b3d6fb07629addbd9f6607e9f3b665d6f;
      expv[2] = 153'h12b387e9e3f2e6548581a826185f1d1893b818a;
      expv[3] = 153'h0273985a875437bbfa4c55c7bec6a017ecf426d;
      expv[4] = 153'h07259a40457c2f624e2bd2336111526efc25130;
      expv[5] = 153'h0f2f1d45533d7a0635098a6efb238130e5022f3;
      expv[6] = 153'h080c07384f1ed5ef1b7d0e0140e8300ec04ec43;
      expv[7] = 153'h08cfaff30a1af8316b449ce4907e13d33607749;
      expv[8] = 153'h116f3b08c4376b37c7b0fb76295eeafc185cb74;
      expv[9] = 153'h1f940163f65bb3dbe9669d0ad7d04e1ced16fd5;
      expv[10] = 153'h1304cc56c21786fd45e7c01a5ed2b682007f36e;
      expv[11] = 153'h020980b24d17c388fd232e6e9f6028667e5eb3e;
      expv[12] = 153'h0a08137aee7a70249e989f07c4e0bbac35d190f;
      expv[13] = 153'h0cf970b18f155588aa8d43def64b5ba021a5293;
      expv[14] = 153'h114a929e2a1dca55e8b49402cfc62c580d82b2d;
      expv[15] = 153'h038b3e778e1fc11789388f5a7466c90387468d0;
      expv[16] = 153'h1385893be1bb119b707f2d1712b35c65151f9da;
      expv[17] = 153'h10df48d39d75503e63891d84b5cab31de9c81b2;
      expv[18] = 153'h06a6eee1eef3a8d0a702b304b6128d3fe142edc;
      expv[19] = 153'h14428ad263bbc7c6b6d75363082b506d479a042;
      expv[20] = 153'h0ff420c2ea95bbe295a54873fdb888aebd1040b;
      expv[21] = 153'h12437f39a47f4633a997fa09a0256860960b109;
      expv[22] = 153'h0cef0d336f38182479fca500e27f77a357b7d71;
      expv[23] = 153'h161fa5da68f6f4caaa01bd2f8fa72d8ed6c3efb;
      expv[24] = 153'h1bb8a91f98dc2139cb0bc985954378234a6029b;
      expv[25] = 153'h0f1d4478bf3b7f1a8fbe7c67866f469f41647ee;
      expv[26] = 153'h01ed22273479b647fbaf4af20288cc69165af60;
      expv[27] = 153'h01bf46a7a37c1aa95062804c0c1c96ea638f0e8;
      expv[28] = 153'h1597d844bb3b5b26c1b356f004988e0ab9fbc3b;
      expv[29] = 153'h0a0025745f9dbef99e62fc22049498d4ec75217;
      expv[30] = 153'h0c030231a39d249b30c83f8355e56b8ba5b8214;
      expv[31] = 153'h08ce0ef44fb906eda3b205268c3f782a516e2fb;
      expv[32] = 153'h1f80ed360d7893926d84f94c51c6d90673fe903;
      expv[33] = 153'h1211bc02fe30c90a5fc8d5d95ac7bf61bbd0750;
      expv[34] = 153'h098c9ca6a83e343c4b2d88b5b322a52b0d5aafe;
      expv[35] = 153'h01044d090ab86398ed71b960fc9fd958ce8cf05;
      expv[36] = 153'h0708a168831e160d9c9986bee339df6beec67db;
      expv[37] = 153'h0e51ebca777b7ef1cc58b03cf7d7f478eeb274c;
      expv[38] = 153'h141ec18d59902829144e8a0c07015f4d0725f79;
      expv[39] = 153'h0617cf58dffaa900cf23fae09932f330a4a4228;
      expv[40] = 153'h098d0b3cad3b01f870499afa22d32b4650f43f5;
      expv[41] = 153'h013f132309dcbdd76e8684371e95b9bfc69bef3;
      expv[42] = 153'h1a0cb6aee23b93fede581b7acb1dc27000516b3;
      expv[43] = 153'h0081e06380b60b3addffa7506375ece4a65c1f9;
      expv[44] = 153'h06aa89a20ab4c373d08208016928c4f183d143b;
      expv[45] = 153'h0d986ff9925864852e704fcf925f44b0ac3d05f;
      expv[46] = 153'h0854a61bd299c9bb1dd066c3ede3ad93cc723cb;
      expv[47] = 153'h04aee780f41bcdccb920fe68ba733c5bb0d82ea;
      expv[48] = 153'h01f01377def071293efe6c677c0522ccd7b444c;
      expv[49] = 153'h14faeae6c8187cc533856e800a7fb01dcd6f5a3;
      expv[50] = 153'h039ad75abe3dc2d5f19c84c8780543b3171ee5e;
      expv[51] = 153'h1b83e81232999256f4c388b071517dc617e993b;
      expv[52] = 153'h0d6d2031373583be07739a5007e665d759312dd;
      expv[53] = 153'h12f3887dc2db61f1e6cc1362039672e921e0e2f;
      expv[54] = 153'h1a1a207d9e9506e34f7a556e1998291e3f16897;
      expv[55] = 153'h04967fc9481e31b598e4464cf5c2e3edd9e9571;
      expv[56] = 153'h0c267a7d5a9e0f47f206083e014b669b404785c;
      expv[57] = 153'h1ac1755137d53f71565edf34940f4314440df48;
      expv[58] = 153'h16488ca390bda887e7c6ce0da79b4a073a79f48;
      expv[59] = 153'h0b568d33af749b59e14c3720100f476ffed935c;
      expv[60] = 153'h02c2748505fd8c2f39f8b8a4e15606d8ea283a2;
      expv[61] = 153'h1d120779bdf020d69b6745c6d7d89cdbd93756f;
      expv[62] = 153'h048f4bc0807e043ee91adcabd49473881154691;
      expv[63] = 153'h08fbb778d276bb7a0996dbb4d29dd2580dea130;
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
