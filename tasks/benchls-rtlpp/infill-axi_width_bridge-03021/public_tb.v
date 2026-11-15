// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 270;
  localparam OW = 217;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03021 dut (
    .aclk(clk),
    .aresetn(in_vec[269:269]),
    .s_axi_awaddr(in_vec[268:205]),
    .s_axi_awlen(in_vec[204:197]),
    .s_axi_awsize(in_vec[196:194]),
    .s_axi_awburst(in_vec[193:192]),
    .s_axi_awlock(in_vec[191:191]),
    .s_axi_awcache(in_vec[190:187]),
    .s_axi_awprot(in_vec[186:184]),
    .s_axi_awregion(in_vec[183:180]),
    .s_axi_awqos(in_vec[179:176]),
    .s_axi_awvalid(in_vec[175:175]),
    .s_axi_wdata(in_vec[174:143]),
    .s_axi_wstrb(in_vec[142:139]),
    .s_axi_wlast(in_vec[138:138]),
    .s_axi_wvalid(in_vec[137:137]),
    .s_axi_bready(in_vec[136:136]),
    .s_axi_araddr(in_vec[135:72]),
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
    .s_axi_awready(out_vec[216:216]),
    .s_axi_wready(out_vec[215:215]),
    .s_axi_bresp(out_vec[214:213]),
    .s_axi_bvalid(out_vec[212:212]),
    .s_axi_arready(out_vec[211:211]),
    .s_axi_rdata(out_vec[210:179]),
    .s_axi_rresp(out_vec[178:177]),
    .s_axi_rlast(out_vec[176:176]),
    .s_axi_rvalid(out_vec[175:175]),
    .m_axi_awaddr(out_vec[174:111]),
    .m_axi_awprot(out_vec[110:108]),
    .m_axi_awvalid(out_vec[107:107]),
    .m_axi_wdata(out_vec[106:75]),
    .m_axi_wstrb(out_vec[74:71]),
    .m_axi_wvalid(out_vec[70:70]),
    .m_axi_bready(out_vec[69:69]),
    .m_axi_araddr(out_vec[68:5]),
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
    stim[0] = 270'h03f3678a54c449dc204fe27f5046f649ed6f6234583df660918c5d0567896198ee6b;
    stim[1] = 270'h0ec6715f1beb7221470ae0fbdce67b625e85e2e6f07274a97845d046188309f74a3d;
    stim[2] = 270'h38a156be41aa785de7285b81b8b19200a36ffa37fe6bc00a33bd74a9d93abf4b8a16;
    stim[3] = 270'h20bcb0622f8dea33dcd8420e299d3dc19a2cc44431eee5e8396885bd72d4900f9d0d;
    stim[4] = 270'h22d67d41377af03d6e1254e9a0330e118487095289c02f2eb4307f60cda1c847b5f3;
    stim[5] = 270'h2025c01abe247ce135aa472aaeb86fffdec07772d6c485d7b19750782ef54c8e4e15;
    stim[6] = 270'h3f6742e8f4fe3b4531314602f02691f6bb5670654988df19422783c129e47fc96caf;
    stim[7] = 270'h2d215a806b07d121729e17e0d4c972fed6f43c2604bdf184dc43bf8633c6accb85e5;
    stim[8] = 270'h3071d7956b8efeac7b9a8f4979a80119ceb63f0b90621dc5407f97c96f4a06255771;
    stim[9] = 270'h2d58a1df9d9d492782796036ea610f011ae1e617a59d56034358f620a800971c7198;
    stim[10] = 270'h225685b55c16959c2cb0931728c96fd0a30787aa54fd683c99ef69e4b9e1c573de9c;
    stim[11] = 270'h2644899827950d2ebcf2f4b3726463f92d1d5ade978489f0c8cf146d24a060fdb8b1;
    stim[12] = 270'h25836f0f84ba98739dddea3ab9c1f8d7e1ac65d308cf21448f217be266028416d137;
    stim[13] = 270'h2ba015758dcb74add22b43424720d28c57057bdfd9f6e6d59fba24f14824c057d653;
    stim[14] = 270'h3ed0810074914a68488257e97eefd81a9c1f87e7f92d5728faca8162c1184d4f8adb;
    stim[15] = 270'h25a55f329856ce995a6657c2051d988668bd545e2d2c568b755c6f0b46e45946aed4;
    stim[16] = 270'h298f69c8883e3e9001287e35cd867ce7aeb1b50c0e428fb07dcf166cd3bce97929f1;
    stim[17] = 270'h3f048e7b8fa4a342c90a5fd621fbcbf0ffd918a72e48e65d4212a4ef5d22251bcb18;
    stim[18] = 270'h2db2a2de1401a77a96e94b00eb09caa63be78e84be26e34ab88d7de9348e716cd5e7;
    stim[19] = 270'h29c4ac1badaa93745773090df5f9c3fc6c3f758d7da336fa371c11fdda311d27ab49;
    stim[20] = 270'h3aed6a807c619c31748bb7fb4e6cc95a30e493042d85d2aab79393ad5114b84a6158;
    stim[21] = 270'h3421368d29ce51e3ae225d16ae03c1dffb4d73e36813a18516e075fc876ed503da0e;
    stim[22] = 270'h31888a3d3907ad7829822ed8c57b5825ab31758c7b0815a3ab546f98cc87a73c22ad;
    stim[23] = 270'h3dedaa93f274e30d7d9e5110e174fe18123d6b9634b63feb87313a61a771e9ae4b68;
    stim[24] = 270'h2654e7ad061f5719a19145c2891aed1207bf5b8f8e9574136d6cad41cd155a2f87ac;
    stim[25] = 270'h2ca707823232dcb51ac388b21ecbbff06e19f7314dd0060dc7613d54dbc19c3c1a62;
    stim[26] = 270'h2fb474fd3a25830c6a48c26c9573c08d2a4f7f3787c19a782cfef9e82c58d34fe7dc;
    stim[27] = 270'h3f9d5e932af00873482348e0f2912feba5e23ebf2ccc71f30ce9e2520c2514ae8bda;
    stim[28] = 270'h319d1fd99683df2b72cce1605cbce61a7a297ab150d6ac50b0a0c4c6bb2616755d45;
    stim[29] = 270'h3a41fa345e6bc18e85b730d6d1a8dceaabfa65c70243f8eee632c4a355dd5a5aa11e;
    stim[30] = 270'h3e717c904504c69ff18d1e510d909e43793be30d9907f606bd9f287313de573487c9;
    stim[31] = 270'h2981f9664e9690a9027b330ae77d1084d2838811deb630831a507ba0228df7e316aa;
    stim[32] = 270'h24c879560a75075ffbe1a158776d8c8ccb34c36dca479ccf929a7417e2dae54b9631;
    stim[33] = 270'h33bed337e2dd9a25ad0c44e43d93ceaf749ecbb2094e8432e10a16150ebfaffd80c9;
    stim[34] = 270'h37a4f9ed2b0690d2a2c180e956258024006a700d3a9708880f3c12c4203e88c1abbd;
    stim[35] = 270'h3b3c421acbb881e411584081ca011ae5321dcbdc34a8623f29caa3f2f9e5efc84d2d;
    stim[36] = 270'h2d1a96dedce9b5729498c2d12715a74694a75d64d39f7d155bf103f8d9eefae500ee;
    stim[37] = 270'h3dd7c6bce378e0e5bc074618d8677fb6603ed3be09157ed2b68636b65ce48d44ee8e;
    stim[38] = 270'h239ce7517173af45cdfd142d4698420cf3beee7c6760c57db7ddd905681454754ad8;
    stim[39] = 270'h3f16209278482926e57aa98368c928857bc4b48fbc4f6e60c2ea0dffc968e06b4205;
    stim[40] = 270'h3eaf86aad5fc61cc34212eaa16da20e6ce8adc3d444483ce262cfbf16d13dd8295e0;
    stim[41] = 270'h31e249b119c8b5eef37b43d0b4a2d652a91b196091f09d554779c19193c5b95ee5dd;
    stim[42] = 270'h2c207e37d2335e4fcfc171d7e639d40d8d50f0394ab8996a6b3562009b3bafb206a7;
    stim[43] = 270'h39a0a9c5c702f7cdb3077beda3e1a50a56116e5011b17cb0f394224886305a98be8a;
    stim[44] = 270'h30e421dba8b8b5139a80dc06f68669e047a0bb03cb3f429a3eeed2c5b558e2a14cf0;
    stim[45] = 270'h253fe26fee185b7be60ad7d60ae26fd6414b1a88feae8cdaabf9320e6dba6a863fc2;
    stim[46] = 270'h355ffea7c4fce53a8e3f3523b9234aa21341d549b456342b07e0e2391f838ad34d63;
    stim[47] = 270'h3959cc99529eef1cee267b5ece39d11f9e6f101ca5adb08d63922ba9ed7f378eb4a4;
    stim[48] = 270'h2f2ca6ee3e9c5d02afc1ca1794e7e53daca53b16fd9bf677527fa8c184498f87a3b1;
    stim[49] = 270'h3794678d88ad468959e9c452c82827887c646ac358a7d0c71658526371524a52b142;
    stim[50] = 270'h282f2528c493deb76caf10926cb4a7f037317da91a6190cb9181c91887990494d4fd;
    stim[51] = 270'h3f2d04da67603d69659156ce9720c0d3b8c869d4dca8128aebb12d536237ef10edc5;
    stim[52] = 270'h315665b3cd175c1505ebddf02101962ce4a3cd3be1b1fd331f06ea7cec8eab74df54;
    stim[53] = 270'h3beec0cf119de698cc58efe6c3adc789c8346be7d32952cf5841de33f3cf9d269e0d;
    stim[54] = 270'h39b0ba8c04f129f5274d07d18949b4f6b3fe87df977f2907699faa2a9599833d1e88;
    stim[55] = 270'h2894c521f0fc2fbdeffbadc695157bbd2b283f29ba3cc290a4f2aaa7a4e155572cd5;
    stim[56] = 270'h311dfbd9ce2fd6ae3af14fc678c63666306ac37560e6466dd918c72bbd13198031ae;
    stim[57] = 270'h30459655b2b2d4d59059f36beb1cc7a47d840529e761ec0dd28a5249c7df9741cac3;
    stim[58] = 270'h3dcf2e28eb6dac8d7efbe71ac75625036111ffbf15f783a78dfe6b854ccdf51f85f0;
    stim[59] = 270'h2f778d981901b27345acdcfb90194f1f253d74359367a23456506294df44584e0ccb;
    stim[60] = 270'h398bfa468386e8d7a824b7663cc9c2bc2128fb7b145608077e90b3a5745874024405;
    stim[61] = 270'h31693c8c81a5308394e8b928dab6562896c72be08b8c42cc25943782947fe6aa8456;
    stim[62] = 270'h35746eccabfed19625b13bb9a0d185fcfa2ba98ed08f2ee39bde1bd28de7c408b421;
    stim[63] = 270'h3688c7ae19fd4027d98b1db7f7d8a290f395c2a9ba6de604e3296dcef4e2bf4a5370;
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
      expv[0] = 217'h0000000000000000000000000000000000000200000000000000001;
      expv[1] = 217'h0000000000000000000000000000000000000200000000000000001;
      expv[2] = 217'h0000000000000000000000000000000000000200000000000000001;
      expv[3] = 217'h1b00000000062855af906a9e177bb8b19200a600000000000000001;
      expv[4] = 217'h034900f9d0de2855af906a9e177b38b19200a200000000000000001;
      expv[5] = 217'h13c900f9d0d8b59f504ddebc0f5cb8b19200a30e12a513805e5d693;
      expv[6] = 217'h0b4900f9d0d0b59f504ddebc0f5c2eb86fffdf0e12a513805e5d691;
      expv[7] = 217'h1247fc96caffd9d0ba3d3f8ed14eaeb86fffdb0e12a513805e5d691;
      expv[8] = 217'h0a47fc96caf7d9d0ba3d3f8ed14e54c972fed70e12a513805e5d691;
      expv[9] = 217'h02a06255771fd9d0ba3d3f8ed14e54c972fed36c7e1720c43b8a807;
      expv[10] = 217'h1a206255771b562877e7675249e0ea610f011f6c7e1720c43b8a805;
      expv[11] = 217'h02206255771b562877e7675249e06a610f011b6c7e1720c43b8a805;
      expv[12] = 217'h02a06255771b562877e7675249e06a610f011a3ab5bd2f0913e1917;
      expv[13] = 217'h12206255771160dbc3e12ea61ce2ea610f011a3ab5bd2f0913e1915;
      expv[14] = 217'h0a4c057d653960dbc3e12ea61ce24720d28c563ab5bd2f0913e1915;
      expv[15] = 217'h014c057d653960dbc3e12ea61ce24720d28c523ab5bd2f0913e1915;
      expv[16] = 217'h01cc057d653160dbc3e12ea61ce24720d28c537aa8bc5a58ad16ea7;
      expv[17] = 217'h194e97929f1a63da72220f8fa406cd867ce7af7aa8bc5a58ad16ea5;
      expv[18] = 217'h00ce97929f1a63da72220f8fa4064d867ce7abb2314e5c91ccba857;
      expv[19] = 217'h184e97929f1b6ca8b7850069dea3eb09caa63fb2314e5c91ccba855;
      expv[20] = 217'h034e97929f136ca8b7850069dea36b09caa63bb2314e5c91ccba855;
      expv[21] = 217'h034e97929f136ca8b7850069dea36b09caa63bb2314e5c91ccba855;
      expv[22] = 217'h1ace97929f15084da34a739478edae03c1dffe9ae7c6d027430a2df;
      expv[23] = 217'h027a73c22add084da34a739478ed2e03c1dffa9ae7c6d027430a2dd;
      expv[24] = 217'h1ffa73c22ad77b6aa4fc9d38c359e174fe18167ad72c696c7fd70f3;
      expv[25] = 217'h067a73c22ad77b6aa4fc9d38c3596174fe18127ad72c696c7fd70f1;
      expv[26] = 217'h0e7a73c22ad77b6aa4fc9d38c3591ecbbff06e7ad72c696c7fd70f1;
      expv[27] = 217'h15fa73c22ad3ed1d3f4e8960c31a9ecbbff06a9efe6f0f8334f0597;
      expv[28] = 217'h047a73c22ad3ed1d3f4e8960c31a1ecbbff06a9efe6f0f8334f0595;
      expv[29] = 217'h0c616755d45bed1d3f4e8960c31a5cbce61a7e9efe6f0f8334f0595;
      expv[30] = 217'h15e16755d45e907e8d179af063a0dcbce61a7bf4cb8e0487f1ddcd3;
      expv[31] = 217'h04616755d456907e8d179af063a05cbce61a7bf4cb8e0487f1ddcd1;
      expv[32] = 217'h1c616755d452607e5993a5a42a43e77d1084d7f4cb8e0487f1ddcd1;
      expv[33] = 217'h052e54b9631a607e5993a5a42a43677d1084d3f4cb8e0487f1ddcd1;
      expv[34] = 217'h05ae54b96312607e5993a5a42a43677d1084d33d9764129d0865c2b;
      expv[35] = 217'h05688c1abbda607e5993a5a42a43677d1084d33d9764129d0865c29;
      expv[36] = 217'h1d688c1abbdecf1086b2ee207900ca011ae5373d9764129d0865c29;
      expv[37] = 217'h05688c1abbdecf1086b2ee2079004a011ae5333d9764129d0865c29;
      expv[38] = 217'h15e88c1abbdf75f1af38de38396eca011ae5327da77c122afda56db;
      expv[39] = 217'h0c688c1abbdf75f1af38de38396e4698420cf67da77c122afda56d9;
      expv[40] = 217'h04688c1abbdf75f1af38de38396e4698420cf27da77c122afda56d9;
      expv[41] = 217'h09e88c1abbdf75f1af38de38396e16da20e6cf15b87a8889079c4db;
      expv[42] = 217'h10688c1abbd478926c46722d7bbb96da20e6cb15b87a8889079c4d9;
      expv[43] = 217'h033afb206a7c78926c46722d7bbb16da20e6cb15b87a8889079c4d9;
      expv[44] = 217'h1bbafb206a76682a7171c0bdf36ba3e1a50a5622dca02362f961e67;
      expv[45] = 217'h023afb206a76682a7171c0bdf36b23e1a50a5222dca02362f961e65;
      expv[46] = 217'h03bafb206a76682a7171c0bdf36b23e1a50a52963511fd5d19b5567;
      expv[47] = 217'h1a38ad34d63d57ffa9f13f394ea5b9234aa216963511fd5d19b5565;
      expv[48] = 217'h07b8ad34d63d57ffa9f13f394ea539234aa212de20394b5b611ac77;
      expv[49] = 217'h1738ad34d63bcb29bb8fa71740aab9234aa212de20394b5b611ac75;
      expv[50] = 217'h0738ad34d63bcb29bb8fa71740aa39234aa212de20394b5b611ac75;
      expv[51] = 217'h0eb8ad34d633cb29bb8fa71740aa6cb4a7f03662fb5234c3219722f;
      expv[52] = 217'h137ef10edc5fcb413699d80f5a5eecb4a7f03262fb5234c3219722d;
      expv[53] = 217'h03fef10edc5fcb413699d80f5a5e6cb4a7f033479a77c363fa663ff;
      expv[54] = 217'h137ef10edc56fbb033c46779a637ecb4a7f033479a77c363fa663fd;
      expv[55] = 217'h0afef10edc56fbb033c46779a6370949b4f6b7fd0fbf2efe520ed37;
      expv[56] = 217'h12155572cd5a2531487c3f0bef7d8949b4f6b3fd0fbf2efe520ed35;
      expv[57] = 217'h01955572cd5a2531487c3f0bef7d0949b4f6b2d586eac1cc8cdbb37;
      expv[58] = 217'h10155572cd541165956cacb535638949b4f6b2d586eac1cc8cdbb35;
      expv[59] = 217'h00955572cd541165956cacb535630949b4f6b223ff7e2bef074f1a3;
      expv[60] = 217'h104584e0ccbbdde36606406c9cd48949b4f6b223ff7e2bef074f1a1;
      expv[61] = 217'h05c584e0ccbbdde36606406c9cd40949b4f6b251f6f628ac100efd3;
      expv[62] = 217'h1d4584e0ccbc5a4f2320694c20e1dab656289651f6f628ac100efd1;
      expv[63] = 217'h05c584e0ccbc5a4f2320694c20e15ab656289257531da11e5dc736b;
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
