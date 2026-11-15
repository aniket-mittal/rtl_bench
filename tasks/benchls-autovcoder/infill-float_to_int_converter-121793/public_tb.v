// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121793 dut (
    .io_in(in_vec[34:2]),
    .io_roundingMode(in_vec[1:0]),
    .io_out(out_vec[69:5]),
    .io_exceptionFlags(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h08feb4b45;
    stim[1] = 35'h75dd3cab5;
    stim[2] = 35'h1414d40b0;
    stim[3] = 35'h4decc4875;
    stim[4] = 35'h29bd6acea;
    stim[5] = 35'h58c818dde;
    stim[6] = 35'h2ca7c7478;
    stim[7] = 35'h0a02d829f;
    stim[8] = 35'h48c93970f;
    stim[9] = 35'h4cbb1677f;
    stim[10] = 35'h142884994;
    stim[11] = 35'h7d546837b;
    stim[12] = 35'h69ce589c3;
    stim[13] = 35'h2397f78d5;
    stim[14] = 35'h5b524496a;
    stim[15] = 35'h41c8f7111;
    stim[16] = 35'h23f2db96c;
    stim[17] = 35'h7f0d96724;
    stim[18] = 35'h7ca8bb58a;
    stim[19] = 35'h04c7b31f7;
    stim[20] = 35'h692c0586a;
    stim[21] = 35'h1c6a750b2;
    stim[22] = 35'h3da5e8a98;
    stim[23] = 35'h24220d912;
    stim[24] = 35'h472c3ea56;
    stim[25] = 35'h1de3ce698;
    stim[26] = 35'h33d2b4942;
    stim[27] = 35'h2d236f421;
    stim[28] = 35'h26ec559e2;
    stim[29] = 35'h3a68a91ca;
    stim[30] = 35'h1f717a054;
    stim[31] = 35'h1f7b281ee;
    stim[32] = 35'h4e5cc5579;
    stim[33] = 35'h66826c055;
    stim[34] = 35'h5b525295f;
    stim[35] = 35'h67125f5fe;
    stim[36] = 35'h67f8292c6;
    stim[37] = 35'h1c98ac87f;
    stim[38] = 35'h32c56fec1;
    stim[39] = 35'h26773c404;
    stim[40] = 35'h537192300;
    stim[41] = 35'h2246d4162;
    stim[42] = 35'h3b1ecd5a3;
    stim[43] = 35'h524bb0d1a;
    stim[44] = 35'h46d5d1105;
    stim[45] = 35'h0aaead18f;
    stim[46] = 35'h2e39dcd06;
    stim[47] = 35'h0900a2e7e;
    stim[48] = 35'h12e751799;
    stim[49] = 35'h080768358;
    stim[50] = 35'h06a5638e3;
    stim[51] = 35'h6b74cb9f2;
    stim[52] = 35'h1d688aba3;
    stim[53] = 35'h63d13fc2b;
    stim[54] = 35'h0419e763c;
    stim[55] = 35'h2a8269d42;
    stim[56] = 35'h707722bd7;
    stim[57] = 35'h3207828c5;
    stim[58] = 35'h3f6ebd947;
    stim[59] = 35'h38c3b6af9;
    stim[60] = 35'h52ae93860;
    stim[61] = 35'h74e87e8d8;
    stim[62] = 35'h364fc423d;
    stim[63] = 35'h1dc98f453;
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
      expv[0] = 70'h0e8feb4b4400000000;
      expv[1] = 70'h395dd3cab400000000;
      expv[2] = 70'h0f414d40b000000000;
      expv[3] = 70'h2edecc487400000000;
      expv[4] = 70'h109bd6ace800000000;
      expv[5] = 70'h2f8c818ddc00000000;
      expv[6] = 70'h10ca7c747800000000;
      expv[7] = 70'h0ea02d829c00000000;
      expv[8] = 70'h2e8c93970c00000000;
      expv[9] = 70'h2ecbb1677c00000000;
      expv[10] = 70'h0f4288499400000000;
      expv[11] = 70'h1dd500000000000000;
      expv[12] = 70'h309ce589c000000000;
      expv[13] = 70'h10397f78d400000000;
      expv[14] = 70'h2fb524496800000000;
      expv[15] = 70'h221c8f711000000000;
      expv[16] = 70'h103f2db96c00000000;
      expv[17] = 70'h1df100000000000010;
      expv[18] = 70'h1dcb00000000000010;
      expv[19] = 70'h024c7b31f400000000;
      expv[20] = 70'h3092c0586800000000;
      expv[21] = 70'h0fc6a750b000000000;
      expv[22] = 70'h1ddb00000000000010;
      expv[23] = 70'h104220d91000000000;
      expv[24] = 70'h2272c3ea5400000000;
      expv[25] = 70'h0fde3ce69800000000;
      expv[26] = 70'h193d2b494000000000;
      expv[27] = 70'h10d236f42000000000;
      expv[28] = 70'h106ec559e000000000;
      expv[29] = 70'h1da700000000000010;
      expv[30] = 70'h0ff717a05400000000;
      expv[31] = 70'h0ff7b281ec00000000;
      expv[32] = 70'h2ee5cc557800000000;
      expv[33] = 70'h306826c05400000000;
      expv[34] = 70'h2fb525295c00000000;
      expv[35] = 70'h307125f5fc00000000;
      expv[36] = 70'h307f8292c400000000;
      expv[37] = 70'h0fc98ac87c00000000;
      expv[38] = 70'h192c56fec000000000;
      expv[39] = 70'h106773c40400000000;
      expv[40] = 70'h2f3719230000000000;
      expv[41] = 70'h10246d416000000000;
      expv[42] = 70'h1db100000000000000;
      expv[43] = 70'h2f24bb0d1800000000;
      expv[44] = 70'h226d5d110400000000;
      expv[45] = 70'h0eaaead18c00000000;
      expv[46] = 70'h10e39dcd0400000000;
      expv[47] = 70'h0e900a2e7c00000000;
      expv[48] = 70'h0f2e75179800000000;
      expv[49] = 70'h0e8076835800000000;
      expv[50] = 70'h026a5638e000000000;
      expv[51] = 70'h30b74cb9f000000000;
      expv[52] = 70'h0fd688aba000000000;
      expv[53] = 70'h303d13fc2800000000;
      expv[54] = 70'h02419e763c00000000;
      expv[55] = 70'h10a8269d4000000000;
      expv[56] = 70'h3907722bd400000000;
      expv[57] = 70'h19207828c400000000;
      expv[58] = 70'h1df700000000000010;
      expv[59] = 70'h1d8d00000000000010;
      expv[60] = 70'h2f2ae9386000000000;
      expv[61] = 70'h394e87e8d800000000;
      expv[62] = 70'h1964fc423c00000000;
      expv[63] = 70'h0fdc98f45000000000;
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
