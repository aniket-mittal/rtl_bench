// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 153;
  localparam OW = 152;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03297 dut (
    .aclk(clk),
    .aresetn(in_vec[152:152]),
    .s_axi_awaddr(in_vec[151:120]),
    .s_axi_awprot(in_vec[119:117]),
    .s_axi_awvalid(in_vec[116:116]),
    .s_axi_wdata(in_vec[115:84]),
    .s_axi_wstrb(in_vec[83:80]),
    .s_axi_wvalid(in_vec[79:79]),
    .s_axi_bready(in_vec[78:78]),
    .s_axi_araddr(in_vec[77:46]),
    .s_axi_arprot(in_vec[45:43]),
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
    .s_axi_awready(out_vec[151:151]),
    .s_axi_wready(out_vec[150:150]),
    .s_axi_bresp(out_vec[149:148]),
    .s_axi_bvalid(out_vec[147:147]),
    .s_axi_arready(out_vec[146:146]),
    .s_axi_rdata(out_vec[145:114]),
    .s_axi_rresp(out_vec[113:112]),
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
    stim[0] = 153'h0247847e1bc83c3243be8da88d8d2f4eb737775;
    stim[1] = 153'h0822ea63e28a131a65b93370ec998382ac52509;
    stim[2] = 153'h188e0090ebbcf5febe89538c5f19592f806797b;
    stim[3] = 153'h125f3d2d9b5730569db703c4f572d3abf5f9f05;
    stim[4] = 153'h1b0e56866dcd4603ef661f4a6d7b063d4d37fcb;
    stim[5] = 153'h1e6f86cec47a6a7579e15f26ab02a81bbb1c1be;
    stim[6] = 153'h104af7f6debc6268c0ae1094a6091ef7a3a8335;
    stim[7] = 153'h147a8450d3df1efcbee42af7cbe017a76119b43;
    stim[8] = 153'h155ece1deaabe1224f4201af428051f62605b0c;
    stim[9] = 153'h1432896ec72fe1fcd212820741a44f320da90f2;
    stim[10] = 153'h18bdd8f4c11370053c8eaa30ddbe906591b94c8;
    stim[11] = 153'h11f0f67c517ddcd9d254601653199b50953b906;
    stim[12] = 153'h1a2283cda318c7969c5e488c1398abdc80a07d7;
    stim[13] = 153'h1597e6925ef0554a9f8e7f4ddc77bf81356fb38;
    stim[14] = 153'h1c1b798bfed9aeaba63c798f1f34ba99fc5c392;
    stim[15] = 153'h13e49bc0fdf4335b18e570cba15931254fceae0;
    stim[16] = 153'h131b797fb2dff461926c0d4f4b7625533874e84;
    stim[17] = 153'h1af1bec2ffeec6a33debc74be9c5e6641f2467d;
    stim[18] = 153'h11b901a98c746113e618a8c2a07c6419d8ef020;
    stim[19] = 153'h16747abaa5cd690cfca1b18bc1328b89859bffb;
    stim[20] = 153'h150060c047f1d445965e946ca7b4602476c1c92;
    stim[21] = 153'h13606ce77b20687866dcb72c670bfdfe4f36d46;
    stim[22] = 153'h18a21f89da39ae6a2771ff51d88c234bdc51135;
    stim[23] = 153'h1c41f1019736023484e418a5775e0d3dba75ab3;
    stim[24] = 153'h1edd7e649166fb36a7310b940179104ee59118c;
    stim[25] = 153'h16a3cedcf6141b08df956aae0aa389c0d58f1fe;
    stim[26] = 153'h1e071695e085e02bbd6efabf7ce49afe6b8bc28;
    stim[27] = 153'h1483b1ce7de19e7c3d645aa8b9e9ed28883e7a1;
    stim[28] = 153'h1a33ba9ffad75ed73cfef7d982a97137a90617e;
    stim[29] = 153'h14cd7d26d4f64a6e7fe0bce141d53b51fafb4a2;
    stim[30] = 153'h1c326999a2aeae410dbd331b1f41b530767d9f4;
    stim[31] = 153'h19591ac3cc312dffda426b8dd3144f4bdd11105;
    stim[32] = 153'h1f464b11b4661e3f0be96668883790cc550ed04;
    stim[33] = 153'h1edd07e000b34396404133a9fdc119ac88a6836;
    stim[34] = 153'h153dce21f68c2b118fb39e99354d66304d4d0e5;
    stim[35] = 153'h128f3b97459ccc1f581900bd8220e47d4764671;
    stim[36] = 153'h176a51da11cf678eba8986f7ec4e452877ef7ad;
    stim[37] = 153'h1c9aab258c011a6d5395c57dcbe5b7d3547ccd3;
    stim[38] = 153'h1fce327831b46b730e8bb02ff11ca681bb7d031;
    stim[39] = 153'h1f8f91b06d8f52330e69a36b57bab8cca52e67e;
    stim[40] = 153'h10b4b0d3db8579e1a63719ed96eb63ad67ea491;
    stim[41] = 153'h162f67d9268b2443fff0c1a532f93c5ce0d1308;
    stim[42] = 153'h1814bd63a1016b83b247e1f947551b144f47519;
    stim[43] = 153'h1434205ac09e2d093cffb1732e863b955f31fc4;
    stim[44] = 153'h1caf9360cb1e6252fe97d277838af17178c697f;
    stim[45] = 153'h11c8340450a66b3c19db028fbcc243f8896b59d;
    stim[46] = 153'h15b52db5dab7c7a41b70029406ff00e82077e6b;
    stim[47] = 153'h17b2e8e01e4d4f88e998e02907b8b7096585b81;
    stim[48] = 153'h116f072f1d39c7a12406ed76a2ef45014e9baf2;
    stim[49] = 153'h19f10a357b08d44a22c6d02bd4c94f87dd9827c;
    stim[50] = 153'h1ebc840dbd59f522a410f261c4b1f00afdaa770;
    stim[51] = 153'h1e42b6f09757b9a1a8b041ce027539ca1dab64f;
    stim[52] = 153'h107b8a7d2b7dad526f61c5f5efd03265976cebe;
    stim[53] = 153'h1d635b56f5fa22cff17781a70522f87de4009a1;
    stim[54] = 153'h12305027665e123e420e322fb894aa3d31f3cca;
    stim[55] = 153'h133e38d9792ccef3ac0f844a569acabec9cdf57;
    stim[56] = 153'h13b795c24dde7926e04678f641353c6ff387da3;
    stim[57] = 153'h1436f91d53de8755a2966571f4d9846e080106f;
    stim[58] = 153'h139aaae518b0ddc298a945d12db7ff891a759f8;
    stim[59] = 153'h00cc36a358e93a75d63b2caff7082436a0c2451;
    stim[60] = 153'h10467baf9860f4ec043ae8bae6ce35d0a101dc4;
    stim[61] = 153'h19a8a2c087806bd41528bba4267067779b346b0;
    stim[62] = 153'h126bcad400f787523ba865956038f02e92a2df4;
    stim[63] = 153'h103b263164c4c6b70a902583c8964aa6acc5bb6;
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
      expv[0] = 152'hfe75b9bbba8000000000000000000000000000;
      expv[1] = 152'hdc156292848000000000000000000000000000;
      expv[2] = 152'hcd7c033cbd8000000000000000000000000000;
      expv[3] = 152'h195fafcf82c47004875de7aff5f46a9c62f8cb;
      expv[4] = 152'hb5ea69bfe5c470048755e7aff5f44a9c62f8c9;
      expv[5] = 152'h04ddd8e0df5872b4336de7aff5f44a9c62f8c9;
      expv[6] = 152'h77bd1d419ad872b4336de7aff5f40a9c62f8c8;
      expv[7] = 152'hbd3b08cda1d872b43365e31346054a9c62f8c9;
      expv[8] = 152'h0fb1302d8623d422869de31346056a9c62f8c9;
      expv[9] = 152'hb9906d487923d4228695e3134605700d7a1403;
      expv[10] = 152'h432c8dca6421944b763de3134605300d7a1403;
      expv[11] = 152'h9a84a9dc8321944b76309b8029e4500d7a1403;
      expv[12] = 152'h5ae40503eb8f87b3e2889b8029e4300d7a1403;
      expv[13] = 152'h3c09ab7d9c0f87b3e288c63cb4e2d00d7a1400;
      expv[14] = 152'hd4cfe2e1c90f87b3e280c63cb4e2b00d7a1400;
      expv[15] = 152'h8d2a7e75700f87b3e286cd755d31d00d7a1400;
      expv[16] = 152'h2e99c3a7421f24de07eecd755d31f00d7a1400;
      expv[17] = 152'h3720f9233e9f24de07eecd755d31d00d7a1400;
      expv[18] = 152'h20cec778101f24de07eecd755d31de3a5f4e2f;
      expv[19] = 152'h184c2cdffd9f24de07eecd755d31de3a5f4e2e;
      expv[20] = 152'h4523b60e491f24de07eecd755d31be3a5f4e2d;
      expv[21] = 152'h2bf279b6a31f24de07ef8ea22cb2d4a3653da2;
      expv[22] = 152'hde5ee2889a9f24de07e78ea22cb2b4a3653da0;
      expv[23] = 152'hededd3ad599f24de07e78ea22cb2b4a3653da1;
      expv[24] = 152'h46772c88c6620f880cbf8ea22cb294a3653da1;
      expv[25] = 152'hce06ac78ff620f880cb78ea22cb294a3653da1;
      expv[26] = 152'hd7f35c5e14620f880cb78ea22cb2b4a3653da1;
      expv[27] = 152'had4441f3d0e20f880cb42f015deb54a3653da1;
      expv[28] = 152'h49bd4830bf241d8e73ec2f015deb22d545cf4e;
      expv[29] = 152'h9a8fd7da51241d8e73e6baf6b9e7c2d545cf4e;
      expv[30] = 152'he983b3ecfa241d8e73e6baf6b9e7a2d545cf4e;
      expv[31] = 152'hba5ee88882a41d8e73e57572086dc2d545cf4e;
      expv[32] = 152'hc262a87682241d8e73e57572086da2d545cf4f;
      expv[33] = 152'h8d6445341b241d8e73e330f1f85f62d545cf4d;
      expv[34] = 152'hf5826a6872a41d8e73e330f1f85f22d545cf4d;
      expv[35] = 152'he3ea3b2338a41d8e73e330f1f85f3cf4c9aa6a;
      expv[36] = 152'h2943bf7bd69479dcba2ce660fac0fcf4c9aa6b;
      expv[37] = 152'h3a9aa3e6699479dcba2ce660fac0fcf4c9aa6b;
      expv[38] = 152'hb40ddbe8189479dcba24e660fac0dcf4c9aa68;
      expv[39] = 152'h066529733f7e7193c18ce660fac0dcf4c9aa69;
      expv[40] = 152'hdd6b3f5248fe7193c184e660fac09cf4c9aa68;
      expv[41] = 152'h62e706898405a5869edce660fac0b8cf6cb75b;
      expv[42] = 152'hd8a27a3a8c85a5869ed4e660fac0b8cf6cb75a;
      expv[43] = 152'h58aaf98fe240a5eb1d0ce660fac098cf6cb75b;
      expv[44] = 152'h8f8bc634bfc0a5eb1d04f16849e7f8cf6cb758;
      expv[45] = 152'h1bc44b5acee57c9b065cf16849e7de93bc1c57;
      expv[46] = 152'h074103bf35e57c9b065cf16849e7fe93bc1c55;
      expv[47] = 152'h3c4b2c2dc0e57c9b065cf16849e7fe93bc1c55;
      expv[48] = 152'hac0a74dd79657c9b0654f16849e7fe93bc1c54;
      expv[49] = 152'h383eecc13e0b783978ecf16849e7d76bb5177a;
      expv[50] = 152'h4457ed53b80b783978ecf16849e7b76bb51778;
      expv[51] = 152'hca50ed5b278b783978e4f16849e7a7930e258e;
      expv[52] = 152'h572cbb675f7215b784bcf16849e7a7930e258d;
      expv[53] = 152'hc7ef2004d0f215b784b4f16849e7a7930e258c;
      expv[54] = 152'h51e98f9e656b1adab7acf16849e79c0d382917;
      expv[55] = 152'h11f64e6fabeb1adab7aaf091f2105c0d382916;
      expv[56] = 152'h677f9c3ed1eb1adab7aaf091f2101c0d382915;
      expv[57] = 152'he770400837eb1adab7a2f091f2101c0d382914;
      expv[58] = 152'h7c48d3acfc21b7c8ea9af091f2101c0d382915;
      expv[59] = 152'he5b50612288000000000000000000000000000;
      expv[60] = 152'hee85080ee20000000000000000000000000000;
      expv[61] = 152'hbfbcd9a358000000000307a76021e000000000;
      expv[62] = 152'h01749516fa4d4516043b07a76021e5dd213382;
      expv[63] = 152'h9135662ddb4d4516043307a76021e5dd213382;
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
