// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 31;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_007198 dut (
    .length_volto(in_vec[48:41]),
    .channel_sel(in_vec[40:38]),
    .vga_data_volto(in_vec[37:22]),
    .x_counter(in_vec[21:11]),
    .y_counter(in_vec[10:0]),
    .x2(out_vec[30:24]),
    .y2(out_vec[23:18]),
    .num2(out_vec[17:13]),
    .black2(out_vec[12:12]),
    .volum2(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h0160cfe3dce34;
    stim[1] = 49'h096553a38c91e;
    stim[2] = 49'h184e8fbca0204;
    stim[3] = 49'h16547885853d0;
    stim[4] = 49'h0d966cc919d18;
    stim[5] = 49'h1ab61529abb08;
    stim[6] = 49'h13873bcc25c40;
    stim[7] = 49'h0ff3572556ccd;
    stim[8] = 49'h1e984b6f12946;
    stim[9] = 49'h137d72015f212;
    stim[10] = 49'h0651d0a77d08b;
    stim[11] = 49'h1570d59cf0980;
    stim[12] = 49'h1a91530ef2f6c;
    stim[13] = 49'h1c1a71f8c1505;
    stim[14] = 49'h1c0d40ab225c4;
    stim[15] = 49'h14db41cc40bd2;
    stim[16] = 49'h041cfa0ffbd04;
    stim[17] = 49'h16ad6939a239c;
    stim[18] = 49'h01981a83146dc;
    stim[19] = 49'h1283d1cc685b4;
    stim[20] = 49'h1121815da4b0a;
    stim[21] = 49'h0381d613f92ee;
    stim[22] = 49'h18f5788183e29;
    stim[23] = 49'h14322f7d534fb;
    stim[24] = 49'h076c8c51f0527;
    stim[25] = 49'h143b23f4b4e8a;
    stim[26] = 49'h086d0a99c96ed;
    stim[27] = 49'h144ff6dc56c4a;
    stim[28] = 49'h1c0ec75e9ded3;
    stim[29] = 49'h1ba5d2949d7ef;
    stim[30] = 49'h0612fb201b578;
    stim[31] = 49'h1306a44b37d95;
    stim[32] = 49'h05c5e0bdb82b4;
    stim[33] = 49'h186c59f88d217;
    stim[34] = 49'h1ce5a2b3de56b;
    stim[35] = 49'h04de832cd591d;
    stim[36] = 49'h1a00c74930825;
    stim[37] = 49'h00d923ce023a0;
    stim[38] = 49'h0770970ddfcc9;
    stim[39] = 49'h187c34d209387;
    stim[40] = 49'h052c379382628;
    stim[41] = 49'h0a178a91bac1c;
    stim[42] = 49'h12d1ea7bfaac7;
    stim[43] = 49'h1b752c0d954ce;
    stim[44] = 49'h1e70a5422e345;
    stim[45] = 49'h123906f4d4da2;
    stim[46] = 49'h174bd090400ae;
    stim[47] = 49'h18e1483422f83;
    stim[48] = 49'h147db60485af6;
    stim[49] = 49'h0f80f101df6f5;
    stim[50] = 49'h1b87bfbcbf963;
    stim[51] = 49'h1455b7dbf9621;
    stim[52] = 49'h06f318a0dabb1;
    stim[53] = 49'h1c7e1545e2f5e;
    stim[54] = 49'h0287d26464edc;
    stim[55] = 49'h08c470596c1d4;
    stim[56] = 49'h19917f6667f9f;
    stim[57] = 49'h0688fe256c9be;
    stim[58] = 49'h187559a5f95e1;
    stim[59] = 49'h03bfa9cbdb62e;
    stim[60] = 49'h0d13af1cafe18;
    stim[61] = 49'h0e8dc30d67e62;
    stim[62] = 49'h0b8c7c56e500d;
    stim[63] = 49'h15e5aa087e6c6;
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
      expv[0] = 31'h00001000;
      expv[1] = 31'h00001000;
      expv[2] = 31'h00001000;
      expv[3] = 31'h00001000;
      expv[4] = 31'h00001000;
      expv[5] = 31'h00001000;
      expv[6] = 31'h03626000;
      expv[7] = 31'h00001000;
      expv[8] = 31'h00001000;
      expv[9] = 31'h00001000;
      expv[10] = 31'h00001000;
      expv[11] = 31'h00001000;
      expv[12] = 31'h00001000;
      expv[13] = 31'h00001000;
      expv[14] = 31'h00001000;
      expv[15] = 31'h11a80f00;
      expv[16] = 31'h00001000;
      expv[17] = 31'h00001000;
      expv[18] = 31'h00001000;
      expv[19] = 31'h00001000;
      expv[20] = 31'h00001000;
      expv[21] = 31'h00001000;
      expv[22] = 31'h00001000;
      expv[23] = 31'h00001000;
      expv[24] = 31'h00001000;
      expv[25] = 31'h00001000;
      expv[26] = 31'h00001000;
      expv[27] = 31'h3d880f00;
      expv[28] = 31'h00001000;
      expv[29] = 31'h00001000;
      expv[30] = 31'h0e40a000;
      expv[31] = 31'h00001000;
      expv[32] = 31'h00001000;
      expv[33] = 31'h00001000;
      expv[34] = 31'h00001000;
      expv[35] = 31'h00001000;
      expv[36] = 31'h00001000;
      expv[37] = 31'h00001000;
      expv[38] = 31'h00001000;
      expv[39] = 31'h00001000;
      expv[40] = 31'h00001000;
      expv[41] = 31'h00001000;
      expv[42] = 31'h00001000;
      expv[43] = 31'h00001000;
      expv[44] = 31'h00001000;
      expv[45] = 31'h00001000;
      expv[46] = 31'h10180f00;
      expv[47] = 31'h056d4000;
      expv[48] = 31'h00001000;
      expv[49] = 31'h00001000;
      expv[50] = 31'h00001000;
      expv[51] = 31'h00001000;
      expv[52] = 31'h00001000;
      expv[53] = 31'h00001000;
      expv[54] = 31'h00001000;
      expv[55] = 31'h00001000;
      expv[56] = 31'h00001000;
      expv[57] = 31'h00001000;
      expv[58] = 31'h00001000;
      expv[59] = 31'h00001000;
      expv[60] = 31'h00001000;
      expv[61] = 31'h00001000;
      expv[62] = 31'h00001000;
      expv[63] = 31'h00001000;
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
