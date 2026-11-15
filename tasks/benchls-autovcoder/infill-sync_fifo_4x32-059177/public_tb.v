// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059177 dut (
    .clk(clk),
    .din(in_vec[34:3]),
    .wr_en(in_vec[2:2]),
    .rd_en(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .dout(out_vec[33:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h05f4e7f93;
    stim[1] = 35'h6c07d14ef;
    stim[2] = 35'h1b874f2ea;
    stim[3] = 35'h1227e0e38;
    stim[4] = 35'h1fbd5111c;
    stim[5] = 35'h468f16da2;
    stim[6] = 35'h0e99bfa02;
    stim[7] = 35'h14b0be6bc;
    stim[8] = 35'h25bd4dc76;
    stim[9] = 35'h66dc0aa10;
    stim[10] = 35'h2c48c9b00;
    stim[11] = 35'h3209c15ca;
    stim[12] = 35'h79d861104;
    stim[13] = 35'h4c20c46de;
    stim[14] = 35'h015255e16;
    stim[15] = 35'h000596f50;
    stim[16] = 35'h4571a3a34;
    stim[17] = 35'h6024bc6f0;
    stim[18] = 35'h08e5d342e;
    stim[19] = 35'h7458f77d4;
    stim[20] = 35'h6f128c398;
    stim[21] = 35'h01bc5b0cc;
    stim[22] = 35'h53185c232;
    stim[23] = 35'h2c64bd7f4;
    stim[24] = 35'h1972be2bc;
    stim[25] = 35'h5c1945cae;
    stim[26] = 35'h549f76cf4;
    stim[27] = 35'h110ef7896;
    stim[28] = 35'h0b020ed52;
    stim[29] = 35'h129f5aebc;
    stim[30] = 35'h55498d40e;
    stim[31] = 35'h4381d9990;
    stim[32] = 35'h497622e70;
    stim[33] = 35'h2635a3b0c;
    stim[34] = 35'h010acc4b6;
    stim[35] = 35'h49b9f7094;
    stim[36] = 35'h41541578e;
    stim[37] = 35'h4cb6a4abe;
    stim[38] = 35'h0dabc61be;
    stim[39] = 35'h6bd487e28;
    stim[40] = 35'h1245f85a2;
    stim[41] = 35'h23b897eda;
    stim[42] = 35'h40f2e86f2;
    stim[43] = 35'h3637d3ac8;
    stim[44] = 35'h2259b1114;
    stim[45] = 35'h7a1bca026;
    stim[46] = 35'h37de30e96;
    stim[47] = 35'h6565d2a50;
    stim[48] = 35'h18ba7b148;
    stim[49] = 35'h792d8a6bc;
    stim[50] = 35'h591e299fe;
    stim[51] = 35'h60fe2e29e;
    stim[52] = 35'h63ddb605a;
    stim[53] = 35'h43b459b26;
    stim[54] = 35'h100127e52;
    stim[55] = 35'h4eeda1768;
    stim[56] = 35'h251c6bf28;
    stim[57] = 35'h59ed34d2e;
    stim[58] = 35'h1821846a2;
    stim[59] = 35'h784e16870;
    stim[60] = 35'h26d17d7e2;
    stim[61] = 35'h6ead14e92;
    stim[62] = 35'h0b8aaf274;
    stim[63] = 35'h4a75e6044;
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
      expv[2] = 34'h3603e8a75;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'hxxxxxxxxx;
      expv[6] = 34'hxxxxxxxxx;
      expv[7] = 34'hxxxxxxxxx;
      expv[8] = 34'hxxxxxxxxx;
      expv[9] = 34'h0fdea888c;
      expv[10] = 34'h0fdea888c;
      expv[11] = 34'h0fdea888c;
      expv[12] = 34'h0a585f35c;
      expv[13] = 34'h0a585f35c;
      expv[14] = 34'h12dea6e38;
      expv[15] = 34'h3cec30880;
      expv[16] = 34'h3cec30880;
      expv[17] = 34'h3cec30881;
      expv[18] = 34'h3cec30881;
      expv[19] = 34'h26106236d;
      expv[20] = 34'h3a2c7bbe8;
      expv[21] = 34'h3a2c7bbe8;
      expv[22] = 34'h3a2c7bbe8;
      expv[23] = 34'h00de2d864;
      expv[24] = 34'h00de2d864;
      expv[25] = 34'h00de2d864;
      expv[26] = 34'h16325ebf8;
      expv[27] = 34'h16325ebfa;
      expv[28] = 34'h0cb95f15e;
      expv[29] = 34'h2e0ca2e54;
      expv[30] = 34'h2e0ca2e56;
      expv[31] = 34'h2a4fbb67a;
      expv[32] = 34'h2a4fbb67a;
      expv[33] = 34'h2a4fbb67a;
      expv[34] = 34'h131ad1d84;
      expv[35] = 34'h008566258;
      expv[36] = 34'h008566258;
      expv[37] = 34'h24dcfb848;
      expv[38] = 34'h20aa0abc4;
      expv[39] = 34'h265b5255c;
      expv[40] = 34'h265b5255c;
      expv[41] = 34'h06d5e30dc;
      expv[42] = 34'h24dcfb84a;
      expv[43] = 34'h20aa0abc4;
      expv[44] = 34'h20aa0abc4;
      expv[45] = 34'h20aa0abc6;
      expv[46] = 34'h265b5255e;
      expv[47] = 34'h06d5e30de;
      expv[48] = 34'h06d5e30de;
      expv[49] = 34'h06d5e30de;
      expv[50] = 34'h3c96c535c;
      expv[51] = 34'h2c8f14cfc;
      expv[52] = 34'h307f1714c;
      expv[53] = 34'h1bef1874a;
      expv[54] = 34'h3c96c535e;
      expv[55] = 34'h2c8f14cfc;
      expv[56] = 34'h2c8f14cfc;
      expv[57] = 34'h2c8f14cfc;
      expv[58] = 34'h307f1714c;
      expv[59] = 34'h21da2cd90;
      expv[60] = 34'h21da2cd90;
      expv[61] = 34'h2cf69a694;
      expv[62] = 34'h2c8f14cfd;
      expv[63] = 34'h05c557938;
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
