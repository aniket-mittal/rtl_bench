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

  rtlpp_01256 dut (
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
    stim[0] = 228'h4119d32ddc4d8f21947d12c5a571a3ef682149fcde99bcab11992f980;
    stim[1] = 228'h27da54550feba6fd1cbaa84dd1ac97d64d3643a7da8ad3ac5845ec297;
    stim[2] = 228'hbb2aab8c12b8a2f09442ea67ec75e088a96207c39cd410fe5a86b9883;
    stim[3] = 228'hbbd55871aba0c4c0ad3989911528b5b2e6e7b0c3f24a3a10135f7054c;
    stim[4] = 228'hc8620cf5f918279501db60165b53a479198ce8f25e53f9ed740f1d32f;
    stim[5] = 228'ha2d1121e5a493bb96188391cb6c7a06757f19c6b1e198541d4b1b3db7;
    stim[6] = 228'hc9011741bd2091c7c89a275fc084250f47501834309757e4b1510a199;
    stim[7] = 228'hfabe4ce2a16d31ef430381ae23d383d25e1d951bcb9dc16e3e67c8bf9;
    stim[8] = 228'hd05ea5dbe725dffd73e21a736ec1b750bb6c480cd7747bcb4486bffcc;
    stim[9] = 228'h97bbedfc4796a28422916f3fb8a5c46c33cd49ea47961cd637d062e16;
    stim[10] = 228'hc11f67ccad8fea3802db63983ba12789271a2857792136dce7c1886a8;
    stim[11] = 228'hb5add8a9e7f0220fbbd15668998d238d349ca46822947578cc79e4e44;
    stim[12] = 228'hc537ea76f7edf13370d54bdb47e7abd1fad2e0dc26fe52944f2b540c3;
    stim[13] = 228'h8195d649c94f376cc9ec76c6f22937c589c29feb4e92b0149b3b475ef;
    stim[14] = 228'h9c259dfd0ce329c91f5eff16c6d32ce17c4273dd34a08d1e083c821d4;
    stim[15] = 228'h8420733561d75ea79b4360f104fcc30f488f972db520a9ad10e807522;
    stim[16] = 228'he2c4582f38a005eb631e3ddd94551a9ce758dd028b3abf7d619f9175a;
    stim[17] = 228'hd6972b5343c2d61a3072458052fcc2c38fce2bae39474465c966cb9d2;
    stim[18] = 228'he587774522d4c9208fe76256063ecdcf85bdc3a6df0ba2779c1af80db;
    stim[19] = 228'hb41c996bd25db43630cf1b7157e3de12e496550a675201309a3bdfb53;
    stim[20] = 228'hcdbdbb438898cc9911e267d7dc680899b4c4dc420d76578dc0c771a4e;
    stim[21] = 228'hd2b901c85b8c41fcc83c287b435baa1a6072384ee12b45f3d5c058829;
    stim[22] = 228'ha385b2834343d3735334445929005e37e10079dc68148b6b07bf8d7e7;
    stim[23] = 228'hcbc299da02611150c5457891d6cbf6eac04116c09cbd2c525fbaea16d;
    stim[24] = 228'h95cd20d7b6c5ea6073f1a0aff44b8bf0848be35ce9a62b0798cac6681;
    stim[25] = 228'h50419005c5456dd1fb444a9f91eeff8b9686d4e833febea8b581a39e9;
    stim[26] = 228'hb2711de41e2f5e19b00175959199bcd00ac5526656af31a1925fae616;
    stim[27] = 228'hcf58e1a681634d4dd0d1fa9901eff99bf5a236860ed674f8ee821bdc9;
    stim[28] = 228'hab1d18da969149d3e2477b0e58118b1672b674bc914df898068c50dd3;
    stim[29] = 228'hac162eb6804ff543550ed1cc39ea0fc0969c9a65981ae37fafd5f1e67;
    stim[30] = 228'h946e6b1aa1e9f4aa5d5473ee701893b6c32e82da693b2a6d4e6aa72f4;
    stim[31] = 228'hc91ed75d6a4c7a101b8f547954e9a926cc0ab12a4287ce714698e313c;
    stim[32] = 228'hf158153a2afa1d01e749241355ef6341089ad643a0fb5096795221bcd;
    stim[33] = 228'hff2546e142700b575f01b92fcbe38c6132f111d77c4a5ce37edf09fc2;
    stim[34] = 228'he78777d4e89c05386310037f7a4bc8cc5336a041e46032fd8e8a368c7;
    stim[35] = 228'h9271fde56a66033eed23c637865b08451c39c4d57203998a7776925bc;
    stim[36] = 228'hf18fbdb6810539141e7a663c57a038a6c039eba2f0c485620e042e573;
    stim[37] = 228'h819e53dcb47a004ec5e396f47b92fecae12e132158b9dbe246bcd4c11;
    stim[38] = 228'hb656c39d64617dc4ebf2862fecdddb6c4247090e9f7db21787cf3e042;
    stim[39] = 228'hc6664d102b2108b99380a209bd3d85ca730e3ab169b1fdd3b84bc94ed;
    stim[40] = 228'h8ca40e19c5e25e20ee2351b60979e3ae94099961c4ff97122f42a0d0a;
    stim[41] = 228'hfcd075604508428d50d18844da629e985bd82462d4a407ae2985465fe;
    stim[42] = 228'hb7fbe24688b675f2bde3bc5887f2d2ed850ffedb5f804562aedabe737;
    stim[43] = 228'hfb3b3a7ec06a50fe8892078639beb0ac04afb42ec4f6408888dd5625b;
    stim[44] = 228'hb914fada8834a5e3c5f2016645b1b077c146df65ccfa0887d15f58b11;
    stim[45] = 228'hbb48980468a56a2f50de9a7b64bfb8e7cf5431798774f756b38d00858;
    stim[46] = 228'h879c6bbfdd524a838d9eca18fa4b3a4e6e9d0fca6b41b7388a1f5bf91;
    stim[47] = 228'hbc924b25a8b6b0b11d174b354c578a71b8d818393096b973b6b8d8978;
    stim[48] = 228'h931a8426ef89f1741a607726e82ab238e779105ad242351959a61f971;
    stim[49] = 228'hdb89b1461fb4083ba8dbdc6ead27cbdb499ac1f097665ed88277e80de;
    stim[50] = 228'ha87f754fe3944609abcb06f669cf74596555e4e1c830b5ec43df14025;
    stim[51] = 228'hfbed634ef5bb454ca7f6a7b6d94d5fc0715597e17c7dd7af1c6ec99a7;
    stim[52] = 228'hcd8c53534cb9feeba8264f17940454d9170e70076bb616ef0e3a68ef1;
    stim[53] = 228'hf8b52f07faaf9b69c967137ec7dd72ca4ac98ec40c7bc161943b043c3;
    stim[54] = 228'ha368f02e6672cd28015082b5b153d2a3243796c3656e4c094aa67c9bf;
    stim[55] = 228'he059010a17b2d11cd58e36045902836433220dc051b70928992190a35;
    stim[56] = 228'hd3936d75fc60b28cbd2d0a236be7e7b455d4c342946cf0c2687ed0815;
    stim[57] = 228'hd49d39da13fbbf8e80d0f15c973cc3d11cb567557bfe69e5393812b49;
    stim[58] = 228'hec51311b3fdcf88cd2ab090f4a022c442147c640886990b11762af6fc;
    stim[59] = 228'ha57c2e00885ec65e83afaa52378aa60b4582d23e0228a3c6d7cea2ecf;
    stim[60] = 228'hecea9f4ad8d09241036f9664bd1c0fb50caa601103b2fea97e2519733;
    stim[61] = 228'ha1569fcee0c97f6ffcf8c4286ab998a3f28b3445ac03149fbc82f1f39;
    stim[62] = 228'h9c2ff774e9db575fbd4c5f7f4a1fb6365aec0bcf2a02e875b04040bbf;
    stim[63] = 228'h8e14a93d7a25e427bfffd8e61ed1b7e3405d48d816d2782083527c689;
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
      expv[0] = 177'h0c11b7bd91992f9811d32ddc488962d2b8d282149fcdd;
      expv[1] = 177'h0a7dc7595845ec297a54550feed426e8d64ed3643a7c9;
      expv[2] = 177'h1bb2e222da86b9883aab8c12b8f533f63af096207c38b;
      expv[3] = 177'h13bd06cb935f7054d55871aba044c88a945c6e7b0c3fc;
      expv[4] = 177'h0c8651e4740f1d32fa0cf5f91a300b2da9d598ce8f25f;
      expv[5] = 177'h022d199d54b1b3db79121e5a4c1c8e5b63d17f19c6b02;
      expv[6] = 177'h04904c3d31510a19991741bd2313afe0421475018342b;
      expv[7] = 177'h0fabe7493e67c8bf9e4ce2a16f40d711e9c3e1d951bc3;
      expv[8] = 177'h0d05b542c486bffcd6a5dbe7268d39b760dfb6c480cde;
      expv[9] = 177'h117be1b0b7d062e173edfc4792379fdc52e53cd49ea4e;
      expv[10] = 177'h1c11ce24e7c1886a9767ccad8c31cc1dd09671a28577a;
      expv[11] = 177'h1b5a8e34cc79e4e455d8a9e7f7ab344cc69349ca4683b;
      expv[12] = 177'h14534747cf2b540c3fea76f7e9a5eda3f3d3ad2e0dc28;
      expv[13] = 177'h10194f161b3b475efdd649c94e3b6379149e9c29feb58;
      expv[14] = 177'h19c26385883c821d559dfd0ce4ff8b636995c4273dd24;
      expv[15] = 177'h0842543d10e8075230733561d3b078827e6288f972db5;
      expv[16] = 177'h1e2c5273e19f9175b4582f38a51eeeca2a8a758dd029f;
      expv[17] = 177'h05695b0e4966cb9d372b5343c5a2c0297e62fce2bae23;
      expv[18] = 177'h16587f3e1c1af80dbf774522d0312b031f645bdc3a6d3;
      expv[19] = 177'h1341884b9a3bdfb53c996bd25b8db8abf1ee496550a61;
      expv[20] = 177'h0cdbda66c0c771a4f5bb43889cb3ebee34014c4dc4208;
      expv[21] = 177'h152bb869d5c058829901c85b8e143da1add2072384ee3;
      expv[22] = 177'h0a3830df87bf8d7e7db2834341a22c94802e10079dc67;
      expv[23] = 177'h14bc23ab5fbaea16da99da02603c48eb65fe04116c096;
      expv[24] = 177'h015cffc218cac6681d20d7b6c0d057fa25c248be35cf4;
      expv[25] = 177'h0d040e2e3581a39e999005c540a54fc8f77f686d4e83d;
      expv[26] = 177'h03271b40125fae61711de41e2cbacac8ccdcac5526659;
      expv[27] = 177'h1cf58e6fee821bdc98e1a68166fd4c80f7f95a236861b;
      expv[28] = 177'h1ab18459868c50dd3d18da96913d872c08c32b674bc9c;
      expv[29] = 177'h1ac17f022fd5f1e67e2eb68049e8e61cf50769c9a6593;
      expv[30] = 177'h0946d6db4e6aa72f566b1aa1edb9f7380c4a32e82da77;
      expv[31] = 177'h1491949b4698e313d6d75d6a48aa3caa74d0c0ab12a47;
      expv[32] = 177'h1715e504795221bcd8153a2af81209aaf7b289ad643a8;
      expv[33] = 177'h07f23184fedf09fc3546e14273dc97e5f1c52f111d76f;
      expv[34] = 177'h1e785b310e8a368c7f77d4e89c01bfbd25e1336a041fb;
      expv[35] = 177'h092721147776925bd1fde56a67631bc32d81c39c4d56c;
      expv[36] = 177'h0718a29b0e042e573fbdb68102b31e2bd018039eba2e3;
      expv[37] = 177'h0019a32bc6bcd4c11e53dcb47f4b7a3dc97e12e13214f;
      expv[38] = 177'h13657db107cf3e0436c39d64624317f66eea247090e98;
      expv[39] = 177'h14663f29b84bc94ede4d102b24d104de9ec530e3ab17e;
      expv[40] = 177'h10ca26ba2f42a0d0b40e19c5e028db04bcf34099961c8;
      expv[41] = 177'h0fcd62612985465ff07560450ec4226d314fbd82462c1;
      expv[42] = 177'h037fabb62edabe737be24688b1de2c43f96a50ffedb43;
      expv[43] = 177'h0fb38ab008dd5625bb3a7ec06f03c31cdf584afb42ec0;
      expv[44] = 177'h039179df515f58b11cfada883100b322d8d8146df65c4;
      expv[45] = 177'h13b4eb9f338d008590980468a7cd3db25fd8f5431799a;
      expv[46] = 177'h187989398a1f5bf91c6bbfdd51650c7d259ae9d0fca79;
      expv[47] = 177'h13c939c6b6b8d897924b25a8b0a59aa62bc38d818393f;
      expv[48] = 177'h193190e3d9a61f971a8426ef8abb9374155a779105ad8;
      expv[49] = 177'h1db88f6d0277e80df1b1461fb56e375693e299ac1f08e;
      expv[50] = 177'h0a87c165c3df14025f754fe394037b34e7bc555e4e1db;
      expv[51] = 177'h0fbef7019c6ec99a7d634ef5be53db6ca6af15597e169;
      expv[52] = 177'h0cd8f3640e3a68ef1c53534cbd278bca022d70e70076b;
      expv[53] = 177'h078b1b29143b043c3d2f07faac09bf63eebaac98ec403;
      expv[54] = 177'h0a36928ccaa67c9bf8f02e6674415ad8a9ea43796c364;
      expv[55] = 177'h0e058d90992190a359010a17b69b022c81433220dc045;
      expv[56] = 177'h053926d1687ed0815b6d75fc668511b5f3f75d4c3429a;
      expv[57] = 177'h0549d744393812b49d39da13ff78ae4b9e63cb5675577;
      expv[58] = 177'h16c511109762af6fd1311b3fde8487a50114147c64089;
      expv[59] = 177'h0257e82d57cea2ecfc2e00885f55291bc556582d23e12;
      expv[60] = 177'h0ece96d47e2519733a9f4ad8d04b325e8e06caa60111d;
      expv[61] = 177'h1a157a8fbc82f1f39e9fcee0cfe214355cc928b3445a8;
      expv[62] = 177'h11c2d8d9304040bbfff774e9dfafbfa50fdfaec0bcf37;
      expv[63] = 177'h00e10f8d03527c689ca93d7a23ec730f68de05d48d81d;
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
