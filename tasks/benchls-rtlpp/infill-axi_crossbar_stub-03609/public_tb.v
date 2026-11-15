// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 194;
  localparam OW = 263;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03609 dut (
    .aclk(clk),
    .aresetn(in_vec[193:193]),
    .s_axi_awaddr(in_vec[192:161]),
    .s_axi_awprot(in_vec[160:158]),
    .s_axi_awvalid(in_vec[157:157]),
    .s_axi_wdata(in_vec[156:125]),
    .s_axi_wstrb(in_vec[124:121]),
    .s_axi_wvalid(in_vec[120:120]),
    .s_axi_bready(in_vec[119:119]),
    .s_axi_araddr(in_vec[118:87]),
    .s_axi_arprot(in_vec[86:84]),
    .s_axi_arvalid(in_vec[83:83]),
    .s_axi_rready(in_vec[82:82]),
    .m_axi_awready(in_vec[81:80]),
    .m_axi_wready(in_vec[79:78]),
    .m_axi_bresp(in_vec[77:74]),
    .m_axi_bvalid(in_vec[73:72]),
    .m_axi_arready(in_vec[71:70]),
    .m_axi_rdata(in_vec[69:6]),
    .m_axi_rresp(in_vec[5:2]),
    .m_axi_rvalid(in_vec[1:0]),
    .s_axi_awready(out_vec[262:262]),
    .s_axi_wready(out_vec[261:261]),
    .s_axi_bresp(out_vec[260:259]),
    .s_axi_bvalid(out_vec[258:258]),
    .s_axi_arready(out_vec[257:257]),
    .s_axi_rdata(out_vec[256:225]),
    .s_axi_rresp(out_vec[224:223]),
    .s_axi_rvalid(out_vec[222:222]),
    .m_axi_awaddr(out_vec[221:158]),
    .m_axi_awprot(out_vec[157:152]),
    .m_axi_awvalid(out_vec[151:150]),
    .m_axi_wdata(out_vec[149:86]),
    .m_axi_wstrb(out_vec[85:78]),
    .m_axi_wvalid(out_vec[77:76]),
    .m_axi_bready(out_vec[75:74]),
    .m_axi_araddr(out_vec[73:10]),
    .m_axi_arprot(out_vec[9:4]),
    .m_axi_arvalid(out_vec[3:2]),
    .m_axi_rready(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 194'h01e176578382a632abdcc0a7e04237de5bf1e300a52f728fb;
    stim[1] = 194'h0a732c91885775b4e2012ebd8e46577f3a89db24ac0ad73e0;
    stim[2] = 194'h28def1526edc55efb433123572f74e6b37b9ebc077d178769;
    stim[3] = 194'h2427115aa1cf6aed9dcaa8b8d3978a261dc74855e9513d70e;
    stim[4] = 194'h2c76bf860b32d0074c025e6f5c2652339894cfd440f5c0e26;
    stim[5] = 194'h21b302067de964df29e50b10a9b30f6471eb040c77643b4aa;
    stim[6] = 194'h36ac25597daf4c68ff6f52534caf16c9e3c7d9c53002915c2;
    stim[7] = 194'h2b957c3e941c3464910edb07f8022c5029495719cb9419610;
    stim[8] = 194'h3acc78857a5be294700783d4f2f07d708fe6b2c54a6ec72d3;
    stim[9] = 194'h2b84e433c7c73fa37e583d1a2ced0276ccd0b80b75cbff334;
    stim[10] = 194'h27293758f04883d23c8b985baf46a66675bbd68d6d446a2af;
    stim[11] = 194'h34177ae1e580fe5e170c6898218d385edb693264af3235a9b;
    stim[12] = 194'h1a99db97e656e4b7c15830355b0c0615f009288eb9a12d478;
    stim[13] = 194'h2c4ba8d8edee0097b3fb4d638c497fd002eb03877031f33a7;
    stim[14] = 194'h24594b7d82db76cb2499f2966aba35639c1b88f33ffe01668;
    stim[15] = 194'h2659ae08b05d77fae086b573e7517dcca63d6a7df6e54e58c;
    stim[16] = 194'h343a97c13dc872ab9f57e274122a10261d11c278c0504893f;
    stim[17] = 194'h2377cdd215acf9ccaec7df2ab8b5d446679ac2b30f5a89a0e;
    stim[18] = 194'h27098d28dce4e2a8da346e505793e11ec30c22c1a3ae2f5da;
    stim[19] = 194'h2000a0829ed3539fbf46ee3d7b4d00cabc40ddc49c44590c6;
    stim[20] = 194'h2d8f138d0f17393f262a326a7e65c59660e6382896b4f5c0a;
    stim[21] = 194'h3af6e37673496029a288cad492fac8e0585d58a342dddf48a;
    stim[22] = 194'h37de841a717bee92d4f1e97a3458c1ecfcf5f99a9cff1faef;
    stim[23] = 194'h35e3bd582e7c7b3fdcf12b470bcba395d302d97d58cf343b4;
    stim[24] = 194'h200464398427a1e89d5dd12fc012bbc60e992cb730383f638;
    stim[25] = 194'h27d8fa85f4b1446a014e3a82341b156865a8390e41fd84a63;
    stim[26] = 194'h2018bf5e03246c74cdfa7f3f26f80723d40c45a3325405c1b;
    stim[27] = 194'h2157fe612ea68e4ec6c5f0ad4befe7063ee7bdfed13f3b3e7;
    stim[28] = 194'h2a2ff843f8eeb2aa4bea2b1272c09abb6ab8f7a8a3819deb4;
    stim[29] = 194'h3d60159195b60b7b9fbff48cd825537add1010ab19616d10b;
    stim[30] = 194'h3173f37b035b804bd755d7016ecfc37355da062aaaff05e3d;
    stim[31] = 194'h25b0e048c85f42847fa6b37af24069f9b9ed6a75ec416ab8d;
    stim[32] = 194'h39ca0616d45940c2d9e249dfd0726c62a5af2aca65cf1fb2a;
    stim[33] = 194'h3d8533ac43f7118f2fe7cadab79c94389c4179f65eab17975;
    stim[34] = 194'h37dbeca4e2578bac9260330190e61918872243403f23a9cf4;
    stim[35] = 194'h2e9aa90026c1e4ead2216e465a5505e0ea6a4f99044ae537c;
    stim[36] = 194'h2aa287730c8645b5ba0f5dfd0bf2f75b92998465b1e24f5cf;
    stim[37] = 194'h3c6b46aa64751c510cffea0a83e9425bcd9c43026553c6a0e;
    stim[38] = 194'h20e34d8a36ed0f6fcb1dca0f929abb638c8ccd88262b61476;
    stim[39] = 194'h3d260bcc38e26cbab83607f98d1b03ec55abada20e9a600d9;
    stim[40] = 194'h24826a6ec03e42d2bfc92723844ae7fa8e6ed9bd60aa5702d;
    stim[41] = 194'h11f9db7490c57418e63ab5fd3d075e3ed0ef88570af2cc5eb;
    stim[42] = 194'h2a5af02a093185dc4d2653bcc6cef57161905cf69f27a9f16;
    stim[43] = 194'h2e6a6595ab20adf34854ddfeb1ae3aba6ea438fc766c0c953;
    stim[44] = 194'h2e1a54a086c764023598547e5a23333968a3617367c191e47;
    stim[45] = 194'h2d70e8ae989938ea0d5f566b33c6ea0eaab8532f70fd0496c;
    stim[46] = 194'h3d09488ce9cb19aba35b41fb91c6fefecf3132b59467e071d;
    stim[47] = 194'h3a45e7d0b2529b7ec262f6d341808f8df90e93a175c0b92e2;
    stim[48] = 194'h2a12259c7292c59214cdaee45c930ef09d5a085c90ab271c2;
    stim[49] = 194'h30baeaf187814b495d29ddd9e92ee36f8db59ea52917f1aa0;
    stim[50] = 194'h277e9b2db21b257fe16c0111226c5472ffc5beeff764f37f9;
    stim[51] = 194'h2bdee2a6351600445e0f598b1cc6a9a60101d676ff8f4270a;
    stim[52] = 194'h3344ce54371db0239226c704bbb000607a119bbb7b855115b;
    stim[53] = 194'h326a06f7ee0d4811e9513b43252c9a0e5a70b85e1b3917f16;
    stim[54] = 194'h39b85a2be2d510a044f335126dc326f54a27db8a0dc6a8f28;
    stim[55] = 194'h3138191d93a6f568da63dc702b631d59c67c79d796843981a;
    stim[56] = 194'h2da1952bb4e9d14d728bbe926f419a4e82bcdfa3b116d8dfe;
    stim[57] = 194'h32ef08c7fa5d584225836472585a47e885aa30c7288909793;
    stim[58] = 194'h35d35d222ae585fa529fc50dbd814c409cf954cb9e3227ee9;
    stim[59] = 194'h2a75558b8c67428e82e58e7dbec92852bb51e531320b41f1d;
    stim[60] = 194'h3760f693eed8fa6e92daa05af653a6f7322a5f2a5e10a44cf;
    stim[61] = 194'h248f4afb69a3a8d22fed4e1f1e465b3206b9e7f0f40e8cfa9;
    stim[62] = 194'h27ce3396baca3d75bf437b80dfaf17f997e827a75a8bea315;
    stim[63] = 194'h3005e561a76dab5b36d3a581e4a116e0222020106e4c13483;
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
      expv[0] = 263'h640000000003c2ecaf03c2ecaf00f054c6557054c6557bbe6053f0226053f02120;
      expv[1] = 263'h000000000014e6592314e65923120aeeb69c4aeeb69c4000975ec720975ec72363;
      expv[2] = 263'h640000000011bde2a4d1bde2a4dbdb8abdf69b8abdf68471891ab979891ab97bf3;
      expv[3] = 263'h0200000000484e22b5484e22b54039ed5db3b9ed5db3bb8d545c69c9545c69cbfc;
      expv[4] = 263'h400000000018ed7f0c18ed7f0c12e65a00e9a65a00e980012f37ae112f37ae1363;
      expv[5] = 263'h00000000000366040cc366040cff3d2c9be53d2c9be53fc2858854da858854d9b0;
      expv[6] = 263'h00000000002d584ab2ed584ab2ff35e98d1ff5e98d1feecfa929a657a929a657f0;
      expv[7] = 263'h0000000000172af87d172af87d2d03868c9203868c92220f6d83fc036d83fc0120;
      expv[8] = 263'h40000000003598f10af598f10af6cb7c528e0b7c528e0003c1ea797bc1ea797803;
      expv[9] = 263'h64000000001709c8679709c86789f8e7f46ff8e7f46fc8bc1e8d16741e8d1676d0;
      expv[10] = 263'h02000000004e526eb1ce526eb1e409107a4789107a47910dcc2dd7a1cc2dd7a36c;
      expv[11] = 263'h0000000000282ef5c3e82ef5c3c9301fcbc2f01fcbc2e20e344c10c6344c10c6d0;
      expv[12] = 263'h64000000003533b72ff533b72fc9cadc96f80adc96f82abc181aad84181aad8640;
      expv[13] = 263'h2400000000189751b1d89751b1db3dc012f67dc012f67ffda6b1c625a6b1c62493;
      expv[14] = 263'h640000000008b296fb08b296fb00db6ed9649b6ed964913cf94b355cf94b355d20;
      expv[15] = 263'h00000000000cb35c114cb35c11640baeff5c0baeff5c11035ab9f3ab5ab9f3a893;
      expv[16] = 263'h240000000028752f8268752f827f390e5573f90e5573eab3f13a0917f13a091520;
      expv[17] = 263'h020000000046ef9ba406ef9ba42d359f3995f59f3995d983ef955c5bef955c5adf;
      expv[18] = 263'h26000000004e131a518e131a51bf1c9c551b5c9c551b447237282bca37282bc9bf;
      expv[19] = 263'h400000000000014105000141053fda6a73f7da6a73f7ea83771ebda7771ebda6d0;
      expv[20] = 263'h42000000005b1e271a1b1e271a1be2e727e4e2e727e4c44d19353f3119353f32df;
      expv[21] = 263'h420000000075edc6ecf5edc6ece4e92c0534692c0534510c656a497c656a497d2f;
      expv[22] = 263'h26000000006fbd0834efbd0834e42f7dd25aaf7dd25a9df0f4bd1a2cf4bd1a2c0f;
      expv[23] = 263'h66000000006bc77ab06bc77ab05bcf8f67fb8f8f67fb9df095a385e495a385e5bc;
      expv[24] = 263'h26000000004008c8730008c8730904f43d1384f43d13aabee897e00ae897e0092c;
      expv[25] = 263'h00000000000fb1f50bcfb1f50bed16288d4016288d402a8f1d411a0f1d411a0db0;
      expv[26] = 263'h640000000000317ebc00317ebc00e48d8e99a48d8e99bffd3f9f937d3f9f937c00;
      expv[27] = 263'h420000000042affcc242affcc25bd4d1c9d8d4d1c9d8d982f856a5f6f856a5f7ff;
      expv[28] = 263'h0200000000545ff087d45ff087f61dd655495dd655497fcd15893961158939600c;
      expv[29] = 263'h24000000003ac02b233ac02b232d36c16f73f6c16f73f77ffa466c13fa466c12d3;
      expv[30] = 263'h660000000062e7e6f622e7e6f600eb70097aeb70097aeab2eb80b766eb80b767ff;
      expv[31] = 263'h00000000000b61c0918b61c091920be8508fcbe8508ff74359bd792359bd792003;
      expv[32] = 263'h000000000033940c2db3940c2dad0b28185b0b28185b3fc124efe83924efe83923;
      expv[33] = 263'h42000000007b0a6758bb0a675880fee231e5fee231e5ffc3e56d5bcfe56d5bce4c;
      expv[34] = 263'h40000000002fb7d949efb7d949c0caf175924af175924cc01980c8701980c87360;
      expv[35] = 263'h40000000001d3552005d35520049d83c9d5a583c9d5a4440b7232d28b7232d2ad0;
      expv[36] = 263'h020000000055450ee615450ee61b10c8b6b750c8b6b7400faefe85fbaefe85f92f;
      expv[37] = 263'h240000000038d68d54f8d68d54c90ea38a218ea38a219dfff50541f7f50541f493;
      expv[38] = 263'h660000000041c69b1441c69b146ddda1edf95da1edf9623ee507c94ee507c94d2c;
      expv[39] = 263'h24000000003a4c17987a4c1798761c4d97571c4d9757047303fcc68f03fcc68db0;
      expv[40] = 263'h02000000004904d4dd8904d4dd8007c85a57c7c85a57fb8c9391c2249391c2252f;
      expv[41] = 263'h240000000023f3b6e923f3b6e92418ae831cd8ae831cc47d5afe9e815afe9e83f3;
      expv[42] = 263'h020000000054b5e05414b5e054122630bb89a630bb89a64329de636729de63676f;
      expv[43] = 263'h64000000001cd4cb2b5cd4cb2b52e415be692415be6908b26eff58d66eff58d760;
      expv[44] = 263'h64000000001c34a9411c34a94109d8ec804698ec8046b33c2a3f2d102a3f2d11b0;
      expv[45] = 263'h26000000005ae1d15d1ae1d15d3613271d4193271d41aabfab3599e3ab3599e36f;
      expv[46] = 263'h26000000007a129119fa129119d239633574796335746abda0fdc8e1a0fdc8e36f;
      expv[47] = 263'h4200000000748bcfa1748bcfa164ca536fd84a536fd84cc17b69a0c17b69a0c00c;
      expv[48] = 263'h400000000014244b38d4244b38e4d258b2429258b242998ed7722e4ad7722e49b0;
      expv[49] = 263'h42000000006175d5e32175d5e309f029692bb029692ba64ceeecf494eeecf4976f;
      expv[50] = 263'h40000000000efd365b4efd365b64c364affc0364affc2ece008891360088913643;
      expv[51] = 263'h020000000057bdc54c57bdc54c6d22c0088be2c0088bc00facc58e63acc58e636c;
      expv[52] = 263'h400000000026899ca866899ca86de3b6047263b60472444363825ddb63825dd800;
      expv[53] = 263'h660000000064d40defe4d40defdbc1a9023d01a9023d2ab09da192949da192964c;
      expv[54] = 263'h64000000003370b457f370b457c0daa214089aa214089df19a8936e19a8936e1b0;
      expv[55] = 263'h40000000002270323b2270323b24f4dead1b74dead1b4cc1ee3815b1ee3815b1b0;
      expv[56] = 263'h02000000005b432a575b432a576d1d3a29ae5d3a29ae510ddf4937a1df4937a09c;
      expv[57] = 263'h400000000025de118fe5de118ff6cbab08448bab0844b301b2392c2db2392c2d23;
      expv[58] = 263'h64000000002ba6ba446ba6ba4452dcb0bf4a5cb0bf4a513fe286dec3e286dec093;
      expv[59] = 263'h000000000014eaab1714eaab171b0ce851d04ce851d05dc2c73edf66c73edf6490;
      expv[60] = 263'h66000000006ec1ed27eec1ed27dbdb1f4dd25b1f4dd259bd502d7b29502d7b29bc;
      expv[61] = 263'h0000000000091e95f6c91e95f6d234751a45f4751a45ffcea70f8f22a70f8f2363;
      expv[62] = 263'h40000000000f9c672d4f9c672d76d947aeb7d947aeb7ea81bdc06fd5bdc06fd7f0;
      expv[63] = 263'h6400000000200bcac3600bcac349edb56b66edb56b66d9b1d2c0f251d2c0f25090;
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
