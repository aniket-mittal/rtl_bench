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

  rtlpp_05373 dut (
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
    stim[0] = 206'h0335ade88f1c1ce129233b34cb8f73419ab84a1d579ca9299c93;
    stim[1] = 206'h0163f927e04a0d09d3343783caeaa84c34991134d4f571a2415a;
    stim[2] = 206'h229e95372bd410405a81f0985e11c6465e8e5c4fbecc272f6a56;
    stim[3] = 206'h2e7b6bcb28d4bb1d0b0f0c7f2fe820e5ebd41af797497d5ed646;
    stim[4] = 206'h335e0b15e89293aa10f1c2122281fc0f07e04eba2705a324a7f4;
    stim[5] = 206'h2a98d151f031a0097057d4839515e1cce3694ec8e05aafb781d1;
    stim[6] = 206'h2a4df928f75d7528e9bcf63b8e32288b507971a1dab661d12465;
    stim[7] = 206'h377ba6925e4e35a6f6f756f674d2abaf61fe4544e7c8cf085166;
    stim[8] = 206'h31db1ca8fd683cf57d5ada4aab307d5ca2f4b48c3f6aad99527f;
    stim[9] = 206'h3631f5a30f1a8b32817586af293a5ce610c970e3dc6bfcc2de11;
    stim[10] = 206'h2d55c0b1d280125ab6afe3bb0d96b35641cb9d737dd0924793a2;
    stim[11] = 206'h3bda02cdcf885e2288967f6224007cfbd6d4e107e74281139a2d;
    stim[12] = 206'h3c2fe21ca75cc20eff72c4545baca21304629d09b0f13077893f;
    stim[13] = 206'h3debead308e1d8e3cf1cd32ff4101607afabaeb11714e4b02ef1;
    stim[14] = 206'h25efe38572bb4d2ab2af3a6ba58b790f7802650e8629e2cca312;
    stim[15] = 206'h209880816153ad26fad0037cf377ebd39e7cf92e00293b2d5ba2;
    stim[16] = 206'h3424023c83bcc2d950f15bb7e96c55c35e00f49c0584eda146aa;
    stim[17] = 206'h28d8a163746d591c5e267e846f9b9fcd39c07ec1fe7b7eace554;
    stim[18] = 206'h3cb49e858aac44864289b790c771181b52cabc274318219c8210;
    stim[19] = 206'h3abe9bde922fe57407533380adcb41d42136edcef6973329bfa3;
    stim[20] = 206'h2c321837b137ed65a7aad172993462311537d87769c3b414f393;
    stim[21] = 206'h2c9bd4cdd3379275ada425195c1e24513bad0cdde5f23a250dc8;
    stim[22] = 206'h37ecb766d57844b175450c25491f2c56a0b8706a3803e82d60bd;
    stim[23] = 206'h3d43538f7f725299cbd4e161f345666cb4f9409072db5b68077b;
    stim[24] = 206'h358607899e941454063da6c72aed28791c677b351b4eb7d96fb3;
    stim[25] = 206'h22879e4ad6f87ac153de297bbcc5a4f8a5e38e565b5d4e2ce2a9;
    stim[26] = 206'h3a3d2c0d4091df6598c121319010c9ad20ffa5f58c664a04fa9f;
    stim[27] = 206'h2b6df11a895c6cc3c9be2753b889847b99bf8b35315339c4d93b;
    stim[28] = 206'h249c0f6ac261142e25d6343d3c7d71bc6e9bef2312f9869951f2;
    stim[29] = 206'h333a4a01c5510277440b5b795202f1a504bab462039a28bd586d;
    stim[30] = 206'h2c367f896d27f5e0ca4bcdb4864f8617aa6ccd3ca9bebacefa4e;
    stim[31] = 206'h3ede6cdca8ef52c2c8875a8891f603fb3d7a61539bee67869924;
    stim[32] = 206'h3f94fcc6c77e58f87b1ca8c6cb62743dc8b84ea774b08286b5b0;
    stim[33] = 206'h25f121dbf0b8bb23d4f5d53678660aa87dff2df0a6acc03ed874;
    stim[34] = 206'h31ac2fbf037896b6f06992283fa23d4390159693ffc5546abad2;
    stim[35] = 206'h38e0c68c7c2d3d6e398aeb656e37444372c39c1734709ef893d3;
    stim[36] = 206'h2668b7b9a4e4a35d2f89643ebc538d06846a02bb5f62221f6234;
    stim[37] = 206'h34efe2413d6f6ebc4cb36a59ab50b336083cbaa9bd98626a271b;
    stim[38] = 206'h38f7b3053d0e510c3ce5da892121677a10277d9e3f326cfd6da2;
    stim[39] = 206'h27e50870b83a00b376a5ea2325edf8728989a9cb8a338f746558;
    stim[40] = 206'h2679f80184f3828cbbfe168d71544d6b1e29d60a6ce0929cf2c8;
    stim[41] = 206'h2d16e9cca8fb861b9dd5e474b9bfaecfd663102139a52cd7c422;
    stim[42] = 206'h3b87c1d7da3681f96cf38ce19f9e68a823beab44971e36763448;
    stim[43] = 206'h3b49559c93e9b52214bc40c0ffa8e9a9058ed274baaef13a2c10;
    stim[44] = 206'h2c0c3378c29abb3253321e922129d8b723ba1e3f709982c1a872;
    stim[45] = 206'h38cadb8a2d285787b7dd5c41a8d0b9cefff607ed36780be9096d;
    stim[46] = 206'h2117b1bfc80d6c0bfacfcdc3c13e46265bc4b5af4a76aecc89c6;
    stim[47] = 206'h33d7b96a07020050ae1842e21c41c343c1732795b12bc83f4284;
    stim[48] = 206'h23f83d332d812eb3a0f3ef51b858d59b3840831abbd770246a89;
    stim[49] = 206'h2265cd6cd8c8ca197995c0b64fca3432bdc9a54698220f219583;
    stim[50] = 206'h2d0c203f78a3b6d10047c4b2b38bbe750974e08431d373d56f26;
    stim[51] = 206'h3ff9f5990f77b48a4df41d1b71b86f4e6114c6a5394eda8bfcb9;
    stim[52] = 206'h0a4003a559d9bec727cfb7bab34df5db04905871a61001f3ca86;
    stim[53] = 206'h2ed22e410032e18971266664a134ed7a27730fde519ff1966039;
    stim[54] = 206'h380ab6d7d3b4751294d8afdd8ce86699f8884fb1cc6c3b624521;
    stim[55] = 206'h255edf65b741f0565f4f663d0202d6186676ec0ef0d733a04bdc;
    stim[56] = 206'h3a1a50c168e14679208acc7e57e7f7dc422b0072f055e0a2aa68;
    stim[57] = 206'h2c5bd06ee031bc95b7b5ff6cdc7991e362656f44da84c9359c06;
    stim[58] = 206'h398974cbb57f00227bb33bfd9e52afeb757563d9a663724c7dd6;
    stim[59] = 206'h256ae376dbd24a39415a03ba0ade86b67a16d9d1469a03093733;
    stim[60] = 206'h2cf8b3e9398b3edce47c2aff9f1f9fe8763d2af3468bb48e5220;
    stim[61] = 206'h2477c20ae3f1e2a350a1a631dfede017015e9aa24557562a4270;
    stim[62] = 206'h2569e61b3824444da97789feb95b64b62f4a96da6291f5e5c93f;
    stim[63] = 206'h233b6ad60f475b06c860ad86b7b7ef5ee53da37aa7f137710adc;
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
      expv[0] = 153'h000000000000000000000000000000000000000;
      expv[1] = 153'h000000000000000000000000000000000000000;
      expv[2] = 153'h000000000000000000000000000000000000000;
      expv[3] = 153'h0cc272f6a560a7a54dc85a81f0985c238c8cbc7;
      expv[4] = 153'h1497d5ed64639edaf2cb0b0f0c7f2fd041cbd7b;
      expv[5] = 153'h105a324a7f44d782c57b10f1c2122503f81e0ff;
      expv[6] = 153'h05aafb781d0aa63454787057d483922bc399c64;
      expv[7] = 153'h0b661d12465a937e4a3de9bcf63b8c645116a11;
      expv[8] = 153'h1c8cf0851665dee9a495f6f756f671a5575ec23;
      expv[9] = 153'h16aad99527fc76c72a3c7d5ada4aae60fab9447;
      expv[10] = 153'h06bfcc2de10d8c7d68c3817586af2a74b9cc212;
      expv[11] = 153'h1d0924793a2355702c72b6afe3bb0b2d66ac83a;
      expv[12] = 153'h14281139a2def680b37688967f622000f9f7ac3;
      expv[13] = 153'h0f13077893ef0bf8872aff72c4545f594426084;
      expv[14] = 153'h114e4b02ef1f7afab4c0cf1cd32ff0202c0f5fb;
      expv[15] = 153'h029e2cca31217bf8e15db2af3a6ba316f21ef07;
      expv[16] = 153'h0293b2d5ba202620205dfad0037cf6efd7a73d4;
      expv[17] = 153'h184eda146aa509008f2250f15bb7ead8ab86bce;
      expv[18] = 153'h07b7eace5542362858d95e267e846f373f9a723;
      expv[19] = 153'h118219c821072d27a1644289b790c6e23036a51;
      expv[20] = 153'h0973329bfa3eafa6f7a507533380ab9683a8427;
      expv[21] = 153'h1c3b414f392b0c860deda7aad1729a68c4622b8;
      expv[22] = 153'h1f23a250dc8326f53372ada42519583c48a276e;
      expv[23] = 153'h003e82d60bcdfb2dd9b475450c254a3e58ad414;
      expv[24] = 153'h0db5b68077bf50d4e3dacbd4e161f68accd9689;
      expv[25] = 153'h14eb7d96fb3d6181e264063da6c72dda50f2399;
      expv[26] = 153'h15d4e2ce2a98a1e792b253de297bb98b49f14a9;
      expv[27] = 153'h0664a04fa9ee8f4b035798c121319021935a41a;
      expv[28] = 153'h15339c4d93aadb7c46a4c9be2753b91308f7338;
      expv[29] = 153'h0f9869951f212703dab425d6343d38fae378dd1;
      expv[30] = 153'h19a28bd586dcce928072440b5b795405e34a091;
      expv[31] = 153'h1bebacefa4e30d9fe25dca4bcdb4849f0c2f55c;
      expv[32] = 153'h1ee678699247b79b372ac8875a8893ec07f67a9;
      expv[33] = 153'h0b08286b5b07e53f31b07b1ca8c6cec4e87b912;
      expv[34] = 153'h0acc03ed87417c4876fbd4f5d53678cc1550fbb;
      expv[35] = 153'h1c5546abad246b0befc6f06992283f447a8720b;
      expv[36] = 153'h0709ef893d2e3831a31d398aeb656c6e8886e4a;
      expv[37] = 153'h162221f623419a2dee6b2f89643eb8a71a0d09f;
      expv[38] = 153'h198626a271ad3bf8904e4cb36a59aea1666c116;
      expv[39] = 153'h1326cfd6da263decc1493ce5da892242cef420f;
      expv[40] = 153'h0338f7465581f9421c2876a5ea2323dbf0e5125;
      expv[41] = 153'h0e0929cf2c819e7e0062bbfe168d72a89ad63c6;
      expv[42] = 153'h1a52cd7c422345ba732e9dd5e474bb7f5d9fad0;
      expv[43] = 153'h11e367634486e1f075f16cf38ce19f3cd150463;
      expv[44] = 153'h0aef13a2c106d255672514bc40c0ff51d3520b9;
      expv[45] = 153'h09982c1a8723030cde3353321e922253b16e47c;
      expv[46] = 153'h0780be9096de32b6e28fb7dd5c41a9a1739dff7;
      expv[47] = 153'h076aecc89c6045ec6ff4facfcdc3c27c8c4cb75;
      expv[48] = 153'h12bc83f42844f5ee5a80ae1842e218838687828;
      expv[49] = 153'h1d770246a898fe0f4ccea0f3ef51b8b1ab3670d;
      expv[50] = 153'h0220f219582899735b327995c0b64f9468657a0;
      expv[51] = 153'h1d373d56f26343080fde0047c4b2b7177cea120;
      expv[52] = 153'h000000000000000000000000000000000000000;
      expv[53] = 153'h000000000000000000000000000000000000000;
      expv[54] = 153'h19ff1966038bb48b904171266664a269daf44ec;
      expv[55] = 153'h06c3b624520e02adb5f594d8afdd89d0cd33f1a;
      expv[56] = 153'h0d733a04bdc157b7d9685f4f663d0405ac30cc4;
      expv[57] = 153'h055e0a2aa6868694305e208acc7e57cfefb8858;
      expv[58] = 153'h084c9359c06316f41bbcb7b5ff6cd8f323c6c41;
      expv[59] = 153'h063724c7dd66625d32e87bb33bfd9ca55fd6eaf;
      expv[60] = 153'h09a0309373395ab8ddb2415a03ba0dbd0d6cf4b;
      expv[61] = 153'h08bb48e522033e2cfa4ee47c2aff9e3f3fd0edb;
      expv[62] = 153'h157562a427011df082ba50a1a631dfdbc02e032;
      expv[63] = 153'h091f5e5c93f95a7986cca97789febab6c96c5ed;
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
