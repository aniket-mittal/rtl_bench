// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 195;
  localparam OW = 274;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11212 dut (
    .clk(clk),
    .reset(in_vec[194:194]),
    .scan_en(in_vec[193:193]),
    .periph_tx_req(in_vec[192:162]),
    .periph_rx_req(in_vec[161:131]),
    .pclken(in_vec[130:130]),
    .psel(in_vec[129:129]),
    .penable(in_vec[128:128]),
    .paddr(in_vec[127:115]),
    .pwrite(in_vec[114:114]),
    .pwdata(in_vec[113:82]),
    .AWREADY0(in_vec[81:81]),
    .WREADY0(in_vec[80:80]),
    .BID0(in_vec[79:76]),
    .BRESP0(in_vec[75:74]),
    .BVALID0(in_vec[73:73]),
    .ARREADY0(in_vec[72:72]),
    .RID0(in_vec[71:68]),
    .RDATA0(in_vec[67:4]),
    .RRESP0(in_vec[3:2]),
    .RLAST0(in_vec[1:1]),
    .RVALID0(in_vec[0:0]),
    .idle(out_vec[273:273]),
    .INT(out_vec[272:272]),
    .periph_tx_clr(out_vec[271:241]),
    .periph_rx_clr(out_vec[240:210]),
    .prdata(out_vec[209:178]),
    .pslverr(out_vec[177:177]),
    .pready(out_vec[176:176]),
    .AWID0(out_vec[175:172]),
    .AWADDR0(out_vec[171:140]),
    .AWLEN0(out_vec[139:132]),
    .AWSIZE0(out_vec[131:129]),
    .AWVALID0(out_vec[128:128]),
    .WID0(out_vec[127:124]),
    .WDATA0(out_vec[123:60]),
    .WSTRB0(out_vec[59:52]),
    .WLAST0(out_vec[51:51]),
    .WVALID0(out_vec[50:50]),
    .BREADY0(out_vec[49:49]),
    .ARID0(out_vec[48:45]),
    .ARADDR0(out_vec[44:13]),
    .ARLEN0(out_vec[12:5]),
    .ARSIZE0(out_vec[4:2]),
    .ARVALID0(out_vec[1:1]),
    .RREADY0(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 195'h78bbefd24794d9c8555fc88082edbc1f30646e63dc9b6217e;
    stim[1] = 195'h783cf3a38c9397dca845db2a683d615862ea20fd6f34ca738;
    stim[2] = 195'h0a4b48c0455248d4ef0578b45752b9d3e1f3585c4c2ab8dfc;
    stim[3] = 195'h284783d21636081981b6553cf8a9eef64127971d07bb220cf;
    stim[4] = 195'h3eec5b79a22d5b91a191d95349d81b631bdd2eca89ebf007d;
    stim[5] = 195'h2898df2a0f9bfe893abb68fd1e97cd44793723c504a616e75;
    stim[6] = 195'h0cc22f28d0722a185db98b1ad63efb9bddee140b037bbb061;
    stim[7] = 195'h142026124f87c81f7fe1c11dbd467c6a78692352ee19d30b3;
    stim[8] = 195'h01e0fabad2c97d5a25f02b4485b9c88e5e27c4d40a90947d1;
    stim[9] = 195'h30d5ef2ffe617c6e704833b2ebb60a723dc30ae641d8e5b1b;
    stim[10] = 195'h07dafadc1448061218a9503a17489cb6b98c3052dd2866aed;
    stim[11] = 195'h3bd1c491647f719278ddc1fb6f94139b2335b5319b05492d2;
    stim[12] = 195'h18a782e8d3da6daa5bd3058f997f0807033ea4796486e3487;
    stim[13] = 195'h2978e19020d692767f4152603d7f286daab370b4585ec7fac;
    stim[14] = 195'h1cad77b5c00b37ec72ec80979de6493f1c2dfeb438e1d5dec;
    stim[15] = 195'h15772ec1f33c1f3f41bcfa9b538aa02ca626e84578abde49c;
    stim[16] = 195'h2a63fe9a4ee2c9e5d6d1a4bddd5c3b65dc6c9155ae91ed988;
    stim[17] = 195'h2c4f6829e41fb29ad423568719e2ec94d4bc83982f9a838cf;
    stim[18] = 195'h086c380d718a32a3c76583a3af555eb388bbb9059c7923422;
    stim[19] = 195'h213502abe4e91b9b55bb7599e2f5042bc1de27a74dd64c657;
    stim[20] = 195'h3a78f9975e69252cb84295dbe57ce9e91821772b23886305e;
    stim[21] = 195'h00ec8d14ff1c850fc717e40c6ca4b08ede83e531223de6861;
    stim[22] = 195'h00cd83daabda0ac2718974443284caed56b994ebb4be92df4;
    stim[23] = 195'h27d167c43045712437990d5e6a9e4c24140de45687538ba35;
    stim[24] = 195'h3196e0d0ecffbcd81fe140c70fb41530ecc4cc7da15907d4c;
    stim[25] = 195'h062fe250d1750457b13d0a0f0a28f6e71c1b8c1f7c5cd71e2;
    stim[26] = 195'h18a2fc444879b08ecec191474d778008345549763b10d55b9;
    stim[27] = 195'h15f5d14632b6082b406c8ecb822a10aa64889ade6aaf472ff;
    stim[28] = 195'h306aa9047fa91d51d283f17e4f3f9a81038926da81c5cdb79;
    stim[29] = 195'h1f666cb7f9553ce672cf0e83b6598c94e207bc35e7c9aaa18;
    stim[30] = 195'h03d502ef6046436029e29910b6a2884eb36e55b8bf5df3547;
    stim[31] = 195'h0332b6d701a42f777cb8803b34c6ed1a999115546efa31086;
    stim[32] = 195'h34e9820e134c4ec87288cffa4f5d2f1e314600fa952f5e078;
    stim[33] = 195'h22d3deaa2dc583cc2834f14a7e30fb7013e248ee291faf2ba;
    stim[34] = 195'h24e201284a9e3b64eb6acaf729fad747bce801ea4a0782095;
    stim[35] = 195'h18bd050cd04f4d5f22219f2ca2e9a3e44c2e87f2d21d4652c;
    stim[36] = 195'h1241bffb2e9461bbca41ac3823f5bf2e2fb8a585637409b29;
    stim[37] = 195'h24ba03fcc3f25494c0913063a8c6e71ede86a56713bc0a92a;
    stim[38] = 195'h2bbb402fe6bf63f0996bc8f61599ed04d27017ab8a832dfe2;
    stim[39] = 195'h38e43b6066bc86e4c13cdc6cc2f0b0d37da06262eb4deccb9;
    stim[40] = 195'h1b4cbab0ba3b2d9fb1996c50c1e09978857aafbb2d01d5589;
    stim[41] = 195'h3af746045018dab57b6928f8c294bd2825d2220d07f51a10a;
    stim[42] = 195'h26b42c6dcd8cc6e55a6f46c538b75a8c134ce208a77aeb633;
    stim[43] = 195'h2cab4cba6fece04e7a1dcdf14efb135f1b506a1aa3442c366;
    stim[44] = 195'h24cbb134a543a0eba6d0fe0bc8db6a66968303cd698b330c7;
    stim[45] = 195'h1b3bfcc3afdd6cd95ff10c0d5eb29cdcd2f26c686d5f34851;
    stim[46] = 195'h20f795b98af66f46c15a35cbdcc3a03b653dc69a29b13a924;
    stim[47] = 195'h34f2ceb6662318fa969181e993769fe950e1f08ca0f8e8dfa;
    stim[48] = 195'h2be7820db6221ed40f735435629a9c458063747f1cff2fa8f;
    stim[49] = 195'h307a92de3b1a0eb495e9981f412c02a25d0eb4ae6781cfa3e;
    stim[50] = 195'h1e206ee399b0967bbd7a4e62dac83cea39c929bc0fb16f7a5;
    stim[51] = 195'h30e7bd2b4f24c3c44e797e392c0860246212d0eb6cbceee4c;
    stim[52] = 195'h1d407139970c1f1a8f5aa55440fa0e67f8e4991c218d87ac5;
    stim[53] = 195'h34b073bd5cde65b460c1f12a244d75f5d5496a4c6bf89222b;
    stim[54] = 195'h24133bb2d10e4aef1596ffc08e3c9030dd3a2ba1af2202a0f;
    stim[55] = 195'h26c341f65f2c630b97d7ef28ae04cfe1e45b83b2b229dd6fa;
    stim[56] = 195'h1851e236c78ea97ac1cf118633e7588bef0a277a80de04194;
    stim[57] = 195'h369f5b08b8bf98cee265e2b39f23053caffcfa5571de3ed8d;
    stim[58] = 195'h161d565c6dbaa552a12413d62df8da29a4bba37aefc19a232;
    stim[59] = 195'h03e416cb2471bb24bcfee72dbfaddb2ea9e563705abc5d022;
    stim[60] = 195'h300315401bc6ad001e6b142f705d60560f9535fd81737be30;
    stim[61] = 195'h04fd6270d2ed6c8ea09abb1650cd2ed996da46881a0089fd4;
    stim[62] = 195'h30f0031f61e956ebe9c87d5884888dd8fb27a3e0d4662fcff;
    stim[63] = 195'h1b39cf08fe6fcec2e0b9390136724534ae575489f00787c38;
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
      expv[0] = 274'h0c5df7e923ca6ce4088082ed90xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 274'h0c1e79d1c649cbee5b2a683d50xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 274'h0525a46022a9246a78b4575290xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 274'h0423c1e90b1b040cd53cf8a9d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 274'h0f762dbcd116adc8d95349d810xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 274'h044c6f9507cdff44a8fd1e97d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 274'h066117946839150c0b1ad63ed0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 274'h0a10130927c3e40f811dbd4650xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 274'h00f07d5d6964bead2b4485b9d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 274'h086af797ff30be3733b2ebb610xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 274'h03ed7d6e0a240309103a174890xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 274'h0de8e248b23fb8c901fb6f9410xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 274'h0c53c17469ed36d5058f997f10xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 274'h04bc70c8106b493b12603d7f10xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 274'h0e56bbdae0059bf600979de650xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 274'h0abb9760f99e0f9fba9b538a90xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 274'h0531ff4d277164f2e4bddd5c10xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 274'h0627b414f20fd94d568719e2d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 274'h04361c06b8c51951c3a3af5550xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 274'h009a8155f2748dcdb599e2f510xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 274'h0d3c7ccbaf34929655dbe57cd0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 274'h0076468a7f8e4287e40c6ca490xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 274'h0066c1ed55ed056134443284d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 274'h03e8b3e21822b8920d5e6a9e50xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 274'h08cb7068767fde6c00c70fb410xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 274'h0317f12868ba822bca0f0a28d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 274'h0c517e22243cd84751474d7790xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 274'h0afae8a3195b04158ecb822a10xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 274'h083554823fd48ea8f17e4f3f90xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 274'h0fb3365bfcaa9e730e83b65990xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 274'h01ea8177b02321b01910b6a290xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 274'h01995b6b80d217bb803b34c6d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 274'h0a74c10709a627640ffa4f5d10xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 274'h0169ef5516e2c1e6314a7e30d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 274'h02710094254f1db24af729fad0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 274'h0c5e82866827a6af9f2ca2e990xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 274'h0920dffd974a30ddec3823f590xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 274'h025d01fe61f92a4a7063a8c6d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 274'h05dda017f35fb1f848f61599d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 274'h0c721db0335e43725c6cc2f090xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 274'h0da65d585d1d96cfec50c1e090xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 274'h0d7ba302280c6d5aa8f8c29490xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 274'h035a1636e6c6637286c538b750xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 274'h0655a65d37f670270df14efb10xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 274'h0265d89a52a1d075fe0bc8db50xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 274'h0d9dfe61d7eeb66c8c0d5eb290xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 274'h007bcadcc57b37a375cbdcc390xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 274'h0a79675b33118c7d41e9937690xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 274'h05f3c106db110f6a1435629a90xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 274'h083d496f1d8d075a581f412c10xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 274'h0f103771ccd84b3dce62dac810xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 274'h0873de95a79261e23e392c0850xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 274'h0ea0389ccb860f8d655440fa10xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 274'h0a5839deae6f32da312a244d50xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 274'h02099dd968872577bfc08e3c90xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 274'h0361a0fb2f963185ef28ae04d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 274'h0c28f11b63c754bd518633e750xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 274'h0b4fad845c5fcc6762b39f2310xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 274'h0b0eab2e36dd52a953d62df8d0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 274'h01f20b659238dd92672dbfadd0xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 274'h08018aa00de35680142f705d50xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 274'h027eb1386976b6477b1650cd10xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 274'h0878018fb0f4ab75fd58848890xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 274'h0d9ce7847f37e7617901367250xxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
