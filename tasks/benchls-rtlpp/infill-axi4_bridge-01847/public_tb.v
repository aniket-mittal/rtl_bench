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

  rtlpp_01847 dut (
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
    stim[0] = 222'h133be5e1a91792b29ecefe60e8ef7c4eb07e605e78e635c8d7e0a501;
    stim[1] = 222'h024d026012ca7526dd40ef6c250950946e730a90edc7c6a86a15071c;
    stim[2] = 222'h39f45a74f11117eecc035c9419a26adf72b5f45f28710c864a94d919;
    stim[3] = 222'h25051e4a87c6c3c75f196055c6ce52ba3c3a3ea61d484ac17f25d82b;
    stim[4] = 222'h3fb30966b71e3d5b44dc36d1d10ac96445251244c5e6bb78629c10ea;
    stim[5] = 222'h2bf1ca0e139cd17bbace123a64c3b5981bef113d58c6c2b2a519a12c;
    stim[6] = 222'h06732e628a5b8e3a4de61f14463352d4e581fc6e5e40aaaa4e5e5251;
    stim[7] = 222'h3b25c51b5afdafa8c345001fbb08c1eb984ba772489ac09b18d20723;
    stim[8] = 222'h2a822caf0e7cc9846d63a0836f99dfc6103854098e70be8ff289d422;
    stim[9] = 222'h23feee52dec7c51342e2f0f582e869f4dede68db3e4353bb7f8cdf20;
    stim[10] = 222'h2b1bca5eb99d6a3f82a7d1a71b8f7781f38b91b901d45ad80208266f;
    stim[11] = 222'h24ad72395e358955e62f1f0e5d7f8cc6077866d282d5ac7a1d495d32;
    stim[12] = 222'h340c11cd039c386b4b871e3ae259ad1fac24a60e5bfe84b372cfb063;
    stim[13] = 222'h3db97eef303c7793a85819840b4a5a263622248a451edce44264f154;
    stim[14] = 222'h3f5902363471b1f3e7cd85578255bd32ac555ede1e0ea01d1418d6eb;
    stim[15] = 222'h2448bbc37a43524401e7ed64e4bb65bf7d49a0fdd2f14b1ac113dd81;
    stim[16] = 222'h3c5fffd21439f697a5f662a80db634beaa0eda0b457e17d22e66274f;
    stim[17] = 222'h3021cbb1bcc38d4bc77afc46ca4687bb117afd6462a18cd767d58aa5;
    stim[18] = 222'h2d8f93167f8b588f503421d0db02431cab6e6691330246923799c182;
    stim[19] = 222'h3b0550db055ef6ff32730c91b5061f4ec16bdafcc9a637418c268f2d;
    stim[20] = 222'h3348ed31c443f9d9fccf7fefff73bd8ac17b0b1a95da1ed41588a688;
    stim[21] = 222'h283581a192f69ef9c06faa15a4ff44ad729e4f007b79995cfd5f35d1;
    stim[22] = 222'h3b840ed447572c65ba0f97605a7254a9e08ba2a3faf96c5e7c52ae9e;
    stim[23] = 222'h22039108fae5e37d85066c61ada69dd487a2d63547088dcff96eaedb;
    stim[24] = 222'h23c7c30f10247c9155ab749126a94f66995b882063cb613de0035c39;
    stim[25] = 222'h2a76f4c94ff196bda237add34946e038bc160830e0d85d67c33166fb;
    stim[26] = 222'h3f469501c5e9d15a3cd3aef03b86a076ce379a77514f0a6415a5b949;
    stim[27] = 222'h3113783ad0dedbfc8a0c7a2d1d7c5a54ebcdb2c36cfa959055dc4018;
    stim[28] = 222'h2466d396d930623975c3870df62ca31bbf4ae9e00163f5ad0b6d724a;
    stim[29] = 222'h2ced9ee1e1e979c800d5139471eaa5a18f7fcab84cf7fb89461ac024;
    stim[30] = 222'h3711e20b867895ea2329603add4329d222d7b55c0d065c8b1f35faa3;
    stim[31] = 222'h37861f8aecdd17d5c04e0e3440ca28dd377b303a2b45c21dabf14c1e;
    stim[32] = 222'h2e05362a006dc05724ed5e4be564d2a8d58cba4792291fc29d08e66d;
    stim[33] = 222'h39d078d37f464a3e9899e8f5bacb7f6ef3d7fe31ed2ab21a2b343197;
    stim[34] = 222'h3bd310458d85c07583776edc9109d7b066828ef27d66cc2283bb3c11;
    stim[35] = 222'h3f652af2b167111f3fd365fab26d1fe85ce4697e503c1565cd437eab;
    stim[36] = 222'h313570f4b14ae8d29732904a58e4b8358e6c8092172704c2ac51f888;
    stim[37] = 222'h23877fba2d2e5a1293a25793a39a15ad4c6dcd2d984ddfd028a4d0e3;
    stim[38] = 222'h33cbbdc1004d731c019b785656fcee78a258a3c7b5a6da84b1218ac9;
    stim[39] = 222'h30d4a54659b1ca21e908376e6ad18672df49aa63a153f8064aa03908;
    stim[40] = 222'h31b961164002841716f52d813fe78f5200b09ef034363300c3407841;
    stim[41] = 222'h25ac735f37a9f0d0c282671f5388cae3c4b547bcb894c0d59469b0a6;
    stim[42] = 222'h2dc2b439dd1b445fcc4950c12db84eefef8db3b11fb460d7ad485f0b;
    stim[43] = 222'h284b94c80f450a56cd64688d2f6ca7d3014c5265ffda2126398cc55d;
    stim[44] = 222'h25b26a91ee68686a8067c502954fca0f42931843888c6079a48568c8;
    stim[45] = 222'h32d18c190c425ce5b402e7dc503964664a45e61db57d28ce575909ce;
    stim[46] = 222'h2e296878a18869410879aeadf62efe703f4c87b0dfbf7628109a5942;
    stim[47] = 222'h3fb0959e77dfbf99c99c83785df0f7175098d843055fb09b2430b6d6;
    stim[48] = 222'h36d3486cd3e18703c206e2e63c44f4eeeeb68f0111f22dd8cd3ae88e;
    stim[49] = 222'h3af06e7a7489c5bad2efd42b4868d42702847d57a17db7f2e961cb2b;
    stim[50] = 222'h30a5007d2618fb48789c062186e14729c31af4d33c1e04c872609352;
    stim[51] = 222'h2c861a447d1b6785ec811188051af7b17bf9a91d66ba2f355a38c9b9;
    stim[52] = 222'h2345aa432cf1fa2296374b69bbd1d355fd645b3563df2c822c80f76a;
    stim[53] = 222'h39201ca907d0d954c9f31a8283aaba8d74e7b023acac14101ab1c88b;
    stim[54] = 222'h0990aa8653e25dc8ef5cb78bcaa6f727e78edfbd279b251613f8b3d7;
    stim[55] = 222'h2f62263887e7239045373c59254f599a7dd4c17ca60cdbc0370c154e;
    stim[56] = 222'h3aad660d24446380c2b3802134dc4872148795a35657c16c2d0a5957;
    stim[57] = 222'h3d6cfdfc556cac42d90a003c934a08fe85b9b9563c3d24a1beac5133;
    stim[58] = 222'h39ff5933c1e596f754cf46d7c9fc4e728ebb1d3750e16bc14ce8f422;
    stim[59] = 222'h3e41ddd29a1e7420155ca4f578ca962f997270a1ad70f9daffce2011;
    stim[60] = 222'h3ca39979ecbd12a50f92cc1a6d21f50c1f41e11b80fbe20e2a50ac17;
    stim[61] = 222'h2027bd4b133aad1ca85103d1d37bc1adc6cf684a8fe5220b94e5e985;
    stim[62] = 222'h3971cd6d12261e81788092d43496f687acb3c133b5b6c03ca90a30a3;
    stim[63] = 222'h337ef1ec4a5c7faae38bd3d260009345b7e59399c9c378ffb6f286ed;
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
      expv[3] = 169'h1864a94d919e7d169d3c46035c9419a4d5bee56be9a;
      expv[4] = 169'h0164a94d9191414792a1f7196055c6cca57478747c5;
      expv[5] = 169'h1964a94d9197ecc259adc3dc36d1d10d92c88a4a251;
      expv[6] = 169'h0164a94d9192fc728384e3ce123a64c76b3037de221;
      expv[7] = 169'h0000000000000000000000000000000000000000000;
      expv[8] = 169'h100000000006c97146d6b845001fbb0983d730974ec;
      expv[9] = 169'h007f289d423aa08b2bc39c63a0836f9bbf8c2070a9b;
      expv[10] = 169'h107f289d4230ffbb94b7b3e2f0f582e8d3e9bdbcd01;
      expv[11] = 169'h087f289d4232c6f297ae67a7d1a71b8eef03e717229;
      expv[12] = 169'h1121d495d3392b5c8e578d2f1f0e5d7f198c0ef0cca;
      expv[13] = 169'h0121d495d33d03047340e3871e3ae25b5a3f58494de;
      expv[14] = 169'h1921d495d33f6e5fbbcc0b5819840b4cb44c6c4448e;
      expv[15] = 169'h0121d495d33fd6408d8d1bcd855782537a6558aabc4;
      expv[16] = 169'h1921d495d331122ef0de94e7ed64e4becb7efa93419;
      expv[17] = 169'h0122e66274ff17fff4850ff662a80db4697d541db5f;
      expv[18] = 169'h1922e66274fc0872ec6f337afc46ca450f7622f5fb2;
      expv[19] = 169'h0122e66274f363e4c59fe73421d0db04863956dccc3;
      expv[20] = 169'h1918c268f2dec15436c157730c91b5043e9d82d7b53;
      expv[21] = 169'h0118c268f2d4d23b4c7111cf7fefff777b1582f616f;
      expv[22] = 169'h1918c268f2d20d606864b96faa15a4fe895ae53c9fc;
      expv[23] = 169'h0167c52ae9fee103b511d50f97605a74a953c11745e;
      expv[24] = 169'h1967c52ae9f880e4423ebd066c61ada53ba90f45ac6;
      expv[25] = 169'h0167c52ae9f8f1f0c3c409ab749126aa9ecd32b7104;
      expv[26] = 169'h1967c52ae9fa9dbd3253fd37add34945c071782c10e;
      expv[27] = 169'h0167c52ae9f7d1a540717ad3aef03b8540ed9c6f345;
      expv[28] = 169'h11055dc4019c44de0eb4340c7a2d1d78b4a9d79b65e;
      expv[29] = 169'h01055dc4019919b4e5b649c3870df62946377e95d32;
      expv[30] = 169'h19055dc401933b67b87878d5139471ed4b431eff959;
      expv[31] = 169'h0131f35faa3dc47882e19a29603add4653a445af6a2;
      expv[32] = 169'h1931f35faa35e187e2bb354e0e3440cc51ba6ef6601;
      expv[33] = 169'h0129d08e66db814d8a801fed5e4be561a551ab19757;
      expv[34] = 169'h1929d08e66d6741e34dfd699e8f5bacefedde7affd5;
      expv[35] = 169'h01283bb3c11ef4c4116365776edc910baf60cd051d2;
      expv[36] = 169'h11283bb3c11fd94abcac5fd365fab26a3fd0b9c8d3e;
      expv[37] = 169'h01283bb3c11c4d5c3d2c5232904a58e1706b1cd9012;
      expv[38] = 169'h19283bb3c110e1dfee8b4aa25793a39c2b5a98db9a7;
      expv[39] = 169'h01283bb3c114f2ef7040149b785656f9dcf144b1471;
      expv[40] = 169'h11283bb3c114352951966908376e6ad30ce5be93548;
      expv[41] = 169'h09283bb3c1146e58459007f52d813fe71ea401613d9;
      expv[42] = 169'h11283bb3c1116b1cd7cde882671f538995c7896a8e8;
      expv[43] = 169'h01283bb3c11370ad0e77474950c12db89ddfdf1b678;
      expv[44] = 169'h11283bb3c11212e53203d664688d2f694fa60298a4c;
      expv[45] = 169'h09283bb3c1116c9aa47b9a67c502954f941e8526304;
      expv[46] = 169'h11283bb3c114b46306431502e7dc503ac8cc948bcdc;
      expv[47] = 169'h090109a5943b8a5a1e286179aeadf62dfce07e990ff;
      expv[48] = 169'h110109a5943fec25679df19c83785df1ee2ea131b0c;
      expv[49] = 169'h010109a5943db4d21b34fb06e2e63c41e9dddd6d1fa;
      expv[50] = 169'h110109a59436bc1b9e9d22efd42b4869a84e0508fbf;
      expv[51] = 169'h01072609353c29401f49809c062186e28e538635e8e;
      expv[52] = 169'h1907260935332186911f45811188051def62f7f353f;
      expv[53] = 169'h0122c80f76b8d16a90cb3a374b69bbd3a6abfac8b6e;
      expv[54] = 169'h1922c80f76be48072a41f4f31a8283ad751ae9cf616;
      expv[55] = 169'h0000000000000000000000000000000000000000000;
      expv[56] = 169'h180000000003d8898e21f8373c59254eb334fba9825;
      expv[57] = 169'h010000000006ab59834910b3802134d890e4290f2a8;
      expv[58] = 169'h191beac5133f5b3f7f155a0a003c934c11fd0b7373e;
      expv[59] = 169'h011beac513367fd64cf07fcf46d7c9f89ce51d763b1;
      expv[60] = 169'h191beac51337907774a6805ca4f578cd2c5f32e4e18;
      expv[61] = 169'h011beac5133728e65e7b2d92cc1a6d23ea183e83c3d;
      expv[62] = 169'h191beac5133009ef52c4cc5103d1d37f835b8d9ed11;
      expv[63] = 169'h011beac513365c735b44898092d43495ed0f5967838;
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
