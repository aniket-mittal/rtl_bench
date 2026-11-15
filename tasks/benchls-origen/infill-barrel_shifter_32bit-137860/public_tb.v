// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137860 dut (
    .clk(clk),
    .rst_n(in_vec[40:40]),
    .enable(in_vec[39:39]),
    .load(in_vec[38:38]),
    .data(in_vec[37:6]),
    .amount(in_vec[5:1]),
    .direction(in_vec[0:0]),
    .q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h0872ebc7a55;
    stim[1] = 41'h09926be641e;
    stim[2] = 41'h15205708611;
    stim[3] = 41'h1850ae85f15;
    stim[4] = 41'h140571c1d53;
    stim[5] = 41'h15b2cbd3f50;
    stim[6] = 41'h1597cd29ff0;
    stim[7] = 41'h176d13fe6fd;
    stim[8] = 41'h1d93ef69136;
    stim[9] = 41'h08e5a0bee50;
    stim[10] = 41'h1bee9db6a26;
    stim[11] = 41'h113fec7805b;
    stim[12] = 41'h1eb2c002db8;
    stim[13] = 41'h189b75ecaf6;
    stim[14] = 41'h1835eea846c;
    stim[15] = 41'h158cd7bf073;
    stim[16] = 41'h1d83e23791e;
    stim[17] = 41'h195ca738943;
    stim[18] = 41'h1171c443af7;
    stim[19] = 41'h1aa18ba2f1b;
    stim[20] = 41'h16704ad6a65;
    stim[21] = 41'h1c74252ecdd;
    stim[22] = 41'h177dffc63ac;
    stim[23] = 41'h16619b5f968;
    stim[24] = 41'h17a0a3609f3;
    stim[25] = 41'h1e3e3885de6;
    stim[26] = 41'h1f2441eea74;
    stim[27] = 41'h192f3393e11;
    stim[28] = 41'h140dd8e7a7b;
    stim[29] = 41'h1f1cee8bdf1;
    stim[30] = 41'h158f2f5ba70;
    stim[31] = 41'h15e2bbdd258;
    stim[32] = 41'h16c3ccb7728;
    stim[33] = 41'h1a85ab47253;
    stim[34] = 41'h1fa8871df2e;
    stim[35] = 41'h120ac5c0cb6;
    stim[36] = 41'h1583bda6421;
    stim[37] = 41'h1a1e982d7ef;
    stim[38] = 41'h1d4d857d2f1;
    stim[39] = 41'h13d518ee9ad;
    stim[40] = 41'h1c2c19740e3;
    stim[41] = 41'h12a367aba50;
    stim[42] = 41'h1c358079b76;
    stim[43] = 41'h1342aa46821;
    stim[44] = 41'h14c63f07849;
    stim[45] = 41'h118af822e0e;
    stim[46] = 41'h1a969024b08;
    stim[47] = 41'h1a0661f3584;
    stim[48] = 41'h1fae60ad701;
    stim[49] = 41'h17a4d6a0ff3;
    stim[50] = 41'h1dd718f3e42;
    stim[51] = 41'h1cc62b7e804;
    stim[52] = 41'h1de22e58fef;
    stim[53] = 41'h143400fa9c7;
    stim[54] = 41'h1149a33d388;
    stim[55] = 41'h1bd9b9adac6;
    stim[56] = 41'h106ce001e2c;
    stim[57] = 41'h152820e32cf;
    stim[58] = 41'h1f5a631d03a;
    stim[59] = 41'h10de7751a89;
    stim[60] = 41'h1faa6f45469;
    stim[61] = 41'h1cd1c1c22fa;
    stim[62] = 41'h1f559d2ce55;
    stim[63] = 41'h1bd07572805;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'hacb000b6;
      expv[14] = 32'hb0000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h60f88de4;
      expv[18] = 32'h307c46f2;
      expv[19] = 32'h307c46f2;
      expv[20] = 32'h000183e2;
      expv[21] = 32'h000183e2;
      expv[22] = 32'h1d094bb3;
      expv[23] = 32'h1d094bb3;
      expv[24] = 32'h1d094bb3;
      expv[25] = 32'h1d094bb3;
      expv[26] = 32'h8f8e2177;
      expv[27] = 32'hc9107ba9;
      expv[28] = 32'hffc9107b;
      expv[29] = 32'hffc9107b;
      expv[30] = 32'hc73ba2f7;
      expv[31] = 32'hc73ba2f7;
      expv[32] = 32'hc73ba2f7;
      expv[33] = 32'hc73ba2f7;
      expv[34] = 32'hffe39dd1;
      expv[35] = 32'hea21c77c;
      expv[36] = 32'hea21c77c;
      expv[37] = 32'hea21c77c;
      expv[38] = 32'hffffffd4;
      expv[39] = 32'h53615f4b;
      expv[40] = 32'h53615f4b;
      expv[41] = 32'h0b065d03;
      expv[42] = 32'h0b065d03;
      expv[43] = 32'h0d601e6d;
      expv[44] = 32'h0d601e6d;
      expv[45] = 32'h0d601e6d;
      expv[46] = 32'h0d601e6d;
      expv[47] = 32'hd601e6d0;
      expv[48] = 32'h58079b40;
      expv[49] = 32'heb982b5c;
      expv[50] = 32'heb982b5c;
      expv[51] = 32'h75c63cf9;
      expv[52] = 32'h318adfa0;
      expv[53] = 32'h788b963f;
      expv[54] = 32'h788b963f;
      expv[55] = 32'h788b963f;
      expv[56] = 32'hc45cb1f8;
      expv[57] = 32'hc45cb1f8;
      expv[58] = 32'hc45cb1f8;
      expv[59] = 32'hd698c740;
      expv[60] = 32'hd698c740;
      expv[61] = 32'hea9bd151;
      expv[62] = 32'h3470708b;
      expv[63] = 32'hd5674b39;
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
