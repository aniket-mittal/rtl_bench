// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 144;
  localparam OW = 131;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_033349 dut (
    .pll_core_cpuclk(clk),
    .hburst_s3(in_vec[143:141]),
    .hmastlock(in_vec[140:140]),
    .hprot_s3(in_vec[139:136]),
    .hsel_s3(in_vec[135:135]),
    .hsize_s3(in_vec[134:132]),
    .htrans_s3(in_vec[131:130]),
    .hwdata_s3(in_vec[129:2]),
    .hwrite_s3(in_vec[1:1]),
    .pad_cpu_rst_b(in_vec[0:0]),
    .hrdata_s3(out_vec[130:3]),
    .hready_s3(out_vec[2:2]),
    .hresp_s3(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 144'h0f384832efc9171407e5ba1f1c6bb036fdce;
    stim[1] = 144'hd61135bff70084830761aab0d1641cd3f742;
    stim[2] = 144'h2b7f63409817f51ab0797960245079d040d5;
    stim[3] = 144'he3aca223e82bb5ed3639c6a0b5ad17edf9e9;
    stim[4] = 144'h941e58a61efbceb1c3ab7f4772ef1729208b;
    stim[5] = 144'h57ff6e2429de4bfb525e8be5ac3224b13f29;
    stim[6] = 144'h4d04c97e1ad9ab68d52a647f8f694472785f;
    stim[7] = 144'he0d9282931d8671085e5935103a4ad55a6a5;
    stim[8] = 144'h682305a4cf9275974273ebf0fa2b7e1651e3;
    stim[9] = 144'hb7b7f414b53af1ec65f2c7772cd97017ddf9;
    stim[10] = 144'h58b245cca2196b8bf61eebe3bed7647852a9;
    stim[11] = 144'h1aed87e1d09e66d4691cae1b426983204b93;
    stim[12] = 144'hde43e2a1647dd834cc09308ffd99b7cff501;
    stim[13] = 144'h2bebcd3a2328e5ac2f4e6fd7b67bc3b2bd31;
    stim[14] = 144'h63c2c8fc423344a67b06d3ac11d6ba540b5d;
    stim[15] = 144'h1da809a4db110e03a596b7c0b4ce4653dcd1;
    stim[16] = 144'h95d2b058c2fee0c1d316ce2eecdcf38a78ad;
    stim[17] = 144'h6f3581f6217a0935802b62864dbe8f11731f;
    stim[18] = 144'hf720073f5fa7d002646249790765da1b7829;
    stim[19] = 144'h87562401e3ee832749e4f5f9d971b7a60685;
    stim[20] = 144'hc40b72b826f5b6a940f20b861ce18fbbb99d;
    stim[21] = 144'hf5cbdee99e4aefb1e4d322abd0bcf0f363f7;
    stim[22] = 144'h497532a3d8f4f1db52839fee7463e6a93b93;
    stim[23] = 144'hf198f4a7b376fa7d6710b738a55affe5a84d;
    stim[24] = 144'he0c837d8f3f29e4541f546f0ac08108924cb;
    stim[25] = 144'hcd8fba6b039c59e4657c0edd87bc30df4b37;
    stim[26] = 144'h3f189443dd333d71b2030d962627206e2899;
    stim[27] = 144'h3022f7df687d4bf8ffc09496da2c0e1876df;
    stim[28] = 144'h69a9d3fe1d3328474b8e8acdc661f981d0f7;
    stim[29] = 144'h3a5c404ad7809dc67330f9b086eff77b0b39;
    stim[30] = 144'h2211a96ed6d28e3cead939caab2e9f4432b9;
    stim[31] = 144'hdce1c6c93af0f380a1b3abbd5a333280552d;
    stim[32] = 144'hde28acc802695d98ed9ed1a9e0841900e645;
    stim[33] = 144'h7ff48e8485e7f4631274f485d76788c3e0a3;
    stim[34] = 144'h82f7a6eaf76bee1287d923809c02a4529d4f;
    stim[35] = 144'h1f26a10a413edfabe36d3deefbb8ec7fb047;
    stim[36] = 144'hfbfcaac992f52964eb215bca9a3087112f2b;
    stim[37] = 144'hc566df115daa4561705a449ca4b42372aa4d;
    stim[38] = 144'hb7686416c6a60d352c5c838dc86049402167;
    stim[39] = 144'h8c50ea78f93ca2912feb2d8bb9d876bfe2d7;
    stim[40] = 144'h2ce88077b60c267ba116f3b00801d2db8c21;
    stim[41] = 144'h97aca686d0fd3ed87f2b0966722703642593;
    stim[42] = 144'h273264c9455e2f026c36856620dfb21e4ab7;
    stim[43] = 144'hdda1da9ad18e22bc5e9426d68d08aab012cd;
    stim[44] = 144'h7ad11eb9e515cdf8eaeb8ffb4df9f425bd6d;
    stim[45] = 144'hdb4ac0d7966d74a3ba527d88a9cfab628d79;
    stim[46] = 144'hf5420637a90571c9894d17d5961313140f25;
    stim[47] = 144'h5b55bef95fa8ffd3126d2e911560c1f872c1;
    stim[48] = 144'h375af12f654f314885c457a2252711dbd6a7;
    stim[49] = 144'hb9bb1b7e72af445a7ce743fe128bbbc492d7;
    stim[50] = 144'h3d9462b1d3ca1bb300aeb623df7b88832541;
    stim[51] = 144'ha427d0b3a1f183c804640afe61c0f2bbea4b;
    stim[52] = 144'h89eb5a2c743ec49c480be11c10eba7c59e57;
    stim[53] = 144'h5f3e5903c59ed0e4d2553c8e03e813fd1af1;
    stim[54] = 144'h8c117ac8bb26a99f1543cce82924800b85c5;
    stim[55] = 144'hc9e309e2151176a187bbc2ea56076186aa26;
    stim[56] = 144'h05155f8dcbb10094c8bb13634c4ee9786837;
    stim[57] = 144'h6a2fcf7dbfff1cb906a3b2ba362b72620909;
    stim[58] = 144'hd454d992152e2172719adb6c793dc8029af5;
    stim[59] = 144'h6756bc948945f3e77f54da1682c8d461dbb5;
    stim[60] = 144'ha4491819ee9c9ba89e05ea420e864f051a15;
    stim[61] = 144'h25a33783caf529d0e42962e7e100a80e4bc5;
    stim[62] = 144'hd9d181de66099df805c4844ce2bd4d5c1477;
    stim[63] = 144'h9ec8715b4699e38b6169e20651f2e7c08783;
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
      expv[0] = 131'h000000000000000000000000000000001;
      expv[1] = 131'h000000000000000000000000000000001;
      expv[2] = 131'h000000000000000000000000000000001;
      expv[3] = 131'h000000000000000000000000000000005;
      expv[4] = 131'h000000000000000000000000000000001;
      expv[5] = 131'h000000000000000000000000000000005;
      expv[6] = 131'h000000000000000000000000000000001;
      expv[7] = 131'h000000000000000000000000000000005;
      expv[8] = 131'h000000000000000000000000000000001;
      expv[9] = 131'h000000000000000000000000000000005;
      expv[10] = 131'h000000000000000000000000000000001;
      expv[11] = 131'h000000000000000000000000000000001;
      expv[12] = 131'h000000000000000000000000000000001;
      expv[13] = 131'h000000000000000000000000000000005;
      expv[14] = 131'h000000000000000000000000000000001;
      expv[15] = 131'h000000000000000000000000000000001;
      expv[16] = 131'h000000000000000000000000000000001;
      expv[17] = 131'h000000000000000000000000000000001;
      expv[18] = 131'h000000000000000000000000000000005;
      expv[19] = 131'h000000000000000000000000000000005;
      expv[20] = 131'h000000000000000000000000000000005;
      expv[21] = 131'h000000000000000000000000000000005;
      expv[22] = 131'h000000000000000000000000000000001;
      expv[23] = 131'h000000000000000000000000000000005;
      expv[24] = 131'h000000000000000000000000000000001;
      expv[25] = 131'h000000000000000000000000000000001;
      expv[26] = 131'h000000000000000000000000000000001;
      expv[27] = 131'h000000000000000000000000000000005;
      expv[28] = 131'h000000000000000000000000000000005;
      expv[29] = 131'h000000000000000000000000000000001;
      expv[30] = 131'h000000000000000000000000000000005;
      expv[31] = 131'h000000000000000000000000000000005;
      expv[32] = 131'h000000000000000000000000000000001;
      expv[33] = 131'h000000000000000000000000000000005;
      expv[34] = 131'h000000000000000000000000000000001;
      expv[35] = 131'h000000000000000000000000000000001;
      expv[36] = 131'h000000000000000000000000000000005;
      expv[37] = 131'h000000000000000000000000000000001;
      expv[38] = 131'h000000000000000000000000000000005;
      expv[39] = 131'h000000000000000000000000000000005;
      expv[40] = 131'h000000000000000000000000000000005;
      expv[41] = 131'h000000000000000000000000000000001;
      expv[42] = 131'h000000000000000000000000000000001;
      expv[43] = 131'h000000000000000000000000000000005;
      expv[44] = 131'h000000000000000000000000000000001;
      expv[45] = 131'h000000000000000000000000000000001;
      expv[46] = 131'h000000000000000000000000000000005;
      expv[47] = 131'h000000000000000000000000000000005;
      expv[48] = 131'h000000000000000000000000000000005;
      expv[49] = 131'h000000000000000000000000000000005;
      expv[50] = 131'h000000000000000000000000000000001;
      expv[51] = 131'h000000000000000000000000000000001;
      expv[52] = 131'h000000000000000000000000000000005;
      expv[53] = 131'h000000000000000000000000000000001;
      expv[54] = 131'h000000000000000000000000000000005;
      expv[55] = 131'h000000000000000000000000000000001;
      expv[56] = 131'h000000000000000000000000000000001;
      expv[57] = 131'h000000000000000000000000000000005;
      expv[58] = 131'h000000000000000000000000000000005;
      expv[59] = 131'h000000000000000000000000000000005;
      expv[60] = 131'h000000000000000000000000000000005;
      expv[61] = 131'h000000000000000000000000000000005;
      expv[62] = 131'h000000000000000000000000000000001;
      expv[63] = 131'h000000000000000000000000000000001;
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
