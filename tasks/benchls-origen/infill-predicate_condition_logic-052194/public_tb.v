// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052194 dut (
    .opUCmd(in_vec[25:17]),
    .opUIxt(in_vec[16:8]),
    .regInSr(in_vec[7:0]),
    .predBit(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h3307264;
    stim[1] = 26'h20ae23c;
    stim[2] = 26'h2c7d82d;
    stim[3] = 26'h3e703e9;
    stim[4] = 26'h27bb500;
    stim[5] = 26'h39584cc;
    stim[6] = 26'h376f2f1;
    stim[7] = 26'h154f05d;
    stim[8] = 26'h233091b;
    stim[9] = 26'h04dbeef;
    stim[10] = 26'h1785aab;
    stim[11] = 26'h0c34b7d;
    stim[12] = 26'h2e77c03;
    stim[13] = 26'h04bd431;
    stim[14] = 26'h0aea18b;
    stim[15] = 26'h0f86584;
    stim[16] = 26'h3ad5806;
    stim[17] = 26'h3f53d96;
    stim[18] = 26'h06bffc1;
    stim[19] = 26'h09cf5cb;
    stim[20] = 26'h35eac25;
    stim[21] = 26'h3bcc973;
    stim[22] = 26'h2d62073;
    stim[23] = 26'h0b80110;
    stim[24] = 26'h31dde19;
    stim[25] = 26'h0209e9a;
    stim[26] = 26'h175e18d;
    stim[27] = 26'h3025e95;
    stim[28] = 26'h3ed09f1;
    stim[29] = 26'h1ca62e3;
    stim[30] = 26'h16d9521;
    stim[31] = 26'h0f6bced;
    stim[32] = 26'h08c4483;
    stim[33] = 26'h0d798c3;
    stim[34] = 26'h291c66d;
    stim[35] = 26'h18eb06e;
    stim[36] = 26'h3731693;
    stim[37] = 26'h19ef839;
    stim[38] = 26'h2882069;
    stim[39] = 26'h3f3c5c7;
    stim[40] = 26'h197c86d;
    stim[41] = 26'h0539229;
    stim[42] = 26'h27162b8;
    stim[43] = 26'h2792c6d;
    stim[44] = 26'h0c69ebd;
    stim[45] = 26'h21451d0;
    stim[46] = 26'h118dc18;
    stim[47] = 26'h15ae515;
    stim[48] = 26'h29d9d27;
    stim[49] = 26'h36ac76c;
    stim[50] = 26'h015d268;
    stim[51] = 26'h1810e85;
    stim[52] = 26'h2522f67;
    stim[53] = 26'h2949474;
    stim[54] = 26'h0aea67e;
    stim[55] = 26'h18ecdc3;
    stim[56] = 26'h2165812;
    stim[57] = 26'h27a0c5e;
    stim[58] = 26'h26e0518;
    stim[59] = 26'h241b731;
    stim[60] = 26'h1491d92;
    stim[61] = 26'h0d59330;
    stim[62] = 26'h13c0348;
    stim[63] = 26'h3b2a5e7;
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
      expv[0] = 1'h1;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h1;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
