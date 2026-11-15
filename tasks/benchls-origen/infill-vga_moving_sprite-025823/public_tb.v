// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_025823 dut (
    .Pclk(clk),
    .xx(in_vec[21:12]),
    .yy(in_vec[11:2]),
    .aactive(in_vec[1:1]),
    .is_in_state(in_vec[0:0]),
    .FSpriteOn(out_vec[12:12]),
    .dataout(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h320435;
    stim[1] = 22'h103ee9;
    stim[2] = 22'h09f617;
    stim[3] = 22'h254f4e;
    stim[4] = 22'h337b1b;
    stim[5] = 22'h0f5bd1;
    stim[6] = 22'h29d306;
    stim[7] = 22'h3dc3ce;
    stim[8] = 22'h220ed3;
    stim[9] = 22'h031810;
    stim[10] = 22'h2455d1;
    stim[11] = 22'h1e142a;
    stim[12] = 22'h06c3ca;
    stim[13] = 22'h29a749;
    stim[14] = 22'h395371;
    stim[15] = 22'h3b8b24;
    stim[16] = 22'h21a429;
    stim[17] = 22'h373f89;
    stim[18] = 22'h2017e4;
    stim[19] = 22'h3281d5;
    stim[20] = 22'h3f7ef0;
    stim[21] = 22'h09dd2f;
    stim[22] = 22'h1cb799;
    stim[23] = 22'h3f990a;
    stim[24] = 22'h1cc5cb;
    stim[25] = 22'h3c7330;
    stim[26] = 22'h3fc7c4;
    stim[27] = 22'h31667f;
    stim[28] = 22'h38d67e;
    stim[29] = 22'h0b5e18;
    stim[30] = 22'h084abd;
    stim[31] = 22'h03d2b7;
    stim[32] = 22'h39fdb9;
    stim[33] = 22'h20571d;
    stim[34] = 22'h094e0e;
    stim[35] = 22'h327adc;
    stim[36] = 22'h276155;
    stim[37] = 22'h0a29a0;
    stim[38] = 22'h39c2f4;
    stim[39] = 22'h171409;
    stim[40] = 22'h2ef0e1;
    stim[41] = 22'h1c5def;
    stim[42] = 22'h133f5d;
    stim[43] = 22'h1ea20b;
    stim[44] = 22'h08a76b;
    stim[45] = 22'h35bd8a;
    stim[46] = 22'h03a619;
    stim[47] = 22'h3ead6b;
    stim[48] = 22'h0b681c;
    stim[49] = 22'h06b5b5;
    stim[50] = 22'h3a5d00;
    stim[51] = 22'h09f68f;
    stim[52] = 22'h12ea2a;
    stim[53] = 22'h0e07f0;
    stim[54] = 22'h0c77fc;
    stim[55] = 22'h27b2e9;
    stim[56] = 22'h0827f7;
    stim[57] = 22'h0123d0;
    stim[58] = 22'h1e5a3b;
    stim[59] = 22'h0f5e3b;
    stim[60] = 22'h21a2a5;
    stim[61] = 22'h1e3c38;
    stim[62] = 22'h0e26db;
    stim[63] = 22'h3f97f4;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
