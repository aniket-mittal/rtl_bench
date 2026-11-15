// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 289;
  localparam OW = 203;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01492 dut (
    .iLDST_BUSY(in_vec[288:288]),
    .iLDST_VALID(in_vec[287:287]),
    .iLDST_MMU_FLAGS(in_vec[286:275]),
    .iLDST_DATA(in_vec[274:243]),
    .iUSE_SEL(in_vec[242:242]),
    .iEXE_REQ(in_vec[241:241]),
    .iEXE_ORDER(in_vec[240:239]),
    .iEXE_MASK(in_vec[238:235]),
    .iEXE_RW(in_vec[234:234]),
    .iEXE_ASID(in_vec[233:220]),
    .iEXE_MMUMOD(in_vec[219:218]),
    .iEXE_MMUPS(in_vec[217:215]),
    .iEXE_PDT(in_vec[214:183]),
    .iEXE_ADDR(in_vec[182:151]),
    .iEXE_DATA(in_vec[150:119]),
    .iEXCEPT_REQ(in_vec[118:118]),
    .iEXCEPT_ORDER(in_vec[117:116]),
    .iEXCEPT_RW(in_vec[115:115]),
    .iEXCEPT_ASID(in_vec[114:101]),
    .iEXCEPT_MMUMOD(in_vec[100:99]),
    .iEXCEPT_MMUPS(in_vec[98:96]),
    .iEXCEPT_PDT(in_vec[95:64]),
    .iEXCEPT_ADDR(in_vec[63:32]),
    .iEXCEPT_DATA(in_vec[31:0]),
    .oLDST_REQ(out_vec[202:202]),
    .oLDST_ORDER(out_vec[201:200]),
    .oLDST_MASK(out_vec[199:196]),
    .oLDST_RW(out_vec[195:195]),
    .oLDST_ASID(out_vec[194:181]),
    .oLDST_MMUMOD(out_vec[180:179]),
    .oLDST_MMUPS(out_vec[178:176]),
    .oLDST_PDT(out_vec[175:144]),
    .oLDST_ADDR(out_vec[143:112]),
    .oLDST_DATA(out_vec[111:80]),
    .oEXE_BUSY(out_vec[79:79]),
    .oEXE_REQ(out_vec[78:78]),
    .oEXE_MMU_FLAGS(out_vec[77:66]),
    .oEXE_DATA(out_vec[65:34]),
    .oEXCEPT_BUSY(out_vec[33:33]),
    .oEXCEPT_REQ(out_vec[32:32]),
    .oEXCEPT_DATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 289'h1f37e6769f247c38dbd2965eaa00e9c6904ff871b82cbf16c93ca017cfd44eed134b91c4d;
    stim[1] = 289'h017704ad2d84db4638b76ca5d0af41291bc13f8a737d5abdbc05dcf84d96843ac0a5a77e1;
    stim[2] = 289'h045422fa9628862dd68da2426d944dd7a85acfa66e1274210a8d6d196b079ef4049e8c25e;
    stim[3] = 289'h1637189c5707d5c5d7617558dee5ce93566a2a804bcaf0c9d8fd2038c61e6b47f9d58c55b;
    stim[4] = 289'h0a9f8e97f40eb27a42c6738f80a92d61f371245247182fac4ad05a71dc119866626456e10;
    stim[5] = 289'h0455b63bc526d71b115fa6743ef4059d4cc7b9a41679213a0bea345aaa266d35bc931ef6c;
    stim[6] = 289'h097a1c15e18d3d18e274f60c272ba0f23c0f50250037bbc054e4d2ba8be4636853cbeb93d;
    stim[7] = 289'h07af816ba8e70cf4f0398ca8122c4bf01be686dc9433ed9f3528658297e2d79711b00940a;
    stim[8] = 289'h1fe8dddc547a2d56f58bec34b844751d52ac0e284cce1b9f79d6e9d849351a690347c6aa3;
    stim[9] = 289'h0873c64f09fe0fb159a58fd7e1056396dfd2688521c218e1681ae033ba8808c3832ed03d1;
    stim[10] = 289'h11b2b21d97fbbc444d4c616c92e326521a0203d9c2ec30ca92f778e47e66ea28dff42f397;
    stim[11] = 289'h092a93a7e7425d6cbb2f3f80855ae11dffb8f2bd1dd51f8c21c819436770b2d4560804c8a;
    stim[12] = 289'h1dee42b87b43c53ab429656b8b25688924c9c543b921dcd9be6748cfeb06c52009b2ddff6;
    stim[13] = 289'h17385fa6579f10db2f03dd85768803b03a57271fbc047e9ed3272c8a802feee9215dc9c61;
    stim[14] = 289'h100cfd0715188d9dba9cb3e530c09c6a29cb01dfc832faef7c454c50b98fc6a02b1b5a246;
    stim[15] = 289'h0ac461bc5fb69680ffbc0662d24aa9acf759c3a2aada551736a2fff3ba06f4db93726fa20;
    stim[16] = 289'h044d983f8674ed20655d7b27eac8b1267878e61200f5e490249ba0a7b7baddcd94e7a63f6;
    stim[17] = 289'h16d2753917c8d5632240f52c1cdc5d428f79d3359d36f9a74c614e36cce6129299729f305;
    stim[18] = 289'h0cf48f0545f7cd2bd1f6520be0f79139b6a8cf44c794121031337b41285e21c7becde5d1c;
    stim[19] = 289'h048da3a765df246fbcb35534c4a6fd13d25a6e26edc82f3f119d2852d51be030747c9ef94;
    stim[20] = 289'h05befcf3b441a20fcdf5fcf40b939b0eabe768527218704fc19976d265f613d58d35788ab;
    stim[21] = 289'h17cafae10f940336dca3e819b55504a5ed1cfcfaac269bc883f5776a8bc9ee04417d1aea2;
    stim[22] = 289'h15aadfaf61bf0f8f612da6dcc202cc42d394ff4b46645cfae2200dff29c97f8481c67deae;
    stim[23] = 289'h09b39e54f6229bca92dfbdcf5e827a888297cb7cf517e67416b830b4d6170093eb72d2f64;
    stim[24] = 289'h054dde55066c203cee7c1586363379a19f3758a03743c3a5e6ab6d40adf7c7fe478aafa6c;
    stim[25] = 289'h180de90733eba21fdcf8ac12c3dc26ec58be6b3dd0891a3f8b0fba1d1db557f5604ac0528;
    stim[26] = 289'h1dd65cfccdbef63e776dccf63bcbf9c2f0515abc17b69d62d6fd539c98a4b1b1a34ff19d2;
    stim[27] = 289'h1158e51cfc8385b82a9ccc9984002c6524b902b1090d6c8038bb7e995af63c34d4c1d694a;
    stim[28] = 289'h0671c3e4f5815c9a2bd3cb981c9250abcd560daba6641a64ac526ba818b220cbc65f5fd3c;
    stim[29] = 289'h07c6dd5629be808b5dbfa01ba6dddfbb06b6f6f1318151e6e1a4e75291a0bd689c2424c70;
    stim[30] = 289'h022e04b13874d82213767da692e80d7a893072d14c06216194061658600bd0f7464fc5ef2;
    stim[31] = 289'h04b203d2c0f30deaadfa8c0248caf1c2e2bcc4b98b770fb64c7ffef2ec0904f518ebe01a3;
    stim[32] = 289'h110cec751e1665b2671f1ed362ed7d7c7e108c9966c6548293bbaca3e3747b1c6fa45b35a;
    stim[33] = 289'h1e9f2e1df3f4ebbf061dba87b9b45a5da5523b1cd8a3f997aa9ad4f3f90f5281b6b9659e5;
    stim[34] = 289'h09a5ed8483287ebf8d9476aedf34e7a1accf8bbc2f2ed6fcb1e42caea8b0ce5dec53c8076;
    stim[35] = 289'h0e783485096be574a85c0acd85c7db51d9ad169b3c6569e90d8fbf943d20d985aec6e1eb6;
    stim[36] = 289'h1fb205ce4990e4c4597d88295189333a654b4274183f6919a7e8718deaac17fd699bb5d79;
    stim[37] = 289'h04ae00f54eb69e3d47bcd55f71ceff4632c802e0edb50d3fc5cc591cf01616ef2350be4aa;
    stim[38] = 289'h07db951e00bf05c954fd4ca40a371246bb2581441ac086d8199c2bfaf83a1f3b82a6da91c;
    stim[39] = 289'h1e136b4c5e03b6e850eef1758564cd5cc0ab12fe1f179844b87e344cc25e2914422526f6f;
    stim[40] = 289'h04a3a8a8eceb5250376871e129daef70f776c199e1c3635d10e383f7e28668a37d46233b4;
    stim[41] = 289'h1f001128e9d635a78a345749d5ccbfb7ef80ea5d6c8f21d3f7c9e8de69fc036e53a20375f;
    stim[42] = 289'h0d796e52bfa4f14d0e3f5f6caadc064dea1acc70edecb6f1cbaaa9cdce4625261141c3826;
    stim[43] = 289'h08d2aad5f6f1ee66b911825ef2674707ece4a585894035d12465c6bb3c1614356d997f68c;
    stim[44] = 289'h15e891e5ce64a932b5c7698f38a7cba5878e05d3dc19264c8a20ee7cb0628e81209424ec4;
    stim[45] = 289'h07476e83cf5077cc68759de9be2f99bf47313f5787eff51ad1b4f668543681e694ff3c61f;
    stim[46] = 289'h05acdc6bf80a8552dfedeee453412aafd02fba645a02b6432903b7e2cd361f7215005d2ef;
    stim[47] = 289'h0f622ce890b96df796365495e1eacf2ebf0058ee6a760f8c1e86c0020c95358d9c2b90a62;
    stim[48] = 289'h0e900e6388df9c25f0f687ec07f35669363300e10c8840df47087f559811ed111648230ab;
    stim[49] = 289'h166a06f7214cf9762722f10d870c868ecd0abc971437216c496fbda00a770884ee5091dd1;
    stim[50] = 289'h0bb1fbd77586e2e13be91850a610c4b127128834277cddd283d8697a170ceaf6fb9014ca4;
    stim[51] = 289'h19c0496ea42dd296779645043d21a194bce4133505b403994d5f1cd5fddeb8f423d8c501f;
    stim[52] = 289'h03d675a3a612f47247ea517079fd1c8578dc3585438ff67a8855bbcca355e36fba8aa38e5;
    stim[53] = 289'h0ad166e2d8cc24f990b5d3f0f03c8d9aa24ed23bdb9a3644a588cf867a1bcc1e341920f0e;
    stim[54] = 289'h18ca8c828c057eb479dbee39867a780bd4fca43e1115a379593bb6fae6407925dcad5aaff;
    stim[55] = 289'h09bb5908e98fa01668da45301ddc2c2937b99b4877d9ac473602cdabfe8a4b44db068e5a8;
    stim[56] = 289'h0825cfb75de5d91df70928342583b56e27aba6efec4838c1ee96d5097355ffa5c6ed18f83;
    stim[57] = 289'h0bec4e4f8f5dc3f77d26512b47f870510ce5a0a20c3426ac3bfcf61d8165cae8d07334865;
    stim[58] = 289'h0a286ed5931188090261ffc9ed3cc98d86406200fce416f6f94aa781cc5f4642f477d88ce;
    stim[59] = 289'h1dd3caf717abbb8ee6455b8c5a211c297fd38691e85a694b5914d08e0f24b33ab0af69798;
    stim[60] = 289'h06d8dfb5115c19e2d6f1e23ba262ada9354f158f7b2165a3784c28208a43d81c64f8cf114;
    stim[61] = 289'h0803af6c16a6ab3feba69df2253c79e9b0fd37e5b9d5fc2bd10213bf3cf8544d3e483a108;
    stim[62] = 289'h19958d308d9078254cfd594770d2e57f45411cb122e55d510bfa506d5fa7765475032cc1b;
    stim[63] = 289'h0ac199df3a5af9da1ccdec22673dfa92c437a72e1d5291955b6833ab3ca5bc1d91237713b;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 203'h4fbf16c93ca017cfd44eed134b91c4db9bf33b4f923cced3e48;
      expv[1] = 203'h5f5abdbc05dcf84d96843ac0a5a77e18bb825696c24095a5b09;
      expv[2] = 203'h0c5bad1b4484db289baf50b59f4cdc222a117d4b14645f52c51;
      expv[3] = 203'h2ff0c9d8fd2038c61e6b47f9d58c55bb1b8c4e2b83e3138ae0f;
      expv[4] = 203'h64f4858ce71f01525ac3e6e248a48e354fc74bfa0761d2fe81d;
      expv[5] = 203'h1f213a0bea345aaa266d35bc931ef6ca2adb1de29346c778a4d;
      expv[6] = 203'h7a31c4e9ec184e5741e4781ea04a0064bd0e0af0c6a382bc31a;
      expv[7] = 203'h19e9e0731950245897e037cd0db92863d7c0b5d473a02d751ce;
      expv[8] = 203'h5aadeb17d8697088ea3aa5581c50999ff46eee2a3d2bbb8a8f4;
      expv[9] = 203'h1f62b34b1fafc20ac72dbfa4d10a438439e32784ff28c9e13fc;
      expv[10] = 203'h78889a98c2d925c64ca4340407b385d8d9590ecbfde643b2ff7;
      expv[11] = 203'h5f1f8c21c819436770b2d4560804c8a89549d3f3a11274fce84;
      expv[12] = 203'h1fdcd9be6748cfeb06c52009b2ddff6af7215c3da1f8570f687;
      expv[13] = 203'h21b65e07bb0aed10076074ae4e3f780b9c2fd32bcfabf4caf3e;
      expv[14] = 203'h1b3b753967ca618138d4539603bf9068067e838a8c6fa0e2a31;
      expv[15] = 203'h2d01ff780cc5a4955359eeb3874555b56230de2fdb6c378bf6d;
      expv[16] = 203'h5fe490249ba0a7b7baddcd94e7a63f6a26cc1fc33a4307f0ce9;
      expv[17] = 203'h6ff9a74c614e36cce6129299729f305b693a9c8be46ea722f91;
      expv[18] = 203'h4f121031337b41285e21c7becde5d1ca7a4782a2fbd1e0a8bef;
      expv[19] = 203'h48df7966aa69894dfa27a4b4dc4ddb9246d1d3b2efa474ecbbe;
      expv[20] = 203'h441f9bebf9e81727361d57ced0a4e432df7e79da20ef9e76883;
      expv[21] = 203'h066db947d0336aaa094bda39f9f5584be57d7087ca2f5c21f28;
      expv[22] = 203'h1f1ec25b4db984059885a729fe968ccad56fd7b0dfabf5ec37e;
      expv[23] = 203'h379525bf7b9ebd04f511052f96f9ea24d9cf2a7b1163ca9ec45;
      expv[24] = 203'h4079dcf82b0c6c66f3433e6eb1406e82a6ef2a83362bcaa0cd8;
      expv[25] = 203'h443fb9f1582587b84dd8b17cd67ba11c06f48399f5ed20e67d7;
      expv[26] = 203'h6f9d62d6fd539c98a4b1b1a34ff19d2aeb2e7e66df7b9f99b7d;
      expv[27] = 203'h0b7055399933080058ca497205621218ac728e7e41eca39f907;
      expv[28] = 203'h4f1a64ac526ba818b220cbc65f5fd3cb38e1f27ac0887c9eb02;
      expv[29] = 203'h0116bb7f40374dbbbf760d6dede26303e36eab14df6baac537d;
      expv[30] = 203'h6f216194061658600bd0f7464fc5ef291702589c3a4096270e9;
      expv[31] = 203'h1bd55bf518049195e385c579897316e25901e96079a07a581e6;
      expv[32] = 203'h6f548293bbaca3e3747b1c6fa45b35a886763a8f0b2d8ea3c2c;
      expv[33] = 203'h3ff997aa9ad4f3f90f5281b6b9659e5b4f970ef9fa75c3be7e9;
      expv[34] = 203'h6fd6fcb1e42caea8b0ce5dec53c80768d2f6c241941db090650;
      expv[35] = 203'h5f69e90d8fbf943d20d985aec6e1eb6b3c1a4284b5d690a12d7;
      expv[36] = 203'h7f6919a7e8718deaac17fd699bb5d79bd902e724c870b9c9321;
      expv[37] = 203'h3c7a8f79aabee39dfe8c659005c1db6257007aa75b601ea9d6d;
      expv[38] = 203'h0b92a9fa9948146e248d764b02883583edca8f005fa2a3c017e;
      expv[39] = 203'h6dd0a1dde2eb0ac99ab9815625fc3e2f09b5a62f01ed698bc07;
      expv[40] = 203'h3f635d10e383f7e28668a37d46233b4a51d454767585151d9d6;
      expv[41] = 203'h6b4f1468ae93ab997f6fdf01d4bad91f80089474eb22251d3ac;
      expv[42] = 203'h4fb6f1cbaaa9cdce4625261141c3826abcb7295fd25dca57f49;
      expv[43] = 203'h0f35d12465c6bb3c1614356d997f68c869556afb78d55abede3;
      expv[44] = 203'h52656b8ed31e714f974b0f1c0ba7b83af448f2e732623cb9cc9;
      expv[45] = 203'h7ff51ad1b4f668543681e694ff3c61fba3b741e7a80dd079ea0;
      expv[46] = 203'h0aa5bfdbddc8a682555fa05f74c8b402d66e35fc056b8d7f015;
      expv[47] = 203'h6f0f8c1e86c0020c95358d9c2b90a62bb11674485c959d12172;
      expv[48] = 203'h384be1ed0fd80fe6acd26c6601c21917480731c46fe1cc711bf;
      expv[49] = 203'h7f216c496fbda00a770884ee5091dd1b35037b90a660dee4299;
      expv[50] = 203'h4fddd283d8697a170ceaf6fb9014ca49d8fdebbac35f7aeeb0d;
      expv[51] = 203'h4f03994d5f1cd5fddeb8f423d8c501f8e024b75216f92dd485b;
      expv[52] = 203'h7ff67a8855bbcca355e36fba8aa38e59eb3ad1d3094eb474c25;
      expv[53] = 203'h49f3216ba7e1e0791b35449da477b73568b3716c662cdc5b198;
      expv[54] = 203'h5fa379593bb6fae6407925dcad5aaff86546414602b1905180a;
      expv[55] = 203'h402cd1b48a603bb858526f733690efb4ddac8474c7eb211d31f;
      expv[56] = 203'h0f38c1ee96d5097355ffa5c6ed18f83812e7dbaef2d9f6ebbcb;
      expv[57] = 203'h4f26ac3bfcf61d8165cae8d073348659f62727c7aed9c9f1ebb;
      expv[58] = 203'h101204c3ff93da79931b0c80c401f9c514376ac988eddab2623;
      expv[59] = 203'h771dcc8ab718b4423852ffa70d23d0bee9e57b8bd5e95ee2f57;
      expv[60] = 203'h33c5ade3c47744c55b526a9e2b1ef6436c6fda88ae2bf6a22b8;
      expv[61] = 203'h567fd74d3be44a78f3d361fa6fcb73a401d7b60b5365ed82d4d;
      expv[62] = 203'h5f5d510bfa506d5fa7765475032cc1b8cac69846c831a611b20;
      expv[63] = 203'h2f91955b6833ab3ca5bc1d91237713b960ccef9d2d533be74b5;
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
