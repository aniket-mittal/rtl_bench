// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 137;
  localparam OW = 137;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00658 dut (
    .clk(clk),
    .rst(in_vec[136:136]),
    .rcn_in(in_vec[135:67]),
    .cs(in_vec[66:66]),
    .seq(in_vec[65:61]),
    .wr(in_vec[60:60]),
    .mask(in_vec[59:56]),
    .addr(in_vec[55:32]),
    .wdata(in_vec[31:0]),
    .rcn_out(out_vec[136:68]),
    .busy(out_vec[67:67]),
    .rdone(out_vec[66:66]),
    .wdone(out_vec[65:65]),
    .rsp_seq(out_vec[64:60]),
    .rsp_mask(out_vec[59:56]),
    .rsp_addr(out_vec[55:32]),
    .rsp_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 137'h1cbd10b608dc45c9277532e1fe955a53f8f;
    stim[1] = 137'h18dff74da6f1147350ea77ed103b5de7300;
    stim[2] = 137'h012fb5d86d6ce1c654e7a0df69be0ed4242;
    stim[3] = 137'h088b484818d66d043c59df1a138a3f937eb;
    stim[4] = 137'h065535f86c66aceb6449a38562ae6aa99d8;
    stim[5] = 137'h060abee99dfc7364cd4acc9c638e508551e;
    stim[6] = 137'h0adfbd6c6c99bd9793dc42c61359f8afe97;
    stim[7] = 137'h04711b7de74c1d641b5252587f3e81f10ff;
    stim[8] = 137'h03e4c15a0d314b3ee14c541193c11884c7f;
    stim[9] = 137'h08f19d6f814d5d076195ca6b1b1467e8960;
    stim[10] = 137'h067f5ec2940f8ea33f59b3253bce45f60cd;
    stim[11] = 137'h0366c67f954a20f3c1c95b67c2404d1c281;
    stim[12] = 137'h0275ca31609b9f22474456b667b04137417;
    stim[13] = 137'h0a98ff0c55973a58dd7a47d18fad8e28494;
    stim[14] = 137'h00823ea9b581e5fd10acf29e3951c84e0c5;
    stim[15] = 137'h04f3dad23168365fd8eddb4bd5bdd0e3e34;
    stim[16] = 137'h07e6f9e5ed8c34e681a8634e5a96bdfb1aa;
    stim[17] = 137'h0f86b492b37531e8c9ef88199f05c41bfba;
    stim[18] = 137'h0556c204bdd4ecc377744ba0fe78c596a41;
    stim[19] = 137'h0ce203fe7ccff94957bbc6400bf30b21da9;
    stim[20] = 137'h0d02071d46a8feae1d2f470e822dcc649c4;
    stim[21] = 137'h0e51df8b7e888bb1c98cdcb1af096391b75;
    stim[22] = 137'h0d23acf8374ae8c84214daf5b1955e2eeab;
    stim[23] = 137'h03f2af98e4028e9cc96930bcd7b49210ef3;
    stim[24] = 137'h025d3b4e595f520b3971b9a5e4abc17ad2e;
    stim[25] = 137'h0459a00ffa4f57930a82104812a077cf0a8;
    stim[26] = 137'h02c66586f417c0f47b4579094fe0e016a21;
    stim[27] = 137'h063dfa7d5e8f2d76d6b83f913f8543494f4;
    stim[28] = 137'h0324a61dc9c15273b3aaab9e5b73b0a8046;
    stim[29] = 137'h017eb085e17d249fe85cc13699c37b9cbb2;
    stim[30] = 137'h086372548e3248286bae22f351a98c11292;
    stim[31] = 137'h06158c80d79211db064bf7c28923c648ac7;
    stim[32] = 137'h0cfa6812c657c1e2b6d603a2e0a91f49684;
    stim[33] = 137'h0079fddd23e0ffa66965f395c99e04c4d54;
    stim[34] = 137'h030306c61d00e91e6c8e75d952734700779;
    stim[35] = 137'h049a518ecbcfe15999bce76c6709715e04c;
    stim[36] = 137'h020f43767670594fa57ca976d619d764c39;
    stim[37] = 137'h0241d0943365a8f71f51753a7fb86f0de93;
    stim[38] = 137'h09e82a30f73c5677a33673edb6d2e2e3f09;
    stim[39] = 137'h0f01350db0e34b0fdba67322169f6a05831;
    stim[40] = 137'h06b0b3aa72ed422e5bc3af3314acb8106f8;
    stim[41] = 137'h08b460069869b057815770c0c8e5fb3811c;
    stim[42] = 137'h0a100b497f43417133e2981fd7d28de7f16;
    stim[43] = 137'h0fe025b8021ecd26e2d29ffdb5dadb7ec62;
    stim[44] = 137'h09b6230185629d7b2d244c5d0c07607a58e;
    stim[45] = 137'h0ffe3a094ba2dd99fa04ce4d24f21dbe74d;
    stim[46] = 137'h0bfbb809ef7f9779c03556c29991fcee056;
    stim[47] = 137'h09dc5746064e6e3fbfb0b393b0038c95888;
    stim[48] = 137'h067bcf4e4556ec5931ff051e6b87ecbcd35;
    stim[49] = 137'h04c4cd91162c8e3f8a2fc35cdef76a31ce6;
    stim[50] = 137'h0056496cf24578c62506f96cf8e283ac30b;
    stim[51] = 137'h077117a34b63892cef73e7c9e9383263b95;
    stim[52] = 137'h0185abd3982277b4f1ce3481a8aa3b63b58;
    stim[53] = 137'h0daa8ce6fb661d2a29205f61ed0317058a2;
    stim[54] = 137'h0049f5ebaabc7fba7a7fb4af9d4f4028d72;
    stim[55] = 137'h0e128585c6b0ae847e34f8ec6649616c049;
    stim[56] = 137'h03c81dc29ef48b847d988b3734fef6f80d0;
    stim[57] = 137'h0064fba06ccf06cd6447dec27a0918b5b37;
    stim[58] = 137'h0fd96da91b655500837bbd4c30dbfd63cc7;
    stim[59] = 137'h0b125ff5bc31659966e821da5bcbd2f3b3a;
    stim[60] = 137'h06d1db1b1eaa4beb6c3b0c16dcd3da0be75;
    stim[61] = 137'h00d5d77db508a970c6bf86c5c6697d0158f;
    stim[62] = 137'h005d7eb56023a50832307420ccb134a846a;
    stim[63] = 137'h0d0b5b805c29285a71665d5a6d9762799b7;
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
      expv[0] = 137'h00000000000000000000000000000000000;
      expv[1] = 137'h00000000000000000000000000000000000;
      expv[2] = 137'h00000000000000000000000000000000000;
      expv[3] = 137'h1c4a0df69be0ed424216f6bb0d8d9c38ca9;
      expv[4] = 137'h1c3df1a138a3f937eb856909030acda0878;
      expv[5] = 137'h1116909031acda087808a6bf0d8cd59d6c8;
      expv[6] = 137'h181cc9c639e508551e0757dd338f8e6c99a;
      expv[7] = 137'h18342c61369f8afe978df7ad8d8337b2f27;
      expv[8] = 137'h15bf7ad8d9337b2f271a236fbcc983ac836;
      expv[9] = 137'h181541193e11884c7f12982b41862967dc2;
      expv[10] = 137'h07c982b41a62967dc29a33adf009aba0ec3;
      expv[11] = 137'h11e33adf029aba0ec31cebd85281f1d467e;
      expv[12] = 137'h1c15b67c2404d1c28112d8cff289441e783;
      expv[13] = 137'h18056b667a0413741719b9462c0373e448e;
      expv[14] = 137'h18747d18f9d8e284948f1fe18a82e74b1ba;
      expv[15] = 137'h1531fe18ab2e74b1ba0347d536803cbfa21;
      expv[16] = 137'h1c5db4bd5add0e3e341a7b5a460d06cbfb1;
      expv[17] = 137'h09e7b5a462d06cbfb113df3cbd81869cd03;
      expv[18] = 137'h1c588199f35c41bfba82d692564ea63d193;
      expv[19] = 137'h1f0d692566ea63d1930bd840978a9d986ee;
      expv[20] = 137'h0aad84097ba9d986ee91407fcf89ff292af;
      expv[21] = 137'h19c407fcf99ff292af8140e3a8c51fd5c3a;
      expv[22] = 137'h1a040e3a8d51fd5c3a893bf16fc11176393;
      expv[23] = 137'h1ca3bf16fd1117639392759f06c95d19084;
      expv[24] = 137'h1a4759f06e95d190841855f31c8051d3992;
      expv[25] = 137'h1c6b9a5e48bc17ad2e0ea769cb0bea41672;
      expv[26] = 137'h04ba769cb2bea416720c3401ff49eaf2615;
      expv[27] = 137'h1c079094fe0e016a2100ccb0de82f81e8f6;
      expv[28] = 137'h058ccb0de82f81e8f61dbf4fabc1e5aedad;
      expv[29] = 137'h0c7bf4fabd1e5aedad1394c3b9082a4e767;
      expv[30] = 137'h183c13699e37b9cbb21ed610bc0fa493fd0;
      expv[31] = 137'h02fd610bc2fa493fd0906e4a91c649050d7;
      expv[32] = 137'h10c6e4a91c649050d70bb1901ac2423b60c;
      expv[33] = 137'h18203a2e0b91f496849c4d0258caf83c56d;
      expv[34] = 137'h19f4d0258caf83c56d1f3fbba44c1ff4cd2;
      expv[35] = 137'h00f3fbba47c1ff4cd20260d8c3801d23cd9;
      expv[36] = 137'h06060d8c3a01d23cd90f4a31d949fc2b333;
      expv[37] = 137'h187a976d629d764c3904e86ecece0b29f4a;
      expv[38] = 137'h1c2753a7f886f0de93023a12864cb51ee3e;
      expv[39] = 137'h0483a12866cb51ee3e9605461ec78acef46;
      expv[40] = 137'h13d05461ee78acef468126a1b60c6961fb7;
      expv[41] = 137'h1e026a1b61c6961fb71916754e4da845cb7;
      expv[42] = 137'h1c270c0c8f5fb3811c988c00d30d360af02;
      expv[43] = 137'h1168c00d30d360af022a01692fc8682e267;
      expv[44] = 137'h1829ffdb5dadb7ec629004b70043d9a4dc5;
      expv[45] = 137'h1fc04b70043d9a4dc59ac460308c53af65a;
      expv[46] = 137'h136c46030ac53af65a9fc74129445bb33f4;
      expv[47] = 137'h1ffc74129745bb33f49e77013dcff2ef380;
      expv[48] = 137'h17f77013deff2ef3808c8ae8c0c9cdc7f7f;
      expv[49] = 137'h13b8ae8c0c9cdc7f7f1e79e9c88add8b263;
      expv[50] = 137'h0cf79e9c8aadd8b2630099b222c591c7f14;
      expv[51] = 137'h09899b222c591c7f1408c92d9e48af18c4a;
      expv[52] = 137'h1c6e7c9e9183263b951a22f4694c71259de;
      expv[53] = 137'h1813481a8ba3b63b5800b57a73044ef69e3;
      expv[54] = 137'h030b57a73044ef69e396519cdf4cc3a5452;
      expv[55] = 137'h1b5519cdf6cc3a5452053ebd75478ff74f4;
      expv[56] = 137'h0093ebd75578ff74f48950b0b8c615d08fc;
      expv[57] = 137'h1c250b0b8d615d08fc0503b853ce91708fb;
      expv[58] = 137'h1c0dec27a3918b5b37119f740d89e0d9ac8;
      expv[59] = 137'h1c7bd4c30dbfd63cc78e2db5234caaa0106;
      expv[60] = 137'h1fb2db5236caaa0106884bfeb7862cb32cd;
      expv[61] = 137'h1624bfeb7862cb32cd093b6363c5497d6d8;
      expv[62] = 137'h0da3b6363d5497d6d80abaefb681152e18d;
      expv[63] = 137'h01abaefb6a1152e18d0cafd6ac0474a1064;
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
