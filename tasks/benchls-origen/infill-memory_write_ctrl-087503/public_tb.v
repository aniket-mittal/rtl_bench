// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087503 dut (
    .Clk(clk),
    .Start(in_vec[70:70]),
    .Reset(in_vec[69:69]),
    .Count(in_vec[68:64]),
    .WordIn(in_vec[63:0]),
    .AddressIn(out_vec[69:65]),
    .WordOut(out_vec[64:1]),
    .Valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h72bef5fa5f2e75a5b8;
    stim[1] = 71'h777de1347c2760c857;
    stim[2] = 71'h1467651db9316740d6;
    stim[3] = 71'h5117f9a8ee49755641;
    stim[4] = 71'h53f63017d41abbe5cb;
    stim[5] = 71'h5129b8c36fed6aac90;
    stim[6] = 71'h0b846da6b1a2cb00f1;
    stim[7] = 71'h41f2a79b46b9ceff3b;
    stim[8] = 71'h5bfe62e1371f22eba4;
    stim[9] = 71'h5c0db70c65bc0b93ed;
    stim[10] = 71'h441e3775e56eaea9a0;
    stim[11] = 71'h470476114d64b452d2;
    stim[12] = 71'h47ae22c4d8defb9b81;
    stim[13] = 71'h1994dfa5b91bc9880d;
    stim[14] = 71'h004308dccd4eade315;
    stim[15] = 71'h1e7fb351b47cabf2e2;
    stim[16] = 71'h0b124d971fdee10375;
    stim[17] = 71'h4b3883a3727129434a;
    stim[18] = 71'h0328a02668a9581404;
    stim[19] = 71'h13aabee9955ae862f9;
    stim[20] = 71'h1438b17b3fd07bfdac;
    stim[21] = 71'h4b2d8d07800dc830ce;
    stim[22] = 71'h44845f887bdf7488f2;
    stim[23] = 71'h1d42cfaebbb47d22b4;
    stim[24] = 71'h4151efb5c2ead2373a;
    stim[25] = 71'h49ca6a1a1b04964ed6;
    stim[26] = 71'h074d2796a26faaed3f;
    stim[27] = 71'h4844b0792985f24034;
    stim[28] = 71'h09c5ba0a5400fb5638;
    stim[29] = 71'h13af9fe13ecfdeb9b2;
    stim[30] = 71'h5d0f6863d394428da8;
    stim[31] = 71'h13b5e1bf772740e245;
    stim[32] = 71'h57fb504c741496ebe0;
    stim[33] = 71'h1aba1582b349b5785b;
    stim[34] = 71'h64214f90c30bf820e8;
    stim[35] = 71'h51e297b66c2018f4ed;
    stim[36] = 71'h4257953570ba1c9d30;
    stim[37] = 71'h524ebb4f845bd689a0;
    stim[38] = 71'h4d9ea531f1e48f8092;
    stim[39] = 71'h599b0b82f412e87d1d;
    stim[40] = 71'h0deead8a87d5c99d32;
    stim[41] = 71'h4158b008984a6c5dd9;
    stim[42] = 71'h1f416e273b7dadd53d;
    stim[43] = 71'h00cf6dbdfde3a339da;
    stim[44] = 71'h1a8c8f5ceb84b488db;
    stim[45] = 71'h5652e2ebb7bce2e892;
    stim[46] = 71'h1a5491ca070f1604f5;
    stim[47] = 71'h183b057014c5ee939f;
    stim[48] = 71'h1a9e1a02a94322631c;
    stim[49] = 71'h5309294de118a9830c;
    stim[50] = 71'h06293cc41e22862169;
    stim[51] = 71'h0f314d8e45ce21b0b3;
    stim[52] = 71'h1f7f4e0415d916501c;
    stim[53] = 71'h1309298c0d92c19cea;
    stim[54] = 71'h45508fbf213fc89a9d;
    stim[55] = 71'h15d539f9600126540a;
    stim[56] = 71'h41401540c69269bd5e;
    stim[57] = 71'h01881195360c4e5372;
    stim[58] = 71'h1deda18cf294c493bd;
    stim[59] = 71'h4c49fae115fbbb48c0;
    stim[60] = 71'h50e59c461864f4b803;
    stim[61] = 71'h07b8a88889fe4f3f9a;
    stim[62] = 71'h42183f05ce92358978;
    stim[63] = 71'h057231c3bacde5b1fe;
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
      expv[0] = 70'h020000000000000000;
      expv[1] = 70'h257debf4be5ceb4b71;
      expv[2] = 70'h2a0000000000000000;
      expv[3] = 70'h2a0000000000000000;
      expv[4] = 70'h240000000000000000;
      expv[5] = 70'h280000000000000000;
      expv[6] = 70'h240000000000000000;
      expv[7] = 70'h180000000000000000;
      expv[8] = 70'h040000000000000000;
      expv[9] = 70'h380000000000000000;
      expv[10] = 70'h3a0000000000000000;
      expv[11] = 70'h0a0000000000000000;
      expv[12] = 70'h100000000000000000;
      expv[13] = 70'h100000000000000000;
      expv[14] = 70'h340000000000000000;
      expv[15] = 70'h020000000000000000;
      expv[16] = 70'h3e0000000000000000;
      expv[17] = 70'h180000000000000000;
      expv[18] = 70'h180000000000000000;
      expv[19] = 70'h080000000000000000;
      expv[20] = 70'h280000000000000000;
      expv[21] = 70'h2a0000000000000000;
      expv[22] = 70'h180000000000000000;
      expv[23] = 70'h0a0000000000000000;
      expv[24] = 70'h3c0000000000000000;
      expv[25] = 70'h040000000000000000;
      expv[26] = 70'h140000000000000000;
      expv[27] = 70'h100000000000000000;
      expv[28] = 70'h120000000000000000;
      expv[29] = 70'h140000000000000000;
      expv[30] = 70'h280000000000000000;
      expv[31] = 70'h3c0000000000000000;
      expv[32] = 70'h280000000000000000;
      expv[33] = 70'h300000000000000000;
      expv[34] = 70'h360000000000000000;
      expv[35] = 70'h240000000000000000;
      expv[36] = 70'h240000000000000000;
      expv[37] = 70'h060000000000000000;
      expv[38] = 70'h260000000000000000;
      expv[39] = 70'h1c0000000000000000;
      expv[40] = 70'h340000000000000000;
      expv[41] = 70'h1c0000000000000000;
      expv[42] = 70'h040000000000000000;
      expv[43] = 70'h000000000000000000;
      expv[44] = 70'h020000000000000000;
      expv[45] = 70'h360000000000000000;
      expv[46] = 70'h2e0000000000000000;
      expv[47] = 70'h360000000000000000;
      expv[48] = 70'h320000000000000000;
      expv[49] = 70'h360000000000000000;
      expv[50] = 70'h280000000000000000;
      expv[51] = 70'h0e0000000000000000;
      expv[52] = 70'h200000000000000000;
      expv[53] = 70'h000000000000000000;
      expv[54] = 70'h280000000000000000;
      expv[55] = 70'h0c0000000000000000;
      expv[56] = 70'h2c0000000000000000;
      expv[57] = 70'h040000000000000000;
      expv[58] = 70'h040000000000000000;
      expv[59] = 70'h3c0000000000000000;
      expv[60] = 70'h1a0000000000000000;
      expv[61] = 70'h220000000000000000;
      expv[62] = 70'h100000000000000000;
      expv[63] = 70'h060000000000000000;
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
