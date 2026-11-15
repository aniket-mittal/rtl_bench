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

  rtlpp_03003 dut (
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
    stim[0] = 270'h0249c54a9fe04cc4f9e71419fd4f5d1835c20308f383728f700b4f4b519a69fa06a6;
    stim[1] = 270'h0a0b51f146a1fd8668cad67acd3595e2524c15e2b19089c08f51956fb2affa4b5813;
    stim[2] = 270'h2fc8a4830da27937448fc9e8e92f54613b663ec4f7c7d6b791bdfa9e9cc8e5c71db5;
    stim[3] = 270'h28c491802949a702d691c5cc5a561ccfb08a2c3a4e028930516cf05a7757a09c475d;
    stim[4] = 270'h2825551210663815ace47792517246b50f0fa81a6456f6e91ff4b31ff71564eaf3c7;
    stim[5] = 270'h21ef1bc343cd7b79d8dc9cb05b24fa997ab6c16f6afdf19cd95c29b9009ebfce6503;
    stim[6] = 270'h3e9400a3094bc76736c0113614a949a267c3d3db2b5a6af25d200eff0337c781aa98;
    stim[7] = 270'h353810d346552ffbf4fb874d7a3ce0e453e8f4c252ef0e9fe228f7df0ad66dbbd406;
    stim[8] = 270'h29343ea9a3a3fc63a0510451e970332eb561f2846043384687e7c98ab8435e4cf739;
    stim[9] = 270'h22a9460f2054a7fa7733396faf4851ced1d6c24cd072ec48f763bd157a44ede402e0;
    stim[10] = 270'h2448a22ce7265b410a285dc69780cc5af9fa0ba7a101283838acf26c8cee8d9dbf0c;
    stim[11] = 270'h2a41063328f6eb214bffbe1c28c0033de524d739a97e122fd4b4634ddb917a66f05e;
    stim[12] = 270'h3f2025fa432c80df5a0c8f55cabe3105d3d4d152e1ba998777e6db82b6acb2491e28;
    stim[13] = 270'h3ecd158f63d6671d2f3b6576b3e70754e79e7cc65ab9872fbc1b9563f0253e0487f3;
    stim[14] = 270'h2a63c7375e09c15b833f43fdd35d984513f77dfbae0921d1b0e60f904fe4db2e4367;
    stim[15] = 270'h2951325f02fe8ac7b185f7975237d8f0512cebaac9a00a40b6f1e7d77aaf7e70ef96;
    stim[16] = 270'h2a2f59ace3c6199b02efbe81b0c321e267845ee6e2b4f0d5bff5b16583500eceb4b9;
    stim[17] = 270'h2b1f43100aa782dd9f3a645195a5939e3d9532f34a90fae925e0fef65dc363178b3d;
    stim[18] = 270'h31d51cb625ae5254590113d2fcaafe507e7eb694f444d1ab6501e373a2ae11d07091;
    stim[19] = 270'h38c10ca017a33a9ec69b72ab7fac55246f5364b4bfca74fd9c0f60ca9534cf5116a0;
    stim[20] = 270'h3aa60426c6cc7bc943be907c690e0742feb6ec63ca013eaed3a668d7582f6e2612bf;
    stim[21] = 270'h3f1262811156ac8db5440c5a5156576ca7be1939d628cb616a6d91615452e7d404a5;
    stim[22] = 270'h245cbf38cf1195c3ded0a79222f6ed4af33e3ee6654b9f104356d245191b5517ae2e;
    stim[23] = 270'h394caf6609f4d11073b21ce009694d18964fa9037cbd1742ff1d459f1f25a54a5046;
    stim[24] = 270'h3444c6768964679f0209dbe838427475281c7fec309ed0e376e5381339a2bdfa1f4e;
    stim[25] = 270'h263d007e1e4fdb5b38950cfc75901ce35e04f304d76619cbb565f05eef0f9e785644;
    stim[26] = 270'h3a5680902298110aa4de4e66a24c6bc5c5497a77d37326768ac20e0346cbc40611c9;
    stim[27] = 270'h224273b6353ccdb28f944f36bb704c1664fccbec1e40d6a561bd0a23be47032f6447;
    stim[28] = 270'h319cb4e160398ecb6e17d86071bbcd6a0f2f5644cecc5de3fd72b389af1aaa5510b9;
    stim[29] = 270'h305d85267a27b56a252ab006e2ba402d05f4d149e12002dd6f9934dbe746164d49e4;
    stim[30] = 270'h3a12017ff334c245b1dff52057828e5e1ba3c7c11a16678548ca73fb5b10e526c6c3;
    stim[31] = 270'h254333c4502944d8855b67483984696e5ba91ac3a0ecdbea706c5ed4f8bdea930f97;
    stim[32] = 270'h3a3b52d3fdef56a8baebf590a8b36630f7cb956ee93bf6bee57850f9d1911795c2a7;
    stim[33] = 270'h2750e6d6750d079ff7819ad83b837629bce90eaf20acde078dd4210509b4aae64bfe;
    stim[34] = 270'h322d6b942e3834743e78aeaf5e863548b80f64c7cd83f9fd616b473e9683359bf1fa;
    stim[35] = 270'h28a16cc71d984be8ae49e59e9e4d34bdf89f690b0b2d2aa01793a057fa90d00b6c51;
    stim[36] = 270'h314b16eef11326e6531572f70cc401cab894b865384213efd202b12bb49f7abfd749;
    stim[37] = 270'h2f17842702e95214aa81063ed4d2fe40888534c1ea654fb9ea29742d316fd0335e46;
    stim[38] = 270'h32df347433d95bb3d2810a63335d80824c3441dd58f882e7539aff30c9a4cdfd2c04;
    stim[39] = 270'h20583a510ee0f98f4cb1add62568eb353cb3cb4cdf7f06663635aaaa79c077e0e88f;
    stim[40] = 270'h2b07e1be5a04800308e742cc10339464a59e97bbd1b9e08ab2c3605c982bcb184f90;
    stim[41] = 270'h2b8a8d3049f5070ad020cddb573b52f5cd97b104f4db78a8034cfdc4cfc887716869;
    stim[42] = 270'h31473a2959bcf1d2abad1601a158053a015ad4a8c3f5e36c78c62fcaf81d07c573cf;
    stim[43] = 270'h3ca13a575a45c33a674e775e582c5623ac7111cd982b8a4b9fa271547fd6d9c41ff0;
    stim[44] = 270'h30071c735924b07d286f432676cc52d81d400d1da119c0cde8bae5a353299ccbf444;
    stim[45] = 270'h2f8e896ef7dacf6eb6d5b29fbd0a26e1a5bb996b03af18fa66360665676f31682b14;
    stim[46] = 270'h238fcb978ed811ecec030d2b8355d192482b60c094f8263c19f8d1a6b02292b0a5bd;
    stim[47] = 270'h22da94181907b9e2539967da8aa3fdc76cb98bebbdee332c8fbaa5a01523e0675467;
    stim[48] = 270'h270fd0537b1f9bd90131b4ff1efe18d2d82b4d4f2e09262042890a80054dff4e062c;
    stim[49] = 270'h2e7bd9fd7f1247f6ab78521ba44138d8d1125fa6909e03bb9ceb284a92b31790b375;
    stim[50] = 270'h32152521c2733a5d2d83e2e33bd78664f38064f909d84e9b0c8911184e0647364761;
    stim[51] = 270'h3c771455d7af5f207c04e37ea4e9d7d6c084990df5a8c888ea503b13365f6579aab8;
    stim[52] = 270'h2f21ebfad914357c9ff9f5031dff72129954e690b4bedb2203b481bb339dd84edf33;
    stim[53] = 270'h3b5ee0562c7e7c2f67464a9a644f739e1d5cbe8d34eb82857422fa9f904d6a86f1a2;
    stim[54] = 270'h21072ecad65b69c682ade2d16df8569373381fab92f1449f63911f6e80c1f05c332c;
    stim[55] = 270'h2dfa21c3e8c7205e4c5ef4de7bc7311a7f1e5630e16e9489f71a6618090876c4fecb;
    stim[56] = 270'h203c19437358016daf5be0de15df9455d52d75436f6b43c637e428122b538d1db465;
    stim[57] = 270'h3f669f2a0cfb4902dc1f3e5324cf2aa687a76f9bc7f6c42be9e226101705e408e602;
    stim[58] = 270'h2ee6e3db9dd20bb651d53c396057c1ecc13aff46d38b6cfafdc7a50f58f5b1c6d550;
    stim[59] = 270'h3e036888d5da858db72271fda6614a8cbd24e5ba5e083411eab24f6a01be8245a5ab;
    stim[60] = 270'h3f8c32ebac14bd1905e013dece3e121c6a7f91c6a026917db201ec22d0dbff4a6ce6;
    stim[61] = 270'h35413bd379250e0ca083093896999b0fb368a5a76152abc422ee2a1d90f8ee576d04;
    stim[62] = 270'h2f9a6fec0393140c67326ab4dfc2be0a7be1fa03fa95b8084dafd3ccad166cec9a0c;
    stim[63] = 270'h3772f8c5f3f880bd00dca5af94b3de4a43cc58cc6359388ba8e0685fc062a25e2265;
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
      expv[0] = 217'h0000000000000000000000000000000000000000000000000000000;
      expv[1] = 217'h0000000000000000000000000000000000000000000000000000000;
      expv[2] = 217'h0000000000000000000000000000000000000000000000000000000;
      expv[3] = 217'h188e5c71db5bf22920c3689e4dd1e92f54613ecc7d89ef8fad6f22e;
      expv[4] = 217'h0d8e5c71db53f22920c3689e4dd1692f54613ccc7d89ef8fad6f22f;
      expv[5] = 217'h0cd64eaf3c7bf22920c3689e4dd1692f54613ecc7d89ef8fad6f22f;
      expv[6] = 217'h01564eaf3c7bf22920c3689e4dd1692f546138cc7d89ef8fad6f22c;
      expv[7] = 217'h08564eaf3c73f22920c3689e4dd114a949a266cc7d89ef8fad6f22d;
      expv[8] = 217'h05564eaf3c73f22920c3689e4dd114a949a262cc7d89ef8fad6f22d;
      expv[9] = 217'h1435e4cf739a4d0faa68e8ff18ec94a949a262cc7d89ef8fad6f22c;
      expv[10] = 217'h1435e4cf73924d0faa68e8ff18ec94a949a262cc7d89ef8fad6f22d;
      expv[11] = 217'h14b5e4cf73924d0faa68e8ff18ec94a949a263f4174f42025070716;
      expv[12] = 217'h01b5e4cf73924d0faa68e8ff18ec14a949a263f4174f42025070717;
      expv[13] = 217'h1835e4cf7397c8097e90cb2037d7cabe3105d7f4174f42025070715;
      expv[14] = 217'h1853e0487f3fc8097e90cb2037d7cabe3105d7f4174f42025070714;
      expv[15] = 217'h00d3e0487f37c8097e90cb2037d74abe3105d3eefbf75c1243a360b;
      expv[16] = 217'h0053e0487f37c8097e90cb2037d74abe3105d3eefbf75c1243a3609;
      expv[17] = 217'h1d00eceb4b9a8bd66b38f18666c6b0c321e267eefbf75c1243a3609;
      expv[18] = 217'h0480eceb4b9a8bd66b38f18666c630c321e2632a65e69521f5d24ba;
      expv[19] = 217'h1c00eceb4b9475472d896b949513fcaafe507d2a65e69521f5d24b9;
      expv[20] = 217'h0b80eceb4b9475472d896b9495137caafe507ea6c9697f94e9fb386;
      expv[21] = 217'h0b76e2612bfc75472d896b9495137caafe507ca6c9697f94e9fb384;
      expv[22] = 217'h0af6e2612bfc75472d896b9495137caafe507f7c3273ac5196c2d52;
      expv[23] = 217'h0976e2612bfc75472d896b9495137caafe507f7c3273ac5196c2d50;
      expv[24] = 217'h09f6e2612bf475472d896b9495137caafe507c9f5206f97a2e85fef;
      expv[25] = 217'h01f6e2612bf475472d896b9495137caafe50789f5206f97a2e85fee;
      expv[26] = 217'h0976e2612bf475472d896b94951375901ce35c9f5206f97a2e85fed;
      expv[27] = 217'h10bc40611c9e95a02408a60442aef5901ce35a92f4efa6e64ced143;
      expv[28] = 217'h10bc40611c9695a02408a60442aef5901ce35892f4efa6e64ced143;
      expv[29] = 217'h092aa5510b9e95a02408a60442ae71bbcd6a0e92f4efa6e64ced141;
      expv[30] = 217'h18aaa5510b941761499e89ed5a88f1bbcd6a0fe9a293c24005badef;
      expv[31] = 217'h098e526c6c3c1761499e89ed5a8871bbcd6a0fe9a293c24005badef;
      expv[32] = 217'h000e526c6c3c1761499e89ed5a8871bbcd6a0be9a293c24005badec;
      expv[33] = 217'h190e526c6c3e8ed4b4ff7bd5aa2da8b36630f7e9a293c24005badec;
      expv[34] = 217'h010e526c6c3e8ed4b4ff7bd5aa2d28b36630f1e9a293c24005badec;
      expv[35] = 217'h018e526c6c368ed4b4ff7bd5aa2d28b36630f01ec98f9b07f3fac3f;
      expv[36] = 217'h118d00b6c51a285b31c76612fa2da8b36630f01ec98f9b07f3fac3f;
      expv[37] = 217'h110d00b6c51a285b31c76612fa2da8b36630f01ec98f9b07f3fac3c;
      expv[38] = 217'h010d00b6c51a285b31c76612fa2d28b36630f01ec98f9b07f3fac3c;
      expv[39] = 217'h010d00b6c51a285b31c76612fa2d28b36630f01ec98f9b07f3fac3c;
      expv[40] = 217'h010d00b6c51a285b31c76612fa2d28b36630f01ec98f9b07f3fac3c;
      expv[41] = 217'h000d00b6c51a285b31c76612fa2d28b36630f21ec98f9b07f3fac3c;
      expv[42] = 217'h008d00b6c512285b31c76612fa2d28b36630f32f6209e9b6f150063;
      expv[43] = 217'h11507c573cfc51ce8a566f3c74aea8b36630f32f6209e9b6f150060;
      expv[44] = 217'h01d07c573cf451ce8a566f3c74ae28b36630f0e2239b305714973eb;
      expv[45] = 217'h00507c573cf451ce8a566f3c74ae28b36630f2e2239b305714973e9;
      expv[46] = 217'h10d07c573cf3e3a25bbdf6b3dbaaa8b36630f37732d6075e31f4cd3;
      expv[47] = 217'h10a92b0a5bdbe3a25bbdf6b3dbaaa8b36630f17732d6075e31f4cd2;
      expv[48] = 217'h00a92b0a5bdbe3a25bbdf6b3dbaa28b36630f17732d6075e31f4cd2;
      expv[49] = 217'h00292b0a5bdbe3a25bbdf6b3dbaa28b36630f17732d6075e31f4cd0;
      expv[50] = 217'h13292b0a5bd39ef67f5fc491fdaaa8b36630f37732d6075e31f4cd1;
      expv[51] = 217'h1ae47364761b9ef67f5fc491fdaabbd78664f700c9f213b09d3618f;
      expv[52] = 217'h1d64736476139ef67f5fc491fdaabbd78664f500c9f213b09d3618d;
      expv[53] = 217'h045d84edf33b9ef67f5fc491fdaa3bd78664f300c9f213b09d3618d;
      expv[54] = 217'h045d84edf33b9ef67f5fc491fdaa3bd78664f300c9f213b09d3618c;
      expv[55] = 217'h0c5d84edf33b9ef67f5fc491fdaa6df856937700c9f213b09d3618c;
      expv[56] = 217'h0c5d84edf33b9ef67f5fc491fdaa6df856937700c9f213b09d3618c;
      expv[57] = 217'h0d5d84edf3339ef67f5fc491fdaa6df856937700c9f213b09d3618d;
      expv[58] = 217'h0cdd84edf3339ef67f5fc491fdaa6df85693774edf378fed8857d2b;
      expv[59] = 217'h07dd84edf3339ef67f5fc491fdaa6df85693734edf378fed8857d2a;
      expv[60] = 217'h1668245a5abf80da223576a16369edf85693734edf378fed8857d28;
      expv[61] = 217'h1d68245a5abf80da223576a16369ce3e121c6d4edf378fed8857d28;
      expv[62] = 217'h1468245a5abf80da223576a16369ce3e121c6b4edf378fed8857d28;
      expv[63] = 217'h09e8245a5abf80da223576a163695fc2be0a7fc3f407f52b70109a6;
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
