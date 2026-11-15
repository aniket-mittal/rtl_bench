// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  buf_3to2 dut (
    .clk(clk),
    .rst(in_vec[26:26]),
    .din(in_vec[25:2]),
    .din_valid(in_vec[1:1]),
    .dout_ack(in_vec[0:0]),
    .din_ack(out_vec[17:17]),
    .dout(out_vec[16:1]),
    .dout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h6b0275e;
    stim[1] = 27'h4c95e8c;
    stim[2] = 27'h32632c8;
    stim[3] = 27'h384450b;
    stim[4] = 27'h1c7106c;
    stim[5] = 27'h0457036;
    stim[6] = 27'h3c99d4f;
    stim[7] = 27'h027e8f0;
    stim[8] = 27'h0d65d55;
    stim[9] = 27'h16a76a7;
    stim[10] = 27'h2b32292;
    stim[11] = 27'h1fc7870;
    stim[12] = 27'h3fb2033;
    stim[13] = 27'h264f86d;
    stim[14] = 27'h2fcbdfa;
    stim[15] = 27'h101af37;
    stim[16] = 27'h162d076;
    stim[17] = 27'h395bfe5;
    stim[18] = 27'h3cce0c0;
    stim[19] = 27'h12d6597;
    stim[20] = 27'h03c4208;
    stim[21] = 27'h0173c77;
    stim[22] = 27'h3470ae4;
    stim[23] = 27'h3714918;
    stim[24] = 27'h0a0c8ce;
    stim[25] = 27'h2f1ec99;
    stim[26] = 27'h2dc7e7c;
    stim[27] = 27'h21b27c2;
    stim[28] = 27'h2531db1;
    stim[29] = 27'h28c98e7;
    stim[30] = 27'h3be07d4;
    stim[31] = 27'h315cea6;
    stim[32] = 27'h3ce6f71;
    stim[33] = 27'h1e0d46b;
    stim[34] = 27'h254e053;
    stim[35] = 27'h37778ea;
    stim[36] = 27'h1c40786;
    stim[37] = 27'h21d93b9;
    stim[38] = 27'h12185c3;
    stim[39] = 27'h166e26f;
    stim[40] = 27'h302e4b6;
    stim[41] = 27'h3f62a31;
    stim[42] = 27'h3a630e6;
    stim[43] = 27'h0b19c0b;
    stim[44] = 27'h0365b10;
    stim[45] = 27'h1c1eb09;
    stim[46] = 27'h0b327dc;
    stim[47] = 27'h5afb60a;
    stim[48] = 27'h3a4815d;
    stim[49] = 27'h0cf947a;
    stim[50] = 27'h2c95449;
    stim[51] = 27'h175e5c6;
    stim[52] = 27'h1f92f4f;
    stim[53] = 27'h0fb108b;
    stim[54] = 27'h07e3f04;
    stim[55] = 27'h2dd6c06;
    stim[56] = 27'h19195c9;
    stim[57] = 27'h32b612f;
    stim[58] = 27'h00b38c9;
    stim[59] = 27'h06f2017;
    stim[60] = 27'h28a752f;
    stim[61] = 27'h17ab189;
    stim[62] = 27'h271f3cd;
    stim[63] = 27'h370236a;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h20000;
      expv[4] = 18'h08401;
      expv[5] = 18'h08401;
      expv[6] = 18'h08401;
      expv[7] = 18'h1c223;
      expv[8] = 18'h1c223;
      expv[9] = 18'h20000;
      expv[10] = 18'h15201;
      expv[11] = 18'h15201;
      expv[12] = 18'h15201;
      expv[13] = 18'h0b53b;
      expv[14] = 18'h20000;
      expv[15] = 18'h25efd;
      expv[16] = 18'h19b7f;
      expv[17] = 18'h19b7f;
      expv[18] = 18'h080d7;
      expv[19] = 18'h280d7;
      expv[20] = 18'h0b2cb;
      expv[21] = 18'h2b2cb;
      expv[22] = 18'h03a97;
      expv[23] = 18'h03a97;
      expv[24] = 18'h03a97;
      expv[25] = 18'h03a97;
      expv[26] = 18'h00b9f;
      expv[27] = 18'h20b9f;
      expv[28] = 18'h00b9f;
      expv[29] = 18'h393e1;
      expv[30] = 18'h0730d;
      expv[31] = 18'h0730d;
      expv[32] = 18'h0730d;
      expv[33] = 18'h3464d;
      expv[34] = 18'h26a35;
      expv[35] = 18'h028f1;
      expv[36] = 18'h028f1;
      expv[37] = 18'h028f1;
      expv[38] = 18'h32a71;
      expv[39] = 18'h2c2e1;
      expv[40] = 18'h13691;
      expv[41] = 18'h13691;
      expv[42] = 18'h2b371;
      expv[43] = 18'h0b371;
      expv[44] = 18'h11873;
      expv[45] = 18'h11873;
      expv[46] = 18'h001d2;
      expv[47] = 18'h001d2;
      expv[48] = 18'h00000;
      expv[49] = 18'h00001;
      expv[50] = 18'h00001;
      expv[51] = 18'h00001;
      expv[52] = 18'h00001;
      expv[53] = 18'h20001;
      expv[54] = 18'h18845;
      expv[55] = 18'h38845;
      expv[56] = 18'h18845;
      expv[57] = 18'h0027d;
      expv[58] = 18'h16eb7;
      expv[59] = 18'h20000;
      expv[60] = 18'h00a01;
      expv[61] = 18'h03791;
      expv[62] = 18'h00000;
      expv[63] = 18'h00001;
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
