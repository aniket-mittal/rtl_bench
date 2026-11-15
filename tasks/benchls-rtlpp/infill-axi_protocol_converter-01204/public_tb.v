// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 222;
  localparam OW = 169;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01204 dut (
    .aclk(clk),
    .aresetn(in_vec[221:221]),
    .s_axi_awaddr(in_vec[220:181]),
    .s_axi_awlen(in_vec[180:173]),
    .s_axi_awsize(in_vec[172:170]),
    .s_axi_awburst(in_vec[169:168]),
    .s_axi_awlock(in_vec[167:167]),
    .s_axi_awcache(in_vec[166:163]),
    .s_axi_awprot(in_vec[162:160]),
    .s_axi_awregion(in_vec[159:156]),
    .s_axi_awqos(in_vec[155:152]),
    .s_axi_awvalid(in_vec[151:151]),
    .s_axi_wdata(in_vec[150:119]),
    .s_axi_wstrb(in_vec[118:115]),
    .s_axi_wlast(in_vec[114:114]),
    .s_axi_wvalid(in_vec[113:113]),
    .s_axi_bready(in_vec[112:112]),
    .s_axi_araddr(in_vec[111:72]),
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
    .s_axi_awready(out_vec[168:168]),
    .s_axi_wready(out_vec[167:167]),
    .s_axi_bresp(out_vec[166:165]),
    .s_axi_bvalid(out_vec[164:164]),
    .s_axi_arready(out_vec[163:163]),
    .s_axi_rdata(out_vec[162:131]),
    .s_axi_rresp(out_vec[130:129]),
    .s_axi_rlast(out_vec[128:128]),
    .s_axi_rvalid(out_vec[127:127]),
    .m_axi_awaddr(out_vec[126:87]),
    .m_axi_awprot(out_vec[86:84]),
    .m_axi_awvalid(out_vec[83:83]),
    .m_axi_wdata(out_vec[82:51]),
    .m_axi_wstrb(out_vec[50:47]),
    .m_axi_wvalid(out_vec[46:46]),
    .m_axi_bready(out_vec[45:45]),
    .m_axi_araddr(out_vec[44:5]),
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
    stim[0] = 222'h13b3769dba8213a098e281f5bfa7bda89842e222f5089aea7a2fccf8;
    stim[1] = 222'h1a65a20315490854353c2849093e36d8aae78c65749e3507c52473a4;
    stim[2] = 222'h231f7bfac0103f43c0a468a1bf45c2f3f32cf047ccfbda94c6981d33;
    stim[3] = 222'h2a78b7c85f3921a83247f273ec5f8b926c3e4dc3ca7a3078fed41b24;
    stim[4] = 222'h3634154670f4a60fd5a742524ccb8dee2c6594262d1f168ca3dc1119;
    stim[5] = 222'h3300b71c6b92040b3317d112d7fc166b00d29cf88c4d42c6be20687a;
    stim[6] = 222'h2e45832fc2bb2c0440b424fcbaf84c465ca3edd676a2c23cc08b412b;
    stim[7] = 222'h2b44dd45a23ca917e720474bc7c319266107e2f2a3d0c2fe3617a219;
    stim[8] = 222'h2799d0348dd1531d3a9c842e5f59ec9ee93de731bfa8cd5036053bd1;
    stim[9] = 222'h2dcb5ba0dec920a8d76883b7096ade7749acd81542f4d9fdca4342bd;
    stim[10] = 222'h20cb65c10c95331e5fd5a08af42dbca98d8e3719cfd502671ca6d23b;
    stim[11] = 222'h28170a226c0ab9952b322d23cb1f05a49f252e47535d182d4f022237;
    stim[12] = 222'h2bef1a2453ebbfacd9ad89cacaf70ea6dad469d8f5ed15389ec9e7c8;
    stim[13] = 222'h3b770598460d2ac586775f557231ac21d892c2725e974d4c8a5fc309;
    stim[14] = 222'h2e8a9a199e5c5ab4aa5e37aabe7029e95be4f7e1434612af6d668863;
    stim[15] = 222'h325559d9eafdac9b56e50e58308520f30e4816d0bd97dbece47c8cc4;
    stim[16] = 222'h2df2e7bde8c65693373aa423b0fde10a0558a34c7ffe72f4192913f7;
    stim[17] = 222'h22b9dcfc07e3fbca405d796abe6922ddd83e38e0684a580e8518f97e;
    stim[18] = 222'h229464e86e82cbe0a810903cc924a4e1ec3fef90e27425719dfc2dc6;
    stim[19] = 222'h23ceada504da96298fb58a05ac57fbffee51143b86b7a1010947be28;
    stim[20] = 222'h287a38e289df58727f4382067c6a3797ca191ff7f0bbefe62400d862;
    stim[21] = 222'h2adba805c1a149b47225a41a62f5908c133b25d825f9b7acd0bd8165;
    stim[22] = 222'h3fa47bba24aaa8994bd4edd652f0191922629145d3277a82aae75df6;
    stim[23] = 222'h2cb98289059a43b09f0b0949ef4f4ec8db61df86ec83125d54de62cd;
    stim[24] = 222'h3047b8b84d8c3fce0100673b438553ef274ec9a6b273a9905b4003dc;
    stim[25] = 222'h310b604be774c74ad7168693099aa383e7e9b5e1c2771fa522d7c68d;
    stim[26] = 222'h229c73cb70f488f2738bc2a6d29e8c1c229339066b17078275e560c6;
    stim[27] = 222'h391ed63877a7bf83766c2feb54c5e3ee782117810f8fbbb17eb1a3f0;
    stim[28] = 222'h3009aacbdfb3469716be883d3abf7f36b55c57e46d7458290cb0a834;
    stim[29] = 222'h2aa1bac925ab6f041fc5efab3da0d9556982e6eef7e6ca1873863b66;
    stim[30] = 222'h27682ac9b13e2821b0e1f3fa4567c68703ec639c05d345ee980dc3e1;
    stim[31] = 222'h2424812fd61adb531ace91381289087874d98f2c0e80d0461259696f;
    stim[32] = 222'h24ddedd0fe061ad73665b114fbee139ddc2181ab8158e3c2f0e91d44;
    stim[33] = 222'h36927b6c9975c650a3d747a56c08e7734d48cf20609cbad3e55f8dfc;
    stim[34] = 222'h3249ee1eb5542555c951074b0e122e962e93e69530c33db647331b63;
    stim[35] = 222'h3d546ce1733fd748522acfda86344a3475600997c39e2c5c366954a2;
    stim[36] = 222'h2f3338b867e70fbadd4ebc1f9725d296d2a9468936b99b13506343c8;
    stim[37] = 222'h257458aaefa15eafb2f95f2408eeab2889b785f83b2b6d3e359b8c65;
    stim[38] = 222'h2a03d74c93dd49b94b02876d94a1effd54b481d1ba52998ae1117a2e;
    stim[39] = 222'h286aada679fda056eb228523e4be6c631b96a385461cc9471f7bd830;
    stim[40] = 222'h321df14b43d7c7833ac8bbc0be52eb94ca879f28509dbf9c82139b64;
    stim[41] = 222'h3e4d01bead19eecfd3750960f41fd6891ffc1acf431dd2a5d5727dd7;
    stim[42] = 222'h329fda37a87c05322855c1936b4d373f97cea1214e98c8798f0a8825;
    stim[43] = 222'h2b80aaaa9d24204073d18141885a19ba440f97d97e4861410ce3b006;
    stim[44] = 222'h3ca408e31cb9d338aefe9a9aec76cbbd7204bf4920d622dd8f79aa02;
    stim[45] = 222'h3b68e7dfdd76dc45b5689f60168bcd6c015ec8452158c8a1aff06e5d;
    stim[46] = 222'h32f26876bac8349d14b2647124dfd7e6fd85debcd440b13e1aa83f24;
    stim[47] = 222'h39ac14d4a50c43dad87b5155ab41e02866411e7992af6cf71091105d;
    stim[48] = 222'h240892d0facce9f664b9c7fc67f4c1573db2bbcffc5b483eeec27c9d;
    stim[49] = 222'h3474f6ccc6824acdabbbc043e286e7e67fa200a909153d212b9847da;
    stim[50] = 222'h37382b0680ee3fe011b9dd7a412dab78159f60d8c60b4128616fa4d9;
    stim[51] = 222'h2cd7b0624d63b6ca68adde19a4fbaca253b40fe02fbdf26cbf1cb8a1;
    stim[52] = 222'h25be5dc0db25640387ea57a37d1cf0c2ebf949eefddf435a2855871e;
    stim[53] = 222'h37ee1af0e3007ec161d9e9f79dba063b826d79edfc4226fd985b71c7;
    stim[54] = 222'h3f622e26f89c492da91812955622f009c038d38a96d6883042fcd9eb;
    stim[55] = 222'h232d827874ba798777726dc419ad9c7c091e4b7abb331a03d88495dc;
    stim[56] = 222'h2baaefaa6e12d710d43631e970b8f3c378f9c343a8c6f2a54f8c3bca;
    stim[57] = 222'h335fc873d9c859d6f5314a3e08bccb9e6cc65aa49bc9766c1f5e92d8;
    stim[58] = 222'h39b3795db11313dff3624559cb7edb41875e7dce591211e69ea86c6f;
    stim[59] = 222'h3fd9e61858d9449b9999252b7d7aef339c0af9e8f62ebd82d9bfc322;
    stim[60] = 222'h2a871c5d89205157402790a529ba16b45bd34c6877f9b2f65084979a;
    stim[61] = 222'h33faff45c4ffd1fb96ce1280724b7c544283f705791c1426db63bf26;
    stim[62] = 222'h24c283e69bff177abd18ceb2f6496af16db03b310185e33a2c36e23e;
    stim[63] = 222'h37e7cdd54a75c93317073a076df59f7cc87fb66f140119c953cd8d12;
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
      expv[0] = 169'h0ea7a2fccf84ecdda76ea0e281f5bfa77b513085c45;
      expv[1] = 169'h107c52473a46996880c5543c2849093c6db155cf18e;
      expv[2] = 169'h094c6981d328c7defeb003a468a1bf4385e7e659e1d;
      expv[3] = 169'h078fed41b2429e2df217c847f273ec5f1724d87c9bc;
      expv[4] = 169'h08ca3dc1118d8d05519c3fa742524ccf1bdc58cb28f;
      expv[5] = 169'h0c6be20687a4c02dc71ae317d112d7f82cd601a5385;
      expv[6] = 169'h03cc08b412ab9160cbf0acb424fcbaf8988cb947db1;
      expv[7] = 169'h0fe3617a218ad13751688f20474bc7c6324cc20fc49;
      expv[8] = 169'h15036053bd09e6740d23759c842e5f5bd93dd27bcf6;
      expv[9] = 169'h1fdca4342bcb72d6e837b06883b7096dbcee9359b18;
      expv[10] = 169'h0671ca6d23a832d9704326d5a08af42b79531b1c6e9;
      expv[11] = 169'h02d4f022236a05c2889b05322d23cb1e0b493e4a5cc;
      expv[12] = 169'h1389ec9e7c82fbc68914fcad89cacaf61d4db5a8d36;
      expv[13] = 169'h14c8a5fc308eddc1661185775f5572335843b12584a;
      expv[14] = 169'h0af6d668862ba2a68667945e37aabe7053d2b7c9ee1;
      expv[15] = 169'h1ece47c8cc449556767abbe50e58308241e61c902c9;
      expv[16] = 169'h0f4192913f6b7cb9ef7a333aa423b0fbc2140ab147d;
      expv[17] = 169'h00e8518f97e0ae773f01fa5d796abe6a45bbb07c704;
      expv[18] = 169'h1719dfc2dc60a5193a1ba010903cc92149c3d87fdfa;
      expv[19] = 169'h1010947be280f3ab694131b58a05ac57f7ffdca2298;
      expv[20] = 169'h1e62400d86221e8e38a2724382067c6c6f2f94323ff;
      expv[21] = 169'h1acd0bd8164ab6ea01706c25a41a62f3211826764bf;
      expv[22] = 169'h082aae75df67e91eee8929d4edd652f0323244c5231;
      expv[23] = 169'h05d54de62ccb2e60a241600b0949ef4e9d91b6c3be1;
      expv[24] = 169'h1905b4003dc411ee2e136600673b4382a7de4e9d938;
      expv[25] = 169'h1a522d7c68cc42d812f9da168693099d4707cfd36bb;
      expv[26] = 169'h18275e560c60a71cf2dc3a8bc2a6d29d1838452672b;
      expv[27] = 169'h1b17eb1a3f0647b58e1deb6c2feb54c3c7dcf0422e5;
      expv[28] = 169'h0290cb0a8344026ab2f7efbe883d3abefe6d6ab8af8;
      expv[29] = 169'h01873863b662a86eb2496cc5efab3da1b2aad305cd1;
      expv[30] = 169'h1ee980dc3e09da0ab26c49e1f3fa45678d0e07d8c6a;
      expv[31] = 169'h0461259696e909204bf583ce9138128a10f0e9b31e0;
      expv[32] = 169'h1c2f0e91d441377b743f8765b114fbec273bb84302d;
      expv[33] = 169'h0d3e55f8dfc5a49edb2658d747a56c09cee69a919ed;
      expv[34] = 169'h1b647331b62c927b87ad5551074b0e145d2c5d27cc2;
      expv[35] = 169'h05c366954a27551b385cc82acfda86309468eac012e;
      expv[36] = 169'h113506343c83ccce2e19fa4ebc1f9723a52da5528dd;
      expv[37] = 169'h13e359b8c6495d162abbeff95f2408ed5651136f0b6;
      expv[38] = 169'h18ae1117a2e280f5d324f102876d94a3dffaa969028;
      expv[39] = 169'h1471f7bd83021aab699e7e228523e4bcd8c6372d46c;
      expv[40] = 169'h19c82139b644877c52d0f3c8bbc0be55d729950f3ef;
      expv[41] = 169'h0a5d5727dd6f93406fab47750960f41fad123ff834d;
      expv[42] = 169'h0798f0a8824ca7f68dea1a55c1936b4a6e7f2f9d42c;
      expv[43] = 169'h1410ce3b0062e02aaaa748d18141885c3374881f2e4;
      expv[44] = 169'h0dd8f79aa027290238c728fe9a9aec75977ae4097e9;
      expv[45] = 169'h0a1aff06e5ceda39f7f75d689f60168f9ad802bd90c;
      expv[46] = 169'h13e1aa83f244bc9a1daeb5b2647124dfafcdfb0bbc0;
      expv[47] = 169'h0f71091105ce6b053529427b5155ab43c050cc823d6;
      expv[48] = 169'h03eeec27c9c90224b43eb6b9c7fc67f182ae7b6576c;
      expv[49] = 169'h1212b9847da51d3db331a5bbc043e285cfccff4400a;
      expv[50] = 169'h128616fa4d8dce0ac1a038b9dd7a412b56f02b3ec04;
      expv[51] = 169'h06cbf1cb8a0b35ec18935aadde19a4ff5944a7681fd;
      expv[52] = 169'h15a2855871e16f977036cbea57a37d19e185d7f292d;
      expv[53] = 169'h0fd985b71c6dfb86bc38c1d9e9f79dbc0c7704daf23;
      expv[54] = 169'h03042fcd9eafd88b89be251812955625e0138071a68;
      expv[55] = 169'h003d88495dc0cb609e1d2f726dc419ab38f8123c979;
      expv[56] = 169'h0a54f8c3bca2eabbea9b803631e970b9e786f1f3861;
      expv[57] = 169'h06c1f5e92d84d7f21cf676314a3e08b9973cd98cb47;
      expv[58] = 169'h1e69ea86c6ee6cde576c47624559cb7db6830ebcfa8;
      expv[59] = 169'h182d9bfc3227f67986163399252b7d7dde673815f36;
      expv[60] = 169'h0f65084979a2a1c717624f2790a529bc2d68b7a699d;
      expv[61] = 169'h026db63bf264febfd1713bce1280724ef8a88507eee;
      expv[62] = 169'h13a2c36e23e130a0f9a6fa18ceb2f64ad5e2db60761;
      expv[63] = 169'h1c953cd8d125f9f375529b073a076df33ef990ff6c0;
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
