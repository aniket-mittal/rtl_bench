// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 201;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[200:101]),
    .b(in_vec[100:1]),
    .sel(in_vec[0:0]),
    .out(out_vec[99:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 201'h04ac90eb667748f91fc29c2a2df2044fe2b1bcbc0811ef565c8;
    stim[1] = 201'h17ab91a0074c18c108115ca0dd3286912711fb92ade8aa10073;
    stim[2] = 201'h14432ff4e13fb74b9fd658169727e5e9098897ad733ebbc84f7;
    stim[3] = 201'h0f6cc568729f00b38179384594f1380e20fdca3cdcd522eff1d;
    stim[4] = 201'h0603de6df0ea457f9793f2265aaca4af8c3fce7907c76447b1a;
    stim[5] = 201'h0ab17520a68e687a40b2d1ba458b6094aea113926410f103927;
    stim[6] = 201'h0d116869430100b75ea737774eebfc65f9f4ba454db7173f837;
    stim[7] = 201'h1b1fcb737c1bfed01fe73e70a9d22c09f5da22f41f6f66abb88;
    stim[8] = 201'h166a0aa11e4d2b348a78c608782654780f55648f6a6ec07e880;
    stim[9] = 201'h1905e2a44eaf5dc1c5adb69d1bba71ae29431cf8be1878be5ee;
    stim[10] = 201'h099a3f7edc0067df9bd58f61efffbf1054bbe11f7590e692786;
    stim[11] = 201'h0252022bcdaff48e736ffe933a66feeca6d7511b09688bdbab0;
    stim[12] = 201'h1c1e71ac54a8eec3758eec0fb786d82e21b0e029b48abf2a488;
    stim[13] = 201'h0f33991567da518849d3847d6e00ca1f34337ed6f00651adfbf;
    stim[14] = 201'h0d4d032c2cf860a40b6e5437059b34725cac93ab730a37721d3;
    stim[15] = 201'h1a9b13dd70b46bb815c2c2f6bd9422cedb4144221072fc279c6;
    stim[16] = 201'h0f4cad701c3e8a9096d7ff9c15e514e85e80564b0989f16e853;
    stim[17] = 201'h1b5f3c2c3fffa4e1986dc11353d594b5bd14be43327308dea0e;
    stim[18] = 201'h08311166bdb5cfa1b6a6b56e0e93516d1c98b7c394c85b07fd2;
    stim[19] = 201'h0e73ca93ea2e67f4fc35e2547f1142fa1f3b23ae674d0212e39;
    stim[20] = 201'h0449965f3395ae8ab0faabcd92bad9ab0607cc810f85cdce37e;
    stim[21] = 201'h1376983869933db7ea9330626466f7380636d9082455c8654ad;
    stim[22] = 201'h15a83ceade3e8e9460c10c06c74651d5779da89a0239be6f02c;
    stim[23] = 201'h06cc03a4086ef4bc643aa117c041e75e2efb8e558ad9aacb1eb;
    stim[24] = 201'h133b7305efc6186380c0635585febb44b2d1ba3be444c8773df;
    stim[25] = 201'h0ec870412702335f105d3de2168c8f81bb2980ba245df467f2b;
    stim[26] = 201'h0e4aac37dc8392364f58f7036753259ddea3641c2053c640661;
    stim[27] = 201'h03b62deeb08060b18d3f3c317f1761f4f035a35fba6abd232f4;
    stim[28] = 201'h109ecdd25a2a51a7b903ae2c8a4b4d7d29e8cbb4bb697679e24;
    stim[29] = 201'h0cf32a128374c0ac2c1f831af3543b9f2f4118c6bafa58ad37e;
    stim[30] = 201'h160d952e54ab42138762efb406561a2d74463726cbee3e77613;
    stim[31] = 201'h08aa4d8b9cf825af67e9f5101e712c0b27b55ab30af7fc61243;
    stim[32] = 201'h1d5da42b3fa2ca5737b4492672479e0f64273b5ba5bd3769054;
    stim[33] = 201'h1032b99ee7321977f95988b578777b4d728e9a2e8c0f0649ea8;
    stim[34] = 201'h1ab3d85e1dd3ff4f48ec17d11a637bcef27a2b4769356b444fb;
    stim[35] = 201'h05697485c196f9e9d1d5f9835b102da47287cbf12e2106e7c70;
    stim[36] = 201'h136e1023cfa1e75ee81937bf79367f2bb8d26d6061d1376cfcb;
    stim[37] = 201'h19c55f87bd2fc1030a5f2a2a31d20cd157eab870f12aaac941a;
    stim[38] = 201'h04179ef1aeeed32b15a936a7036957cab12d443f3d43229255e;
    stim[39] = 201'h0e56042c089e2a0b520e69ba6ecd4a9312b1b162cb3e2c074f1;
    stim[40] = 201'h092ecbb86b115b7a098587536a2f9785d0c97e426d41fbc8181;
    stim[41] = 201'h00b14955fd6ea8837137a963363e3debb5e767d2490ba81a313;
    stim[42] = 201'h1e6f27e945aac055e0792406b5a565249e1f2a4e44f847dad0c;
    stim[43] = 201'h14c6d36961ae61ff8bda2a0eda791b39db64e81c9b6ed3c1525;
    stim[44] = 201'h112857abb247f76bd7f4a1da8fec3bc48767d2d7d9051657693;
    stim[45] = 201'h0cf94ac8a6d2bab831a40ae0aea4bcf78b2986021d45bc61f81;
    stim[46] = 201'h17f7ad50b056b5b53b377bb319f266889b31822a29791e20e48;
    stim[47] = 201'h051b7acc4f62229e43cc6d59fe567bdfde33fdc4bb32cf0d0fb;
    stim[48] = 201'h1724fb6a28ee3fde89ccfd608e0b7ab5e878612b54e680b1c0d;
    stim[49] = 201'h1c59ebe0c77f92b039ca7d60eccd1e602117a2a8448fa666dfe;
    stim[50] = 201'h1e0c12aa2be5f68cdb07051a234d4222535b843a8f4e4dd984d;
    stim[51] = 201'h15579f4a0c3588aaddfffa9d93857710887ca997ca1c399e1f5;
    stim[52] = 201'h00471d7aaddfccadf420aa72d1389cdd14727e37429f25aa5e2;
    stim[53] = 201'h05ed4429776713224f68751f5f371438fa71b8a01fd5a751182;
    stim[54] = 201'h09d934fc4a35f91b202ee3eab477b41f6fe7aefeaf99908fa91;
    stim[55] = 201'h0fb6817e38a8cb7b5cd76165fae852fe9060d9a24e2c767c191;
    stim[56] = 201'h0fb57763c45e454bab4203d1278a79356b077b6ded02076459d;
    stim[57] = 201'h077e0ef7fb2c344e8de108a28d74c063c43f0c0aae814fde7e4;
    stim[58] = 201'h11f3579dcbc21a0495a5e48bb5bb9c18c0cd7d7808582c9cced;
    stim[59] = 201'h1cd36df23386c90f80cd73f6ddab76267caca02893610e2d574;
    stim[60] = 201'h159acf78934ab02fcac47754d840a7aac97214caeab63ce1f94;
    stim[61] = 201'h068de30600d0037afa3fd4dba2cb1864b9fb97d60e1dac49ba0;
    stim[62] = 201'h16ae8ad0afc2995d598a0da90fc5404e6606519f31dd7a3bbd5;
    stim[63] = 201'h0b01861a59867e679b23e60b44353247f7ada6b2929daa2e7ee;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 100'hf90227f158de5e0408f7ab2e4;
      expv[1] = 100'hbd5c8d003a60c608408ae506e;
      expv[2] = 100'ha2197fa709fdba5cfeb2c0b4b;
      expv[3] = 100'h7b662b4394f8059c0bc9c22ca;
      expv[4] = 100'h565257c61fe73c83e3b223d8d;
      expv[5] = 100'h558ba905347343d205968dd22;
      expv[6] = 100'h688b434a180805baf539bbba7;
      expv[7] = 100'he91604faed117a0fb7b355dc4;
      expv[8] = 100'h132a3c07aab247b537603f440;
      expv[9] = 100'hdd38d714a18e7c5f0c3c5f2f7;
      expv[10] = 100'hffdf882a5df08fbac873493c3;
      expv[11] = 100'h337f76536ba88d84b445edd58;
      expv[12] = 100'hc36c1710d87014da455f95244;
      expv[13] = 100'h799cc8ab3ed28c424e9c23eb7;
      expv[14] = 100'h6a68196167c305205b72a1b82;
      expv[15] = 100'hca11676da0a21108397e13ce3;
      expv[16] = 100'h7a656b80e1f45484b6bffce0a;
      expv[17] = 100'heaca5ade8a5f219939846f507;
      expv[18] = 100'h49a8b68e4c5be1ca642d83fe9;
      expv[19] = 100'h739e549f51733fa7e1af12a3f;
      expv[20] = 100'h5d6cd58303e64087c2e6e71bf;
      expv[21] = 100'h9bb4c1c34c99edbf549983132;
      expv[22] = 100'ha328eabbced44d011cdf37816;
      expv[23] = 100'h36601d204377a5e321d508be0;
      expv[24] = 100'h99db982f7e30c31c06031aac2;
      expv[25] = 100'h7643820938119af882e9ef10b;
      expv[26] = 100'h725561bee41c91b27ac7b81b3;
      expv[27] = 100'h8bb0fa781ad1afdd355e9197a;
      expv[28] = 100'h25a6be94f465da5db4bb3cf12;
      expv[29] = 100'haa1dcf97a08c635d7d2c569bf;
      expv[30] = 100'hb06ca972a55a109c3b177da03;
      expv[31] = 100'h45526c5ce7c12d7b3f4fa880f;
      expv[32] = 100'h23cf07b2139dadd2de9bb482a;
      expv[33] = 100'h3bbda6b9474d1746078324f54;
      expv[34] = 100'hd59ec2f0ee9ffa7a4760be88d;
      expv[35] = 100'h8816d23943e5f897108373e38;
      expv[36] = 100'h9b70811e7d0f3af740c9bdfbc;
      expv[37] = 100'he90668abf55c3878955564a0d;
      expv[38] = 100'hb4abe55896a21f9ea191492af;
      expv[39] = 100'h72b0216044f1505a90734dd37;
      expv[40] = 100'h49765dc3588adbd04c2c3a9b5;
      expv[41] = 100'h058a4aafeb75441b89bd4b19b;
      expv[42] = 100'hd2b2924f0f9527227c23ed686;
      expv[43] = 100'ha6369b4b0d730ffc5ed15076d;
      expv[44] = 100'h8942bd5d923fbb5ebfa50ed47;
      expv[45] = 100'h67ca56453695d5c18d2057057;
      expv[46] = 100'hf933444d98c11514bc8f10724;
      expv[47] = 100'h28dbd6627b1114f21e636acff;
      expv[48] = 100'hb927db514771fef44e67eb047;
      expv[49] = 100'h668f30108bd1542247d3336ff;
      expv[50] = 100'hf06095515f2fb466d83828d11;
      expv[51] = 100'haabcfa5061ac4556efffd4ec9;
      expv[52] = 100'h9c4e6e8a393f1ba14f92d52f1;
      expv[53] = 100'h9b8a1c7d38dc500fead3a88c1;
      expv[54] = 100'h4ec9a7e251afc8d901771f55a;
      expv[55] = 100'h7db40bf1c5465bdae6bb0b2fd;
      expv[56] = 100'h7dabbb1e22f22a5d5a101e893;
      expv[57] = 100'hba6031e21f86055740a7ef3f2;
      expv[58] = 100'h8f9abcee5e10d024ad2f245da;
      expv[59] = 100'hd5bb133e56501449b08716aba;
      expv[60] = 100'h2053d564b90a65755b1e70fca;
      expv[61] = 100'h658c325cfdcbeb070ed624dd0;
      expv[62] = 100'hb57456857e14caeacc506d487;
      expv[63] = 100'h1a9923fbd6d359494ed5173f7;
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
