// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 158;
  localparam OW = 180;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10776 dut (
    .clock(clk),
    .reset(in_vec[157:157]),
    .ID_Flush(in_vec[156:156]),
    .ID_Stall(in_vec[155:155]),
    .EX_Stall(in_vec[154:154]),
    .ID_Link(in_vec[153:153]),
    .ID_RegDst(in_vec[152:152]),
    .ID_ALUSrcImm(in_vec[151:151]),
    .ID_ALUOp(in_vec[150:146]),
    .ID_Movn(in_vec[145:145]),
    .ID_Movz(in_vec[144:144]),
    .ID_LLSC(in_vec[143:143]),
    .ID_MemRead(in_vec[142:142]),
    .ID_MemWrite(in_vec[141:141]),
    .ID_MemByte(in_vec[140:140]),
    .ID_MemHalf(in_vec[139:139]),
    .ID_MemSignExtend(in_vec[138:138]),
    .ID_Left(in_vec[137:137]),
    .ID_Right(in_vec[136:136]),
    .ID_RegWrite(in_vec[135:135]),
    .ID_MemtoReg(in_vec[134:134]),
    .ID_ReverseEndian(in_vec[133:133]),
    .ID_Rs(in_vec[132:128]),
    .ID_Rt(in_vec[127:123]),
    .ID_WantRsByEX(in_vec[122:122]),
    .ID_NeedRsByEX(in_vec[121:121]),
    .ID_WantRtByEX(in_vec[120:120]),
    .ID_NeedRtByEX(in_vec[119:119]),
    .ID_KernelMode(in_vec[118:118]),
    .ID_RestartPC(in_vec[117:86]),
    .ID_IsBDS(in_vec[85:85]),
    .ID_Trap(in_vec[84:84]),
    .ID_TrapCond(in_vec[83:83]),
    .ID_EX_CanErr(in_vec[82:82]),
    .ID_M_CanErr(in_vec[81:81]),
    .ID_ReadData1(in_vec[80:49]),
    .ID_ReadData2(in_vec[48:17]),
    .ID_SignExtImm(in_vec[16:0]),
    .EX_Link(out_vec[179:179]),
    .EX_LinkRegDst(out_vec[178:177]),
    .EX_ALUSrcImm(out_vec[176:176]),
    .EX_ALUOp(out_vec[175:171]),
    .EX_Movn(out_vec[170:170]),
    .EX_Movz(out_vec[169:169]),
    .EX_LLSC(out_vec[168:168]),
    .EX_MemRead(out_vec[167:167]),
    .EX_MemWrite(out_vec[166:166]),
    .EX_MemByte(out_vec[165:165]),
    .EX_MemHalf(out_vec[164:164]),
    .EX_MemSignExtend(out_vec[163:163]),
    .EX_Left(out_vec[162:162]),
    .EX_Right(out_vec[161:161]),
    .EX_RegWrite(out_vec[160:160]),
    .EX_MemtoReg(out_vec[159:159]),
    .EX_ReverseEndian(out_vec[158:158]),
    .EX_Rs(out_vec[157:153]),
    .EX_Rt(out_vec[152:148]),
    .EX_WantRsByEX(out_vec[147:147]),
    .EX_NeedRsByEX(out_vec[146:146]),
    .EX_WantRtByEX(out_vec[145:145]),
    .EX_NeedRtByEX(out_vec[144:144]),
    .EX_KernelMode(out_vec[143:143]),
    .EX_RestartPC(out_vec[142:111]),
    .EX_IsBDS(out_vec[110:110]),
    .EX_Trap(out_vec[109:109]),
    .EX_TrapCond(out_vec[108:108]),
    .EX_EX_CanErr(out_vec[107:107]),
    .EX_M_CanErr(out_vec[106:106]),
    .EX_ReadData1(out_vec[105:74]),
    .EX_ReadData2(out_vec[73:42]),
    .EX_SignExtImm(out_vec[41:10]),
    .EX_Rd(out_vec[9:5]),
    .EX_Shamt(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 158'h2b1329e4484ba946cb8cae07221fbd9c034fed89;
    stim[1] = 158'h32c640cb56d44e03fc9871b11b205d5f8f444b7c;
    stim[2] = 158'h043b525994ddff71c6b2c3eae71d138c7bca23b9;
    stim[3] = 158'h008010f9a57d9382cdd6a4c7fdcf9ad7b7d9fe51;
    stim[4] = 158'h0850b48f54f4f6fda6b9a27ac934fe6f4f325af2;
    stim[5] = 158'h1ffa1d7edcefb7baa5af8ed64d52cf6b79dc1768;
    stim[6] = 158'h0823f1eef32d7eb4ba65038ccbe6a66a9977f657;
    stim[7] = 158'h105afd7da5e180e910038e969d07235a07102669;
    stim[8] = 158'h0aae859fe63792d8b86e3d2fc020cbb045ad41db;
    stim[9] = 158'h0629f93e8c03acbebe4de565be20fa29291892f1;
    stim[10] = 158'h1598afa724ece492493baf127154e5367c3d1f92;
    stim[11] = 158'h11beba739005673d91b777c22994539f8a0c92aa;
    stim[12] = 158'h0accf6aa028e76552666e883c9dd76572e368144;
    stim[13] = 158'h19b3b3c1b3d105b6fbdcb0198fdd168ca76f6562;
    stim[14] = 158'h185dcb8b8831646a85010f556a23e60c164a6ce1;
    stim[15] = 158'h009b391da004b3c5a12613f78bc66cf26b3a6a48;
    stim[16] = 158'h191f81228974fc29956440cd5c2a80e028ad5efc;
    stim[17] = 158'h0f7e78dbb3b04cdb6024df2241b21f4cadc33031;
    stim[18] = 158'h0ee88a9b5347a1a2058a95fdb87153c78f74db99;
    stim[19] = 158'h0971fcf2215f1739abe33c18ba65986f2d5bc013;
    stim[20] = 158'h0e843a4237ea1710be5cbbcdfb0c38d7d802e7bf;
    stim[21] = 158'h1198229ebdf4b39a406dd0326facd206fcada69c;
    stim[22] = 158'h199b674534e766c9de1265da0945cf26b74576cf;
    stim[23] = 158'h092d43a428f0bf27dd06ab49b59bb8e190b94c67;
    stim[24] = 158'h0b38a53ec2118fc7ffcc3fb964e456105a838269;
    stim[25] = 158'h0380cec23097f753a37529dc75f31d467a60ed9c;
    stim[26] = 158'h10694eaa0a381a56fa696008d6e833f95ea75e27;
    stim[27] = 158'h072224d7f266e8422107a572f11082d7ceb7418c;
    stim[28] = 158'h04d408a2661b3afbb1cd86ab712d1fd0950720b3;
    stim[29] = 158'h1b2c2953e3f10c1b2d4595b8328c2068e08d6e11;
    stim[30] = 158'h0b668247af8810379471868c4c91f912331dbe7a;
    stim[31] = 158'h109bf9ca6f35676d3fffb17d1c87b7462656e5c9;
    stim[32] = 158'h05339ca112ddb288ef92fa63f2d6bc78da0c00f0;
    stim[33] = 158'h144f42e234ef2815aa6ce4ed94b3659be0ce5e9c;
    stim[34] = 158'h16debf3662c53a770c3b57dba22fabc4a45fa873;
    stim[35] = 158'h03a9660a7af71213eef367393b970d500301fb9c;
    stim[36] = 158'h0381b41ac5544b87ef1f7aa206c66dc53099fd45;
    stim[37] = 158'h07d4ef2a1f55b64504dfb3a226f8ca68070096e8;
    stim[38] = 158'h30955cb66dbf5c82a894ef1719c09fd9947fa458;
    stim[39] = 158'h100b294b2f8ad6344b738039505ea116f0afd5ed;
    stim[40] = 158'h114b4bd56cde2febf65f25a3f75dec86a823e5a7;
    stim[41] = 158'h0f5746b2999e1d05919e087305495a1ef9d5da4b;
    stim[42] = 158'h12b68ad5e7c4a667d8e3069282cdc9a9c63d53a0;
    stim[43] = 158'h0423a4ca0601f59045515d8bcf1e809d57f43b67;
    stim[44] = 158'h134cb7324d1bd3a45917bb1f7346f60824bb547a;
    stim[45] = 158'h1cf55605ace0bb3c14dd07770ac11b6d45f9c6e5;
    stim[46] = 158'h105acd1b42060b95d76e03cd80e627ad8c28f251;
    stim[47] = 158'h01772f23985ec9d58550cd89225d89277e77a34d;
    stim[48] = 158'h04d6663a804ffc57472aa519800cd8f82fb28b5b;
    stim[49] = 158'h0e7195cacf19325b64a76a0fb7438a554b1c90cd;
    stim[50] = 158'h1f53f85830dfe426a88b40db833874bbd1288a4d;
    stim[51] = 158'h05e0d56fe93185b2279c5a139c33710e5f101243;
    stim[52] = 158'h1cb4bc7045e4ad72eb0653e8eb5722d6d28a1246;
    stim[53] = 158'h1d68047c7cc184f4351d33e06404368f7212f0df;
    stim[54] = 158'h1a334d8eea0f7e2b74c671c048f35e1359c6641e;
    stim[55] = 158'h0f8d80bf2b5711281f8c311f35c47f40530de06c;
    stim[56] = 158'h0777058b023f19aa529fff363504a876ecf69e76;
    stim[57] = 158'h02f722c518568cf0ed1eb9723b30fdd774315f2d;
    stim[58] = 158'h08e1b6250836d6a3c0ebfa557a06f7eb95fc12c5;
    stim[59] = 158'h07a8a498d66745d946e971284df2b87fbcc6ae04;
    stim[60] = 158'h048e756d01f757d9623eae778ffdd1fc2caeb898;
    stim[61] = 158'h10162f4671099015e8ed6fa334a7959e9a0a7d30;
    stim[62] = 158'h0d6ae9f1ee53959eb80e5f3716ba537f6cce469a;
    stim[63] = 158'h01a0606cd59c5e5459f1593c73b4710febae76fe;
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
      expv[0] = 180'h000000000000000000000000000000000000000000000;
      expv[1] = 180'h000000000000000000000000000000000000000000000;
      expv[2] = 180'h000000000000000000000000000000000000000000000;
      expv[3] = 180'h000000000000000000000000000000000000000000000;
      expv[4] = 180'h10021f34afb27059bad498ffb9f35af6fb3fffff947f9;
      expv[5] = 180'h001281ea0e9edfb4d5344f59269fcde9e6400016bc96b;
      expv[6] = 180'h001281ea0e9edfb4d5344f59269fcde9e6400016bc96b;
      expv[7] = 180'h00722dde05afd6974c2071997cd4cd532efffffd95fd9;
      expv[8] = 180'h0053afb40c301d220031d2d3a0e46b40e20000099a499;
      expv[9] = 180'hd050a3fc06f25b170d07a5f804197608b5bfffd076d07;
      expv[10] = 180'hd050a3fc06f25b170d07a5f804197608b5bfffd076d07;
      expv[11] = 180'hd050a3fc06f25b170d07a5f804197608b5bfffd076d07;
      expv[12] = 180'h30534e7200ace7b2342ef845328a73f141800024aaa4a;
      expv[13] = 180'hd012c54001cecaa4cc1d10793baecae5c6c0002051205;
      expv[14] = 180'h307268360a20b6df79160331fba2d194edffffd958995;
      expv[15] = 180'h00316171062c8d50a021eaad447cc182c940001b385b3;
      expv[16] = 180'h136723b4009678b424c27ef178cd9e4d6740001a921a9;
      expv[17] = 180'h207024510e9f8532ac0819ab85501c0515bfffd7bf17b;
      expv[18] = 180'h207024510e9f8532ac0819ab85501c0515bfffd7bf17b;
      expv[19] = 180'h207024510e9f8532ac0819ab85501c0515bfffd7bf17b;
      expv[20] = 180'h20338e440be2e7357c2783174cb30de5ab7ffff004f00;
      expv[21] = 180'h20338e440be2e7357c2783174cb30de5ab7ffff004f00;
      expv[22] = 180'h300043d70e9673480d3a064df59a40df95bfffe9a729a;
      expv[23] = 180'h3060e8a60cecd93bc00cbb4128b9e4d6e8bfffddb3ddb;
      expv[24] = 180'h202064850e17e4fba0156936b3771c32173fffd319d31;
      expv[25] = 180'hc010a7d80231f8fff907f72c9c8ac20b507fffe09a609;
      expv[26] = 180'hd019d84612feea746ea53b8ebe63a8cf4c00003b673b6;
      expv[27] = 180'h0021c54107034adf4d2c011add067f2bd4ffffd789d78;
      expv[28] = 180'h0021c54107034adf4d2c011add067f2bd4ffffd789d78;
      expv[29] = 180'h0021c54107034adf4d2c011add067f2bd4ffffd789d78;
      expv[30] = 180'hc0012a7c0e218365a832b70651840d1c11bfffdb845b8;
      expv[31] = 180'hc05048f5010206f28c30d189923f224663bfffef9eaf9;
      expv[32] = 180'h1073294d06aceda7fd362fa390f6e8c4cac0003972797;
      expv[33] = 180'h1073294d06aceda7fd362fa390f6e8c4cac0003972797;
      expv[34] = 180'h1073294d06aceda7fd362fa390f6e8c4cac0003972797;
      expv[35] = 180'h1073294d06aceda7fd362fa390f6e8c4cac0003972797;
      expv[36] = 180'hd52cc14f5ee2427dde6ce72772e1aa00603ffffee73ee;
      expv[37] = 180'hd0368358aa8970fde3ef5440d8cdb8a6133fffff517f5;
      expv[38] = 180'h000000000000000000000000000000000000000000000;
      expv[39] = 180'h000000000000000000000000000000000000000000000;
      expv[40] = 180'h00612965015ac6896c30072a0bd422de15fffff57b757;
      expv[41] = 180'h20616aad0bc5fd7ec924b47eebbd90d5047ffff969f96;
      expv[42] = 180'h20616aad0bc5fd7ec924b47eebbd90d5047ffff969f96;
      expv[43] = 180'hd0514abc0894ccfb1c20d25059b93538c7bfffd4e814e;
      expv[44] = 180'hd0514abc0894ccfb1c20d25059b93538c7bfffd4e814e;
      expv[45] = 180'hc012e649037a748b203763ee68dec104977fffd51e951;
      expv[46] = 180'hc012e649037a748b203763ee68dec104977fffd51e951;
      expv[47] = 180'h0051a36800c172baed0079b01cc4f5b18500003c947c9;
      expv[48] = 180'h2ee5e4730bd93ab0aa19b1244bb124efceffffe8d368d;
      expv[49] = 180'h2ee5e4730bd93ab0aa19b1244bb124efceffffe8d368d;
      expv[50] = 180'h2ee5e4730bd93ab0aa19b1244bb124efceffffe8d368d;
      expv[51] = 180'h2ee5e4730bd93ab0aa19b1244bb124efceffffe8d368d;
      expv[52] = 180'h2ee5e4730bd93ab0aa19b1244bb124efceffffe8d368d;
      expv[53] = 180'h2ee5e4730bd93ab0aa19b1244bb124efceffffe8d368d;
      expv[54] = 180'h2ee5e4730bd93ab0aa19b1244bb124efceffffe8d368d;
      expv[55] = 180'hc061a1dd01efc56e980e38091e6bc26b38c0001907990;
      expv[56] = 180'hc061a1dd01efc56e980e38091e6bc26b38c0001907990;
      expv[57] = 180'hc061a1dd01efc56e980e38091e6bc26b38c0001907990;
      expv[58] = 180'hdee458a30ad19e1da3d72e47661fbaee863fffd7cb57c;
      expv[59] = 180'h1032c4a106dad4781d3f4aaf40defd72bf800004b144b;
      expv[60] = 180'h1032c4a106dad4781d3f4aaf40defd72bf800004b144b;
      expv[61] = 180'h1032c4a106dad4781d3f4aaf40defd72bf800004b144b;
      expv[62] = 180'h0041e8ce013202bd1d2df46694f2b3d34140001f4c1f4;
      expv[63] = 180'h0041e8ce013202bd1d2df46694f2b3d34140001f4c1f4;
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
