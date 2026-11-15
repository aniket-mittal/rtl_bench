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

  rtlpp_06000 dut (
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
    stim[0] = 228'h6f72baae1cb093e27c53099efbc91d11979cbf31bc167558f7bcaab8c;
    stim[1] = 228'h532de5a8c46c3584dae3e1f1089c7f2142c4873847d82e1dab4a140de;
    stim[2] = 228'hd20e036f19f74032ad5030ef970d58b429fedc48db7d5626a19c31490;
    stim[3] = 228'hbd764a10243b1db13e9cd659836f8860e06b899e8c80d9f388d7fa433;
    stim[4] = 228'h954f3399fed37e92dc733789ef1d3e3db04f9bb819a5b78b3afb5b7a8;
    stim[5] = 228'hc6a863673e8d2c7ec127c582f7762ef2e250be1e3f7f17ff4144e63fa;
    stim[6] = 228'he2b2891649ef1109bf0e72d2e0ac8aa2d0ace2661890ce35c74d51840;
    stim[7] = 228'hf3635deb2b8ff8733bf78fa6daa0f684e7dd45883150f29ada60c97f3;
    stim[8] = 228'ha17004e4f6f1a7779fe7dbded1b8978b512ed42777245c33e702780e2;
    stim[9] = 228'he56d4b3193c90a9344a070fdf1b777979796737fca81be5826b0f8f20;
    stim[10] = 228'hc879db33150db816d5bf70a60317f4ee1d5f4203cd4630d1be9e62c56;
    stim[11] = 228'he3bddeafccbf440e47c566ac0fd0db77af19f27849ca5116985b25563;
    stim[12] = 228'hd0e53ad4466c9a19ec9a7cce7e888ad2c6084cdf8396eeab3a62ef82d;
    stim[13] = 228'hf9dff4421854a6644db69b55e31c47a567277a1ca01651b6cde24c407;
    stim[14] = 228'he17a37c4460ab160c763b708ebe614c6258e0be85566f9ee546578ebd;
    stim[15] = 228'h8bc8dd071b488c710f8638662dde71aff2b1204ac7c91c3d8793d0935;
    stim[16] = 228'ha1ba8a01cad038655f89920b4ae5b3bdbea0319047827dc4aa04803fc;
    stim[17] = 228'ha93f984f0e2c82cdcd60b5d77a5f534ecb947169451de5cee478bf6ee;
    stim[18] = 228'ha4ac8dfa6d134a99271b13d8c3950d53f7bc8cf59c75f67aed6e64b5f;
    stim[19] = 228'h95804f39c15a97b69760c92eb94c0faddb28125825af320ac379031df;
    stim[20] = 228'hc9c4d4fa6f64a47dda52977971fa077f51f9267077717002caab9a260;
    stim[21] = 228'hbed8887808e68db876ff656c1e0316f3b8a77127bd57e1a0ac609b310;
    stim[22] = 228'hbf1c9e72faa113dd2cf6728300c9a7867c9dca69f200bcd5e98c4fbb6;
    stim[23] = 228'he7f9f2d029378f9cb17759a7aaee59fcbff26bde22aaae7672592d0e6;
    stim[24] = 228'h8a9c1d5f2fc45c3683925f88c108dae5aa1466047449197aeee94b116;
    stim[25] = 228'hdb65e645492438def03a796c71e83bc7bfb8fdf0e698132167379cccd;
    stim[26] = 228'h96fe0361f04d0eaab995cad508114d8b2b1a78e210e5a877ddaf87b97;
    stim[27] = 228'h8ea3f944020c811880147044340fdc561d7d407631d14719d4b73c1e7;
    stim[28] = 228'hbb8fa6e22447b765e981805b3645831a58fcc752bdd150526ce00473e;
    stim[29] = 228'hfbc94758048926bf539126490b4809face92d3d83c0778a2ea163024d;
    stim[30] = 228'hc399675a6d12a72d930c9d8ed520658588303e86f9731c1d3bf40de01;
    stim[31] = 228'h8fa1e53fdc12354ffd733b1caaae27356594f3821db6cdbba82cb6335;
    stim[32] = 228'h9a6e0463b5845a8df04dc7450a93de3448b53016b5ce9779a0e244a74;
    stim[33] = 228'ha78285353a5ea4f96fc0aaa0b003dfbda8765b7d9531cc603cc903f31;
    stim[34] = 228'ha628348943f00358ddb5bdef6493953345c321eb20f2da3685f04e0c8;
    stim[35] = 228'h29703cdba6200625eccf3412edf2af9dd3b84961b9569fd3490ae2db9;
    stim[36] = 228'hcfbbddd9b330a7a85e1d7a3ab1a30b467bace4ba3c16e0bc4142dd2ee;
    stim[37] = 228'ha0cbe1bec25f6c76cc8e9a35fe4314d79a2488683d499a2567c17a65c;
    stim[38] = 228'h70573ff0ba5468e2bfa62085dd8d15dede44aa34bd84310ca9b40639a;
    stim[39] = 228'ha7606507c2d6e2bdaa498a872a0814305af15329bcf10b6465218451a;
    stim[40] = 228'ha553b6100b8594b7bbb528f781faef334218bcf701c71771a6ec987f2;
    stim[41] = 228'hdd864362719333331599ff0a2293859c42b24687a5a746662bb6a72b4;
    stim[42] = 228'hd74b637a14fa75e61331c0447099db69af3d8dbdc65cc78c0331cb708;
    stim[43] = 228'h84ea37323b72ebb55b7087ec17db894bcd13844443389dea50d117efc;
    stim[44] = 228'h825917aa9053281a74651689def5257caae5ae58246f25c0de6c24e9f;
    stim[45] = 228'hf34e2093e56c699e0a6b22c979deda3a3364e75a87bc5cd4da7a322d4;
    stim[46] = 228'hf753fc1431d77f7060f600e680023e33b912b1135e4f96a0ce2b9d650;
    stim[47] = 228'hb225cf7a259aba4d3fe9ffe260eb160581f73c53a3b993be9cbeccd53;
    stim[48] = 228'he8b8b2deff78f099b4e4279848f313e371b6a2a332575d33d87552c74;
    stim[49] = 228'h9a07195e9acc821272d62a4fce444bd1f03d647cedeb88a04c3b24b7a;
    stim[50] = 228'hb4f6dfe343c1a0d18342f3e3a9da26340f83b1707320870a7eef20679;
    stim[51] = 228'h81ff230627f5b3147cd15ca52f1b94731b356eac98941fb334e3f14fc;
    stim[52] = 228'hcfa9f2e11327241e8172404afdefe7b0e4408079ca534f0ca1b5bafb8;
    stim[53] = 228'hf90845506fdadce4c265e9e4d6ce476798c25884889223e4a0cdcea7f;
    stim[54] = 228'hc4291f620e4ee7a07374451b02052047fa934dc75408fada50ca7f6d3;
    stim[55] = 228'h16d7a6b1164887114ed86e71f795f09fc59932b08aea4304d68b827ea;
    stim[56] = 228'hd9af90d31149cede01bb100b39dc9242c231d5889c82f6663bca956fa;
    stim[57] = 228'ha7d2d77822c97cfe52ab9edd14ed3a38f7363c181d0ffddb44b712b6f;
    stim[58] = 228'h838b20f5f14b902da30b4a92f6b6a031e152adcbf78ffe8cebcd80d37;
    stim[59] = 228'h8fd037a7b4714f56f670990fd000428d56f048c5d47167a67e9f1ab9e;
    stim[60] = 228'hcfa4392fd051c599fbdf183e3039875743574fae1ff0eddc67759bf20;
    stim[61] = 228'he7f6e28d7703d5cf4e7a0309e3846d56803d4f2adff1dccfdeaa83565;
    stim[62] = 228'ha6bab0a1facc74ed398ad04238877ffc532c855952411fd634eb4a98f;
    stim[63] = 228'ha2505f4be9fb1e0852e2b375b6159e0ef3c13b127d0bc696f21c67105;
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
      expv[3] = 177'h000000000000000000000000000000000000000000000;
      expv[4] = 177'h13d7398388d7fa43264a102438800000000006b899e8e;
      expv[5] = 177'h0bd7218388d7fa43264a1024389bc4f78e9c06b899e8e;
      expv[6] = 177'h046ae98388d7fa43264a1024389bc4f78e9c250be1e2a;
      expv[7] = 177'h162b418388d7fa4322891649ec9bc4f78e9c250be1e2a;
      expv[8] = 177'h0e2b4213da60c97f3a891649ecc7d36d507c250be1e2a;
      expv[9] = 177'h12172213da60c97f2004e4f6f3c7d36d507c250be1e2a;
      expv[10] = 177'h0a172a13da60c97f2004e4f6f3b87ef8dbbd796737fde;
      expv[11] = 177'h14879213da60c97f21db33150bb87ef8dbbd796737fde;
      expv[12] = 177'h048785de985b255639db33150bb87ef8dbbd796737fde;
      expv[13] = 177'h050e25de985b255621db33150bb87ef8dbbd796737fde;
      expv[14] = 177'h0d0e2695cde24c4061db33150bcdaaf18e25796737fde;
      expv[15] = 177'h050e2b18d46578ebc1db33150bcdaaf18e2458e0be85e;
      expv[16] = 177'h00bcd6bf8793d09341db33150bcdaaf18e2458e0be85e;
      expv[17] = 177'h10bccebf8793d093428a01cad2cdaaf18e25ea031905e;
      expv[18] = 177'h00bcc6bf8793d093428a01cad2cdaaf18e25ea031905e;
      expv[19] = 177'h08bccd4fed6e64b5e28a01cad289ec61ca857bc8cf59a;
      expv[20] = 177'h10bcc6b74379031df84f39c15b89ec61ca857bc8cf59a;
      expv[21] = 177'h08bcc6b74379031df84f39c15bcbbcb8fd057bc8cf59a;
      expv[22] = 177'h10bcc6b74379031de0887808e4cbbcb8fd057bc8cf59a;
      expv[23] = 177'h0bf1ceb74379031de0887808e4b9418064d5c9dca69fe;
      expv[24] = 177'h13f1c6b74379031de1f2d02936b9418064d5c9dca69fe;
      expv[25] = 177'h03f1ceb74379031de1f2d02936b9418064d4a1466046e;
      expv[26] = 177'h15b6071ee7379cccc5e6454927b9418064d4a1466046e;
      expv[27] = 177'h096ffe2cddaf87b965e6454927e56a8408a4b1a78e216;
      expv[28] = 177'h016ff15854b73c1e7de6454927e56a8408a4b1a78e216;
      expv[29] = 177'h016fe95854b73c1e7de6454927e56a8408a58fcc752aa;
      expv[30] = 177'h116fe15854b73c1e614758048fe56a8408a58fcc752aa;
      expv[31] = 177'h0c39d6163bf40de0194758048fcec76a90358fcc752aa;
      expv[32] = 177'h1439c6163bf40de001e53fdc17cec76a90358fcc752aa;
      expv[33] = 177'h09a68e163bf40de001e53fdc17e3a28549ec8b53016aa;
      expv[34] = 177'h01a686f6bcc903f301e53fdc17e3a28549ec8b53016aa;
      expv[35] = 177'h000000000000000000000000000000000000000000000;
      expv[36] = 177'h000000000000000000000000000000000000000000000;
      expv[37] = 177'h100000000000000003ddd9b3348000000000000000000;
      expv[38] = 177'h000000000000000000000000000000000000000000000;
      expv[39] = 177'h000000000000000000000000000000000000000000000;
      expv[40] = 177'h08000800000000000000000000454395040daf15329a6;
      expv[41] = 177'h125500000000000003b6100b83c54395040daf15329a6;
      expv[42] = 177'h0a5508000000000003b6100b83ff851149c42b24687a2;
      expv[43] = 177'h125500000000000003637a14fbff851149c42b24687a2;
      expv[44] = 177'h025508000000000003637a14fbff851149c4d1384444e;
      expv[45] = 177'h1a5505f2de6c24e9f917aa90558b44ef7a94d1384444e;
      expv[46] = 177'h02550df2de6c24e9f917aa90558b44ef7a95364e75a8e;
      expv[47] = 177'h0a5505f2de6c24e9e117aa9055807340011d364e75a8e;
      expv[48] = 177'h125500161cbeccd525cf7a259e807340011d364e75a8e;
      expv[49] = 177'h068ba0161cbeccd525cf7a259e807340011d364e75a8e;
      expv[50] = 177'h168ba0161cbeccd527195e9ac9807340011d364e75a8e;
      expv[51] = 177'h0e8ba0d07eef20679f195e9ac9f9f1d4ed15364e75a8e;
      expv[52] = 177'h101fb0d07eef206787230627f2f9f1d4ed15364e75a8e;
      expv[53] = 177'h081fa0d07eef206787230627f2a0257ef7f5364e75a8e;
      expv[54] = 177'h001fad9e20cdcea7e7230627f2a0257ef7f58c2588492;
      expv[55] = 177'h000000000000000000000000000000000000000000000;
      expv[56] = 177'h000000000000000000000000000000000000000000000;
      expv[57] = 177'h000008000000000000000000000000000000231d5889a;
      expv[58] = 177'h127d20e3c4b712b6fad77822cf8000000000231d5889a;
      expv[59] = 177'h027d20e3c4b712b6fad77822cf8000000000231d5889a;
      expv[60] = 177'h127d20e3c4b712b6e037a7b4738000000000231d5889a;
      expv[61] = 177'h0a7d28e3c4b712b6e037a7b4738c1f181cc43574fae16;
      expv[62] = 177'h067f755a5eaa83565837a7b4738c1f181cc43574fae16;
      expv[63] = 177'h1e7f6d5a5eaa83565ab0a1facee8211c43bd32c85594e;
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
