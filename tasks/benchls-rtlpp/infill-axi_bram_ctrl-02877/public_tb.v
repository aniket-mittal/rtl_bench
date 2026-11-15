// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 167;
  localparam OW = 118;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02877 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(in_vec[166:166]),
    .s_axi_awid(in_vec[165:154]),
    .s_axi_awaddr(in_vec[153:141]),
    .s_axi_awlen(in_vec[140:133]),
    .s_axi_awsize(in_vec[132:130]),
    .s_axi_awburst(in_vec[129:128]),
    .s_axi_awlock(in_vec[127:127]),
    .s_axi_awcache(in_vec[126:123]),
    .s_axi_awprot(in_vec[122:120]),
    .s_axi_awvalid(in_vec[119:119]),
    .s_axi_wdata(in_vec[118:87]),
    .s_axi_wstrb(in_vec[86:83]),
    .s_axi_wlast(in_vec[82:82]),
    .s_axi_wvalid(in_vec[81:81]),
    .s_axi_bready(in_vec[80:80]),
    .s_axi_arid(in_vec[79:68]),
    .s_axi_araddr(in_vec[67:55]),
    .s_axi_arlen(in_vec[54:47]),
    .s_axi_arsize(in_vec[46:44]),
    .s_axi_arburst(in_vec[43:42]),
    .s_axi_arlock(in_vec[41:41]),
    .s_axi_arcache(in_vec[40:37]),
    .s_axi_arprot(in_vec[36:34]),
    .s_axi_arvalid(in_vec[33:33]),
    .s_axi_rready(in_vec[32:32]),
    .bram_rddata_a(in_vec[31:0]),
    .s_axi_awready(out_vec[117:117]),
    .s_axi_wready(out_vec[116:116]),
    .s_axi_bid(out_vec[115:104]),
    .s_axi_bresp(out_vec[103:102]),
    .s_axi_bvalid(out_vec[101:101]),
    .s_axi_arready(out_vec[100:100]),
    .s_axi_rid(out_vec[99:88]),
    .s_axi_rdata(out_vec[87:56]),
    .s_axi_rresp(out_vec[55:54]),
    .s_axi_rlast(out_vec[53:53]),
    .s_axi_rvalid(out_vec[52:52]),
    .bram_rst_a(out_vec[51:51]),
    .bram_clk_a(out_vec[50:50]),
    .bram_en_a(out_vec[49:49]),
    .bram_we_a(out_vec[48:45]),
    .bram_addr_a(out_vec[44:32]),
    .bram_wrdata_a(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 167'h2acb6b5f8e9f0ca43c72a3347516b91c2c91add36b;
    stim[1] = 167'h2793e2b5e9880a9a4559c7a713846d2014aeebf3a0;
    stim[2] = 167'h5dd2380faa622b35c2dcf447a5bf4300b2e598e4e8;
    stim[3] = 167'h6788dbf7577c12dae26416bb92b1fac5edeba2f059;
    stim[4] = 167'h75dae9f43964429d2d6ce10d1708deb87a7d541080;
    stim[5] = 167'h4a27a3b5b6788f0d135be78cc8ce1b80c95e2c6d13;
    stim[6] = 167'h69bec5d7cc7f55a58e9175972dcf4623f574a0cddf;
    stim[7] = 167'h6ac3d27e2d97289ef84a9f5ecba9657fbc7faf8232;
    stim[8] = 167'h4578ae7087479f321535aa7b0f673610fd35b2d14b;
    stim[9] = 167'h731bb10434c68a13a847147d2c3535557d8dba9440;
    stim[10] = 167'h4dc82c5bf5102ae8664fad9097839caf39a5744055;
    stim[11] = 167'h52b71f5ce188112506f8b9664e66cad3eb763704c0;
    stim[12] = 167'h56112890cf13f141365eb0e078c6608036c8afafb5;
    stim[13] = 167'h62471ec2ce8015cf8251dc35f0995ae3f5a7059695;
    stim[14] = 167'h53773a69c5f50ff406d30ce209971d6cbb65a44cc0;
    stim[15] = 167'h67dd5c0216a4d9080b0c8c8157939cde93c230e2f4;
    stim[16] = 167'h505cdbeeed11faebc69b5b16bf28248fa12e37afa2;
    stim[17] = 167'h4e6e21598b2812c1840b13d2e1512da77bec264c81;
    stim[18] = 167'h54be32eae79197c9aeb1c70d42b249f99cc60a676c;
    stim[19] = 167'h5be293f883d206119ede77dd2acee061a5365327f5;
    stim[20] = 167'h57fb3300719fa4ac0f8237f3f6bf70b5fd22267b8a;
    stim[21] = 167'h7a4231b6733b94e1a59a1453e695045cef7284b4dd;
    stim[22] = 167'h4d5d1c003a49704e13cb46668d63482a47ae458b49;
    stim[23] = 167'h7434036a2aff5bc7b8851810d6054168d9d9d0cba5;
    stim[24] = 167'h7dd51bba3966704044bab8c11c4080c5986253ee5d;
    stim[25] = 167'h423c37b2d03fbc695d29509e93cf4614b55766a292;
    stim[26] = 167'h7f9a544d300860534242042e950be77f92703b4a25;
    stim[27] = 167'h5c4d547ab6e07f4f2c78fdba6ed56c1e85157b60e8;
    stim[28] = 167'h41fd1f58e41a6fcff0c86cd932ad7fbb95d79334cd;
    stim[29] = 167'h5f6a77f888559e8ae01b3363d1e007d22321297ce2;
    stim[30] = 167'h608b00a3900cf3e73cdd101233a54303dce8e5db78;
    stim[31] = 167'h5f610237b4b345f9f352cc52c85416910112f4bece;
    stim[32] = 167'h4b295cb88138667dc06d803190737fc8fb560ecf86;
    stim[33] = 167'h7dbca88322256dc1ef57b174aeeeecd86592123c84;
    stim[34] = 167'h0bb349567e1c2361c4dfcb2e691c4e6434e43322a2;
    stim[35] = 167'h658c7d378e62b01c3033aff4b0d5ef4622e2131ebc;
    stim[36] = 167'h452bef1e27fa288dc7f51dfd7418d940d5206c09da;
    stim[37] = 167'h51957da8f61b865d98c943b722d637cdcb67956151;
    stim[38] = 167'h4454b384256eb79c6640dba81640878d512af79688;
    stim[39] = 167'h50347a53f6b70fd93d967ee6806023f9a4b326beb8;
    stim[40] = 167'h629ebb4bcb2c27b6b54b0b83cc9264b93f9ce5f02d;
    stim[41] = 167'h75c575368fcff56f9dab64f9e65de61acc6f01fcca;
    stim[42] = 167'h5a222d268ffd4d3f7877958bdc66662bb47309711d;
    stim[43] = 167'h76f1cfe80702d908052ae86486054f8aad904a4bc2;
    stim[44] = 167'h4fc34f07027b9cb61b477503054fad95694785a28b;
    stim[45] = 167'h4a1c856eb4ea3c8c7c36ea62bba984eab2bf7de471;
    stim[46] = 167'h59e44e1c9ea1aa06bcbc0906b41fd7154daf3531cb;
    stim[47] = 167'h72a15762771b0a0093639397b3abe1061e5cdea2dd;
    stim[48] = 167'h6c564ab41c9d77e7812d2f613357684a2b7ad7f44d;
    stim[49] = 167'h4801e978f17fee485bf00bf4c32e2c346c5d52e113;
    stim[50] = 167'h6906aee6a358b99d9f391165a01ae9e3c2aec4c80f;
    stim[51] = 167'h52d63d42cc69484b1cabf91c57476bef575102511b;
    stim[52] = 167'h7796268be5776a4667be8c1d8afffc7cfe9bbddbd5;
    stim[53] = 167'h62e8948c74aa8fa3775ad0d972f42e6a6f4f1d7fe9;
    stim[54] = 167'h4e68eafa42d4d3c9fffef786b2d344cc1b221dc82a;
    stim[55] = 167'h61e558fd28e7c815cbaef1d040589ce1fd2061492b;
    stim[56] = 167'h5d9db8087c922c0aa3c3503b25dccbac8245f049fa;
    stim[57] = 167'h5eed6e477948e39488b660d25d79a2600f66f4afe2;
    stim[58] = 167'h6837468ebc51e6d3a839a5398cc669c0989adc1484;
    stim[59] = 167'h7d7ad490bb58a7d9c16bb8e9e0cca800bb2664f782;
    stim[60] = 167'h72c3d21d3f2178de8516616cd79552cbfedb8af601;
    stim[61] = 167'h4695a6aa2d72d794b5910d3bdb09394712d9e2098d;
    stim[62] = 167'h6809689d20f51092ededb5266d4b6d1f19d4269319;
    stim[63] = 167'h6b8414af4baee975354328416be61a238434df3e44;
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
      expv[0] = 118'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 118'h000000000000000000000000000000;
      expv[2] = 118'h000000000000000000000000000000;
      expv[3] = 118'h0000147a0000000006000000000000;
      expv[4] = 118'h1000047aeba2f059040b7e00000000;
      expv[5] = 118'h000010d1eba2f059064b7e25b5c4c8;
      expv[6] = 118'h300000d15e2c6d13064e1125b5c4c8;
      expv[7] = 118'h000000d174a0cddf059d1d1e1a26b7;
      expv[8] = 118'h100000d174a0cddf059d1d1e1a26b7;
      expv[9] = 118'h300000d135b2d14b067d1d513df095;
      expv[10] = 118'h200000d18dba9440066573513df095;
      expv[11] = 118'h000000d1a5744055046573513df095;
      expv[12] = 118'h00001664763704c0066573513df095;
      expv[13] = 118'h20001664763704c0067ccd513df095;
      expv[14] = 118'h00000664a7059695046944513df095;
      expv[15] = 118'h00001e2065a44cc0066944513df095;
      expv[16] = 118'h20001e20c230e2f406732e513df095;
      expv[17] = 118'h30000e202e37afa2066ae0513df095;
      expv[18] = 118'h10001d2eec264c81076ae0f5d78d36;
      expv[19] = 118'h352f2d2eec264c810762a2f5d78d36;
      expv[20] = 118'h152f0d2e365327f5057197f5d78d36;
      expv[21] = 118'h35fe2d2e22267b8a077197f5d78d36;
      expv[22] = 118'h25fe353e7284b4dd077998f5d78d36;
      expv[23] = 118'h15fe353eae458b49076d2af5d78d36;
      expv[24] = 118'h05fe253ed9d0cba5050d2ae09c2796;
      expv[25] = 118'h05fe253ed9d0cba5050d2ae09c2796;
      expv[26] = 118'h25fe253e5766a292070d2ae09c2796;
      expv[27] = 118'h05fe32e95766a2920701bde09c2796;
      expv[28] = 118'h05fe02e9157b60e8050a17e09c2796;
      expv[29] = 118'h05fe02e9d79334cd050a17e09c2796;
      expv[30] = 118'h35fe163d21297ce2070a17e09c2796;
      expv[31] = 118'h25fe063d21297ce206c3c03d15c036;
      expv[32] = 118'h05fe063d12f4bece04c3c03d15c036;
      expv[33] = 118'h05fe1319560ecf8606c3c03d15c036;
      expv[34] = 118'h05fe031992123c8404c0e63d15c036;
      expv[35] = 118'h000000000000000000000000000000;
      expv[36] = 118'h30001f4b0000000006000000000000;
      expv[37] = 118'h00000f4b206c09da04a1ab60386067;
      expv[38] = 118'h30001b726795615106a1ab60386067;
      expv[39] = 118'h30000b722af796880705ac0cbb3192;
      expv[40] = 118'h140d2b722af796880505ac0cbb3192;
      expv[41] = 118'h140d183c9ce5f02d0705ac0cbb3192;
      expv[42] = 118'h240d083c9ce5f02d0719240cbb3192;
      expv[43] = 118'h040d083c9ce5f02d050ba90cbb3192;
      expv[44] = 118'h240d083c904a4bc2070ba90cbb3192;
      expv[45] = 118'h240d083c4785a28b070e7f0cbb3192;
      expv[46] = 118'h140d162b4785a28b070e7f0cbb3192;
      expv[47] = 118'h240d062baf3531cb07b7537918f86d;
      expv[48] = 118'h140d197baf3531cb07a2707918f86d;
      expv[49] = 118'h1b15397b7ad7f44d064757140126c7;
      expv[50] = 118'h3b15097b7ad7f44d064757140126c7;
      expv[51] = 118'h2b15165a7ad7f44d064f4b140126c7;
      expv[52] = 118'h0b15165a5102511b064035140126c7;
      expv[53] = 118'h0b15165a5102511b064035140126c7;
      expv[54] = 118'h2b15165a4f1d7fe9064035140126c7;
      expv[55] = 118'h3b15165a221dc82a0644a4140126c7;
      expv[56] = 118'h2b15065a2061492b07c4a4a793fffd;
      expv[57] = 118'h0b1513b22061492b07c4a4a793fffd;
      expv[58] = 118'h2b1513b266f4afe207cbb9a793fffd;
      expv[59] = 118'h2b1503b266f4afe207cb72a793fffd;
      expv[60] = 118'h2b151e9e2664f78207cb72a793fffd;
      expv[61] = 118'h0b151e9e2664f78207c199a793fffd;
      expv[62] = 118'h2b151e9e2664f78207c199a793fffd;
      expv[63] = 118'h0b150e9ed426931905cd35a793fffd;
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
