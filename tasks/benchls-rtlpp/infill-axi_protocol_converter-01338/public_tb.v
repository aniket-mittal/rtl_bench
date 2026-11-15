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

  rtlpp_01338 dut (
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
    stim[0] = 222'h014f8d31cddaf7f8bec989dea599859ef20f437cfb62d6f43d097d0f;
    stim[1] = 222'h1670c9f03911e319618653652ad5f6fa53c3764e818c35759e9bd94e;
    stim[2] = 222'h3e77677ea9ee67b70a437ac75baffafc523b4e3627cb744426a5f0a1;
    stim[3] = 222'h2bbbff1d7eac4e706d3ab65c5156386f9f318f030a5eb51879e4efa2;
    stim[4] = 222'h22d8cda84dde55767a227fa4faecfde2db3687ca884b5392cd5e3a08;
    stim[5] = 222'h2619fa3fd698c7b3e1869dface8fc40b7b370e6482d9a00d62751d26;
    stim[6] = 222'h39a83ce10ec6d8e58d95c4c6a337760f37017b776fa5bbbe5c388cb6;
    stim[7] = 222'h20ef95b0ea3c85994e5759d1e3e8383af5e0718f34b80d348fcca519;
    stim[8] = 222'h3d7a735d9de8cf3ed259574f0a4381c2c68a1191cbfdac2ba173cf2d;
    stim[9] = 222'h35a3d09b9a88895e31d362b6f38f98d4cd72bb14438e9e2b64fb5e35;
    stim[10] = 222'h29c55efe60ed6e4243d6fb46a2dc39c25317c7953c501013cff823a2;
    stim[11] = 222'h2a83e2d9e3f49decaee10e09f0ab50112f217b3608094efe4afe0aec;
    stim[12] = 222'h31fc706cda6476b9dec8652ea9b2074cdd7955a252a5ad998d3a70de;
    stim[13] = 222'h3ce803891043d7e50d30bacca400075d997522edf5b18220d1beebbd;
    stim[14] = 222'h35a4bd9c360551d073647e6f12c1e76a53accfc608282c95989a27c4;
    stim[15] = 222'h28870f58d05d4b534ff18fb306c6cbe4a790b21459b63cdc56fc0762;
    stim[16] = 222'h2cd8a6efb79abdd8345d9b4fd4cded0d0216c9fe4602fe7715aa12ce;
    stim[17] = 222'h324937d0736d9de31bb08e2378b6822ce78cee9b9cf8b3d9ee3660a0;
    stim[18] = 222'h3c90411312a60bdc5b537194d18d332deffbe2c3439748897fa39f50;
    stim[19] = 222'h3aee99e6a59202df9c5e1c8006bb50b97c2208ff71e99c7fde316a89;
    stim[20] = 222'h3f25176378a39787da9d4cdbb26db6738934bf3b46bcd2e6acf91ba6;
    stim[21] = 222'h39dddb6f2d2e925278ffd2910f33f21be4de521229bdb24df055dcc6;
    stim[22] = 222'h34f76204429ec97524c7b1d2ea2b8303cf19d3d7446efded0f3565e0;
    stim[23] = 222'h3ad59ce6eeea5e73c13440e917bf19748f2d1107a28d9c56fbeaaea2;
    stim[24] = 222'h3b02df540d055785e9eaadcb814e83d0895f0ebf9d7467042315e610;
    stim[25] = 222'h39796428286b81ad3d9bd1053717de580f0cbbd9a6919041ad5adafb;
    stim[26] = 222'h3d787d3f8a27066afd8c75f75605ae8481d3ed0204a27bfffeea32f2;
    stim[27] = 222'h243287b60aa3b6ff43acd3428b761e7c0a6d28212ec38752cb54bac2;
    stim[28] = 222'h3e25a1c6a3dac04eb9c1eea2f1038e8522235d7ce12759120ca6e1b5;
    stim[29] = 222'h39bdc5583fddb1026ea67fc92e7064c0009317e883299dbcc8129cc4;
    stim[30] = 222'h33942dc1fb424c274ff9125dd4a1e9a415f7532f2f320b5e79dc29a5;
    stim[31] = 222'h20aa93cbb0b9c6be8073270bd433321ec283f0a610fd9cabfc0cf751;
    stim[32] = 222'h38b2b3f5a4dbd925814ebaaf760ab43cddc8bbf1308f387439361385;
    stim[33] = 222'h2c5565f8d05717eb3f49344f6f392fd948d2ac2643bed60a4a6bc26a;
    stim[34] = 222'h24f29ee4781bbda5ed90b53d1895ef144751d2eba63ce8c9c3ff3ec3;
    stim[35] = 222'h11a4faeb9db282b1a8a9728087e6161d483f2e7908b5246923363074;
    stim[36] = 222'h2db4833fa549a7b505ba479ec9c61ea22f17acc97ae828118ea62c93;
    stim[37] = 222'h2fff18f71f019906c4794af7de7a94a5382751ce9214c9c37c633e19;
    stim[38] = 222'h262b82e5690179e1d05588a53266c520c59e943fd8506eeac21cec51;
    stim[39] = 222'h2ebe7a96d5038a9d19891858e82e1eb23eff38766f8b730ff601c87e;
    stim[40] = 222'h2fc3dcf16afa2a9f1bcb60daf902cd41ed4830f9f38ec67b876f5aed;
    stim[41] = 222'h388ecb8ce18715cb96ecf9223e931af5be4d7628e72776c49ef8001e;
    stim[42] = 222'h2589d73557a16574cc31258e21ddb4fa78a07b1164254c957c3f5007;
    stim[43] = 222'h3af3dad66c643f760f3795fee01eb29cf937192c82f474d8d9c95372;
    stim[44] = 222'h3653324ba9b107bbfcc5765c19bf19c65c2eaf319ed4f1a2959a994d;
    stim[45] = 222'h367c7e80bb3e8a57dab1f80d7625fe3d550863476b15a1dda2516ba4;
    stim[46] = 222'h3e1db37d9380d0f1083eb6cb63579bbb2a4c5793d5aeaf69421dffc2;
    stim[47] = 222'h329f2e550dd9a9e9c29ba6f3465cb774a25561fc3938ff6f52000b9b;
    stim[48] = 222'h394b4e42f18d740fc4fa56b4d7ae2f2cbf5018b28046ea83a2a278e0;
    stim[49] = 222'h273f098270d6e0e8ef1efc1cf1c85e980946956fe7ba00b53fc84eb6;
    stim[50] = 222'h2199cdf3edf3a7a9dd45b0ef90b378daae61ed4bfc1dcf79f8373a22;
    stim[51] = 222'h3ca96866ee56111f49180745a4462a12da4b15af8c38644297d44861;
    stim[52] = 222'h35e1fc559c725a4e0f04094d3c17d21e8bb40470f3ef8411b384385e;
    stim[53] = 222'h2668e93af154f5ec38908e977a972a333d37364156d81cf0df13edec;
    stim[54] = 222'h21589ffac8eafab9242b01e6878fba8c70c4994908ca2796de6cc1bd;
    stim[55] = 222'h29827cc4d1b8667f790e2ad8631ee4af070a23b03d56a7303c8ed347;
    stim[56] = 222'h2acfb3fa16118689448cb78d3a68742933d5ed7eafcfefe0b922573b;
    stim[57] = 222'h3cd48225e2240fe1f49db919dc4da50cb724e1a470a594835a242b0e;
    stim[58] = 222'h3f390125a47a586db77ac5249571f2ca079a54ee27ca9875bd5b9614;
    stim[59] = 222'h3be2b491dbe9686e704b223fba00e53430434c5855d7dc73ee311894;
    stim[60] = 222'h2e825b08ad0a3943d96ba98e382032d5882dc44ed22fb4ad69af1f44;
    stim[61] = 222'h217220ff8746b73edf5d0eeabcaaa489967ae7b6e845451f65872c21;
    stim[62] = 222'h23bf86b54800bdee6cf4b4c21bcfe6b800cbcc80a15352396d22e014;
    stim[63] = 222'h339aa3d3a7f3217a8f5dabc80ec379825f429b42eaa295fc2a7a4baf;
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
      expv[0] = 169'h0000000000000000000000000000000000000000000;
      expv[1] = 169'h0000000000000000000000000000000000000000000;
      expv[2] = 169'h0000000000000000000000000000000000000000000;
      expv[3] = 169'h00c26a5f0a180000000000437ac75badf5f8a4769c6;
      expv[4] = 169'h01426a5f0a1800000000003ab65c5155f5f8a4769c4;
      expv[5] = 169'h01426a5f0a1000000000003ab65c5151f5f8a4769c5;
      expv[6] = 169'h10426a5f0a11867e8ff5a3869dface8ff5f8a4769c4;
      expv[7] = 169'h03426a5f0a11867e8ff5a315c4c6a335f5f8a4769c4;
      expv[8] = 169'h03c8fcca5199867e8ff5a315c4c6a3347075ebc0e3e;
      expv[9] = 169'h0a48fcca5199867e8ff5a359574f0a467075ebc0e3c;
      expv[10] = 169'h1ac8fcca519568f426e6a6d9574f0a4531a99ae5767;
      expv[11] = 169'h19c8fcca519568f426e6a6d9574f0a4531a99ae5766;
      expv[12] = 169'h1048fcca519568f426e6a6d9574f0a4331a99ae5764;
      expv[13] = 169'h09c8fcca519568f426e6a648652ea9b40e99baf2ab2;
      expv[14] = 169'h098d1beebbdd68f426e6a648652ea9b40e99baf2ab2;
      expv[15] = 169'h008d1beebbdd68f426e6a648652ea9b20e99baf2ab2;
      expv[16] = 169'h150d1beebbda21c3d63413f18fb306c40e99baf2ab0;
      expv[17] = 169'h148d1beebbd221c3d63413f18fb306c7da1a042d923;
      expv[18] = 169'h050d1beebbd221c3d63413308e2378b5da1a042d920;
      expv[19] = 169'h040d1beebbd221c3d63413308e2378b3da1a042d920;
      expv[20] = 169'h0ffde316a89a21c3d634135e1c8006bca172f844116;
      expv[21] = 169'h16fde316a897c945d8de2fde1c8006baa172f844117;
      expv[22] = 169'h1e7de316a897c945d8de2fffd2910f34a172f844114;
      expv[23] = 169'h06fde316a897c945d8de2f7fd2910f3106079e33a76;
      expv[24] = 169'h05fde316a897c945d8de2f3440e917bd06079e33a76;
      expv[25] = 169'h15fde316a896c0b7d50345eaadcb814d06079e33a76;
      expv[26] = 169'h149ad5adafbec0b7d503459bd105371706079e33a76;
      expv[27] = 169'h071ad5adafb6c0b7d503451bd105371106079e33a75;
      expv[28] = 169'h179ad5adafb10ca1ed82afacd3428b743cf814da502;
      expv[29] = 169'h0ea0ca6e1b590ca1ed82af41eea2f1063cf814da502;
      expv[30] = 169'h1320ca6e1b5e6f71560ff2c1eea2f1003cf814da500;
      expv[31] = 169'h0220ca6e1b566f71560ff241eea2f1023cf814da501;
      expv[32] = 169'h0abfc0cf751e6f71560ff273270bd434643d8507e1e;
      expv[33] = 169'h0fbfc0cf751e6f71560ff273270bd434643d8507e1e;
      expv[34] = 169'h0e3fc0cf75166f71560ff273270bd436643d8507e1d;
      expv[35] = 169'h0000000000000000000000000000000000000000000;
      expv[36] = 169'h0000000000000000000000000000000000000000000;
      expv[37] = 169'h1118ea62c93b6d20cfe955ba479ec9c400000000000;
      expv[38] = 169'h0918ea62c93b6d20cfe955794af7de7c00000000000;
      expv[39] = 169'h0198ea62c9336d20cfe955794af7de798a418b3d28b;
      expv[40] = 169'h1118ea62c933af9ea5b545891858e82d8a418b3d288;
      expv[41] = 169'h19b876f5aedbaf9ea5b545cb60daf9059a83da90606;
      expv[42] = 169'h10b876f5aed3af9ea5b545cb60daf9039a83da90607;
      expv[43] = 169'h11d7c3f5007baf9ea5b545cb60daf9019a83da90606;
      expv[44] = 169'h1157c3f5007baf9ea5b545b795fee01d9a83da90604;
      expv[45] = 169'h0057c3f5007baf9ea5b54545765c19bf9a83da90604;
      expv[46] = 169'h1557c3f5007d9f1fa02ecfc5765c19b99a83da90604;
      expv[47] = 169'h04d7c3f500759f1fa02ecf3eb6cb635737765498af7;
      expv[48] = 169'h14752000b9bca7cb954371beb6cb635537765498af4;
      expv[49] = 169'h14752000b9b4a7cb954371fa56b4d7ad37765498af5;
      expv[50] = 169'h13752000b9b4a7cb954371fa56b4d7a937765498af4;
      expv[51] = 169'h0af52000b9b4a7cb95437145b0ef90b6f1b55cc3dae;
      expv[52] = 169'h0aa97d44861ca7cb95437145b0ef90b4f1b55cc3dae;
      expv[53] = 169'h09a97d44861ca7cb95437145b0ef90b4f1b55cc3dae;
      expv[54] = 169'h10a97d4486199a3a4ebc54c5b0ef90b2f1b55cc3dae;
      expv[55] = 169'h01a97d4486119a3a4ebc542b01e6878cf1b55cc3daf;
      expv[56] = 169'h0183c8ed34799a3a4ebc540e2ad8631cf1b55cc3dae;
      expv[57] = 169'h1183c8ed3472b3ecfe85818e2ad86318f1b55cc3daf;
      expv[58] = 169'h1083c8ed3472b3ecfe85818e2ad8631af1b55cc3dae;
      expv[59] = 169'h1783c8ed3472b3ecfe85818e2ad86318f1b55cc3dae;
      expv[60] = 169'h1783c8ed3472b3ecfe85818e2ad86318f1b55cc3dae;
      expv[61] = 169'h1703c8ed3472b3ecfe85818e2ad86318f1b55cc3dac;
      expv[62] = 169'h0ff65872c21ab3ecfe85815d0eeabcad49132cf5ce2;
      expv[63] = 169'h1e765872c210efe1ad5206dd0eeabcaf49132cf5ce1;
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
