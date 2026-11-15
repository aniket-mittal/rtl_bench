// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 110;
  localparam OW = 119;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09583 dut (
    .clk(clk),
    .command_fifo_empty(in_vec[109:109]),
    .command_fifo_q(in_vec[108:5]),
    .m_read_waitrequest(in_vec[4:4]),
    .m_write_waitrequest(in_vec[3:3]),
    .read_go(in_vec[2:2]),
    .reset_n(in_vec[1:1]),
    .write_go(in_vec[0:0]),
    .command_fifo_rdreq(out_vec[118:118]),
    .read_command_data(out_vec[117:59]),
    .read_command_valid(out_vec[58:58]),
    .write_command_data(out_vec[57:1]),
    .write_command_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 110'h38e4de5bc9f53a481bd061963225;
    stim[1] = 110'h2a52ee023808a92e0a516cb58d10;
    stim[2] = 110'h3666cb64e8db211420904d8e32b6;
    stim[3] = 110'h154eac97e1e22458001036bb219a;
    stim[4] = 110'h2bfe2e0354ba174da7ee2d856522;
    stim[5] = 110'h361f63b982aaa859d8f254bfabd7;
    stim[6] = 110'h148e06d7993c997da72468163d9b;
    stim[7] = 110'h25b48190a12dfce2cccbc80501ea;
    stim[8] = 110'h1b948e492c4577b84a66f4c78277;
    stim[9] = 110'h344b08f0d4dbbd069a11d286df6b;
    stim[10] = 110'h17fd4046fb959a76d2f4d1e4204a;
    stim[11] = 110'h3c29d8c1dbd833cf1083f0ce81da;
    stim[12] = 110'h1b0c063b20170bc5cc0e33389a53;
    stim[13] = 110'h080cd6583ab8e08a373aeecb6cea;
    stim[14] = 110'h3155a9d508fac191e47b22e70dfa;
    stim[15] = 110'h1e2e5c3b8ffabbe27eb8175e0d33;
    stim[16] = 110'h17a238e51a83e68cabef478a115a;
    stim[17] = 110'h0865b9de2f7fe763b574b524bd9a;
    stim[18] = 110'h2adbe9e090d30f222ba68fecd1da;
    stim[19] = 110'h1cf0b4232479f096466d1546f937;
    stim[20] = 110'h0ff984b547d7a13986e5b09f8806;
    stim[21] = 110'h3602b8e70cb6550acf2850e94926;
    stim[22] = 110'h3b373b20fed1c148e1a9df3f3486;
    stim[23] = 110'h153443477d327fe2b9388b270f6a;
    stim[24] = 110'h333d302b5954c2140bde8fa8d313;
    stim[25] = 110'h2728d55010d55f14e982c66943e6;
    stim[26] = 110'h0cce1ac5d8abeeb031a1ced872a7;
    stim[27] = 110'h13158ecfecaf69e5f9e82e7b0fd3;
    stim[28] = 110'h0f9cd7d9b7f5ac73b8000df27ea2;
    stim[29] = 110'h1705a33f42d54813e4783834e017;
    stim[30] = 110'h3624f854689f254e597fe0726d16;
    stim[31] = 110'h2546e3d23574962ff6751b5c6dfb;
    stim[32] = 110'h27b21a824c0144521e0ecff9a797;
    stim[33] = 110'h39088ee32bb2a280210e7a08853b;
    stim[34] = 110'h1e7d7556e558adeaf1b204d2c663;
    stim[35] = 110'h348d19fc9fc16622ee13a629b207;
    stim[36] = 110'h0e3180eb93a9c9d0fb51160b019f;
    stim[37] = 110'h34186e05db85b923f6c619db3456;
    stim[38] = 110'h04e3bf575228d4066e38eff7f82a;
    stim[39] = 110'h02d138c28bb6c8527edfdbd637cf;
    stim[40] = 110'h115b269c6ef8a4d226d19ef38a6b;
    stim[41] = 110'h2b3b4cdc9fd76c9beaf2706ab907;
    stim[42] = 110'h2d52cb2d0024fd2bb784b2211b62;
    stim[43] = 110'h23a2004d0b3f30709f7148cec602;
    stim[44] = 110'h0ba2f3ac6cf73ae5fecb6e8ed0be;
    stim[45] = 110'h3b2d9302c99b5125c3b57da9e59f;
    stim[46] = 110'h0c114d0e83b145e55b14518ff1b2;
    stim[47] = 110'h0c40a13c8ef3770ee9036f7b161b;
    stim[48] = 110'h1f81a1137bd593c934bcd1dc44e3;
    stim[49] = 110'h32be0fcfc7c763d9c3b987e87fab;
    stim[50] = 110'h1893975342f85cad688e42281deb;
    stim[51] = 110'h33a19aea3df8e93d9514489dec7e;
    stim[52] = 110'h27d9882b9c3a86ac0e279513ddfe;
    stim[53] = 110'h18edf17261c4e35e730c7e098236;
    stim[54] = 110'h3440a8b1cac51a78356306e2e593;
    stim[55] = 110'h3815896a19a5d074e277024b4156;
    stim[56] = 110'h1b53e0b663d94a0986f7998f5506;
    stim[57] = 110'h15c2d045db2f42c8c3b58e49831e;
    stim[58] = 110'h20380c8c8b3bedd62ac6646e9f3e;
    stim[59] = 110'h266d9ce6700d2d2d030a6cd1886b;
    stim[60] = 110'h3c78d4ac25ceca4457a7791a5a53;
    stim[61] = 110'h1d30910d4ca89526de88a2e550fe;
    stim[62] = 110'h3ae84af97bde802930ebe44a28a2;
    stim[63] = 110'h007d55708acb68f30ca4eefa41de;
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
      expv[0] = 119'h000000000000000000000000000000;
      expv[1] = 119'h000000000000000000000000000000;
      expv[2] = 119'h000000000000000000000000000000;
      expv[3] = 119'h12d93a3413638caa6c4e8db2114208;
      expv[4] = 119'h0325f87c0daec862eb7e1e22458000;
      expv[5] = 119'h3380d52b8b615949e2354ba174da7e;
      expv[6] = 119'h08ee60ac952feaf3f7982aaa859d8e;
      expv[7] = 119'h29b5e6491a058f60e17993c997da72;
      expv[8] = 119'h3864284af2014079490a12dfce2ccc;
      expv[9] = 119'h2b924b11bd31e0994892c4577b84a6;
      expv[10] = 119'h023c353474a1b7dab10d4dbbd069a0;
      expv[11] = 119'h3011bee534790811d46fb959a76d2e;
      expv[12] = 119'h1e3076f0fc33a0729c1dbd833cf108;
      expv[13] = 119'h098ec8038cce2692c1b20170bc5cc0;
      expv[14] = 119'h0d960eaebbb2db3acd83ab8e08a372;
      expv[15] = 119'h0275423ec8b9c37b5b508fac191e46;
      expv[16] = 119'h1f0ee3fe05d7834ae5b8ffabbe27ea;
      expv[17] = 119'h3e3946a3d1e284502251a83e68cabe;
      expv[18] = 119'h16778bdd2d492f625be2f7fe763b56;
      expv[19] = 119'h22782431a3fb3471be090d30f222ba;
      expv[20] = 119'h3508c91b4551be490a32479f096466;
      expv[21] = 119'h312d51f16c27e20199547d7a13986e;
      expv[22] = 119'h0e39c32a143a524a2a70cb6550acf2;
      expv[23] = 119'h1ec83fb277cfcd23720fed1c148e1a;
      expv[24] = 119'h18d1df4e22c9c3db4477d327fe2b92;
      expv[25] = 119'h1c0ad657a3ea34c3d2b5954c2140bc;
      expv[26] = 119'h1d540430b19a50fa8d010d55f14e98;
      expv[27] = 119'h26b1762873b61ca8e05d8abeeb031a;
      expv[28] = 119'h0bb3fb2a0b9ec3f358fecaf69e5f9e;
      expv[29] = 119'h6df66df8037c9fa9cd9b7f5ac73b80;
      expv[30] = 119'h08cfd0b60e0d38025bf42d54813e46;
      expv[31] = 119'h1e151a27f81c9b464f4689f254e597;
      expv[32] = 119'h00f48d5d46d71b7a6f23574962ff66;
      expv[33] = 119'h3ea09303b3fe69e12024c0144521e0;
      expv[34] = 119'h0bb8caeb9e82214a8832bb2a280210;
      expv[35] = 119'h1555b9548134b19bd76e558adeaf1a;
      expv[36] = 119'h2e7f27f4e98a6c80d1c9fc16622ee0;
      expv[37] = 119'h183ae4ec4582c06318b93a9c9d0fb4;
      expv[38] = 119'h0b8176e18676cd13865db85b923f6c;
      expv[39] = 119'h37d5d48e3bfdfe083b75228d4066e2;
      expv[40] = 119'h2630a2eff6f58df11228bb6c8527ec;
      expv[41] = 119'h01a71bbc67bce29bb3c6ef8a4d226c;
      expv[42] = 119'h1b3727f49c1aae43b5c9fd76c9beae;
      expv[43] = 119'h02cb40092c8846db2cd0024fd2bb78;
      expv[44] = 119'h381342cc5233b18020d0b3f30709f6;
      expv[45] = 119'h3ceb1b3adba3b4282ec6cf73ae5fec;
      expv[46] = 119'h1cc0b2655f6a7962d82c99b5125c3a;
      expv[47] = 119'h0b43a0ed1463fc6b14e83b145e55b0;
      expv[48] = 119'h004f23b8dbdec5820bc8ef3770ee90;
      expv[49] = 119'h2844def7347711381b37bd593c934a;
      expv[50] = 119'h3bf3f1f661fa1fe9e0fc7c763d9c3a;
      expv[51] = 119'h2dd4d0bb908a077939342f85cad688;
      expv[52] = 119'h3eba8f7d12277b1818a3df8e93d950;
      expv[53] = 119'h220ae709e544f77998b9c3a86ac0e2;
      expv[54] = 119'h345c98731f826088df261c4e35e730;
      expv[55] = 119'h022c72b0c1b8b9620b1cac51a78356;
      expv[56] = 119'h0a5a866dc092d05358a19a5d074e26;
      expv[57] = 119'h002d98f5e663d5433f663d94a0986e;
      expv[58] = 119'h241176cd639260c02c5db2f42c8c3a;
      expv[59] = 119'h1b2322c9991ba7cb80c8b3bedd62ac;
      expv[60] = 119'h17399c029b34621ad86700d2d2d030;
      expv[61] = 119'h152b0971de4696938cc25ceca4457a;
      expv[62] = 119'h1c43532a28b9543b08d4ca89526de8;
      expv[63] = 119'h32be5ef2f9128a288597bde802930e;
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
