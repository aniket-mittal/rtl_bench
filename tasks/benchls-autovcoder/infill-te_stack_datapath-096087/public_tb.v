// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_096087 dut (
    .clk(clk),
    .rst(in_vec[70:70]),
    .init_i(in_vec[69:69]),
    .push_i(in_vec[68:68]),
    .pop_i(in_vec[67:67]),
    .tem_latch_i(in_vec[66:66]),
    .idx_i(in_vec[65:65]),
    .idx_prev_i(in_vec[64:64]),
    .te0_i(in_vec[63:32]),
    .te1_i(in_vec[31:0]),
    .te0_o(out_vec[127:96]),
    .tem_o(out_vec[95:64]),
    .te1_o(out_vec[63:32]),
    .te1_child_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h6d70a60bb3e36c8aee;
    stim[1] = 71'h4d16f4de32535229d5;
    stim[2] = 71'h29b9b965fac976aa0f;
    stim[3] = 71'h0750e727db0931786c;
    stim[4] = 71'h20f3445a478ff70784;
    stim[5] = 71'h2bf4f80370f334d368;
    stim[6] = 71'h0761c7fea94f331480;
    stim[7] = 71'h0736cf4ccd1eef9b10;
    stim[8] = 71'h3b3377bf7c5331dedf;
    stim[9] = 71'h31d2bbf1a9757efea7;
    stim[10] = 71'h23042441999a8bef39;
    stim[11] = 71'h02e542a02b02f5864a;
    stim[12] = 71'h3ffbdfc27ec3ab17f6;
    stim[13] = 71'h314585d812f83dc6d3;
    stim[14] = 71'h2044f6559be8fed90a;
    stim[15] = 71'h295dd8547a857dd2a9;
    stim[16] = 71'h004b90147490689898;
    stim[17] = 71'h09811ab14cf2f95b71;
    stim[18] = 71'h25d0662bf4b331a1c4;
    stim[19] = 71'h378fac97c32847335e;
    stim[20] = 71'h1e150efc4ea5cb6423;
    stim[21] = 71'h2037cc11aeb7ddb5f1;
    stim[22] = 71'h034e3fb2798e539518;
    stim[23] = 71'h240b3cff6d2a723b8a;
    stim[24] = 71'h372058286af6fa393b;
    stim[25] = 71'h0f3d43e09868effefe;
    stim[26] = 71'h31e1065b2dcd23755a;
    stim[27] = 71'h2d2b382ca87c8a4b73;
    stim[28] = 71'h0409ce92cf6bc7496c;
    stim[29] = 71'h007b7cf68de47faff8;
    stim[30] = 71'h2b0e4b1ff1b6cb8e72;
    stim[31] = 71'h06a6b522da472d2377;
    stim[32] = 71'h3f945eb603702fc405;
    stim[33] = 71'h24bfcda00508de13a2;
    stim[34] = 71'h35430fb2955f52acba;
    stim[35] = 71'h244415305bfffdc9ee;
    stim[36] = 71'h1b424564a38eb498d2;
    stim[37] = 71'h0619c761f3be7f18c9;
    stim[38] = 71'h300baccf507a2e6955;
    stim[39] = 71'h387ec384e9d2774522;
    stim[40] = 71'h20f353c72eb4aa0320;
    stim[41] = 71'h0a1794c488a015ceaa;
    stim[42] = 71'h25d6a4d251bcd99fbb;
    stim[43] = 71'h37dd9e3c17630d4a6a;
    stim[44] = 71'h0505f2f26e33de6696;
    stim[45] = 71'h1156ace7c06edccfb9;
    stim[46] = 71'h3040f0ff86c5a68d7e;
    stim[47] = 71'h1db1d9a05e59a9e2a7;
    stim[48] = 71'h1220420c5e64561e2f;
    stim[49] = 71'h201851756ba7009568;
    stim[50] = 71'h3e932e0ad8be961d54;
    stim[51] = 71'h22d5611d4f8eb96af7;
    stim[52] = 71'h07a8dc35ac96f056a1;
    stim[53] = 71'h208fdaa5c209920912;
    stim[54] = 71'h2f3130408a9f0fb47d;
    stim[55] = 71'h0e83341b7a2ffef872;
    stim[56] = 71'h2223569ed4728c2c3d;
    stim[57] = 71'h04a2192d0d4164cab4;
    stim[58] = 71'h21c65aa2ee8311539a;
    stim[59] = 71'h0c3df08cdf6117719c;
    stim[60] = 71'h2a056406ab50f94f1a;
    stim[61] = 71'h66b35c0462465bcdb0;
    stim[62] = 71'h3ea15acb32f297def1;
    stim[63] = 71'h3328021ecb35f459fe;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'h70a60bb3xxxxxxxxe36c8aeexxxxxxxx;
      expv[2] = 128'hxxxxxxxx2a094b50e36c8aee2a094b50;
      expv[3] = 128'hb9b965fa2a094b50c976aa0fc976aa0f;
      expv[4] = 128'hb9b965fac1980804c976aa0fc1980804;
      expv[5] = 128'hf3445a47c19808048ff707848ff70784;
      expv[6] = 128'hf4f80370c1980804f334d368f334d368;
      expv[7] = 128'hf4f80370f4166b6cf334d368f334d368;
      expv[8] = 128'hf4f80370f4166b6cf334d368f334d368;
      expv[9] = 128'h3377bf7cf4166b6c5331dedff4166b6c;
      expv[10] = 128'hd2bbf1a9f4166b6c757efea7757efea7;
      expv[11] = 128'h04244199f4166b6c9a8bef399a8bef39;
      expv[12] = 128'h04244199f4166b6c9a8bef399a8bef39;
      expv[13] = 128'hfbdfc27ecf581869c3ab17f6cf581869;
      expv[14] = 128'h4585d812cf581869f83dc6d3cf581869;
      expv[15] = 128'h44f6559bcf581869e8fed90acf581869;
      expv[16] = 128'h5dd8547acf581869857dd2a9cf581869;
      expv[17] = 128'h5dd8547acf581869857dd2a9cf581869;
      expv[18] = 128'hxxxxxxxxcf581869857dd2a9cf581869;
      expv[19] = 128'hd0662bf4xxxxxxxxb331a1c4b331a1c4;
      expv[20] = 128'h8fac97c3c1cbe6dc2847335e2847335e;
      expv[21] = 128'hc1cbe6dcdbf9e5902847335edbf9e590;
      expv[22] = 128'h37cc11aedbf9e590b7ddb5f1b7ddb5f1;
      expv[23] = 128'h37cc11aedbf9e590b7ddb5f1dbf9e590;
      expv[24] = 128'h0b3cff6df7d4e3cf2a723b8a2a723b8a;
      expv[25] = 128'h2058286a1ad79d7bf6fa393bf6fa393b;
      expv[26] = 128'h49b6179a0ba930d2f6fa393b0ba930d2;
      expv[27] = 128'he1065b2d0ba930d2cd23755a0ba930d2;
      expv[28] = 128'h2b382ca8d714e8437c8a4b73d714e843;
      expv[29] = 128'h2b382ca853e13c0d7c8a4b7353e13c0d;
      expv[30] = 128'h2b382ca853e13c0d7c8a4b737c8a4b73;
      expv[31] = 128'h0e4b1ff153e13c0db6cb8e72b6cb8e72;
      expv[32] = 128'h0e4b1ff1e28b5731b6cb8e72b6cb8e72;
      expv[33] = 128'h945eb603e28b5731702fc405e28b5731;
      expv[34] = 128'hbfcda00502473d0408de13a202473d04;
      expv[35] = 128'h430fb295e455d9d35f52acbae455d9d3;
      expv[36] = 128'h4415305b51312fa7fffdc9eefffdc9ee;
      expv[37] = 128'h51312fa751312fa7fffdc9eefffdc9ee;
      expv[38] = 128'h51312fa728977ccafffdc9ee28977cca;
      expv[39] = 128'h0baccf5028977cca7a2e695528977cca;
      expv[40] = 128'h7ec384e928977ccad277452228977cca;
      expv[41] = 128'hf353c72e28977ccab4aa0320b4aa0320;
      expv[42] = 128'hf353c72e28977cca76003f1328977cca;
      expv[43] = 128'hd6a4d25134aa0320bcd99fbbbcd99fbb;
      expv[44] = 128'hdd9e3c17c9bf3906630d4a6ac9bf3906;
      expv[45] = 128'hdd9e3c172055c340630d4a6a2055c340;
      expv[46] = 128'hdd9e3c172055c3402055c3402055c340;
      expv[47] = 128'h40f0ff862055c340c5a68d7e2055c340;
      expv[48] = 128'h40f0ff86034bc6822055c3402055c340;
      expv[49] = 128'h034bc682034bc6822055c340034bc682;
      expv[50] = 128'h1851756b034bc682a7009568a7009568;
      expv[51] = 128'h932e0ad8dfa90569be961d54be961d54;
      expv[52] = 128'hd5611d4fdfa905698eb96af78eb96af7;
      expv[53] = 128'hd5611d4fb20d44238eb96af7b20d4423;
      expv[54] = 128'h8fdaa5c2b20d44230992091209920912;
      expv[55] = 128'h3130408accb6576a9f0fb47d9f0fb47d;
      expv[56] = 128'h3130408ae81ffa830cef28700cef2870;
      expv[57] = 128'h23569ed4e81ffa83728c2c3de81ffa83;
      expv[58] = 128'h23569ed44af16588728c2c3d4af16588;
      expv[59] = 128'hc65aa2ee4af165888311539a4af16588;
      expv[60] = 128'hc65aa2eea4b5fb443fc804463fc80446;
      expv[61] = 128'h056406aba4b5fb4450f94f1a50f94f1a;
      expv[62] = 128'hb35c04622b2eaae2465bcdb0465bcdb0;
      expv[63] = 128'ha15acb32fcdbe909f297def1f297def1;
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
