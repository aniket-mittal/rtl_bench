// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 111;
  localparam OW = 110;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006527 dut (
    .clk(clk),
    .reset(in_vec[110:110]),
    .address(in_vec[109:78]),
    .read(in_vec[77:77]),
    .write(in_vec[76:76]),
    .burstcount(in_vec[75:72]),
    .burstbegin(in_vec[71:71]),
    .byteenable(in_vec[70:67]),
    .writedata(in_vec[66:35]),
    .irq(in_vec[34:34]),
    .export_readdata(in_vec[33:2]),
    .export_waitrequest(in_vec[1:1]),
    .export_readdatavalid(in_vec[0:0]),
    .readdata(out_vec[109:78]),
    .waitrequest(out_vec[77:77]),
    .readdatavalid(out_vec[76:76]),
    .export_address(out_vec[75:44]),
    .export_read(out_vec[43:43]),
    .export_write(out_vec[42:42]),
    .export_burstcount(out_vec[41:38]),
    .export_burstbegin(out_vec[37:37]),
    .export_byteenable(out_vec[36:33]),
    .export_writedata(out_vec[32:1]),
    .export_irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 111'h4495c93e4dae81a53905160f17f5;
    stim[1] = 111'h49e0866c46143c0a77f8da1a0967;
    stim[2] = 111'h392b1061f93c6078d5d3e93dbd13;
    stim[3] = 111'h3382df60a882b7388b9c2a0e7004;
    stim[4] = 111'h10cef215512baf94e54edc2f203d;
    stim[5] = 111'h3258e8035fa2b5249d4a5c019b10;
    stim[6] = 111'h0d3326ac643c369c5a5d65f0ca7c;
    stim[7] = 111'h3677142823b76d0eee77f1a41069;
    stim[8] = 111'h39ea625ee235793c40b7ded50364;
    stim[9] = 111'h0629011432950c641ca1ed741ad2;
    stim[10] = 111'h3c31f00240fbb8ed33a2517033c1;
    stim[11] = 111'h020ee694915db7b3e14c7f355d4c;
    stim[12] = 111'h189abe3ca692888d7d9006416cf3;
    stim[13] = 111'h3e1ab4e0898fb4aeeeeacfc75d23;
    stim[14] = 111'h06d9d212d09acde07306acaa2476;
    stim[15] = 111'h13a93168ab5727554ae4cda0d827;
    stim[16] = 111'h0b6a1a99f6d4ab08cb3dce24aef2;
    stim[17] = 111'h1fc4e37f3e50bdce58c3d24f42ca;
    stim[18] = 111'h18967ad9feb786ca17e44ac35b2b;
    stim[19] = 111'h0179bbc5f03fd434e7ee8a034d40;
    stim[20] = 111'h3799ea4ac56f35f1fd5d6c13c047;
    stim[21] = 111'h1224876a2285c597bcda2b07fe74;
    stim[22] = 111'h052be19ded3b4480bbfd676edb8d;
    stim[23] = 111'h01b8fa2696ad0deb4fe2776a7c47;
    stim[24] = 111'h0d64d1db5914d8af4efb58ea1209;
    stim[25] = 111'h398d7ee9ab09445d54ef005fed8f;
    stim[26] = 111'h1b9e3502578648f9409fbf029e04;
    stim[27] = 111'h09dcdec8175085d830dfa48f74d1;
    stim[28] = 111'h00461e7381cef21308bf3b4223b0;
    stim[29] = 111'h313f5dc7c99443916adbebcbe763;
    stim[30] = 111'h1bf6fe51f0fa2829b4ea3fa36c3e;
    stim[31] = 111'h2805689eb194023b121eb52cbed8;
    stim[32] = 111'h3c9895cd07a24fbcc1965a3cb3be;
    stim[33] = 111'h00df706f3be25ba1c02c1be652d5;
    stim[34] = 111'h36abb26c3fd96dba8c6a58e98e1c;
    stim[35] = 111'h3bb2db0360b20a0c955382dbb73d;
    stim[36] = 111'h58cf82fac021ad48a3511ae711d8;
    stim[37] = 111'h0f9955fb0b196b4d031ea23892b7;
    stim[38] = 111'h1ca0a42b30467a4b3afe6828fdca;
    stim[39] = 111'h1b9e6877afd30e70e48d427b1df0;
    stim[40] = 111'h034623bbf3409d15cd1e4f6a368f;
    stim[41] = 111'h0b99909ceb6d92f41bd9d9d1d11b;
    stim[42] = 111'h19b9a4e47563c9bd0c52a41375bd;
    stim[43] = 111'h0e12d627a7e8a7ea3702a4f0c3cb;
    stim[44] = 111'h3d5514860b9feb271ccffe47d140;
    stim[45] = 111'h26157ad45308fd72c96c02b3912f;
    stim[46] = 111'h14a78c868e53bcff279b3168f3b1;
    stim[47] = 111'h24e5c9254646b937025838417e8d;
    stim[48] = 111'h0e3b3777a1fc0e4f823c24568d6b;
    stim[49] = 111'h0b27fa34351b71ee37ce0561630f;
    stim[50] = 111'h130fe6355f70789b3e7657c8a286;
    stim[51] = 111'h3c80c8e734db94b48e3c2f4f031b;
    stim[52] = 111'h2806bed464aee1b5129c5243d13a;
    stim[53] = 111'h01ee14223f934e94ff52c50ff23a;
    stim[54] = 111'h11513bc5cbe62a68ba0c30ba24eb;
    stim[55] = 111'h1857b733cbd71b4357dec7f536b0;
    stim[56] = 111'h00f9c57c6a3a23ce2c0d03769bea;
    stim[57] = 111'h24216369993d4535e605b4b625a0;
    stim[58] = 111'h06d6d214595446c4320b9388953e;
    stim[59] = 111'h2c3e130ee78041c7c09a39dab53b;
    stim[60] = 111'h04c468f23738298bcef34c4538a8;
    stim[61] = 111'h09a7d99dfefd985719b5acf35c85;
    stim[62] = 111'h37db6e15977245f95d55efc55345;
    stim[63] = 111'h12ec53c9d0df077e17e6363f1018;
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
      expv[0] = 110'h1160f17f5495c93e436ba0694e41;
      expv[1] = 110'h0da1a09679e0866c41850f029dfe;
      expv[2] = 110'h3e93dbd1392b1061ce4f181e3574;
      expv[3] = 110'h02a0e7004382df608a20adce22e7;
      expv[4] = 110'h2dc2f203d0cef215444aebe53953;
      expv[5] = 110'h25c019b10258e80347e8ad492752;
      expv[6] = 110'h165f0ca7cd3326ac490f0da71697;
      expv[7] = 110'h3f1a41069677142808eddb43bb9d;
      expv[8] = 110'h3ded503649ea625ec88d5e4f102d;
      expv[9] = 110'h1ed741ad262901140ca543190728;
      expv[10] = 110'h2517033c1c31f002403eee3b4ce8;
      expv[11] = 110'h07f355d4c20ee69484576decf853;
      expv[12] = 110'h006416cf389abe3c89a4a2235f64;
      expv[13] = 110'h2cfc75d23e1ab4e08263ed2bbbba;
      expv[14] = 110'h2acaa24766d9d212c426b3781cc1;
      expv[15] = 110'h0cda0d8273a931688ad5c9d552b9;
      expv[16] = 110'h1ce24aef2b6a1a99cdb52ac232cf;
      expv[17] = 110'h3d24f42cafc4e37f0f942f739630;
      expv[18] = 110'h04ac35b2b8967ad9cfade1b285f9;
      expv[19] = 110'h28a034d40179bbc5cc0ff50d39fb;
      expv[20] = 110'h16c13c047799ea4ac15bcd7c7f57;
      expv[21] = 110'h22b07fe74224876a08a17165ef36;
      expv[22] = 110'h1676edb8d52be19dcb4ed1202eff;
      expv[23] = 110'h2776a7c471b8fa2685ab437ad3f8;
      expv[24] = 110'h358ea1209d64d1db4645362bd3be;
      expv[25] = 110'h3005fed8f98d7ee98ac25117553b;
      expv[26] = 110'h3bf029e04b9e350245e1923e5027;
      expv[27] = 110'h3a48f74d19dcdec805d421760c37;
      expv[28] = 110'h33b4223b00461e738073bc84c22f;
      expv[29] = 110'h3ebcbe76313f5dc7c26510e45ab6;
      expv[30] = 110'h23fa36c3ebf6fe51cc3e8a0a6d3a;
      expv[31] = 110'h2b52cbed8805689e8c65008ec487;
      expv[32] = 110'h25a3cb3bec9895cd01e893ef3065;
      expv[33] = 110'h01be652d50df706f0ef896e8700b;
      expv[34] = 110'h258e98e1c6abb26c0ff65b6ea31a;
      expv[35] = 110'h382dbb73dbb2db03482c82832554;
      expv[36] = 110'h11ae711d88cf82fac0086b5228d4;
      expv[37] = 110'h2a23892b7f9955fb02c65ad340c7;
      expv[38] = 110'h26828fdcaca0a42b0c119e92cebf;
      expv[39] = 110'h1427b1df0b9e68778bf4c39c3923;
      expv[40] = 110'h24f6a368f34623bbccd027457347;
      expv[41] = 110'h1d9d1d11bb99909ccadb64bd06f6;
      expv[42] = 110'h2a41375bd9b9a4e44d58f26f4314;
      expv[43] = 110'h2a4f0c3cbe12d62789fa29fa8dc0;
      expv[44] = 110'h3fe47d140d55148602e7fac9c733;
      expv[45] = 110'h002b3912f6157ad444c23f5cb25b;
      expv[46] = 110'h33168f3b14a78c868394ef3fc9e6;
      expv[47] = 110'h038417e8d4e5c9254191ae4dc096;
      expv[48] = 110'h024568d6be3b3777887f0393e08f;
      expv[49] = 110'h20561630fb27fa340d46dc7b8df3;
      expv[50] = 110'h257c8a28630fe63547dc1e26cf9d;
      expv[51] = 110'h02f4f031bc80c8e70d36e52d238f;
      expv[52] = 110'h05243d13a806bed4492bb86d44a7;
      expv[53] = 110'h2c50ff23a1ee14220fe4d3a53fd4;
      expv[54] = 110'h030ba24eb1513bc5c2f98a9a2e83;
      expv[55] = 110'h2c7f536b0857b733c2f5c6d0d5f7;
      expv[56] = 110'h103769bea0f9c57c4a8e88f38b03;
      expv[57] = 110'h1b4b625a04216369864f514d7981;
      expv[58] = 110'h39388953e6d6d214465511b10c82;
      expv[59] = 110'h239dab53bc3e130ec9e01071f026;
      expv[60] = 110'h34c4538a84c468f20dce0a62f3bc;
      expv[61] = 110'h1acf35c859a7d99dcfbf6615c66d;
      expv[62] = 110'h1efc553457db6e1585dc917e5755;
      expv[63] = 110'h2363f10182ec53c9c437c1df85f9;
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
