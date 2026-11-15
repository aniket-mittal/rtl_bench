// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 186;
  localparam OW = 163;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00929 dut (
    .aclk(clk),
    .aresetn(in_vec[185:185]),
    .s_axi_awaddr(in_vec[184:169]),
    .s_axi_awprot(in_vec[168:166]),
    .s_axi_awvalid(in_vec[165:165]),
    .s_axi_wdata(in_vec[164:133]),
    .s_axi_wstrb(in_vec[132:129]),
    .s_axi_wvalid(in_vec[128:128]),
    .s_axi_bready(in_vec[127:127]),
    .s_axi_araddr(in_vec[126:111]),
    .s_axi_arprot(in_vec[110:108]),
    .s_axi_arvalid(in_vec[107:107]),
    .s_axi_rready(in_vec[106:106]),
    .m_axi_awready(in_vec[105:105]),
    .m_axi_wready(in_vec[104:104]),
    .m_axi_bresp(in_vec[103:102]),
    .m_axi_bvalid(in_vec[101:101]),
    .m_axi_arready(in_vec[100:100]),
    .m_axi_rdata(in_vec[99:68]),
    .m_axi_rresp(in_vec[67:66]),
    .m_axi_rvalid(in_vec[65:65]),
    .s_axi_ctl_awaddr(in_vec[64:53]),
    .s_axi_ctl_awvalid(in_vec[52:52]),
    .s_axi_ctl_wdata(in_vec[51:20]),
    .s_axi_ctl_wstrb(in_vec[19:16]),
    .s_axi_ctl_wvalid(in_vec[15:15]),
    .s_axi_ctl_bready(in_vec[14:14]),
    .s_axi_ctl_araddr(in_vec[13:2]),
    .s_axi_ctl_arvalid(in_vec[1:1]),
    .s_axi_ctl_rready(in_vec[0:0]),
    .s_axi_awready(out_vec[162:162]),
    .s_axi_wready(out_vec[161:161]),
    .s_axi_bresp(out_vec[160:159]),
    .s_axi_bvalid(out_vec[158:158]),
    .s_axi_arready(out_vec[157:157]),
    .s_axi_rdata(out_vec[156:125]),
    .s_axi_rresp(out_vec[124:123]),
    .s_axi_rvalid(out_vec[122:122]),
    .m_axi_awaddr(out_vec[121:106]),
    .m_axi_awprot(out_vec[105:103]),
    .m_axi_awvalid(out_vec[102:102]),
    .m_axi_wdata(out_vec[101:70]),
    .m_axi_wstrb(out_vec[69:66]),
    .m_axi_wvalid(out_vec[65:65]),
    .m_axi_bready(out_vec[64:64]),
    .m_axi_araddr(out_vec[63:48]),
    .m_axi_arprot(out_vec[47:45]),
    .m_axi_arvalid(out_vec[44:44]),
    .m_axi_rready(out_vec[43:43]),
    .s_axi_ctl_awready(out_vec[42:42]),
    .s_axi_ctl_wready(out_vec[41:41]),
    .s_axi_ctl_bresp(out_vec[40:39]),
    .s_axi_ctl_bvalid(out_vec[38:38]),
    .s_axi_ctl_arready(out_vec[37:37]),
    .s_axi_ctl_rdata(out_vec[36:5]),
    .s_axi_ctl_rresp(out_vec[4:3]),
    .s_axi_ctl_rvalid(out_vec[2:2]),
    .mi_w_error(out_vec[1:1]),
    .mi_r_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 186'h0e7ff25f29d0e2533555b9e89cfa5a116fba9ecfb8cfaa9;
    stim[1] = 186'h12d0194854361fdf0b376b05bce2482605b77600a189a8a;
    stim[2] = 186'h32239e08edf4a50866a699a9b697e3c6ac8c717c4303d4a;
    stim[3] = 186'h1e40b1f4c3f49df3eec899b3808a207e772f57834bab9b2;
    stim[4] = 186'h24f7cd6974a46c16f038a17b8da9cb08997845ef67ebc8a;
    stim[5] = 186'h290a3a707bdea037d8d3cbad83ec0b2ad5a1a947ecee5fd;
    stim[6] = 186'h338eea5e4895a19ad9a20b22bfd7f9346ae7eaa8fbb8a61;
    stim[7] = 186'h38aba63a095d75be305df9f269655519f6a308276c45e4b;
    stim[8] = 186'h2b0d6247e0e3f713ce16c6d4d6cd16e2fadbd4fe137adfe;
    stim[9] = 186'h246f8a6ade481b409032b21331ab9d0cdbd16bb698706f3;
    stim[10] = 186'h28c28927ef461918f1bde4e65ff6d40d28ff0a04bb5c04d;
    stim[11] = 186'h3ae7033070b912f08bc1701f4d08469f7be0925639bb5de;
    stim[12] = 186'h2672b9186aa7e96d434919fec1c95862dfd2d7cae917b69;
    stim[13] = 186'h2e6969fc5d2591cf763628cd88b3e3804dc1b3c607e4e91;
    stim[14] = 186'h2a0835b5de232e638641de3a8bdf791f86b106e76963edf;
    stim[15] = 186'h3f4554ac0dab3375809475d3963030d7a1cce017b2e96bd;
    stim[16] = 186'h297f5d91660719ad7b0767f6268e0dd595793c8e576cb90;
    stim[17] = 186'h3f13f4ef4c0211d9a825498e83bbdec385e43cbc962bcc8;
    stim[18] = 186'h3e3e8939fca852c85176efe31d1e8975fc81ddd075f3d58;
    stim[19] = 186'h30ac7b2862bab3ae18f866f2bd54f1af17103e614dce287;
    stim[20] = 186'h2e4f519b613fc998f71d1c0c2190fb465512279467d6c5d;
    stim[21] = 186'h369989b25ad3a99bcddc2a021fdeccdbeed90318864d571;
    stim[22] = 186'h20893fd35642047f65560ef19db3e095923850bad55090a;
    stim[23] = 186'h36d3970954b1c231239d69224e549428ff796110a6e43fa;
    stim[24] = 186'h3fdd2630e07422ae6d17f45c1fec402b3acd94431c51246;
    stim[25] = 186'h2deeba5d762a9d9aeb6a41fa35d94bf2cfec8e3496a2f03;
    stim[26] = 186'h220d9cf4a1e6fb6dd9b375ac5e4504b5e02908813f10089;
    stim[27] = 186'h2740843084e654c5d24c7ad3f456dd2e1cb9a707802b93f;
    stim[28] = 186'h3b2d714349424c44293af84a501d25fd973a7cd23d61fb7;
    stim[29] = 186'h2f638945420361e41d3161576cf1a37572d53d4f22c0a4c;
    stim[30] = 186'h3abeae66f25548f8008617e0b88de2a33273fc1ff0b81c1;
    stim[31] = 186'h3254ca18dac425dc490cd05349e600b1bc0e673e343c707;
    stim[32] = 186'h3bb42c9c56bc28ce8b5cfa3707e7025e476125c01be5ab5;
    stim[33] = 186'h2fb9e9811ce0fccae7a6b3ee6ca8a4522f29da19eb66657;
    stim[34] = 186'h3212408ce628656409777d85c8fff26c1be8f36f84f23ff;
    stim[35] = 186'h302cafeebf55b203523426bfc4d9091bda28904febbe06e;
    stim[36] = 186'h37f38fc3dafb62850f2d206e2a0a8da21a074385ac84bf8;
    stim[37] = 186'h3ea8c0f76d38c32d7c4ba9104a4298f23f8cff69f06ca5c;
    stim[38] = 186'h3ff2a95bbfbfb96d589ef156fa64d8985b70fb9b81e86dc;
    stim[39] = 186'h324b12580cf418dc9c718c5fd3299b476c4ee7e95d6e378;
    stim[40] = 186'h39efa2c500a7de697d8f7b64572b7c8246563cbbd4bbe3c;
    stim[41] = 186'h2e104d69fcf1ec8447572a4bdb23357563851a730827fbf;
    stim[42] = 186'h39470b8b725cd4ef03c9782c45b84b87e0239cd5904ce75;
    stim[43] = 186'h37f31a15cbbcaefd9ee865359462b41e9ed677044d98fc8;
    stim[44] = 186'h309016df8b086d6cdcf7272ad0798ac93c4e181baea9961;
    stim[45] = 186'h3619770b57d88028778852c37bcca4a5a9a3c24f192c910;
    stim[46] = 186'h2af87dae28d8fb5d2210e16565b4a3f27f9aba37c227e86;
    stim[47] = 186'h3173febfa0580632a43ada879a371acfcb1845fd6469b77;
    stim[48] = 186'h35deef15af682236fc0ce07fa4229809114fddd4f5ef186;
    stim[49] = 186'h2299e8a94751749966c000175d8635af1e0727edc0c615c;
    stim[50] = 186'h3f036c8b27f5d4903093bdaa80b0439174d585830ffd7c6;
    stim[51] = 186'h213c2f2ae9fe1515fac77c68b2d101d36c62c7380dfe245;
    stim[52] = 186'h3c592c0645a14692782856075267863eab330cd256048b9;
    stim[53] = 186'h32724fc33fc52abfe772c2b8f57d2741d6959f70a140300;
    stim[54] = 186'h34f787d43b5a6df798fa4e36400d6c142d01414ed665c46;
    stim[55] = 186'h28bb1ff36f6ed44e7bae6f26754105e9b77aad0a3120520;
    stim[56] = 186'h3fcc52faf3dfc542394c911062bef1799f2fac1b20935c6;
    stim[57] = 186'h3f49bf40058ffb5e1087d7df0825a204fed9a58921950ff;
    stim[58] = 186'h2e1b5e26d95368eded81d403861b41ef00f206562ebdc9e;
    stim[59] = 186'h273792f384762a951f729a92135f7e7944b2c0182abaf0f;
    stim[60] = 186'h2ba5167562e8582e50cdbb103a5d3cd93777a22f2bdda6f;
    stim[61] = 186'h3599e212f93d4daf0bb8c99913faeac6781e8afa81668b3;
    stim[62] = 186'h24dace7fb29a5e46301fc8690231839c6cbb931ed25e60e;
    stim[63] = 186'h3c0695f21161ef83718ea2f68d2ae5c706d6baf51bb122a;
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
      expv[0] = 163'hxxxxxxxxxxxcffe4be53a1c4a66aabxxxxxxxxxxx;
      expv[1] = 163'hxxxxxxxxxxx5a03290a86c3fbe166exxxxxxxxxxx;
      expv[2] = 163'hxxxxxxxxxxx4473c11dbe94a10cd4dxxxxxxxxxxx;
      expv[3] = 163'hxxxxxxxxxxxc8163e987e93be7dd91xxxxxxxxxxx;
      expv[4] = 163'hxxxxxxxxxxx9ef9ad2e948d82de071xxxxxxxxxxx;
      expv[5] = 163'hxxxxxxxxxxx21474e0f7bd406fb1a7xxxxxxxxxxx;
      expv[6] = 163'hxxxxxxxxxxx71dd4bc912b4335b344xxxxxxxxxxx;
      expv[7] = 163'hxxxxxxxxxxx1574c7412baeb7c60bbxxxxxxxxxxx;
      expv[8] = 163'hxxxxxxxxxxx61ac48fc1c7ee279c2dxxxxxxxxxxx;
      expv[9] = 163'hxxxxxxxxxxx8df14d5bc9036812065xxxxxxxxxxx;
      expv[10] = 163'hxxxxxxxxxxx185124fde8c3231e37bxxxxxxxxxxx;
      expv[11] = 163'hxxxxxxxxxxx5ce0660e17225e11782xxxxxxxxxxx;
      expv[12] = 163'hxxxxxxxxxxxce57230d54fd2da8692xxxxxxxxxxx;
      expv[13] = 163'hxxxxxxxxxxxcd2d3f8ba4b239eec6cxxxxxxxxxxx;
      expv[14] = 163'hxxxxxxxxxxx4106b6bbc465cc70c83xxxxxxxxxxx;
      expv[15] = 163'hxxxxxxxxxxxe8aa9581b5666eb0128xxxxxxxxxxx;
      expv[16] = 163'hxxxxxxxxxxx2febb22cc0e335af60exxxxxxxxxxx;
      expv[17] = 163'hxxxxxxxxxxxe27e9de980423b3504axxxxxxxxxxx;
      expv[18] = 163'hxxxxxxxxxxxc7d1273f950a590a2edxxxxxxxxxxx;
      expv[19] = 163'hxxxxxxxxxxx158f650c575675c31f0xxxxxxxxxxx;
      expv[20] = 163'hxxxxxxxxxxxc9ea336c27f9331ee3axxxxxxxxxxx;
      expv[21] = 163'hxxxxxxxxxxxd331364b5a753379bb8xxxxxxxxxxx;
      expv[22] = 163'hxxxxxxxxxxx1127fa6ac8408fecaacxxxxxxxxxxx;
      expv[23] = 163'hxxxxxxxxxxxda72e12a9638462473axxxxxxxxxxx;
      expv[24] = 163'hxxxxxxxxxxxfba4c61c0e8455cda2fxxxxxxxxxxx;
      expv[25] = 163'hxxxxxxxxxxxbdd74baec553b35d6d4xxxxxxxxxxx;
      expv[26] = 163'hxxxxxxxxxxx41b39e943cdf6dbb366xxxxxxxxxxx;
      expv[27] = 163'hxxxxxxxxxxxe81086109cca98ba498xxxxxxxxxxx;
      expv[28] = 163'hxxxxxxxxxxx65ae286928498885275xxxxxxxxxxx;
      expv[29] = 163'hxxxxxxxxxxxec7128a8406c3c83a62xxxxxxxxxxx;
      expv[30] = 163'hxxxxxxxxxxx57d5ccde4aa91f0010cxxxxxxxxxxx;
      expv[31] = 163'hxxxxxxxxxxx4a99431b5884bb89219xxxxxxxxxxx;
      expv[32] = 163'hxxxxxxxxxxx7685938ad78519d16b9xxxxxxxxxxx;
      expv[33] = 163'hxxxxxxxxxxxf73d30239c1f995cf4dxxxxxxxxxxx;
      expv[34] = 163'hxxxxxxxxxxx4248119cc50cac812eexxxxxxxxxxx;
      expv[35] = 163'hxxxxxxxxxxx0595fdd7eab6406a468xxxxxxxxxxx;
      expv[36] = 163'hxxxxxxxxxxxfe71f87b5f6c50a1e5axxxxxxxxxxx;
      expv[37] = 163'hxxxxxxxxxxxd5181eeda71865af897xxxxxxxxxxx;
      expv[38] = 163'hxxxxxxxxxxxfe552b77f7f72dab13dxxxxxxxxxxx;
      expv[39] = 163'hxxxxxxxxxxx49624b019e831b938e3xxxxxxxxxxx;
      expv[40] = 163'hxxxxxxxxxxx3df458a014fbcd2fb1exxxxxxxxxxx;
      expv[41] = 163'hxxxxxxxxxxxc209ad3f9e3d9088eaexxxxxxxxxxx;
      expv[42] = 163'hxxxxxxxxxxx28e1716e4b9a9de0792xxxxxxxxxxx;
      expv[43] = 163'hxxxxxxxxxxxfe6342b97795dfb3dd0xxxxxxxxxxx;
      expv[44] = 163'hxxxxxxxxxxx1202dbf1610dad9b9eexxxxxxxxxxx;
      expv[45] = 163'hxxxxxxxxxxxc32ee16afb10050ef10xxxxxxxxxxx;
      expv[46] = 163'hxxxxxxxxxxx5f0fb5c51b1f6ba4421xxxxxxxxxxx;
      expv[47] = 163'hxxxxxxxxxxx2e7fd7f40b00c654875xxxxxxxxxxx;
      expv[48] = 163'hxxxxxxxxxxxbbdde2b5ed0446df819xxxxxxxxxxx;
      expv[49] = 163'hxxxxxxxxxxx533d1528ea2e932cd80xxxxxxxxxxx;
      expv[50] = 163'hxxxxxxxxxxxe06d9164feba9206127xxxxxxxxxxx;
      expv[51] = 163'hxxxxxxxxxxx2785e55d3fc2a2bf58exxxxxxxxxxx;
      expv[52] = 163'hxxxxxxxxxxx8b2580c8b428d24f050xxxxxxxxxxx;
      expv[53] = 163'hxxxxxxxxxxx4e49f867f8a557fcee5xxxxxxxxxxx;
      expv[54] = 163'hxxxxxxxxxxx9ef0fa876b4dbef31f4xxxxxxxxxxx;
      expv[55] = 163'hxxxxxxxxxxx1763fe6dedda89cf75cxxxxxxxxxxx;
      expv[56] = 163'hxxxxxxxxxxxf98a5f5e7bf8a847299xxxxxxxxxxx;
      expv[57] = 163'hxxxxxxxxxxxe937e800b1ff6bc210fxxxxxxxxxxx;
      expv[58] = 163'hxxxxxxxxxxxc36bc4db2a6d1dbdb03xxxxxxxxxxx;
      expv[59] = 163'hxxxxxxxxxxxe6f25e708ec552a3ee5xxxxxxxxxxx;
      expv[60] = 163'hxxxxxxxxxxx74a2ceac5d0b05ca19bxxxxxxxxxxx;
      expv[61] = 163'hxxxxxxxxxxxb33c425f27a9b5e1771xxxxxxxxxxx;
      expv[62] = 163'hxxxxxxxxxxx9b59cff6534bc8c603fxxxxxxxxxxx;
      expv[63] = 163'hxxxxxxxxxxx80d2be422c3df06e31dxxxxxxxxxxx;
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
