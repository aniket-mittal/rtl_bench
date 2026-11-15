// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 260;
  localparam OW = 258;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  NV_NVDLA_CSC_pra_cell_core_chn_data_in_rsci_chn_data_in_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[259:259]),
    .chn_data_in_rsci_oswt(in_vec[258:258]),
    .chn_data_in_rsci_biwt(in_vec[257:257]),
    .chn_data_in_rsci_bdwt(in_vec[256:256]),
    .chn_data_in_rsci_d(in_vec[255:0]),
    .chn_data_in_rsci_bawt(out_vec[257:257]),
    .chn_data_in_rsci_wen_comp(out_vec[256:256]),
    .chn_data_in_rsci_d_mxwt(out_vec[255:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 260'h33747c33657afdad957c98bf96d9d65cb16491905d5156d52cb9e2151b58b5aa0;
    stim[1] = 260'h751d2135a484847d172108b275dbbcbc39d0b28ac2743a217dd083eae28bee0f4;
    stim[2] = 260'hd2c026065e4103ee36c10bc2c36a66152911496f8b266d2031cb589cb0859b417;
    stim[3] = 260'hc73f5b4534a067b1fb36c21e9fe3a462c89eb6d3f2c4312bb9434cd057fc64fca;
    stim[4] = 260'h89cad00fad427dcfdbe420c0c20f16fb5a623dff2302893922c94cd9bb0cfe148;
    stim[5] = 260'h86de6f3d4b81471cc3f51ee7279631bb4895a42556f36bf82235ac12f483acbe3;
    stim[6] = 260'hcdad8401e16d253fc4e96f4861bbbc2a4ac6a2b153ac1b70e268499b516904f72;
    stim[7] = 260'hbe85d952eb32c4c4381bc49f57cff2a76bfa232c2115b02b62abf7b504d244c71;
    stim[8] = 260'hee73f5732bb1eb619130234d237a0a773781544eeec173979feb6f49de43510ec;
    stim[9] = 260'h98d2522dfc74938a1db9d1d830833e47ccf260089437396c2c3a74c5316321039;
    stim[10] = 260'hff386f740a75140faa05dfb16d078bde3b3a4071db60d5a8f5267fdeb01944fa9;
    stim[11] = 260'h8d8d5afcb5fd2c137c46dd6d2502fadd3a2a25176156eb94737828612092fabe0;
    stim[12] = 260'hafe2eea393e7f2975256becc0996fde80e4e895450105f2888084cb0061258e20;
    stim[13] = 260'hd4fa6ddf0da92073ca5dcbd2a6ea788229607e46e1919fb959555fcc27ee85b02;
    stim[14] = 260'hfae21b08bfa5554fc672fcb2bfdc9bca8514bbdc3ceba0d76eac4ec242f7d0bd5;
    stim[15] = 260'hbe1d9da39282110389f6933a19676f8e0001d84aac154a0bf6ca0f5e03de5a3ab;
    stim[16] = 260'he46d9e8da5470aef70407be68d44373161b04fb555305d97551ac54bed03722a6;
    stim[17] = 260'h9c73d291d7022920970b9d57b8e03ed1643bcf9a26d00734c448dfb5b53117805;
    stim[18] = 260'hda5be693b081ec84f9977e9a75772846b90bc36d6c84657c57bf7d314aa3e7400;
    stim[19] = 260'hb9d62936aa9a13177f0cee5082370d456cb5d3e90db1d4c8c2b59ee7c7c925e10;
    stim[20] = 260'ha56b583a0be8fafd50910ea2f7cf85c102c20993f71da92042e0a69c34fc6ecdd;
    stim[21] = 260'hd7003553a1964a7778e604f63c793f652ba13ef785ffd80e7a6ea32eea9f969b2;
    stim[22] = 260'h89756e7aec3b13faaa46a3f24422f44151cefbde812a9c9858c12cd1bb0ac5510;
    stim[23] = 260'hdf236542f72691b67580fa03d65cdbdb7baa566a740f9697d80db8c6ab6edbd82;
    stim[24] = 260'hfac136e4e9617afb495ef6e39a65bb4dd435ce0c8964cecdb2224501a5994a07d;
    stim[25] = 260'hdabd8b82b1382135d6858d24a4539eb30e6f012d905f34472318608b2e21427e0;
    stim[26] = 260'hdfbccd065a12dae65354932202d4900e7944717d5a7b5febf9467c21fd3437e26;
    stim[27] = 260'ha7405b6697058f0870ed97b1e6fa9ef00ac239adafb89ee64973d5953c8826398;
    stim[28] = 260'ha29e85576f0b3955e77e364dd1ac4e78666f60234ff8918cf093bc3944f67da0b;
    stim[29] = 260'hbcd5df75eff723c7000ce3bc404520d166b6df71837ebe0807609f7128d0b39cb;
    stim[30] = 260'hc22caf2c6ec09eec4ee2d7af0132523a19be07750fcaa55b17e86a54b94f34662;
    stim[31] = 260'h9323a6877f518bfc2e0f02068eb0b965fba9d9e1277a73d1faa037bf5314ee5db;
    stim[32] = 260'he8eff1d6cd489106ef4b257677adad4cf783d189a0cc3517c014da30cef929a52;
    stim[33] = 260'h9e6d24dfb5d834c69e230060af06b0c096ad2d76f07cbcf717d217f1229165126;
    stim[34] = 260'hfb20c92d65e42f07b68707b5ad0fd2809bdb2029c51f0856d86bc5169c44f3f85;
    stim[35] = 260'hab958374fbdcfc8a75499f8af34a2c1f890480590bda88b4379fcc981acdb2630;
    stim[36] = 260'he249bb372da5ec68b6c1cb3993383357a74862e221b0329fc4ecfc0f6e5879eab;
    stim[37] = 260'hd16ce7336c14ab98860a132609e63291662951dfdaf86e60518bfdf753fab8ff0;
    stim[38] = 260'hd65a500b974036b174f062cd1261771cb155668d3600217b6af09d1492e0fea50;
    stim[39] = 260'hd9a1faffd0effedf574d27a33e94b62cf227503f0a5b75f7e8e7cd77e5301d082;
    stim[40] = 260'hd3661311abeee53f0ebeb818c2fc200e6d7e6b396df8cd5c28cd3d67c426d0975;
    stim[41] = 260'ha6010070a86e7fd710077b994d69715fb4bf9add1d4a36537c9feba1a18f4413e;
    stim[42] = 260'heb1d6f01fc534e1ae0f2dd6e1c0dad2774bde880f725b21601ec564e6b97b20f0;
    stim[43] = 260'h8bfa05e9f0e6c0db53a4abad8496081d45eb292635a1692c875e8f4b66f0d3112;
    stim[44] = 260'h9530a73d986d57287f43d69837e385efec1bd2693c4182d2319b42e3bc9aa784e;
    stim[45] = 260'hd536ccbab689891a17fc7b9f0f182214d3c4711d21cd50f834e59ef5a77985f20;
    stim[46] = 260'hf8fc2e83057a261cc13c403f9121aad366bd2988f62466fb617a6f86fadb8da99;
    stim[47] = 260'h91ae5284512e89d63531765a618087ae7469a6db07fd834298c06acd98475debb;
    stim[48] = 260'hbcdbd1c4ab047ff15ae2c1581e2d7b276beff4d67962f09327d06773659a81fca;
    stim[49] = 260'h99f8df7b98e2d1d63146ecd60a67146a3b1fc89b03546c91751652b24a485302e;
    stim[50] = 260'hc65f486d2489c05b6cfbde09185e2342236a1b39f9033743c5a7ee054dafef69f;
    stim[51] = 260'hef41a2e53487134142e133305d3c37f97fe5750ab42b17847c16016f70f6dd6d9;
    stim[52] = 260'hf0c1ac27757a9df445bd28acb07a756f54bf41b84751ce85f0b85d2e51a9c2364;
    stim[53] = 260'h85eff1d34c8e7e8e571323615810f35c97afaa3f8c2f8ffb14426091d9663043d;
    stim[54] = 260'h995b0a7e60def9035c934bc4470c6a742761f7110a6d03a4bba9daa9f32f4fbe3;
    stim[55] = 260'h9b3b277911f8088a690fe488138e97eebfe9ee67c3fb62839e4194860e364ab63;
    stim[56] = 260'hf2285cc15d9b68d5873e6733942011197dfb1d4fb044388a730ec958d94d7c034;
    stim[57] = 260'hed5be68150d152aa9c291a132d6c629cfe727cc03a2f5d6baf0476d3f742206af;
    stim[58] = 260'hfd0f79126f93281965f0d2618b111b191b03a9ca45213246656c887a43fa49b52;
    stim[59] = 260'hff2b000c2c4d15bac2e4da27fd9941dc04feaad94fff3ee9f09e84bfa060727f6;
    stim[60] = 260'hbf364a3f84f41ea1185c5f35970e7bda29371715bc37a93ff22cd2002cbb6f357;
    stim[61] = 260'hc46ef365779d7171d5d5cd54e6adb17ea15919eed4ffa4615e7c0a510455dc92b;
    stim[62] = 260'hf1d14e7d2c3fadf79dbe438f8d9a235bdc863915a4d8d7fc7ba97c1960de2df20;
    stim[63] = 260'hc79c5f4f45a35279d09d1e67889d404fe58b982a1ff2f28eacfeb4df7e13ea05b;
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
      expv[0] = 258'h33747c33657afdad957c98bf96d9d65cb16491905d5156d52cb9e2151b58b5aa0;
      expv[1] = 258'h351d2135a484847d172108b275dbbcbc39d0b28ac2743a217dd083eae28bee0f4;
      expv[2] = 258'h02c026065e4103ee36c10bc2c36a66152911496f8b266d2031cb589cb0859b417;
      expv[3] = 258'h073f5b4534a067b1fb36c21e9fe3a462c89eb6d3f2c4312bb9434cd057fc64fca;
      expv[4] = 258'h19cad00fad427dcfdbe420c0c20f16fb5a623dff2302893922c94cd9bb0cfe148;
      expv[5] = 258'h16de6f3d4b81471cc3f51ee7279631bb4895a42556f36bf82235ac12f483acbe3;
      expv[6] = 258'h0dad8401e16d253fc4e96f4861bbbc2a4ac6a2b153ac1b70e268499b516904f72;
      expv[7] = 258'h3e85d952eb32c4c4381bc49f57cff2a76bfa232c2115b02b62abf7b504d244c71;
      expv[8] = 258'h3e73f5732bb1eb619130234d237a0a773781544eeec173979feb6f49de43510ec;
      expv[9] = 258'h3e73f5732bb1eb619130234d237a0a773781544eeec173979feb6f49de43510ec;
      expv[10] = 258'h3f386f740a75140faa05dfb16d078bde3b3a4071db60d5a8f5267fdeb01944fa9;
      expv[11] = 258'h1d8d5afcb5fd2c137c46dd6d2502fadd3a2a25176156eb94737828612092fabe0;
      expv[12] = 258'h3fe2eea393e7f2975256becc0996fde80e4e895450105f2888084cb0061258e20;
      expv[13] = 258'h3fe2eea393e7f2975256becc0996fde80e4e895450105f2888084cb0061258e20;
      expv[14] = 258'h3ae21b08bfa5554fc672fcb2bfdc9bca8514bbdc3ceba0d76eac4ec242f7d0bd5;
      expv[15] = 258'h3e1d9da39282110389f6933a19676f8e0001d84aac154a0bf6ca0f5e03de5a3ab;
      expv[16] = 258'h346d9e8da5470aef70407be68d44373161b04fb555305d97551ac54bed03722a6;
      expv[17] = 258'h346d9e8da5470aef70407be68d44373161b04fb555305d97551ac54bed03722a6;
      expv[18] = 258'h0a5be693b081ec84f9977e9a75772846b90bc36d6c84657c57bf7d314aa3e7400;
      expv[19] = 258'h39d62936aa9a13177f0cee5082370d456cb5d3e90db1d4c8c2b59ee7c7c925e10;
      expv[20] = 258'h356b583a0be8fafd50910ea2f7cf85c102c20993f71da92042e0a69c34fc6ecdd;
      expv[21] = 258'h356b583a0be8fafd50910ea2f7cf85c102c20993f71da92042e0a69c34fc6ecdd;
      expv[22] = 258'h19756e7aec3b13faaa46a3f24422f44151cefbde812a9c9858c12cd1bb0ac5510;
      expv[23] = 258'h0f236542f72691b67580fa03d65cdbdb7baa566a740f9697d80db8c6ab6edbd82;
      expv[24] = 258'h3ac136e4e9617afb495ef6e39a65bb4dd435ce0c8964cecdb2224501a5994a07d;
      expv[25] = 258'h0abd8b82b1382135d6858d24a4539eb30e6f012d905f34472318608b2e21427e0;
      expv[26] = 258'h0fbccd065a12dae65354932202d4900e7944717d5a7b5febf9467c21fd3437e26;
      expv[27] = 258'h37405b6697058f0870ed97b1e6fa9ef00ac239adafb89ee64973d5953c8826398;
      expv[28] = 258'h37405b6697058f0870ed97b1e6fa9ef00ac239adafb89ee64973d5953c8826398;
      expv[29] = 258'h37405b6697058f0870ed97b1e6fa9ef00ac239adafb89ee64973d5953c8826398;
      expv[30] = 258'h022caf2c6ec09eec4ee2d7af0132523a19be07750fcaa55b17e86a54b94f34662;
      expv[31] = 258'h1323a6877f518bfc2e0f02068eb0b965fba9d9e1277a73d1faa037bf5314ee5db;
      expv[32] = 258'h38eff1d6cd489106ef4b257677adad4cf783d189a0cc3517c014da30cef929a52;
      expv[33] = 258'h38eff1d6cd489106ef4b257677adad4cf783d189a0cc3517c014da30cef929a52;
      expv[34] = 258'h3b20c92d65e42f07b68707b5ad0fd2809bdb2029c51f0856d86bc5169c44f3f85;
      expv[35] = 258'h3b958374fbdcfc8a75499f8af34a2c1f890480590bda88b4379fcc981acdb2630;
      expv[36] = 258'h3b958374fbdcfc8a75499f8af34a2c1f890480590bda88b4379fcc981acdb2630;
      expv[37] = 258'h3b958374fbdcfc8a75499f8af34a2c1f890480590bda88b4379fcc981acdb2630;
      expv[38] = 258'h065a500b974036b174f062cd1261771cb155668d3600217b6af09d1492e0fea50;
      expv[39] = 258'h09a1faffd0effedf574d27a33e94b62cf227503f0a5b75f7e8e7cd77e5301d082;
      expv[40] = 258'h03661311abeee53f0ebeb818c2fc200e6d7e6b396df8cd5c28cd3d67c426d0975;
      expv[41] = 258'h36010070a86e7fd710077b994d69715fb4bf9add1d4a36537c9feba1a18f4413e;
      expv[42] = 258'h36010070a86e7fd710077b994d69715fb4bf9add1d4a36537c9feba1a18f4413e;
      expv[43] = 258'h36010070a86e7fd710077b994d69715fb4bf9add1d4a36537c9feba1a18f4413e;
      expv[44] = 258'h36010070a86e7fd710077b994d69715fb4bf9add1d4a36537c9feba1a18f4413e;
      expv[45] = 258'h0536ccbab689891a17fc7b9f0f182214d3c4711d21cd50f834e59ef5a77985f20;
      expv[46] = 258'h38fc2e83057a261cc13c403f9121aad366bd2988f62466fb617a6f86fadb8da99;
      expv[47] = 258'h11ae5284512e89d63531765a618087ae7469a6db07fd834298c06acd98475debb;
      expv[48] = 258'h3cdbd1c4ab047ff15ae2c1581e2d7b276beff4d67962f09327d06773659a81fca;
      expv[49] = 258'h19f8df7b98e2d1d63146ecd60a67146a3b1fc89b03546c91751652b24a485302e;
      expv[50] = 258'h065f486d2489c05b6cfbde09185e2342236a1b39f9033743c5a7ee054dafef69f;
      expv[51] = 258'h3f41a2e53487134142e133305d3c37f97fe5750ab42b17847c16016f70f6dd6d9;
      expv[52] = 258'h3f41a2e53487134142e133305d3c37f97fe5750ab42b17847c16016f70f6dd6d9;
      expv[53] = 258'h15eff1d34c8e7e8e571323615810f35c97afaa3f8c2f8ffb14426091d9663043d;
      expv[54] = 258'h195b0a7e60def9035c934bc4470c6a742761f7110a6d03a4bba9daa9f32f4fbe3;
      expv[55] = 258'h1b3b277911f8088a690fe488138e97eebfe9ee67c3fb62839e4194860e364ab63;
      expv[56] = 258'h32285cc15d9b68d5873e6733942011197dfb1d4fb044388a730ec958d94d7c034;
      expv[57] = 258'h3d5be68150d152aa9c291a132d6c629cfe727cc03a2f5d6baf0476d3f742206af;
      expv[58] = 258'h3d5be68150d152aa9c291a132d6c629cfe727cc03a2f5d6baf0476d3f742206af;
      expv[59] = 258'h3f2b000c2c4d15bac2e4da27fd9941dc04feaad94fff3ee9f09e84bfa060727f6;
      expv[60] = 258'h3f364a3f84f41ea1185c5f35970e7bda29371715bc37a93ff22cd2002cbb6f357;
      expv[61] = 258'h046ef365779d7171d5d5cd54e6adb17ea15919eed4ffa4615e7c0a510455dc92b;
      expv[62] = 258'h31d14e7d2c3fadf79dbe438f8d9a235bdc863915a4d8d7fc7ba97c1960de2df20;
      expv[63] = 258'h079c5f4f45a35279d09d1e67889d404fe58b982a1ff2f28eacfeb4df7e13ea05b;
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
