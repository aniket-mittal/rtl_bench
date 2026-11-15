// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 228;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06429 dut (
    .aclk(clk),
    .aresetn(in_vec[227:227]),
    .S00_AXI_awid(in_vec[226:215]),
    .S00_AXI_awaddr(in_vec[214:183]),
    .S00_AXI_awlen(in_vec[182:179]),
    .S00_AXI_awsize(in_vec[178:176]),
    .S00_AXI_awburst(in_vec[175:174]),
    .S00_AXI_awlock(in_vec[173:172]),
    .S00_AXI_awcache(in_vec[171:168]),
    .S00_AXI_awprot(in_vec[167:165]),
    .S00_AXI_awqos(in_vec[164:161]),
    .S00_AXI_awvalid(in_vec[160:160]),
    .S00_AXI_wid(in_vec[159:148]),
    .S00_AXI_wdata(in_vec[147:116]),
    .S00_AXI_wstrb(in_vec[115:112]),
    .S00_AXI_wlast(in_vec[111:111]),
    .S00_AXI_wvalid(in_vec[110:110]),
    .S00_AXI_bready(in_vec[109:109]),
    .S00_AXI_arid(in_vec[108:97]),
    .S00_AXI_araddr(in_vec[96:65]),
    .S00_AXI_arlen(in_vec[64:61]),
    .S00_AXI_arsize(in_vec[60:58]),
    .S00_AXI_arburst(in_vec[57:56]),
    .S00_AXI_arlock(in_vec[55:54]),
    .S00_AXI_arcache(in_vec[53:50]),
    .S00_AXI_arprot(in_vec[49:47]),
    .S00_AXI_arqos(in_vec[46:43]),
    .S00_AXI_arvalid(in_vec[42:42]),
    .S00_AXI_rready(in_vec[41:41]),
    .M00_AXI_awready(in_vec[40:40]),
    .M00_AXI_wready(in_vec[39:39]),
    .M00_AXI_bresp(in_vec[38:37]),
    .M00_AXI_bvalid(in_vec[36:36]),
    .M00_AXI_arready(in_vec[35:35]),
    .M00_AXI_rdata(in_vec[34:3]),
    .M00_AXI_rresp(in_vec[2:1]),
    .M00_AXI_rvalid(in_vec[0:0]),
    .S00_AXI_awready(out_vec[132:132]),
    .S00_AXI_wready(out_vec[131:131]),
    .S00_AXI_bid(out_vec[130:119]),
    .S00_AXI_bresp(out_vec[118:117]),
    .S00_AXI_bvalid(out_vec[116:116]),
    .S00_AXI_arready(out_vec[115:115]),
    .S00_AXI_rid(out_vec[114:103]),
    .S00_AXI_rdata(out_vec[102:71]),
    .S00_AXI_rresp(out_vec[70:69]),
    .S00_AXI_rlast(out_vec[68:68]),
    .S00_AXI_rvalid(out_vec[67:67]),
    .M00_AXI_awaddr(out_vec[66:57]),
    .M00_AXI_awprot(out_vec[56:54]),
    .M00_AXI_awvalid(out_vec[53:53]),
    .M00_AXI_wdata(out_vec[52:21]),
    .M00_AXI_wstrb(out_vec[20:17]),
    .M00_AXI_wvalid(out_vec[16:16]),
    .M00_AXI_bready(out_vec[15:15]),
    .M00_AXI_araddr(out_vec[14:5]),
    .M00_AXI_arprot(out_vec[4:2]),
    .M00_AXI_arvalid(out_vec[1:1]),
    .M00_AXI_rready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 228'h38078af0e0935f5b311fb00337a3a96575b73b148c13a4079d35d12fb;
    stim[1] = 228'h64103a8b5757ed43f6cbe01965b6c6a368fff1485da99c969347e3964;
    stim[2] = 228'hbafa6ee8156b3447f2ec783b5d42c4f10db153cc18314414d24f8efb1;
    stim[3] = 228'h852bcb6e4cbc19f5ff175329c0e131d2c568d4fabdb1df4b6b016e7fa;
    stim[4] = 228'hb6da5c7145febbb6c0c3f4207ed64e8af93131b13c3b6c4f2f9d94905;
    stim[5] = 228'h9313a9493aa9f347d39b15cd7c4d72a176099c5c6c59b4d655e9c90e8;
    stim[6] = 228'hfc017a3ffcbfbed7ea65321f631d31624feb0f3c7ce84546e4504646e;
    stim[7] = 228'h1fb2c3d3c2d58a5806d987073009325b279814787fd14b7c78c91209f;
    stim[8] = 228'h827c5dca71cafdd221b66dac29a36f3c5dbd32caeed85b5d9aebf5992;
    stim[9] = 228'hfcbc77d643764bf1b1886d5db52481a5cf8d95d51b789211602d8504c;
    stim[10] = 228'h8e7cbcd5de3a473eed86190168e81e1c56a2c954133d7acec8393152a;
    stim[11] = 228'ha0323c5fff0589b4d896ea997e2c33492ad3ddbe5e020b53bb971bebc;
    stim[12] = 228'h95f511411ba778855697875272898db80d673c20c065373b31b0e89d3;
    stim[13] = 228'hd8850f171a7abb7d1b036b931dedfad748a0cbfa0cc41abedc89e41c2;
    stim[14] = 228'h9f63e97f9c7316124e38a4168f6a4416fbac0332a627c62e823213149;
    stim[15] = 228'h8fd9955aa5f353dcefb3021b1c7ae81a619c17d76a6b3eb34b94fd84c;
    stim[16] = 228'hd56f14750bb64bee2a4e503d5534a70cbbb71c66cbb93d327c3935c95;
    stim[17] = 228'h514142bcb340ca3a541f8bea25bbf87a0911667fa672c580548fb84f5;
    stim[18] = 228'hbaf263d755003e29bd1f029e4142876d30412ec59da81ca379b9150b5;
    stim[19] = 228'hfd3fa315d65ebfdb86ed2995fee37a764751360f06c0521aff9feee79;
    stim[20] = 228'he491a1df99d0825e5c4c34dab925ebd49523876883950dab925581837;
    stim[21] = 228'hd9da8a4a16bd6445c42ff2f9543e20791587e31336437461111c35c1e;
    stim[22] = 228'h9c67a1419eb9489fca1a9ee02449b0eea2a5a04fd0dac0a299be779f6;
    stim[23] = 228'hf7f0588bdee019de44f1801ae9f0a453676255393c648c66f9822334c;
    stim[24] = 228'hc8b3c21cda44dea7d8eeb4fc59ac8664ef964acbc9f6b33218e3973f7;
    stim[25] = 228'hf78b2aeb6539305f4378269641aeeffef37aef1bb6b2f62a1b42b3866;
    stim[26] = 228'h80aae10213b73af4a1a7ba122a6ca344401096029841133f67f5238b4;
    stim[27] = 228'h93838c99a80bdd34441bf07e1534624bcc2b2259e625e9712e67d7928;
    stim[28] = 228'hcd0229f71a6d0f7b5040637ccbe1414388654e6cd957467c8052c7122;
    stim[29] = 228'hcef6a41d29b2111efebb4cdf12c9f0e89efc530be172240dda8169312;
    stim[30] = 228'he1c0172925ae42d4559078e3d0fe6b62660ba26137258d395aecf70d4;
    stim[31] = 228'h949a68b425c93f32da633bc2a5f296192648e846ae02d119a565405e3;
    stim[32] = 228'hf2af0e991155003bb85c539eaa0393660d2b1d9adff7d33847703ab89;
    stim[33] = 228'hd562ee4b2d729b1ade2fcb3f7eb499dadd76d726084befa95e067a141;
    stim[34] = 228'hac80cfee470128e64688641fa636348671c5d7ed87990c98982ee6eec;
    stim[35] = 228'he5c70e16def341e4524e26f08093d44444c8cceaecdee529c8c5d3f1c;
    stim[36] = 228'h8aeb5bf5cc3934d5158797f65c74bef8c9743c5a9cf33c0de16aed942;
    stim[37] = 228'hb652b911e532396e7c90f0c461e647611e7f2a6ff7092c6d3693d357e;
    stim[38] = 228'hf362f5c1fb90c2c7fa67e3c676341aef0ec31479a7c94b26a42aac2b6;
    stim[39] = 228'h9b8f721073350eb308c880175a4d9143aa129c003c195be529bec4de0;
    stim[40] = 228'ha2631cefca28b4acc07523121c158f47e3dbe7f0e2a69e5a00a9cc53f;
    stim[41] = 228'hb609e60231307b5978119b613518bcde27a9368e7a7e9fe778ed33921;
    stim[42] = 228'hc3051c1e160aa093ef8b14bbef0394cacf91234d9d5694ad94bc0c60f;
    stim[43] = 228'hd745831b79963da606095a17ecbf7495a03cc92ead9342f7ad799d11f;
    stim[44] = 228'hf3cca981f02486a6dec2f08ee7166af3e717b77a84d736bddfcda218d;
    stim[45] = 228'hcbe0843af9b7ffbdc1bec3806105ab9791f9313ab7a128b29acf922db;
    stim[46] = 228'hb0ba11674108295531da06c083a95819c42202bdbb1cbb3560dd5cd53;
    stim[47] = 228'ha448248195932d79a6b2390aed494eefbeb2fde14f31f62a80c3fbf59;
    stim[48] = 228'hf627f1afefbb9a2ce3382b7af3a32b9b88672e6ba1a69613972841b47;
    stim[49] = 228'hcaee9358e3ce8309bf7d0494a910fb12772bf5506580bb241e24ca689;
    stim[50] = 228'hbc45331380871d7599686179aa3a32ad4f6eaa49491c8b1fda34d9722;
    stim[51] = 228'h9d98940b34513a3e4ef7584fc91672f54194f7330ad540cde0131d202;
    stim[52] = 228'hd897ff5d3b0ffa303076e5e3822460d8eaf1396289df1502b395c7d4f;
    stim[53] = 228'h9ae0a18cffa5f19f1aab07db7d4c890624b8e443138451c79bdb1bda3;
    stim[54] = 228'hc6b3b5780bd0ff70f46c28a7d39a94c2253f01bb1dead229c13c7a38f;
    stim[55] = 228'haeae79194fb06b8551e673231f8f63847e94c442efeb08bfa8c490334;
    stim[56] = 228'hc35d40e36166397ee96004309f5762469d6b7a637993d5c6ff7e2e0ca;
    stim[57] = 228'h8b469d41843e1fca20ca23f27db6a3955a44ece64f9e4da356878a620;
    stim[58] = 228'h8a4adc335c494d0c8cdbaef1c5e5fbbe80365c5cef18219d26e7574bc;
    stim[59] = 228'he0f626f75ac651938b11c8a4119eba04d1616a9723de0ed0bba3505a8;
    stim[60] = 228'hb789171af8eb602c90a05109a7588fa605ed56683001a3a46bfae7b83;
    stim[61] = 228'hff9435709b29ad65d795215f80f5d59a01f7f4c7f64e17b6647a45c6b;
    stim[62] = 228'h8cf4652e82224ec3edb095cc811748fc7b36eb1b521acea85cfadda84;
    stim[63] = 228'ha861fd29b16efa3bfb0ed0497d3eceee6a3d07aea718a56bb339f62b5;
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
      expv[0] = 133'h00000000000000000025760066f4741490;
      expv[1] = 133'h000000000000000005d47c032cb6d9c84c;
      expv[2] = 133'h0000000000000000055aef076ba8594c00;
      expv[3] = 133'h1800000000000000032eaa65381c267aae;
      expv[4] = 133'h1000080000000000017ede840fdac9b136;
      expv[5] = 133'h08619a2b800000151eaae2b9af89aedc7a;
      expv[6] = 133'h10618a85800000151f2ec643ec63a63c62;
      expv[7] = 133'h000000000000000000b510e0e60126f867;
      expv[8] = 133'h000000000000000004724db585346dcaee;
      expv[9] = 133'h08db18000000000000dc2dabb6a4905508;
      expv[10] = 133'h10db100000000000078fc3202d1d03d41e;
      expv[11] = 133'h0ec318000000000007c0bd532fc586be46;
      expv[12] = 133'h16c30d24800000151ee8b0ea4e513120d9;
      expv[13] = 133'h1b4b952480000015169fad7263bdbefa0d;
      expv[14] = 133'h134b852480000015171c5482d1ed4932a1;
      expv[15] = 133'h0b4b852480000015117d8043638f5c577d;
      expv[16] = 133'h034b85248000001512edca07aaa695e6dd;
      expv[17] = 133'h000000000000000004d1717d44b77e7fa0;
      expv[18] = 133'h000000000000000005412053c82851c58d;
      expv[19] = 133'h180000000000000005974532bfdc6e8f08;
      expv[20] = 133'h00000000000000000675e69b5724bce885;
      expv[21] = 133'h100000000000000005ae9e5f2a87c4133b;
      expv[22] = 133'h000008000000000007afd3dc0489364fc1;
      expv[23] = 133'h000000000000000007b9d0035d3e153927;
      expv[24] = 133'h08000800000000000690f69f8b3591cbd9;
      expv[25] = 133'h1800000000000000014fc4d2c835dd9bb9;
      expv[26] = 133'h09bc10000000000004ec9742454d948289;
      expv[27] = 133'h01bc00000000000002029e0fc2a68cd9f7;
      expv[28] = 133'h01bc080000000000069b6c6f997c286cc3;
      expv[29] = 133'h11bc0d0e000000151a6de99be2593e0bf0;
      expv[30] = 133'h11bc050e00000015196aaf1c7a1fcce125;
      expv[31] = 133'h11bc050e000000151172677854be53c6a8;
      expv[32] = 133'h19bc050e0000001514556a73d540729ac9;
      expv[33] = 133'h11bc050e00000015135d7967efd6922615;
      expv[34] = 133'h11bc050e0000001511c0cc83f4c6c76d84;
      expv[35] = 133'h09bc050e0000001517bca4de10127b6af1;
      expv[36] = 133'h19bc050e00000015130eb2fecb8e97da9c;
      expv[37] = 133'h1ac3950e00000015114dfe188c3cc9eff7;
      expv[38] = 133'h1ac38d0e0000001516e4fc78cec682f9a5;
      expv[39] = 133'h12c3850e0000001514cc5002eb49b2002f;
      expv[40] = 133'h02c38d0e00000015128b84624382b1f0ee;
      expv[41] = 133'h083a9d1f800000151c4d336c26a3170e6f;
      expv[42] = 133'h1c089b78800000151d8242977de0734d89;
      expv[43] = 133'h0c089378800000151664cb42fd97ef2ea3;
      expv[44] = 133'h0c089b78800000151408fe11dce2ccfa99;
      expv[45] = 133'h1408837880000015166d98700c20b4bab5;
      expv[46] = 133'h04088378800000151042a0d810752a3dbd;
      expv[47] = 133'h1408837880000015156507215da929e159;
      expv[48] = 133'h0b5913788000001513ef856f5e7464eba8;
      expv[49] = 133'h035903788000001510f3209295221ed07d;
      expv[50] = 133'h13590378800000151020ac2f354746c944;
      expv[51] = 133'h13590378800000151515cb09f922ceb302;
      expv[52] = 133'h03590b788000001516c23cbc70448c6288;
      expv[53] = 133'h135903788000001517e9e0fb6fa990430a;
      expv[54] = 133'h13590b788000001512f42514fa73533b09;
      expv[55] = 133'h1b5903788000001513ecae6463f1ecc2e5;
      expv[56] = 133'h13590378800000151059c08613eaece36a;
      expv[57] = 133'h03590b7880000015110f447e4fb6d4e645;
      expv[58] = 133'h0359037880000015171395de38bcbedcf0;
      expv[59] = 133'h035903788000001516b059148233d69726;
      expv[60] = 133'h03590b7880000015163baa2134eb11e831;
      expv[61] = 133'h185013788000001516caa42bf01ebb47e9;
      expv[62] = 133'h1850137880000015108852b99022e81b45;
      expv[63] = 133'h0050137880000015145b7a092fa7d9aeb3;
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
