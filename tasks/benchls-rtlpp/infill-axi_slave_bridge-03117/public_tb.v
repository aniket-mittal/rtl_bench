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

  rtlpp_03117 dut (
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
    stim[0] = 228'h22c5fccf72254ac08a7d114f1598eebc1e46a56135cf450ac59e782fb;
    stim[1] = 228'h3ba61c61a763eb0d9aacce85432c472ef998b1e7e74fe0ae6a0fb7c8b;
    stim[2] = 228'h918a2cdb0312b17578094096104335a75813ee439117606ff09c888fb;
    stim[3] = 228'hae7f10003e06785a6d0fdecf1a7a7471a712798eec1dfd852df6d725c;
    stim[4] = 228'he62d58a0df339434210d83e2483052187bb653abb52405229187f1c48;
    stim[5] = 228'h9075c402c43018fb622febf0d9f6c45055a1018ebcc268b72e300da33;
    stim[6] = 228'h9e127cffa88627933fb82bc9c797ad38d19af14e8eb555eb1d0fef418;
    stim[7] = 228'h8af9269a1a6872b57ee5ed06f63bee525a3424a238c4bbcc27e9f3276;
    stim[8] = 228'hc616298094b5152f0d7ade30fbd500421c517b48d537e87336cc546e4;
    stim[9] = 228'hbdf9d8b9501246007a5318c632ba05e3a1a1d5e8f4a1c8a6d15456384;
    stim[10] = 228'ha96f4c90b8692a6b3da027d1df90c5840f90bec4814b4bb7d1fefd6a9;
    stim[11] = 228'hb37e21e95f6510a60aea434d03516bfb78a7fec9772186b8f0a9b002f;
    stim[12] = 228'hf2829ded1880546af1c1b9be065c8a582cdbf628146d1664d9ffc65cf;
    stim[13] = 228'h16a695135f5283712a73efaf59aac2c8011be41683756d85ba30fed4c;
    stim[14] = 228'hc0a5c73c613f946ee4ea4f88291a8adbd2d97cdc801acc748fa8423de;
    stim[15] = 228'hf3d3a5de04867d597810f4e4fe527ec6b43a2eb0bd386315e26ff5a1e;
    stim[16] = 228'hc6451a0819ef95e328260f29e302c3af5468fb672df7d9b7c30a508e3;
    stim[17] = 228'hfe13579e0c602b8a65512dc6050e721b5e80a98e94541687d69cbbddb;
    stim[18] = 228'hca7eb294b7c31a243a725a6faf81d4e60b115d845a8dfdac875d5b454;
    stim[19] = 228'ha6d18e32a2d6f0e7341e3783fcda5e761a519431caeaac15e3f0bdf8e;
    stim[20] = 228'hce1737c4b787386534ec5849a10968a36f6dd1efd103f0bbc8e0189c8;
    stim[21] = 228'hcda3c4ff4bfb9063b1a2f3e83bf75cbe766106e8409252d9903b3b18e;
    stim[22] = 228'ha97d57369bc0235ad25a2e01a542b2ca22ccb2ef73692248422466cb0;
    stim[23] = 228'h9d046e0455a18af6cd7a8614f72216e09605c8cd41aab0f4a34cb1f5c;
    stim[24] = 228'hb38850964571256e38d8dbfec852ab74a709dde0eb2a16967d20c8247;
    stim[25] = 228'hb94a6398f095a9584f38a5594f7e00972bb06fe8450e95194e91e5b24;
    stim[26] = 228'he7b804ac0edca480deac1d87335ba0d3d8e261484ad86c675454835d2;
    stim[27] = 228'h914d1ea6b9c2936fd06aadd4a2f7c0a8e8c5c3b9c4ec819a316f0dfdf;
    stim[28] = 228'hed7349924839df81c508892899255a313bcf47108ea5e1e0fa1feb058;
    stim[29] = 228'h8be963a7b1d567c49a1001278ea2bb914257990a48823fb0e42cffe81;
    stim[30] = 228'hc244ac49c09d0669d1df14b4096ca22c2cf64d8522d7fe09a32b4885e;
    stim[31] = 228'h8d969da0efd97ae7d5d2446b7e917ac8970132a352e0a4cb93268463b;
    stim[32] = 228'hb3f1a012a1746b67adb129a537eaf32c7bd4542bb0db7cf63d1527087;
    stim[33] = 228'hf89b4a9ee003842796c70de33f3cadeede2664d71b442f4d42baf859b;
    stim[34] = 228'hd140571f2110db56fcf2bc87669c6a158abaf2f002271ca7b48fe5ed1;
    stim[35] = 228'h9663007adcc3a9dd0e2acd292be74303e61074686be392d36cf8ebaca;
    stim[36] = 228'hc34c1f28bcdcebf45b25518b5f8d834e06491202c1f3061c52a57740a;
    stim[37] = 228'hc530f234ab8f9a6afaf7ca01e90a109e59c9622015c41cab86460e9a6;
    stim[38] = 228'hf083db206d17f66eb2b1cced4af0593c2259bb1e4548ee9e7ba6d5bda;
    stim[39] = 228'he88f143bdbf79f8a0a84e76513eed5317a6594e9c5b59c7c1cc4b4ed4;
    stim[40] = 228'hc0575ad879abe886deeaded56b4d0aa558df6ecfd4015e64c2208ed68;
    stim[41] = 228'hd0311c4185381546bcb310faa76d9dbd228f1184e955f4ee15429a3bb;
    stim[42] = 228'hbc309217d35a02769e13b9a52cb60d6f92746d0c56874f9a4f456f614;
    stim[43] = 228'hdf038b199c34137d86e1b831b9cce68a5905f110311f2cf0f5f4391e2;
    stim[44] = 228'h97b13d8f606dac8bf98f4864e230ad719bed6d21710617ba789b22d13;
    stim[45] = 228'hfdc5741227a511e78e8910e03210b3f667c1463c60517964a4db40933;
    stim[46] = 228'had59acaed8771105ac83bdcbc4b984c3ace855acd3adba7cf84b8b760;
    stim[47] = 228'hc2e9f9912a94dc3824e858e2e84850deb56aed597e174aa0d0db9676a;
    stim[48] = 228'h9b67d4e077c95554de4cb57fe96604ceb1afa742bd702cf2af575c9e4;
    stim[49] = 228'hdcbfae9a3324278e69980f22ccfc7c4a980b521d6b6e8d98cfbcd0383;
    stim[50] = 228'hcad31d89642a0e144465a54a7a920bb06bb86a8c917371ef8354d52b8;
    stim[51] = 228'hb49d04bd8ce17d5a741b7fda21de8946276bb61a90e980c8cefed48b9;
    stim[52] = 228'habf6953c2af538a0f6c235392910944e871be14925ee960fa46f613cf;
    stim[53] = 228'hfa65e17a64e398e5b4be1559e8f1c268054d8ca12553c2efbcaa1469b;
    stim[54] = 228'hb630436c07000bf0428b3918738a47fca3bec0c13b58709090431b7cc;
    stim[55] = 228'hc19e65081b1f066a17293a7ffbb713d71b519df4ff90a2a80f3b40961;
    stim[56] = 228'h8e755cd1d84370d780434ec0faf618958fdf6cb6c1bbdf0a23f2bf98c;
    stim[57] = 228'hcf4a920faf82befd4e878bcf6a6fe8f230d71ee4ef3c1a6625ced8bb9;
    stim[58] = 228'hbfbe064d18648afd4274292733c8a2d42f46a482e81939904879975bb;
    stim[59] = 228'hc01b7426de7d98de0d9366ecd8c2902c490ee45bb18a827bbe737558a;
    stim[60] = 228'hd8e56cf93905a1e9e00a43194dc287dab9bdc9def9a36e92d06a52f11;
    stim[61] = 228'hcef9ba9d04b0aeba5c579a0ea1f4a753015db19115ce6227e90191fca;
    stim[62] = 228'h9913f1468e193d2ba6be0e28ebff9774ec32031523d699b2aeca329a5;
    stim[63] = 228'hd22bc19ff98165bb918fcbbb1e2598c18d0ba54dbdb8c9aadb420735c;
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
      expv[0] = 177'h000000000000000000000000000000000000000000000;
      expv[1] = 177'h000000000000000000000000000000000000000000000;
      expv[2] = 177'h000000000000000000000000000000000000000000000;
      expv[3] = 177'hxx007x00709c888faxxxxxxxxxa04b08219xxxxxxxxx3;
      expv[4] = 177'hxx005x002df6d725cxxxxxxxxx6f678d3d3xxxxxxxxxc;
      expv[5] = 177'h0x0020001187f1c48xxxxxxxxx41f124182xxxxxxxxx1;
      expv[6] = 177'h000070002e300da32xxxxxxxxx75f86cfb6xxxxxxxxx5;
      expv[7] = 177'h080030001d0fef418xxxxxxxxx95e4e3cbdxxxxxxxxxb;
      expv[8] = 177'h1000480027e9f3276xxxxxxxxxf6837b1dfxxxxxxxxxe;
      expv[9] = 177'h0800300036cc546e41269a1a6f6f187dea81a3424a237;
      expv[10] = 177'h000068005154563841269a1a688c63195d05a3424a225;
      expv[11] = 177'h1800700051fefd6a89269a1a6d93e8efc865a3424a225;
      expv[12] = 177'h0000000070a9b002ef4c90b86b21a681a8b3a3424a221;
      expv[13] = 177'h000000000000000000000000000000000000000000000;
      expv[14] = 177'h000000000000000000000000000000000000000000000;
      expv[15] = 177'h100048000fa8423de74c90b86f27c4148d43a3424a227;
      expv[16] = 177'h00005000626ff5a1e74c90b86cfa727f293f2d97cdc90;
      expv[17] = 177'h18007000430a508e2f4c90b8690794f181632d97cdc8d;
      expv[18] = 177'h00007000569cbbddaf4c90b86d16e302873b2d97cdc88;
      expv[19] = 177'h00004000075d5b45474c90b86aad37d7c0ed2d97cdc9d;
      expv[20] = 177'h1800500063f0bdf8e74c90b86b9bc1fe6d2f2d97cdc94;
      expv[21] = 177'h0000300048e0189c818e32a2d2ac24d084b12d97cdc99;
      expv[22] = 177'h10001000103b3b18e18e32a2d1f9f41dfbad2d97cdc8a;
      expv[23] = 177'h08000800422466cb03c4ff4bfd9700d2a15b2d97cdc92;
      expv[24] = 177'h10004000234cb1f5c3c4ff4bfb430a7b910e2ccb2ef7b;
      expv[25] = 177'h080068007d20c8246bc4ff4bffedff6429522ccb2ef68;
      expv[26] = 177'h100010004e91e5b243c4ff4bfc52aca7bf002ccb2ef68;
      expv[27] = 177'h000070005454835d23c4ff4bf88ec399add02ccb2ef77;
      expv[28] = 177'h10002800316f0dfdebc4ff4bffd6ea517be02ccb2ef60;
      expv[29] = 177'h000000007a1feb05851ea6b9c044944c92aa2ccb2ef73;
      expv[30] = 177'h00000800642cffe80d1ea6b9c28093c7515a2ccb2ef7d;
      expv[31] = 177'h10001000232b4885e51ea6b9c48a5a04b6522ccb2ef7c;
      expv[32] = 177'h0000300013268463acac49c09ba235bf48ba2ccb2ef72;
      expv[33] = 177'h100068003d1527086cac49c09b14d29bf57a2ccb2ef7f;
      expv[34] = 177'h0000500042baf859acac49c09b86f19f9e55bd4542bb6;
      expv[35] = 177'h18007800348fe5ed0cac49c09bde43b34e33bd4542bad;
      expv[36] = 177'h000030006cf8ebaca0571f2116669495f3a3bd4542baa;
      expv[37] = 177'h0000480052a57740a0571f2112a8c5afc6c3bd4542ba0;
      expv[38] = 177'h1000300006460e9a60571f2115e500f48509bd4542bad;
      expv[39] = 177'h000060007ba6d5bda0f234ab8fe676a57829bd4542bb4;
      expv[40] = 177'h100040001cc4b4ed40f234ab8d73b289f76dbd4542baf;
      expv[41] = 177'h0800480042208ed680f234ab8bef6ab5a683bd4542baf;
      expv[42] = 177'h1000600015429a3ba8f234ab8b887d53b6cd8df6ecfdb;
      expv[43] = 177'h080028004f456f61411c41853bdcd2965b058df6ecfc4;
      expv[44] = 177'h1000000075f4391e211c41853e5c18dce6778df6ecfd7;
      expv[45] = 177'h08002800789b22d1291c41853da4327118558df6ecfc9;
      expv[46] = 177'h1000400024db4093291c41853b087019085b8df6ecfdf;
      expv[47] = 177'h00004800784b8b76011c41853a5ee5e25cc58df6ecfdf;
      expv[48] = 177'h0800000050db9676a11c41853c2c71742428ce855acc5;
      expv[49] = 177'h000020002f575c9e411c41853adabff4b304ce855acd7;
      expv[50] = 177'h180008004fbcd038291c41853f0791667e3cce855acc4;
      expv[51] = 177'h000070000354d52b811c41853a52a53d4902ce855acdb;
      expv[52] = 177'h000008004efed48b891c41853dbfed10ef40ce855acc2;
      expv[53] = 177'h10007000246f613ce91c4185389a9c94884c76bb61a88;
      expv[54] = 177'h080070003caa1469ae953c2af28aacf478e276bb61a83;
      expv[55] = 177'h1000080010431b7cc6953c2af01c8c39c52676bb61a98;
      expv[56] = 177'h080000000f3b40960e953c2af59d3ffddb8a76bb61a91;
      expv[57] = 177'h1000200023f2bf98c6953c2af327607d7b0876bb61a8c;
      expv[58] = 177'h0000600025ced8bb8e953c2af645e7b537f076bb61a8f;
      expv[59] = 177'h000008004879975bae953c2af6149399e45276bb61a9c;
      expv[60] = 177'h000030003e737558a6953c2af733766c614876bb61a83;
      expv[61] = 177'h00002800506a52f10e953c2af4218ca6e14676bb61a94;
      expv[62] = 177'h08007000690191fca6953c2af5cd0750fa5676bb61a91;
      expv[63] = 177'h100020002eca329a4e953c2af5071475ffce76bb61a8d;
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
