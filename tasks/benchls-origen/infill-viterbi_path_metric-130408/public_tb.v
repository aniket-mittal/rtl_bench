// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_130408 dut (
    .pm0(in_vec[15:12]),
    .pm1(in_vec[11:8]),
    .pm2(in_vec[7:4]),
    .pm3(in_vec[3:0]),
    .d0(out_vec[1:1]),
    .d1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h02ca;
    stim[1] = 16'ha89e;
    stim[2] = 16'h18f0;
    stim[3] = 16'h4663;
    stim[4] = 16'h2554;
    stim[5] = 16'h3ac9;
    stim[6] = 16'h369b;
    stim[7] = 16'h4c69;
    stim[8] = 16'h9258;
    stim[9] = 16'heae6;
    stim[10] = 16'h1bbe;
    stim[11] = 16'h871f;
    stim[12] = 16'h76f2;
    stim[13] = 16'h4a0f;
    stim[14] = 16'h65c6;
    stim[15] = 16'h3770;
    stim[16] = 16'hd734;
    stim[17] = 16'h4309;
    stim[18] = 16'h6aa0;
    stim[19] = 16'h6d03;
    stim[20] = 16'h3ff6;
    stim[21] = 16'ha000;
    stim[22] = 16'hc45f;
    stim[23] = 16'hf616;
    stim[24] = 16'h4d32;
    stim[25] = 16'h5608;
    stim[26] = 16'h9409;
    stim[27] = 16'he257;
    stim[28] = 16'haab5;
    stim[29] = 16'hdf3b;
    stim[30] = 16'h317b;
    stim[31] = 16'h6ac5;
    stim[32] = 16'h7772;
    stim[33] = 16'h13c4;
    stim[34] = 16'h6e2c;
    stim[35] = 16'h7779;
    stim[36] = 16'h4b6b;
    stim[37] = 16'h51d3;
    stim[38] = 16'hbaea;
    stim[39] = 16'hfaa7;
    stim[40] = 16'h408f;
    stim[41] = 16'h22a4;
    stim[42] = 16'h5e5d;
    stim[43] = 16'h3cba;
    stim[44] = 16'h9d25;
    stim[45] = 16'hefbf;
    stim[46] = 16'hfff5;
    stim[47] = 16'hfe85;
    stim[48] = 16'hfe28;
    stim[49] = 16'hbc23;
    stim[50] = 16'h1a9c;
    stim[51] = 16'hc98e;
    stim[52] = 16'h745a;
    stim[53] = 16'hb725;
    stim[54] = 16'he329;
    stim[55] = 16'h6910;
    stim[56] = 16'h3c84;
    stim[57] = 16'h9996;
    stim[58] = 16'hdb7c;
    stim[59] = 16'hc91e;
    stim[60] = 16'h0b94;
    stim[61] = 16'h3461;
    stim[62] = 16'h7065;
    stim[63] = 16'hc5aa;
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
      expv[0] = 2'hx;
      expv[1] = 2'hx;
      expv[2] = 2'hx;
      expv[3] = 2'h2;
      expv[4] = 2'h2;
      expv[5] = 2'h2;
      expv[6] = 2'h3;
      expv[7] = 2'h2;
      expv[8] = 2'h2;
      expv[9] = 2'h2;
      expv[10] = 2'h2;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h3;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h0;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h0;
      expv[21] = 2'h3;
      expv[22] = 2'h0;
      expv[23] = 2'h2;
      expv[24] = 2'h0;
      expv[25] = 2'h2;
      expv[26] = 2'h2;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h2;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h3;
      expv[35] = 2'h2;
      expv[36] = 2'h0;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h0;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h0;
      expv[44] = 2'h2;
      expv[45] = 2'h0;
      expv[46] = 2'h2;
      expv[47] = 2'h3;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h0;
      expv[51] = 2'h2;
      expv[52] = 2'h0;
      expv[53] = 2'h2;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'h0;
      expv[59] = 2'h2;
      expv[60] = 2'h0;
      expv[61] = 2'h2;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
