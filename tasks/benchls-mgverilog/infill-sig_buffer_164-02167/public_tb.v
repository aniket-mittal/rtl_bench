// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 164;
  localparam OW = 164;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02167 dut (
    .sig(in_vec[163:0]),
    .sig_buf(out_vec[163:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 164'h69407958510ea0bd4a61985c2aab1d7b9a4d2acf2;
    stim[1] = 164'hb3b8bb8c3d377a71e2d58c67f33852447dd205489;
    stim[2] = 164'hda613b2ae9442acde93c12421f211fc16fd411de3;
    stim[3] = 164'h903eef009bcb6ce95ea3604e9bc1399226391edfb;
    stim[4] = 164'habdf4093a65ab139f6c4942451413b5f0f988c3f6;
    stim[5] = 164'h9b0c3371b3404b0142402b8342019b99f4659fc34;
    stim[6] = 164'ha66fa3c40b3cf81d12aaca5af0e10d3670d1254b5;
    stim[7] = 164'h68132b3c0367402b1f6dcb334deae250364557b96;
    stim[8] = 164'h126ca53892fb522b1380f6ab5305b25fc1deaee9d;
    stim[9] = 164'hade4475bb5e6cf817b3d2c78ae532933a27b90eb7;
    stim[10] = 164'h85cb5d2d54c8346b372348dfc16ddc34e5ce43ec6;
    stim[11] = 164'hc80fd8dab8301f4e9908a0185375bff66c49fde47;
    stim[12] = 164'hf5464539cfbdc3a0415f2bd895ca7738bd5a73aac;
    stim[13] = 164'h894ddda3117d9b4baf7e06f97b4ca88d784bd2a45;
    stim[14] = 164'hdbb249bb3b4b69ecdc78d08fab679705eafef15d8;
    stim[15] = 164'h535fda4c112b7f83ac01215ceeb42677e31251e8d;
    stim[16] = 164'h0848f6f53da9b125649afd0e2593640ddacd916b6;
    stim[17] = 164'h3bc37014ce5db440555816204fe943888feaeb7ae;
    stim[18] = 164'h04f4a4a1635d7108c30779d50b3e5792c02798a15;
    stim[19] = 164'h9695c9ee4810d69f92f3c432d8a29b7bcbc4be403;
    stim[20] = 164'h0a8313ca5c431127181b35cdef5ac72bdd59c3c2f;
    stim[21] = 164'h26b1838c9731c763bf01a1497989c4a2a903cf570;
    stim[22] = 164'h89151083f61310a61b1468ebca1a463152ca013a7;
    stim[23] = 164'h77b96a2620a602ccd532ce5b94fc3bf7e3f8204b7;
    stim[24] = 164'h543559bd27508344429b43a355197d041cc0cf93a;
    stim[25] = 164'h751bc86aabc312b716f6bbb649c04ac5ac9f3bbea;
    stim[26] = 164'he5eb71c8693d3909890979ddfbc4a7674e05b36e1;
    stim[27] = 164'h74942402f06d0f696b3f3a25ec15f39caeb03c137;
    stim[28] = 164'hf0afac815b7502a9fdb7191ecff1a6c28083350e3;
    stim[29] = 164'h721b1accdd528ea3847f461652f7f79af1f0ee5c0;
    stim[30] = 164'h858e1ba7b20f02cfbb6e86a6bb7419be48c32e9a7;
    stim[31] = 164'h86d8bcd360aa6a234a6cd222ad8d683f6b464caa7;
    stim[32] = 164'h13c1337a3030f82fd1827e35c5bda07fc9a4c51d6;
    stim[33] = 164'h34441ddb5685636982ea4e00ac0d9d0300f409349;
    stim[34] = 164'h5b4b1e598003b4eff6b0da72fbb7729b6787b3f69;
    stim[35] = 164'hc48a9619bd9f6f1695a01f32bc505183effe60b60;
    stim[36] = 164'h856cf58c48fcec9d4d11187d6610ee9967c4d36e3;
    stim[37] = 164'h8ddfd07bb1ee47969b1f1aa74be7a5f23ffdcc396;
    stim[38] = 164'h147871e1f256fd63528d4e06210b4fab1a0da65d2;
    stim[39] = 164'h6294b33b295878d48679db8161939a5e3c1e42f1f;
    stim[40] = 164'h49ed4872b5fcbd419f11007b1d0628353cee42d4a;
    stim[41] = 164'h59ceffc3f79d26a2fbeb751680f9c74a35dc2db1d;
    stim[42] = 164'h3af35577bface9fb724f35a7bc861e734ab2bf05f;
    stim[43] = 164'hebc37e3f79d87254bf2af393a286f9e9f1f8ba284;
    stim[44] = 164'hcf8802541098534bec462d9d5dd6836aca58a1a0c;
    stim[45] = 164'hcdb3d5b4d17b7a9a005966fe4a012bc17840a4556;
    stim[46] = 164'hf1e32a57a9859a990f582da230ba007b3e69ae85c;
    stim[47] = 164'h2708a0cd1a93f1d013fd0fd537ba3e10919dfde67;
    stim[48] = 164'hf29f1de5ea4e76390ff4476525092e59cc407e48b;
    stim[49] = 164'h41bd4cabb56eeb401ec8cb025d2e7d5fd2c0f8a38;
    stim[50] = 164'h6f2a913d8399f13678a4db26e3ae27a92289d4340;
    stim[51] = 164'h837c4490d596e753643bae3856850634000a8d159;
    stim[52] = 164'h96cf2fe15a75acbea8dab6bb7b4091b29cf034bae;
    stim[53] = 164'h38f3b38607204ae137aeebfc05d548baf5686df92;
    stim[54] = 164'h160507339467e8e52ac86d1caf87168725207b532;
    stim[55] = 164'h5cd9f9135b99c2b041c9f98cdd3b95252a34a0093;
    stim[56] = 164'h336433f540dcc2c0bff73bd30ffdcf8df883686a2;
    stim[57] = 164'h56126b8a8300c9631766bc9754e45fdb3010ebeed;
    stim[58] = 164'hf9aaf4ed8931135c68f6a2b80899a757997fc9c77;
    stim[59] = 164'hcee054cb20169ff1b75f9a0fb0e6fc82b7c1e96a2;
    stim[60] = 164'h5f0ce705ae631704ea2672a72e82d238c910f5a81;
    stim[61] = 164'h1ccc24d9040d24738f84773b67120c019e1209c44;
    stim[62] = 164'h7e1bebae2d7569ac61a7b5a5a1ea2d01923ea8e5a;
    stim[63] = 164'hadef99bd80ce8699c5232d9a96280fa6667efc50c;
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
      expv[0] = 164'h69407958510ea0bd4a61985c2aab1d7b9a4d2acf2;
      expv[1] = 164'hb3b8bb8c3d377a71e2d58c67f33852447dd205489;
      expv[2] = 164'hda613b2ae9442acde93c12421f211fc16fd411de3;
      expv[3] = 164'h903eef009bcb6ce95ea3604e9bc1399226391edfb;
      expv[4] = 164'habdf4093a65ab139f6c4942451413b5f0f988c3f6;
      expv[5] = 164'h9b0c3371b3404b0142402b8342019b99f4659fc34;
      expv[6] = 164'ha66fa3c40b3cf81d12aaca5af0e10d3670d1254b5;
      expv[7] = 164'h68132b3c0367402b1f6dcb334deae250364557b96;
      expv[8] = 164'h126ca53892fb522b1380f6ab5305b25fc1deaee9d;
      expv[9] = 164'hade4475bb5e6cf817b3d2c78ae532933a27b90eb7;
      expv[10] = 164'h85cb5d2d54c8346b372348dfc16ddc34e5ce43ec6;
      expv[11] = 164'hc80fd8dab8301f4e9908a0185375bff66c49fde47;
      expv[12] = 164'hf5464539cfbdc3a0415f2bd895ca7738bd5a73aac;
      expv[13] = 164'h894ddda3117d9b4baf7e06f97b4ca88d784bd2a45;
      expv[14] = 164'hdbb249bb3b4b69ecdc78d08fab679705eafef15d8;
      expv[15] = 164'h535fda4c112b7f83ac01215ceeb42677e31251e8d;
      expv[16] = 164'h0848f6f53da9b125649afd0e2593640ddacd916b6;
      expv[17] = 164'h3bc37014ce5db440555816204fe943888feaeb7ae;
      expv[18] = 164'h04f4a4a1635d7108c30779d50b3e5792c02798a15;
      expv[19] = 164'h9695c9ee4810d69f92f3c432d8a29b7bcbc4be403;
      expv[20] = 164'h0a8313ca5c431127181b35cdef5ac72bdd59c3c2f;
      expv[21] = 164'h26b1838c9731c763bf01a1497989c4a2a903cf570;
      expv[22] = 164'h89151083f61310a61b1468ebca1a463152ca013a7;
      expv[23] = 164'h77b96a2620a602ccd532ce5b94fc3bf7e3f8204b7;
      expv[24] = 164'h543559bd27508344429b43a355197d041cc0cf93a;
      expv[25] = 164'h751bc86aabc312b716f6bbb649c04ac5ac9f3bbea;
      expv[26] = 164'he5eb71c8693d3909890979ddfbc4a7674e05b36e1;
      expv[27] = 164'h74942402f06d0f696b3f3a25ec15f39caeb03c137;
      expv[28] = 164'hf0afac815b7502a9fdb7191ecff1a6c28083350e3;
      expv[29] = 164'h721b1accdd528ea3847f461652f7f79af1f0ee5c0;
      expv[30] = 164'h858e1ba7b20f02cfbb6e86a6bb7419be48c32e9a7;
      expv[31] = 164'h86d8bcd360aa6a234a6cd222ad8d683f6b464caa7;
      expv[32] = 164'h13c1337a3030f82fd1827e35c5bda07fc9a4c51d6;
      expv[33] = 164'h34441ddb5685636982ea4e00ac0d9d0300f409349;
      expv[34] = 164'h5b4b1e598003b4eff6b0da72fbb7729b6787b3f69;
      expv[35] = 164'hc48a9619bd9f6f1695a01f32bc505183effe60b60;
      expv[36] = 164'h856cf58c48fcec9d4d11187d6610ee9967c4d36e3;
      expv[37] = 164'h8ddfd07bb1ee47969b1f1aa74be7a5f23ffdcc396;
      expv[38] = 164'h147871e1f256fd63528d4e06210b4fab1a0da65d2;
      expv[39] = 164'h6294b33b295878d48679db8161939a5e3c1e42f1f;
      expv[40] = 164'h49ed4872b5fcbd419f11007b1d0628353cee42d4a;
      expv[41] = 164'h59ceffc3f79d26a2fbeb751680f9c74a35dc2db1d;
      expv[42] = 164'h3af35577bface9fb724f35a7bc861e734ab2bf05f;
      expv[43] = 164'hebc37e3f79d87254bf2af393a286f9e9f1f8ba284;
      expv[44] = 164'hcf8802541098534bec462d9d5dd6836aca58a1a0c;
      expv[45] = 164'hcdb3d5b4d17b7a9a005966fe4a012bc17840a4556;
      expv[46] = 164'hf1e32a57a9859a990f582da230ba007b3e69ae85c;
      expv[47] = 164'h2708a0cd1a93f1d013fd0fd537ba3e10919dfde67;
      expv[48] = 164'hf29f1de5ea4e76390ff4476525092e59cc407e48b;
      expv[49] = 164'h41bd4cabb56eeb401ec8cb025d2e7d5fd2c0f8a38;
      expv[50] = 164'h6f2a913d8399f13678a4db26e3ae27a92289d4340;
      expv[51] = 164'h837c4490d596e753643bae3856850634000a8d159;
      expv[52] = 164'h96cf2fe15a75acbea8dab6bb7b4091b29cf034bae;
      expv[53] = 164'h38f3b38607204ae137aeebfc05d548baf5686df92;
      expv[54] = 164'h160507339467e8e52ac86d1caf87168725207b532;
      expv[55] = 164'h5cd9f9135b99c2b041c9f98cdd3b95252a34a0093;
      expv[56] = 164'h336433f540dcc2c0bff73bd30ffdcf8df883686a2;
      expv[57] = 164'h56126b8a8300c9631766bc9754e45fdb3010ebeed;
      expv[58] = 164'hf9aaf4ed8931135c68f6a2b80899a757997fc9c77;
      expv[59] = 164'hcee054cb20169ff1b75f9a0fb0e6fc82b7c1e96a2;
      expv[60] = 164'h5f0ce705ae631704ea2672a72e82d238c910f5a81;
      expv[61] = 164'h1ccc24d9040d24738f84773b67120c019e1209c44;
      expv[62] = 164'h7e1bebae2d7569ac61a7b5a5a1ea2d01923ea8e5a;
      expv[63] = 164'hadef99bd80ce8699c5232d9a96280fa6667efc50c;
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
