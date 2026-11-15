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

  rtlpp_11053 dut (
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
    stim[0] = 158'h24b64637864c6ed966e20cb6a4afb6d0e01d0af6;
    stim[1] = 158'h22d849c8a7e4b21018a81051e253227fe73176c9;
    stim[2] = 158'h01256c0ab3a9519edc8492f67668c5a36226d37f;
    stim[3] = 158'h02d86abe22930899ad95bc4886a109e130efa44e;
    stim[4] = 158'h0cb89a074c340f9d13f1ddbb81738ae2bc7dc302;
    stim[5] = 158'h1ec2567dd1827bd9343045129c54fe6cdf3c5193;
    stim[6] = 158'h097b53a4dcbed51326d5caec34766c06f0e791a2;
    stim[7] = 158'h16bc07b22582c19356a4d0393a9773f15c1d1bc0;
    stim[8] = 158'h060f5121afe500ef32d64c81d13f205853b6a91a;
    stim[9] = 158'h0652bca505c81ebbce5b233321a1914d32569063;
    stim[10] = 158'h14f59ca33ff165c35855ea59b34c94ce02b04699;
    stim[11] = 158'h1c4fc0d3d60a5950527f361dcd380851ed746b26;
    stim[12] = 158'h0239d2658ec0b3e036c9e227f4dc4a2f153717b7;
    stim[13] = 158'h03d634fb3998eabc548690fd32d062ee1ae5371b;
    stim[14] = 158'h16685f78eca5b05caa1e4eefe71a59a858679fe1;
    stim[15] = 158'h1fe92baafaaa33c09a0ec654931ec4f3f7865ab3;
    stim[16] = 158'h0559543fee44c74f36dfa9b3a05bde4b036ab4e4;
    stim[17] = 158'h0cab9b4a5503ab552922518e07ab08f140305ca7;
    stim[18] = 158'h1c46c868808d6acf864e7428ecc2780fac7333c3;
    stim[19] = 158'h182f2f773e60f03be8782125b7a7540a034706e0;
    stim[20] = 158'h12798597d58422c8444c94e2e60a6d3a9c167638;
    stim[21] = 158'h1ab7fa0e24e27271cb814592211d18cf03e8a079;
    stim[22] = 158'h0fd5488e1ad17564b8a05dd6a0db1bb395217ded;
    stim[23] = 158'h06584bca97bc5f15d12aee5d9f846f1d45e3b278;
    stim[24] = 158'h0c63a62f5b5c4863c1ff2cf6feea5ddd22972b1f;
    stim[25] = 158'h14b7eb1c7bb34388ed9eea028db730a2584323f5;
    stim[26] = 158'h0360d00354079377cfe117691a107ff8c0bb2268;
    stim[27] = 158'h15614418839e622fe437d3ff6301672ebbeefacb;
    stim[28] = 158'h11c98a959209792941ec83758541706d3924ab93;
    stim[29] = 158'h13d8320aef7347e7bbbaaf0e8bbf995cdf9ecb3e;
    stim[30] = 158'h0e96180137846e60414abfaf420e1730abe83db0;
    stim[31] = 158'h0ac66b3d741a7d55756970c0815f0e00890359fb;
    stim[32] = 158'h1cc6a42b0d6c7ebe9da5e8acd4adc867fcf72e0a;
    stim[33] = 158'h2514723a9122139f9326ecd8252c4d18d6302a23;
    stim[34] = 158'h09ab534bd1cb07594aa0936db91da1aaa8d3e5e8;
    stim[35] = 158'h1368ea4fccac9728c4f385d8d85e2f4769808e7f;
    stim[36] = 158'h06af380afaa9daa508aa707d494ef85879e028f7;
    stim[37] = 158'h040cfa4f797f5a19ac091b5ff82d00ed1099f909;
    stim[38] = 158'h0092e160448ca150eb046ff5afe9d0dbd19ca825;
    stim[39] = 158'h1814ab1b06130d72b7912fefd1542946fc54a153;
    stim[40] = 158'h146be13ac7527c1adf49427e01bab7bca60db6ec;
    stim[41] = 158'h024f7cb1668bf1f1c82c69e6ffca87b532e25a42;
    stim[42] = 158'h0f452667088f5ae542835708effaf871dd85eb2f;
    stim[43] = 158'h09becabb55413b67a66cb21c4fd31e2867875991;
    stim[44] = 158'h1844cac047a54e3847165fd68bbdb76abacc5f14;
    stim[45] = 158'h1c9480bd1a8896ea7ad320db9cb6cbea9e5c03c0;
    stim[46] = 158'h0b04a1ea205ae2d1e9b058b729adc8a50407a620;
    stim[47] = 158'h1ec020e0ab8c0e627202c8f70e12f7a4c0940fee;
    stim[48] = 158'h021279c9f09505ef1e1668008e1a470b602775e9;
    stim[49] = 158'h183d9df074d86ce46159ed7636b3fb9b5e6ddd44;
    stim[50] = 158'h163739f7ff9b60e7230281bb396d68244816aeaf;
    stim[51] = 158'h1368cd3e8f8e416bf0b2b4f608c3e41c9510316b;
    stim[52] = 158'h1c49def923c4818a2e7f4546e70afe83c5555d21;
    stim[53] = 158'h15c3129bf36c0c58beba00bd8e9e2ea6d4999d67;
    stim[54] = 158'h03eab41323cad43a7c23c287599060e58c3db32f;
    stim[55] = 158'h1b3a38e93c8fc09cdab4058cd921e54c051548e9;
    stim[56] = 158'h17d321f160927fb56bca8971f4681e464a6f8cc0;
    stim[57] = 158'h15c65972661694ceb7b15d1acf71989c5120598d;
    stim[58] = 158'h19c49877c55775a6d002ac93cf5d7d2eea6c230d;
    stim[59] = 158'h189faa2e35853bcab306406e2274cf40239f45ef;
    stim[60] = 158'h1d457878083a9d20735107b0ac8a7710dddcddf1;
    stim[61] = 158'h1d2ff1bf43753b11e5a8b9a5487122bd29d62667;
    stim[62] = 158'h02a2761959992aab3d72fef1b2d1f19c643aa0c6;
    stim[63] = 158'h1eebdb041266e45f9459558bb6c0a8eec064e2e7;
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
      expv[3] = 180'h24ad8156752a33db90925ececd18b46c44c00034dff4d;
      expv[4] = 180'hdb0d57c452611335b2b78910d4213c261dffffe913a91;
      expv[5] = 180'hdb0d57c452611335b2b78910d4213c261dffffe913a91;
      expv[6] = 180'hdb0d57c452611335b2b78910d4213c261dffffe913a91;
      expv[7] = 180'h2062649b07daa264d8395d868ecd80de1cffffe468a46;
      expv[8] = 180'h2062649b07daa264d8395d868ecd80de1cffffe468a46;
      expv[9] = 180'h2062649b07daa264d8395d868ecd80de1cffffe468a46;
      expv[10] = 180'h2062649b07daa264d8395d868ecd80de1cffffe468a46;
      expv[11] = 180'h2062649b07daa264d8395d868ecd80de1cffffe468a46;
      expv[12] = 180'h2062649b07daa264d8395d868ecd80de1cffffe468a46;
      expv[13] = 180'hc73a4cb1d8167c06d93c44fe9b8945e2a6ffffc5edc5e;
      expv[14] = 180'hdac69f67331d578a90d21fa65a0c5dc35cbfffcdc6cdc;
      expv[15] = 180'hdac69f67331d578a90d21fa65a0c5dc35cbfffcdc6cdc;
      expv[16] = 180'hdac69f67331d578a90d21fa65a0c5dc35cbfffcdc6cdc;
      expv[17] = 180'hdac69f67331d578a90d21fa65a0c5dc35cbfffcdc6cdc;
      expv[18] = 180'hdac69f67331d578a90d21fa65a0c5dc35cbfffcdc6cdc;
      expv[19] = 180'hdac69f67331d578a90d21fa65a0c5dc35cbfffcdc6cdc;
      expv[20] = 180'h0061eee70c1e077d0d0424b6f4ea814068ffffc1b801b;
      expv[21] = 180'hc030a2fa0084590889129c5cc14da75382c0001d8e1d8;
      expv[22] = 180'hd07341c40c4e4e397028b24423a319e07d0000281e681;
      expv[23] = 180'hd07341c40c4e4e397028b24423a319e07d0000281e681;
      expv[24] = 180'hd07341c40c4e4e397028b24423a319e07d0000281e681;
      expv[25] = 180'hd07341c40c4e4e397028b24423a319e07d0000281e681;
      expv[26] = 180'hd07341c40c4e4e397028b24423a319e07d0000281e681;
      expv[27] = 180'hcc1a006a80f26ef9fc22ed23420fff18177fffc89a089;
      expv[28] = 180'hcc1a006a80f26ef9fc22ed23420fff18177fffc89a089;
      expv[29] = 180'h303142b2012f25283d106eb0a82e0da72480002ae4eae;
      expv[30] = 180'hd002415d0e68fcf77515e1d177f32b9bf3c00032cfb2c;
      expv[31] = 180'hd002415d0e68fcf77515e1d177f32b9bf3c00032cfb2c;
      expv[32] = 180'hd04167ae034faaaead2e18102be1c011207fffd67ed67;
      expv[33] = 180'h000000000000000000000000000000000000000000000;
      expv[34] = 180'h000000000000000000000000000000000000000000000;
      expv[35] = 180'h3062697a0960eb2954126db723b435551a7ffff97a397;
      expv[36] = 180'hc01149f90592e5189c30bb1b0bc5e8ed300000239fe39;
      expv[37] = 180'hc01149f90592e5189c30bb1b0bc5e8ed300000239fe39;
      expv[38] = 180'hc01149f90592e5189c30bb1b0bc5e8ed300000239fe39;
      expv[39] = 180'h125c2c0891942a1d608dfeb5fd3a1b7a3380002a096a0;
      expv[40] = 180'h001163600261ae56f025fdfa2a8528df8a80002854e85;
      expv[41] = 180'h001163600261ae56f025fdfa2a8528df8a80002854e85;
      expv[42] = 180'hc9ef962cd17e3e39058d3cdff950f6a65c40001690969;
      expv[43] = 180'hc9ef962cd17e3e39058d3cdff950f6a65c40001690969;
      expv[44] = 180'h3051476a08276cf4cd164389fa63c50cf0ffffd664566;
      expv[45] = 180'h0011480804a9c708e00bfad177b6ed5759800017c517c;
      expv[46] = 180'h0011480804a9c708e00bfad177b6ed5759800017c517c;
      expv[47] = 180'hc0102d440b5c5a3d340b16e535b914a080ffffe988298;
      expv[48] = 180'hc0102d440b5c5a3d340b16e535b914a080ffffe988298;
      expv[49] = 180'hc24f393e12a0bde3c2cd0011c348e16c04ffffdd7a5d7;
      expv[50] = 180'h0033ae0e0b0d9c8c293daec6d67f736bcdbffff751375;
      expv[51] = 180'h0033ae0e0b0d9c8c293daec6d67f736bcdbffff751375;
      expv[52] = 180'hc011a7d101c82d7e14169ec1187c8392a200000c5acc5;
      expv[53] = 180'hc011a7d101c82d7e14169ec1187c8392a200000c5acc5;
      expv[54] = 180'hc011a7d101c82d7e14169ec1187c8392a200000c5acc5;
      expv[55] = 180'hdd568264795a874f847850eb320c1cb187bfffeccbecc;
      expv[56] = 180'hc0430d2701f8139b5400b19b243ca980a2bfffd23a523;
      expv[57] = 180'hc0430d2701f8139b5400b19b243ca980a2bfffd23a523;
      expv[58] = 180'hc0430d2701f8139b5400b19b243ca980a2bfffd23a523;
      expv[59] = 180'h30130ef80aeeb4da00159279ebafa5dd4d800008c348c;
      expv[60] = 180'h107145c600a7795660080dc44e99e80473ffffd17bd17;
      expv[61] = 180'h107145c600a7795660080dc44e99e80473ffffd17bd17;
      expv[62] = 180'h107145c600a7795660080dc44e99e80473ffffd17bd17;
      expv[63] = 180'hd44ec32b33255567ae5fde365a3e338c8740002831a83;
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
