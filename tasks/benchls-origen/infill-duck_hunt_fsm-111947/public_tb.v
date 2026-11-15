// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_111947 dut (
    .Clk(clk),
    .Reset(in_vec[8:8]),
    .start(in_vec[7:7]),
    .no_shots_left(in_vec[6:6]),
    .flew_away(in_vec[5:5]),
    .game_over(in_vec[4:4]),
    .bird_shot(in_vec[3:3]),
    .duck_ded_done(in_vec[2:2]),
    .dog_start(in_vec[1:1]),
    .dog_duck(in_vec[0:0]),
    .new_round(out_vec[6:6]),
    .reset_shots(out_vec[5:5]),
    .reset_score(out_vec[4:4]),
    .reset_birds(out_vec[3:3]),
    .state(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h119;
    stim[1] = 9'h1f2;
    stim[2] = 9'h0f5;
    stim[3] = 9'h075;
    stim[4] = 9'h0fd;
    stim[5] = 9'h0cc;
    stim[6] = 9'h0b1;
    stim[7] = 9'h0f8;
    stim[8] = 9'h00e;
    stim[9] = 9'h093;
    stim[10] = 9'h0b3;
    stim[11] = 9'h0d6;
    stim[12] = 9'h0ad;
    stim[13] = 9'h0aa;
    stim[14] = 9'h00b;
    stim[15] = 9'h02e;
    stim[16] = 9'h05d;
    stim[17] = 9'h0de;
    stim[18] = 9'h096;
    stim[19] = 9'h076;
    stim[20] = 9'h0d3;
    stim[21] = 9'h0af;
    stim[22] = 9'h00d;
    stim[23] = 9'h094;
    stim[24] = 9'h074;
    stim[25] = 9'h028;
    stim[26] = 9'h0f4;
    stim[27] = 9'h053;
    stim[28] = 9'h007;
    stim[29] = 9'h041;
    stim[30] = 9'h07f;
    stim[31] = 9'h02a;
    stim[32] = 9'h02b;
    stim[33] = 9'h0b2;
    stim[34] = 9'h072;
    stim[35] = 9'h0cf;
    stim[36] = 9'h035;
    stim[37] = 9'h02d;
    stim[38] = 9'h080;
    stim[39] = 9'h001;
    stim[40] = 9'h08a;
    stim[41] = 9'h0a7;
    stim[42] = 9'h025;
    stim[43] = 9'h0c6;
    stim[44] = 9'h06e;
    stim[45] = 9'h0ad;
    stim[46] = 9'h16c;
    stim[47] = 9'h04b;
    stim[48] = 9'h055;
    stim[49] = 9'h0cb;
    stim[50] = 9'h03c;
    stim[51] = 9'h0a5;
    stim[52] = 9'h0da;
    stim[53] = 9'h0ca;
    stim[54] = 9'h0f0;
    stim[55] = 9'h019;
    stim[56] = 9'h06e;
    stim[57] = 9'h043;
    stim[58] = 9'h0db;
    stim[59] = 9'h067;
    stim[60] = 9'h023;
    stim[61] = 9'h0c7;
    stim[62] = 9'h085;
    stim[63] = 9'h04c;
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
      expv[0] = 7'h0x;
      expv[1] = 7'h38;
      expv[2] = 7'h38;
      expv[3] = 7'h02;
      expv[4] = 7'h02;
      expv[5] = 7'h02;
      expv[6] = 7'h02;
      expv[7] = 7'h02;
      expv[8] = 7'h02;
      expv[9] = 7'h41;
      expv[10] = 7'h03;
      expv[11] = 7'h20;
      expv[12] = 7'h19;
      expv[13] = 7'h38;
      expv[14] = 7'h02;
      expv[15] = 7'h41;
      expv[16] = 7'h03;
      expv[17] = 7'h04;
      expv[18] = 7'h04;
      expv[19] = 7'h04;
      expv[20] = 7'h20;
      expv[21] = 7'h19;
      expv[22] = 7'h38;
      expv[23] = 7'h38;
      expv[24] = 7'h02;
      expv[25] = 7'h02;
      expv[26] = 7'h02;
      expv[27] = 7'h02;
      expv[28] = 7'h41;
      expv[29] = 7'h03;
      expv[30] = 7'h04;
      expv[31] = 7'h20;
      expv[32] = 7'h41;
      expv[33] = 7'h03;
      expv[34] = 7'h20;
      expv[35] = 7'h19;
      expv[36] = 7'h38;
      expv[37] = 7'h38;
      expv[38] = 7'h38;
      expv[39] = 7'h02;
      expv[40] = 7'h02;
      expv[41] = 7'h41;
      expv[42] = 7'h03;
      expv[43] = 7'h20;
      expv[44] = 7'h41;
      expv[45] = 7'h03;
      expv[46] = 7'h20;
      expv[47] = 7'h38;
      expv[48] = 7'h38;
      expv[49] = 7'h38;
      expv[50] = 7'h02;
      expv[51] = 7'h02;
      expv[52] = 7'h02;
      expv[53] = 7'h41;
      expv[54] = 7'h03;
      expv[55] = 7'h04;
      expv[56] = 7'h04;
      expv[57] = 7'h20;
      expv[58] = 7'h41;
      expv[59] = 7'h03;
      expv[60] = 7'h04;
      expv[61] = 7'h20;
      expv[62] = 7'h41;
      expv[63] = 7'h03;
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
