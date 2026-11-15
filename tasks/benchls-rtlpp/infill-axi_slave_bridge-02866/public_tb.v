// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 222;
  localparam OW = 169;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02866 dut (
    .aclk(clk),
    .aresetn(in_vec[221:221]),
    .s_axi_awaddr(in_vec[220:181]),
    .s_axi_awlen(in_vec[180:173]),
    .s_axi_awsize(in_vec[172:170]),
    .s_axi_awburst(in_vec[169:168]),
    .s_axi_awlock(in_vec[167:167]),
    .s_axi_awcache(in_vec[166:163]),
    .s_axi_awprot(in_vec[162:160]),
    .s_axi_awregion(in_vec[159:156]),
    .s_axi_awqos(in_vec[155:152]),
    .s_axi_awvalid(in_vec[151:151]),
    .s_axi_wdata(in_vec[150:119]),
    .s_axi_wstrb(in_vec[118:115]),
    .s_axi_wlast(in_vec[114:114]),
    .s_axi_wvalid(in_vec[113:113]),
    .s_axi_bready(in_vec[112:112]),
    .s_axi_araddr(in_vec[111:72]),
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
    .s_axi_awready(out_vec[168:168]),
    .s_axi_wready(out_vec[167:167]),
    .s_axi_bresp(out_vec[166:165]),
    .s_axi_bvalid(out_vec[164:164]),
    .s_axi_arready(out_vec[163:163]),
    .s_axi_rdata(out_vec[162:131]),
    .s_axi_rresp(out_vec[130:129]),
    .s_axi_rlast(out_vec[128:128]),
    .s_axi_rvalid(out_vec[127:127]),
    .m_axi_awaddr(out_vec[126:87]),
    .m_axi_awprot(out_vec[86:84]),
    .m_axi_awvalid(out_vec[83:83]),
    .m_axi_wdata(out_vec[82:51]),
    .m_axi_wstrb(out_vec[50:47]),
    .m_axi_wvalid(out_vec[46:46]),
    .m_axi_bready(out_vec[45:45]),
    .m_axi_araddr(out_vec[44:5]),
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
    stim[0] = 222'h0e970a36af2b890fda900ce2b22ceedf0a09c81d2d6885749e82004c;
    stim[1] = 222'h1f1e950c808ce3b0f15140ec1841f16b0035c28667a2f34f20f14290;
    stim[2] = 222'h3d5cda801db3486d864e3898122950f2d3331e836839a31a38179376;
    stim[3] = 222'h387f71c40cb75aaa94f0d3e57aee3e54366d6d4c8005ac38fc7ad8ea;
    stim[4] = 222'h27d44a65be5dcb8941e574f0952eef8e9d873f4bfd3a23b5a62e7143;
    stim[5] = 222'h2b1c374cf534b970e72d79c0822a52bf0443e69cccdecdd590fc6029;
    stim[6] = 222'h37b4d58d3e5dea5c8a752faaa4087f4fd59c6ab4d0b9c7870bf8e44d;
    stim[7] = 222'h2ad9de8da9e88692cee19fe7d8a5321be29bfc94d9e33075d899afb2;
    stim[8] = 222'h234527ab2501041d6584b318aca11ee353c906298907ef6c101d7f66;
    stim[9] = 222'h32312fd576ac61dd189defa07a60b4f5d90532ad09618539c495b45b;
    stim[10] = 222'h3da2c19a5a8994c58a7363cc840b6ee33806b478faa744d8fba91988;
    stim[11] = 222'h2e064d352076925c33318b9061a9b40a64a2708df1b069af76e8a4cc;
    stim[12] = 222'h3f519d70672cd6bc6aeb6e4bd8af02d8ee6d56207b90a8732a1791c7;
    stim[13] = 222'h333cb57c593e2dcd1cb318febff00e3060d7ac5f0c0f552d42cd0ad1;
    stim[14] = 222'h27702f8a1fca8b9b92adfda366011417f08a97bcb458fbdd77cf7ab7;
    stim[15] = 222'h3971a02f2f117d128860c8770f5ea773c1a46d2ea4ab4ca272628ab3;
    stim[16] = 222'h28666b0aee6f8d0b4164a2ca0163224d9695491be0ad15c27f8bdeba;
    stim[17] = 222'h2180a77eaf23d82309a5ec9c4920d097bb53022f4c8ea0a7b4ebef7a;
    stim[18] = 222'h358d916dfc7cf5a8190bdd9230c6313f81c87a5baf8c916a9a00552a;
    stim[19] = 222'h2037a60eaa63a9e17f4b12aea5dce0d918d61ee23db0761fe66aca9b;
    stim[20] = 222'h2eb72953b269e3aa95109b6152b1702752be5c90e91469e2717a674d;
    stim[21] = 222'h22b6de15881ab8a7feee7420ac5a133001855792a194cc9fe67b0b9d;
    stim[22] = 222'h382d242d734f5ec4a151ae5ecec6d58fa956fd2700ba6a1cdbda5dd2;
    stim[23] = 222'h33e048ba8e9faf82dcb7d6fbb120dc79a74589074b5fd68e0a89009a;
    stim[24] = 222'h3c1a72495cdfb09f4bd9f4f0f0a67b77f5ff3dcbb8e7d89ef1d7077f;
    stim[25] = 222'h220668e1989afc04d87a12d7219b803b455b830a4c13b4a0bbb3e950;
    stim[26] = 222'h32b5f116873ac596399ecb2f32bccaf863cad4a055c75eddc77a4094;
    stim[27] = 222'h358e0503620e7fc5c957e4da5a57721144b148e76ce70bff16c9c720;
    stim[28] = 222'h32c87d9271181854f126cb1726a0a39488bcc02973dc1ae7d7066f3a;
    stim[29] = 222'h269248c164a76a45a6ec3b2966e4f9027ce5ecb3a0d57e578d50990c;
    stim[30] = 222'h20537408c4b51660ab598896c47fd8503ac3a2fe6ce12ca813e1b77d;
    stim[31] = 222'h283f3393a43c32da8699b492197fb6c77454c994237ecb46b7146909;
    stim[32] = 222'h37223206083f0110faadf1a96e93043857fe97263bbb6ace31cf7b01;
    stim[33] = 222'h314534eb42faf12d06a88b428a38653320880ad5cd53264622752fe2;
    stim[34] = 222'h3e20da86c106ca792684f707e57db3f04da430556f495a9872ba0cac;
    stim[35] = 222'h0c76fc9eecd461cb9cbfc81a58714ec7dc56936b4008e96722a72e58;
    stim[36] = 222'h3fa8e2ca99844a119cf14460c7a8fff599c191ddbc338d42e7c37987;
    stim[37] = 222'h320eefa5cf0234bfe52ac1a817b79b30520bc54bc2b5ef360db72c02;
    stim[38] = 222'h285cd6adde50ad07705efb8b6ae3bbe1cf43898df6fe32b57e397043;
    stim[39] = 222'h2304c31ae3ca4f072616e5662edcfa790f0c1879e47438fbd38d0f98;
    stim[40] = 222'h3c7a73febe8a573d6f99c40dd4ad8373a6b5e0d93f61e2ae83eae8b8;
    stim[41] = 222'h3884619410b761a0ba0d74e804fa23b64d1a631d9e9a79d518eb3d08;
    stim[42] = 222'h3ac5c2b07de28a929a5f5f8a15e48d1b4e88b0490b1d6fb0ff138f9a;
    stim[43] = 222'h25215c3f447a3caa401596c6b6837d4a4f946ebc537593f2a6e34252;
    stim[44] = 222'h24a9990f497fe543849caa793166f7c821a2fb76aed101e7afe71682;
    stim[45] = 222'h2b9d50b20d3932663f10ad9c6cf70d7b11fb4f5273c99872767bf52f;
    stim[46] = 222'h34d9b937d0d987a62d6ed7d6511ec85d65ffce060c1296ff43b1f510;
    stim[47] = 222'h26c236ab9360603534815ef0b6c20709443975d2cc5daa0be703fc28;
    stim[48] = 222'h34e0de5c123bb179e486010bbe9124d8e3d522819ef2dc18fb2408c4;
    stim[49] = 222'h25c6a105f26391b80399cd24ffb0a8440b44d91988fbe55f18921b89;
    stim[50] = 222'h3993bed72056c30f3820d4c6c83761bc98e92f0611efa2761ee2c6b3;
    stim[51] = 222'h380e5a126c6e44edef8f6c48ae4edee1c1bdc976a840be07b205e898;
    stim[52] = 222'h243847f2bb10371fb64b734f04d239bef6dfae87cf1a5e65a4c1d4c8;
    stim[53] = 222'h1cb58efda8cad75193ac67b431616ae766a215d57fa56e85a87b175f;
    stim[54] = 222'h3e5f48239e8c966637c632f177816a0e214f3aa2eb8c793b24bb3052;
    stim[55] = 222'h3ff7077dbb3027f3d9401096c930b45b1397161e46b3477000047a64;
    stim[56] = 222'h2794a345c9b3f83d5c27aefc0ed4f152e72e00e1279b52a5c6ba0014;
    stim[57] = 222'h3410de464ee99a5d9304be8ed842701d2058ddd45b09c0e4d33f3b7a;
    stim[58] = 222'h31d061db25c36da1b5aa5cf9ec7dbbdea2bf1fc1730bb860593bafb2;
    stim[59] = 222'h3533141456a0cfd14a8d76be3fe4bd4f6fd2a8d10f8ced5ee4bd1aa5;
    stim[60] = 222'h378335bc58547e87713a571dfb67fc8b6b9014a610375d37751196a8;
    stim[61] = 222'h22effad69fb2e42f6be5cd4801b5fa0776e1abd511aa0a6015574ee6;
    stim[62] = 222'h3f5670dc21fe724232796479bcf158ffe374f4e69cb60ebea892e949;
    stim[63] = 222'h27873d3008b2b6910809f73d24a90b5cbf8d5f99b073d2d1319c694e;
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
      expv[0] = 169'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 169'h0000000000000000000000000000000000000000000;
      expv[2] = 169'h0000000000000000000000000000000000000000000;
      expv[3] = 169'h0100000000000000000000000000000200000000001;
      expv[4] = 169'h1980000000061fdc71032af0d3e57aec7ca86cdada2;
      expv[5] = 169'h01da62e7143e1fdc71032a70d3e57ae87ca86cdada3;
      expv[6] = 169'h09da62e7143e1fdc71032a2d79c0822c7ca86cdada2;
      expv[7] = 169'h01da62e714261fdc71032a2d79c082287ca86cdada3;
      expv[8] = 169'h10da62e71422b677a36a7aad79c0822a7ca86cdada2;
      expv[9] = 169'h005a62e71422b677a36a7a2d79c0822a7ca86cdada1;
      expv[10] = 169'h139c495b45bc8c4bf55dadad79c0822969ebb20a652;
      expv[11] = 169'h1a1c495b45bc8c4bf55dadf363cc840f69ebb20a650;
      expv[12] = 169'h021c495b45bc8c4bf55dad7363cc840b69ebb20a650;
      expv[13] = 169'h1f1c495b45bfd4675c19cceb6e4bd8af69ebb20a650;
      expv[14] = 169'h0f9c495b45bfd4675c19cc6b6e4bd8ac1c60c1af586;
      expv[15] = 169'h161c495b45a1dc0be287f3eb6e4bd8aa1c60c1af585;
      expv[16] = 169'h1ea72628ab39dc0be287f3e0c8770f5d4ee78348db6;
      expv[17] = 169'h06a72628ab39dc0be287f360c8770f5b4ee78348db6;
      expv[18] = 169'h16a72628ab386029dfabcbe0c8770f594ee78348db6;
      expv[19] = 169'h0e272628ab386029dfabcb0bdd9230c54ee78348db4;
      expv[20] = 169'h09a72628ab206029dfabcb0bdd9230c5c1b231ac3db;
      expv[21] = 169'h00a717a674d86029dfabcb0bdd9230c3c1b231ac3da;
      expv[22] = 169'h192717a674d8adb7856207ee7420ac5dc1b231ac3d8;
      expv[23] = 169'h192717a674c0adb7856207ee7420ac5dc1b231ac3d9;
      expv[24] = 169'h11a717a674c0adb7856207ee7420ac59b8f34e8b12f;
      expv[25] = 169'h196f1d7077f8adb7856207d9f4f0f0a5b8f34e8b12c;
      expv[26] = 169'h10ef1d7077f8adb7856207d9f4f0f0a300768ab706a;
      expv[27] = 169'h156f1d7077e0adb7856207d9f4f0f0a100768ab7069;
      expv[28] = 169'h0c6f1d7077e0adb785620757e4da5a5700768ab7069;
      expv[29] = 169'h046f1d7077e0adb785620757e4da5a5100768ab7069;
      expv[30] = 169'h15ef1d7077e1a49230592dd7e4da5a51f204f9cbd8b;
      expv[31] = 169'h1c013e1b77d9a49230592dd98896c47ff204f9cbd88;
      expv[32] = 169'h0c013e1b77c1a49230592d598896c47ff204f9cbd89;
      expv[33] = 169'h14631cf7b01dc88c818208d98896c47bf204f9cbd89;
      expv[34] = 169'h14e31cf7b005c88c818208d98896c478ca66411014b;
      expv[35] = 169'h11631cf7b005c88c818208d98896c47aca664110149;
      expv[36] = 169'h0000000000000000000000000000000000000000000;
      expv[37] = 169'h10ae7c37987fea38b2a6618000000001ffeb338323a;
      expv[38] = 169'h0bae7c379867ea38b2a6612ac1a817b7ffeb338323b;
      expv[39] = 169'h02d7e397043fea38b2a6612ac1a817b3ffeb338323b;
      expv[40] = 169'h0757e397043fea38b2a6612ac1a817b1ffeb3383238;
      expv[41] = 169'h1657e39704271e9cffafa5aac1a817b3ffeb3383239;
      expv[42] = 169'h0d57e39704271e9cffafa50d74e804fdffeb3383238;
      expv[43] = 169'h05d7e39704271e9cffafa50d74e804f91a369d1160f;
      expv[44] = 169'h0cd7e39704271e9cffafa51596c6b6871a369d1160f;
      expv[45] = 169'h14d7e39704212a6643d25b9596c6b6811a369d1160e;
      expv[46] = 169'h1fa767bf52f92a6643d25b90ad9c6cf71a369d1160e;
      expv[47] = 169'h172767bf52e12a6643d25b90ad9c6cf11a369d1160d;
      expv[48] = 169'h1f2767bf52e12a6643d25b815ef0b6c51a369d1160d;
      expv[49] = 169'h1ea767bf52e12a6643d25b815ef0b6c649b1c7aa45a;
      expv[50] = 169'h0d718921b8992a6643d25b015ef0b6c449b1c7aa458;
      expv[51] = 169'h0c718921b8812a6643d25b015ef0b6c649b1c7aa459;
      expv[52] = 169'h1cf18921b8860396849b1d815ef0b6c5bdc3837b923;
      expv[53] = 169'h1cf18921b8860396849b1d815ef0b6c5bdc3837b923;
      expv[54] = 169'h0000000000000000000000000000000000000000000;
      expv[55] = 169'h13000000000797d208e7a6800000000200000000000;
      expv[56] = 169'h03800000000797d208e7a6000000000168b6272e2db;
      expv[57] = 169'h03800000000797d208e7a6000000000168b6272e2db;
      expv[58] = 169'h0b800000000797d208e7a604be8ed84568b6272e2da;
      expv[59] = 169'h1a8000000004741876c97184be8ed84768b6272e2da;
      expv[60] = 169'h0d6e4bd1aa5c741876c97104be8ed84568b6272e2d8;
      expv[61] = 169'h0cee4bd1aa5c741876c97104be8ed847f916d72029a;
      expv[62] = 169'h1cee4bd1aa40bbfeb5a7ef84be8ed847f916d72029b;
      expv[63] = 169'h136a892e9498bbfeb5a7ef84be8ed843f916d720299;
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
