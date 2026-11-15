// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 193;
  localparam OW = 191;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_158808 dut (
    .clk(clk),
    .rst(in_vec[192:192]),
    .stall(in_vec[191:191]),
    .id_inst(in_vec[190:159]),
    .id_RFRD1(in_vec[158:127]),
    .id_RFRD2(in_vec[126:95]),
    .id_RegDst(in_vec[94:94]),
    .id_MemRead(in_vec[93:93]),
    .id_MemtoReg(in_vec[92:92]),
    .id_ALUOp(in_vec[91:90]),
    .id_MemWrite(in_vec[89:89]),
    .id_ALUSrc(in_vec[88:88]),
    .id_RegWrite(in_vec[87:87]),
    .id_ShiftIndex(in_vec[86:82]),
    .id_ShiftDirection(in_vec[81:81]),
    .id_ALUasrc(in_vec[80:80]),
    .id_call(in_vec[79:79]),
    .id_EXTOUT(in_vec[78:47]),
    .id_RegisterRd(in_vec[46:42]),
    .id_RegisterRs(in_vec[41:37]),
    .id_RegisterRt(in_vec[36:32]),
    .id_pcplus4(in_vec[31:0]),
    .exe_imm32(out_vec[190:159]),
    .exe_inst(out_vec[158:127]),
    .exe_RFRD1(out_vec[126:95]),
    .exe_RFRD2(out_vec[94:63]),
    .exe_RegDst(out_vec[62:62]),
    .exe_MemRead(out_vec[61:61]),
    .exe_MemtoReg(out_vec[60:60]),
    .exe_ALUOp(out_vec[59:58]),
    .exe_MemWrite(out_vec[57:57]),
    .exe_ALUSrc(out_vec[56:56]),
    .exe_RegWrite(out_vec[55:55]),
    .exe_ShiftIndex(out_vec[54:50]),
    .exe_ShiftDirection(out_vec[49:49]),
    .exe_ALUasrc(out_vec[48:48]),
    .exe_call(out_vec[47:47]),
    .exe_RegisterRd(out_vec[46:42]),
    .exe_RegisterRs(out_vec[41:37]),
    .exe_RegisterRt(out_vec[36:32]),
    .exe_pcplus4(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 193'h18303052a777da85af0f22c8de5672dc0b21270facf1e69c8;
    stim[1] = 193'h1c7a811bfa9f3dca41471dba106fe9a6fe3b24b34cf649e75;
    stim[2] = 193'h03b65c890f422108847a673293b8416e43b3ea7f4233c6310;
    stim[3] = 193'h03bd3fbe755846743d6cced53685a3d4e7cf3f823fd106a2e;
    stim[4] = 193'h09c87ae6d62c49c04023e2cf4dd05a50d582340bd52bda2e3;
    stim[5] = 193'h09529af556172906ecc628979637d0040d2f3d47f7ee940a1;
    stim[6] = 193'h0abff2db1f75ed29de329c083376edaec79ddb41819af73fe;
    stim[7] = 193'h09a253b922a4fd7691cfe5a5bb861a539256b226ffe15c3ec;
    stim[8] = 193'h0c33dc8b9ba7ea44b4cd9c3ca6125493a2af7b2af70f97c30;
    stim[9] = 193'h0a4e81b067a95f857f66be394b5e7f91310f883b7c98d91a1;
    stim[10] = 193'h029bf62eb9444607a2ac796887f7891c6dc5c8842a7491b3a;
    stim[11] = 193'h0265c218ee3cdebbe0e684f2b53d123a6337053619611dd23;
    stim[12] = 193'h0dca62643d9029b35716cf302e7616b15cececa47520491ff;
    stim[13] = 193'h0dbac69b9e93262bea26b244c88d792f79c02e5c34d719357;
    stim[14] = 193'h048a4cc39ed68216bed5bf7e60a52b74f7b14700a64f2a03c;
    stim[15] = 193'h0efc7f0f749ebc3ec54cd0c9f8b4ad8df6d7a9ac2fa7e4619;
    stim[16] = 193'h0cd1550bfb5741cbe4674f331eeafc2c0545da724b6626410;
    stim[17] = 193'h0be80eb2cfedf43a7ed22ca4435dd4277968e941d9149668c;
    stim[18] = 193'h06b23a30194b6e6364bcf4ae719e946a013c75ace8703f3a6;
    stim[19] = 193'h029aa463a25240cd0399a9561b96bfd3168796dfd48fb48a5;
    stim[20] = 193'h0c52c1cbf7de290c304d64da0d8f9080cdf2373e3aaae0c27;
    stim[21] = 193'h0f59bb1f8d48b4f3b057d985740282011b3755b5de2e8fefe;
    stim[22] = 193'h0cdfc2f91f5e41375fc1549f7732f23b2966c3ee0b33bde6d;
    stim[23] = 193'h0de12cc67b5b953a9f0da81699518b522988cb4503f77ea0b;
    stim[24] = 193'h0791588d29d33c49ab7b93d5eb8a30524725b444faf36d57b;
    stim[25] = 193'h0f406948a4974257c713772d21d3609a91823439733b98a45;
    stim[26] = 193'h032cf7a79c9be9fbb62368eabda7f8afdb2e09f02b79057d8;
    stim[27] = 193'h000d93c2637191b594f3c62836bc2ba629a65f1958ac5e659;
    stim[28] = 193'h0d466818c61b3d492130b40e7abde6915eb9fa96e2bf868bf;
    stim[29] = 193'h06212814a10936333837da8e40d612d71a55640633ed5e663;
    stim[30] = 193'h0acbff90019d88910707e2b3c18d8b272c7fea4db7bc90b71;
    stim[31] = 193'h0e3535f134ecea3233bbb0fc7318271b6fdbaf40ea0b7b052;
    stim[32] = 193'h00c6a6fd6b4808a52fb3f3dde909b283456c4a9a21f0950b8;
    stim[33] = 193'h0c8a6ec22d0b40a72d5132a780d83b28702c9174c715ee60c;
    stim[34] = 193'h04fb51e730d4490eee737829cfd7b601570a452e2dbb9fb6e;
    stim[35] = 193'h073b54a1201f0bca156e851a612132586c17fa069cf9ce078;
    stim[36] = 193'h07ef85d1c2c482c48c4a69e1ca1b27b6fb40e17a91fe2e968;
    stim[37] = 193'h07cb49862665a19923892a635c07593967c1f7ea00b939bfd;
    stim[38] = 193'h00f2f7d3d5b993a8b5a5a18e5b8f3a333d8b2b19aea954345;
    stim[39] = 193'h02405557db5cf9205388adeb6c44c6b7cbefcefe661df329e;
    stim[40] = 193'h0575d0a7f8db13035e65b31d4e6cb5d3ddf530e9b8a891aed;
    stim[41] = 193'h0b73698c18c59c6029637c8d9e9ef198fef8df49d024b9dff;
    stim[42] = 193'h02360d79c50fe952ad330318d68cd0895da2dd2b0960a537e;
    stim[43] = 193'h0950f40b86b954b3e34db76f8e4e1dbb348f71bc59bec7fef;
    stim[44] = 193'h0df1f203be5f6fec67858e3782a560322fe5fe759b8f01937;
    stim[45] = 193'h0706de267294aac57e1ed5f2d0a6a25b22c177e8d0a808e58;
    stim[46] = 193'h0cfaa2fb5eaa887a1bfe10ad6863858ee6872aa87a779ab62;
    stim[47] = 193'h08e5f608082059dc90fc0757c64dc4d84b9e0dceefc1aa439;
    stim[48] = 193'h083b07d614e32c9098fe0b3585d1a500de950a1119061a6f5;
    stim[49] = 193'h0b201bb0fd03fafe55b9d191ea9bcde27ecc72e6c145389ab;
    stim[50] = 193'h076b67011bd38d045bd84c8309f5d6c5fc43e87a34388706c;
    stim[51] = 193'h00fd7d71c53169aaa294a2f99f2f1e6cf7918b900dcc70880;
    stim[52] = 193'h029775caa074d0a8974dd8409b1cff245bb1f9e988c332826;
    stim[53] = 193'h0396ab98667868d3748c41d38c1be9c7eec41d21cec6bb55c;
    stim[54] = 193'h00005399e72f49c94f84de59cd8d287cb6af4c1af9c36f110;
    stim[55] = 193'h0b95f09f16f043f6bbfb1bd61bb503620e91ed3508e5d638b;
    stim[56] = 193'h0c9d7f75f7e1e0d5b23e86e9c0c9b172d5b99dc45e1f5be18;
    stim[57] = 193'h0690df293093a0749aad1f2f23a71b3ad2cf78969c6c1079b;
    stim[58] = 193'h0f6c92377776fedf805eedfa89e90314f822756c534173407;
    stim[59] = 193'h0ee4c2adf962f45d5143ce3a382a225ad82e7c59d71c6fdde;
    stim[60] = 193'h08bde6d44aad29e4bd9c651063d059bcdb83c0a2034c99d4e;
    stim[61] = 193'h0fbc412f37002ca3db82f5fd325cf075ed2ae3ae1c97c3575;
    stim[62] = 193'h00f7f43c12efd5ccee9edb7867e36d0a58e4ccb0466244d69;
    stim[63] = 193'h0363e65b74b7011b71132d385e3f2484a330b30fe2534eba0;
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
      expv[0] = 191'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 191'h000000000000000000000000000000000000000000000000;
      expv[2] = 191'h000000000000000000000000000000000000000000000000;
      expv[3] = 191'h16e43b3ebb65c890f422108847a673293b8427f4233c6310;
      expv[4] = 191'h3d4e7cf3bbd3fbe755846743d6cced53685a7823fd106a2e;
      expv[5] = 191'h3d4e7cf3bbd3fbe755846743d6cced53685a7823fd106a2e;
      expv[6] = 191'h3d4e7cf3bbd3fbe755846743d6cced53685a7823fd106a2e;
      expv[7] = 191'h3d4e7cf3bbd3fbe755846743d6cced53685a7823fd106a2e;
      expv[8] = 191'h3d4e7cf3bbd3fbe755846743d6cced53685a7823fd106a2e;
      expv[9] = 191'h3d4e7cf3bbd3fbe755846743d6cced53685a7823fd106a2e;
      expv[10] = 191'h3d4e7cf3bbd3fbe755846743d6cced53685a7823fd106a2e;
      expv[11] = 191'h11c6dc5ca9bf62eb9444607a2ac796887f788842a7491b3a;
      expv[12] = 191'h23a63370265c218ee3cdebbe0e684f2b53d153619611dd23;
      expv[13] = 191'h23a63370265c218ee3cdebbe0e684f2b53d153619611dd23;
      expv[14] = 191'h23a63370265c218ee3cdebbe0e684f2b53d153619611dd23;
      expv[15] = 191'h374f7b1448a4cc39ed68216bed5bf7e60a52f00a64f2a03c;
      expv[16] = 191'h374f7b1448a4cc39ed68216bed5bf7e60a52f00a64f2a03c;
      expv[17] = 191'h374f7b1448a4cc39ed68216bed5bf7e60a52f00a64f2a03c;
      expv[18] = 191'h374f7b1448a4cc39ed68216bed5bf7e60a52f00a64f2a03c;
      expv[19] = 191'h46a013c76b23a30194b6e6364bcf4ae719e95ace8703f3a6;
      expv[20] = 191'h7d31687929aa463a25240cd0399a9561b96bedfd48fb48a5;
      expv[21] = 191'h7d31687929aa463a25240cd0399a9561b96bedfd48fb48a5;
      expv[22] = 191'h7d31687929aa463a25240cd0399a9561b96bedfd48fb48a5;
      expv[23] = 191'h7d31687929aa463a25240cd0399a9561b96bedfd48fb48a5;
      expv[24] = 191'h7d31687929aa463a25240cd0399a9561b96bedfd48fb48a5;
      expv[25] = 191'h0524725b791588d29d33c49ab7b93d5eb8a3444faf36d57b;
      expv[26] = 191'h0524725b791588d29d33c49ab7b93d5eb8a3444faf36d57b;
      expv[27] = 191'h0afdb2e0b2cf7a79c9be9fbb62368eabda7f9f02b79057d8;
      expv[28] = 191'h3a629a6580d93c2637191b594f3c62836bc2f1958ac5e659;
      expv[29] = 191'h3a629a6580d93c2637191b594f3c62836bc2f1958ac5e659;
      expv[30] = 191'h2d71a5566212814a10936333837da8e40d6140633ed5e663;
      expv[31] = 191'h2d71a5566212814a10936333837da8e40d6140633ed5e663;
      expv[32] = 191'h2d71a5566212814a10936333837da8e40d6140633ed5e663;
      expv[33] = 191'h283456c48c6a6fd6b4808a52fb3f3dde909b29a21f0950b8;
      expv[34] = 191'h283456c48c6a6fd6b4808a52fb3f3dde909b29a21f0950b8;
      expv[35] = 191'h601570a44fb51e730d4490eee737829cfd7b52e2dbb9fb6e;
      expv[36] = 191'h2586c17ff3b54a1201f0bca156e851a612132069cf9ce078;
      expv[37] = 191'h7b6fb40e7ef85d1c2c482c48c4a69e1ca1b217a91fe2e968;
      expv[38] = 191'h13967c1f7cb49862665a19923892a635c075fea00b939bfd;
      expv[39] = 191'h2333d8b28f2f7d3d5b993a8b5a5a18e5b8f3b19aea954345;
      expv[40] = 191'h6b7cbefca405557db5cf9205388adeb6c44c6fe661df329e;
      expv[41] = 191'h5d3ddf53575d0a7f8db13035e65b31d4e6cb0e9b8a891aed;
      expv[42] = 191'h5d3ddf53575d0a7f8db13035e65b31d4e6cb0e9b8a891aed;
      expv[43] = 191'h0895da2da360d79c50fe952ad330318d68cd52b0960a537e;
      expv[44] = 191'h0895da2da360d79c50fe952ad330318d68cd52b0960a537e;
      expv[45] = 191'h0895da2da360d79c50fe952ad330318d68cd52b0960a537e;
      expv[46] = 191'h25b22c17706de267294aac57e1ed5f2d0a6a7e8d0a808e58;
      expv[47] = 191'h25b22c17706de267294aac57e1ed5f2d0a6a7e8d0a808e58;
      expv[48] = 191'h25b22c17706de267294aac57e1ed5f2d0a6a7e8d0a808e58;
      expv[49] = 191'h25b22c17706de267294aac57e1ed5f2d0a6a7e8d0a808e58;
      expv[50] = 191'h25b22c17706de267294aac57e1ed5f2d0a6a7e8d0a808e58;
      expv[51] = 191'h6c5fc43ef6b67011bd38d045bd84c8309f5d07a34388706c;
      expv[52] = 191'h66cf79188fd7d71c53169aaa294a2f99f2f1b900dcc70880;
      expv[53] = 191'h7245bb1fa9775caa074d0a8974dd8409b1cf9e988c332826;
      expv[54] = 191'h1c7eec41b96ab98667868d3748c41d38c1bed21cec6bb55c;
      expv[55] = 191'h07cb6af48005399e72f49c94f84de59cd8d2c1af9c36f110;
      expv[56] = 191'h07cb6af48005399e72f49c94f84de59cd8d2c1af9c36f110;
      expv[57] = 191'h07cb6af48005399e72f49c94f84de59cd8d2c1af9c36f110;
      expv[58] = 191'h33ad2cf7e90df293093a0749aad1f2f23a718969c6c1079b;
      expv[59] = 191'h33ad2cf7e90df293093a0749aad1f2f23a718969c6c1079b;
      expv[60] = 191'h33ad2cf7e90df293093a0749aad1f2f23a718969c6c1079b;
      expv[61] = 191'h33ad2cf7e90df293093a0749aad1f2f23a718969c6c1079b;
      expv[62] = 191'h33ad2cf7e90df293093a0749aad1f2f23a718969c6c1079b;
      expv[63] = 191'h50a58e4c8f7f43c12efd5ccee9edb7867e36cb0466244d69;
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
