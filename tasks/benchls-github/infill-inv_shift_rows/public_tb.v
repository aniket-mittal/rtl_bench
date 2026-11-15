// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  inv_shift_rows dut (
    .in(in_vec[127:0]),
    .out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'h4c66d369fb08971b5a553dfda277f32d;
    stim[1] = 128'h59ea939869bd27423855ecb0d966995c;
    stim[2] = 128'hf1b64d6dbfa1e8dfbde4f953fcb6c27c;
    stim[3] = 128'hcc37fe71c583290a63ca9c9cf17a431a;
    stim[4] = 128'hb7e1929658a5949d84740fe62b67e917;
    stim[5] = 128'h957a62be10fd35895335dc314bca2bf2;
    stim[6] = 128'h04a77005cf87d5985350c6c7f0afef88;
    stim[7] = 128'h28dce28a3bb4dc97d802d94cddb6697e;
    stim[8] = 128'h0d34945fac9a72767b6974241552fdfe;
    stim[9] = 128'h8c176391dd24ee0db9ecb39e64f35d20;
    stim[10] = 128'h294343a0cfff15109d95db2d2295d8f0;
    stim[11] = 128'h83a4c648b0f3569d736f047db1768b20;
    stim[12] = 128'h8dbfaf0270b452572f90d9180f3b584d;
    stim[13] = 128'h5a1db9d906ee711df5538e5f1b9970bc;
    stim[14] = 128'ha4b4c23f80232ba106d7583549e5f0bc;
    stim[15] = 128'hb53b59c02b68743cfde1bc6b7a9b2bdc;
    stim[16] = 128'he88c935f154c373811093c93253bf48b;
    stim[17] = 128'h4090ee4047f665c6abf1b35ec1e0b978;
    stim[18] = 128'h672147695f451e477afa117398757b84;
    stim[19] = 128'hc524754dc7e128a9726c88c97fd86109;
    stim[20] = 128'hc34e611be3b394db38cd3afd05d33f14;
    stim[21] = 128'h7537e1cf562c9593ac035f34088c0861;
    stim[22] = 128'h0770ea7ab8dd0b9d9f7a207dd37a6208;
    stim[23] = 128'h47bd85f7355d37b20f8f2f26d61df5a0;
    stim[24] = 128'hfc2d05307d93fb33f27df159832b719e;
    stim[25] = 128'h14712c3d16afc7bac8929f91dd68238d;
    stim[26] = 128'h5383d663a1ad54a054aa2016103e50d8;
    stim[27] = 128'ha52b1bcfb4d3768ac9ce80b0cfd8f55f;
    stim[28] = 128'hed64c2833d3aa8ee1e7039c8bbf8acf5;
    stim[29] = 128'h4a5b71ba87452ac08a39525cea9b1031;
    stim[30] = 128'hc33f599978df9ef2aaa63b0581272a92;
    stim[31] = 128'h2116b611c5b1dc096f244fe67f36b9a4;
    stim[32] = 128'hac6cb6663c80cf7763dd7a082dc4204b;
    stim[33] = 128'he8fb09979416bac8b4daec272cfc69db;
    stim[34] = 128'h511e4c6a79c0792d3f1301c924df8778;
    stim[35] = 128'hc0ccbd4d47ff13f0a4c1d984a9d191c4;
    stim[36] = 128'h820747be051db78f86cce95e4597f103;
    stim[37] = 128'h46a6e5149aa5b2fc971962d4dbcbb2d0;
    stim[38] = 128'hb8026a358a24ec36d22b7105df0afd3d;
    stim[39] = 128'h7308e7d74bfee598393e020982a5028d;
    stim[40] = 128'h8b0a82f3cc4e5ad21ab2a5cb8ac0ac9d;
    stim[41] = 128'h7ccddff979b9a34ea0b7e963da4d3f64;
    stim[42] = 128'he96e92539f7dc55f99d0593b09505569;
    stim[43] = 128'hce13115bb3f7541b08e688f38079343f;
    stim[44] = 128'h308d5843b65b210f7159778ffd5e30c8;
    stim[45] = 128'h63a31263638bb9ceced0e8083a125c3d;
    stim[46] = 128'hf090d3a10d914758a2b77f26316f7ec1;
    stim[47] = 128'h91051c05afe9ea6404deb603f74769e6;
    stim[48] = 128'h296f105082c74368ba7fd52fe23fa9fb;
    stim[49] = 128'haf0bdae97edde65521846792ce2dac62;
    stim[50] = 128'h7267fc2f9568ab632aadc08cc1b57ae2;
    stim[51] = 128'hcb65bc1d2055556cbcc277e3a8ba540e;
    stim[52] = 128'h088922789c15afd560b14a73a85ff96d;
    stim[53] = 128'hcca39a042aa7ebb5db87319d391f75c9;
    stim[54] = 128'h861a833db8bccabe8c9a19235855fa96;
    stim[55] = 128'h17c034bbd43aba957b2422fd360fed5f;
    stim[56] = 128'hdeab11ab405a4448e7cf519fe984bd2c;
    stim[57] = 128'h04ae9261e378b6eafa76cfbfbd242e49;
    stim[58] = 128'h851cb278e708f9bda69fa6c67adcbba2;
    stim[59] = 128'hf977ccdf6d9d2cf491033e69acaa5fa6;
    stim[60] = 128'h88b68a656f48c19d314dc39368d45587;
    stim[61] = 128'hd3bcac3c8a98471070c6a989d98c7319;
    stim[62] = 128'ha1b4c25a0a906fb51f8eb40bf9c23862;
    stim[63] = 128'h7bc77f7404eb32343ab5bdf311f489a1;
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
      expv[0] = 128'h4c773d1bfb66f3fd5a08d32da2559769;
      expv[1] = 128'h5966ec4269ea99b038bd935cd9552798;
      expv[2] = 128'hf1b6f9dfbfb6c253bda14d7cfce4e86d;
      expv[3] = 128'hcc7a9c0ac537439c6383fe1af1ca2971;
      expv[4] = 128'hb7670f9d58e1e9e684a592172b749496;
      expv[5] = 128'h95cadc89107a2b3153fd62f24b3535be;
      expv[6] = 128'h04afc698cfa7efc753877088f050d505;
      expv[7] = 128'h28b6d9973bdc694cd8b4e27edd02dc8a;
      expv[8] = 128'h0d527476ac34fd247b9a94fe1569725f;
      expv[9] = 128'h8cf3b30ddd175d9eb924632064ecee91;
      expv[10] = 128'h2995db10cf43d82d9dff43f0229515a0;
      expv[11] = 128'h8376049db0a48b7d73f3c620b16f5648;
      expv[12] = 128'h8d3bd95770bf58182fb4af4d0f905202;
      expv[13] = 128'h5a998e1d061d705ff5eeb9bc1b5371d9;
      expv[14] = 128'ha4e558a180b4f0350623c2bc49d72b3f;
      expv[15] = 128'hb59bbc3c2b3b2b6bfd6859dc7ae174c0;
      expv[16] = 128'he83b3c38158cf493114c938b2509375f;
      expv[17] = 128'h40e0b3c64790b95eabf6ee78c1f16540;
      expv[18] = 128'h677511475f217b737a45478498fa1e69;
      expv[19] = 128'hc5d888a9c72461c972e175097f6c284d;
      expv[20] = 128'hc3d33adbe34e3ffd38b3611405cd941b;
      expv[21] = 128'h758c5f9356370834ac2ce161080395cf;
      expv[22] = 128'h077a209db870627d9fddea08d37a0b7a;
      expv[23] = 128'h471d2fb235bdf5260f5d85a0d68f37f7;
      expv[24] = 128'hfc2bf1337d2d7159f293059e837dfb30;
      expv[25] = 128'h14689fba16712391c8af2c8ddd92c73d;
      expv[26] = 128'h533e20a0a183501654add6d810aa5463;
      expv[27] = 128'ha5d8808ab42bf5b0c9d31b5fcfce76cf;
      expv[28] = 128'hedf839ee3d64acc81e3ac2f5bb70a883;
      expv[29] = 128'h4a9b52c0875b105c8a457131ea392aba;
      expv[30] = 128'hc3273bf2783f2a05aadf599281a69e99;
      expv[31] = 128'h21364f09c516b9e66fb1b6a47f24dc11;
      expv[32] = 128'hacc47a773c6c20086380b64b2dddcf66;
      expv[33] = 128'he8fcecc894fb6927b41609db2cdaba97;
      expv[34] = 128'h51df012d791e87c93fc04c782413796a;
      expv[35] = 128'hc0d1d9f047cc9184a4ffbdc4a9c1134d;
      expv[36] = 128'h8297e98f0507f15e861d470345ccb7be;
      expv[37] = 128'h46cb62fc9aa6b2d497a5e5d0db19b214;
      expv[38] = 128'hb80a71368a02fd05d2246a3ddf2bec35;
      expv[39] = 128'h73a502984b08020939fee78d823ee5d7;
      expv[40] = 128'h8bc0a5d2cc0aaccb1a4e829d8ab25af3;
      expv[41] = 128'h7c4de94e79cd3f63a0b9df64dab7a3f9;
      expv[42] = 128'he950595f9f6e553b997d926909d0c553;
      expv[43] = 128'hce79881bb31334f308f7113f80e6545b;
      expv[44] = 128'h305e770fb68d308f715b58c8fd592143;
      expv[45] = 128'h6312e8ce63a35c08ce8b123d3ad0b963;
      expv[46] = 128'hf06f7f580d907e26a291d3c131b747a1;
      expv[47] = 128'h9147b664af05690304e91ce6f7deea05;
      expv[48] = 128'h293fd568826fa92fbac710fbe27f4350;
      expv[49] = 128'haf2d67557e0bac9221ddda62ce84e6e9;
      expv[50] = 128'h72b5c06395677a8c2a68fce2c1adab2f;
      expv[51] = 128'hcbba776c206554e3bc55bc0ea8c2551d;
      expv[52] = 128'h085f4ad59c89f9736015226da8b1af78;
      expv[53] = 128'hcc1f31b52aa3759ddba79ac93987eb04;
      expv[54] = 128'h865519beb81afa238cbc8396589aca3d;
      expv[55] = 128'h170f2295d4c0edfd7b3a345f3624babb;
      expv[56] = 128'hde84514840abbd9fe75a112ce9cf44ab;
      expv[57] = 128'h0424cfeae3ae2ebffa789249bd76b661;
      expv[58] = 128'h85dca6bde71cbbc6a608b2a27a9ff978;
      expv[59] = 128'hf9aa3ef46d775f69919dcca6ac032cdf;
      expv[60] = 128'h88d4c39d6fb6559331488a87684dc165;
      expv[61] = 128'hd38ca9108abc73897098ac19d9c6473c;
      expv[62] = 128'ha1c2b4b50ab4380b1f90c262f98e6f5a;
      expv[63] = 128'h7bf4bd3404c789f33aeb7fa111b53274;
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
