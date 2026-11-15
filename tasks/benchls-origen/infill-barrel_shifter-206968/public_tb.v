// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_206968 dut (
    .clk(clk),
    .penable(in_vec[42:42]),
    .reset(in_vec[41:41]),
    .stalled(in_vec[40:40]),
    .din(in_vec[39:8]),
    .shift(in_vec[7:3]),
    .dir(in_vec[2:2]),
    .set(in_vec[1:1]),
    .do_shift(in_vec[0:0]),
    .dout(out_vec[37:6]),
    .shift_count(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h3ba90a7a45b;
    stim[1] = 43'h2118c1c8e77;
    stim[2] = 43'h1a068066dca;
    stim[3] = 43'h47cf6e80fa4;
    stim[4] = 43'h42e820dc0be;
    stim[5] = 43'h57b5e882f66;
    stim[6] = 43'h0949ece4cbb;
    stim[7] = 43'h1513d123291;
    stim[8] = 43'h5e246866e2d;
    stim[9] = 43'h40235a3b959;
    stim[10] = 43'h0fc2462852f;
    stim[11] = 43'h1c3dc3a9073;
    stim[12] = 43'h17308544925;
    stim[13] = 43'h5e9a66916c3;
    stim[14] = 43'h0be0c7151ee;
    stim[15] = 43'h0b07121eaa7;
    stim[16] = 43'h4933238d4c3;
    stim[17] = 43'h1654f0b043f;
    stim[18] = 43'h07336bee712;
    stim[19] = 43'h1ee2cc2f15d;
    stim[20] = 43'h1006cfecbb3;
    stim[21] = 43'h07e93de039c;
    stim[22] = 43'h4e7d68564ae;
    stim[23] = 43'h11aeaecc843;
    stim[24] = 43'h471f583727c;
    stim[25] = 43'h0563b7a0a19;
    stim[26] = 43'h4a894d6c405;
    stim[27] = 43'h14c451e42fc;
    stim[28] = 43'h11d0c7a9930;
    stim[29] = 43'h4a58177bfa4;
    stim[30] = 43'h1bf04a7060b;
    stim[31] = 43'h14c2b0cfcda;
    stim[32] = 43'h069e6d0e0f0;
    stim[33] = 43'h1d3435856c4;
    stim[34] = 43'h060cb82d730;
    stim[35] = 43'h56a670ca320;
    stim[36] = 43'h41c65a20ff1;
    stim[37] = 43'h45457937111;
    stim[38] = 43'h5fe8e6d8a75;
    stim[39] = 43'h0fa9744cebb;
    stim[40] = 43'h1d009051679;
    stim[41] = 43'h0697922b491;
    stim[42] = 43'h4675715cbca;
    stim[43] = 43'h148cc216155;
    stim[44] = 43'h0496edc401e;
    stim[45] = 43'h43d506b7ff3;
    stim[46] = 43'h0a387e2c4f9;
    stim[47] = 43'h581a4258485;
    stim[48] = 43'h51533e0c6bf;
    stim[49] = 43'h5cf9022429b;
    stim[50] = 43'h59c902ab8c1;
    stim[51] = 43'h543d3d271b8;
    stim[52] = 43'h1be28a0c19f;
    stim[53] = 43'h4f73565f5c7;
    stim[54] = 43'h03eb606b036;
    stim[55] = 43'h563beee3284;
    stim[56] = 43'h5c7af5e13c1;
    stim[57] = 43'h470306e5965;
    stim[58] = 43'h1a8c3fd3a6a;
    stim[59] = 43'h5afd3108bbd;
    stim[60] = 43'h4d20d2723cd;
    stim[61] = 43'h506baa414be;
    stim[62] = 43'h62ee5fd763c;
    stim[63] = 43'h106b53b424e;
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
      expv[0] = 38'hxxxxxxxxx0;
      expv[1] = 38'hxxxxxxxxx0;
      expv[2] = 38'h0000000020;
      expv[3] = 38'h0000000020;
      expv[4] = 38'h0000000020;
      expv[5] = 38'h0ba0837000;
      expv[6] = 38'hxxxxxxxxx0;
      expv[7] = 38'hxxxxxxxxx0;
      expv[8] = 38'hxxxxxxxxx0;
      expv[9] = 38'hxxxxxxxxx0;
      expv[10] = 38'h041b800015;
      expv[11] = 38'h041b800015;
      expv[12] = 38'h041b800015;
      expv[13] = 38'h041b800015;
      expv[14] = 38'h041b800015;
      expv[15] = 38'h041b800015;
      expv[16] = 38'h041b800015;
      expv[17] = 38'h041b800000;
      expv[18] = 38'h24cc8e3500;
      expv[19] = 38'h041b800000;
      expv[20] = 38'h041b800000;
      expv[21] = 38'h24cc8e3500;
      expv[22] = 38'h24cc8e3500;
      expv[23] = 38'h041b800000;
      expv[24] = 38'h39f5a15900;
      expv[25] = 38'h041b800000;
      expv[26] = 38'h041b800000;
      expv[27] = 38'h0000000020;
      expv[28] = 38'h0000000020;
      expv[29] = 38'h0000000020;
      expv[30] = 38'h0000000020;
      expv[31] = 38'h0000000020;
      expv[32] = 38'h0000000020;
      expv[33] = 38'h0000000020;
      expv[34] = 38'h0000000020;
      expv[35] = 38'h0000000020;
      expv[36] = 38'h0000000020;
      expv[37] = 38'h0000000002;
      expv[38] = 38'h000000001e;
      expv[39] = 38'h000000001e;
      expv[40] = 38'h000000001e;
      expv[41] = 38'h000000001e;
      expv[42] = 38'h000000001e;
      expv[43] = 38'h0000000000;
      expv[44] = 38'h19d5c572c0;
      expv[45] = 38'h0000000000;
      expv[46] = 38'h0000000000;
      expv[47] = 38'h0000000000;
      expv[48] = 38'h0000000000;
      expv[49] = 38'h0000000000;
      expv[50] = 38'h0000000000;
      expv[51] = 38'h0f541adfc0;
      expv[52] = 38'h0000000000;
      expv[53] = 38'h0000000000;
      expv[54] = 38'h3dcd597d40;
      expv[55] = 38'h3dcd597d40;
      expv[56] = 38'h0000000000;
      expv[57] = 38'h0000000000;
      expv[58] = 38'h17d4000014;
      expv[59] = 38'h17d4000014;
      expv[60] = 38'h17d4000014;
      expv[61] = 38'h2a00000007;
      expv[62] = 38'h0000000020;
      expv[63] = 38'h0000000020;
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
