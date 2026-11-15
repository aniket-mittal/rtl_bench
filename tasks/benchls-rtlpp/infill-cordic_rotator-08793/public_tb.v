// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08793 dut (
    .clock(clk),
    .angle(in_vec[63:32]),
    .Xin(in_vec[31:16]),
    .Yin(in_vec[15:0]),
    .Xout(out_vec[33:17]),
    .Yout(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h8e6774bdf8d01cac;
    stim[1] = 64'hd96f9ca750cc723a;
    stim[2] = 64'h4d99a0144af50735;
    stim[3] = 64'he77f1eec6099dc99;
    stim[4] = 64'he6f3e215a5922ca2;
    stim[5] = 64'hb31740395f6fcf37;
    stim[6] = 64'h8915d3fb618372f2;
    stim[7] = 64'h7893b97c08dfcba1;
    stim[8] = 64'hcb779b0c2516df71;
    stim[9] = 64'h4c91b6b3fb580a63;
    stim[10] = 64'h595ee9fc164f4b80;
    stim[11] = 64'h373e5cccd15e439d;
    stim[12] = 64'hc88a5bf4364c7f4b;
    stim[13] = 64'hcf7fb5b82ecde670;
    stim[14] = 64'hc07eb34bdfae3693;
    stim[15] = 64'h81d3869ac0b0c1c9;
    stim[16] = 64'h7f3992c540157b50;
    stim[17] = 64'h153321a3af1859e0;
    stim[18] = 64'h70b5cc43fd160781;
    stim[19] = 64'h44e54fa66d98d141;
    stim[20] = 64'had6271cd5fff8719;
    stim[21] = 64'ha9ce0989db68224a;
    stim[22] = 64'h54c8c472174203a0;
    stim[23] = 64'hbec670f70e36f60f;
    stim[24] = 64'h5bc417156906c78a;
    stim[25] = 64'h0a027be06b1a2e27;
    stim[26] = 64'h9be9a392163ba506;
    stim[27] = 64'h1c8508b20a15a9a0;
    stim[28] = 64'hbc4ce687d02a9e6b;
    stim[29] = 64'h80bcdbb4150d974a;
    stim[30] = 64'he52a8ee0d54686fa;
    stim[31] = 64'ha9876c06839af12e;
    stim[32] = 64'hcd2b7e3dd6478dee;
    stim[33] = 64'hd7146f8f4aa533a0;
    stim[34] = 64'hd11459689e6a5c56;
    stim[35] = 64'hecad5800e21cfe47;
    stim[36] = 64'h6743ad0606288797;
    stim[37] = 64'h17012455901c728d;
    stim[38] = 64'h75c647309d191a24;
    stim[39] = 64'hc1acfa3e11e4ebf9;
    stim[40] = 64'h6e4f5330246a1140;
    stim[41] = 64'ha7a89264795a3d8c;
    stim[42] = 64'h960c3cb74d0ecc8d;
    stim[43] = 64'h78adb063b99e2551;
    stim[44] = 64'hb65880b4069843c3;
    stim[45] = 64'ha8c35954fdecd507;
    stim[46] = 64'h529f02e4f5fe2ea5;
    stim[47] = 64'hb480d654f07279ea;
    stim[48] = 64'hf4d5e0371c05fb75;
    stim[49] = 64'h893de45e8eb7adde;
    stim[50] = 64'h7688e1761f7c5e73;
    stim[51] = 64'ha1d80d239904c458;
    stim[52] = 64'h3786685a13312581;
    stim[53] = 64'h0548aae362a61b9c;
    stim[54] = 64'h8d9f3f83ebf74d09;
    stim[55] = 64'h2658427a84206726;
    stim[56] = 64'ha49d118cbaa85d3d;
    stim[57] = 64'hfbeb976ad274e74d;
    stim[58] = 64'hcebfab168e08ed8e;
    stim[59] = 64'h04ceefe868e4dba2;
    stim[60] = 64'h8361d729337f6f6a;
    stim[61] = 64'h50de2d28b8415610;
    stim[62] = 64'hd616f3d502b532d0;
    stim[63] = 64'hc094af5da1ab53b8;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'hxxxxxxxxx;
      expv[6] = 34'hxxxxxxxxx;
      expv[7] = 34'hxxxxxxxxx;
      expv[8] = 34'hxxxxxxxxx;
      expv[9] = 34'hxxxxxxxxx;
      expv[10] = 34'hxxxxxxxxx;
      expv[11] = 34'hxxxxxxxxx;
      expv[12] = 34'hxxxxxxxxx;
      expv[13] = 34'hxxxxxxxxx;
      expv[14] = 34'hxxxxxxxxx;
      expv[15] = 34'hxxxxxxxxx;
      expv[16] = 34'h036e5d7cd;
      expv[17] = 34'h1ccd00200;
      expv[18] = 34'h398b070bf;
      expv[19] = 34'h0c46175ec;
      expv[20] = 34'h3617691ee;
      expv[21] = 34'h3056183b5;
      expv[22] = 34'h31a8323e5;
      expv[23] = 34'h002885778;
      expv[24] = 34'h3bae7b673;
      expv[25] = 34'h3e411f37f;
      expv[26] = 34'h30b2dd556;
      expv[27] = 34'h305b5ccb7;
      expv[28] = 34'h1bf47d42e;
      expv[29] = 34'h3eb09a8d2;
      expv[30] = 34'h0b274364e;
      expv[31] = 34'h0c7246b03;
      expv[32] = 34'h3254736f8;
      expv[33] = 34'h285ac3e2b;
      expv[34] = 34'h3ffdbf2bf;
      expv[35] = 34'h06d9ebc65;
      expv[36] = 34'h20f2bc9fa;
      expv[37] = 34'h09f061647;
      expv[38] = 34'h3d0301e82;
      expv[39] = 34'h3dddfe91b;
      expv[40] = 34'h3b68cc0e3;
      expv[41] = 34'h13130749d;
      expv[42] = 34'h309ba5cd6;
      expv[43] = 34'h0d0ab9dea;
      expv[44] = 34'h2ce365d05;
      expv[45] = 34'h3b46cabc9;
      expv[46] = 34'h29cc18d75;
      expv[47] = 34'h0ad0ebb4a;
      expv[48] = 34'h2701c057a;
      expv[49] = 34'h11371c5e5;
      expv[50] = 34'h092f4d0ae;
      expv[51] = 34'h3a5d613f2;
      expv[52] = 34'h0d196a8a3;
      expv[53] = 34'h1fece3f67;
      expv[54] = 34'h1262daddc;
      expv[55] = 34'h3c085e134;
      expv[56] = 34'h37b49ff76;
      expv[57] = 34'h3c6c721c0;
      expv[58] = 34'h2cf300742;
      expv[59] = 34'h0ce1baed5;
      expv[60] = 34'h0d3d9db3e;
      expv[61] = 34'h38c942911;
      expv[62] = 34'h384b1cf52;
      expv[63] = 34'h18febe0b6;
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
