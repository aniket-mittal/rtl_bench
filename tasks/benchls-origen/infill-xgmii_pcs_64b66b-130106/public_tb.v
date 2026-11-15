// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 143;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_130106 dut (
    .rx_clk(clk),
    .rx_rst(in_vec[142:142]),
    .tx_clk(in_vec[141:141]),
    .tx_rst(in_vec[140:140]),
    .xgmii_txd(in_vec[139:76]),
    .xgmii_txc(in_vec[75:68]),
    .serdes_rx_data(in_vec[67:4]),
    .serdes_rx_hdr(in_vec[3:2]),
    .tx_prbs31_enable(in_vec[1:1]),
    .rx_prbs31_enable(in_vec[0:0]),
    .xgmii_rxd(out_vec[152:89]),
    .xgmii_rxc(out_vec[88:81]),
    .serdes_tx_data(out_vec[80:17]),
    .serdes_tx_hdr(out_vec[16:15]),
    .serdes_rx_bitslip(out_vec[14:14]),
    .serdes_rx_reset_req(out_vec[13:13]),
    .tx_bad_block(out_vec[12:12]),
    .rx_error_count(out_vec[11:4]),
    .rx_bad_block(out_vec[3:3]),
    .rx_sequence_error(out_vec[2:2]),
    .rx_block_lock(out_vec[1:1]),
    .rx_high_ber(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 143'h700b7e0e348edf2268b86cbcc50d33493341;
    stim[1] = 143'h6f61949510bedd43ff86d66e8e166eed8b1e;
    stim[2] = 143'h039f248f5b2a3cbb6260ba894b23b6c668fe;
    stim[3] = 143'h2aa3f9cc63ab556a34c184c761e52b4543c8;
    stim[4] = 143'h27655fb6392d866c205bc96e61f14b4d598d;
    stim[5] = 143'h253e06425d2ebc67133ce3cd886f8836c697;
    stim[6] = 143'h2ebbede77bd17d8c6830f48e86489d7442e4;
    stim[7] = 143'h126b2581b9d337b5caba82d0e3846303ebe7;
    stim[8] = 143'h3a0d0182079fa2a09746a94fae1b968547ed;
    stim[9] = 143'h2128bcd2b22682e0d31cfc562c15d8dd2516;
    stim[10] = 143'h11f006cf00371a895a5ecf40d0da208e2ef6;
    stim[11] = 143'h17ba361e4903525dcd5d17371db3c7bd779a;
    stim[12] = 143'h0bae43f49e609f9643705c7acdb63710cd87;
    stim[13] = 143'h1304d8529d1aeb0a4b5e795e25577516e9a0;
    stim[14] = 143'h13ce48d6a22e6d11342426ea98cbfe88fef3;
    stim[15] = 143'h23feba1d29aae5b57ad69aeeaa409c2df705;
    stim[16] = 143'h351677c0903b87039fd089aea98f4dcf611c;
    stim[17] = 143'h32d8c3bb07579a90f5cf8390980b960643a6;
    stim[18] = 143'h1e60c14908e35c92ded7c01e9a08070838dc;
    stim[19] = 143'h38dc3c389cdb26febb5975ea8980be80a6ce;
    stim[20] = 143'h12e7f3b956c33e16f57e7b2c32e93c1570ef;
    stim[21] = 143'h2ad9d90001964e6cfdd450efefbb9f3a6c1c;
    stim[22] = 143'h3aa7c25f68bb57127231ebc6ee9b898fd733;
    stim[23] = 143'h0c03cdfc1351d617d1a5f111fed14b12755b;
    stim[24] = 143'h2ecd6374f5d80320ed91c5dfc65934aa3e07;
    stim[25] = 143'h18aeb87fa6947d2ec4a8a4150b12b17cb246;
    stim[26] = 143'h5b4a5e7d35acdc2d9c8c3ed526721c82bfbe;
    stim[27] = 143'h29b88f687df7eae7b704d3efffa29dfc8b73;
    stim[28] = 143'h3c19a6b2961c3fdc0a230c7681e92df79513;
    stim[29] = 143'h3bedbe69911b05135381e35b1be12cf71eea;
    stim[30] = 143'h1b9dc77363214e6170b96ee8f291fa3be95d;
    stim[31] = 143'h107cbe867621b320ee84391476ce0e807915;
    stim[32] = 143'h0339f7468d695c093fcc4b39df0e5e5861a2;
    stim[33] = 143'h17fb57c7ba92489d536c7aac6ea8631bb063;
    stim[34] = 143'h292bda343c0ba354257a2c8f7783c5474609;
    stim[35] = 143'h3c80183c43e88cb9ddcc255e6f3c508c8f73;
    stim[36] = 143'h3d9d456fc6ff958a1eb5742d948181ede01d;
    stim[37] = 143'h227837fcbba23a2291c74727ced00384b7c9;
    stim[38] = 143'h25c9c2f59a44290e1f98b64f9135c202f249;
    stim[39] = 143'h0a7a77864f050e30e30b63298f97ffe8f003;
    stim[40] = 143'h09561e20dbbd69c639678f957601a834dc2e;
    stim[41] = 143'h0e806734d0eb98134f960bca3833c6c7775c;
    stim[42] = 143'h3bb13e91f86a71fa9d598090b1e6a7bc414e;
    stim[43] = 143'h0b4ab36698f1f0872a81cf4aed7e655a4b37;
    stim[44] = 143'h3ab16565b960bfe5af2da140819ccfa89952;
    stim[45] = 143'h2131948edf8b9bc1dfb3b5e000881a18db82;
    stim[46] = 143'h1c25495a3a6ac0a135f31f8256deb609462c;
    stim[47] = 143'h0c932dc57fe38c8027bfb3207e8feac9a511;
    stim[48] = 143'h0f86402ba52a354939911b4776db9d9182f4;
    stim[49] = 143'h1e2d984f5d637b31d80eb0542544c658a62a;
    stim[50] = 143'h237c8b8f72234ae3ee363030c4e73ee371c2;
    stim[51] = 143'h3e451fe81b0ec95ecc66854d33b55887dc68;
    stim[52] = 143'h39e4ca63e0bc12eaf3c6ba4979059e61582e;
    stim[53] = 143'h23b4246a06fc433b6d70745ed756af7d0abc;
    stim[54] = 143'h207624d577bdf597ed8c341e885cca5ba631;
    stim[55] = 143'h30315c9f8f2e4621df6a4eba6fbd765e0079;
    stim[56] = 143'h08d27a3a289e49aa989a7b2fa82655085f18;
    stim[57] = 143'h054addd8e9ac6e6a8014f3ba7301750cbdac;
    stim[58] = 143'h3c6d814d9a463fb903db5c870d3304e74749;
    stim[59] = 143'h235da257920cdaa7daa82af1dc7192c2485b;
    stim[60] = 143'h3473251b7dafcb7b0af585c099040c7cabfb;
    stim[61] = 143'h12089d08f2e53bd82f7181620dfa26034553;
    stim[62] = 143'h3bbab6240f8a289baef22e791680f1d687c0;
    stim[63] = 143'h1abcd9ab916c352e123906cb5bdbccb27e4e;
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
      expv[0] = 153'h000000000000000000000000000000000000000;
      expv[1] = 153'h000000000000000000000000000000000000000;
      expv[2] = 153'h000000000000000000000000000000000000000;
      expv[3] = 153'h000000000000000000000000000000000000002;
      expv[4] = 153'h01751296476d8cd1e0000000000000000000002;
      expv[5] = 153'h03098ec3ca568a8780000000000000000000002;
      expv[6] = 153'h1792dcc3e2969ab300000000000000000000002;
      expv[7] = 153'h19c79b10df106d8d20000000000000000000002;
      expv[8] = 153'h01e91d0c913ae885c0000000000000000000002;
      expv[9] = 153'h1505a1c708c607d7c0000000000000000000002;
      expv[10] = 153'h0d529f5c372d0a8fc0000000000000000000002;
      expv[11] = 153'h19f8ac582bb1ba4a20000000000000000000002;
      expv[12] = 153'h1d9e81a1b4411c5de0000000000000000000002;
      expv[13] = 153'h1a2e6e3b678f7aef20000000000000000000002;
      expv[14] = 153'h00b8f59b6c6e219b00000000000000000000002;
      expv[15] = 153'h1cf2bc4aaeea2dd340000000000000000000002;
      expv[16] = 153'h084dd53197fd11fde0000000000000000000002;
      expv[17] = 153'h0d35dd5481385bee00000000000000000000002;
      expv[18] = 153'h01135d531e9b9ec220000000000000000000002;
      expv[19] = 153'h1f072130172c0c8740000000000000000000002;
      expv[20] = 153'h0f803d34100e1071a0000000000000000000002;
      expv[21] = 153'h12ebd513017d014d80000000000000000000002;
      expv[22] = 153'h1cf65865d2782ae1c0000000000000000000002;
      expv[23] = 153'h08a1dfdf773e74d820000000000000000000002;
      expv[24] = 153'h03d78ddd37131fae60000000000000000000002;
      expv[25] = 153'h0be223fda29624eaa0000000000000000000002;
      expv[26] = 153'h000000000000000000000000000000000000000;
      expv[27] = 153'h000000000000000000000000000000000000000;
      expv[28] = 153'h000000000000000000000000000000000000002;
      expv[29] = 153'h09a7dfff453bf916e0000000000000000000002;
      expv[30] = 153'h0618ed03d25bef2a20000000000000000000002;
      expv[31] = 153'h03c6b637c259ee3dc0000000000000000000002;
      expv[32] = 153'h12ddd1e523f477d2a0000000000000000000002;
      expv[33] = 153'h087228ed9c1d00f220000000000000000000002;
      expv[34] = 153'h189673be1cbcb0c340000000000000000000002;
      expv[35] = 153'h18f558dd50c63760c0000000000000000000002;
      expv[36] = 153'h14591eef078a8e8c00000000000000000000002;
      expv[37] = 153'h184abcde78a1191ee0000000000000000000002;
      expv[38] = 153'h0ae85b290303dbc020000000000000000000002;
      expv[39] = 153'h0e8e4f9da007096f80000000000000000000002;
      expv[40] = 153'h116c9f226b8405e480000000000000000000002;
      expv[41] = 153'h16c6531f2fffd1e000000000000000000000002;
      expv[42] = 153'h0f1f2aec035069b840000000000000000000002;
      expv[43] = 153'h0c179470678d8eeea0000000000000000000002;
      expv[44] = 153'h13012163cd4f788280000000000000000000002;
      expv[45] = 153'h039e95dafccab49660000000000000000000002;
      expv[46] = 153'h1b428103399f5132a0000000000000000000002;
      expv[47] = 153'h076bc001103431b700000000000000000000002;
      expv[48] = 153'h063f04adbd6c128c40000000000000000000002;
      expv[49] = 153'h1f6640fd1fd5934a20000000000000000000002;
      expv[50] = 153'h02368eedb73b2305e0000000000000000000002;
      expv[51] = 153'h1d60a84a898cb14c40000000000000000000002;
      expv[52] = 153'h0c606189ce7dc6e380000000000000000000002;
      expv[53] = 153'h0d0a9a676ab10fb8c0000000000000000000002;
      expv[54] = 153'h0d7492f20b3cc2b040000000000000000000002;
      expv[55] = 153'h00e8bdaead5efa1560000000000000000000002;
      expv[56] = 153'h18683d10b994b74c60000000000000000000002;
      expv[57] = 153'h149d74df7aecbc00e0000000000000000000002;
      expv[58] = 153'h14f65f504caa10be20000000000000000000002;
      expv[59] = 153'h09e774e602ea197b40000000000000000000002;
      expv[60] = 153'h16b90e1a6609ce8e80000000000000000000002;
      expv[61] = 153'h1055e3b8e3258490a0000000000000000000002;
      expv[62] = 153'h0b0b81320818f957e0000000000000000000002;
      expv[63] = 153'h0302c41bf44c068aa0000000000000000000002;
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
