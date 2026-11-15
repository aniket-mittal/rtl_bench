// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 228;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08366 dut (
    .aclk(clk),
    .aresetn(in_vec[227:227]),
    .s_axi_awid(in_vec[226:215]),
    .s_axi_awaddr(in_vec[214:183]),
    .s_axi_awlen(in_vec[182:179]),
    .s_axi_awsize(in_vec[178:176]),
    .s_axi_awburst(in_vec[175:174]),
    .s_axi_awlock(in_vec[173:172]),
    .s_axi_awcache(in_vec[171:168]),
    .s_axi_awprot(in_vec[167:165]),
    .s_axi_awqos(in_vec[164:161]),
    .s_axi_awvalid(in_vec[160:160]),
    .s_axi_wid(in_vec[159:148]),
    .s_axi_wdata(in_vec[147:116]),
    .s_axi_wstrb(in_vec[115:112]),
    .s_axi_wlast(in_vec[111:111]),
    .s_axi_wvalid(in_vec[110:110]),
    .s_axi_bready(in_vec[109:109]),
    .s_axi_arid(in_vec[108:97]),
    .s_axi_araddr(in_vec[96:65]),
    .s_axi_arlen(in_vec[64:61]),
    .s_axi_arsize(in_vec[60:58]),
    .s_axi_arburst(in_vec[57:56]),
    .s_axi_arlock(in_vec[55:54]),
    .s_axi_arcache(in_vec[53:50]),
    .s_axi_arprot(in_vec[49:47]),
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
    .s_axi_awready(out_vec[176:176]),
    .s_axi_wready(out_vec[175:175]),
    .s_axi_bid(out_vec[174:163]),
    .s_axi_bresp(out_vec[162:161]),
    .s_axi_bvalid(out_vec[160:160]),
    .s_axi_arready(out_vec[159:159]),
    .s_axi_rid(out_vec[158:147]),
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
    stim[0] = 228'h24c67419d2b60932862a12833a3a25f4effd8e501bb25b6a088ba979f;
    stim[1] = 228'h71ffc53b72c969f8073f699a08ef9ae31709fac9debe35574e33296db;
    stim[2] = 228'he139b6bec8ccbd64500db1a5741f453c069433b904bc466d75f522487;
    stim[3] = 228'hd6f51463ee0f385cef778ac2c8bccd9ddddbdc799864711e870607e65;
    stim[4] = 228'he037d96d73b5b507e2af6150b9452eca60f68f139e52b6d805605e8a7;
    stim[5] = 228'hf0b146c0372c392427bf5bcc8b1e7d594cedcd2397b15f7fdd44fa22c;
    stim[6] = 228'hd928a245c07040842ca6f697c0692a5c1d303b271c63903bf24e6f875;
    stim[7] = 228'hb1485d48266e0a06d3f249b3e8525470d43aab8d508a93a867916e73e;
    stim[8] = 228'h8dfdddc954343033456bf1cd50ecd21e414587ad06179d4b633bf0aeb;
    stim[9] = 228'he77e8fe1a71b45778e8907f906146e78ae1e9b18cde6abecaf281bafb;
    stim[10] = 228'ha6669cae383b4d7025809e5ef085ae26b4eb93af4f5c75c4638e74175;
    stim[11] = 228'hf9f9f804a5008f41849ddbc77d351c10d8bb632d31ca24bbcacb15d27;
    stim[12] = 228'hf7548ca56b374ef1b111f77aa8431dc661714bfd23ce80a52408bbf7c;
    stim[13] = 228'hc5a43e2c6e9f8025e31031baad909b7abbf0ef320eb7acdaf8d8fb061;
    stim[14] = 228'hdcdee6e2e182ee938a54a5f50a2023abd7b1512d8e101df22261709b2;
    stim[15] = 228'haa8412b2bda84fe3b064c09dc76254b09421ed694e92b13e63bed9eec;
    stim[16] = 228'ha0c062364ea50266fd48c5eef8e18287d3ab7ab701d2e96871f4a29fa;
    stim[17] = 228'he1acb03de2a87e08bd2465bf1b20c57d83329ad1642006692b750e447;
    stim[18] = 228'h85fb6fbaa5e14d7c011e154364eb8a940b66b25cd38a14e31b4afd321;
    stim[19] = 228'hae601362d9fec2b14b50dfcdbc48521eaa3a52f75210ed2a401e01727;
    stim[20] = 228'hb40462ccc0382931b1a052c9c5dbe7a2817cf7948059dea9caa456643;
    stim[21] = 228'hc32581d3bbaf94e4bdbc50d22176483a148638dc525b94c40ad61988e;
    stim[22] = 228'hb606e925e14a9b60c7b47b661d2391a0720124fd3f1530e1218221c56;
    stim[23] = 228'hc4bc61e8a8d7f767eb250d89b1cc4ad1e352a57c3e13505d10d4771f7;
    stim[24] = 228'hc4ed4553954ca206f6f96a3333f01a03cc053e772dea49fb0b5b61c52;
    stim[25] = 228'ha0142ef81e9b29342c2876837107f7159e71b22c324e96075f79f7d10;
    stim[26] = 228'hc24975221554c87cf18f6ad023b8913a60ef555ca91658bf1dc4f561d;
    stim[27] = 228'h8df2c38e8590ceb28594c226abf7601ac6343c6a82d9142c08ac8a67a;
    stim[28] = 228'h8e480759e0bf35ee17d5ebe32c93157af3043aed0adec1e0b8c1322ba;
    stim[29] = 228'hde48f74dccbd3c7b6d86d8d418ed799609bd851640a2ee71c897ea6de;
    stim[30] = 228'hd6f9c1000109b80e4af8f8dad134f89041ea836606ab5c936aa7472fd;
    stim[31] = 228'hddf802dff2ca6ac937b2e7a923c346d207fae6695c393e022373828ff;
    stim[32] = 228'h8e05f0ae0ae2019fc763268bc395f0743c93ff69a41e8c52656a92e2d;
    stim[33] = 228'ha438a9c63841681a3bd8a2c96308abc5c7fa929c2240f3dbcab837490;
    stim[34] = 228'heedd2cd0d0fa82ca6f599ab46c34b41acb35dcddf1b2773719db3ed87;
    stim[35] = 228'h8bc40257261ba2dc1a3ee937e07ca898fefdca9674684380b4130da29;
    stim[36] = 228'h8f6733bb3709a5f75b74427dd72cfacbff52628914065120be84dba23;
    stim[37] = 228'hc03498faa6c0a1a76c44643373a97dd04a0446ea739be84d43ac7e5bc;
    stim[38] = 228'h897b6613bab9a63d1b95e1db948b73ff355171b4cb0c5300252fd7917;
    stim[39] = 228'hcbabbad2f54a818d5cda203f21259d0cc3fb725e08b96516171af8fa0;
    stim[40] = 228'h835fc12c26884eb128b09f763e9d387d5bcedd1f18a6f617f65712dd8;
    stim[41] = 228'hd15733c3b0bc15d835e03f23956c13d070c2f445b035e49c2d2936806;
    stim[42] = 228'h9b05b711fac19b234e73f3ab0248424e7ba1c80a32755e4e51c384c44;
    stim[43] = 228'hc0620e4208eec2bc016b68739b69f8310d2b5a36d5b68ed19ef2d7af4;
    stim[44] = 228'hfad83d40e6bc99548a01a5ee47afae15bbff1bb197e004410c6a03d20;
    stim[45] = 228'h96b5c2f4d665ede69cc5f864ed91f971143b58c46b1b8667fae4703d8;
    stim[46] = 228'ha98890908218196adcd4b33f534de59bb904bc2428cc4bccba0198453;
    stim[47] = 228'h8e072ac48dd60671883f9b89817fba40eb1456ed29c6b9dccafc43995;
    stim[48] = 228'h86a3bd14a045c2e75c057c99f1756fc1c50b617edf0d07cdd9eef402c;
    stim[49] = 228'h865080610730f455f53757d15a3b421f651167c7e26f2fb2298b54cf1;
    stim[50] = 228'hbe53d6a66e7aee65d67031e668de16d61c461a914cd6a4c718a52c6d4;
    stim[51] = 228'hfb3944b91259bdc8d6bc379424e7642cf3ce4bf024c072315d43b0d04;
    stim[52] = 228'he79b1d343fb29b0b0cd23eed98b415f45c01e1b81efa0133b2884bef9;
    stim[53] = 228'h96215a1ad4a073705d8090a346c40e12df5489530d078dd4793581405;
    stim[54] = 228'hbb52fbc932362ab1c8519acd76bf1e200413afa86d40c9921f4dde744;
    stim[55] = 228'hb9a832dc85d77f76fd5b6e5ae58725e6cb0b073df0d3c9fda59115617;
    stim[56] = 228'he2dcc331e32a6d56c19ae5643553213954d3cf24b27177a6a2b46af45;
    stim[57] = 228'hc6b5d55028b92a7939637d3f8c14833ecfac14be98e974447cc2db208;
    stim[58] = 228'h85e22f591f0a956d8743848e9c3bbfeebf1d7eee37b09371c875e163d;
    stim[59] = 228'hab3d4c1fecc166f6a418621fd639f7444f6cfa4442ef8b6580854a984;
    stim[60] = 228'ha056aac90590e8bd3f57c0b9ca5c9b32c9f6f2c922725d7f19e26696d;
    stim[61] = 228'ha4818f529f39d0b2fa4d9fbd720ecbe264a7076805436a3da94b536b7;
    stim[62] = 228'h439dfeb431064fa5cb0c75882eed9561345676bf9b5a1a962c16fe80f;
    stim[63] = 228'hefb946f55cbc6d9a184268a1e1f8cfb6b8bf43cdd90c1c3a101562899;
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
      expv[0] = 177'h0a4c27d3888ba979fe7419d2b109419d1d14ffd8e500f;
      expv[1] = 177'h171ff38c4e33296dbfc53b72cc34cd0477cb709fac9da;
      expv[2] = 177'h0e13d4f075f5224879b6bec8cad8d2ba0fa469433b903;
      expv[3] = 177'h1d6f6e77070607e65d1463ee0e4561645e65ddbdc7998;
      expv[4] = 177'h1e03032985605e8a7fd96d73b330a85ca2960f68f139a;
      expv[5] = 177'h1f0b7d655d44fa22d146c0372a2de6458f3ccedcd238f;
      expv[6] = 177'h1d92b970724e6f8758a245c0727b4be03493d303b2709;
      expv[7] = 177'h0b1481c367916e73f05d48266ba4d9f4292d43aab8d49;
      expv[8] = 177'h08dfb079633bf0aebdddc9543178e6a8766a14587ad0e;
      expv[9] = 177'h0e77c9e2af281bafbe8fe1a71b03fc830a36e1e9b18d7;
      expv[10] = 177'h0266409ae38e74175e9cae38384f2f7842d74eb93af5a;
      expv[11] = 177'h1f9fb8434acb15d279f804a5006de3be9a8d8bb632d31;
      expv[12] = 177'h07755719a408bbf7d48ca56b30fbbd54218c1714bfd21;
      expv[13] = 177'h1c5a2deaf8d8fb061c3e2c6e9a18dd56c84bbf0ef3216;
      expv[14] = 177'h15cda6af2261709b36e6e2e18152fa8510137b1512d8f;
      expv[15] = 177'h1aa862c263bed9eed412b2bda9e04ee3b12d421ed6959;
      expv[16] = 177'h0a0c021f71f4a29fb062364ea3e2f77c70c33ab7ab717;
      expv[17] = 177'h0e1a95f62b750e447cb03de2acb2df8d90643329ad163;
      expv[18] = 177'h005fb2501b4afd321b6fbaa5e60aa1b275c2b66b25ccb;
      expv[19] = 177'h0ae6207ac01e0172781362d9f86fe6de242aa3a52f755;
      expv[20] = 177'h0b401e8a4aa456643c62ccc038a964e2edf617cf7948d;
      expv[21] = 177'h043240e80ad61988f581d3bbaaa86910bb2148638dc4a;
      expv[22] = 177'h03601681a18221c576e925e1483db30e91c920124fd3b;
      expv[23] = 177'h1c4bd34790d4771f7c61e8a8d306c4d8e622352a57c2a;
      expv[24] = 177'h1c4eb00f0b5b61c5354553954bb51999f80ac053e7727;
      expv[25] = 177'h020174565f79f7d1142ef81e9a3b41b883ffe71b22c28;
      expv[26] = 177'h1c24f4e99dc4f561d975221556b56811dc480ef555cad;
      expv[27] = 177'h08df406b08ac8a67b2c38e8591611355fbb06343c6a89;
      expv[28] = 177'h00e48debb8c1322bb00759e0bff5f196498d3043aed03;
      expv[29] = 177'h15e49e584897ea6df0f74dccbd6c6a0c76b89bd851657;
      expv[30] = 177'h156fb2416aa7472fd9c100010f7c6d689a781ea83660c;
      expv[31] = 177'h05dfa3482373828ff802dff2ccf3d491e1a67fae6695c;
      expv[32] = 177'h10e021d0e56a92e2ddf0ae0ae71345e1caf9c93ff69a6;
      expv[33] = 177'h1a43bf174ab8374910a9c63845d164b184527fa929c3a;
      expv[34] = 177'h16edf06b19db3ed87d2cd0d0fd4d5a361a5cb35dcddf9;
      expv[35] = 177'h00bc0a63b4130da29c0257261ef49bf03e51efdca9660;
      expv[36] = 177'h00f60b2fbe84dba23f33bb370ba13eeb967bf52628909;
      expv[37] = 177'h0c03574143ac7e5bd498faa6c33219b9d4bca0446ea76;
      expv[38] = 177'h009787fca52fd7917b6613babef0edca45bb55171b4c8;
      expv[39] = 177'h14bae433171af8fa13bad2f54e901f9092cc3fb725e10;
      expv[40] = 177'h1035f9f5765712dd97c12c26884fbb1f4e99bcedd1f18;
      expv[41] = 177'h1d154741ad2936807733c3b0bc9f91cab60b0c2f445b0;
      expv[42] = 177'h09b06139d1c384c455b711fac179d5812423ba1c80a2e;
      expv[43] = 177'h140618c41ef2d7af520e4208ee3439cdb4f8d2b5a36c6;
      expv[44] = 177'h07ad90568c6a03d2103d40e6ba52f723d7d7bff1bb182;
      expv[45] = 177'h016b7dc47ae4703d95c2f4d663fc3276c8f943b58c463;
      expv[46] = 177'h0a98ce6eba019845389090821dd99fa9a6f5904bc2426;
      expv[47] = 177'h18e04903cafc43995f2ac48dd04dc4c0bfdab1456ed3e;
      expv[48] = 177'h086a5f0759eef402d3bd14a043be4cf8bab650b617ec2;
      expv[49] = 177'h1065207da98b54cf1880610732abe8ad1da251167c7f5;
      expv[50] = 177'h03e5735818a52c6d53d6a66e7a98f3346f0fc461a9152;
      expv[51] = 177'h17b390b3dd43b0d05144b9125c9bca1273b53ce4bf039;
      expv[52] = 177'h1679bfd132884bef9b1d343fb51f76cc5a0dc01e1b801;
      expv[53] = 177'h1162404b79358140595a1ad4a0c851a36207f54895306;
      expv[54] = 177'h13b520801f4dde7452fbc932304d66bb5f8e413afa864;
      expv[55] = 177'h1b9adf9b259115617832dc85d3b72d72c394b0b073de7;
      expv[56] = 177'h062dece522b46af45cc331e32b72b21aa9914d3cf24b9;
      expv[57] = 177'h046b44fb7cc2db2095d55028bcbe9fc60a42fac14be9a;
      expv[58] = 177'h105e1fbac875e163da2f591f0e42474e1ddff1d7eee2b;
      expv[59] = 177'h02b3dd1100854a98554c1fecc3310feb1cfef6cfa4447;
      expv[60] = 177'h1a0574cb19e26696deaac90596e05ce52e4a9f6f2c92f;
      expv[61] = 177'h1a485f89a94b536b798f529f39cfdeb907624a7076815;
      expv[62] = 177'h1439e584ac16fe80fdfeb431023ac41776cd45676bf8c;
      expv[63] = 177'h1efba6da901562899946f55cbdb450f0fc678bf43cdcd;
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
