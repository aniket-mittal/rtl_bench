// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104137 dut (
    .clk(clk),
    .rst_n(in_vec[49:49]),
    .in_valid(in_vec[48:48]),
    .din_r(in_vec[47:24]),
    .din_i(in_vec[23:0]),
    .dout_r(out_vec[47:24]),
    .dout_i(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h1a3a5180825a5;
    stim[1] = 50'h0d4ec185ea4fa;
    stim[2] = 50'h21ac271f8c7f0;
    stim[3] = 50'h3a3909c7eac52;
    stim[4] = 50'h2b5708863d2a9;
    stim[5] = 50'h294e9393e3971;
    stim[6] = 50'h2deb70abdee1c;
    stim[7] = 50'h37c02027edf51;
    stim[8] = 50'h260d3555bfef8;
    stim[9] = 50'h2db6ef3c5cad0;
    stim[10] = 50'h35d07216ab7fb;
    stim[11] = 50'h3f05de0de3703;
    stim[12] = 50'h2bc4827a6b1a4;
    stim[13] = 50'h39f238e13bda2;
    stim[14] = 50'h30184264148f2;
    stim[15] = 50'h3932fa4f998fd;
    stim[16] = 50'h2f5a5a2f8f720;
    stim[17] = 50'h31b9c7aff7ea8;
    stim[18] = 50'h3add8e9a21a69;
    stim[19] = 50'h2f0995615fa60;
    stim[20] = 50'h3d1493274f57a;
    stim[21] = 50'h29a2a41ee3662;
    stim[22] = 50'h2b46357018b72;
    stim[23] = 50'h3d6a762f7abc2;
    stim[24] = 50'h2c2d765a581fd;
    stim[25] = 50'h21c54c2a81714;
    stim[26] = 50'h21c88953ea2e9;
    stim[27] = 50'h2e5f9f6a6d44f;
    stim[28] = 50'h25f729c348df0;
    stim[29] = 50'h2ce5c293df51b;
    stim[30] = 50'h25ccb2352d4c5;
    stim[31] = 50'h34e11b1c217a6;
    stim[32] = 50'h3619d89998223;
    stim[33] = 50'h21c4942b60ade;
    stim[34] = 50'h3cf110b85116f;
    stim[35] = 50'h2ac9d0daaa951;
    stim[36] = 50'h22bb5adcacfb6;
    stim[37] = 50'h3b1cb90b621fd;
    stim[38] = 50'h350c9bb8f4231;
    stim[39] = 50'h2dd3e320db23e;
    stim[40] = 50'h3a665a78c435d;
    stim[41] = 50'h2432160f97f7e;
    stim[42] = 50'h2815f7a35ff20;
    stim[43] = 50'h38f147081bdb6;
    stim[44] = 50'h2ae368dd243e7;
    stim[45] = 50'h22106aebec2f4;
    stim[46] = 50'h21a978722994d;
    stim[47] = 50'h3036e0af1386e;
    stim[48] = 50'h3a74ee4fe09f2;
    stim[49] = 50'h24d7a9e48d41f;
    stim[50] = 50'h2e0b2cd138efa;
    stim[51] = 50'h289a74a0fda01;
    stim[52] = 50'h2e47994d7968e;
    stim[53] = 50'h31e852cb0b312;
    stim[54] = 50'h3cdb9608048aa;
    stim[55] = 50'h2b00213338546;
    stim[56] = 50'h20f72efc8a678;
    stim[57] = 50'h32ae93bf71910;
    stim[58] = 50'h391cb55fc8301;
    stim[59] = 50'h3602c2d29b039;
    stim[60] = 50'h25f2e77cb7d42;
    stim[61] = 50'h2976c076d5caf;
    stim[62] = 50'h314736f6b21cb;
    stim[63] = 50'h2897ab332b822;
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
      expv[0] = 48'h000000000000;
      expv[1] = 48'h000000000000;
      expv[2] = 48'h000000000000;
      expv[3] = 48'h000000000000;
      expv[4] = 48'h000000000000;
      expv[5] = 48'h000000000000;
      expv[6] = 48'h000000000000;
      expv[7] = 48'h000000000000;
      expv[8] = 48'h000000000000;
      expv[9] = 48'h000000000000;
      expv[10] = 48'h000000000000;
      expv[11] = 48'ha3909c7eac52;
      expv[12] = 48'hb5708863d2a9;
      expv[13] = 48'h94e9393e3971;
      expv[14] = 48'hdeb70abdee1c;
      expv[15] = 48'h7c02027edf51;
      expv[16] = 48'h60d3555bfef8;
      expv[17] = 48'hdb6ef3c5cad0;
      expv[18] = 48'h5d07216ab7fb;
      expv[19] = 48'hf05de0de3703;
      expv[20] = 48'hbc4827a6b1a4;
      expv[21] = 48'h9f238e13bda2;
      expv[22] = 48'h0184264148f2;
      expv[23] = 48'h932fa4f998fd;
      expv[24] = 48'hf5a5a2f8f720;
      expv[25] = 48'h1b9c7aff7ea8;
      expv[26] = 48'hadd8e9a21a69;
      expv[27] = 48'hf0995615fa60;
      expv[28] = 48'hd1493274f57a;
      expv[29] = 48'h9a2a41ee3662;
      expv[30] = 48'hb46357018b72;
      expv[31] = 48'hd6a762f7abc2;
      expv[32] = 48'hc2d765a581fd;
      expv[33] = 48'h1c54c2a81714;
      expv[34] = 48'h1c88953ea2e9;
      expv[35] = 48'he5f9f6a6d44f;
      expv[36] = 48'h5f729c348df0;
      expv[37] = 48'hce5c293df51b;
      expv[38] = 48'h5ccb2352d4c5;
      expv[39] = 48'h4e11b1c217a6;
      expv[40] = 48'h619d89998223;
      expv[41] = 48'h1c4942b60ade;
      expv[42] = 48'hcf110b85116f;
      expv[43] = 48'hac9d0daaa951;
      expv[44] = 48'h2bb5adcacfb6;
      expv[45] = 48'hb1cb90b621fd;
      expv[46] = 48'h50c9bb8f4231;
      expv[47] = 48'hdd3e320db23e;
      expv[48] = 48'ha665a78c435d;
      expv[49] = 48'h432160f97f7e;
      expv[50] = 48'h815f7a35ff20;
      expv[51] = 48'h8f147081bdb6;
      expv[52] = 48'hae368dd243e7;
      expv[53] = 48'h2106aebec2f4;
      expv[54] = 48'h1a978722994d;
      expv[55] = 48'h036e0af1386e;
      expv[56] = 48'ha74ee4fe09f2;
      expv[57] = 48'h4d7a9e48d41f;
      expv[58] = 48'he0b2cd138efa;
      expv[59] = 48'h89a74a0fda01;
      expv[60] = 48'he47994d7968e;
      expv[61] = 48'h1e852cb0b312;
      expv[62] = 48'hcdb9608048aa;
      expv[63] = 48'hb00213338546;
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
