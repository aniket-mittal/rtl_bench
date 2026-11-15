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

  rtlpp_02853 dut (
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
    stim[0] = 218'h1ce60e2f98cd54a4a696c16bc3ea224db8ed5610ed5013fe3d581a1;
    stim[1] = 218'h1e96f3c03c38c89766c29540f07e30f0856a73064ea729f231a0aec;
    stim[2] = 218'h2c1cc4926598fa07037b58bae0c25645cc1c271cab7662bbb2c34cd;
    stim[3] = 218'h2950ae349635d79a6119f65f099e19768e91ea4957f73c7f0e084d0;
    stim[4] = 218'h2d67549c1b990903c0266b2626ddc38b84890b5f60924a00c3cbde8;
    stim[5] = 218'h2ff7df36564019e6d031835e32f8d0e6ab44f138c5a1557b134a196;
    stim[6] = 218'h3d766696aef9eeb0d887e90b6b9ef388dc6700641e2b1aa3bcc7ef3;
    stim[7] = 218'h3b7763635cc5f826bf4ab669abab4e5a73f439f9431d79217f0a462;
    stim[8] = 218'h308735df55373e7425b7a8c2c5d5b0fd30d02a657cfef970c5d5b3f;
    stim[9] = 218'h286833e80ddbd1f01f4d24d87b97e9b45774c5ae1226ba8f0fc097d;
    stim[10] = 218'h35c7b004dabc15f86709db6e921de8259057805c6c145fadfb5a2c9;
    stim[11] = 218'h21b60434d27672814fba00e75f49f238c5408cfcf56d292dd6ba392;
    stim[12] = 218'h2e78c5fc6e0a1929dd04370c753bc6e9ddfff0a5abd2ed7cceed4af;
    stim[13] = 218'h30f9129dcc3a6635efec987a43825e1c20847730081199de3c3b1ad;
    stim[14] = 218'h3efd55197a1951a72a77202426cda1e5626981fb1f36dd5ef4e64b3;
    stim[15] = 218'h3bceed76ee73dfb6932726829d1b74e8c487c723f95d1228f7935d6;
    stim[16] = 218'h3339834ce9f9a106d96726e01cf996c95e2b91dff2233b7d2d1d083;
    stim[17] = 218'h3c04601c0698a039b049e09738b1f03fcb94a859ea1c113047b0e89;
    stim[18] = 218'h386765ef3fc6fd04d9ca0fa1212359cbaa72f4a666440954528ce17;
    stim[19] = 218'h3918ef2ae3c0824ebd52274a0eaf73e896c9a39cab8844c10bce2d5;
    stim[20] = 218'h300a1502107291e4930f64d06bd3c1ff7bdec347bc5e836434c3b8a;
    stim[21] = 218'h3e7b4b315248055bdee3027d0ab5ee2d7e1a68649b0764f66528657;
    stim[22] = 218'h32b6190c579c82590c7c4656cddaf2da043a09e919d615ea810f4c6;
    stim[23] = 218'h374fea4c318f7086142453a917ca76b91d6250d576afa030af79d67;
    stim[24] = 218'h22853bbab4c16d239000b22c19419c7bd5cadcf04d13301b0265c64;
    stim[25] = 218'h30ef53a52a7dd43d1d56a4af75ba9d44634f537633f5767bc656fbe;
    stim[26] = 218'h34b617f608dc4e36c36b11bbcf3edcb127a34e56a0ba0535a0525ca;
    stim[27] = 218'h213bd9c868dc7a2083ac9ea9b6fb86213b0565da00b14b531bc9542;
    stim[28] = 218'h26302266632b948c9aac274dea90a5bd77ba59666e8ecdf46039463;
    stim[29] = 218'h3019f89041ae843175ed71120f6e3edafcf88b77c57396781bbd156;
    stim[30] = 218'h341e84ea1d70072902cc12a6199937e2706efdaeb705f5d3c7f85fc;
    stim[31] = 218'h205b362a7c5c872d356f31ac491ecfda9f33a5c3c7364067cc14059;
    stim[32] = 218'h2e2f105dfe95ec87d76e5fdb52fc51cfb096a6b176136eaef2031c1;
    stim[33] = 218'h354badfa07711bb0ba93b21fdf801ba8409c0fc53da223c78b3abb6;
    stim[34] = 218'h266f26a356b285f6eb91af0c032d2623952757cf77d5b482977c778;
    stim[35] = 218'h310b383d8c381896ea7ac8ee8f52fb3851bac3c2b860a562f52e654;
    stim[36] = 218'h2121b91d3ef141ee43ab986e423b5441745b22c6f890a92a648cf21;
    stim[37] = 218'h36798030ba4029db64e9fb4d031dcb7790c176281ebf531e6625a7f;
    stim[38] = 218'h29d07d8eb6901e2a1a0c5d7f59bb6fa8b6d2aaf7fbd40650e797289;
    stim[39] = 218'h20041c9ec45bde42bfe0be206a82910fc733fe8be8d0467f83dad0f;
    stim[40] = 218'h22560f7c8a001279b199668007544083ccf4ffecdf23fea7eb19af6;
    stim[41] = 218'h3788d65dc94026c719eda742ba8c153d4211470fb9bf5da9dda158d;
    stim[42] = 218'h3ab2c58c3ccbd9a2326e97cb22c0344f16efb2feed2e3519544263a;
    stim[43] = 218'h20c0c00fb7158d13ffe81c61be4ab8bea6fc3e7734d9666b62f54c2;
    stim[44] = 218'h2b16601a60ee77dfc62e26583080a41bcd44b895118f582635a0934;
    stim[45] = 218'h385658b8fc2943573bf6b7d7460585b37908369ddfeca1dc76d9058;
    stim[46] = 218'h3b2565cc755081acb373ef3835ee4b648bda80bffe92487e6ff2180;
    stim[47] = 218'h2cd60a8e4503808ec645a234ca1c55a4ed969ba15ca3e06aab4d671;
    stim[48] = 218'h3c96a3aed38aaf0b065d56c52147afa0458aefd4220359a735e6319;
    stim[49] = 218'h2334dcdfc9f6cc142ba40043c03fe2ca0b0937461ef1960c3274351;
    stim[50] = 218'h3aa6961c15f2ed125eab4439470afbd5a0ab3dc2925710202f3c0f7;
    stim[51] = 218'h28ea079e211d1bae8eeb524cced1ced135b430e5ea751feb962829b;
    stim[52] = 218'h24150fa4e3b163e85cf6d120c45b6dc96b0767d7a3486545853b389;
    stim[53] = 218'h24f26aef9e525af59b7647545d161e7d54d35cf55d896ae86188944;
    stim[54] = 218'h323034071df1efae53d0961f350b680e2849dc029bf339f4280de5a;
    stim[55] = 218'h3e76cf4ddb14d452dd474f3001a04b18663455fc18c3044bf094430;
    stim[56] = 218'h340ad8dea2042fa52adb387a1a86190b66478373f39ec21f7a1a0d8;
    stim[57] = 218'h2205142f235aa36f23636f00aa0fae0a66711895c29a4e726ed3a72;
    stim[58] = 218'h31d81758c6f55ad60ffc36652c96ca44f21442f21f61bd928028ae9;
    stim[59] = 218'h24905a39d0e26e05db724ee727c8c568ae47ee3f106a8dcfc4a4b06;
    stim[60] = 218'h20dcc734b2c1a7ffbcf0ea159df8d69ba97c93f452b62ac1cf523d2;
    stim[61] = 218'h217467dc7f58b9f7090858fe36fcacf69fb9b669589399a7c8d75a5;
    stim[62] = 218'h2fbfcbb40c7321c9b3e527972526b4cc76d6b741a2f28666aa5d723;
    stim[63] = 218'h330c1e38497f73b3911f15c83c763d9da60f4fd4817894c3c76cfb6;
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
      expv[3] = 165'h1b072bbb2c34cd9cc492659ded62eb830c8b98385b;
      expv[4] = 165'h1a470ff0e084d150ae34966467d97c2672ed1d23dd;
      expv[5] = 165'h1b46e00c3cbde967549c1b8099ac989b6717091206;
      expv[6] = 165'h1be66fb134a19777df365610c60d78cbc1cd5689ee;
      expv[7] = 165'h1f477a3bcc7ef3f66696aec21fa42dae6711b8ce10;
      expv[8] = 165'h1ec7a217f0a4637763635c9d2ad9a6aedcb4e7e87b;
      expv[9] = 165'h1c26df0c5d5b3f8735df5556dea30b1721fa61a047;
      expv[10] = 165'h1a07f0f0fc097de833e80dcd349361ee3368aee991;
      expv[11] = 165'h1d66f2dfb5a2c9c7b004daec276dba48704b20af02;
      expv[12] = 165'h1866fadd6ba393360434d20ee8039d7d44718a8109;
      expv[13] = 165'h1b87e7cceed4aff8c5fc6e2410dc31d4cdd3bbffff;
      expv[14] = 165'h1c272de3c3b1adf9129dcc5fb261e90e1c384108e0;
      expv[15] = 165'h1fa6d5ef4e64b3fd55197a19dc80909b63cac4d31a;
      expv[16] = 165'h1ee7ba8f7935d74eed76ee5c9c9a0a7449d1890f88;
      expv[17] = 165'h1cc6cfd2d1d083b9834ce9959c9b8073cd92bc5731;
      expv[18] = 165'h1f06fb047b0e8984601c06e127825ce2807f972950;
      expv[19] = 165'h1e07ad4528ce17e765ef3f97283e8484939754e5f0;
      expv[20] = 165'h1e47bc10bce2d598ef2ae3b5489d283ae7d12d935e;
      expv[21] = 165'h1c07e6434c3b8b0a1502101c3d9341af03fef7bd80;
      expv[22] = 165'h1f86f766528657fb4b31526b8c09f42abc5afc34db;
      expv[23] = 165'h1ca77ea810f4c736190c57e1f1195b3745b408740c;
      expv[24] = 165'h1dc73b0af79d67cfea4c3190914ea45f4d723ac4b5;
      expv[25] = 165'h18a6c9b0265c65053bbab48002c8b06518f7ab95a9;
      expv[26] = 165'h1c274fbc656fbf6f53a52a755a92bdd6da88c69ebf;
      expv[27] = 165'h1d276b5a0525cb3617f608ddac46ef3cf9624f4684;
      expv[28] = 165'h1847c531bc95433bd9c8688eb27aa6dbcc42760ac6;
      expv[29] = 165'h19865746039463b02266633ab09d37aa0b7aef74b6;
      expv[30] = 165'h1c071f81bbd15719f89041c7b5c4483dfdb5f9f108;
      expv[31] = 165'h1d069d3c7f85fd1e84ea1d2b304a98664fc4e0ddfb;
      expv[32] = 165'h1807667cc14059db362a7c35bcc6b1247fb53e675a;
      expv[33] = 165'h1b862aef2031c1af105dfe9db97f6d4be39f612d53;
      expv[34] = 165'h1d460c78b3abb74badfa074a4ec87f7e175081380d;
      expv[35] = 165'h1986902977c7796f26a356de46bc300cec472a4ebd;
      expv[36] = 165'h1c477e2f52e6550b383d8c59eb23ba3d1670a37581;
      expv[37] = 165'h1847aaa648cf21a1b91d3ebeae61b908c882e8b645;
      expv[38] = 165'h1d86e1e6625a7ff98030ba63a7ed340c76ef2182f6;
      expv[39] = 165'h1a67b50e797289d07d8eb6a83175fd66df516da55c;
      expv[40] = 165'h18074ff83dad0f841c9ec40f82f881aa021f8e67e6;
      expv[41] = 165'h1886227eb19af7560f7c8a66659a001d210799e9fb;
      expv[42] = 165'h1de60a9dda158d88d65dc917b69d0aea6a7a84228e;
      expv[43] = 165'h1ea6199544263b32c58c3c89ba5f2c8b089e2ddf69;
      expv[44] = 165'h18275eb62f54c340c00fb74fa07186f9517d4df867;
      expv[45] = 165'h1ac652635a093516601a60f8b89960c208379a896e;
      expv[46] = 165'h1e06c5c76d90595658b8fc5fdadf5d182b66f2107d;
      expv[47] = 165'h1ec727e6ff21812565cc753dcfbce0d7f6c917b516;
      expv[48] = 165'h1b262eaab4d671d60a8e45391688d3286b49db2d27;
      expv[49] = 165'h1f27d2735e631996a3aed3a9755b14853f408b15d2;
      expv[50] = 165'h18c7f0c3274351b4dcdfc9de90010f00e594161274;
      expv[51] = 165'h1ea77a02f3c0f7a6961c15caad10e51c57ab415670;
      expv[52] = 165'h1a26e6b962829bea079e213bad49333b1da26b6870;
      expv[53] = 165'h1907b45853b389950fa4e3a3db4483115b92d60edb;
      expv[54] = 165'h19270e86188945726aef9e5dd91d51743cfaa9a6af;
      expv[55] = 165'h1c87b74280de5b3034071dbf42587cd4501c5093bd;
      expv[56] = 165'h1f8624bf09443176cf4ddb451d3cc0069630cc68a4;
      expv[57] = 165'h1d0709f7a1a0d90ad8dea21b6ce1e86a3216cc8f1e;
      expv[58] = 165'h1887d726ed3a7305142f233d8dbc02a87c14cce236;
      expv[59] = 165'h1c676128028ae9d81758c6dff0d994b23489e42899;
      expv[60] = 165'h192664fc4a4b07105a39d09dc93b9c9f4ad15c8fc0;
      expv[61] = 165'h18266c1cf523d35cc734b2f3c3a85677cd3752f935;
      expv[62] = 165'h1846527c8d75a5f467dc7f542163f8dbf9ed3f7364;
      expv[63] = 165'h1be75e6aa5d723bfcbb40c2f949e5c94a998edad74;
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
