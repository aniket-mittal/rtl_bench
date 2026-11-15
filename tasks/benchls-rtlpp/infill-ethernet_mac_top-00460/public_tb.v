// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 88;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00460 dut (
    .clk(clk),
    .ff_tx_data(in_vec[96:65]),
    .ff_tx_eop(in_vec[64:64]),
    .ff_tx_err(in_vec[63:63]),
    .ff_tx_mod(in_vec[62:61]),
    .ff_tx_sop(in_vec[60:60]),
    .ff_tx_wren(in_vec[59:59]),
    .ff_tx_clk(in_vec[58:58]),
    .ff_rx_rdy(in_vec[57:57]),
    .ff_rx_clk(in_vec[56:56]),
    .address(in_vec[55:48]),
    .read(in_vec[47:47]),
    .writedata(in_vec[46:15]),
    .write(in_vec[14:14]),
    .reset(in_vec[13:13]),
    .m_rx_d(in_vec[12:9]),
    .m_rx_en(in_vec[8:8]),
    .m_rx_err(in_vec[7:7]),
    .tx_clk(in_vec[6:6]),
    .rx_clk(in_vec[5:5]),
    .set_10(in_vec[4:4]),
    .set_1000(in_vec[3:3]),
    .mdio_in(in_vec[2:2]),
    .m_rx_col(in_vec[1:1]),
    .m_rx_crs(in_vec[0:0]),
    .ff_tx_rdy(out_vec[87:87]),
    .ff_rx_data(out_vec[86:55]),
    .ff_rx_dval(out_vec[54:54]),
    .ff_rx_eop(out_vec[53:53]),
    .ff_rx_mod(out_vec[52:51]),
    .ff_rx_sop(out_vec[50:50]),
    .rx_err(out_vec[49:44]),
    .readdata(out_vec[43:12]),
    .waitrequest(out_vec[11:11]),
    .m_tx_d(out_vec[10:7]),
    .m_tx_en(out_vec[6:6]),
    .m_tx_err(out_vec[5:5]),
    .ena_10(out_vec[4:4]),
    .eth_mode(out_vec[3:3]),
    .mdio_out(out_vec[2:2]),
    .mdio_oen(out_vec[1:1]),
    .mdc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h1998b90ccc1b631f59e977c61;
    stim[1] = 97'h016edb4a91abe371812426308;
    stim[2] = 97'h0b6d8f93f7c49a658c585dbab;
    stim[3] = 97'h07e7f7129e88798994d935185;
    stim[4] = 97'h10088869b5ca0f2a18c0f24c4;
    stim[5] = 97'h1220cd6001661f7d6f6caccb0;
    stim[6] = 97'h138bf105518fad11d0069174e;
    stim[7] = 97'h0fe73296bd186000702130a0b;
    stim[8] = 97'h148509a779cfbc4a87fad4553;
    stim[9] = 97'h0dd75f0e47d9616e09caa1441;
    stim[10] = 97'h1923a244bdf4254ad3cfe11e8;
    stim[11] = 97'h1dcc08685ac80a3e6a8e34646;
    stim[12] = 97'h0cdeb94cddcc8a60078750ad9;
    stim[13] = 97'h0c6e07f201843ea727c97934e;
    stim[14] = 97'h02ee6812661cc003f25af4deb;
    stim[15] = 97'h13844b10e863e3c5fd2de1479;
    stim[16] = 97'h101690bee650d7df0cd41d9f9;
    stim[17] = 97'h04527cd2e1d83f1c4ba2aca28;
    stim[18] = 97'h1075a6335c60bcdd137dd1b1b;
    stim[19] = 97'h184efe81a5bf9762fdf247563;
    stim[20] = 97'h014bbb857a36dfe0a89b61f7f;
    stim[21] = 97'h1483c4832971643897e3f95f4;
    stim[22] = 97'h081c4209f1a4583fae8f48465;
    stim[23] = 97'h1734c46a75880eb720dcd147a;
    stim[24] = 97'h003b1c30d0a34e38f54dec428;
    stim[25] = 97'h0fbc1e592c8072e1cb24e491c;
    stim[26] = 97'h074d45862c197c50c1da21258;
    stim[27] = 97'h1eb0f8accff65f791994982da;
    stim[28] = 97'h1d9c561ef7bb6372a941d80c4;
    stim[29] = 97'h10c79e055dc2ebb7904b4c5fc;
    stim[30] = 97'h049dd571e48219384fb891210;
    stim[31] = 97'h1f92f6f3939d5feba8a9d1b2a;
    stim[32] = 97'h01518a1ec5020193e4a9c97c4;
    stim[33] = 97'h1696006fac8f1dc47d206802a;
    stim[34] = 97'h1e21aa9700678dc517ed00923;
    stim[35] = 97'h1f53ad247f6b2f31e340adc9d;
    stim[36] = 97'h1f4d7c3c5e4e5379ecc850c27;
    stim[37] = 97'h0e87417b6bd72ed8bdc4344c7;
    stim[38] = 97'h06887d27dd562a329b4a70f7d;
    stim[39] = 97'h083deb7fbdd24b0808b2e914f;
    stim[40] = 97'h08af04acf5c6ccaa294f50d4b;
    stim[41] = 97'h1e7cd6215d06dbea941184959;
    stim[42] = 97'h0af46b60e7819f01d4dbfcdae;
    stim[43] = 97'h1849e0b56aa218f33228e5c8b;
    stim[44] = 97'h11de091a95f7e5b178e8c8aea;
    stim[45] = 97'h095e96d1bbcd1f167305695a1;
    stim[46] = 97'h1dec8b6bdc6381c9863059a9c;
    stim[47] = 97'h021efe75711d3a563af501c85;
    stim[48] = 97'h0255de7fddcfd807abfc58611;
    stim[49] = 97'h1cb5538e4f9da43945fc00067;
    stim[50] = 97'h1d3cb7d5dbeaadaac9f6f9e11;
    stim[51] = 97'h192f0922398963882f813867f;
    stim[52] = 97'h1408ddef6838c420d273818fe;
    stim[53] = 97'h1b7d24afde1861d40cfff4edf;
    stim[54] = 97'h0308797fe73a0fb378dc89c27;
    stim[55] = 97'h1bddccd8765ed295f729bdf1a;
    stim[56] = 97'h06d71c3c30638a332900d9c01;
    stim[57] = 97'h031f8e5edd2d1cc33a2ba49a0;
    stim[58] = 97'h1981b91e9e1f6c13a7b4fc7c6;
    stim[59] = 97'h17d9fa47c12c8bc70a3678ed7;
    stim[60] = 97'h0e6c92d2e9757a0acf208dbf1;
    stim[61] = 97'h0f953121098b7996f6428cf50;
    stim[62] = 97'h0282d31d62ef2faf53b1b070f;
    stim[63] = 97'h1f108a876f51818304ecd15cb;
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
      expv[0] = 88'h0000000000000000000000;
      expv[1] = 88'h0000000000000000000000;
      expv[2] = 88'h0000000000000000000000;
      expv[3] = 88'hadb63e4fc0000000000000;
      expv[4] = 88'h0000000000000000000000;
      expv[5] = 88'h0000000000000000000000;
      expv[6] = 88'hc883358000000000000000;
      expv[7] = 88'hce2fc41540000000000000;
      expv[8] = 88'hbf9cca5a80000000000000;
      expv[9] = 88'hd214269dc0000000000000;
      expv[10] = 88'hb75d7c3940000000000000;
      expv[11] = 88'he48e8912c0000000000000;
      expv[12] = 88'hf73021a140000000000000;
      expv[13] = 88'hb37ae53340000000000000;
      expv[14] = 88'hb1b81fc840000000000000;
      expv[15] = 88'h8bb9a04980000000000000;
      expv[16] = 88'hce112c4380000000000000;
      expv[17] = 88'hc05a42fb80000000000000;
      expv[18] = 88'h9149f34bc0000000000000;
      expv[19] = 88'h0000000000000000000000;
      expv[20] = 88'h0000000000000000000000;
      expv[21] = 88'h852eee1580000000000000;
      expv[22] = 88'hd20f120c80000000000000;
      expv[23] = 88'ha0710827c0000000000000;
      expv[24] = 88'hdcd311a9c0000000000000;
      expv[25] = 88'h80ec70c340000000000000;
      expv[26] = 88'hbef07964c0000000000000;
      expv[27] = 88'h9d35161880000000000000;
      expv[28] = 88'hfac3e2b340000000000000;
      expv[29] = 88'hf671587bc0000000000000;
      expv[30] = 88'hc31e781540000000000000;
      expv[31] = 88'h927755c7c0000000000000;
      expv[32] = 88'hfe4bdbce40000000000000;
      expv[33] = 88'h8546287b00000000000000;
      expv[34] = 88'hda5801bec0000000000000;
      expv[35] = 88'hf886aa5c00000000000000;
      expv[36] = 88'hfd4eb49180000000000000;
      expv[37] = 88'hfd35f0f100000000000000;
      expv[38] = 88'hba1d05edc0000000000000;
      expv[39] = 88'h9a21f49f00000000000000;
      expv[40] = 88'ha0f7adfec0000000000000;
      expv[41] = 88'ha2bc12b3c0000000000000;
      expv[42] = 88'hf9f3588500000000000000;
      expv[43] = 88'habd1ad83c0000000000000;
      expv[44] = 88'he12782d5c0000000000000;
      expv[45] = 88'hc778246a40000000000000;
      expv[46] = 88'ha57a5b46c0000000000000;
      expv[47] = 88'hf7b22daf00000000000000;
      expv[48] = 88'h887bf9d580000000000000;
      expv[49] = 88'h895779ff40000000000000;
      expv[50] = 88'hf2d54e3940000000000000;
      expv[51] = 88'hf4f2df5740000000000000;
      expv[52] = 88'he4bc2488c0000000000000;
      expv[53] = 88'hd02377bd80000000000000;
      expv[54] = 88'hedf492bf00000000000000;
      expv[55] = 88'h8c21e5ff80000000000000;
      expv[56] = 88'hef77336180000000000000;
      expv[57] = 88'h9b5c70f080000000000000;
      expv[58] = 88'h8c7e397b00000000000000;
      expv[59] = 88'he606e47a00000000000000;
      expv[60] = 88'hdf67e91f00000000000000;
      expv[61] = 88'hb9b24b4b80000000000000;
      expv[62] = 88'hbe54c48440000000000000;
      expv[63] = 88'h8a0b4c75c0000000000000;
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
