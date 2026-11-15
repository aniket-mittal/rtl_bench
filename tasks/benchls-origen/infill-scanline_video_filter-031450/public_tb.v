// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_031450 dut (
    .clk(clk),
    .scanlines(in_vec[28:27]),
    .din(in_vec[26:3]),
    .hs_in(in_vec[2:2]),
    .vs_in(in_vec[1:1]),
    .de_in(in_vec[0:0]),
    .dout(out_vec[26:3]),
    .hs_out(out_vec[2:2]),
    .vs_out(out_vec[1:1]),
    .de_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h0bedef69;
    stim[1] = 29'h0ef2fca5;
    stim[2] = 29'h03ae9ef3;
    stim[3] = 29'h11652dbe;
    stim[4] = 29'h1c272a77;
    stim[5] = 29'h17fda910;
    stim[6] = 29'h1eadbd05;
    stim[7] = 29'h11780540;
    stim[8] = 29'h1162f92d;
    stim[9] = 29'h1591a70d;
    stim[10] = 29'h186e0bfb;
    stim[11] = 29'h1a6469d4;
    stim[12] = 29'h09b7d244;
    stim[13] = 29'h0d40a803;
    stim[14] = 29'h1542a2ac;
    stim[15] = 29'h18fe531e;
    stim[16] = 29'h0c84c510;
    stim[17] = 29'h1f22c68e;
    stim[18] = 29'h1872b37f;
    stim[19] = 29'h11f91bf4;
    stim[20] = 29'h043e1e43;
    stim[21] = 29'h0743bd67;
    stim[22] = 29'h02580830;
    stim[23] = 29'h1015ed80;
    stim[24] = 29'h142f7966;
    stim[25] = 29'h115e6918;
    stim[26] = 29'h07a96ac8;
    stim[27] = 29'h158a97a7;
    stim[28] = 29'h1f574052;
    stim[29] = 29'h05c6c01a;
    stim[30] = 29'h134832f0;
    stim[31] = 29'h1d6c1960;
    stim[32] = 29'h1cb68d75;
    stim[33] = 29'h05b4430a;
    stim[34] = 29'h1e6ec317;
    stim[35] = 29'h1131b600;
    stim[36] = 29'h129303a1;
    stim[37] = 29'h13f8e941;
    stim[38] = 29'h073e70e4;
    stim[39] = 29'h0677e262;
    stim[40] = 29'h02a78a95;
    stim[41] = 29'h1ece3e45;
    stim[42] = 29'h06a8c3ab;
    stim[43] = 29'h05f17144;
    stim[44] = 29'h0eb35e5f;
    stim[45] = 29'h01d2c434;
    stim[46] = 29'h1690ae42;
    stim[47] = 29'h1efbbcda;
    stim[48] = 29'h1488fbe5;
    stim[49] = 29'h0bd20772;
    stim[50] = 29'h1d9f5244;
    stim[51] = 29'h18d1ba79;
    stim[52] = 29'h14cbc23e;
    stim[53] = 29'h1fc6320e;
    stim[54] = 29'h0bc19e52;
    stim[55] = 29'h08efd266;
    stim[56] = 29'h0aeb5870;
    stim[57] = 29'h02c47a97;
    stim[58] = 29'h09024d36;
    stim[59] = 29'h0fd0c71a;
    stim[60] = 29'h1bfddc43;
    stim[61] = 29'h15dbe1d1;
    stim[62] = 29'h0d9c8129;
    stim[63] = 29'h1a8ea62b;
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
      expv[0] = 27'hxxxxxxx;
      expv[1] = 27'hxxxxxxx;
      expv[2] = 27'hxxxxxxx;
      expv[3] = 27'hxxxxxxx;
      expv[4] = 27'h6f2fca5;
      expv[5] = 27'h3ae9ef3;
      expv[6] = 27'h1652dbe;
      expv[7] = 27'h4272a77;
      expv[8] = 27'h7fda910;
      expv[9] = 27'h6adbd05;
      expv[10] = 27'h1780540;
      expv[11] = 27'h162f92d;
      expv[12] = 27'h591a70d;
      expv[13] = 27'h06e0bfb;
      expv[14] = 27'h0991874;
      expv[15] = 27'h1b7d244;
      expv[16] = 27'h540a803;
      expv[17] = 27'h3f1fa04;
      expv[18] = 27'h0fe531e;
      expv[19] = 27'h484c510;
      expv[20] = 27'h722c68e;
      expv[21] = 27'h072b37f;
      expv[22] = 27'h1f91bf4;
      expv[23] = 27'h43e1e43;
      expv[24] = 27'h743bd67;
      expv[25] = 27'h2580830;
      expv[26] = 27'h015ed80;
      expv[27] = 27'h42f7966;
      expv[28] = 27'h15e6918;
      expv[29] = 27'h7a96ac8;
      expv[30] = 27'h58a97a7;
      expv[31] = 27'h7574052;
      expv[32] = 27'h171b002;
      expv[33] = 27'h34832f0;
      expv[34] = 27'h56c1960;
      expv[35] = 27'h4b68d75;
      expv[36] = 27'h5b4430a;
      expv[37] = 27'h66ec317;
      expv[38] = 27'h131b600;
      expv[39] = 27'h29303a1;
      expv[40] = 27'h3f8e941;
      expv[41] = 27'h73e70e4;
      expv[42] = 27'h677e262;
      expv[43] = 27'h2a78a95;
      expv[44] = 27'h6ce3e45;
      expv[45] = 27'h6a8c3ab;
      expv[46] = 27'h5f17144;
      expv[47] = 27'h6b35e5f;
      expv[48] = 27'h1d2c434;
      expv[49] = 27'h690ae42;
      expv[50] = 27'h379da6a;
      expv[51] = 27'h488fbe5;
      expv[52] = 27'h3d20772;
      expv[53] = 27'h43d81b4;
      expv[54] = 27'h0d1ba79;
      expv[55] = 27'h4cbc23e;
      expv[56] = 27'h7c6320e;
      expv[57] = 27'h3c19e52;
      expv[58] = 27'h0b5e1ce;
      expv[59] = 27'h2328858;
      expv[60] = 27'h2c47a97;
      expv[61] = 27'h1024d36;
      expv[62] = 27'h7d0c71a;
      expv[63] = 27'h3046b33;
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
