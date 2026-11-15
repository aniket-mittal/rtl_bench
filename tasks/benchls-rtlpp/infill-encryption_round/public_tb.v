// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 256;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  encryption_round dut (
    .clk(clk),
    .state_in(in_vec[255:128]),
    .key_in(in_vec[127:0]),
    .state_out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 256'h4454fb44f2efc0fc2441b499598a46970b24e72b30af44580519e7e538690d38;
    stim[1] = 256'hbe9bc9ca19bd0c93c7026a4f70283cd837f2e8d159eb28b24bab470f91369462;
    stim[2] = 256'h6f37c7b693f955f4691282109123482a17893dcbbbca45ed21a5541db6000d4f;
    stim[3] = 256'h96cb98e13bd3045839996dfce95d15eea22b36a7315d203665227804bd2d10fc;
    stim[4] = 256'h07d7829a244f51ea46ab547e4fab21562f8e5fa4453decbbe7df42e6b35a32aa;
    stim[5] = 256'h7594f9eafb1d438a9b0cf179d55aca2d2af17de117f0e19c275f488ed7e4b734;
    stim[6] = 256'h17dce4cd8a0628e7684e83a36841046e1b94317dab7d32f780670313c0f92b4c;
    stim[7] = 256'h3f9c3f48a1df6a7c6b51cf0ca1b101fc66faf47c3b430cbd15625269b55c867a;
    stim[8] = 256'heaa8d8d166464aace064db97f4c6d3f1cfc498009561999a4c42df5da5f0e0be;
    stim[9] = 256'ha5eb2406d818187d926d35891c4a38a5015060dcf3c81d7b9a41054492cd8b69;
    stim[10] = 256'h6fc1a4c0db4c22c4d0fc9e116bad3e463953fc8357c20be1c376fbb5b533c563;
    stim[11] = 256'hafe4ba1f9476e1316dd64621572aa040d640b64aba8779e2d7ce35a6c073778b;
    stim[12] = 256'h27d10c2b78a1580aef75f44104717c63c44f159387d744558f24a8b8eea48249;
    stim[13] = 256'ha72b533bdd27ff02dbe3515482b904c2fb1a2c1e2b9da93384ade0b057aec3e2;
    stim[14] = 256'h6511e32c249c341f93aa42fd7f3f0c508b8d6783259aa1840cd805599592193b;
    stim[15] = 256'hd414d7c310421b7a46ed30002e288d274c9f3ec2efd30c07ac17d641fce72eca;
    stim[16] = 256'hc8c7134ab2a3f9068dfbe312d390b3d94ec0f76cdf1e3f685a0a6157bd36e97b;
    stim[17] = 256'h21b77cca9d81c47026021d758a071f291f0a69f76d173ef1872e04bab433d48e;
    stim[18] = 256'h0551f179b76bfe713830b0e154878e7ff0124f258f727b61d87902cfc65823a9;
    stim[19] = 256'h9101264bb218d1fd15a4a7b9a97dfa7e54f7339bd589e0089e27893cc003133f;
    stim[20] = 256'ha2a67c09b95ecdd8a266429e0c92788a0db3aa5c4bcb2a785bae50252973f3b7;
    stim[21] = 256'h9f301c2ddfac9fd019162603be9cf10ed9d45797678964beec5a54305ec2fc4b;
    stim[22] = 256'h620cc8eb24293e8affc20f6ed79a1d7a157cb22cd7719234ec574fd1388edc22;
    stim[23] = 256'hac3b710fc9912d8f9a5f6b44aeaee2583665f7415575220e73794e53cef32bb1;
    stim[24] = 256'h9e3f188e5402ebac633895325d1a138302b7bf481b3446d6676095220a3f21c0;
    stim[25] = 256'h6ba09feab5e44a055bbeee21c363098f52a5194d20a2ff8d49645f54602da79b;
    stim[26] = 256'hdd4695a4853ea4de2f03f3674879c5e8ed02967aeb21503f107914ca3364040f;
    stim[27] = 256'h334ee82e3ccfe45a922d05393555992b61e0d926708a2811d9a01bb8a909104c;
    stim[28] = 256'hf167b47704da8187c42fdec4ab4fc9e925649801427631fa1574288998e50aa2;
    stim[29] = 256'h40a2f1e0bc61477ee55d60e40c309b496d5eb4ed39ab8f8a6a551a6ee1b4759e;
    stim[30] = 256'h2f9c09d395efbc28d4c529d17f7807f8e0218cd1897cc65ec6c588b39cc8c0c4;
    stim[31] = 256'h8c265c4e17132c0c773d95f25f91caca076edced07f6083e1214b85ec68ac037;
    stim[32] = 256'h84553d8c756bc3182858d23b118083f0e90372e4f58656afcbaa27d8c97d823c;
    stim[33] = 256'h488fb863e62b945b5375eb9d8a952032ebfe6bc18433fc88bf601dd53b6a9151;
    stim[34] = 256'hef7fbd7b51cef2c99b05056176c8f1841e45c609f8b2eb6631692fd7020d024b;
    stim[35] = 256'h14a2efebf00b4cca93ed6ec4c21916fcf3f49bcb1b3ef681192a904e1e37d592;
    stim[36] = 256'hdcb433ebc30bcba45f92a0a7f50845f577f083e91af7d1e7ef3de12253192e05;
    stim[37] = 256'h848eb29d93b197e4d8eaf1df65bf43729b894ec440147a28c5e9949750936d7d;
    stim[38] = 256'h4d7edafb76dacbce5c240c3597151da27739a0a92cb192e1beb2187e20f64e7f;
    stim[39] = 256'hfbe8bc48c3484835664217bf8234c620bc2336e6e25538c029c12f3d71c75814;
    stim[40] = 256'hefd7f9b31eed9865936c5315f685f0a41dd000ec1fc27b1719d530c5ebea5865;
    stim[41] = 256'h22e70d7b7211a1bce7528a10bcb5e5d58221fe4719b8c6b350af837f4e52c93b;
    stim[42] = 256'h4a740d5fe22ab8075e5db782ea945b40bfc0cc5013cc665d4169a40d01dff33f;
    stim[43] = 256'hf4b66939feda2ce04fbab0d6340b708993d005a5e93e93bf23a6bd9fc39d21b0;
    stim[44] = 256'h79c9ca9d1e6e4e9183d74dbdac77587e29b48fdc6c528cdeef8476b76f459ebe;
    stim[45] = 256'h50eb664af265915a523ec3ae5fe8cfc5bd4e081d1ffa0bba3cdff158dac9ec0e;
    stim[46] = 256'hed62ad3eda0f944c8697be6e9662c1fd486dfb0c0d9546df06be10c7e1ca4bd2;
    stim[47] = 256'hc6c949ef14ad42bbbfab5cf975b8e23a2020f62f11acd451b9525c98d95b9900;
    stim[48] = 256'h043f0ffbae17c7067bd1490bb3c434611e85c3f314d117f25e617688a0bc057b;
    stim[49] = 256'h8381205495255f32eeccf358537616faefc18b21c24931867880e28b0148b162;
    stim[50] = 256'h052685d408064285a4652921d92412c6abe4c699a01a9f93eaa40d4ded13df3e;
    stim[51] = 256'h193bfe2d90d59e68835ee8395f7dd4c93ebdc368caf7615bf26172f3cc3544d4;
    stim[52] = 256'h927fe26d726ea0007e3ae8658bc8c8fd3ace2e756caad1de13006462ac706ae0;
    stim[53] = 256'h458e9764ed80714ea77f4a8a3e4f6bd0cf80a335428d7627980353818c83127a;
    stim[54] = 256'h3549ff28607868cf33de24e31150d616c73f5af0dfef576d730703daa030a85b;
    stim[55] = 256'h702ff1b8998dc355edf5b4a19a533082f0478579c25d5d64de3a2a32044029ca;
    stim[56] = 256'hdce9bd92532c891d288a48825515e1c66f2e6db4502967f70e732c34e6890777;
    stim[57] = 256'h53c3ad2e6ec03a145e8cdbcbbde3a530c6efbfb7d57175362710b3340bab3dd5;
    stim[58] = 256'h894f138c49096076ec200ac25a122b6587eb870a45243ade266274a3043abc6c;
    stim[59] = 256'h137b63deb4940fb1d52d486c6bfd935040aced42339ac3f2f55746529e18435a;
    stim[60] = 256'h7aea1edc7387a44064a1476dea607bb57f6674d25b10d156d4742d7c0d4ed1c2;
    stim[61] = 256'h0aba03a3a8a74c274a28d932bebaa66d1ef151c01d2e6fcfabe9d7680baf55b1;
    stim[62] = 256'hc769f755d2ce222b64eacc2669bd59514eb787dca8711dae67c88098e31674eb;
    stim[63] = 256'h51eadd9400a1805a970e3cd776e36b1d18dbe9254c0301f67a2971945f429b17;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'h4f701c6fc24084a42158537c61e34baf;
      expv[2] = 128'h8969211b405624218ca92d40e11ea8ba;
      expv[3] = 128'h78befa7d2833101948b7d60d27234565;
      expv[4] = 128'h34e0ae460a8e246e5cbb15f854700512;
      expv[5] = 128'h2859dd3e6172bd51a1741698fcf113fc;
      expv[6] = 128'h5f65840beceda216bc53b9f702be7d19;
      expv[7] = 128'h0c48d5b0217b1a10e82980b0a8b82f22;
      expv[8] = 128'h5966cb349a9c66c17e339d6514ed8786;
      expv[9] = 128'h256c40d1f327d336ac2604ca5136334f;
      expv[10] = 128'ha4bb44da2bd00506082c30cd8e87b3cc;
      expv[11] = 128'h569258438c8e2925138a65a4de9efb25;
      expv[12] = 128'h79a40c552ef198d3ba1873879759d7cb;
      expv[13] = 128'he39e19b8ff761c5f60515cf9ead5fe2a;
      expv[14] = 128'h5c317f25f6ba56315f4eb1e4d517c720;
      expv[15] = 128'hee9c84af0106959b9f7247a4eaad156b;
      expv[16] = 128'h988be901ff91177deafae641d2cfa3ed;
      expv[17] = 128'h8607e4266dbdc66ed7f182456ea65aa2;
      expv[18] = 128'h3ebd153df096fa81a12c19cf3e34cba7;
      expv[19] = 128'hf543be5c38198510e049b22e92dfadd6;
      expv[20] = 128'hc5f615d0679131f58b832e85697ee941;
      expv[21] = 128'haf15d655f295e7a0f9c812bb25e18b3d;
      expv[22] = 128'h46e44bbab825fb6ef54c7233e05e0d45;
      expv[23] = 128'h77707ac7f358acbe139540bfef14c158;
      expv[24] = 128'h9a5e864e9ce40f81e9262517605dc9e9;
      expv[25] = 128'h9c88a7c64f36ad7a0458001057253243;
      expv[26] = 128'h390586a79546b58812dab175a34eae14;
      expv[27] = 128'h304403de6e1ff4e13f7ae7ad7b1dc1e7;
      expv[28] = 128'h52ae31084c45cc4b4b8d1e819c5c8967;
      expv[29] = 128'hd4032c7646acb07dd15bf64d33aac34b;
      expv[30] = 128'h2dfc450d85cac8f48f087a8aed84eed7;
      expv[31] = 128'hcfbd85021c937a761200a162e3b0c73c;
      expv[32] = 128'h8b4880a310e5243265292dac991b0afd;
      expv[33] = 128'h6d564f6880ed95b7e3f2f5e3d8fd01cc;
      expv[34] = 128'ha371d3a2621868d3ec15f648b1ffb163;
      expv[35] = 128'hf13a7b72a97c19afaa6c2ab674c5f3cf;
      expv[36] = 128'he7567420eb35ba4b8ac7fe8adc2ec36e;
      expv[37] = 128'hab44b002d9fc1a43b0af4185a6116bf0;
      expv[38] = 128'h1f07fc59d3a5edcc1d036548352c2e0f;
      expv[39] = 128'h3a477a525a6b592fe296144bb7e353dd;
      expv[40] = 128'h47cb8aae211d70f54f833882f3f39e34;
      expv[41] = 128'hf207f95f012fe3728ab963d01d6fa8c1;
      expv[42] = 128'ha0c6f33c6ba9670fb7fd096ff2e72cee;
      expv[43] = 128'hf5b4c10ff1e6de5a1f34138feb4ba87f;
      expv[44] = 128'h67666c9c17e4bf5f6c1c0d49f7965139;
      expv[45] = 128'h507d4541723cc24f6c533b0ac332c6c0;
      expv[46] = 128'heda56e57ed9f9ae06ee132f6852123cb;
      expv[47] = 128'ha50f5632d79ad2938029aea977a88a2f;
      expv[48] = 128'he6e9bfc0050196ea06f90061ace37b3a;
      expv[49] = 128'h1abacc08bac6d0f425b03f831378311a;
      expv[50] = 128'h6c40ab75576c6eb4964c11d3523ea798;
      expv[51] = 128'haec2434da81cdd164ec1246c3437cdf8;
      expv[52] = 128'h27863d455a22ff33713f9aca9348901d;
      expv[53] = 128'ha8b1cc181ec471de6d3a8c0727b8a21d;
      expv[54] = 128'h8a0e3451af0d07693f7c190bb2cc79aa;
      expv[55] = 128'hf276a5d8bf973fa240d92739b1607e4d;
      expv[56] = 128'h806874c15bd09e3133cf9e939e131948;
      expv[57] = 128'hb3c7d0260305eeea26f964b6b39ce6b1;
      expv[58] = 128'h952c1299bbb14f22799c68ffb64898e5;
      expv[59] = 128'h0ea494860c2d5aa8ca427e615e289709;
      expv[60] = 128'h53d78e9c870ecc43207a0e3ef5e5d00a;
      expv[61] = 128'h058c6a0e28977516b0d56a11e72eaa77;
      expv[62] = 128'h144b5263b58923e8e1c10e5ab515f3dc;
      expv[63] = 128'h89de70897abf3f8503224cbe8aab2dba;
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
