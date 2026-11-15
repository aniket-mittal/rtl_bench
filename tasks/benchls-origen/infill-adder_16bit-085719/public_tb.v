// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_085719 dut (
    .A(in_vec[32:17]),
    .B(in_vec[16:1]),
    .CI(in_vec[0:0]),
    .S(out_vec[17:2]),
    .CO(out_vec[1:1]),
    .OFL(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h00d0183bf;
    stim[1] = 33'h0f6e6b82d;
    stim[2] = 33'h0c71082a2;
    stim[3] = 33'h074e6635e;
    stim[4] = 33'h1ec05b422;
    stim[5] = 33'h0bdf8856d;
    stim[6] = 33'h19139660b;
    stim[7] = 33'h193d4fe00;
    stim[8] = 33'h0f486cd80;
    stim[9] = 33'h0b6a09999;
    stim[10] = 33'h17359d072;
    stim[11] = 33'h08abbfaa8;
    stim[12] = 33'h0968b22c3;
    stim[13] = 33'h15d953786;
    stim[14] = 33'h0a25d47b4;
    stim[15] = 33'h00a24884c;
    stim[16] = 33'h0ba84d313;
    stim[17] = 33'h0b2e3ebe7;
    stim[18] = 33'h1affa0afc;
    stim[19] = 33'h1f3234434;
    stim[20] = 33'h027d23fe5;
    stim[21] = 33'h1e414559e;
    stim[22] = 33'h1ff9e6f5c;
    stim[23] = 33'h1b4541d97;
    stim[24] = 33'h07877481a;
    stim[25] = 33'h01e98eb8b;
    stim[26] = 33'h11297f351;
    stim[27] = 33'h1aa3ff2e4;
    stim[28] = 33'h1c0cc6a1e;
    stim[29] = 33'h15d2a3b9d;
    stim[30] = 33'h0a99967af;
    stim[31] = 33'h0687209d9;
    stim[32] = 33'h062b0b595;
    stim[33] = 33'h13187282a;
    stim[34] = 33'h1305b17d5;
    stim[35] = 33'h0d020f43f;
    stim[36] = 33'h0a730f775;
    stim[37] = 33'h0a44b7c40;
    stim[38] = 33'h034b80fdc;
    stim[39] = 33'h159b88c81;
    stim[40] = 33'h05f74079e;
    stim[41] = 33'h1e668d12f;
    stim[42] = 33'h057d3c48a;
    stim[43] = 33'h11cd75c9c;
    stim[44] = 33'h0c26fdc22;
    stim[45] = 33'h04a24a552;
    stim[46] = 33'h172f3c5c1;
    stim[47] = 33'h11a5d7ac2;
    stim[48] = 33'h07f97b7f8;
    stim[49] = 33'h148a1c9e4;
    stim[50] = 33'h0462e2f5e;
    stim[51] = 33'h12805579c;
    stim[52] = 33'h1a9009fc2;
    stim[53] = 33'h1c6f0085c;
    stim[54] = 33'h100773e15;
    stim[55] = 33'h10ce44725;
    stim[56] = 33'h09ad0d5a3;
    stim[57] = 33'h12f57f68e;
    stim[58] = 33'h14601bbbe;
    stim[59] = 33'h03fe8f743;
    stim[60] = 33'h132620882;
    stim[61] = 33'h0fb20b89a;
    stim[62] = 33'h1f87494e8;
    stim[63] = 33'h056ee0180;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 18'h32180;
      expv[1] = 18'h35e29;
      expv[2] = 18'h29365;
      expv[3] = 18'h1b088;
      expv[4] = 18'h3404e;
      expv[5] = 18'h286cd;
      expv[6] = 18'h1ee8b;
      expv[7] = 18'h123aa;
      expv[8] = 18'h3840d;
      expv[9] = 18'h2a075;
      expv[10] = 18'h28796;
      expv[11] = 18'h10ac6;
      expv[12] = 18'h3729c;
      expv[13] = 18'h12a37;
      expv[14] = 18'h3d420;
      expv[15] = 18'h124e0;
      expv[16] = 18'h31b31;
      expv[17] = 18'h13d96;
      expv[18] = 18'h375ec;
      expv[19] = 18'h26eae;
      expv[20] = 18'h0cf70;
      expv[21] = 18'h07366;
      expv[22] = 18'h0ddf6;
      expv[23] = 18'h3a3d8;
      expv[24] = 18'h38120;
      expv[25] = 18'h21449;
      expv[26] = 18'h20bd2;
      expv[27] = 18'h33a46;
      expv[28] = 18'h055d6;
      expv[29] = 18'h33190;
      expv[30] = 18'h02292;
      expv[31] = 18'h0e498;
      expv[32] = 18'h2308d;
      expv[33] = 18'h0b363;
      expv[34] = 18'h09063;
      expv[35] = 18'h388c1;
      expv[36] = 18'h33d4d;
      expv[37] = 18'h04116;
      expv[38] = 18'h08928;
      expv[39] = 18'h3cc74;
      expv[40] = 18'h0ce24;
      expv[41] = 18'h16f32;
      expv[42] = 18'h038ba;
      expv[43] = 18'h0f2e7;
      expv[44] = 18'h13d22;
      expv[45] = 18'h1deec;
      expv[46] = 18'h2716a;
      expv[47] = 18'h12a3f;
      expv[48] = 18'h06f1e;
      expv[49] = 18'h2250a;
      expv[50] = 18'h0eb18;
      expv[51] = 18'h0ff43;
      expv[52] = 18'h09186;
      expv[53] = 18'h39e98;
      expv[54] = 18'h07d1b;
      expv[55] = 18'h2a814;
      expv[56] = 18'h2e0e9;
      expv[57] = 18'h24bca;
      expv[58] = 18'h2037e;
      expv[59] = 18'h26e59;
      expv[60] = 18'h275c8;
      expv[61] = 18'h36775;
      expv[62] = 18'h11aba;
      expv[63] = 18'h0b0dc;
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
