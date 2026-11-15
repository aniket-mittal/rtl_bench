// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 218;
  localparam OW = 165;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02805 dut (
    .aclk(clk),
    .aresetn(in_vec[217:217]),
    .s_axi_awid(in_vec[216:211]),
    .s_axi_awaddr(in_vec[210:179]),
    .s_axi_awlen(in_vec[178:171]),
    .s_axi_awsize(in_vec[170:168]),
    .s_axi_awburst(in_vec[167:166]),
    .s_axi_awlock(in_vec[165:165]),
    .s_axi_awcache(in_vec[164:161]),
    .s_axi_awprot(in_vec[160:158]),
    .s_axi_awregion(in_vec[157:154]),
    .s_axi_awqos(in_vec[153:150]),
    .s_axi_awvalid(in_vec[149:149]),
    .s_axi_wdata(in_vec[148:117]),
    .s_axi_wstrb(in_vec[116:113]),
    .s_axi_wlast(in_vec[112:112]),
    .s_axi_wvalid(in_vec[111:111]),
    .s_axi_bready(in_vec[110:110]),
    .s_axi_arid(in_vec[109:104]),
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
    .s_axi_awready(out_vec[164:164]),
    .s_axi_wready(out_vec[163:163]),
    .s_axi_bid(out_vec[162:157]),
    .s_axi_bresp(out_vec[156:155]),
    .s_axi_bvalid(out_vec[154:154]),
    .s_axi_arready(out_vec[153:153]),
    .s_axi_rid(out_vec[152:147]),
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
    stim[0] = 218'h01eac108fcdc308c0b07ce83927e48355ec8251db1ac01b11d08f15;
    stim[1] = 218'h1731d1949e76e57498fb8412c6be59b45a5aacecd68ac40c27ed207;
    stim[2] = 218'h3eeed54942cf657c87cb0acf8b5a0f4724d3e9048fbb99e9c1ea76b;
    stim[3] = 218'h3019fe892e9e3ffc2ffc96a4c5217f8ae74f7afb3e7db1d6df68d01;
    stim[4] = 218'h3ff57b943fcbd6feb0097639b1a51ef816ca153429405c797fc229c;
    stim[5] = 218'h3d679f93f620355596edb635fd506d0ba116e28c7e0f92434d48d39;
    stim[6] = 218'h173e13d4466a96e55c7b340db8e6a379ed4d1fbe4a6b39cd168eb6f;
    stim[7] = 218'h3aa94a07db892b6e2185725ab8722ee176a0b9313912df1dffbdeef;
    stim[8] = 218'h24fcf2dab94690ba7cc45ab8992841d210eac1017d1c842ce396741;
    stim[9] = 218'h2473a49e16f5f9b0a0745d3355d4b66b3bfaa0c9e9a22239706451c;
    stim[10] = 218'h2f44b8402c9945f359c5d46b9267cc54831205a714f8dc5afa22daf;
    stim[11] = 218'h3985a4e490050e5912d6fe2aa5f20f6e54ab15706e07b2568609d32;
    stim[12] = 218'h2596c0e3bb5edfecee1d0c83d674780ddd0b811a773609e3767af7c;
    stim[13] = 218'h2d51e04c24c078f2e15719989c525e260caeaa4ebaf95a8c5e3256f;
    stim[14] = 218'h3a9378fd4bab434b44632b8f0e2c2a83deaa4fa089272dd479b0a1b;
    stim[15] = 218'h259538e306895e9216ab287f1bc54ce0259df8efecea6eabd806b74;
    stim[16] = 218'h2b8688f922ee60019d3c6e980fd4742bb74b0177f6a02568364ac9e;
    stim[17] = 218'h332e9f248632ab5f6139713e738b2e06ecdddf47341d4c1c196d564;
    stim[18] = 218'h3b2116011f2958685fd1b1b20ff46ef835daa36d2c8abda6f708b66;
    stim[19] = 218'h2bbb0b99e761163f52d77916434802180ca6be36ed33ad371654a91;
    stim[20] = 218'h2bf6485366ebdee4be03281cdadf5de0113d0cba54793264ea4b7fb;
    stim[21] = 218'h30a2795549a955b9b02b34e77ece5a9a3d85283be6fb6942613b52e;
    stim[22] = 218'h31d9e638e01623dc4948c9b786ca1f241437916092a1b2d220d9642;
    stim[23] = 218'h3c61082899a383a1b6db8359b36a4ba55ecb7a16d9af0b593a4b057;
    stim[24] = 218'h23f392179ab8edf6ce20664204717349b5a76fd468161c866bd54cc;
    stim[25] = 218'h3a25562cb87a26d4c3bdee796939186d9bc067528656d143457a4df;
    stim[26] = 218'h364a0843a7c87804b596e18bde7c1536b6664b1686b9417e683884d;
    stim[27] = 218'h386fec49f7c2edcf9b82149d68daa6380a2136f0780d7c04e61c6fd;
    stim[28] = 218'h2b04a40d75d8ff15322fc3a3f1c1333a71066a996a4b75b760458ad;
    stim[29] = 218'h2712aa8f4424a1c180a4608a84d67aab970f8ec3ebb76693d77d22d;
    stim[30] = 218'h31ee6976ae1a615653c008f00d723c36ff9cce94e77aa439cf4a33f;
    stim[31] = 218'h3d175ad6b9338230d986bc07a25600f0873b4aacefd09662d476b81;
    stim[32] = 218'h23cff272e93d966e5937e55778574f1aa7ca89280ea4a7bf076c21d;
    stim[33] = 218'h3d5f35646bd9bc5406ba766789794f9f5a1f8caa55da83af016df31;
    stim[34] = 218'h38e502398b600fa52eb2b78532c50eb39467ea4afc8a49965f11fcc;
    stim[35] = 218'h35ff6603e27f029515c9d2808d1446e86a74bbb73681bb9b9215dc9;
    stim[36] = 218'h3e4eb7c1fa0a7b59d06f1d18a313d858c34964b62f82c342cb6c7cc;
    stim[37] = 218'h352fa4139c60945118000c2fba1d0b7409a19c9b6df829664d47501;
    stim[38] = 218'h31bc6ead9c197ed6cf5212403f35da2d0d03c231a4ac7c2d458e3e5;
    stim[39] = 218'h22041c93421204b4e7055e21229acad13c3794faa51ebc3206bb8e7;
    stim[40] = 218'h291b85dedecb4cab6d35f0ba76c7f17b7def5795b250475a1c0fefd;
    stim[41] = 218'h3988d9fe3ec7575998503c672e146817560d26692dc105e49213bd5;
    stim[42] = 218'h3c0516fb4543f00004183f5d5aacd1ff63b19f8d23f39c1b223846c;
    stim[43] = 218'h352af3a6833d6e73cbb80db5968e04908bcac097131282bea622d57;
    stim[44] = 218'h28445cf52c5ac83a02d63f4792fb8182808b74f0487393942b5f078;
    stim[45] = 218'h2fc1a28507cdcdc1752ebaaa75d8ad04354197f5254994ba2c900e1;
    stim[46] = 218'h289f3990d1c76d9677bb69ff439fdc3c8015627ff0a3198ad5b5798;
    stim[47] = 218'h2cdad4c857f1eb993c250eb29ce50c5511f07f7c36ad92990dbc21a;
    stim[48] = 218'h3baaa1f9b566cce76d6f1f4d51df584a22abb37e1c2d7b3069fb02a;
    stim[49] = 218'h32ffc1aea2e27bc45b3da313dbb1d496157ad9f30595711126f4f03;
    stim[50] = 218'h3edef9cc99354d71ebe985f523ac7198e0e02c32ad2eb016b5ba132;
    stim[51] = 218'h2342cdc6a6d3759c6b5c19fd6434196815f101650f5156b39d46f21;
    stim[52] = 218'h3a4c810523d3b38e4a6a423f594be1f3782dcf1d596be52ef2b2210;
    stim[53] = 218'h36d518bcae8aaadc74ca384b75f1a42f97fd248a25098cc17318f33;
    stim[54] = 218'h33209294b4a6be71f908efd7ef0670e928d36c93b677077f9f7ea2f;
    stim[55] = 218'h3f9746ff79e46613a16c465da8adb345de9b0065172ec42b9d7cfc1;
    stim[56] = 218'h36502b7dd33c089142fca0d8eb01f41d53957b94dca8ede79dec964;
    stim[57] = 218'h302d07e2962d5070eae76b2783d109681eaa40a7ac9c402d26ed34f;
    stim[58] = 218'h25bd31c46bb8ddc8edde12d8511ae47b8e9d33face07cba0d2e1c5c;
    stim[59] = 218'h23a6f450d322565c3625461f3543635dbfb69dbd533d9edac9f1eac;
    stim[60] = 218'h2ef2f5b782e4829e6fedade2f534bf0497f51622307e106f954932d;
    stim[61] = 218'h202181bca0f3c3f9e034f99967b23fedf20c41fa8f377ec5a8642c6;
    stim[62] = 218'h397018be55625aa3c371bcafc712e7470b847c12549291b1e277bb5;
    stim[63] = 218'h3acf9afc00e0861a7a5ad2dd327806a8c8162931a6b5ff056876449;
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
      expv[0] = 165'h000000000000000000000000000000000000000000;
      expv[1] = 165'h000000000000000000000000000000000000000000;
      expv[2] = 165'h000000000000000000000000000000000000000000;
      expv[3] = 165'h000000000000000000000000000000000000000000;
      expv[4] = 165'h000000000000000000000000000000000000000000;
      expv[5] = 165'h000000000000000000000000000000000000000000;
      expv[6] = 165'h000000000000000000000000000000000000000000;
      expv[7] = 165'h000000000000000000000000000000000000000000;
      expv[8] = 165'h000000000000000000000000000000000000000000;
      expv[9] = 165'h000000000000000000000000000000000000000000;
      expv[10] = 165'h000000000000000000000000000000000000000000;
      expv[11] = 165'h000000000000000000000000000000000000000000;
      expv[12] = 165'h000000000000000000000000000000000000000000;
      expv[13] = 165'h000000000000000000000000000000000000000000;
      expv[14] = 165'h000000000000000000000000000000000000000000;
      expv[15] = 165'h000000000000000000000000000000000000000000;
      expv[16] = 165'h000000000000000000000000000000000000000000;
      expv[17] = 165'h000000000000000000000000000000000000000000;
      expv[18] = 165'h000000000000000000000000000000000000000000;
      expv[19] = 165'h000000000000000000000000000000000000000000;
      expv[20] = 165'h000000000000000000000000000000000000000000;
      expv[21] = 165'h000000000000000000000000000000000000000000;
      expv[22] = 165'h000000000000000000000000000000000000000000;
      expv[23] = 165'h000000000000000000000000000000000000000000;
      expv[24] = 165'h000000000000000000000000000000000000000000;
      expv[25] = 165'h000000000000000000000000000000000000000000;
      expv[26] = 165'h000000000000000000000000000000000000000000;
      expv[27] = 165'h000000000000000000000000000000000000000000;
      expv[28] = 165'h000000000000000000000000000000000000000000;
      expv[29] = 165'h000000000000000000000000000000000000000000;
      expv[30] = 165'h000000000000000000000000000000000000000000;
      expv[31] = 165'h000000000000000000000000000000000000000000;
      expv[32] = 165'h000000000000000000000000000000000000000000;
      expv[33] = 165'h000000000000000000000000000000000000000000;
      expv[34] = 165'h000000000000000000000000000000000000000000;
      expv[35] = 165'h000000000000000000000000000000000000000000;
      expv[36] = 165'h000000000000000000000000000000000000000000;
      expv[37] = 165'h000000000000000000000000000000000000000000;
      expv[38] = 165'h000000000000000000000000000000000000000000;
      expv[39] = 165'h000000000000000000000000000000000000000000;
      expv[40] = 165'h000000000000000000000000000000000000000000;
      expv[41] = 165'h000000000000000000000000000000000000000000;
      expv[42] = 165'h000000000000000000000000000000000000000000;
      expv[43] = 165'h000000000000000000000000000000000000000000;
      expv[44] = 165'h000000000000000000000000000000000000000000;
      expv[45] = 165'h000000000000000000000000000000000000000000;
      expv[46] = 165'h000000000000000000000000000000000000000000;
      expv[47] = 165'h000000000000000000000000000000000000000000;
      expv[48] = 165'h000000000000000000000000000000000000000000;
      expv[49] = 165'h000000000000000000000000000000000000000000;
      expv[50] = 165'h000000000000000000000000000000000000000000;
      expv[51] = 165'h000000000000000000000000000000000000000000;
      expv[52] = 165'h000000000000000000000000000000000000000000;
      expv[53] = 165'h000000000000000000000000000000000000000000;
      expv[54] = 165'h000000000000000000000000000000000000000000;
      expv[55] = 165'h000000000000000000000000000000000000000000;
      expv[56] = 165'h000000000000000000000000000000000000000000;
      expv[57] = 165'h000000000000000000000000000000000000000000;
      expv[58] = 165'h000000000000000000000000000000000000000000;
      expv[59] = 165'h000000000000000000000000000000000000000000;
      expv[60] = 165'h000000000000000000000000000000000000000000;
      expv[61] = 165'h000000000000000000000000000000000000000000;
      expv[62] = 165'h000000000000000000000000000000000000000000;
      expv[63] = 165'h000000000000000000000000000000000000000000;
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
