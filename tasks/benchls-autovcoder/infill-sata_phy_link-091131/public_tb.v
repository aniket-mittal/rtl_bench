// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_091131 dut (
    .clk_75m(clk),
    .host_rst(in_vec[70:70]),
    .cs2phy_data(in_vec[69:38]),
    .link_up(in_vec[37:37]),
    .fsm2phy_k(in_vec[36:36]),
    .rxdata_fis(in_vec[35:4]),
    .rxcharisk(in_vec[3:0]),
    .phy2cs_data(out_vec[65:34]),
    .phy2cs_k(out_vec[33:33]),
    .txdata_fis(out_vec[32:1]),
    .tx_charisk_fis(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h65a7030c26fffe0452;
    stim[1] = 71'h59ffbcfc834d90a38a;
    stim[2] = 71'h30d754f1eb553b3d32;
    stim[3] = 71'h397448dc6366f3b073;
    stim[4] = 71'h3afe804c4b6dc51f9a;
    stim[5] = 71'h029c952f4838baa3a5;
    stim[6] = 71'h18c4d1490d4835a46c;
    stim[7] = 71'h311e3ae4e813b88a5a;
    stim[8] = 71'h15a46eb4c2fe2f8a7e;
    stim[9] = 71'h327b6200ab76c67a91;
    stim[10] = 71'h316ff3634152a4d0ed;
    stim[11] = 71'h08591527c3744fc697;
    stim[12] = 71'h16466efebe1d38da94;
    stim[13] = 71'h013b707682ce4622f9;
    stim[14] = 71'h103fd4661976543a1a;
    stim[15] = 71'h3ad30cb1446e76bc34;
    stim[16] = 71'h3a0cad0b6e5eccd463;
    stim[17] = 71'h376df000280085de10;
    stim[18] = 71'h26f45306b3a7c9e4d9;
    stim[19] = 71'h1828635e405a97d780;
    stim[20] = 71'h37d510d0d2cdbc8445;
    stim[21] = 71'h080bcc1fd76b7f3e68;
    stim[22] = 71'h30f44be8be7b136f21;
    stim[23] = 71'h3c614771defe2a7a2f;
    stim[24] = 71'h1f18cd36f4edf51637;
    stim[25] = 71'h3fb7ec64f67fee13a4;
    stim[26] = 71'h0ada83a56dc5c89f62;
    stim[27] = 71'h1fdd11c186e940555a;
    stim[28] = 71'h2749f430e86a7cd94d;
    stim[29] = 71'h0a08c441c50a8a4e55;
    stim[30] = 71'h2fd8b90d029c6596a6;
    stim[31] = 71'h37720850233586dc5b;
    stim[32] = 71'h12bda2a7cd159c9a72;
    stim[33] = 71'h3c51133dbe169449b0;
    stim[34] = 71'h3810db9e073bd71121;
    stim[35] = 71'h39a560dd161d777581;
    stim[36] = 71'h30b2e02b766cd1bb2c;
    stim[37] = 71'h3c0b434a1d9fe4564c;
    stim[38] = 71'h6c1c81b88eb35a1308;
    stim[39] = 71'h1900f183d590d466e7;
    stim[40] = 71'h3560aeb65bdde328c3;
    stim[41] = 71'h0de0ff5ba2d60c44bc;
    stim[42] = 71'h12f703724c716d2bff;
    stim[43] = 71'h39a4b97f3656089870;
    stim[44] = 71'h12fbe0fcb65ae9611a;
    stim[45] = 71'h3c7d44f950a0ce0c90;
    stim[46] = 71'h1c9903320e2711e5ec;
    stim[47] = 71'h2d079c03e2176d9a6a;
    stim[48] = 71'h3d766206c144205555;
    stim[49] = 71'h345d6511e88d9a1ac3;
    stim[50] = 71'h2b72829c10636be933;
    stim[51] = 71'h21025a75583af0b757;
    stim[52] = 71'h1ac681fdfd9b87ed38;
    stim[53] = 71'h1ea65d7aa9f2fddc67;
    stim[54] = 71'h33d4a2dcc42a6fcc25;
    stim[55] = 71'h373db810dbcea30a3b;
    stim[56] = 71'h1618f537ac2435579f;
    stim[57] = 71'h35f76cbb1cb0e8082e;
    stim[58] = 71'h0dc3d4722e94c788d1;
    stim[59] = 71'h3eaab634856747dc4c;
    stim[60] = 71'h2710ef27f5cbebe216;
    stim[61] = 71'h00416b05008ec341b2;
    stim[62] = 71'h185d8fc8536b7fa8ab;
    stim[63] = 71'h2b5e575799cbb3206a;
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
      expv[0] = 66'hxxxxxxxxx2d381860;
      expv[1] = 66'h2d6d655fxcffde7e4;
      expv[2] = 66'h2d6d655f186baa78e;
      expv[3] = 66'h34c000001cba246e2;
      expv[4] = 66'h01ed54ecfd7f40262;
      expv[5] = 66'h2d6d655f014e4a97a;
      expv[6] = 66'h2d6d655f0c6268a48;
      expv[7] = 66'h2d6d655f188f1d726;
      expv[8] = 66'h2d6d655f0ad2375a6;
      expv[9] = 66'h2d6d655f193db1004;
      expv[10] = 66'h2ddb19ea78b7f9b1a;
      expv[11] = 66'h2d6d655f042c8a93e;
      expv[12] = 66'h2d6d655f0b23377f5;
      expv[13] = 66'h236a4000009db83b4;
      expv[14] = 66'h2d6d655f081fea331;
      expv[15] = 66'h2d6d655f1d698658a;
      expv[16] = 66'h2d6d655f1d065685a;
      expv[17] = 66'h2d6d655f3bb6f8000;
      expv[18] = 66'h2d6d655f337a29835;
      expv[19] = 66'h2d6d655f2c1431af2;
      expv[20] = 66'h2d6d655f1bea88687;
      expv[21] = 66'h2d6d655f0405e60ff;
      expv[22] = 66'h2d6d655f187a25f45;
      expv[23] = 66'h39ec4dbcbe30a3b8f;
      expv[24] = 66'h2d6d655f0f8c669b7;
      expv[25] = 66'h2d6d655f3fdbf6327;
      expv[26] = 66'h384e8000256d41d2a;
      expv[27] = 66'h3d99ffb86fee88e0c;
      expv[28] = 66'h2d6d655f13a4fa186;
      expv[29] = 66'h2d6d655f25046220e;
      expv[30] = 66'h2d6d655f17ec5c868;
      expv[31] = 66'h2d6d655f1bb904280;
      expv[32] = 66'h2d6d655f295ed153e;
      expv[33] = 66'h2d6d655f1e28899ed;
      expv[34] = 66'h2d6d655f1c086dcf0;
      expv[35] = 66'h2d6d655f1cd2b06e9;
      expv[36] = 66'h2d6d655f18597015b;
      expv[37] = 66'h2d6d655f1e05a1a51;
      expv[38] = 66'h2d6d655f160e40dc4;
      expv[39] = 66'h2d6d655f0c8078c1f;
      expv[40] = 66'h2d6d655f1ab0575b3;
      expv[41] = 66'h2d6d655f06f07fadc;
      expv[42] = 66'h2d6d655f097b81b92;
      expv[43] = 66'h2d6d655f1cd25cbf9;
      expv[44] = 66'h2d6d655f097df07e5;
      expv[45] = 66'h2d6d655f1e3ea27cb;
      expv[46] = 66'h2d6d655f0e4c81990;
      expv[47] = 66'h2d6d655f1683ce01e;
      expv[48] = 66'h2d6d655f1ebb31036;
      expv[49] = 66'h2d6d655f1a2eb288e;
      expv[50] = 66'h2d6d655f35b9414e1;
      expv[51] = 66'h2d6d655f10812d3ab;
      expv[52] = 66'h2d6d655f0d6340fef;
      expv[53] = 66'h2e1fb4c00f532ebd4;
      expv[54] = 66'h0bf771b679ea516e6;
      expv[55] = 66'h2d6d655f1b9edc087;
      expv[56] = 66'h2d6d655f0b0c7a9bc;
      expv[57] = 66'h2d6d655f3afbb65d9;
      expv[58] = 66'h2d6d655f06e1ea390;
      expv[59] = 66'h3a531e237f555b1a4;
      expv[60] = 66'h2d6d655f13887793f;
      expv[61] = 66'h2d6d655f0020b5828;
      expv[62] = 66'h2d6d655f0c2ec7e43;
      expv[63] = 66'h2d6d655f15af2babd;
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
