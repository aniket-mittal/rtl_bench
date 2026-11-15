// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09780 dut (
    .clk(clk),
    .rstn(in_vec[48:48]),
    .tic_divide(in_vec[47:24]),
    .accum_divide(in_vec[23:0]),
    .pre_tic_enable(out_vec[51:51]),
    .tic_enable(out_vec[50:50]),
    .accum_enable(out_vec[49:49]),
    .accum_sample_enable(out_vec[48:48]),
    .tic_count(out_vec[47:24]),
    .accum_count(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h062e6a957b429;
    stim[1] = 49'h04c01920513ce;
    stim[2] = 49'h1afea856e3994;
    stim[3] = 49'h1449da39f9055;
    stim[4] = 49'h13a65eff2ed17;
    stim[5] = 49'h1047c3b5b78aa;
    stim[6] = 49'h11cc288243492;
    stim[7] = 49'h143a4b194d314;
    stim[8] = 49'h17133ba920226;
    stim[9] = 49'h13923ebe9bd83;
    stim[10] = 49'h1c8a93a4313c2;
    stim[11] = 49'h1b3e0a6b31a2d;
    stim[12] = 49'h1a4bc09f3b339;
    stim[13] = 49'h1257d3a86f41a;
    stim[14] = 49'h182444fca46ef;
    stim[15] = 49'h1a9b989eee3e2;
    stim[16] = 49'h1ae04c64c7a80;
    stim[17] = 49'h107657e928c5d;
    stim[18] = 49'h1f02e4de856b9;
    stim[19] = 49'h1f87a2c7f670b;
    stim[20] = 49'h10225d0b0bc7f;
    stim[21] = 49'h12f1e9b6e739d;
    stim[22] = 49'h120057abaccff;
    stim[23] = 49'h160e4ee97d26c;
    stim[24] = 49'h1bbb3de7ac808;
    stim[25] = 49'h1842037c9a407;
    stim[26] = 49'h19c080a07c827;
    stim[27] = 49'h16c2c6a2fbe4c;
    stim[28] = 49'h17d9c3fd9a453;
    stim[29] = 49'h1bc0aca3bb189;
    stim[30] = 49'h199b92f917e26;
    stim[31] = 49'h129828ee0e162;
    stim[32] = 49'h17c519f5fe5d9;
    stim[33] = 49'h159c324c49e8f;
    stim[34] = 49'h1f3d0b2fc5da0;
    stim[35] = 49'h1fe062daabdb9;
    stim[36] = 49'h16c32b87ff7e0;
    stim[37] = 49'h1c9e61d8d9c63;
    stim[38] = 49'h1e26774f9f538;
    stim[39] = 49'h1b94851cfdeab;
    stim[40] = 49'h19f2cd0935349;
    stim[41] = 49'h1cbf887be4702;
    stim[42] = 49'h1f8fe6a4fbe24;
    stim[43] = 49'h1071f01f43d21;
    stim[44] = 49'h1b532ea52cfb4;
    stim[45] = 49'h19976e8dec460;
    stim[46] = 49'h1dea849fbbcad;
    stim[47] = 49'h118d034acfa60;
    stim[48] = 49'h18d6bac616856;
    stim[49] = 49'h1e6d3c40365ee;
    stim[50] = 49'h17c76fca66bc8;
    stim[51] = 49'h10037d852acf6;
    stim[52] = 49'h198cf4fc65031;
    stim[53] = 49'h141887a7221b5;
    stim[54] = 49'h15eaad7f67183;
    stim[55] = 49'h100fd11fe7b5c;
    stim[56] = 49'h17174aff54d29;
    stim[57] = 49'h17ac5bf9d852e;
    stim[58] = 49'h13c41ec010e4a;
    stim[59] = 49'h181fd30704e38;
    stim[60] = 49'h1b3359f62fb04;
    stim[61] = 49'h1d1ce1ca36de2;
    stim[62] = 49'h1558596013a06;
    stim[63] = 49'h10c17f765e5f1;
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
      expv[0] = 52'hxxxxxxxxxxxxx;
      expv[1] = 52'ha000000000000;
      expv[2] = 52'ha000000000000;
      expv[3] = 52'h5afea856e3994;
      expv[4] = 52'h0afea846e3993;
      expv[5] = 52'h0afea836e3992;
      expv[6] = 52'h0afea826e3991;
      expv[7] = 52'h0afea816e3990;
      expv[8] = 52'h1afea806e398f;
      expv[9] = 52'h0afea7f6e398e;
      expv[10] = 52'h0afea7e6e398d;
      expv[11] = 52'h0afea7d6e398c;
      expv[12] = 52'h0afea7c6e398b;
      expv[13] = 52'h1afea7b6e398a;
      expv[14] = 52'h0afea7a6e3989;
      expv[15] = 52'h0afea796e3988;
      expv[16] = 52'h0afea786e3987;
      expv[17] = 52'h0afea776e3986;
      expv[18] = 52'h1afea766e3985;
      expv[19] = 52'h0afea756e3984;
      expv[20] = 52'h0afea746e3983;
      expv[21] = 52'h0afea736e3982;
      expv[22] = 52'h0afea726e3981;
      expv[23] = 52'h1afea716e3980;
      expv[24] = 52'h0afea706e397f;
      expv[25] = 52'h0afea6f6e397e;
      expv[26] = 52'h0afea6e6e397d;
      expv[27] = 52'h0afea6d6e397c;
      expv[28] = 52'h1afea6c6e397b;
      expv[29] = 52'h0afea6b6e397a;
      expv[30] = 52'h0afea6a6e3979;
      expv[31] = 52'h0afea696e3978;
      expv[32] = 52'h0afea686e3977;
      expv[33] = 52'h1afea676e3976;
      expv[34] = 52'h0afea666e3975;
      expv[35] = 52'h0afea656e3974;
      expv[36] = 52'h0afea646e3973;
      expv[37] = 52'h0afea636e3972;
      expv[38] = 52'h1afea626e3971;
      expv[39] = 52'h0afea616e3970;
      expv[40] = 52'h0afea606e396f;
      expv[41] = 52'h0afea5f6e396e;
      expv[42] = 52'h0afea5e6e396d;
      expv[43] = 52'h1afea5d6e396c;
      expv[44] = 52'h0afea5c6e396b;
      expv[45] = 52'h0afea5b6e396a;
      expv[46] = 52'h0afea5a6e3969;
      expv[47] = 52'h0afea596e3968;
      expv[48] = 52'h1afea586e3967;
      expv[49] = 52'h0afea576e3966;
      expv[50] = 52'h0afea566e3965;
      expv[51] = 52'h0afea556e3964;
      expv[52] = 52'h0afea546e3963;
      expv[53] = 52'h1afea536e3962;
      expv[54] = 52'h0afea526e3961;
      expv[55] = 52'h0afea516e3960;
      expv[56] = 52'h0afea506e395f;
      expv[57] = 52'h0afea4f6e395e;
      expv[58] = 52'h1afea4e6e395d;
      expv[59] = 52'h0afea4d6e395c;
      expv[60] = 52'h0afea4c6e395b;
      expv[61] = 52'h0afea4b6e395a;
      expv[62] = 52'h0afea4a6e3959;
      expv[63] = 52'h1afea496e3958;
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
