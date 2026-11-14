// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_036693 dut (
    .clk(clk),
    .EX_PC_IMM(in_vec[69:38]),
    .EX_PC(in_vec[37:6]),
    .EX_opcode(in_vec[5:2]),
    .EX_condFlag(in_vec[1:1]),
    .prediction(in_vec[0:0]),
    .correctOut(out_vec[34:34]),
    .update(out_vec[33:33]),
    .reset(out_vec[32:32]),
    .newPC(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h2b715928209ef688e2;
    stim[1] = 70'h22ee8cf3ec407b2560;
    stim[2] = 70'h388ee5bc4ceea0b027;
    stim[3] = 70'h25ea24db0b0e0099f0;
    stim[4] = 70'h3d448ecb92a320af34;
    stim[5] = 70'h29a47c2b62ce5806a6;
    stim[6] = 70'h23f80ca241002db90b;
    stim[7] = 70'h10ef9f30d5fef827e5;
    stim[8] = 70'h02cd4641095b09ba8c;
    stim[9] = 70'h24e71f94f72b49eefb;
    stim[10] = 70'h0669c7334ba5ed6034;
    stim[11] = 70'h2268561cb7bbccb477;
    stim[12] = 70'h2ae8bbf13c6ceb350d;
    stim[13] = 70'h156c9648ddd89e77b0;
    stim[14] = 70'h2312ccc243df94c517;
    stim[15] = 70'h2b09454d6febda78cd;
    stim[16] = 70'h03dec8138b05301daf;
    stim[17] = 70'h0c738677d45d8686fe;
    stim[18] = 70'h392c611598fb93a021;
    stim[19] = 70'h308b1930fae4b9cb50;
    stim[20] = 70'h129ac752d63fdaad80;
    stim[21] = 70'h26bff6ac58ec6acf13;
    stim[22] = 70'h3e1a16dd98725a0094;
    stim[23] = 70'h1010feded55b50f7d0;
    stim[24] = 70'h35f549025fa903a6ed;
    stim[25] = 70'h0ad2c4390e06632455;
    stim[26] = 70'h1fbaf60463d9a516e9;
    stim[27] = 70'h0152098093733901db;
    stim[28] = 70'h0c4511ee06a86c331f;
    stim[29] = 70'h2379c160b96063105b;
    stim[30] = 70'h32a16a8ff9f8b3e24d;
    stim[31] = 70'h15d6ea89134518f46c;
    stim[32] = 70'h21b14872eab14af278;
    stim[33] = 70'h188480e30f0b243016;
    stim[34] = 70'h3dc9bb5ab295edf2c7;
    stim[35] = 70'h015530818f2e3b967e;
    stim[36] = 70'h04314eea333c35e750;
    stim[37] = 70'h0fb2e4bc469b5fb651;
    stim[38] = 70'h1814095abf50f392cd;
    stim[39] = 70'h181ea7d4a6c550722e;
    stim[40] = 70'h017fbbb54d0acc346e;
    stim[41] = 70'h15e8c56b7e0ca323dd;
    stim[42] = 70'h31a5086b920ea0ac2a;
    stim[43] = 70'h2db6ca58df10516ac3;
    stim[44] = 70'h332ef33c84966f4680;
    stim[45] = 70'h3273b2b4fa34b4e9b8;
    stim[46] = 70'h029340d4342c28ea70;
    stim[47] = 70'h2c15515ef2f27e6bc4;
    stim[48] = 70'h1d088780bd9871aedb;
    stim[49] = 70'h33bf35b13d3104e197;
    stim[50] = 70'h131085311b0e49b3cd;
    stim[51] = 70'h06ebc9f0369fb6c919;
    stim[52] = 70'h082eb89e65fe9ee413;
    stim[53] = 70'h23780d2c1a8ec43e10;
    stim[54] = 70'h0ed1a89bea7bcac5cf;
    stim[55] = 70'h0e0ec3729c06559ea9;
    stim[56] = 70'h0801d1522871d9c45d;
    stim[57] = 70'h2dd25b4ae7a6773234;
    stim[58] = 70'h043ba72a11c91d1083;
    stim[59] = 70'h2180da054c6b8c8fa8;
    stim[60] = 70'h1040926d6d31c60c73;
    stim[61] = 70'h3485a4a132323a40e4;
    stim[62] = 70'h0fecddf73f63dcfc16;
    stim[63] = 70'h34dc40dc003431dae1;
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
      expv[1] = 35'h3adc564a0;
      expv[2] = 35'h6b101ec99;
      expv[3] = 35'h033ba82c4;
      expv[4] = 35'h02c38026b;
      expv[5] = 35'h04a8c82c0;
      expv[6] = 35'h08b39601e;
      expv[7] = 35'h00400b6e8;
      expv[8] = 35'h057fbe0a3;
      expv[9] = 35'h0256c26ee;
      expv[10] = 35'h0dcad27bf;
      expv[11] = 35'h02e97b584;
      expv[12] = 35'h0deef32d5;
      expv[13] = 35'h0f1b3acd8;
      expv[14] = 35'h0776279e2;
      expv[15] = 35'h00f7e5318;
      expv[16] = 35'h0bfaf69e7;
      expv[17] = 35'h02c14c07a;
      expv[18] = 35'h051761a1f;
      expv[19] = 35'h363ee4e80;
      expv[20] = 35'h0eb92e731;
      expv[21] = 35'h058ff6aba;
      expv[22] = 35'h063b1ab40;
      expv[23] = 35'h061c96806;
      expv[24] = 35'h0556d43e3;
      expv[25] = 35'h07ea40e9f;
      expv[26] = 35'h038198c95;
      expv[27] = 35'h08f66945f;
      expv[28] = 35'h04dcce40b;
      expv[29] = 35'h01aa1b0d0;
      expv[30] = 35'h0e5818c45;
      expv[31] = 35'h0e7e2cf8d;
      expv[32] = 35'h04d1463d5;
      expv[33] = 35'h0aac52bcd;
      expv[34] = 35'h03c2c90c4;
      expv[35] = 35'h0ca57b7cf;
      expv[36] = 35'h03cb8ee5d;
      expv[37] = 35'h0ccf0d7a1;
      expv[38] = 35'h01a6d7edd;
      expv[39] = 35'h0fd43ce4f;
      expv[40] = 35'h09b1541cc;
      expv[41] = 35'h0342b30d5;
      expv[42] = 35'h0f8328c93;
      expv[43] = 35'h0483a82b4;
      expv[44] = 35'h07c4145af;
      expv[45] = 35'h01259bd1e;
      expv[46] = 35'h0e8d2d3aa;
      expv[47] = 35'h0d0b0a3ad;
      expv[48] = 35'h0cbc9f9b3;
      expv[49] = 35'h0f661c6bf;
      expv[50] = 35'h0f4c4138a;
      expv[51] = 35'h06c3926d3;
      expv[52] = 35'h0da7edb28;
      expv[53] = 35'h097fa7b94;
      expv[54] = 35'h06a3b10fc;
      expv[55] = 35'h0a9ef2b1b;
      expv[56] = 35'h07019567e;
      expv[57] = 35'h0a1c76715;
      expv[58] = 35'h09e99dccc;
      expv[59] = 35'h047247446;
      expv[60] = 35'h031ae3242;
      expv[61] = 35'h0b4c71835;
      expv[62] = 35'h0c8c8e907;
      expv[63] = 35'h0fd8f73f4;
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
