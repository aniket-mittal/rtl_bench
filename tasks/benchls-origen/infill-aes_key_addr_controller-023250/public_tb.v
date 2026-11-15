// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023250 dut (
    .clk(clk),
    .kill(in_vec[66:66]),
    .en_wr(in_vec[65:65]),
    .key_ready(in_vec[64:64]),
    .ram_out(in_vec[63:0]),
    .key_round_rd(out_vec[132:5]),
    .addr(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h4e86f5a230d8403f6;
    stim[1] = 67'h4b63804e00187ef9d;
    stim[2] = 67'h3fe2a3269e9247563;
    stim[3] = 67'h0fea32306eaf56879;
    stim[4] = 67'h1176a736df6628b8e;
    stim[5] = 67'h2cbec5ef451037f27;
    stim[6] = 67'h1827272cf18ee17f2;
    stim[7] = 67'h2082b55b08196909c;
    stim[8] = 67'h308af0ca325aff84a;
    stim[9] = 67'h2a9a622594c7af078;
    stim[10] = 67'h2e2843932b934dd2e;
    stim[11] = 67'h028c13450f4dcd63a;
    stim[12] = 67'h2cac3ac06c9bf12d0;
    stim[13] = 67'h1937528ed036c6edd;
    stim[14] = 67'h098dd836947f9ef50;
    stim[15] = 67'h10892ed37304f6d6e;
    stim[16] = 67'h2ac4ac932f26eaa8d;
    stim[17] = 67'h0997f38eae8877f3c;
    stim[18] = 67'h10f37b49c5df605ae;
    stim[19] = 67'h36126c9b53aa54140;
    stim[20] = 67'h16095dfd71f066498;
    stim[21] = 67'h02801c7dd132bdff2;
    stim[22] = 67'h2835a223dc07fa43b;
    stim[23] = 67'h242b0d9745d56023d;
    stim[24] = 67'h2cacca402772286b1;
    stim[25] = 67'h21e93fb5636bed4a8;
    stim[26] = 67'h4a98e153d7b3df897;
    stim[27] = 67'h1eb3d6e80d66b3d6a;
    stim[28] = 67'h206a8d50ca383e029;
    stim[29] = 67'h165b9833a2c280715;
    stim[30] = 67'h2b3f3573687b91a33;
    stim[31] = 67'h065dac7d270ad0b99;
    stim[32] = 67'h161327435a2d3023d;
    stim[33] = 67'h24b0019f0854b21b1;
    stim[34] = 67'h1bbe78a2485317f7f;
    stim[35] = 67'h2d3d0793ac17902ff;
    stim[36] = 67'h1286d864544536b75;
    stim[37] = 67'h0edc506cd35ffa62d;
    stim[38] = 67'h169540c022233c34f;
    stim[39] = 67'h223cc1711159ab4e9;
    stim[40] = 67'h0b090ccb8e112365e;
    stim[41] = 67'h203ed1b9df94dde09;
    stim[42] = 67'h2a49752cfeb0e27d0;
    stim[43] = 67'h09eca2cf7bfacf45f;
    stim[44] = 67'h2da5b7e4ed46460a1;
    stim[45] = 67'h35d1735fe27a07588;
    stim[46] = 67'h1fa96205ba30d768c;
    stim[47] = 67'h2884405129ef80c42;
    stim[48] = 67'h13d1cbd21adc15b54;
    stim[49] = 67'h27ba8407a59b2263d;
    stim[50] = 67'h337c9f8d01f07abef;
    stim[51] = 67'h29eb087759012df18;
    stim[52] = 67'h37d7aa1b1797ae9d2;
    stim[53] = 67'h1d4492dfe2cdf2bfc;
    stim[54] = 67'h3f57f1626cbaf5082;
    stim[55] = 67'h2d0771b164c229982;
    stim[56] = 67'h362efa7f4e0466bbb;
    stim[57] = 67'h351cc454d475dd789;
    stim[58] = 67'h124d7d4d9409633b7;
    stim[59] = 67'h334f55140c61a6697;
    stim[60] = 67'h064e6decd1559dd1e;
    stim[61] = 67'h1926f05d759a4e57e;
    stim[62] = 67'h1c2541ee7a715dba3;
    stim[63] = 67'h317cc67658a25a86e;
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
      expv[0] = 133'h1d0deb4461b0807ec00000000000000000;
      expv[1] = 133'h16c7009c0030fdf3a00000000000000000;
      expv[2] = 133'h1fc5464d3d248eac600000000000000000;
      expv[3] = 133'h1fd46460dd5ead0f3fd46460dd5ead0f21;
      expv[4] = 133'h02ed4e6dbecc5171dfd46460dd5ead0f22;
      expv[5] = 133'h197d8bde8a206fe4f97d8bde8a206fe4e0;
      expv[6] = 133'h104e4e59e31dc2fe597d8bde8a206fe4e4;
      expv[7] = 133'h01056ab61032d21381056ab61032d21380;
      expv[8] = 133'h0115e19464b5ff0941056ab61032d21381;
      expv[9] = 133'h1534c44b298f5e0f1534c44b298f5e0f02;
      expv[10] = 133'h1c50872657269ba5d534c44b298f5e0f03;
      expv[11] = 133'h0518268a1e9b9ac75534c44b298f5e0f08;
      expv[12] = 133'h19587580d937e25a1534c44b298f5e0f04;
      expv[13] = 133'h126ea51da06d8ddbb534c44b298f5e0f08;
      expv[14] = 133'h131bb06d28ff3dea131bb06d28ff3dea09;
      expv[15] = 133'h01125da6e609edadd31bb06d28ff3dea0a;
      expv[16] = 133'h158959265e4dd551b58959265e4dd551a0;
      expv[17] = 133'h132fe71d5d10efe7958959265e4dd551ac;
      expv[18] = 133'h01e6f6938bbec0b5d58959265e4dd551ac;
      expv[19] = 133'h0c24d936a754a8280c24d936a754a82800;
      expv[20] = 133'h0c12bbfae3e0cc930c24d936a754a8280e;
      expv[21] = 133'h050038fba2657bfe450038fba2657bfe4f;
      expv[22] = 133'h106b4447b80ff487650038fba2657bfe40;
      expv[23] = 133'h08561b2e8baac047a50038fba2657bfe41;
      expv[24] = 133'h195994804ee450d6250038fba2657bfe42;
      expv[25] = 133'h03d27f6ac6d7da95050038fba2657bfe43;
      expv[26] = 133'h1531c2a7af67bf12e00000000000000000;
      expv[27] = 133'h1d67add01acd67ad400000000000000000;
      expv[28] = 133'h00d51aa194707c0520d51aa194707c0520;
      expv[29] = 133'h0cb73067458500e2a0d51aa194707c0522;
      expv[30] = 133'h167e6ae6d0f72346767e6ae6d0f7234660;
      expv[31] = 133'h0cbb58fa4e15a173367e6ae6d0f7234664;
      expv[32] = 133'h0c264e86b45a6047b67e6ae6d0f7234664;
      expv[33] = 133'h0960033e10a964362960033e10a9643620;
      expv[34] = 133'h177cf14490a62fefe960033e10a9643626;
      expv[35] = 133'h1a7a0f27582f205ffa7a0f27582f205fe0;
      expv[36] = 133'h050db0c8a88a6d6eba7a0f27582f205fe8;
      expv[37] = 133'h1db8a0d9a6bff4c5bdb8a0d9a6bff4c5a9;
      expv[38] = 133'h0d2a818044467869fdb8a0d9a6bff4c5aa;
      expv[39] = 133'h047982e222b3569d247982e222b3569d20;
      expv[40] = 133'h161219971c2246cbc47982e222b3569d2c;
      expv[41] = 133'h007da373bf29bbc1247982e222b3569d21;
      expv[42] = 133'h1492ea59fd61c4fa047982e222b3569d22;
      expv[43] = 133'h13d9459ef7f59e8be47982e222b3569d2c;
      expv[44] = 133'h1b4b6fc9da8c8c14247982e222b3569d23;
      expv[45] = 133'h0ba2e6bfc4f40eb1047982e222b3569d24;
      expv[46] = 133'h1f52c40b7461aed19f52c40b7461aed18d;
      expv[47] = 133'h110880a253df01885f52c40b7461aed180;
      expv[48] = 133'h07a397a435b82b6a87a397a435b82b6a8f;
      expv[49] = 133'h0f75080f4b3644c7a7a397a435b82b6a80;
      expv[50] = 133'h06f93f1a03e0f57de6f93f1a03e0f57de1;
      expv[51] = 133'h13d610eeb2025be306f93f1a03e0f57de2;
      expv[52] = 133'h0faf54362f2f5d3a4faf54362f2f5d3a43;
      expv[53] = 133'h1a8925bfc59be57f8faf54362f2f5d3a54;
      expv[54] = 133'h1eafe2c4d975ea105eafe2c4d975ea1040;
      expv[55] = 133'h1a0ee362c98453305eafe2c4d975ea1041;
      expv[56] = 133'h0c5df4fe9c08cd776c5df4fe9c08cd7762;
      expv[57] = 133'h0a3988a9a8ebbaf12c5df4fe9c08cd7763;
      expv[58] = 133'h049afa9b2812c676e49afa9b2812c676e3;
      expv[59] = 133'h069eaa2818c34cd2e49afa9b2812c676e0;
      expv[60] = 133'h0c9cdbd9a2ab3ba3cc9cdbd9a2ab3ba3c5;
      expv[61] = 133'h124de0baeb349cafcc9cdbd9a2ab3ba3c6;
      expv[62] = 133'h184a83dcf4e2bb74784a83dcf4e2bb7467;
      expv[63] = 133'h02f98cecb144b50dd84a83dcf4e2bb7460;
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
