// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 217;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_spsram_128x104 dut (
    .CLK(clk),
    .A(in_vec[216:210]),
    .CEN(in_vec[209:209]),
    .D(in_vec[208:105]),
    .GWEN(in_vec[104:104]),
    .WEN(in_vec[103:0]),
    .Q(out_vec[103:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 217'h18cf2607da6777c62923f8c7f0feb0ca4cdea07cfd9e01c96bfea73;
    stim[1] = 217'h03a3f37aa12418377cfadd47e99cf9e14e508e8ddbd574b817ded63;
    stim[2] = 217'h0f9a7f6f4478960e708454f2c3c63f59aee05eefbffb5a5a165863d;
    stim[3] = 217'h1f07a4b381729b67a1cd917a57cd80f416ea32c696f26500817dfd5;
    stim[4] = 217'h0f7e8e71ba8ddb8c0e33f44ec67a53c19ada2f276a58b1206aa401a;
    stim[5] = 217'h014a4311f786e9b4484f0dbe96021205af5e7795e86e065f2a4315d;
    stim[6] = 217'h1d0d7455917658fb29d110a08703b275b8c6d10cfe1aa7c3a1be6e9;
    stim[7] = 217'h11017ac533355b7216ef015be1d14bb694a64ef4307562f515232d8;
    stim[8] = 217'h10eb7c13181f7ba60d1580e6f9461c221cf304efc0eae9021f2e599;
    stim[9] = 217'h1c5f3ff076ff7dedbf56394f64c436db81708675dce8928c1c56e4f;
    stim[10] = 217'h10237224d66275a3ddb882fdedc40b8a175c13af839bb63e92c05a8;
    stim[11] = 217'h16c947aeb2b353c15a71cb48dff9907888b6a2060a8af10b0f42c13;
    stim[12] = 217'h0c89f64c0efff6830833215829de20d852aa0bb3cc74bbc98119fe6;
    stim[13] = 217'h0a3ac4959be73035f9b4243fdf666f86b28290aa4efb7c865c7f231;
    stim[14] = 217'h1d1b0c1e6efc4a4d051c4269faee27942159028a595dbe153100875;
    stim[15] = 217'h19702fed3e45eac15a49850ca2e0792ebf85be37fc0bbf6a4498107;
    stim[16] = 217'h02e3c4c50e0cdcfba0624e6dd8cf138a5040f1c93431a337e102dcd;
    stim[17] = 217'h0cc20094822a635e155fa02faaace39ae174d70994fa3a7665bdb3e;
    stim[18] = 217'h11ec459874b193ae81e66df0ee49b4749d18f9ae8bab65052d822da;
    stim[19] = 217'h0748a1bfa91e17466efcc4c5e1c2f032eabcdfdecdb73e93096baf8;
    stim[20] = 217'h15e48ba824af332da881630c3a0a992f47f97808caeb06deb5b2bc7;
    stim[21] = 217'h1ca8cc3993518583b93efcaa5523537d6f09e0e3e0403497b90e9fc;
    stim[22] = 217'h193ec3e65d8bab58f9ea73614a00fce68d9e437d4bca233f26f73f5;
    stim[23] = 217'h15dd7c5b8d9d9b2fc8cf14c5d175b57bc7d78ada972320a11c2ab1f;
    stim[24] = 217'h0f0cb257c6ba0a634ee43ba26d6fd2370fd089c0c7265e3f26f538b;
    stim[25] = 217'h0ec960ef59717122cf96e8e0597b52fa4f072ee580b871255ec1181;
    stim[26] = 217'h1fa887e4390b0f736ac2cfeb1a072e4d6ec7731a36f64344b48c7b2;
    stim[27] = 217'h122caf266b25a0c58ceeae8e17f67cafa04244c2fcaa1b59b642de9;
    stim[28] = 217'h1d671fcafdf205d96fa15eed21598bf754ced554658e43baf737c43;
    stim[29] = 217'h175de7cb571f6b9f238889fc4b66915ecf24ea654106b8b5c6d22fa;
    stim[30] = 217'h0c5f162eb00db28794e44c620122135072e1b1d3384c28c4816d90d;
    stim[31] = 217'h1fb0f5b65bb8eaffb63dbd33e52ac3bc141a7f55cd06f305e862eb1;
    stim[32] = 217'h1cf6366c2c4c7e55028f39da643bfbb43e86c54b1db4f4ee1cea756;
    stim[33] = 217'h0cc80649ef7d9da7c52108a96d85741a1f2337bbb3e2e6ebdd8f0c9;
    stim[34] = 217'h186b39417cbbd9d1d6e93bb136675559977e1a6bc29e7d6110ee53c;
    stim[35] = 217'h0c3c4baf05c891790d37253105787071ac1c341177c664b9f4eed18;
    stim[36] = 217'h06f3a83a7fbe388dbf248bd6bccc21998176e2cb8497d5566b803bb;
    stim[37] = 217'h0c79eab6552772158437f2f60c058ca3536c5f448286b372fa6c60d;
    stim[38] = 217'h1ab4f84d013ed9e804a1ed1442c6705d69ccea06df88aa89d28d1aa;
    stim[39] = 217'h05554428f0c7acf3c67ce92727f98e62fa0d63a68317dcbb00327d6;
    stim[40] = 217'h0f91217de688a649b95dc0660169d286c7b693c43bf74990ca46691;
    stim[41] = 217'h041d9b364f077622c8a06d3d0a816ec3c9bb637b8fb01ade5956cb7;
    stim[42] = 217'h1d1a89548f173f67eaa465d5e5fd1ef8576213824c029c2984998f4;
    stim[43] = 217'h06e154bf2ac4472923d5f7b8df9bdb71c782e1897075b654ed060a7;
    stim[44] = 217'h12863c7ecd981d0c3ef27b35b8fed3b777f7d02725476f9bd650bfd;
    stim[45] = 217'h116bacdc12ffb416bcf83a02c683b960bf40ce5689f93847adb5ddf;
    stim[46] = 217'h0e74db0fbbf12961f3dc7bc7553e00e31347d5e5dd1bdabc312e67c;
    stim[47] = 217'h0fc7189f2e965eac2e5062513732ff668fefc58cb8bcb24e498652d;
    stim[48] = 217'h182cf12698d7c14d080aefde512c9843b72e6703b5ff873e7b51cd3;
    stim[49] = 217'h19dcd05a9c48aa6d6025639e8109095f6e4ce0f0a0b6ff0ec1fedef;
    stim[50] = 217'h0828a084a9fbbfe50a42a63b0909b4a3d78d309845c88da0b2c0f3b;
    stim[51] = 217'h0de047d23c20be8773a955bbcd039fa2fe713a7c130c57956c37bfb;
    stim[52] = 217'h107cc90aa17158d9d476d994f52399014c12eacb1cba2229ec1defc;
    stim[53] = 217'h14ec94d3c14e2c4db2ffd350b05c68c127e52d3ee6be0121306a75d;
    stim[54] = 217'h1a8a75b3590952459aaf47f1f382be1828917f055c39474a6f7ca20;
    stim[55] = 217'h0f6e0556300a54e18dcc7a555a09c9bd5aa3c8d344f0789d27b038d;
    stim[56] = 217'h12bf06a2e3bde02e49f251e3fb8ae95b9461820c36b1938359a1bb0;
    stim[57] = 217'h0a72649db961288c133c71c8afd1d2f7437fbf945647102363ccce2;
    stim[58] = 217'h1f7a377dfdda8905ee8e319a83192cff4438aa878bcf7a5b6d7a595;
    stim[59] = 217'h0925cd3c23507bf721e7876b4b5ac2a72d18e33a0483914406d4345;
    stim[60] = 217'h0d0fdff866777b91d4c3a597cd2bef61347a67da33a4a11806b9998;
    stim[61] = 217'h19f70d5437287a79591b7248bf7806312b6b363482ad36976177032;
    stim[62] = 217'h0c24c9d5dc726c1e06c2865b01e017c3bbda64b8f19464685b6fda5;
    stim[63] = 217'h093e5b578ddacab4eccf189ed11bb9915a1a8d00a39f583c624779e;
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
      expv[0] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 104'h3d259cxxxxxxxxxxxxxxd2be6c;
      expv[5] = 104'h3d259cxxxxxxxxxxxxxxd2be6c;
      expv[6] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 104'hxxxxxxxxxxxxx0b7780adf0e8a;
      expv[9] = 104'hxxxxxxxxxxxxx0b7780adf0e8a;
      expv[10] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 104'h4fb260xxxxxxx841990ac14ef1;
      expv[14] = 104'h4fb260xxxxxxx841990ac14ef1;
      expv[15] = 104'hd860f377e2526828e21xxxxxxx;
      expv[16] = 104'hd860f377e2526828e21xxxxxxx;
      expv[17] = 104'hd860f377e2526828e21xxxxxxx;
      expv[18] = 104'h1004a411531afxxxxxxxxxxxxx;
      expv[19] = 104'h1004a411531afxxxxxxxxxxxxx;
      expv[20] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 104'h1004a411531afxxxxxxxxxxxxx;
      expv[35] = 104'h1004a411531afxxxxxxxxxxxxx;
      expv[36] = 104'h1004a411531afxxxxxxxxxxxxx;
      expv[37] = 104'h1004a411531afxxxxxxxxxxxxx;
      expv[38] = 104'h1004a411531afxxxxxxxxxxxxx;
      expv[39] = 104'h1004a411531afxxxxxxxxxxxxx;
      expv[40] = 104'hxxxxxxx63d679e33e749393fcc;
      expv[41] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 104'hxxxxxxxxxxxxxxxxxxxxe8540b;
      expv[43] = 104'hd860f377e2526828e21xxxxxxx;
      expv[44] = 104'hd860f377e2526828e21xxxxxxx;
      expv[45] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 104'hxxxxxxx245536xxxxxxxf40848;
      expv[51] = 104'hxxxxxxx245536xxxxxxxf40848;
      expv[52] = 104'hxxxxxxx245536xxxxxxxf40848;
      expv[53] = 104'hxxxxxxx245536xxxxxxxf40848;
      expv[54] = 104'hxxxxxxx245536xxxxxxxf40848;
      expv[55] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 104'hxxxxxxxxxxxxxxxxxxxxbe695f;
      expv[62] = 104'hxxxxxxxxxxxxxxxxxxxxbe695f;
      expv[63] = 104'hxxxxxxxxxxxxxxxxxxxxbe695f;
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
