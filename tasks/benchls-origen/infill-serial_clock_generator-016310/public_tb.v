// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_016310 dut (
    .clk_in(clk),
    .rst(in_vec[26:26]),
    .count(in_vec[25:22]),
    .start(in_vec[21:21]),
    .start_tmp(in_vec[20:20]),
    .div(in_vec[19:16]),
    .counter(in_vec[15:0]),
    .clk_sr(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h61b82d7;
    stim[1] = 27'h4b203b6;
    stim[2] = 27'h1ee1163;
    stim[3] = 27'h1320de2;
    stim[4] = 27'h048d32e;
    stim[5] = 27'h2f1227d;
    stim[6] = 27'h0978269;
    stim[7] = 27'h1202c10;
    stim[8] = 27'h01cd3a6;
    stim[9] = 27'h343e718;
    stim[10] = 27'h31b7714;
    stim[11] = 27'h327f409;
    stim[12] = 27'h3261d50;
    stim[13] = 27'h108f748;
    stim[14] = 27'h1291493;
    stim[15] = 27'h1be7410;
    stim[16] = 27'h1e6f840;
    stim[17] = 27'h2c57c90;
    stim[18] = 27'h27f0617;
    stim[19] = 27'h02b9691;
    stim[20] = 27'h1b069f9;
    stim[21] = 27'h212e5cf;
    stim[22] = 27'h2816af3;
    stim[23] = 27'h1a0eddb;
    stim[24] = 27'h226b04d;
    stim[25] = 27'h38de865;
    stim[26] = 27'h2a012ac;
    stim[27] = 27'h08e5606;
    stim[28] = 27'h263a2b4;
    stim[29] = 27'h375a31a;
    stim[30] = 27'h2d2d351;
    stim[31] = 27'h17ce88c;
    stim[32] = 27'h0280b4f;
    stim[33] = 27'h6eeeda2;
    stim[34] = 27'h148c55c;
    stim[35] = 27'h01fbfcf;
    stim[36] = 27'h1b945a5;
    stim[37] = 27'h23c0891;
    stim[38] = 27'h146a004;
    stim[39] = 27'h35430c3;
    stim[40] = 27'h1ed8a83;
    stim[41] = 27'h1447773;
    stim[42] = 27'h0678712;
    stim[43] = 27'h267341b;
    stim[44] = 27'h00f3d27;
    stim[45] = 27'h35336ef;
    stim[46] = 27'h1171918;
    stim[47] = 27'h273f926;
    stim[48] = 27'h18e242c;
    stim[49] = 27'h22a786f;
    stim[50] = 27'h0cf46ac;
    stim[51] = 27'h06d561d;
    stim[52] = 27'h3bc6074;
    stim[53] = 27'h13559e2;
    stim[54] = 27'h2a65e4e;
    stim[55] = 27'h2d28e89;
    stim[56] = 27'h2ea5e69;
    stim[57] = 27'h2d739d8;
    stim[58] = 27'h3d6906a;
    stim[59] = 27'h0717428;
    stim[60] = 27'h0a37083;
    stim[61] = 27'h3442c7e;
    stim[62] = 27'h33e7148;
    stim[63] = 27'h030b1cd;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'hx;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h0;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'hx;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'hx;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
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
