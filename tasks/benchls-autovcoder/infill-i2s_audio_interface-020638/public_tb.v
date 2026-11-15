// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020638 dut (
    .xclk_i(clk),
    .reset_n(in_vec[65:65]),
    .right_i(in_vec[64:33]),
    .left_i(in_vec[32:1]),
    .adcdat_i(in_vec[0:0]),
    .right_o(out_vec[69:38]),
    .left_o(out_vec[37:6]),
    .ready_o(out_vec[5:5]),
    .xck_o(out_vec[4:4]),
    .bclk_o(out_vec[3:3]),
    .daclrck_o(out_vec[2:2]),
    .dacdat_o(out_vec[1:1]),
    .adclrck_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h14feabfcf0dda30a8;
    stim[1] = 66'h15428044cb24fb720;
    stim[2] = 66'h2fb41364f4c684f4e;
    stim[3] = 66'h3398731c7841ed47d;
    stim[4] = 66'h221b2fb064b7d8d9f;
    stim[5] = 66'h3c5e1bfd626aac688;
    stim[6] = 66'h200566fa00bc532a6;
    stim[7] = 66'h2c050e7051330b02c;
    stim[8] = 66'h216fb1fc9088bc125;
    stim[9] = 66'h3f520ef31d6002a40;
    stim[10] = 66'h34f8f8e54479539e3;
    stim[11] = 66'h3f14f18441c33e3c0;
    stim[12] = 66'h3058d89a45188d25f;
    stim[13] = 66'h28193017f048d332c;
    stim[14] = 66'h2a4835964e4714937;
    stim[15] = 66'h3864c630426a08b6e;
    stim[16] = 66'h3b590985c74ce2509;
    stim[17] = 66'h2398dece3f9cec2fa;
    stim[18] = 66'h2d1731284e34b4da8;
    stim[19] = 66'h39bba78ade0466eab;
    stim[20] = 66'h3b0453674d549bda2;
    stim[21] = 66'h2a8b59423d1a44567;
    stim[22] = 66'h20a981ab375bd732c;
    stim[23] = 66'h2fdcebdb7b5cb98bb;
    stim[24] = 66'h236e6a38e3fbf2acc;
    stim[25] = 66'h2c9be04e7b3829d40;
    stim[26] = 66'h22ba3f7f58a7ae041;
    stim[27] = 66'h33f5509e9386d6fcc;
    stim[28] = 66'h283ae06e15dfce7de;
    stim[29] = 66'h2a380c20b92dfc76f;
    stim[30] = 66'h2fdebdf6049852a1f;
    stim[31] = 66'h24b3d4d3e24f6bcc9;
    stim[32] = 66'h30df158ec32d1b654;
    stim[33] = 66'h278429934e2f99726;
    stim[34] = 66'h264a6df0bef8a5eb4;
    stim[35] = 66'h39c57ae5712e2a58b;
    stim[36] = 66'h23f06c3231a227f12;
    stim[37] = 66'h2b82ae791aafb614f;
    stim[38] = 66'h2fc57b75ad2b2b61d;
    stim[39] = 66'h2e9ec3b8db35790e8;
    stim[40] = 66'h2f854afe6c7c7fa76;
    stim[41] = 66'h391d32edb2aa1fe6a;
    stim[42] = 66'h2068b1f01e283dc96;
    stim[43] = 66'h338482ba6c3c18b8c;
    stim[44] = 66'h3957ce2d9ba889477;
    stim[45] = 66'h35c28241ed0077a99;
    stim[46] = 66'h393f75ef2945be0c8;
    stim[47] = 66'h3ca73637317b3d8f4;
    stim[48] = 66'h1ff755b4b8f440a22;
    stim[49] = 66'h3d7d740814f0a9808;
    stim[50] = 66'h279cffdae39e0b00a;
    stim[51] = 66'h360308fd41427980f;
    stim[52] = 66'h243dec849f3d78128;
    stim[53] = 66'h229d701f30d79e005;
    stim[54] = 66'h3cbed0775d7c462f3;
    stim[55] = 66'h3f8d1af380f07c4ca;
    stim[56] = 66'h24b199c9d2b7ae389;
    stim[57] = 66'h267d0a63e8cf9659b;
    stim[58] = 66'h201d653a6f75074d9;
    stim[59] = 66'h2419eb1d453de3cae;
    stim[60] = 66'h3c9ef45980b8433c3;
    stim[61] = 66'h2e7460b7533de56be;
    stim[62] = 66'h32e0fabcbb128af4b;
    stim[63] = 66'h37e4ed9b52ed18495;
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
      expv[0] = 70'h00000000000000000d;
      expv[1] = 70'h00000000000000000d;
      expv[2] = 70'h00000000000000000d;
      expv[3] = 70'h000000000000000027;
      expv[4] = 70'h00000000000000000f;
      expv[5] = 70'h000000000000000005;
      expv[6] = 70'h00000000000000000d;
      expv[7] = 70'h000000000000000007;
      expv[8] = 70'h00000000000000000f;
      expv[9] = 70'h000000000000000005;
      expv[10] = 70'h00000000000000000d;
      expv[11] = 70'h000000000000000005;
      expv[12] = 70'h00000000000000000d;
      expv[13] = 70'h000000000000000007;
      expv[14] = 70'h00000000000000000f;
      expv[15] = 70'h000000000000000007;
      expv[16] = 70'h00000000000000000f;
      expv[17] = 70'h000000000000000005;
      expv[18] = 70'h00000000000000000d;
      expv[19] = 70'h000000000000000005;
      expv[20] = 70'h00000000000000000d;
      expv[21] = 70'h000000000000000005;
      expv[22] = 70'h00000000000000000d;
      expv[23] = 70'h000000000000000007;
      expv[24] = 70'h00000000000000000f;
      expv[25] = 70'h000000000000000007;
      expv[26] = 70'h00000000000000000f;
      expv[27] = 70'h000000000000000005;
      expv[28] = 70'h00000000000000000d;
      expv[29] = 70'h000000000000000007;
      expv[30] = 70'h00000000000000000f;
      expv[31] = 70'h000000000000000005;
      expv[32] = 70'h00000000000000000d;
      expv[33] = 70'h000000000000000005;
      expv[34] = 70'h00000000000000000d;
      expv[35] = 70'h000000000000000005;
      expv[36] = 70'h00000000000000000d;
      expv[37] = 70'h000000000000000005;
      expv[38] = 70'h00000000000000000d;
      expv[39] = 70'h000000000000000007;
      expv[40] = 70'h00000000000000000f;
      expv[41] = 70'h000000000000000005;
      expv[42] = 70'h00000000000000000d;
      expv[43] = 70'h000000000000000005;
      expv[44] = 70'h00000000000000000d;
      expv[45] = 70'h000000000000000007;
      expv[46] = 70'h00000000000000000f;
      expv[47] = 70'h000000000000000007;
      expv[48] = 70'h00000000000000000f;
      expv[49] = 70'h00000000000000000d;
      expv[50] = 70'h000000000000000027;
      expv[51] = 70'h00000000000000000f;
      expv[52] = 70'h000000000000000005;
      expv[53] = 70'h00000000000000000d;
      expv[54] = 70'h000000000000000007;
      expv[55] = 70'h00000000000000000f;
      expv[56] = 70'h000000000000000005;
      expv[57] = 70'h00000000000000000d;
      expv[58] = 70'h000000000000000005;
      expv[59] = 70'h00000000000000000d;
      expv[60] = 70'h000000000000000007;
      expv[61] = 70'h00000000000000000f;
      expv[62] = 70'h000000000000000007;
      expv[63] = 70'h00000000000000000f;
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
