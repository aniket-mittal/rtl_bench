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

  rtlpp_02867 dut (
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
    stim[0] = 206'h0b9298f0737867e043f9985e3e1027b2950f036685ccb4ef657d;
    stim[1] = 206'h148685734cf4bd5e2c3e4c73075280f4901e4e6554c2cffb1f20;
    stim[2] = 206'h3bfb9869adc7675cb3a67395b3525c996d5a7ae28d84ede838c6;
    stim[3] = 206'h3628977f2dc7437cdc13626bf2389a53245cdb935f885b479d53;
    stim[4] = 206'h28a0758fd548ac6aa55dffc8d0fde2724d8b27777e9f6c09912b;
    stim[5] = 206'h26d77cd18cf65b96032e08a96b1ac489265e161ecfa969f4fe6e;
    stim[6] = 206'h3b5e2cf6537892a8a6f11ffd1152697b64a313a7a0d17696645e;
    stim[7] = 206'h3c840881ddf912a313f823c7326375c1e0d1b7f839d4d67436bb;
    stim[8] = 206'h3fe0439a00a0297cf8cd5c7ec66bf6176dbffb767e1e397fc2b9;
    stim[9] = 206'h3b4055d7a297f2d143647e53cfb8fb6f8ef84d39a42f3fba6b10;
    stim[10] = 206'h34646d94ed02de287776136e143d3d06471bb640011002a608a2;
    stim[11] = 206'h263e6f1e131ebb05d068aa6bfa4224a9db92f65c6ba08233fda9;
    stim[12] = 206'h31d620b99020f3e463c461801fd0948074ed9791fce74ba412f4;
    stim[13] = 206'h22dea4c7c3a6d904a73d44cecf170b0d7315d10a205a80f0fb52;
    stim[14] = 206'h2423ba293cd2f1967245a912354b4960763b500fca199ec12dd1;
    stim[15] = 206'h35833b3fb405fc250d5d134f235290759a3cdd452d37d327bc43;
    stim[16] = 206'h27e01818e247ea4143e0a66f3a34666484a6a29ab3898b126ff2;
    stim[17] = 206'h345a730537749f68551bba748205167fb4111d1e46dc414be15c;
    stim[18] = 206'h38e2d999ebb9512bff39ac3d204e94c47e046808a6b41aee1a11;
    stim[19] = 206'h2197e5aa26aa0a5482e348fdb567893e2156b0608ba067005e46;
    stim[20] = 206'h331f1d89fb951bad33c6563fea5b9d5a460139ee55efa785efab;
    stim[21] = 206'h3c9c9448090d73d94377a892ed6c7493b19f9f111eed132cd4f3;
    stim[22] = 206'h3caa2a336d5fd90af4953c64d1a3eec2ef80209c4168367e5700;
    stim[23] = 206'h2ccec29be11ed431be82f5feacfb2004a9ef2689def11849ab6d;
    stim[24] = 206'h256a5950e9703f3d914aa5b0b84caa867d80392b2f34a1a6f9e5;
    stim[25] = 206'h3a378e5d9dee6d4a042b717b2efe48b6095dc34eb0577e337a1d;
    stim[26] = 206'h35beb2fbbe67be6d4af4a79e197d7151be32490b411e31ce7785;
    stim[27] = 206'h3071ff314c406bb3492c4d65ac432fa8a72cacbf79648079f3bd;
    stim[28] = 206'h2f3d16da085bc6ccd30e1ce8b1f575b8bbd366cad3acb15db146;
    stim[29] = 206'h298b1206c8511e0f07a12519b2559f069ad1f99b459448a869d3;
    stim[30] = 206'h2fea79b65605a79300cd30df1fbc533849a7e43ecb5f364e6069;
    stim[31] = 206'h26b1a695285534718ac814d4e492e7282d3e35ab73bbb65ec23d;
    stim[32] = 206'h35a4fef191eec46fbc2a1e4cfc265dfb35c4cf25a4679f9db142;
    stim[33] = 206'h27e3de97c9f63757fbdec98e17ba042cc8dd559ac8b256469658;
    stim[34] = 206'h1d0e0036ca04b52fc4481f658c04e92b3ec5a88456e8b56ae35b;
    stim[35] = 206'h3a2631961488b2403c6671dcb04a828033ab9b17b48103f728be;
    stim[36] = 206'h2e270a5121dd121ecbd9b9be821496bd20cf2b3097543447805b;
    stim[37] = 206'h2d1d5cb7dbd5d8e6264105a6c628c8a03a8c4009007d6ffcf30c;
    stim[38] = 206'h301971e451a45fdacf51f8d4086831fdcaa7eefd2cefbc8ce0b8;
    stim[39] = 206'h33830189d552475fef261dc1c9af06e825b40bc34e3611998da3;
    stim[40] = 206'h3174b0e761cd84297d95861e952f4d9c8d0c8041913752bdce49;
    stim[41] = 206'h345c6328d63ae2c97fc1522545874803fe4724ee4278371ebeb6;
    stim[42] = 206'h20419d7f1466d92aa2d45bac4bdb264eb32267ea7d0964e92bb1;
    stim[43] = 206'h2e7acaaca3d9719098ee7c1b008948166bd70cb4a43149e125e0;
    stim[44] = 206'h2e0134ba6427161aef090e42f943517cad7aac3c828d4d9eeb93;
    stim[45] = 206'h216a53075b425861ef0f3a1b8a1ad0deb067fc627b4c36ee37a4;
    stim[46] = 206'h2111a09c81547a8d1c52d3d0b324cf0a354d05249c3262495345;
    stim[47] = 206'h293e16b3c513a434d85827785137239051c5772ac6dd17cfa75f;
    stim[48] = 206'h336441e9407053fc53fe22ff32175b14ddc8673d9ee608a8f053;
    stim[49] = 206'h2d4f66eefc4e1c353026a59b2f8e83efd0a6dde2520cbb13ae68;
    stim[50] = 206'h252225892b61f1289e0e7f9e8aed1cd2fb47991278982fc4e1da;
    stim[51] = 206'h35e26e3165c00828640d8674f68f535cd936fe0e63dfb2df5ef8;
    stim[52] = 206'h25fc644f375a893730175cf97c5e49bcd3d94b4182d9b56c7938;
    stim[53] = 206'h380954ea64e331c8ba754f87e4c22f96bb38789dded0e42d3160;
    stim[54] = 206'h309f0f92a10c6a141fda40f0524cc2a74bd26a31cefb85a61839;
    stim[55] = 206'h3373ee7ec900ac4af37fe5010d944a4ef04f8e7e102e24dc4f01;
    stim[56] = 206'h3ad8922d6028d298450345e75eb602f406e335c7d1dcd251436d;
    stim[57] = 206'h2c28b1a29b8baab44aaaaa54b23a37f3ec4e884b01ba6e682a91;
    stim[58] = 206'h35a6a997c0192efe14bc7f166976b5cc3815d20c4f2079719ec5;
    stim[59] = 206'h203051da5721fc58ec2f64813b6ca4fbdaf1356048badcf5a6b4;
    stim[60] = 206'h297534135db60e39e80dd7b998b2ca0a8190a9ba95d0a661b0f5;
    stim[61] = 206'h25687be0ea271aa4fb1a76a011335532f4d63baeca69a63159c1;
    stim[62] = 206'h20956f3c42a2738634063f6d5067f604b715a74ab7f1b8bf1453;
    stim[63] = 206'h317fc885511717d89f760f159cae30be596139a9335b4b93c770;
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
      expv[0] = 153'h1ccb4ef657dae4a63c1f43f9985e3c204f652b2;
      expv[1] = 153'h0c2cffb1f20521a15cd52c3e4c7306a501e9212;
      expv[2] = 153'h184ede838c66fee61a6fb3a67395b6a4b932db2;
      expv[3] = 153'h1885b479d53d8a25dfcbdc13626bf47134a648b;
      expv[4] = 153'h09f6c09912ba281d63f4a55dffc8d1fbc4e49bb;
      expv[5] = 153'h1a969f4fe6e1b5df3463032e08a96e3589124cf;
      expv[6] = 153'h0d17696645e6d78b3d92a6f11ffd12a4d2f6c90;
      expv[7] = 153'h1d4d67436bbf2102207213f823c734c6eb83c1c;
      expv[8] = 153'h01e397fc2b9ff810e681f8cd5c7ec4d7ec2edbb;
      expv[9] = 153'h02f3fba6b106d01575ea43647e53cf71f6df1de;
      expv[10] = 153'h11002a608a25191b653e7776136e107a7a0c8e0;
      expv[11] = 153'h1a08233fda998f9bc783d068aa6bfc844953b6d;
      expv[12] = 153'h0e74ba412f4475882e6363c461801fa12900e8a;
      expv[13] = 153'h05a80f0fb520b7a931f1a73d44cece2e161ae64;
      expv[14] = 153'h0199ec12dd1908ee8a497245a912329692c0ec5;
      expv[15] = 153'h137d327bc43d60cecfec0d5d134f26a520eb342;
      expv[16] = 153'h1898b126ff21f806063a43e0a66f3c68ccc908d;
      expv[17] = 153'h0dc414be15c5169cc14f551bba74840a2cff68f;
      expv[18] = 153'h0b41aee1a11e38b66679ff39ac3d209d2988fc7;
      expv[19] = 153'h1a067005e46065f96a8a82e348fdb2cf127c431;
      expv[20] = 153'h1efa785efabcc7c7627b33c6563fecb73ab48d6;
      expv[21] = 153'h0ed132cd4f3f272512034377a892ead8e92762b;
      expv[22] = 153'h168367e570072a8a8cd9f4953c64d347dd85dec;
      expv[23] = 153'h0f11849ab6db33b0a6fcbe82f5fea9f64009527;
      expv[24] = 153'h134a1a6f9e595a96543f914aa5b0b899550cfb7;
      expv[25] = 153'h0577e337a1de8de39765042b717b2dfc916c124;
      expv[26] = 153'h11e31ce7785d6facbeee4af4a79e1afae2a37c4;
      expv[27] = 153'h1648079f3bdc1c7fcc53492c4d65a8865f514fc;
      expv[28] = 153'h1acb15db1463cf45b686d30e1ce8b3eaeb71765;
      expv[29] = 153'h19448a869d3a62c481b607a12519b4ab3e0d34e;
      expv[30] = 153'h15f364e6069bfa9e6d9700cd30df1f78a67093d;
      expv[31] = 153'h1bbb65ec23d9ac69a54c8ac814d4e125ce505b5;
      expv[32] = 153'h0679f9db1425693fbc64bc2a1e4cf84cbbf66b2;
      expv[33] = 153'h0b2564696581f8f7a5f7fbdec98e1774085990c;
      expv[34] = 153'h0e8b56ae35bf43800db5c4481f658809d2567c3;
      expv[35] = 153'h08103f728be6898c65823c6671dcb095050066a;
      expv[36] = 153'h1543447805bb89c2944acbd9b9be84292d7a41b;
      expv[37] = 153'h07d6ffcf30c347572df0264105a6c4519140744;
      expv[38] = 153'h0efbc8ce0b84065c7917cf51f8d408d063fb95e;
      expv[39] = 153'h03611998da3ce0c06277ef261dc1cb5e0dd04a3;
      expv[40] = 153'h13752bdce49c5d2c39dc7d95861e925e9b391a0;
      expv[41] = 153'h078371ebeb651718ca327fc15225430e9007fd5;
      expv[42] = 153'h10964e92bb1810675fc1a2d45bac4fb64c9d676;
      expv[43] = 153'h03149e125e039eb2ab2998ee7c1b0112902cd7a;
      expv[44] = 153'h08d4d9eeb93b804d2e9eef090e42fa86a2f95bd;
      expv[45] = 153'h14c36ee37a405a94c1d0ef0f3a1b8c35a1bd611;
      expv[46] = 153'h032624953458446827221c52d3d0b6499e146b2;
      expv[47] = 153'h0dd17cfa75fa4f85acf4d8582778526e4720a37;
      expv[48] = 153'h0e608a8f053cd9107a5353fe22ff342eb629bbf;
      expv[49] = 153'h00cbb13ae68353d9bbbc3026a59b2f1d07dfa11;
      expv[50] = 153'h0982fc4e1da1488962499e0e7f9e8dda39a5f68;
      expv[51] = 153'h1dfb2df5ef85789b8c58640d8674f51ea6b9b25;
      expv[52] = 153'h0d9b56c793817f1913c930175cf978bc9379a61;
      expv[53] = 153'h0d0e42d3160602553a99ba754f87e1845f2d76f;
      expv[54] = 153'h0fb85a61839c27c3e4aa1fda40f05499854e97b;
      expv[55] = 153'h02e24dc4f01cdcfb9fb4f37fe5010b28949de1c;
      expv[56] = 153'h1dcd251436deb6248b5a450345e75d6c05e80c0;
      expv[57] = 153'h1ba6e682a91b0a2c68a24aaaaa54b4746fe7d84;
      expv[58] = 153'h12079719ec5d69aa65f614bc7f166aed6b98707;
      expv[59] = 153'h0badcf5a6b400c147694ec2f64813ed949f7b50;
      expv[60] = 153'h1d0a661b0f5a5d4d04d6e80dd7b99965941503e;
      expv[61] = 153'h069a63159c195a1ef83afb1a76a01266aa65e95;
      expv[62] = 153'h1f1b8bf14538255bcf1334063f6d50cfec096e7;
      expv[63] = 153'h15b4b93c77045ff221579f760f15995c617cb35;
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
