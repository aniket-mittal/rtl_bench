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

  rtlpp_01296 dut (
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
    stim[0] = 206'h01aac612eef37505b825fcf064eeae8f2f01be9978bd36cc970f;
    stim[1] = 206'h0ab02ab4696285c767f93ef4ceae69bb1760043165151b183bc5;
    stim[2] = 206'h327c326390cebc9116c4bfdc9fdb412d34496ab39b82df334845;
    stim[3] = 206'h07b88a696683b06c330fae45cd0971a690586fa835cc4d194f7c;
    stim[4] = 206'h374855ee492794a5306407fa62dcda3f25d5c248534d3623f045;
    stim[5] = 206'h273b4d137ee7addbe6da6e2fc5a2b1793cce44738ff5a36ba6be;
    stim[6] = 206'h31be043598000a894ee6a836a710694538fbf7e830ef6bf52e32;
    stim[7] = 206'h266955c7727a2d19a6a60c37e55bf234c0eab8d2441bfb44a930;
    stim[8] = 206'h39602cf27ed40a479371846e910aa34b9e6c52e46eb0b9f1fc0d;
    stim[9] = 206'h3a3997e7ba1abf4cb75e1e8cda1abaff44f1a42660af6df67b6c;
    stim[10] = 206'h30596c6e408d3e5a6fed59a584b847279e558acb214480ec589b;
    stim[11] = 206'h2784db8f6e69fe1b7c27c4eaa1e48ebdeadb96f8842d83beb6c8;
    stim[12] = 206'h12f894f64a6f4ab87505c682adcd1aa4d04168370d92b05e94c5;
    stim[13] = 206'h3baeb96761fc7b05496dfe9ffc7f1c4e007ec77786614b3bd4ad;
    stim[14] = 206'h2122079a25b71f05174886905e03966389c6fdbbc468a3ced88f;
    stim[15] = 206'h39a05fd4578ec7e950fa9a6f5d9929e828ce66e0bdc8672bc44e;
    stim[16] = 206'h3036c15fc51b6b89b9fa010d4c60f267d4e73e9e9a733e9f5312;
    stim[17] = 206'h267f4e1d9d79c39028800cdb523dc226f2e777c535be5d5ca26b;
    stim[18] = 206'h3377883db2e1f20ffece150579ec649b997a668ad4adeaee634a;
    stim[19] = 206'h27204aa44b4af2f5809b747ebcbde9f3dc2c341045b397159166;
    stim[20] = 206'h2e24571eb947c5780803886ce807fec0a86b93cb32039fb8c009;
    stim[21] = 206'h1280c5e5114206a2f4f1a83fd9e77f2dc8f316ad91345833a62b;
    stim[22] = 206'h3970952b46fcfcbbf65c9d03dd6854b630aa6054c43952279442;
    stim[23] = 206'h3aed94418357999dc48f5616b9825bb55e7df8f7f5878135265e;
    stim[24] = 206'h22ce303ccbf70d638dfa6f183aaa906fa17826c9693934331ea9;
    stim[25] = 206'h3d35cec56bb2433dd0c28701c92b19a4c13976b8e33107ed159b;
    stim[26] = 206'h2296830f04f0625cea01b971d348163f87bd9c955282c66c5945;
    stim[27] = 206'h34d7a4e86966e26fc46abdacd770e8fc48a8711afb9f305bc576;
    stim[28] = 206'h3c685b834843ca2e5df0ba8a9047464eee81e40c5293d70c6997;
    stim[29] = 206'h2ff359ac8d4c96bbbd6c61b404036e05abd8e53391f67da29dab;
    stim[30] = 206'h20db8a0bea8c932a3259f2d7b9d235ccee01d55e6f134752b16e;
    stim[31] = 206'h34b08843b5be8b2f369c7eb4a33f528e7b77fde4c3e0ce4a8e59;
    stim[32] = 206'h2d38633342eb0c1b67f59cf38e2e202cc158db84bed21cf4b062;
    stim[33] = 206'h3b47b8dc29cf6e18cf973487c64128a9e0abdfdbf5d59e5f6ddb;
    stim[34] = 206'h376e057a91bd8b8c58d3fa01bf00b4fde433a03b7c6b7f3c2d58;
    stim[35] = 206'h1631d640e3d4c08ca3ee9a25840e943feb7b75f39ea96b69d1f6;
    stim[36] = 206'h2f47ff1bcb8276e392f4048608ccb2de70b6506a1e6d66ded4f6;
    stim[37] = 206'h376e2e1a65a8cd72c60b3d87832e79cdb84ad0b08f645bc4c0b3;
    stim[38] = 206'h2d7d66ee1ffec3ee88fb923271ce383aa743e7d076ec5768bb3f;
    stim[39] = 206'h25414aba476c10d3d7abe0795fdba8a99f88ac1b677bbbf1965a;
    stim[40] = 206'h39351abfcecbd66d543a0aa1c7b4fc31dc577604173f09a6beaa;
    stim[41] = 206'h201356a9bbd454ba90ec55c30f7ecdd5496f5ad07a768163364f;
    stim[42] = 206'h28a6803606a7a2caf8126bc3f5da54c9a09a01b97245c71cbeb6;
    stim[43] = 206'h2ed8e3c4edcb4cb782745812cbc4c18924bdb6e5ac87c721b577;
    stim[44] = 206'h381c59e7dbb28f1a543bf45fd57a66cf5521b56e78c1fdad80a5;
    stim[45] = 206'h2517443d62069052d7cfaf3f460bf4f121b8cd76fa6a9453c1d5;
    stim[46] = 206'h35dc78d6b9d7c710b2fe7d6e02a049781bbb2b35dd65c03acce2;
    stim[47] = 206'h34d39d900b37c8b41f911d21d9c00c17ffedcd380530d710f6d9;
    stim[48] = 206'h2560c1dc5a38e6a210c0edfc0a91ac3a69ab158a911948c152b2;
    stim[49] = 206'h18a188bb1a175d390dc9252271078e196fdae640e2a959bb5f31;
    stim[50] = 206'h37b61bad24e0f23741375f16588f96db881faf7e3805dddf483e;
    stim[51] = 206'h222dc3928d67e8bbfd8628ebff74fc477c15d5245a8d9ff6209f;
    stim[52] = 206'h38882fdf36a14d5602076de0464de930afc2aefb9d2ffa9b8eb6;
    stim[53] = 206'h254a35e8736818c964f7c6787a767a170942c2534b34504afa47;
    stim[54] = 206'h3857c93bed5fe5356dde2e822150cf0605951054a1ae31feccfc;
    stim[55] = 206'h3704819dff572216c647edb1f3a64c5b552160e75d87db73e0c1;
    stim[56] = 206'h3cd5d7199ad9a4667274553657c5e929d4bc6e211c36099a38b1;
    stim[57] = 206'h36a5bbe5dbe21fdd2abd875f76213a58fa2432369b3cf484129e;
    stim[58] = 206'h21d85cccf5b5bb9048af8bc22d3997b79c457a9b542756d6c6f4;
    stim[59] = 206'h26f02ccbb263eb5a356b48e9ecf0936f516d18403833a269af34;
    stim[60] = 206'h24cda9b4b4ceaa0d5543632d8d1a9c018b2b7109d3d5ec6c6054;
    stim[61] = 206'h263fba5d8337bb96ec29981abc4fe836f44b4681f20643372151;
    stim[62] = 206'h31cd0c39bef58b95f854f8f59b7b620b562b5fd60f818748fd7a;
    stim[63] = 206'h22b19725670dd3e7482b436f3fef4e22055f98f95efb84890580;
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
      expv[0] = 153'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 153'h000000000000000000000000000000000000000;
      expv[2] = 153'h000000000000000000000000000000000000000;
      expv[3] = 153'h082df33484400000000016c4bfdc9c000000000;
      expv[4] = 153'h000000000000000000000000000000000000000;
      expv[5] = 153'h0853623f044000000000306407fa64000000000;
      expv[6] = 153'h11d3623f0441ced344ddb06407fa634562f279a;
      expv[7] = 153'h1853623f0441ced344ddcee6a836a74562f2798;
      expv[8] = 153'h18d3623f0441ced344ddcee6a836a4b7e46980a;
      expv[9] = 153'h108b9f1fc0c1ced344ddcee6a836a2b7e46980a;
      expv[10] = 153'h180b9f1fc0c1ced344ddb75e1e8cdeb7e469808;
      expv[11] = 153'h08480ec589b9ced344dd375e1e8cdeb7e469808;
      expv[12] = 153'h08c80ec589b9ced344dd375e1e8cdfc91d7bd5e;
      expv[13] = 153'h000000000000000000000000000000000000000;
      expv[14] = 153'h0094b3bd4ac0000000000000000000fe389c01a;
      expv[15] = 153'h080a3ced88f800000000174886905cfe389c018;
      expv[16] = 153'h018a3ced88f80000000017488690593253d0512;
      expv[17] = 153'h118a3ced88fc0db057f3974886905b3253d0512;
      expv[18] = 153'h0965d5ca26bc0db057f328800cdb553253d0510;
      expv[19] = 153'h10e5d5ca26bcdde20f6aa8800cdb51d8c937326;
      expv[20] = 153'h00e5d5ca26bcdde20f6a28800cdb53d8c937326;
      expv[21] = 153'h00b9fb8c0084dde20f6a28800cdb53d8c937326;
      expv[22] = 153'h000000000000000000000000000000000000000;
      expv[23] = 153'h1080000000065c254ad48000000002d0a96c60a;
      expv[24] = 153'h0080000000065c254ad40000000002d0a96c60a;
      expv[25] = 153'h18134331ea98b38c0f358dfa6f183cd0a96c608;
      expv[26] = 153'h08107ed159a0b38c0f350dfa6f183ed0a96c608;
      expv[27] = 153'h102c66c59440a5a0c3c28dfa6f183ad0a96c608;
      expv[28] = 153'h082c66c59440a5a0c3c2446abdacd4d0a96c608;
      expv[29] = 153'h003d70c69960a5a0c3c2446abdacd2d0a96c608;
      expv[30] = 153'h1067da29dabbfcd66b26c46abdacd0d0a96c608;
      expv[31] = 153'h00e7da29dabbfcd66b26446abdacd3a46b99dce;
      expv[32] = 153'h088ce4a8e583fcd66b26369c7eb4a7a46b99dce;
      expv[33] = 153'h018ce4a8e583fcd66b26369c7eb4a1a46b99dce;
      expv[34] = 153'h19d9e5f6ddbed1ee370ecf973487c7a46b99dce;
      expv[35] = 153'h1859e5f6ddbed1ee370ecf973487c7a46b99dcc;
      expv[36] = 153'h000000000000000000000000000000000000000;
      expv[37] = 153'h108000000003d1ffc6f680000000019965bce16;
      expv[38] = 153'h08c5bc4c0b23d1ffc6f6460b3d87859965bce16;
      expv[39] = 153'h1045768bb3e35f59bb83c60b3d87819965bce14;
      expv[40] = 153'h08c5768bb3e35f59bb8357abe0795fb751533ee;
      expv[41] = 153'h0845768bb3e35f59bb8357abe0795db751533ec;
      expv[42] = 153'h1868163364e004d5aa6cd7abe0795fb751533ec;
      expv[43] = 153'h1868163364e004d5aa6cd7abe0795fb751533ec;
      expv[44] = 153'h10fc721b577804d5aa6cd7abe0795b898312492;
      expv[45] = 153'h109fdad80a5804d5aa6cd7abe0795b898312492;
      expv[46] = 153'h1829453c1d4004d5aa6cd7cfaf3f47898312490;
      expv[47] = 153'h08a9453c1d4004d5aa6c57cfaf3f474092f037a;
      expv[48] = 153'h088d710f6d9804d5aa6c57cfaf3f454092f037a;
      expv[49] = 153'h080d710f6d9804d5aa6c57cfaf3f474092f0378;
      expv[50] = 153'h000000000000000000000000000000000000000;
      expv[51] = 153'h000000000000000000000000000000000000000;
      expv[52] = 153'h1859ff6209e08b70e4a0fd8628ebfc000000000;
      expv[53] = 153'h08d9ff6209e08b70e4a07d8628ebfc9bd2615fe;
      expv[54] = 153'h08c504afa4608b70e4a07d8628ebfe9bd2615fe;
      expv[55] = 153'h004504afa4608b70e4a07d8628ebfa9bd2615fc;
      expv[56] = 153'h18fdb73e0c1dc120677ac647edb1f74c98b6ab2;
      expv[57] = 153'h18e099a38b1dc120677ac647edb1f54c98b6ab2;
      expv[58] = 153'h086099a38b1dc120677a4647edb1f74c98b6ab0;
      expv[59] = 153'h08e099a38b1dc120677a4647edb1f6732f6f38e;
      expv[60] = 153'h08e099a38b1dc120677a4647edb1f4732f6f38e;
      expv[61] = 153'h01e099a38b1dc120677a4647edb1f2732f6f38e;
      expv[62] = 153'h11e4337215018fee9763c647edb1f2732f6f38e;
      expv[63] = 153'h08e4337215018fee97637854f8f59e732f6f38e;
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
