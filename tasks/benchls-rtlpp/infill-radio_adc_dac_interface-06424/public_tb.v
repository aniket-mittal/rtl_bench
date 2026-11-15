// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 231;
  localparam OW = 208;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06424 dut (
    .clk(clk),
    .rx_clk_in(in_vec[230:230]),
    .rx_frame_in(in_vec[229:229]),
    .rx_data_in(in_vec[228:217]),
    .dac_sync_in(in_vec[216:216]),
    .tdd_sync(in_vec[215:215]),
    .gps_pps(in_vec[214:214]),
    .delay_clk(in_vec[213:213]),
    .adc_dovf(in_vec[212:212]),
    .dac_data_i0(in_vec[211:196]),
    .dac_data_q0(in_vec[195:180]),
    .dac_data_i1(in_vec[179:164]),
    .dac_data_q1(in_vec[163:148]),
    .dac_dunf(in_vec[147:147]),
    .s_axi_aclk(in_vec[146:146]),
    .s_axi_aresetn(in_vec[145:145]),
    .s_axi_awvalid(in_vec[144:144]),
    .s_axi_awaddr(in_vec[143:128]),
    .s_axi_awprot(in_vec[127:125]),
    .s_axi_wvalid(in_vec[124:124]),
    .s_axi_wdata(in_vec[123:92]),
    .s_axi_wstrb(in_vec[91:88]),
    .s_axi_bready(in_vec[87:87]),
    .s_axi_arvalid(in_vec[86:86]),
    .s_axi_araddr(in_vec[85:70]),
    .s_axi_arprot(in_vec[69:67]),
    .s_axi_rready(in_vec[66:66]),
    .up_enable(in_vec[65:65]),
    .up_txnrx(in_vec[64:64]),
    .up_dac_gpio_in(in_vec[63:32]),
    .up_adc_gpio_in(in_vec[31:0]),
    .tx_clk_out(out_vec[207:207]),
    .tx_frame_out(out_vec[206:206]),
    .tx_data_out(out_vec[205:194]),
    .enable(out_vec[193:193]),
    .txnrx(out_vec[192:192]),
    .dac_sync_out(out_vec[191:191]),
    .tdd_sync_cntr(out_vec[190:190]),
    .gps_pps_irq(out_vec[189:189]),
    .l_clk(out_vec[188:188]),
    .rst(out_vec[187:187]),
    .adc_enable_i0(out_vec[186:186]),
    .adc_valid_i0(out_vec[185:185]),
    .adc_data_i0(out_vec[184:169]),
    .adc_enable_q0(out_vec[168:168]),
    .adc_valid_q0(out_vec[167:167]),
    .adc_data_q0(out_vec[166:151]),
    .adc_enable_i1(out_vec[150:150]),
    .adc_valid_i1(out_vec[149:149]),
    .adc_data_i1(out_vec[148:133]),
    .adc_enable_q1(out_vec[132:132]),
    .adc_valid_q1(out_vec[131:131]),
    .adc_data_q1(out_vec[130:115]),
    .adc_r1_mode(out_vec[114:114]),
    .dac_enable_i0(out_vec[113:113]),
    .dac_valid_i0(out_vec[112:112]),
    .dac_enable_q0(out_vec[111:111]),
    .dac_valid_q0(out_vec[110:110]),
    .dac_enable_i1(out_vec[109:109]),
    .dac_valid_i1(out_vec[108:108]),
    .dac_enable_q1(out_vec[107:107]),
    .dac_valid_q1(out_vec[106:106]),
    .dac_r1_mode(out_vec[105:105]),
    .s_axi_awready(out_vec[104:104]),
    .s_axi_wready(out_vec[103:103]),
    .s_axi_bvalid(out_vec[102:102]),
    .s_axi_bresp(out_vec[101:100]),
    .s_axi_arready(out_vec[99:99]),
    .s_axi_rvalid(out_vec[98:98]),
    .s_axi_rdata(out_vec[97:66]),
    .s_axi_rresp(out_vec[65:64]),
    .up_dac_gpio_out(out_vec[63:32]),
    .up_adc_gpio_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 231'h55cb011759a21c6b76621c7116a115935e06e06c39eed389f799d0eb44;
    stim[1] = 231'h0c3a901bda1e3fc1ccb7555daba160031a3276081cd3932b5f2b176ee7;
    stim[2] = 231'h5f170f8f9b764a6a6129bef66e3b4d013526e49a9607026aa891eb1137;
    stim[3] = 231'h4074f86436d326802812b3b6e6370bbd57cd35a79cfc01354085438bb2;
    stim[4] = 231'h37ad7ac22e1fcaf955328b8d4707b2c45e3715883dde5e925a17e68848;
    stim[5] = 231'h6d8f52f507cbb7bc2587f667d716223c8f74bf7af66ac262ac2456acc1;
    stim[6] = 231'h6dc8ab7ceba30d6c0113f2de276fc27d64ac8eaa26b13f37caf5156b88;
    stim[7] = 231'h742d66f12c0c2943f44406aba2250a0c8a76174b28c97c34b71b437131;
    stim[8] = 231'h545fdfde639ce717d211bbf65849862e7b4e1be61fff7bd94486186ec6;
    stim[9] = 231'h7c9401957567f93bbaf45283420a584a1ec1742e44e9353a8b65cde9e4;
    stim[10] = 231'h23f38332ad19f0eeef292a14c89eaf1663b38df3f299192b44c6783862;
    stim[11] = 231'h457ea8b1841f2e9eee5b577afdc466fc0b0f43d9c42321be7657777fac;
    stim[12] = 231'h24badfc5d935f073ee3a3bff72c249ba8aefa856badde26d56c92d3c0d;
    stim[13] = 231'h43d637fc6c3610c4ecee8ef600f97abf069b78bb8f184814ab870853f2;
    stim[14] = 231'h1f7d52bffcd9d34c7922d66b0373307ea31e3a1c0dce1bc7208bbd17ce;
    stim[15] = 231'h438e6bcb9e50b4277fa56ef0865cf9e4920e0aef93b1aee1039ba939e0;
    stim[16] = 231'h62d421e3f9794df3f3c05685c52a448af95474913765e8fae5591f6de9;
    stim[17] = 231'h2d8ba8665e32944d4d343e6ec6fd98ae63033020a8ef4e5e9421e714fa;
    stim[18] = 231'h0b4ae199d1e18fea5260ba1b3aa86ce5b7cc533ed7c2a216858eb6fc39;
    stim[19] = 231'h27aba03b73d3fee002c14ee5fb64e985f74ce48b88215234f2a069a9cc;
    stim[20] = 231'h2a75f88d011c15c94d602bffb53f43449f8b0ba78825e41b22b2d364a8;
    stim[21] = 231'h72ab888f792d9240a8b776d9a46882edfaff93cb70e5e8e633de6c8e06;
    stim[22] = 231'h7c3a01a60a078c684dac5ea2a2a0e07e297b529906a3b816629ee885c0;
    stim[23] = 231'h7756983d53aef78d06607e710aaf42f8841c21cb8bf17baa5b628494e1;
    stim[24] = 231'h63de481917c8edebbae73f33b0435d50b60f6ab3fc2f6e55c8235d59d2;
    stim[25] = 231'h4a99d95af65d7ccc68571fde56a6c5589589008c1a333a0c9d75d31c7f;
    stim[26] = 231'h3a9ed38446296bba1306ea1718cd7e71fb1b6ce4bacc072104d5b8280b;
    stim[27] = 231'h5751cce1855637150ad82e31275f6c6e19043700640a7ab4cffcc0121a;
    stim[28] = 231'h06b5f13efdc92b07061bbb6535c9e0ffbdff5993b8a17f1fa32f83ca68;
    stim[29] = 231'h7a62d5643fbbe4639066d6dddf99a522d56855f5e11fc55d56bd8c2527;
    stim[30] = 231'h47523d9ffb9b06b6563bded02c5006d7551d56cddd7f308fa122d2824a;
    stim[31] = 231'h701d1a2667f66805bc0c565823f79ab3d442c1b7e98cb5e94ac5fd11a5;
    stim[32] = 231'h093c925cebfc8a7d97199f370d42b4a41c0e63521575be4650f19ef69b;
    stim[33] = 231'h58fd073d8b986e735c9cabd4dfea9e349a2e77d27083a5600860045200;
    stim[34] = 231'h38d6569021a1949d386c7bbf74e2cd971874ea4627b17ff54b73b84d87;
    stim[35] = 231'h473601fa25ac0b7af4628f73e3bef25c6f742f60f6d7255ffdbef39ed3;
    stim[36] = 231'h3dff15503edbc139ba7cceb89e1fbd270fc147de7dae28ef40167bd33a;
    stim[37] = 231'h50a6ac7585cddde931b2eab9198dfa35b190d890339bd7d5567150936c;
    stim[38] = 231'h6fd20786915782241e36b6a16e357f13191ba123ac2cab2310cfbc51d2;
    stim[39] = 231'h607d97107c7386570ff3acd5bb4aa4217651b3d48127fe85351ae63ab3;
    stim[40] = 231'h35e7608d9e88f021ce07de6ca6510f1cd74c6318856e56fd7819a0d4e5;
    stim[41] = 231'h2594f04672b9ad5fdf163335be4b6485fc2e029cd735ab28247bf052bb;
    stim[42] = 231'h7a087ada2bd2dfb8dd77dbe4ddbf2d318d73f321401f76d8659af0d733;
    stim[43] = 231'h393bd27ebec4397883ed4f36457c4232e731dbee4d97a8d4b921cba014;
    stim[44] = 231'h2caafa60cebeaa0671c82e679cf1bd756a40326c283ce84654de7e7f6f;
    stim[45] = 231'h66a0d63b4decac6a2626dbc8f3986ed524063018c2fff9603b85f21913;
    stim[46] = 231'h5a1b2a106e57b6101d1e8617fd91aeb5df1d6e0ece895e291065392141;
    stim[47] = 231'h2c088d9eac2ad3e839f3ba277bee6d68c9b6d85d37ae364340fc48234e;
    stim[48] = 231'h30e0971a6faa5948e0702fc84713254845e78f2a7894c0bf882f1fed6c;
    stim[49] = 231'h4f04ab1d80f2bf1205dca3fdc8425c72dd563bc56b54176de4bc4127d8;
    stim[50] = 231'h586e4f70133bf34e2313aebfe382c80422f300a369fd375759f2145382;
    stim[51] = 231'h60f261650d2cb2eb6ce37e25477c439a4c152e3bd4b2260b9bbc4782d9;
    stim[52] = 231'h2aceea9781a804547bf9178c4032d88368312539a53f3a557c65482a1b;
    stim[53] = 231'h3c2be4c05c42e8a697b836d391e6dcbbb486b55548532f18219618f0c0;
    stim[54] = 231'h5fbe3be39242140f404b428980ae8370709f47eb844136493dcca6bdfa;
    stim[55] = 231'h4c108928fd4c7bce756a27866a80fe692c131761a8b8a5cb8f6802af22;
    stim[56] = 231'h5888a70d2ccf4c53eb132f4fb206537e629aea907ea8cfb3627e4fb5b1;
    stim[57] = 231'h013ea8dfc3bd7ed330bce235626450f438b4b19c5b66d07499250b3884;
    stim[58] = 231'h4ec2d8c456c6ddde64eeff2c25d313c128281c22b775bed5ae8d71a6dc;
    stim[59] = 231'h529223df7da8966102e0d7ec58c76de88b9e70c42d867aa9ae81f529d6;
    stim[60] = 231'h5caccf430b8c26120dc17f10273b8038c9938053f1136afb941377082a;
    stim[61] = 231'h64940d3ec8febe84c1dd2a1c3f57c69016891af8eaaa5138ef719ab384;
    stim[62] = 231'h599f981c4c969adf709bf39e8aef2226dba7d36acca890b0b32cf35c8e;
    stim[63] = 231'h4454648b2d0441855b7c8a134fd288359d4a7991742d668db0cde466fc;
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
      expv[0] = 208'hab9588000000000000000000004800000000eed389f799d0eb44;
      expv[1] = 208'h187448000000000000000000010c00000000d3932b5f2b176ee7;
      expv[2] = 208'hbe2e8000000000000000000000cc0000000007026aa891eb1137;
      expv[3] = 208'h80e870000000000000000000018400000000fc01354085438bb2;
      expv[4] = 208'h6f59b0000000000000000000010400000000de5e925a17e68848;
      expv[5] = 208'hdb1ea000000000000000000000c4000000006ac262ac2456acc1;
      expv[6] = 208'hdb9250000000000000000000004400000000b13f37caf5156b88;
      expv[7] = 208'he858b0000000000000000000000000000000c97c34b71b437131;
      expv[8] = 208'ha8bfe0000000000000000000010400000000ff7bd94486186ec6;
      expv[9] = 208'hf92800000000000000000000000c00000000e9353a8b65cde9e4;
      expv[10] = 208'h47e6c000000000000000000000c00000000099192b44c6783862;
      expv[11] = 208'h8afc50000000000000000000010c000000002321be7657777fac;
      expv[12] = 208'h497660000000000000000000014000000000dde26d56c92d3c0d;
      expv[13] = 208'h87af10000000000000000000008c00000000184814ab870853f2;
      expv[14] = 208'h3ef9a0000000000000000000008400000000ce1bc7208bbd17ce;
      expv[15] = 208'h871f30000000000000000000008000000000b1aee1039ba939e0;
      expv[16] = 208'hc5ab10000000000000000000000c0000000065e8fae5591f6de9;
      expv[17] = 208'h5b14d0000000000000000000008000000000ef4e5e9421e714fa;
      expv[18] = 208'h169770000000000000000000000c00000000c2a216858eb6fc39;
      expv[19] = 208'h4f54d0000000000000000000004800000000215234f2a069a9cc;
      expv[20] = 208'h54e8f000000000000000000001800000000025e41b22b2d364a8;
      expv[21] = 208'he554c0000000000000000000004000000000e5e8e633de6c8e06;
      expv[22] = 208'hf87600000000000000000000000c00000000a3b816629ee885c0;
      expv[23] = 208'heeaf40000000000000000000000000000000f17baa5b628494e1;
      expv[24] = 208'hc7bc20000000000000000000010c000000002f6e55c8235d59d2;
      expv[25] = 208'h9532e0000000000000000000010000000000333a0c9d75d31c7f;
      expv[26] = 208'h753e60000000000000000000000800000000cc072104d5b8280b;
      expv[27] = 208'haea0e00000000000000000000084000000000a7ab4cffcc0121a;
      expv[28] = 208'h0d68f0000000000000000000010800000000a17f1fa32f83ca68;
      expv[29] = 208'hf4c5600000000000000000000088000000001fc55d56bd8c2527;
      expv[30] = 208'h8ea510000000000000000000008c000000007f308fa122d2824a;
      expv[31] = 208'he0398000000000000000000000c8000000008cb5e94ac5fd11a5;
      expv[32] = 208'h127940000000000000000000010c0000000075be4650f19ef69b;
      expv[33] = 208'hb1f88000000000000000000001080000000083a5600860045200;
      expv[34] = 208'h71af20000000000000000000014c00000000b17ff54b73b84d87;
      expv[35] = 208'h8e6e00000000000000000000018400000000d7255ffdbef39ed3;
      expv[36] = 208'h7bfd80000000000000000000008c00000000ae28ef40167bd33a;
      expv[37] = 208'ha14f500000000000000000000048000000009bd7d5567150936c;
      expv[38] = 208'hdfa40000000000000000000000c4000000002cab2310cfbc51d2;
      expv[39] = 208'hc0f9c800000000000000000000400000000027fe85351ae63ab3;
      expv[40] = 208'h6bcdb0000000000000000000008c000000006e56fd7819a0d4e5;
      expv[41] = 208'h4b2b7000000000000000000001040000000035ab28247bf052bb;
      expv[42] = 208'hf4103000000000000000000001c8000000001f76d8659af0d733;
      expv[43] = 208'h7275e000000000000000000001cc0000000097a8d4b921cba014;
      expv[44] = 208'h5954700000000000000000000080000000003ce84654de7e7f6f;
      expv[45] = 208'hcd4260000000000000000000018000000000fff9603b85f21913;
      expv[46] = 208'hb43690000000000000000000008c00000000895e291065392141;
      expv[47] = 208'h581340000000000000000000004c00000000ae364340fc48234e;
      expv[48] = 208'h61c04000000000000000000001c00000000094c0bf882f1fed6c;
      expv[49] = 208'h9e0b5000000000000000000001000000000054176de4bc4127d8;
      expv[50] = 208'hb0dd20000000000000000000000000000000fd375759f2145382;
      expv[51] = 208'hc1e430000000000000000000008400000000b2260b9bbc4782d9;
      expv[52] = 208'h559d700000000000000000000184000000003f3a557c65482a1b;
      expv[53] = 208'h7854f0000000000000000000004000000000532f18219618f0c0;
      expv[54] = 208'hbf7c10000000000000000000000c000000004136493dcca6bdfa;
      expv[55] = 208'h982040000000000000000000010000000000b8a5cb8f6802af22;
      expv[56] = 208'hb11250000000000000000000014c00000000a8cfb3627e4fb5b1;
      expv[57] = 208'h027f5000000000000000000000400000000066d07499250b3884;
      expv[58] = 208'h9d876000000000000000000001840000000075bed5ae8d71a6dc;
      expv[59] = 208'ha52510000000000000000000010c00000000867aa9ae81f529d6;
      expv[60] = 208'hb9596000000000000000000001c000000000136afb941377082a;
      expv[61] = 208'hc92a00000000000000000000008000000000aa5138ef719ab384;
      expv[62] = 208'hb33cc0000000000000000000014c00000000a890b0b32cf35c8e;
      expv[63] = 208'h88a830000000000000000000008c000000002d668db0cde466fc;
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
