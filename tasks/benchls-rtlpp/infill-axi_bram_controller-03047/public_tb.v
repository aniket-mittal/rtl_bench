// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 147;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03047 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(in_vec[146:146]),
    .s_axi_awaddr(in_vec[145:131]),
    .s_axi_awlen(in_vec[130:123]),
    .s_axi_awsize(in_vec[122:120]),
    .s_axi_awburst(in_vec[119:118]),
    .s_axi_awlock(in_vec[117:117]),
    .s_axi_awcache(in_vec[116:113]),
    .s_axi_awprot(in_vec[112:110]),
    .s_axi_awvalid(in_vec[109:109]),
    .s_axi_wdata(in_vec[108:77]),
    .s_axi_wstrb(in_vec[76:73]),
    .s_axi_wlast(in_vec[72:72]),
    .s_axi_wvalid(in_vec[71:71]),
    .s_axi_bready(in_vec[70:70]),
    .s_axi_araddr(in_vec[69:55]),
    .s_axi_arlen(in_vec[54:47]),
    .s_axi_arsize(in_vec[46:44]),
    .s_axi_arburst(in_vec[43:42]),
    .s_axi_arlock(in_vec[41:41]),
    .s_axi_arcache(in_vec[40:37]),
    .s_axi_arprot(in_vec[36:34]),
    .s_axi_arvalid(in_vec[33:33]),
    .s_axi_rready(in_vec[32:32]),
    .bram_rddata_a(in_vec[31:0]),
    .s_axi_awready(out_vec[95:95]),
    .s_axi_wready(out_vec[94:94]),
    .s_axi_bresp(out_vec[93:92]),
    .s_axi_bvalid(out_vec[91:91]),
    .s_axi_arready(out_vec[90:90]),
    .s_axi_rdata(out_vec[89:58]),
    .s_axi_rresp(out_vec[57:56]),
    .s_axi_rlast(out_vec[55:55]),
    .s_axi_rvalid(out_vec[54:54]),
    .bram_rst_a(out_vec[53:53]),
    .bram_clk_a(out_vec[52:52]),
    .bram_en_a(out_vec[51:51]),
    .bram_we_a(out_vec[50:47]),
    .bram_addr_a(out_vec[46:32]),
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
    stim[0] = 147'h2e9f4f05e7cffee6ad9abb5e9ba705d3376f3;
    stim[1] = 147'h2f69794adde35143e1e29f734812894aad7ec;
    stim[2] = 147'h7437cc1c939c75f82182e9fdadf19fd34f19c;
    stim[3] = 147'h54dd5a16b44974ba146576677ebe948af4ace;
    stim[4] = 147'h71e7a649fa7f7c2296e7f8d7cdb884afdfc87;
    stim[5] = 147'h4f0d4043cc04b91a49665929ed0dc910734d1;
    stim[6] = 147'h6782e3564c238d3907da9c3ae1bf0f3f9adb7;
    stim[7] = 147'h736785d4d918a12cc399199685ae51ac7e42f;
    stim[8] = 147'h7ce80ba6aeb59a43ccc0bed30764b8443dc3d;
    stim[9] = 147'h747fec0022474cbfbcecec37a3681d3d3503d;
    stim[10] = 147'h5df6336666c07921ba0acd5020f169e73b2dd;
    stim[11] = 147'h7f9a0ab718290b3bf4784ce7526f68d010acf;
    stim[12] = 147'h593da9ac0ffc48e21603f98bdaac8e42b3e13;
    stim[13] = 147'h75bf499bf5e099bdf6a69869cb80daabc97df;
    stim[14] = 147'h578773ab347d434627865c3d5277905eb4a5e;
    stim[15] = 147'h651cdeed27757da086c4769fc7f57318ef415;
    stim[16] = 147'h67bccab468abb2f788ed47538db54976f7fb7;
    stim[17] = 147'h59d4fcd15a1f79df196ac17751e5a57c8652a;
    stim[18] = 147'h62fa74e721a6827d78a94a1d8ce712abfa6f5;
    stim[19] = 147'h4143e15a5e6d120c34428bd340ea1e8286cf2;
    stim[20] = 147'h5c2120bbe03c70d053be9b816d7af96a7df85;
    stim[21] = 147'h4ce565b883551cf7fcd03d3c0217c56fa6736;
    stim[22] = 147'h706b5a35074dc65f995e7706b3ea03b03c96e;
    stim[23] = 147'h7da6e96fa77a649010eb41f20884e638590fa;
    stim[24] = 147'h5a43b77e8d894fd39edb4d090d4728f982cf8;
    stim[25] = 147'h768b00f800c89ce535094c56a9a9b6b20fd0c;
    stim[26] = 147'h4e5767f676395a8c297b92104147b7b25c1a1;
    stim[27] = 147'h70c82a1d5bf507ff5ce86a26878512b6c47d2;
    stim[28] = 147'h6666c20d60768bc1230aa75ed2fa338594a31;
    stim[29] = 147'h678ee1cef3b5e8f5a6785a993c33658930046;
    stim[30] = 147'h7ee821886ae4b2566080c0df22083862bd4f5;
    stim[31] = 147'h58fba9d409b4179202283c6a72aee81eb1a0a;
    stim[32] = 147'h408ad0fef54533cd23f3a550056e7775b1fbb;
    stim[33] = 147'h47946286c2fed47a85cd9333f1999ff729e23;
    stim[34] = 147'h5146be59599126df6d5a117ea58fc26347c80;
    stim[35] = 147'h52d8f10292968264c8e006a7644678f4663f6;
    stim[36] = 147'h674d52f85bf150a9fb7000362cd90bd6d56f6;
    stim[37] = 147'h4b8cdcbde01a011fad4aba2dba919511c877f;
    stim[38] = 147'h64b10eb07703c009cc02bb7488ee094bdd698;
    stim[39] = 147'h4448a684922e47da0492dc4435605be9b4f95;
    stim[40] = 147'h53ab2b11c2be72b7609b9cf0f43d68ba522eb;
    stim[41] = 147'h4217a097591b348c45ccce3f84eb3146cead7;
    stim[42] = 147'h6e606d70b560a723a06c12a09c0e865c27d73;
    stim[43] = 147'h55ed5622cf0f4375b19b1fb29780d13966b55;
    stim[44] = 147'h553af5b82aca62816c1054e5da6ec8c6a0315;
    stim[45] = 147'h68184155446c80ef0ff4f63482533ca40a2ff;
    stim[46] = 147'h7e0786a489cc5f5031cab04a4df0b484afb26;
    stim[47] = 147'h4ca648da354a5c9f887c06e3c70eb1a4b02da;
    stim[48] = 147'h5db5f66852b260afe00a1fd4796734d23eb01;
    stim[49] = 147'h5503a6de600b1446341aa182feba6ff1a029e;
    stim[50] = 147'h5cbe9462a2c67ee16678574407a2d1ba6a617;
    stim[51] = 147'h719bb05f40bda629b8735a23bccaad78c09db;
    stim[52] = 147'h716b77ce23f952ef8df5d0f467986f263aff4;
    stim[53] = 147'h48bdca1f8443b58c7709e34fe7009f60c4f9b;
    stim[54] = 147'h4c9b63eb1a1ac2d7c82fa8ec5e1ebaa695954;
    stim[55] = 147'h542cb8789b66005ee4e122c31b6396647c1c2;
    stim[56] = 147'h67bfbde0918bc702e55a4202dab96bab5b867;
    stim[57] = 147'h74f82e51d28f60a54e2752a602b5e68363192;
    stim[58] = 147'h68f36805d43be3041ac175ba2d536b42cebd8;
    stim[59] = 147'h7dc2c604944b55c18c2ce8cbae56c3d60189a;
    stim[60] = 147'h7a63de80fee0466e9e78ee33eca3ed4cf9512;
    stim[61] = 147'h6b952fb2b9cd9714e5925d4c34070efbefaa5;
    stim[62] = 147'h5a3a98cbdc0e3e9a392b99e6601bce7f2fe90;
    stim[63] = 147'h54dbfdb4d8540acf2ef461b9aa1bcb23c8cb3;
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
      expv[0] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 96'h000000000020000000000000;
      expv[2] = 96'h000000000020000000000000;
      expv[3] = 96'h83f4d3c67018686fce3afc10;
      expv[4] = 96'h0122bd2b38102ecc24ba5d0a;
      expv[5] = 96'h812bf7f21c1863cf3fbe114b;
      expv[6] = 96'h02441cd344104b25025c8d24;
      expv[7] = 96'h4bcfe6b6dc10538711c69c83;
      expv[8] = 96'h486b1f90bc1023328c509661;
      expv[9] = 96'h86110f70f45879d05acd21e6;
      expv[10] = 96'hc34f4d40f41be8ff23a65fde;
      expv[11] = 96'hc679cecb74583bec603c90dd;
      expv[12] = 96'h4e34042b3c58099c14859dfa;
      expv[13] = 96'h8390acf84c18327bfe24710b;
      expv[14] = 96'h02aaf25f7c10530df04cdefb;
      expv[15] = 96'h0017ad2978104b873ea1a313;
      expv[16] = 96'h84c63bd054584a39babed043;
      expv[17] = 96'h425dbdfedc1028ea55d97bc4;
      expv[18] = 96'hc55f2194a85db3a90fbcef8c;
      expv[19] = 96'h40aafe9bd4102943d3413ebc;
      expv[20] = 96'h83a0a1b3c81802873689061a;
      expv[21] = 96'h4e5a9f7e145853701e386829;
      expv[22] = 96'h815be99cd81819caaa8e7bfe;
      expv[23] = 96'hc8ec0f25b81d60d6a6e32fcc;
      expv[24] = 96'hc58e1643e85bfb4dbd324808;
      expv[25] = 96'h4e3e60b3e05869a1c4a7e9cf;
      expv[26] = 96'h45ac83f43058298a644e729a;
      expv[27] = 96'hcdec9706845d9cae1cad4614;
      expv[28] = 96'hc0adb11f481be190fa83ffae;
      expv[29] = 96'h44e16528c45854eb3b45e091;
      expv[30] = 96'hcd624c011859cf1ddaf47ad3;
      expv[31] = 96'h8618af53d4587dd072592b30;
      expv[32] = 96'h4607ac682858078dda0bc901;
      expv[33] = 96'h05dd6c7eecd874aaa299e691;
      expv[34] = 96'hc3fdca788c1f0f287f6a3d42;
      expv[35] = 96'h4898d1f20010422fc8936fb6;
      expv[36] = 96'h863d198fd85825b14b413264;
      expv[37] = 96'h82f5b55bd8184e9af8a854fd;
      expv[38] = 96'h4144721dfc1057450d008fd6;
      expv[39] = 96'h8252f75a6018496281e004e6;
      expv[40] = 96'h82fa6d3e541808911723ed02;
      expv[41] = 96'hce2e948bac5a27565f395bb0;
      expv[42] = 96'h4451b3ab5c5819c78d9a4622;
      expv[43] = 96'h419709f5cc100254b05391d0;
      expv[44] = 96'hc84e59ad541e2bda87a1bad8;
      expv[45] = 96'h8231a80c54182a75653140b6;
      expv[46] = 96'h0729028bfc581ec636407787;
      expv[47] = 96'h45212bec98585609e62fa818;
      expv[48] = 96'h4c692c0b685800dca52e4fc4;
      expv[49] = 96'hc5348fac04583b6b593057f0;
      expv[50] = 96'h4ffc680a78585430058a231a;
      expv[51] = 96'hc86e9a985c19b97d633f70b3;
      expv[52] = 96'h075e30276c586b445ed314dc;
      expv[53] = 96'h87c98ebfd05862d6fca977c6;
      expv[54] = 96'h43d8313e6c103c6921dac63b;
      expv[55] = 96'hc6a9a565505899360d616be4;
      expv[56] = 96'h81991f0708182859b3002f72;
      expv[57] = 96'h4eead6e19c584840c5e38172;
      expv[58] = 96'h85a0d8c6485869f047b052a7;
      expv[59] = 96'h06d0b3af60582eb71df1820d;
      expv[60] = 96'h40f5806268101d1925aae0c6;
      expv[61] = 96'hcf533e544859f4c77023374f;
      expv[62] = 96'h03befbea94104ba9e6cb8a72;
      expv[63] = 96'h439fcbfa4010733c071f4d1c;
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
