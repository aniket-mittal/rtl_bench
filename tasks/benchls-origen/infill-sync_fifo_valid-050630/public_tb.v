// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050630 dut (
    .clk(clk),
    .reset(in_vec[34:34]),
    .req_r(in_vec[33:33]),
    .we(in_vec[32:32]),
    .data_w(in_vec[31:0]),
    .data_r(out_vec[34:3]),
    .valid_r(out_vec[2:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h49ff93548;
    stim[1] = 35'h574ae2c2f;
    stim[2] = 35'h1ec486dc4;
    stim[3] = 35'h2a46d8125;
    stim[4] = 35'h22e7afffa;
    stim[5] = 35'h0e9e55371;
    stim[6] = 35'h2f6df4cdb;
    stim[7] = 35'h3369b0515;
    stim[8] = 35'h36231581c;
    stim[9] = 35'h0ade6d10d;
    stim[10] = 35'h13a25dbb7;
    stim[11] = 35'h7260808ea;
    stim[12] = 35'h3a2a2acdb;
    stim[13] = 35'h08b32b83d;
    stim[14] = 35'h040655702;
    stim[15] = 35'h36c5ef53e;
    stim[16] = 35'h050d97cab;
    stim[17] = 35'h2d0f0018c;
    stim[18] = 35'h0471eadc9;
    stim[19] = 35'h1184973b2;
    stim[20] = 35'h092620a37;
    stim[21] = 35'h1c225a70a;
    stim[22] = 35'h287ac467f;
    stim[23] = 35'h2a0d44fd6;
    stim[24] = 35'h09e22446f;
    stim[25] = 35'h2b1041000;
    stim[26] = 35'h37e12f0a0;
    stim[27] = 35'h318a2e32c;
    stim[28] = 35'h36b9e4045;
    stim[29] = 35'h07a6499e6;
    stim[30] = 35'h3fb4c3aed;
    stim[31] = 35'h0680e6443;
    stim[32] = 35'h2d852e0e7;
    stim[33] = 35'h35a291893;
    stim[34] = 35'h0b23694f6;
    stim[35] = 35'h1d1d9434e;
    stim[36] = 35'h6f33ced24;
    stim[37] = 35'h1095f84c9;
    stim[38] = 35'h0a5ba778c;
    stim[39] = 35'h2aef0fab6;
    stim[40] = 35'h132e6ea70;
    stim[41] = 35'h20f3c6cbf;
    stim[42] = 35'h25279c8e4;
    stim[43] = 35'h317ebcb69;
    stim[44] = 35'h32baad482;
    stim[45] = 35'h0b21e4d20;
    stim[46] = 35'h33fd83169;
    stim[47] = 35'h03c557d5d;
    stim[48] = 35'h300254091;
    stim[49] = 35'h0c33e3c45;
    stim[50] = 35'h074cca3ea;
    stim[51] = 35'h366fde8eb;
    stim[52] = 35'h1fa7066c3;
    stim[53] = 35'h13a3e1b53;
    stim[54] = 35'h0a28c71ec;
    stim[55] = 35'h33d8a93ec;
    stim[56] = 35'h33f9bd64a;
    stim[57] = 35'h1a68b91f2;
    stim[58] = 35'h3c7c8f602;
    stim[59] = 35'h244a43888;
    stim[60] = 35'h25dfad9b9;
    stim[61] = 35'h1ee57b27a;
    stim[62] = 35'h160b0ed09;
    stim[63] = 35'h14d93db28;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'hxxxxxxxxx;
      expv[3] = 35'hxxxxxxxxx;
      expv[4] = 35'h762436e25;
      expv[5] = 35'h762436e21;
      expv[6] = 35'h762436e21;
      expv[7] = 35'h762436e21;
      expv[8] = 35'h762436e20;
      expv[9] = 35'h1b4d828ac;
      expv[10] = 35'h1b4d828a8;
      expv[11] = 35'h1b4d828a9;
      expv[12] = 35'h1b4d828a9;
      expv[13] = 35'h1b4d828a8;
      expv[14] = 35'h1b4d828a8;
      expv[15] = 35'h1b4d828a8;
      expv[16] = 35'h5151566dc;
      expv[17] = 35'h5151566d8;
      expv[18] = 35'h362f7a9f5;
      expv[19] = 35'h362f7a9f1;
      expv[20] = 35'h362f7a9f0;
      expv[21] = 35'h362f7a9f0;
      expv[22] = 35'h362f7a9f0;
      expv[23] = 35'h0c24b9d94;
      expv[24] = 35'h6112d3855;
      expv[25] = 35'h6112d3851;
      expv[26] = 35'h6112d3851;
      expv[27] = 35'h6112d3850;
      expv[28] = 35'h3f0978504;
      expv[29] = 35'h0c5171964;
      expv[30] = 35'h0c5171960;
      expv[31] = 35'h35cf2022c;
      expv[32] = 35'h35cf2022a;
      expv[33] = 35'h7da61d76f;
      expv[34] = 35'h7da61d769;
      expv[35] = 35'h7da61d769;
      expv[36] = 35'h7da61d769;
      expv[37] = 35'h7da61d769;
      expv[38] = 35'h7da61d768;
      expv[39] = 35'h7da61d768;
      expv[40] = 35'h04afc264d;
      expv[41] = 35'h04afc2648;
      expv[42] = 35'h197375385;
      expv[43] = 35'h197375381;
      expv[44] = 35'h197375380;
      expv[45] = 35'h0bf5e5b4c;
      expv[46] = 35'h0bf5e5b48;
      expv[47] = 35'h15d56a414;
      expv[48] = 35'h15d56a410;
      expv[49] = 35'h1fec18b4c;
      expv[50] = 35'h1fec18b48;
      expv[51] = 35'h1fec18b48;
      expv[52] = 35'h0012a048c;
      expv[53] = 35'h0012a0488;
      expv[54] = 35'h0012a048a;
      expv[55] = 35'h0012a048a;
      expv[56] = 35'h337ef475e;
      expv[57] = 35'h7d383361e;
      expv[58] = 35'h7d3833618;
      expv[59] = 35'h1d1f0da9c;
      expv[60] = 35'h63e47b015;
      expv[61] = 35'h63e47b011;
      expv[62] = 35'h63e47b010;
      expv[63] = 35'h63e47b010;
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
