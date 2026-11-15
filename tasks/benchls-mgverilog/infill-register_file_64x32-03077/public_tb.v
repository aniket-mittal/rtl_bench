// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03077 dut (
    .clk(clk),
    .r0(in_vec[50:45]),
    .r1(in_vec[44:39]),
    .rw(in_vec[38:33]),
    .dw(in_vec[32:1]),
    .we(in_vec[0:0]),
    .d0(out_vec[63:32]),
    .d1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h4b2f30e749d09;
    stim[1] = 51'h48e3c2c654834;
    stim[2] = 51'h7318bc825d441;
    stim[3] = 51'h43d8a7e213fc4;
    stim[4] = 51'h0143c20ff70f2;
    stim[5] = 51'h7988c112a218f;
    stim[6] = 51'h46f5831408af2;
    stim[7] = 51'h1609be64a0fdc;
    stim[8] = 51'h54b98e6c0a44a;
    stim[9] = 51'h35d2598c3aea8;
    stim[10] = 51'h0f6680481a90c;
    stim[11] = 51'h5c57ab067f344;
    stim[12] = 51'h703cbaf163cc1;
    stim[13] = 51'h383319f8753a0;
    stim[14] = 51'h5d327dd16550b;
    stim[15] = 51'h51b23b64dac24;
    stim[16] = 51'h2938b7d79909f;
    stim[17] = 51'h330cc85494900;
    stim[18] = 51'h4244642ab3bfa;
    stim[19] = 51'h2e3fa7bce6b92;
    stim[20] = 51'h2c835cbc84177;
    stim[21] = 51'h6457774cc2fa0;
    stim[22] = 51'h519dd2c703584;
    stim[23] = 51'h3e32b6aaae22c;
    stim[24] = 51'h1bcbc540128e4;
    stim[25] = 51'h0caa44668a8cf;
    stim[26] = 51'h6bd77fbfd3cb5;
    stim[27] = 51'h4e55275514975;
    stim[28] = 51'h56a1395757d0c;
    stim[29] = 51'h2db75bfdbd409;
    stim[30] = 51'h2d1d121fdf9e5;
    stim[31] = 51'h17dfbd705530e;
    stim[32] = 51'h163311d5b4674;
    stim[33] = 51'h65ac4a4929861;
    stim[34] = 51'h26ab99afde8e3;
    stim[35] = 51'h6e9a09428babe;
    stim[36] = 51'h1a892d670f4fb;
    stim[37] = 51'h59ade3b4b233c;
    stim[38] = 51'h06a544df34763;
    stim[39] = 51'h75dfd96fcf123;
    stim[40] = 51'h2f898d03df819;
    stim[41] = 51'h68d972ea9ce58;
    stim[42] = 51'h11d5e98b9b4bd;
    stim[43] = 51'h684dcecb36a6f;
    stim[44] = 51'h7bdf65e19e12d;
    stim[45] = 51'h6757401599ea5;
    stim[46] = 51'h4c9e321105023;
    stim[47] = 51'h68e4f74575d2e;
    stim[48] = 51'h799502e281f06;
    stim[49] = 51'h7cb568afa0ac8;
    stim[50] = 51'h604cdb004f3f6;
    stim[51] = 51'h261da40ed62d6;
    stim[52] = 51'h7870edea82177;
    stim[53] = 51'h12f5c5461f422;
    stim[54] = 51'h77c3be4621ac8;
    stim[55] = 51'h33205d342af7d;
    stim[56] = 51'h60e10b43db905;
    stim[57] = 51'h3272ee60c234a;
    stim[58] = 51'h7902a1e5a9cf8;
    stim[59] = 51'h15481d1a04df2;
    stim[60] = 51'h76dd0b8cecb58;
    stim[61] = 51'h77a3d2076e2f1;
    stim[62] = 51'h3243da3d4e203;
    stim[63] = 51'h2f8e589275a0c;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxx089510c7;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'hxxxxxxxx089510c7;
      expv[25] = 64'hxxxxxxxx873a4e84;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxxfdfe9e5a;
      expv[33] = 64'hxxxxxxxx089510c7;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxee8b2a85;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'hxxxxxxxxxxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxfdfe9e5a;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'hxxxxxxxxxxxxxxxx;
      expv[43] = 64'hxxxxxxxxdfedea04;
      expv[44] = 64'hxxxxxxxx6b387a7d;
      expv[45] = 64'hxxxxxxxxfdfe9e5a;
      expv[46] = 64'hxxxxxxxx26f9a3b1;
      expv[47] = 64'hxxxxxxxxee8b2a85;
      expv[48] = 64'hxxxxxxxxcd7ef471;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'hcb7e7891xxxxxxxx;
      expv[51] = 64'hxxxxxxxx6b387a7d;
      expv[52] = 64'hee8b2a85xxxxxxxx;
      expv[53] = 64'hee8b2a85xxxxxxxx;
      expv[54] = 64'h6b387a7dxxxxxxxx;
      expv[55] = 64'h2f0cf096xxxxxxxx;
      expv[56] = 64'h2f0cf096xxxxxxxx;
      expv[57] = 64'h2f0cf096cd7ef471;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxx3aa8a4ba;
      expv[61] = 64'h2f0cf096xxxxxxxx;
      expv[62] = 64'h2f0cf096xxxxxxxx;
      expv[63] = 64'h2f0cf0965a1edc82;
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
