// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09570 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h292dd45d4f016a2591;
    stim[1] = 70'h25cb5a73b33ca98073;
    stim[2] = 70'h1ee751bcba80231364;
    stim[3] = 70'h063adca00f4fae9c30;
    stim[4] = 70'h0b08b5fae13a82a19b;
    stim[5] = 70'h0a3f3161100563a066;
    stim[6] = 70'h0ecff1060a6cf61c33;
    stim[7] = 70'h0b2134a8bb97ffab8d;
    stim[8] = 70'h075923230fc1a897a8;
    stim[9] = 70'h1366df59792a3616f2;
    stim[10] = 70'h1f5776e2889d45f52e;
    stim[11] = 70'h09c76eba0d15790663;
    stim[12] = 70'h1c19357ab3fc7cbd89;
    stim[13] = 70'h02378ea445acbe1d70;
    stim[14] = 70'h1dc9faf2a9984b46ea;
    stim[15] = 70'h0017d9123d6f03716a;
    stim[16] = 70'h074d17c490c1420c96;
    stim[17] = 70'h1426a1e068bd4b8020;
    stim[18] = 70'h0d5286d6eb1401bfcd;
    stim[19] = 70'h1d9257a7e4d63aab4a;
    stim[20] = 70'h1239a401983e00bf93;
    stim[21] = 70'h2e01123e1b36d57217;
    stim[22] = 70'h0e95cc0d16e6178327;
    stim[23] = 70'h0db0e9baec5d69dfe9;
    stim[24] = 70'h253bba8b6e8879b864;
    stim[25] = 70'h1934d1e95e27994449;
    stim[26] = 70'h0c117601dbfbd4b9d8;
    stim[27] = 70'h137a6a1566ea489fb7;
    stim[28] = 70'h05090ec83184c0f84f;
    stim[29] = 70'h00478388cb45fd1278;
    stim[30] = 70'h05000e1df1a21ced29;
    stim[31] = 70'h05c000cfd7c5b9b629;
    stim[32] = 70'h0c59423626a0ee961a;
    stim[33] = 70'h0104bc94402f54bcff;
    stim[34] = 70'h18034079211d50d781;
    stim[35] = 70'h08f88b8c865a61ba92;
    stim[36] = 70'h002c6c222e5a70c6c3;
    stim[37] = 70'h0cfe734d9a9e9f947c;
    stim[38] = 70'h0cbc7bc4d50d6f5568;
    stim[39] = 70'h15e7cffb90ab892efd;
    stim[40] = 70'h1dd7e4106fa316d5f8;
    stim[41] = 70'h1339bcdc5312dfb528;
    stim[42] = 70'h3dca6e4eaae8421b52;
    stim[43] = 70'h18e9cf162f757d324d;
    stim[44] = 70'h0c68332e0a0dc7ddf5;
    stim[45] = 70'h12634bfa811e60c43a;
    stim[46] = 70'h14b2c17caaa6f171f6;
    stim[47] = 70'h1249fcce6292b408f8;
    stim[48] = 70'h1692444d215063daa4;
    stim[49] = 70'h0fefb03308fb2c13e5;
    stim[50] = 70'h00559a15bbcdcbc8f3;
    stim[51] = 70'h07c11943f264d8813e;
    stim[52] = 70'h00bab596323ec535fb;
    stim[53] = 70'h1814275070b06ad8b4;
    stim[54] = 70'h1aa7b9f9c8eeea98da;
    stim[55] = 70'h0c03f6460260b043c7;
    stim[56] = 70'h0bbdcf9a21ee25bb95;
    stim[57] = 70'h0329842438b0b2c81e;
    stim[58] = 70'h19e0d5c54cb453fbb5;
    stim[59] = 70'h17e8b7bae1fee8575e;
    stim[60] = 70'h1d2fcbddccde70cdab;
    stim[61] = 70'h0876dfc55483f81cf3;
    stim[62] = 70'h128432f34b53411abf;
    stim[63] = 70'h084468f8b355cee399;
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
      expv[0] = 33'h1016a2590;
      expv[1] = 33'h13ca98072;
      expv[2] = 33'h080231364;
      expv[3] = 33'h14fae9c30;
      expv[4] = 33'h13a82a19a;
      expv[5] = 33'h00563a066;
      expv[6] = 33'h06cf61c32;
      expv[7] = 33'h197ffab8c;
      expv[8] = 33'h1c1a897a8;
      expv[9] = 33'h12a3616f3;
      expv[10] = 33'h09d45f52f;
      expv[11] = 33'h115790662;
      expv[12] = 33'h1fc7cbd88;
      expv[13] = 33'h1acbe1d70;
      expv[14] = 33'h1984b46eb;
      expv[15] = 33'h16f03716a;
      expv[16] = 33'h0c1420c96;
      expv[17] = 33'h0bd4b8021;
      expv[18] = 33'h11401bfcc;
      expv[19] = 33'h0d63aab4a;
      expv[20] = 33'h03e00bf92;
      expv[21] = 33'h136d57216;
      expv[22] = 33'h0e6178326;
      expv[23] = 33'h05d69dfe8;
      expv[24] = 33'h08879b864;
      expv[25] = 33'h027994448;
      expv[26] = 33'h1fbd4b9d8;
      expv[27] = 33'h0ea489fb6;
      expv[28] = 33'h184c0f84e;
      expv[29] = 33'h145fd1278;
      expv[30] = 33'h1a21ced28;
      expv[31] = 33'h1c5b9b628;
      expv[32] = 33'h0a0ee961a;
      expv[33] = 33'h02f54bcfe;
      expv[34] = 33'h11d50d780;
      expv[35] = 33'h05a61ba92;
      expv[36] = 33'h05a70c6c2;
      expv[37] = 33'h09e9f947c;
      expv[38] = 33'h10d6f5568;
      expv[39] = 33'h0ab892efc;
      expv[40] = 33'h1a316d5f8;
      expv[41] = 33'h112dfb528;
      expv[42] = 33'h0e8421b52;
      expv[43] = 33'h1757d324c;
      expv[44] = 33'h00dc7ddf4;
      expv[45] = 33'h11e60c43b;
      expv[46] = 33'h0a6f171f6;
      expv[47] = 33'h092b408f8;
      expv[48] = 33'h15063daa5;
      expv[49] = 33'h0fb2c13e4;
      expv[50] = 33'h1cdcbc8f2;
      expv[51] = 33'h064d8813e;
      expv[52] = 33'h03ec535fa;
      expv[53] = 33'h0b06ad8b5;
      expv[54] = 33'h0eeea98db;
      expv[55] = 33'h060b043c6;
      expv[56] = 33'h1ee25bb94;
      expv[57] = 33'h0b0b2c81e;
      expv[58] = 33'h0b453fbb4;
      expv[59] = 33'h1fee8575f;
      expv[60] = 33'h0de70cdaa;
      expv[61] = 33'h083f81cf2;
      expv[62] = 33'h153411abe;
      expv[63] = 33'h155cee398;
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
