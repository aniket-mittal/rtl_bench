// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05559 dut (
    .clock(clk),
    .reset(in_vec[50:50]),
    .ngreset(in_vec[49:49]),
    .strobeData(in_vec[48:48]),
    .X0(in_vec[47:36]),
    .Y0(in_vec[35:24]),
    .A0(in_vec[23:12]),
    .aRom(in_vec[11:0]),
    .XN(out_vec[35:24]),
    .YN(out_vec[23:12]),
    .AN(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h792011ba25d8f;
    stim[1] = 51'h52ffa5d681f90;
    stim[2] = 51'h315cae40914a4;
    stim[3] = 51'h4a669fe64b8f7;
    stim[4] = 51'h389529cf04e19;
    stim[5] = 51'h33c40041984e3;
    stim[6] = 51'h49ea647ae38dc;
    stim[7] = 51'h25d18961a7b88;
    stim[8] = 51'h0bf5b2f4e4115;
    stim[9] = 51'h28eda31b85522;
    stim[10] = 51'h1bbc2388b58fa;
    stim[11] = 51'h3d4696a51cb20;
    stim[12] = 51'h35a5dba18f3f9;
    stim[13] = 51'h0d395e8dbaad7;
    stim[14] = 51'h5e6362a6b20ea;
    stim[15] = 51'h13c6b40fb608f;
    stim[16] = 51'h249b7fe8d0476;
    stim[17] = 51'h2eeb4653ad53c;
    stim[18] = 51'h1cce8aba4e24f;
    stim[19] = 51'h0b92efa6550f6;
    stim[20] = 51'h25db16070b355;
    stim[21] = 51'h1fcf6b5403944;
    stim[22] = 51'h1fe650fc9caf4;
    stim[23] = 51'h26a4089a0b024;
    stim[24] = 51'h2ef2d4f81c223;
    stim[25] = 51'h0f1675d4ab583;
    stim[26] = 51'h207cae5878f4f;
    stim[27] = 51'h36fb895f0900b;
    stim[28] = 51'h3fcfceae01a7d;
    stim[29] = 51'h3fe549824714f;
    stim[30] = 51'h1fadcdd0d96aa;
    stim[31] = 51'h32be18aa6625b;
    stim[32] = 51'h0ce60951bf862;
    stim[33] = 51'h1796257572ea7;
    stim[34] = 51'h1371856ccf97d;
    stim[35] = 51'h20823cdf915cc;
    stim[36] = 51'h36ef5e056cfc5;
    stim[37] = 51'h3ef122e93823b;
    stim[38] = 51'h21f2fdfc01ac8;
    stim[39] = 51'h322ec4a6b824d;
    stim[40] = 51'h3651715b2a615;
    stim[41] = 51'h12cba704cbf02;
    stim[42] = 51'h37d43467514bd;
    stim[43] = 51'h05ede6f539b4a;
    stim[44] = 51'h262977b8e335a;
    stim[45] = 51'h1d638f5c314f0;
    stim[46] = 51'h0c67d3a3e0a1e;
    stim[47] = 51'h06ab5ad69919c;
    stim[48] = 51'h140e2fa6a8012;
    stim[49] = 51'h0fca4f512bbae;
    stim[50] = 51'h3e3876f24268d;
    stim[51] = 51'h24aae80d90ec1;
    stim[52] = 51'h384f9817d888b;
    stim[53] = 51'h34b2c21963f05;
    stim[54] = 51'h3c0b5b781385e;
    stim[55] = 51'h1ca51a55e0bf5;
    stim[56] = 51'h009ea7cc027d4;
    stim[57] = 51'h126f2eb0421a2;
    stim[58] = 51'h000d626b85b6a;
    stim[59] = 51'h0b4839a640cb7;
    stim[60] = 51'h2ddc648d5f288;
    stim[61] = 51'h04fb1c646888a;
    stim[62] = 51'h2b645c5ce2986;
    stim[63] = 51'h0ddacda8c86c3;
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
      expv[0] = 36'h000000000;
      expv[1] = 36'h000000000;
      expv[2] = 36'h000000000;
      expv[3] = 36'h000000000;
      expv[4] = 36'h000000000;
      expv[5] = 36'hb31a07d1d;
      expv[6] = 36'h000000000;
      expv[7] = 36'h000000000;
      expv[8] = 36'h000000000;
      expv[9] = 36'h000000000;
      expv[10] = 36'h000000000;
      expv[11] = 36'h000000000;
      expv[12] = 36'h3dc6b09fc;
      expv[13] = 36'h000000000;
      expv[14] = 36'h000000000;
      expv[15] = 36'h000000000;
      expv[16] = 36'h000000000;
      expv[17] = 36'h000000000;
      expv[18] = 36'h000000000;
      expv[19] = 36'h000000000;
      expv[20] = 36'h000000000;
      expv[21] = 36'h000000000;
      expv[22] = 36'h000000000;
      expv[23] = 36'h000000000;
      expv[24] = 36'h000000000;
      expv[25] = 36'h000000000;
      expv[26] = 36'h000000000;
      expv[27] = 36'h000000000;
      expv[28] = 36'hf9019af14;
      expv[29] = 36'hcb9d1b87e;
      expv[30] = 36'h000000000;
      expv[31] = 36'h000000000;
      expv[32] = 36'h000000000;
      expv[33] = 36'h000000000;
      expv[34] = 36'h000000000;
      expv[35] = 36'h000000000;
      expv[36] = 36'h000000000;
      expv[37] = 36'h10fccf5a7;
      expv[38] = 36'h11f33db73;
      expv[39] = 36'h11f33db73;
      expv[40] = 36'h5e4e7846b;
      expv[41] = 36'h000000000;
      expv[42] = 36'h000000000;
      expv[43] = 36'h000000000;
      expv[44] = 36'h000000000;
      expv[45] = 36'h000000000;
      expv[46] = 36'h000000000;
      expv[47] = 36'h000000000;
      expv[48] = 36'h000000000;
      expv[49] = 36'h000000000;
      expv[50] = 36'h000000000;
      expv[51] = 36'h6c95a7bb5;
      expv[52] = 36'h6c95a7bb5;
      expv[53] = 36'hece1d0f4d;
      expv[54] = 36'h0d376f868;
      expv[55] = 36'h000000000;
      expv[56] = 36'h000000000;
      expv[57] = 36'h000000000;
      expv[58] = 36'h000000000;
      expv[59] = 36'h000000000;
      expv[60] = 36'h000000000;
      expv[61] = 36'h000000000;
      expv[62] = 36'h000000000;
      expv[63] = 36'h000000000;
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
