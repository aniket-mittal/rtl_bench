// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_115478 dut (
    .clk(clk),
    .rst(in_vec[33:33]),
    .go(in_vec[32:32]),
    .n(in_vec[31:0]),
    .result(out_vec[32:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3ef686c58;
    stim[1] = 34'h2d34f90c0;
    stim[2] = 34'h1e361b344;
    stim[3] = 34'h1f98497f3;
    stim[4] = 34'h1ecef9fac;
    stim[5] = 34'h11a2b7985;
    stim[6] = 34'h175db330b;
    stim[7] = 34'h1a0a5cbaa;
    stim[8] = 34'h0d5de092d;
    stim[9] = 34'h0e22037eb;
    stim[10] = 34'h117e35038;
    stim[11] = 34'h13ba06675;
    stim[12] = 34'h06d4f2238;
    stim[13] = 34'h1954e74b1;
    stim[14] = 34'h17001a917;
    stim[15] = 34'h17469d38a;
    stim[16] = 34'h07c4450bd;
    stim[17] = 34'h09ad35341;
    stim[18] = 34'h11243cb03;
    stim[19] = 34'h094dbcfa1;
    stim[20] = 34'h11ae5836c;
    stim[21] = 34'h072b9ec07;
    stim[22] = 34'h0221947dc;
    stim[23] = 34'h151453909;
    stim[24] = 34'h0fe598274;
    stim[25] = 34'h04eb9e6f5;
    stim[26] = 34'h13d7ba119;
    stim[27] = 34'h0b65b045b;
    stim[28] = 34'h077b1230f;
    stim[29] = 34'h16ecb368c;
    stim[30] = 34'h1eedbe0a7;
    stim[31] = 34'h1c26dd661;
    stim[32] = 34'h16f623bb0;
    stim[33] = 34'h128692f03;
    stim[34] = 34'h0d7121ba9;
    stim[35] = 34'h0685663fc;
    stim[36] = 34'h071aafc59;
    stim[37] = 34'h0339c6e2d;
    stim[38] = 34'h14c64b9f1;
    stim[39] = 34'h19795ef7b;
    stim[40] = 34'h03df86d84;
    stim[41] = 34'h1ede2c699;
    stim[42] = 34'h040856f40;
    stim[43] = 34'h12e7176cb;
    stim[44] = 34'h111cd346c;
    stim[45] = 34'h078cca42b;
    stim[46] = 34'h00f22acb6;
    stim[47] = 34'h16bdda600;
    stim[48] = 34'h1df8750c9;
    stim[49] = 34'h09cbf086d;
    stim[50] = 34'h0f6eeb111;
    stim[51] = 34'h1224eeeb3;
    stim[52] = 34'h0fec2a34e;
    stim[53] = 34'h1dd5e687b;
    stim[54] = 34'h177baeaca;
    stim[55] = 34'h1f71ed79d;
    stim[56] = 34'h144ecd7ff;
    stim[57] = 34'h19694bbc9;
    stim[58] = 34'h0cad89717;
    stim[59] = 34'h0e7d50221;
    stim[60] = 34'h16eb253f0;
    stim[61] = 34'h0d5e6777c;
    stim[62] = 34'h06e07cb2c;
    stim[63] = 34'h1a69ccf72;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
