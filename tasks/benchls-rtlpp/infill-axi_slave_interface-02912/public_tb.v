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

  rtlpp_02912 dut (
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
    stim[0] = 228'h62f820f52209d2a9ac97ade7cfff4f51c37a4dc93d750c57d251ed9c2;
    stim[1] = 228'h1167f5e31c5c6aee26a28287a66e776024379848603406a32a3110ddf;
    stim[2] = 228'h921e23b869d5b271e8b68000b603e3338daf196706ee7694267209289;
    stim[3] = 228'hc1ae21ecc0df321c9feb2dc8be1d569a052c7280a40fcb806f572814d;
    stim[4] = 228'hbd6f443c86d3d926b7e905dc1b45ee220120e2b2fb16eaa6f516909e9;
    stim[5] = 228'hccd9dfb9571c9a6e515e237767d97fbdbb96335d01b6f955fe5fe4016;
    stim[6] = 228'h85c3ece8c037756b237578bc775ce5bd8389f2571dfb98ca82a9f1da7;
    stim[7] = 228'h16b0f7614f1d12b72c9fe301f6ff368b28b7167f66918a228e7cae66b;
    stim[8] = 228'hb8dfe7cf8d390086c7c2d49447a9a15295c8f50ed1a789d1ed2803f72;
    stim[9] = 228'h9eb5927c6cef841da5570e80136067d69e6fab032b736798f49524549;
    stim[10] = 228'hb4ba3d2f189f48cb492bed719ca46d5880035c66bcda7e96f4a309e67;
    stim[11] = 228'h8f827978bc0c4f675d9d624e09180658c543e2a68de31ef7523431625;
    stim[12] = 228'hf4c628b09da2d53ca13f0614f4b15d66587c2e8f8650b7da879e8543c;
    stim[13] = 228'h9918b484cca88cb1663dfbbc9bbf8fcaddd20be37d841f5e49e7cee80;
    stim[14] = 228'he822781cd1f43150416e346c532cefa2ad787014cf2e4da98ecfe2f0b;
    stim[15] = 228'hafc5593ffd923a342346e7caf3e4be3648d194f96224fd06dc56061cd;
    stim[16] = 228'h941d6a24fe219242c20f03db0c44754cdb0f60283888fef520295128e;
    stim[17] = 228'he8bb015b210ae1f12d6a21a80d9ba6676bd36eab6fbbc28b7de9266ec;
    stim[18] = 228'ha9b9b0afa6e7cb4adf83401fbdf4a35a7e6fe58689e01f646c9b5ec85;
    stim[19] = 228'h86aaac06e4e4157d4418fed3df0069ea565d1d4505222a39f72f0ed07;
    stim[20] = 228'hbf1ec0d2e866d618152a2c265895847d629f4bc5afe04d7aa4ef3157b;
    stim[21] = 228'hd398cb77c4d5f4936dc834d493004ce1dee08a60afed2c9661b670c8f;
    stim[22] = 228'hecd7c2f13c16e52183ba1b32747de2c70796f79abdd4d676d7fbff7ee;
    stim[23] = 228'he63be26cfded0f5ec3ec26ba2f3ff6e8cc3b0a74b3fa9d94837ad2cc5;
    stim[24] = 228'ha747545c504b5f77604cb6fcb835967ffb7e6129aee75b5c5a03e9e80;
    stim[25] = 228'h99f6eede68737c914ae33576171a971bc73d44a30973444bd36dbe164;
    stim[26] = 228'hb9758f87c7606059b13db14df42de9326111e41763570b79f00676398;
    stim[27] = 228'hf684668aaf4e3c0015e394ac433a406c43bc2c1a8dd251a50c4c8466f;
    stim[28] = 228'ha59d2ea183c1ed037aea34f253e4129123ac885c32f1dd1102db47689;
    stim[29] = 228'hb938c482d810ac8b34d0add7a3c78f647e6d66260ee4bc70c44da4c58;
    stim[30] = 228'h80f2088586ea21ee1d7cca3ceb9c3b99a9f9db842371327da3dae2869;
    stim[31] = 228'hf719b82b6fa886177bd67e73430a6a8dc5b78cbc3ac54c67a57a9ca19;
    stim[32] = 228'hf5539cc5a4afb2a1eed87125022463fb6a731d1d04cd558e0c8d9363f;
    stim[33] = 228'h972f28e7df8a72fdaabbdc4f58ea561af7e1eb86fca913df0270fd06f;
    stim[34] = 228'hd7eb3cac5844f6195e0fad99c743509e9aea688e37179bd3bde18da7b;
    stim[35] = 228'hff1f68d9f352ff350d0e0cc8e17ca2d2d1852a1e38c17a3ba8c0e7e30;
    stim[36] = 228'hbc02d09b421993f93998af8e8334c7b3483518a9e53baa48ce744a1ff;
    stim[37] = 228'ha92aa1b2693b611ef96d4d48954dd7fbe512d94d78a4d56b2c94a572e;
    stim[38] = 228'hf2da94f60c2a8ca59507558f06c9bf2dd21f6a63fa14a820ba4063175;
    stim[39] = 228'hc5ffdaa9f512f99f9ed7aa805e4b426ff5e4c94080cf82a593d54bd62;
    stim[40] = 228'he92a3739c5dba03886b81c158656ef22d29ff9f5bf4e9bf8d89fd5c54;
    stim[41] = 228'hf929148ea71e7e76b0bbf8a4ff2d3c7cb12a9d46cb3c386787f85e15c;
    stim[42] = 228'hc44590183adbebab49c61548d5c0c0afdcebf84832930c1d6add1c9db;
    stim[43] = 228'hb36eee700f74320c35e33bf9930d6ead27b66fb3a730cc7b7d15c488c;
    stim[44] = 228'h89d92b8a332776861af0d7e2a114d9b93bf69eb53d12b747ad9d87978;
    stim[45] = 228'hb9bec72cc7777c7061952dd3ae4a3471a78de693709b8e88f11322516;
    stim[46] = 228'hb1f329b8d15c8f73bf7b1d600053db85f49b0f82d7c5775545d79f74a;
    stim[47] = 228'h80877188abf659dbd2005906417f072e152d52c682cff5058a520ebb1;
    stim[48] = 228'hf6876fb2218529317f07f1d6ca8b2346bb65955ada0b50f1abc2a244d;
    stim[49] = 228'he146c0dbd8f354bf847800c2001022fabc84d0a7c2ed51f0fa0fc2dd5;
    stim[50] = 228'h90ce9e6ab51170350014c1c5149f32dc5e3f99a3479c8a9a0161c6970;
    stim[51] = 228'h4083308b6086cdabc8ac10a539441b56440cf9be1dbde355d5b65310b;
    stim[52] = 228'h3d70110040e798352a8652f7d4f750a53e1aac5ff5f7d4bdadf71ce22;
    stim[53] = 228'heaae1d597190202d2f4f322b2c7f03b82e2d2462dc5b9d5b850bdfe9f;
    stim[54] = 228'hbd142fc34e7d2f8af3c6303eee18ccf46bf0d8b7243d715db4f89ef88;
    stim[55] = 228'h946ab1025bee1ee0eafe98f624085ae0a4180e25aa3141284925d7a20;
    stim[56] = 228'hd9b264ed138d108dacd3896e47f8449bd8e26b7dc3376644eb7c8b466;
    stim[57] = 228'hea6424f07725b11aa8bd84043de188a7e8fd0a0ea967909ba0cc0329c;
    stim[58] = 228'hbb2fef8cd7bd228d45f38306662f004e3f1b0cfff07bad251f3d472f5;
    stim[59] = 228'he03fbf6c52d696840e261ed9add6d8380ec44ec1d04d1455f972478eb;
    stim[60] = 228'h98d26cfda42245bcb1ce5f2cab53bab53eeb00f139e90b8d31b15123f;
    stim[61] = 228'h8c2aae72f0d48d00c5add28460a23653e80d84637c4e386d9b219b18e;
    stim[62] = 228'hce9085e4a4c2eaf9701ec96e73e02566234916c3466b9f720ca55cdbe;
    stim[63] = 228'hfbbe9d35a00980f4d6f61320d2b9d7577973f6fc3572a09a5d7ccc805;
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
      expv[0] = 177'h162ffd475251ed9c3020f5220c56f3e7ffa637a4dc926;
      expv[1] = 177'h01163580aa3110ddfff5e31c5f4143d3373e437984861;
      expv[2] = 177'h1121c4ce267209289e23b869d040005b01f2daf196718;
      expv[3] = 177'h041a82686f572814de21ecc0de96e45f0eae52c7280a4;
      expv[4] = 177'h03d6e8887516909e9f443c86d382ee0da2f6120e2b2f5;
      expv[5] = 177'h14cddef6fe5fe40171dfb9571f91bbb3ecbfb96335d1e;
      expv[6] = 177'h085c2ef602a9f1da7bece8c0353c5e3bae74389f2570e;
      expv[7] = 177'h016b2a2c8e7cae66b8f7614f1b7180fb7f9e8b7167f65;
      expv[8] = 177'h138d9d4a6d2803f737e7cf8d3b6a4a23d4d15c8f50ec6;
      expv[9] = 177'h19eb0f5a749524549d927c6cee074009b037e6fab0330;
      expv[10] = 177'h134bed6274a309e67a3d2f189d76b8ce52340035c66bc;
      expv[11] = 177'h10f87163523431625a7978bc0bb127048c06543e2a68f;
      expv[12] = 177'h1f4c2d99079e8543d628b09da6030a7a58ad87c2e8f9a;
      expv[13] = 177'h1991e72b49e7cee810b484cca87dde4ddfc7dd20be36e;
      expv[14] = 177'h0e821e8a8ecfe2f0ba781cd1f01a36299676d787014c5;
      expv[15] = 177'h02fc68d95c56061cdd593ffd9273e579f25e8d194f97c;
      expv[16] = 177'h1141d53320295128f56a24fe2101ed86223db0f60283f;
      expv[17] = 177'h0e8bb19dfde9266ed3015b210810d406cdd6bd36eab60;
      expv[18] = 177'h029bc569ec9b5ec859b0afa6e5a00fdefa53e6fe5868f;
      expv[19] = 177'h186a9fa9772f0ed07aac06e4e67f69ef803165d1d4515;
      expv[20] = 177'h1bf1a9f5a4ef3157bec0d2e86496132c4ac429f4bc5a7;
      expv[21] = 177'h1539e38761b670c8f8cb77c4d11a6a498025ee08a60b4;
      expv[22] = 177'h16cd6b1c57fbff7ef7c2f13c100d993a3ef2796f79aab;
      expv[23] = 177'h1663cba3037ad2cc5be26cfdef135d179ffec3b0a74ac;
      expv[24] = 177'h1a7441ffda03e9e817545c504b5b7e5c1acfb7e6129ae;
      expv[25] = 177'h099f3c6f536dbe1656eede68701abb0b8d4e73d44a302;
      expv[26] = 177'h1b971cc9f0067639958f87c764d8a6fa16f0111e41767;
      expv[27] = 177'h076851b10c4c8466fc668aaf48ca56219d203bc2c1a89;
      expv[28] = 177'h1259924482db47689d2ea183c19a7929f20a3ac885c2c;
      expv[29] = 177'h13938d91c44da4c590c482d815d6ebd1e3c7e6d66261f;
      expv[30] = 177'h180f5e66a3dae2869a088586efe51e75ce1a9f9db843b;
      expv[31] = 177'h0771fa37257a9ca199b82b6fabbf39a185325b78cbc27;
      expv[32] = 177'h0f5567ed8c8d9363fb9cc5a4a83892811232a731d1d08;
      expv[33] = 177'h1972f06b8270fd06ff28e7df8e6e27ac752f7e1eb86ea;
      expv[34] = 177'h157eba7a3de18da7bb3cac5844d6cce3a1a9aea688e2e;
      expv[35] = 177'h1ff1bb4b28c0e7e31768d9f352066470be531852a1e3d;
      expv[36] = 177'h0bc00ecd4e744a1ffad09b421cd7c7419a6683518a9f6;
      expv[37] = 177'h0a92b7efac94a572f2a1b2693fa6a44aa6ee512d94d6b;
      expv[38] = 177'h072d8cb73a4063175a94f60c2aaac78364df21f6a63f5;
      expv[39] = 177'h045fd9bf93d54bd637daa9f517d5402f25a35e4c94081;
      expv[40] = 177'h1e928c8b589fd5c5523739c5dc0e0ac32b7729ff9f5af;
      expv[41] = 177'h0792f9f287f85e15d1148ea71bfc527f969d12a9d46df;
      expv[42] = 177'h1c4452bf6add1c9dbd90183add0aa46ae061cebf84824;
      expv[43] = 177'h1b36b2b4fd15c488d6ee700f769dfcc986b67b66fb3a7;
      expv[44] = 177'h009dfee4ad9d8797912b8a3323ebf1508a69bf69eb53a;
      expv[45] = 177'h0b9b89c6f113225176c72cc77016e9d7251c78de69364;
      expv[46] = 177'h131f5617c5d79f74b329b8d1598eb00029eb49b0f82da;
      expv[47] = 177'h00085cb80a520ebb1f7188abf5ac8320bf8752d52c698;
      expv[48] = 177'h17681d1aabc2a244df6fb22180f8eb654593b65955acb;
      expv[49] = 177'h16140beafa0fc2dd5ec0dbd8f70061000813c84d0a7cb;
      expv[50] = 177'h190ca3710161c697169e6ab51260e28a4f9be3f99a344;
      expv[51] = 177'h14085d5955b65310bb308b608508529ca20a40cf9be12;
      expv[52] = 177'h1bd75a94adf71ce230110040e2297bea7ba9e1aac5fe9;
      expv[53] = 177'h1eaabee0850bdfe9fe1d5971961915963f82e2d2462ce;
      expv[54] = 177'h1bd15bd1b4f89ef8942fc34e7d981f770c64bf0d8b73a;
      expv[55] = 177'h09468382c925d7a212b1025be84c7b12042a4180e25a1;
      expv[56] = 177'h059b4a6f6b7c8b467264ed138e44b723fc258e26b7dd2;
      expv[57] = 177'h1ea63a9fa0cc0329d424f0772542021ef0c08fd0a0ea8;
      expv[58] = 177'h03b2d1389f3d472f5fef8cd7be4183331781f1b0cfff5;
      expv[59] = 177'h1603d8e07972478ebfbf6c52d20f6cd6eb68ec44ec1ca;
      expv[60] = 177'h098d52d4b1b15123fa6cfda426af9655a9dbeeb00f124;
      expv[61] = 177'h08c2d94f9b219b18f2ae72f0d0694230511e80d84637f;
      expv[62] = 177'h14e925988ca55cdbf085e4a4c4e4b739f01434916c34f;
      expv[63] = 177'h1fbba55ddd7ccc805e9d35a00a8990695cef973f6fc30;
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
