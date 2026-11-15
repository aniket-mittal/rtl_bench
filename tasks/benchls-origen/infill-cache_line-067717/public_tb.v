// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_067717 dut (
    .clk(clk),
    .nrst(in_vec[67:67]),
    .rd_off(in_vec[66:63]),
    .wr_write(in_vec[62:62]),
    .wr_tag(in_vec[61:42]),
    .wr_off(in_vec[41:38]),
    .wr_data(in_vec[37:6]),
    .wr_byte_enable(in_vec[5:2]),
    .wr_dirty(in_vec[1:1]),
    .wr_valid(in_vec[0:0]),
    .rd_tag(out_vec[53:34]),
    .rd_data(out_vec[33:2]),
    .rd_dirty(out_vec[1:1]),
    .rd_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hd7fb40719fc97ff35;
    stim[1] = 68'hfd067883b8fc77797;
    stim[2] = 68'h7d3e678980285b73d;
    stim[3] = 68'h7e9b275c2fe31bf33;
    stim[4] = 68'h65dcada22c81386cf;
    stim[5] = 68'h0a15d69e6b69a73f3;
    stim[6] = 68'h6a92839d35d50bc3f;
    stim[7] = 68'h2a2a0da7a92b8d7d6;
    stim[8] = 68'h1df45d8b5722e4015;
    stim[9] = 68'h523195fc0ec650903;
    stim[10] = 68'h45d32e9b878f5b8a1;
    stim[11] = 68'h2cbe67aea10ce6dff;
    stim[12] = 68'h467d630d6b037f529;
    stim[13] = 68'h0054bd8e143872995;
    stim[14] = 68'h51cce7f2924fff2f1;
    stim[15] = 68'h46a8c65aa8167005c;
    stim[16] = 68'h5c725c5276cb86f18;
    stim[17] = 68'h3fbd6652844e36152;
    stim[18] = 68'h149c3e30bdcb2e19c;
    stim[19] = 68'h6f2ce929aad30847d;
    stim[20] = 68'h681b4f80738463957;
    stim[21] = 68'h2ff6a81a206d0ea6c;
    stim[22] = 68'h285378d7b031efc16;
    stim[23] = 68'h38c94fc58c2f6139e;
    stim[24] = 68'h3165f4f1dfe883337;
    stim[25] = 68'h2cf277185bead1b53;
    stim[26] = 68'h65a4fc2ffb838f193;
    stim[27] = 68'h6cb1aa65da71ac55e;
    stim[28] = 68'h134e9b7931043d0eb;
    stim[29] = 68'h585314843842630d6;
    stim[30] = 68'h235c836ae4a222f24;
    stim[31] = 68'h5e450b1411e8de97a;
    stim[32] = 68'h3d2d18e4ea70866a9;
    stim[33] = 68'h1b802e07faee019bb;
    stim[34] = 68'h23393d8110046d435;
    stim[35] = 68'h3ee789175687d20ae;
    stim[36] = 68'h40098aceefdf176a4;
    stim[37] = 68'h07ca44c7f56aaf17f;
    stim[38] = 68'h373c311a50d2ec046;
    stim[39] = 68'h2c094cb243bcea397;
    stim[40] = 68'h522fcd316dfb25e6f;
    stim[41] = 68'h1b777df94cfcff110;
    stim[42] = 68'h003f26cb25e6f4439;
    stim[43] = 68'h6604b69a55da49180;
    stim[44] = 68'h2bf7244a34f9b58a0;
    stim[45] = 68'h5e9f342791e58e87a;
    stim[46] = 68'h336fd7937ad129a99;
    stim[47] = 68'h73705c00821a62862;
    stim[48] = 68'h722af7369f1390cbd;
    stim[49] = 68'h376ce44802add7092;
    stim[50] = 68'h42d6ecd9e17f22d53;
    stim[51] = 68'h51d3fa1527574a6a7;
    stim[52] = 68'h41b3c08ca24b46983;
    stim[53] = 68'h51240e3a58142c6fd;
    stim[54] = 68'h0565dbd4a3098e7be;
    stim[55] = 68'h373315ff47dc0f854;
    stim[56] = 68'h00976e88759cb2e21;
    stim[57] = 68'h2cb5ade35fba378e0;
    stim[58] = 68'h1cec57a5f99668167;
    stim[59] = 68'h1f8a8d49da9cbcaf9;
    stim[60] = 68'h7590e9f13c506867f;
    stim[61] = 68'h65d5eaae6d587dad7;
    stim[62] = 68'h0e2286e9b23aa27bd;
    stim[63] = 68'h25a080c21dbeae58a;
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
      expv[0] = 54'h00000000000000;
      expv[1] = 54'h3fb40xxxxxxxxx;
      expv[2] = 54'h00000000000000;
      expv[3] = 54'h00000000000000;
      expv[4] = 54'h00000000000000;
      expv[5] = 54'h00000000000000;
      expv[6] = 54'h00000000000000;
      expv[7] = 54'h00000000000000;
      expv[8] = 54'h00000000000000;
      expv[9] = 54'h00000000000000;
      expv[10] = 54'h00000000000000;
      expv[11] = 54'h00000000000000;
      expv[12] = 54'h00000000000000;
      expv[13] = 54'h00000000000000;
      expv[14] = 54'h00000000000000;
      expv[15] = 54'h00000000000000;
      expv[16] = 54'h00000000000000;
      expv[17] = 54'h00000000000000;
      expv[18] = 54'h00000000000000;
      expv[19] = 54'h00000000000000;
      expv[20] = 54'h00000000000000;
      expv[21] = 54'h00000000000000;
      expv[22] = 54'h00000000000000;
      expv[23] = 54'h00000000000000;
      expv[24] = 54'h00000000000000;
      expv[25] = 54'h00000000000000;
      expv[26] = 54'h00000000000000;
      expv[27] = 54'h00000000000000;
      expv[28] = 54'h00000000000000;
      expv[29] = 54'h00000000000000;
      expv[30] = 54'h00000000000000;
      expv[31] = 54'h00000000000000;
      expv[32] = 54'h00000000000000;
      expv[33] = 54'h00000000000000;
      expv[34] = 54'h00000000000000;
      expv[35] = 54'h00000000000000;
      expv[36] = 54'h00000000000000;
      expv[37] = 54'h00000000000000;
      expv[38] = 54'h00000000000000;
      expv[39] = 54'h00000000000000;
      expv[40] = 54'h00000000000000;
      expv[41] = 54'h00000000000000;
      expv[42] = 54'h00000000000000;
      expv[43] = 54'h00000000000000;
      expv[44] = 54'h00000000000000;
      expv[45] = 54'h00000000000000;
      expv[46] = 54'h00000000000000;
      expv[47] = 54'h00000000000000;
      expv[48] = 54'h00000000000000;
      expv[49] = 54'h00000000000000;
      expv[50] = 54'h00000000000000;
      expv[51] = 54'h00000000000000;
      expv[52] = 54'h00000000000000;
      expv[53] = 54'h00000000000000;
      expv[54] = 54'h00000000000000;
      expv[55] = 54'h00000000000000;
      expv[56] = 54'h00000000000000;
      expv[57] = 54'h00000000000000;
      expv[58] = 54'h00000000000000;
      expv[59] = 54'h00000000000000;
      expv[60] = 54'h00000000000000;
      expv[61] = 54'h00000000000000;
      expv[62] = 54'h00000000000000;
      expv[63] = 54'h00000000000000;
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
