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

  rtlpp_10732 dut (
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
    stim[0] = 158'h3721d32950c78effd0b392c44087d39bf9212d29;
    stim[1] = 158'h292d53d064ef90431afa2319a79a7540782d4185;
    stim[2] = 158'h1124209c3d7ad37aa9c8f615dcaa7ede2ef056f0;
    stim[3] = 158'h02481447136a3e73687e001fe4e679288c3b724d;
    stim[4] = 158'h13c404f1f91501841fd85131f551e98f8abb7787;
    stim[5] = 158'h1f9971562747289a845ceeaab33cc9c4d530e717;
    stim[6] = 158'h0e6b81062f863ee38cbe0646291e20576e4d2133;
    stim[7] = 158'h0885e6aadfaf817db74c882128560a847d186aac;
    stim[8] = 158'h00e959b0908a5afc9ba736c2b2f8932b4f071b96;
    stim[9] = 158'h1410199bd4973f832c7bf22318f2fb89d54ac0bb;
    stim[10] = 158'h04b26055a5d75d5d2eac573ea17810dec68ae29f;
    stim[11] = 158'h1e0e134bb16a2d31c61994e5b018b56b411e9c07;
    stim[12] = 158'h1151347861513ae5ceb68ed9308ef5375826f9d4;
    stim[13] = 158'h0397998e52e26a11b0958d5fa0071be0370bc585;
    stim[14] = 158'h14e21a758e272578a22b8a5dfdac33de14de0a62;
    stim[15] = 158'h1818d9eafb1b70ea566a5d1b4a897dfd32c19d7b;
    stim[16] = 158'h1cd47540de7b8d343953d0de6e5a6158a590b6b4;
    stim[17] = 158'h1a03f7ef9f30ffd53787717d59b9aa1d84dccc2e;
    stim[18] = 158'h1eba83a8447b634a89513d0da829cfbf22456dd4;
    stim[19] = 158'h1cb9fddfdfc1d81c75dd229783428c99883fa451;
    stim[20] = 158'h105bd0997a8c8c5e6d70ff2fb309b6677b5b7cf6;
    stim[21] = 158'h1125bcad9761c9ddf6ffe19a0fb37e30dcde7fce;
    stim[22] = 158'h0bfbcc2bbefff7dac19c7ab03fc1aece0eafde2e;
    stim[23] = 158'h004fbde07b85e4bb97786817fa91384d187ad837;
    stim[24] = 158'h1097ccbb67676f0f67c2dad74edb24ca16371052;
    stim[25] = 158'h1f7c5f3a92adb4947812bcfff81dbbdf5bd666c5;
    stim[26] = 158'h1deb2f68268039ddf731260f02aa26ddabbbc609;
    stim[27] = 158'h1c69d0b9ddc85bdcfbe6fdb3b5fe728cc00ab5c4;
    stim[28] = 158'h195046f75d3536a8ff29d0b4db1aff05f08b4761;
    stim[29] = 158'h13a7904c42b9e7fb5bcb5d894fe8daede74e4b6b;
    stim[30] = 158'h1da35b184d30000136a3c1156812749fc88c8d53;
    stim[31] = 158'h16980b6f3f7750536363445da3919de69c6fe71e;
    stim[32] = 158'h0282fe37d817468a5007f4f4544ad09177d69634;
    stim[33] = 158'h1efb6b667079b3387b652c740783828f8e5c0833;
    stim[34] = 158'h19acc7289cddf9335fb2d12da55fbfb09ebeb072;
    stim[35] = 158'h0a9dd21b5b4ff01b7b30020f51cf7cba93d5a262;
    stim[36] = 158'h1d1edaf76cc38e9c1eff45ce438322bef9699d0b;
    stim[37] = 158'h182d894a1e99e5db2941aecc720a04d85be075f0;
    stim[38] = 158'h08e69d09d5308e5c83b6d271d72eb3356f91612a;
    stim[39] = 158'h050aaa53879778a275a5683f8911da536349b7ae;
    stim[40] = 158'h0a7ef2d62687d70069ff8f5d7dde1ad0effc39a4;
    stim[41] = 158'h039b1122a906d468b73318105bad90e709c84866;
    stim[42] = 158'h06d13d6030614cda6afd493e967ec02fa3c7b799;
    stim[43] = 158'h0a2ada9be310b3219760de54435658949299e8f2;
    stim[44] = 158'h064109d57e418a9c352725dea8d2e1e423543189;
    stim[45] = 158'h142009a15a4a6998daed353b44f72da7dec70e12;
    stim[46] = 158'h1a4169c5852a5140a9ac2147bfb4091e81d8a4be;
    stim[47] = 158'h076985a87aa6b1fc9f44ec6b95ebd8edbcd2a104;
    stim[48] = 158'h1484d0a319e47ebd4ea4a9a1db8ebc847784ab78;
    stim[49] = 158'h103d0456cc194a597eabe836dacd53ae394b829e;
    stim[50] = 158'h10457d114aad1cd80da1b78f93403347583c30db;
    stim[51] = 158'h152878f1b54c0c1ede66f7b5c1a1233f8b363b50;
    stim[52] = 158'h0f5b67603d98b9854165535eb6c0489155411653;
    stim[53] = 158'h09e5a43bc2bdcbd3d15626d3e2eb49360dd1ddf9;
    stim[54] = 158'h047dc3b7cdca11a9051ec48d143f2c180835b067;
    stim[55] = 158'h000d37b11bfaf228561ded5b2da8c7d27c50f3f5;
    stim[56] = 158'h087a849d5a31bd317cb97f2d30799477406f8891;
    stim[57] = 158'h1557be0b55858647470a781b03935a5150c7de3c;
    stim[58] = 158'h0db8d2b4adee6867448a66677b43a6502121409c;
    stim[59] = 158'h1cff1ae532b6792abd856b70c40e9f658eb59980;
    stim[60] = 158'h0fd025f6f7238defdfdf6b1027afeeaf731717a4;
    stim[61] = 158'h0333ed0b581629c68df51cfd947960b49b41d6c6;
    stim[62] = 158'h1c4e36b58b6898f20d773ab228d022f4bf8cc87f;
    stim[63] = 158'h0161b4ff745044d81460fd6dbf8f46c532d49d6b;
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
      expv[3] = 180'h200003870f5a6f55391ec2bb954fdbc5de000015bc15b;
      expv[4] = 180'hc90288e26d47ce6d0fc003fc9ccf2511877fffdc935c9;
      expv[5] = 180'hd0008e3f02a03083f90a263eaa3d31f1577fffdde1dde;
      expv[6] = 180'hd0008e3f02a03083f90a263eaa3d31f1577fffdde1dde;
      expv[7] = 180'hd0008e3f02a03083f90a263eaa3d31f1577fffdde1dde;
      expv[8] = 180'h1030c55b05f02fb6e91104250ac1508fa300001aab1aa;
      expv[9] = 180'h1d2b3612114b5f9374e6d8565f126569e0ffffc6e586e;
      expv[10] = 180'h1d2b3612114b5f9374e6d8565f126569e0ffffc6e586e;
      expv[11] = 180'h1d2b3612114b5f9374e6d8565f126569e0ffffc6e586e;
      expv[12] = 180'h1d2b3612114b5f9374e6d8565f126569e0ffffc6e586e;
      expv[13] = 180'h20228f0c0a275cb9d411db2611dea6eb04c0003e753e7;
      expv[14] = 180'hd2f331ca5c4d423612b1abf400e37c06e17ffff161716;
      expv[15] = 180'hd2f331ca5c4d423612b1abf400e37c06e17ffff161716;
      expv[16] = 180'h00132d5f036e1d4acd0ba369512fbfa6583fffe75ee75;
      expv[17] = 180'h00132d5f036e1d4acd0ba369512fbfa6583fffe75ee75;
      expv[18] = 180'hc072edf3061ffaa6f02e2fab373543b09b8000330bb30;
      expv[19] = 180'hc072edf3061ffaa6f02e2fab373543b09b8000330bb30;
      expv[20] = 180'hc072edf3061ffaa6f02e2fab373543b09b8000330bb30;
      expv[21] = 180'h0072032f01918bcdac1fe5f66136ccef6b7fffdf3d9f3;
      expv[22] = 180'h203385b20c393bbedd3c3341f66fc61b9bc0001ff39ff;
      expv[23] = 180'hd07185770ffefb58310f5607f835d9c1d5fffff78bb78;
      expv[24] = 180'h09f7bc0f70bc9772ef0d02ff522709a30f4000360df60;
      expv[25] = 180'h1071876c0cede1ecf81b5ae9db649942c6ffffc414841;
      expv[26] = 180'h1071876c0cede1ecf81b5ae9db649942c6ffffc414841;
      expv[27] = 180'h1071876c0cede1ecf81b5ae9db649942c6ffffc414841;
      expv[28] = 180'h1071876c0cede1ecf81b5ae9db649942c6ffffc414841;
      expv[29] = 180'h2000ceeb06a6d51fe53a169b635fe0be117fffd1d851d;
      expv[30] = 180'hd0720988073cff6b792bb129fd1b5dbce9c00012dad2d;
      expv[31] = 180'hd0720988073cff6b792bb129fd1b5dbce9c00012dad2d;
      expv[32] = 180'hd0720988073cff6b792bb129fd1b5dbce9c00012dad2d;
      expv[33] = 180'hd05fc6fb02e8d14a00fe9e8a895a122efac000258d258;
      expv[34] = 180'hd05fc6fb02e8d14a00fe9e8a895a122efac000258d258;
      expv[35] = 180'h3010e5130bbf266bf41a25b4abf7f613d7c0002c1cac1;
      expv[36] = 180'hd032436b09fe036f640041ea39ef97527abfffe898a89;
      expv[37] = 180'hd032436b09fe036f640041ea39ef97527abfffe898a89;
      expv[38] = 180'h00312943033cbb652835d98e41409b0b7c00001d7c1d7;
      expv[39] = 180'h1053a13a0611cb90741a4e3ae5d666adf23fffd84a984;
      expv[40] = 180'h1053a13a0611cb90741a4e3ae5d666adf23fffd84a984;
      expv[41] = 180'hc0524ac400fae00d3d31ebafbbc35a1dff80000e690e6;
      expv[42] = 180'hd362245520da8d16e663020b75b21ce13900001219921;
      expv[43] = 180'hd362245520da8d16e663020b75b21ce13900001219921;
      expv[44] = 180'hc053437c02166432ec1bca886acb1292533ffffa3cba3;
      expv[45] = 180'hc053437c02166432ec1bca886acb1292533ffffa3cba3;
      expv[46] = 180'hc053437c02166432ec1bca886acb1292533ffffa3cba3;
      expv[47] = 180'hc02128b0054a2815350428f7f68123d03b0000292fa92;
      expv[48] = 180'hc02128b0054a2815350428f7f68123d03b0000292fa92;
      expv[49] = 180'hc02128b0054a2815350428f7f68123d03b0000292fa92;
      expv[50] = 180'h00208ad903294b2fd53d06db59aa75c7297fffe0a7a0a;
      expv[51] = 180'h0023a22905a39b01b436f1f2680668eb0780000c36cc3;
      expv[52] = 180'h0023a22905a39b01b436f1f2680668eb0780000c36cc3;
      expv[53] = 180'h0023a22905a39b01b436f1f2680668eb0780000c36cc3;
      expv[54] = 180'h3030877807b97a7a2804da7c5d6926c1ba3ffff77e777;
      expv[55] = 180'h3030877807b97a7a2804da7c5d6926c1ba3ffff77e777;
      expv[56] = 180'h01a6f6237f5e450ac3bdab65b518fa4f8a00003cfd7cf;
      expv[57] = 180'h005083ab0637a62f952fe5a60f328ee80dffffe224622;
      expv[58] = 180'h005083ab0637a62f952fe5a60f328ee80dffffe224622;
      expv[59] = 180'h005083ab0637a62f952fe5a60f328ee80dffffe224622;
      expv[60] = 180'h005083ab0637a62f952fe5a60f328ee80dffffe224622;
      expv[61] = 180'h005083ab0637a62f952fe5a60f328ee80dffffe224622;
      expv[62] = 180'hc67da16b02c538d1bea39fb28f2c1693683ffff5b1b5b;
      expv[63] = 180'hc67da16b02c538d1bea39fb28f2c1693683ffff5b1b5b;
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
