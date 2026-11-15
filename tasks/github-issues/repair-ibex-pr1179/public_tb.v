// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 237;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_pmp dut (
    .clk_i(clk),
    .rst_ni(in_vec[236:236]),
    .csr_pmp_cfg_i(in_vec[235:212]),
    .csr_pmp_addr_i(in_vec[211:76]),
    .priv_mode_i(in_vec[75:72]),
    .pmp_req_addr_i(in_vec[71:4]),
    .pmp_req_type_i(in_vec[3:0]),
    .pmp_req_err_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 237'h096b55177ba28b6c2ac662af247dc45321c5fcad810628bab48f97516754;
    stim[1] = 237'h05ae47feaf17623db382eb3c3f4e9203db76c12e644db3fbd235dd0ab99b;
    stim[2] = 237'h16149e94666702d1d8b44be1fbed637be685a8b4220ed6f2feefe0fde43e;
    stim[3] = 237'h104f20e8c3cc5451f09d594e11377089c12570f2ef1e8c56f96022186f47;
    stim[4] = 237'h1b3bef2d1613e00e95b3b0cbba4199abb51cff4ff2cdb02ca0f2c82c0051;
    stim[5] = 237'h18166bcafa105f775948f51a144695c3589bf649ac8e05d53862d1fe7cfd;
    stim[6] = 237'h132e2d993b00659ed6e1536b99b9e0b1d9f4e6ecd4fa79b06123fca40739;
    stim[7] = 237'h1c3853101236bfe9b06be61051c1404a959a0213199c48abed9b414a75ba;
    stim[8] = 237'h147ce05c12e862a03fae5c82b39daa2d2e0ea466e4a0a4282765fdb6b182;
    stim[9] = 237'h1eec625f7296fbc5c9665b4dd0470d1135534232a6541c0141a8629e0ad9;
    stim[10] = 237'h1dbd271e01ef5df1f003b9f613af054589b3cb0fecf4b8352c6d9c55fe47;
    stim[11] = 237'h14acc1ab3a26bb853bfcadc240c23e2800b62f5da4c1ba860945749651ce;
    stim[12] = 237'h157cb803807e9ccdf6c9f3adaef9de14c79cab63f0f31e419698668e80ca;
    stim[13] = 237'h1d7daf3a98881f442183b3735639cd3248b375259841ad4f8893af1bc3a6;
    stim[14] = 237'h1bbf13c35816b6a6e38b9e42695257a8475a60465b6864c215f1dc04bb10;
    stim[15] = 237'h1c2d85f0a1cb90a09a8affacb61f64e2e3fea64f86f5a4afb08e93629f69;
    stim[16] = 237'h16351e66137052c814714d7edda636530d46186bd0d4fc9617997b74620b;
    stim[17] = 237'h16e2178b12be69d21f5f2dc9710bc28480e1d9fed11004aec749e5a392b4;
    stim[18] = 237'h1eec2e6f89f9955923144afed8879d47414faa1f859b82cff314907dfe4c;
    stim[19] = 237'h115c93eb9fcee6b3c95c3921b13938ac48957b435e0679a7e24b174a23ee;
    stim[20] = 237'h1e7f9e01a1f9dfe05a96d38b3c8aeb97668aafc00f763e70e2a086e066b1;
    stim[21] = 237'h15529f6bf0ed0ae2863f88abc9aafbf194eaf90e106757b8c0684cd5b36c;
    stim[22] = 237'h1c5bdb01cd89528747ab627e846591a28646dfd2851af5a1784fda8889ce;
    stim[23] = 237'h1285436d398d937830f9b38d3ade17a9876bc30bad959eccef17c482408d;
    stim[24] = 237'h16a40855841c219dba9f62764b4a16c279a16bd18a1c01b0eba835007b92;
    stim[25] = 237'h1202514436931528adfb506e5a0af519788db9df2502c922cdf9b5899b01;
    stim[26] = 237'h168fb4b6daa3755b51302588d7747db11f916c3c6e00744d63bc50e9a8dc;
    stim[27] = 237'h139ad207969187ae64d0843153d19eb9e49769f619badc7243cc66b596be;
    stim[28] = 237'h11ad0ec608f4b9394406191d6b01814b35a5f61cfcac7e9e181ddcd8b43d;
    stim[29] = 237'h17df2a270313b393114cfdc28e0bddcda658acecd92b77ede070277766df;
    stim[30] = 237'h149652599cbbef407002e03920f7f0edf087c7b41766fadad53e6c4a2ab1;
    stim[31] = 237'h0109e7c3f00daad181257534b2ad048c7afe19ad4298b6a3a13aa4acffd6;
    stim[32] = 237'h12426ddb09c2c4776d5751909135c8cb2807d517da3ab47d1e12d1d69963;
    stim[33] = 237'h147ba6591a82e382d0dd18b436bf01374845325ccc688f4218a9b5e45e45;
    stim[34] = 237'h1e1477483a491c2631695729c5dc4cb8c101acf8a4bbb73227255f667ddf;
    stim[35] = 237'h19966480593a3357fac3269d20e30a64e19d5a1146eade8d4cdc64dd8766;
    stim[36] = 237'h11949d9c549948c5e05fc74c91b355424f6ce21db2610fe7eee5ce812e9c;
    stim[37] = 237'h181dd8c2578aeef0352249f0248639c7653ac7b601a8d3a9233ba9903222;
    stim[38] = 237'h19dc958ea4b2587dbc9ee88f6130a0db5056f5537550d82e57cacb2cf1c9;
    stim[39] = 237'h187b91bca3fbf9914a9d5ab0bfe810676f81b25689007a274fca3906e4ed;
    stim[40] = 237'h166a73be8794f66c10f7ab9dea945e68ff0ee43ec6bcd6402b949e34dea3;
    stim[41] = 237'h1a2480de6a680dc9868598672b433a44226f41df49491a5cee2c1721a702;
    stim[42] = 237'h15c14e50220999ad86323b9853215b5c66154100518b59529040ac2fbada;
    stim[43] = 237'h1eba6182a5cd938b45d517d73c8138a6cfd9ad433914d0195ad2e58dc9d3;
    stim[44] = 237'h1a5106cdb7167ec7ae10dcb7114a58fffdeeda983756724974e15e8cadd6;
    stim[45] = 237'h18d3cf4503e45e571c848bbbb4d7a3d48f18e9321305a3352acbeb9057e8;
    stim[46] = 237'h1ca3026b71f7f3697ba3a5f9540a84ac9d01a6d5a9574c8e7a17b519ecac;
    stim[47] = 237'h1c4aa4e071b6fb13e35eb698c55442eb5a6bb64312adde9d19d54e213e49;
    stim[48] = 237'h1c45d78cf4646cc431bd90e71de23808f4165e4f21e0960dc3f28358bf01;
    stim[49] = 237'h1b67c6ffa87348e144212a030f214ade83ad22c774494bcec255071d9883;
    stim[50] = 237'h1dd029deb9a721037bdf3e7294d3b80ea596914e6a6917d7c82c9d664fe8;
    stim[51] = 237'h1b793873fe25c074c8cf2e1e36f70f682e74a594c20b8dbaa6bef9ec631a;
    stim[52] = 237'h16390bb0ae1d7048398868d6b59444fbd54728d2cfdacd3cc778c103e8bd;
    stim[53] = 237'h1492f45ef042e35dfbddc2d2d5339205a1508e0eb443dbeb55efeded2570;
    stim[54] = 237'h1b6904920a4ca17778aa8347d0bd6d23daec73b1d21026669f473d699841;
    stim[55] = 237'h18dcab45626878a9cb03eab765b2ccdcecb963e07bf19f487d1a77bb3c65;
    stim[56] = 237'h15b50d8a6d6ce866c0f1a1b287c1daa69666b559d0c438b7e2b73eb7e677;
    stim[57] = 237'h176ccac28eb8a93585b36508bcbf8910ec6fb0d6da82b727f43f1d98c5db;
    stim[58] = 237'h1bbd6c305a0668b46155b27785dc7f13277a0ed3331db1f1d44d5e488a3a;
    stim[59] = 237'h1d0acf007d5899020c103d7e7e9676b8dc4a39e2e22285f2145bbdd0818e;
    stim[60] = 237'h19a0b6fb7ae04e098fd7243cfc82948bfff960b5864f3672a06aef35b286;
    stim[61] = 237'h118f1992cf136c3c1e02be4060de7915b6c027d85f8f3683c8518b0ea0a9;
    stim[62] = 237'h1b22f7b23942913ba21feca9ba76ef461b8128b6c1fd9ce5691bc91b100a;
    stim[63] = 237'h18e9e7c688cbc4ad6a825a6c56233b731230c530a0a99b6393cbf6eb1832;
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
      expv[0] = 2'h3;
      expv[1] = 2'h3;
      expv[2] = 2'h3;
      expv[3] = 2'h0;
      expv[4] = 2'h1;
      expv[5] = 2'h1;
      expv[6] = 2'h3;
      expv[7] = 2'h3;
      expv[8] = 2'h3;
      expv[9] = 2'h3;
      expv[10] = 2'h1;
      expv[11] = 2'h3;
      expv[12] = 2'h3;
      expv[13] = 2'h0;
      expv[14] = 2'h2;
      expv[15] = 2'h3;
      expv[16] = 2'h3;
      expv[17] = 2'h3;
      expv[18] = 2'h3;
      expv[19] = 2'h1;
      expv[20] = 2'h0;
      expv[21] = 2'h3;
      expv[22] = 2'h3;
      expv[23] = 2'h0;
      expv[24] = 2'h3;
      expv[25] = 2'h3;
      expv[26] = 2'h1;
      expv[27] = 2'h3;
      expv[28] = 2'h3;
      expv[29] = 2'h3;
      expv[30] = 2'h2;
      expv[31] = 2'h3;
      expv[32] = 2'h3;
      expv[33] = 2'h1;
      expv[34] = 2'h3;
      expv[35] = 2'h3;
      expv[36] = 2'h3;
      expv[37] = 2'h3;
      expv[38] = 2'h3;
      expv[39] = 2'h3;
      expv[40] = 2'h3;
      expv[41] = 2'h3;
      expv[42] = 2'h3;
      expv[43] = 2'h3;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h3;
      expv[47] = 2'h2;
      expv[48] = 2'h3;
      expv[49] = 2'h1;
      expv[50] = 2'h3;
      expv[51] = 2'h1;
      expv[52] = 2'h0;
      expv[53] = 2'h3;
      expv[54] = 2'h1;
      expv[55] = 2'h2;
      expv[56] = 2'h3;
      expv[57] = 2'h3;
      expv[58] = 2'h2;
      expv[59] = 2'h3;
      expv[60] = 2'h2;
      expv[61] = 2'h0;
      expv[62] = 2'h3;
      expv[63] = 2'h3;
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
