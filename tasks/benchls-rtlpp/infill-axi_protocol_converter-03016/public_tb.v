// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 116;
  localparam OW = 167;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03016 dut (
    .aclk(clk),
    .aresetn(in_vec[115:115]),
    .s_axi_awaddr(in_vec[114:102]),
    .s_axi_awprot(in_vec[101:99]),
    .s_axi_awvalid(in_vec[98:98]),
    .s_axi_wdata(in_vec[97:66]),
    .s_axi_wstrb(in_vec[65:62]),
    .s_axi_wvalid(in_vec[61:61]),
    .s_axi_bready(in_vec[60:60]),
    .s_axi_araddr(in_vec[59:47]),
    .s_axi_arprot(in_vec[46:44]),
    .s_axi_arvalid(in_vec[43:43]),
    .s_axi_rready(in_vec[42:42]),
    .m_axi_awready(in_vec[41:41]),
    .m_axi_wready(in_vec[40:40]),
    .m_axi_bresp(in_vec[39:38]),
    .m_axi_bvalid(in_vec[37:37]),
    .m_axi_arready(in_vec[36:36]),
    .m_axi_rdata(in_vec[35:4]),
    .m_axi_rresp(in_vec[3:2]),
    .m_axi_rlast(in_vec[1:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[166:166]),
    .s_axi_wready(out_vec[165:165]),
    .s_axi_bresp(out_vec[164:163]),
    .s_axi_bvalid(out_vec[162:162]),
    .s_axi_arready(out_vec[161:161]),
    .s_axi_rdata(out_vec[160:129]),
    .s_axi_rresp(out_vec[128:127]),
    .s_axi_rvalid(out_vec[126:126]),
    .m_axi_awaddr(out_vec[125:113]),
    .m_axi_awlen(out_vec[112:105]),
    .m_axi_awsize(out_vec[104:102]),
    .m_axi_awburst(out_vec[101:100]),
    .m_axi_awlock(out_vec[99:99]),
    .m_axi_awcache(out_vec[98:95]),
    .m_axi_awprot(out_vec[94:92]),
    .m_axi_awregion(out_vec[91:88]),
    .m_axi_awqos(out_vec[87:84]),
    .m_axi_awvalid(out_vec[83:83]),
    .m_axi_wdata(out_vec[82:51]),
    .m_axi_wstrb(out_vec[50:47]),
    .m_axi_wlast(out_vec[46:46]),
    .m_axi_wvalid(out_vec[45:45]),
    .m_axi_bready(out_vec[44:44]),
    .m_axi_araddr(out_vec[43:31]),
    .m_axi_arlen(out_vec[30:23]),
    .m_axi_arsize(out_vec[22:20]),
    .m_axi_arburst(out_vec[19:18]),
    .m_axi_arlock(out_vec[17:17]),
    .m_axi_arcache(out_vec[16:13]),
    .m_axi_arprot(out_vec[12:10]),
    .m_axi_arregion(out_vec[9:6]),
    .m_axi_arqos(out_vec[5:2]),
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
    stim[0] = 116'h185ff81df7c2de40df9d4328b3d5a;
    stim[1] = 116'h55b6a9552fc2e5ce95a679e5e9382;
    stim[2] = 116'he1b68c4679b178bed649983e7bfcd;
    stim[3] = 116'hbb84867c65f273369d729ab43e3c2;
    stim[4] = 116'hb8e88c6d9c168d84a82a36c1839b9;
    stim[5] = 116'h9351f5db6e050dfac6a8e81ccc8d9;
    stim[6] = 116'hdb65ed1a424f07f283a3e4ba54a6b;
    stim[7] = 116'hb1ae8be07b662683e8ab71b719cbd;
    stim[8] = 116'hc123ca051c951c5d42021a76b1499;
    stim[9] = 116'h8b762847f4727a47a63b4f19c73fc;
    stim[10] = 116'he75e0983bd87d59c29531f601ff51;
    stim[11] = 116'h8be517b6a33e285dc38011312d294;
    stim[12] = 116'hecdb172bbf14ed0196f7a345977bf;
    stim[13] = 116'he293196a2bd33a8e7142952df4e59;
    stim[14] = 116'hf239326fea3ebb07d59b5d0a92a04;
    stim[15] = 116'hd833ee66adf967bc3fee6f2f26c6e;
    stim[16] = 116'ha586e1a340582e287f657f116eaa5;
    stim[17] = 116'hf166747361fd8f8cc54af130bd4a3;
    stim[18] = 116'he1814139c7badbe3e9247ddb287c4;
    stim[19] = 116'hafdd456371123440096c5e89991ea;
    stim[20] = 116'h82f9c49ba6f9aa9018533e0b959bf;
    stim[21] = 116'hc5b19df5e7557b40a2023890e562e;
    stim[22] = 116'he15a123fcab74ac2d92d7f7682a5d;
    stim[23] = 116'ha4d0298934c94bd6e09dba4e1fb59;
    stim[24] = 116'hafcfdec4691eaa5ca62bb566e0cca;
    stim[25] = 116'hba5ee59b75ebbaa1e8fa09d439d48;
    stim[26] = 116'he9361842b5fdc66245bbde1ffdf83;
    stim[27] = 116'hc9f691367047f624411d56d47b4b3;
    stim[28] = 116'hc53b7eab9ca96d9bdb17871fe19c4;
    stim[29] = 116'ha112f5d555a31e511776103b29777;
    stim[30] = 116'hdf065e5995f36dd609ed7e82b1bdf;
    stim[31] = 116'he987b74910f9addbc78d90d9509fc;
    stim[32] = 116'hd7b02ffb7eb6ecbac05c1300b96e0;
    stim[33] = 116'hd6df3f19b8a9e5a458a231b6f31f1;
    stim[34] = 116'h9042f523b2afe550e142700cec364;
    stim[35] = 116'hfebbaf0185b90a0a40f73aaf21560;
    stim[36] = 116'haad5a5b28799b198af9012b8abd04;
    stim[37] = 116'hbd6bc0124a206b8d339d4ff7df055;
    stim[38] = 116'hb4f5ba87a436764e1ede6015cd9b2;
    stim[39] = 116'hafc89f73649eda1dfcb345ddfa24f;
    stim[40] = 116'hd3dfd1773b91c610259451b355f91;
    stim[41] = 116'hde76ea782a041d312e426de93d4bb;
    stim[42] = 116'h887e5ca9619f447e979e765bbc863;
    stim[43] = 116'h8997d2e6dfc7e185f5caf2e09fd72;
    stim[44] = 116'ha4c0b52b3d1ae57d96b23b23f91ed;
    stim[45] = 116'hf8b4c2d16481a8da77cc00e13e4a3;
    stim[46] = 116'hcd53f70a3b46a767678a448462cd6;
    stim[47] = 116'hbdbaf032a073ec8869cccbe430182;
    stim[48] = 116'hfa7ffc3083832800a012dbb3d01b3;
    stim[49] = 116'ha048b76f68f7adafaea0c08de12a6;
    stim[50] = 116'hfd30244f263f6e744785b2a720840;
    stim[51] = 116'ha07e5d18f466f6e2944223af01b59;
    stim[52] = 116'hb86c9440751f9bd234afe0f8434b7;
    stim[53] = 116'hba1b550c5baf1beb6fba39b0f911e;
    stim[54] = 116'hbeca1a88819243c7cb770e17a187a;
    stim[55] = 116'h8ecf76aa87debd01f82bfa200914e;
    stim[56] = 116'he0592ccdf130948a7017cf8833855;
    stim[57] = 116'he12fd02394fd28a1d734f6ac5b842;
    stim[58] = 116'habd6c2b225b21cd14d0e46482420d;
    stim[59] = 116'hafbbdd41d7ae5e1472ed012cea192;
    stim[60] = 116'h8592b7e58c7c9258f0aaedd4f3eba;
    stim[61] = 116'hf4115f6c51f0c31e500808b151199;
    stim[62] = 116'hb01ad42f82e12cf820c0c60381978;
    stim[63] = 116'hd586dbc5a5bc0e5cec6bc1a816e08;
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
      expv[0] = 167'h00000000000c2e0091f00f03bef85be40d80247c02;
      expv[1] = 167'h00000000002ada0091d0052aa5f85cdce900247402;
      expv[2] = 167'h000000000030da0091d00188cf362f4bed00247801;
      expv[3] = 167'h00000000001dc200919000cf8cbe4e736980247401;
      expv[4] = 167'h00000000001c74009190018db382d1d84a80246000;
      expv[5] = 167'h000000000009a80091b00ebb6dc0a1dfac00247802;
      expv[6] = 167'h00000000002db20091b00da34849e0ff2800246c02;
      expv[7] = 167'h000000000018d60091d0017c0f6cc4e83e80246002;
      expv[8] = 167'h000000000020900091f00940a392a3c5d400246800;
      expv[9] = 167'h000000000005ba0091c00508fe8e4f647a00247800;
      expv[10] = 167'h000000000033ae0091c0013077b0fad9c280246401;
      expv[11] = 167'h000000000005f20091a002f6d467c545dc00246c02;
      expv[12] = 167'h0000000000366c0091e002e577e29dd01900247803;
      expv[13] = 167'h000000000031480091e0032d457a6768e700246401;
      expv[14] = 167'h0000000000391c0091a0064dfd47d7707d00247402;
      expv[15] = 167'h00000000002c180091f00dccd5bf2cfbc380247c03;
      expv[16] = 167'h000000000012c20091d00c34680b05e28780247c01;
      expv[17] = 167'h000000000038b20091c00e8e6c3fb1f8cc00247401;
      expv[18] = 167'h000000000030c00091a0082738f75b7e3e80246400;
      expv[19] = 167'h000000000017ee0091a008ac6e2246c40080246401;
      expv[20] = 167'h0000000000017c0091b0089374df35690180246001;
      expv[21] = 167'h000000000022d80091b003bebceaaf740a00246800;
      expv[22] = 167'h000000000030ac0091c00247f956e96c2d80246400;
      expv[23] = 167'h0000000000126800918005312699297d6e00246002;
      expv[24] = 167'h000000000017e60091f00bd88d23d565ca00247800;
      expv[25] = 167'h00000000001d2e0091d00cb36ebd776a1e80246003;
      expv[26] = 167'h0000000000349a0091c0030856bfb8e62400247402;
      expv[27] = 167'h000000000024fa0091d00226ce08fee24400246400;
      expv[28] = 167'h0000000000229c0091e00fd573952dd9bd80246c00;
      expv[29] = 167'h000000000010880091d00ebaaab463e51100247c01;
      expv[30] = 167'h00000000002f820091c00bcb32be6ddd6080246403;
      expv[31] = 167'h000000000034c20091f006e9221f35ddbc00247c02;
      expv[32] = 167'h00000000002bd800918005ff6fd6ddcbac00246001;
      expv[33] = 167'h00000000002b6e0091e007e337153cda4580246002;
      expv[34] = 167'h000000000008200091d00ea47655fcd50e00246401;
      expv[35] = 167'h00000000003f5c0091f005e030b72160a400246003;
      expv[36] = 167'h0000000000156a0091b004b650f336598a80247c02;
      expv[37] = 167'h00000000001eb40091f0080249440d78d300246c02;
      expv[38] = 167'h00000000001a7a0091b00750f486cee4e180247803;
      expv[39] = 167'h000000000017e400919003ee6c93db61df80247002;
      expv[40] = 167'h000000000029ee0091f00a2ee77238e10200247402;
      expv[41] = 167'h00000000002f3a0091d00d4f054083d31280247801;
      expv[42] = 167'h0000000000043e0091c00b952c33e8c7e900247c02;
      expv[43] = 167'h000000000004ca0091f00a5cdbf8fc585f00247403;
      expv[44] = 167'h0000000000126000919006a567a35cd7d900247802;
      expv[45] = 167'h00000000003c5a009190085a2c90354da700247c03;
      expv[46] = 167'h000000000026a80091f00ee14768d4f67600247c02;
      expv[47] = 167'h00000000001edc0091d00e06540e7dc88680246403;
      expv[48] = 167'h00000000003d3e0091f00f86107065400a00246000;
      expv[49] = 167'h0000000000102400919006eded1ef5dafa80247802;
      expv[50] = 167'h00000000003e980091800489e4c7ede74400247c02;
      expv[51] = 167'h0000000000103e0091c00ba31e8cdeee2900247001;
      expv[52] = 167'h00000000001c3600919002880ea3f37d2300247002;
      expv[53] = 167'h00000000001d0c0091e00aa18b75e37eb680247c02;
      expv[54] = 167'h00000000001f640091c003511032487c7c80246c01;
      expv[55] = 167'h000000000007660091e00ed550fbd7d01f80246000;
      expv[56] = 167'h0000000000302c0091a00599be2612c8a700246000;
      expv[57] = 167'h000000000030960091f00a04729fa54a1d00247c00;
      expv[58] = 167'h000000000015ea0091d0085644b643cd1480247400;
      expv[59] = 167'h000000000017dc0091f00ba83af5cbe14700246803;
      expv[60] = 167'h000000000002c80091d006fcb18f92658f00246002;
      expv[61] = 167'h00000000003a080091a00bed8a3e1871e500246000;
      expv[62] = 167'h0000000000180c0091d00a85f05c25cf8200246003;
      expv[63] = 167'h00000000002ac20091d00b78b4b781e5ce80247001;
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
