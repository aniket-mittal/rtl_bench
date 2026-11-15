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

  rtlpp_01317 dut (
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
    stim[0] = 228'h3c30d6c45a2bac78c98505cf835e12e3aac15d388c5e3e188f1cdca20;
    stim[1] = 228'h2c5b799a599471a1fe8164037c1e600c5c747486049a76ea66b895b4f;
    stim[2] = 228'hda1ce37c33513689cfa87a3331ac6dd84bced40da1b453e17939792e1;
    stim[3] = 228'h9cbe02a44246d3790b1786aa580bcbff4acc4ae3cdd24fa5f15c715c6;
    stim[4] = 228'hd241e8ada05fe6ecda412774963f657429c46499ed12ad703a6e6c9b1;
    stim[5] = 228'hd5f69df3f1cae740b3d15e53a5507d580b15e6a3863d103ebefb22fcb;
    stim[6] = 228'ha9abf833495dd421287317f0fb6d8329cf2da546139b9c1087fd27bd7;
    stim[7] = 228'hf01eabd369f9ba24f89a18894d783eec268b9fcca72bfbea853f19e5b;
    stim[8] = 228'hb30acf98cb34a665eca5f38c328fd435723005f19718b7ebf53eff260;
    stim[9] = 228'h969dcb72b21166d9baed9dd055e5acdf1a91e13adbaad7fac28cce8a6;
    stim[10] = 228'h8446ae0fae67f5e862d57e8bb54584f5b5ac60830bc35d128050da461;
    stim[11] = 228'h9861f8f402b6565d98b252d8458c3825201d5d18a6df1b4750ae23ed1;
    stim[12] = 228'he856bb15866af36e3df2d6c788f08b75b5daf1fe5c456919406e37a24;
    stim[13] = 228'hbf0033c914ea16c4dfc206c925eed7835688189fb48ccb04ffa679eba;
    stim[14] = 228'habe578db84935fd16d6d5eee76715676995fcc01053b3872a8097d04d;
    stim[15] = 228'h9cc0f9a76b39bade9dc8171bb00cd8ec44778e29b201f67cbc10ebdf9;
    stim[16] = 228'hee885432de2e768928849566f0c997e20061b669d964c7ccca730ac8c;
    stim[17] = 228'ha72cd7d7de82360d7603bf9d193330e4530a55ff33c7fb57358516878;
    stim[18] = 228'hc28f1ea065b3b00fff4e860c6de4a23941e3b3471e13dddc0e8e0c327;
    stim[19] = 228'hcaab698ee8ee4db2e3d0078d4755185e6461bdcaf982a0fa269730c0a;
    stim[20] = 228'hdea7ee524c3e72aee6e16827b3b09fcff2f745c86cab550750bebc9da;
    stim[21] = 228'hca31bda197468a19377f24d9bfc19158d556b619a629173c26ef03e6d;
    stim[22] = 228'hab4d2b089c19e5783cd57dcebc16e8d70232f961f77977f90b4b8d38c;
    stim[23] = 228'h9491323d5319b46d6711e501e27d5a15f31a1a89644cf1f841cfa4620;
    stim[24] = 228'hdf3ae0dc22f5e153534bcbfc57f10cc98cf9b8497ca7d24ecd134deb5;
    stim[25] = 228'h9e5eaf0f6bf9f72dc1e40cbbc33813d9ab015e227d52b8edc042a7686;
    stim[26] = 228'h88af58fbe16c2ccb08d6ed537d06fce7daa608319936d6f96900232c6;
    stim[27] = 228'hf222e17eaf4102d2c8d130e87ba4cc05360fffacd397b18ef6c55eb6e;
    stim[28] = 228'hc2db1994349795a326e420fe943559e6df51e4a5e9fd29f47c0b3e336;
    stim[29] = 228'hfc616288a3b3fccdf58460bdd83eed0aadb5b216ef3de17daf613cb52;
    stim[30] = 228'h8beb51ece59fca497f31f0494ee66e4ac2038f16fe154928351643ee8;
    stim[31] = 228'he3197cb6891dd88bcd636d0de138aeaf3438ee0030235236f4cc6543b;
    stim[32] = 228'hf52955fd151dd8dcf84a7025f01db3488a8b5945f3837a9141e9116d8;
    stim[33] = 228'h98808be91ed3c3ccfda4e5e403b3393457d6e3b98cc5c2f42c9961b46;
    stim[34] = 228'h92a26fabf4405e26bd458b510ce9e09513a4d1812bff73fa6766e9396;
    stim[35] = 228'haa36b19d98982db0a02f0871f98bcb4cdc6e00d1d93e4ad4da9e7cbf8;
    stim[36] = 228'hdf33679701c25db201302605b187c430e6cfe0ec829c52428c59574ba;
    stim[37] = 228'hc29d8e901ba3d7e55db1cceb506e68736a32580f1a3b4b52becc5fa6d;
    stim[38] = 228'hc3834910381ccdb83f28b902dc024b67b7d41015eaaf2a99d46e140e7;
    stim[39] = 228'hfebb01e997089c1af2d34e6e3814c1f959490c02491c2515d276d8750;
    stim[40] = 228'hf3a0fae7761673dab676af50c307e272fe3100a00af00c3b3b28cf361;
    stim[41] = 228'hc7972ea203445485f338c92d2961ecc1b1db44be02e23f7d7ec16fe9b;
    stim[42] = 228'hd400fb5ce596ca60adf31c7be87e4cb11d7000b40254fbf02bae7663b;
    stim[43] = 228'h9c21dbc2267f1d1531a5b4c0acadd396c90a754f535594ed1d3d8ae25;
    stim[44] = 228'hfd488eaf06e533411db34fc8f370812aca120e84304ee87c2e51822ae;
    stim[45] = 228'hd7aa57fe6f5cde30cc58920ffa62c59d191b8c3e2af6e32b231871ddd;
    stim[46] = 228'ha7726e1a99ded41e87661aa77f4a8e7245ecaf23b9d225c5283843802;
    stim[47] = 228'hffb2e9a0282ca447da7d006ad3b700b3f0e6499538b957ca29b49d7ed;
    stim[48] = 228'he5a061a94411a7faf51ff2daa4ece683ba87bdb9d93ed00b663f3c1c0;
    stim[49] = 228'hd825f2ad5a642f608a87abae1283d562acf5254b15207d31df2e656fe;
    stim[50] = 228'h8fbcfc3edcd26d0f33feee6f138def9b6f8d669ec16fab0bd6c2ca814;
    stim[51] = 228'haad5ff9f051ea75a03d42f9b94731c3ec7f561f439266658855a61f9f;
    stim[52] = 228'hf634f5d961a5ff0987fe3f446bad9d7ee5aaa8ed43728327aa0158b12;
    stim[53] = 228'hb4b95239c5d764c28c0257bdd88e0077b7aa2169f4be5de28d5d29e80;
    stim[54] = 228'he7116cd54ea07491b9e005deb7ed607ae12d4c6fb153598f08e9577c4;
    stim[55] = 228'h944a2aa9905d79005373d6eeeb74f5957329bc3dfdc3df57806c42298;
    stim[56] = 228'h95f9a9f6392be311c2b7bce546038a47825ceb9be4fbd37173d88a082;
    stim[57] = 228'hac005b6ebfc9661d9543ba36e557e773068eed3a2a7fd02eca59dc99e;
    stim[58] = 228'he64e4049ddc9a9d30130a6def17d3ae7e85647c1ea48bde03ce708631;
    stim[59] = 228'h8e05729dbab2f55f1f6229c39ca0b9a8d24871414d2aaa5c92741fc18;
    stim[60] = 228'hd4b2479c50ce12a723f9e18469284c696dfe493f6fa3274211a759bde;
    stim[61] = 228'h91059733d984fed299530c3b1e3fdbe206662959cdc7adb5dab0f74d7;
    stim[62] = 228'h8e6508f0f52fd9b9b993cf980522f4cce3e704d02ccb025ba4057e392;
    stim[63] = 228'hb8a5883354b25e5d257d5b181936866738aa3184c9d20d3c1ae15555a;
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
      expv[0] = 177'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 177'h000000000000000000000000000000000000000000000;
      expv[2] = 177'h000000000000000000000000000000000000000000000;
      expv[3] = 177'h000000000000000000000000000000000000000000000;
      expv[4] = 177'h000000000000000000000000000000000000000000000;
      expv[5] = 177'h000000000000000000000000000000000000000000000;
      expv[6] = 177'h000000000000000000000000000000000000000000000;
      expv[7] = 177'h000000000000000000000000000000000000000000000;
      expv[8] = 177'h000000000000000000000000000000000000000000000;
      expv[9] = 177'h000000000000000000000000000000000000000000000;
      expv[10] = 177'h000000000000000000000000000000000000000000000;
      expv[11] = 177'h000000000000000000000000000000000000000000000;
      expv[12] = 177'h000000000000000000000000000000000000000000000;
      expv[13] = 177'h000000000000000000000000000000000000000000000;
      expv[14] = 177'h000000000000000000000000000000000000000000000;
      expv[15] = 177'h000000000000000000000000000000000000000000000;
      expv[16] = 177'h000000000000000000000000000000000000000000000;
      expv[17] = 177'h000000000000000000000000000000000000000000000;
      expv[18] = 177'h000000000000000000000000000000000000000000000;
      expv[19] = 177'h000000000000000000000000000000000000000000000;
      expv[20] = 177'h000000000000000000000000000000000000000000000;
      expv[21] = 177'h000000000000000000000000000000000000000000000;
      expv[22] = 177'h000000000000000000000000000000000000000000000;
      expv[23] = 177'h000000000000000000000000000000000000000000000;
      expv[24] = 177'h000000000000000000000000000000000000000000000;
      expv[25] = 177'h000000000000000000000000000000000000000000000;
      expv[26] = 177'h000000000000000000000000000000000000000000000;
      expv[27] = 177'h000000000000000000000000000000000000000000000;
      expv[28] = 177'h000000000000000000000000000000000000000000000;
      expv[29] = 177'h000000000000000000000000000000000000000000000;
      expv[30] = 177'h000000000000000000000000000000000000000000000;
      expv[31] = 177'h000000000000000000000000000000000000000000000;
      expv[32] = 177'h000000000000000000000000000000000000000000000;
      expv[33] = 177'h000000000000000000000000000000000000000000000;
      expv[34] = 177'h000000000000000000000000000000000000000000000;
      expv[35] = 177'h000000000000000000000000000000000000000000000;
      expv[36] = 177'h000000000000000000000000000000000000000000000;
      expv[37] = 177'h000000000000000000000000000000000000000000000;
      expv[38] = 177'h000000000000000000000000000000000000000000000;
      expv[39] = 177'h000000000000000000000000000000000000000000000;
      expv[40] = 177'h000000000000000000000000000000000000000000000;
      expv[41] = 177'h000000000000000000000000000000000000000000000;
      expv[42] = 177'h000000000000000000000000000000000000000000000;
      expv[43] = 177'h000000000000000000000000000000000000000000000;
      expv[44] = 177'h000000000000000000000000000000000000000000000;
      expv[45] = 177'h000000000000000000000000000000000000000000000;
      expv[46] = 177'h000000000000000000000000000000000000000000000;
      expv[47] = 177'h000000000000000000000000000000000000000000000;
      expv[48] = 177'h000000000000000000000000000000000000000000000;
      expv[49] = 177'h000000000000000000000000000000000000000000000;
      expv[50] = 177'h000000000000000000000000000000000000000000000;
      expv[51] = 177'h000000000000000000000000000000000000000000000;
      expv[52] = 177'h000000000000000000000000000000000000000000000;
      expv[53] = 177'h000000000000000000000000000000000000000000000;
      expv[54] = 177'h000000000000000000000000000000000000000000000;
      expv[55] = 177'h000000000000000000000000000000000000000000000;
      expv[56] = 177'h000000000000000000000000000000000000000000000;
      expv[57] = 177'h000000000000000000000000000000000000000000000;
      expv[58] = 177'h000000000000000000000000000000000000000000000;
      expv[59] = 177'h000000000000000000000000000000000000000000000;
      expv[60] = 177'h000000000000000000000000000000000000000000000;
      expv[61] = 177'h000000000000000000000000000000000000000000000;
      expv[62] = 177'h000000000000000000000000000000000000000000000;
      expv[63] = 177'h000000000000000000000000000000000000000000000;
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
