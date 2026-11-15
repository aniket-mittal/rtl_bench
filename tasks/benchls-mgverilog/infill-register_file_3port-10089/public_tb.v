// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10089 dut (
    .clk(clk),
    .regA(in_vec[52:48]),
    .regB(in_vec[47:43]),
    .regTEST(in_vec[42:38]),
    .regW(in_vec[37:33]),
    .Wdat(in_vec[32:1]),
    .RegWrite(in_vec[0:0]),
    .Adat(out_vec[95:64]),
    .Bdat(out_vec[63:32]),
    .TESTdat(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h113fab2b8d1b98;
    stim[1] = 53'h1c93fc2c64d45e;
    stim[2] = 53'h0ec86815a4f86a;
    stim[3] = 53'h048e9ac06cba59;
    stim[4] = 53'h0ba11e85f9e3f8;
    stim[5] = 53'h185da1cc7b41a3;
    stim[6] = 53'h16e686c5f2c703;
    stim[7] = 53'h180a78fe5031d7;
    stim[8] = 53'h02072b74b7ddff;
    stim[9] = 53'h0366eb57c2c7ac;
    stim[10] = 53'h035034936d636c;
    stim[11] = 53'h1e45f327f0d4c2;
    stim[12] = 53'h01946883d48fe4;
    stim[13] = 53'h1403e65499f6bf;
    stim[14] = 53'h1906e92ddc7bcd;
    stim[15] = 53'h04ffc6f920cdc5;
    stim[16] = 53'h12abea707fbca3;
    stim[17] = 53'h0601d2365007ee;
    stim[18] = 53'h195d770e9f7514;
    stim[19] = 53'h1cc4f18827e3ee;
    stim[20] = 53'h006820f13945e1;
    stim[21] = 53'h02077e06f6c854;
    stim[22] = 53'h02ce319d55dd3f;
    stim[23] = 53'h0614347181f119;
    stim[24] = 53'h1fd545538a6336;
    stim[25] = 53'h1999f26582aa07;
    stim[26] = 53'h1548ee0810e26f;
    stim[27] = 53'h1655a625617f41;
    stim[28] = 53'h10f30d43e1c203;
    stim[29] = 53'h1242b6f8197000;
    stim[30] = 53'h07c3efe1eb8be4;
    stim[31] = 53'h1ce12a04eed417;
    stim[32] = 53'h058285637895c5;
    stim[33] = 53'h1c529b5d25cfff;
    stim[34] = 53'h15ef03e406388f;
    stim[35] = 53'h1d34a0d2ecd8a6;
    stim[36] = 53'h1210dab86a42d2;
    stim[37] = 53'h012dbeb385ac97;
    stim[38] = 53'h190b12fbb82265;
    stim[39] = 53'h06bc747c604468;
    stim[40] = 53'h1d252b3fff64ec;
    stim[41] = 53'h00f611cb002a0e;
    stim[42] = 53'h0efa6b63d8a107;
    stim[43] = 53'h1308cfd2a913e1;
    stim[44] = 53'h059c38cc6b6a1d;
    stim[45] = 53'h12ec0cd90f1188;
    stim[46] = 53'h19430eb83db459;
    stim[47] = 53'h05212a370c44f0;
    stim[48] = 53'h0739042d8e3a14;
    stim[49] = 53'h0a7d545d491c70;
    stim[50] = 53'h0d1d22f99364a3;
    stim[51] = 53'h0912e6befd468d;
    stim[52] = 53'h0656dc049eec71;
    stim[53] = 53'h12d0aace752637;
    stim[54] = 53'h159095d1b7ffc4;
    stim[55] = 53'h06c5408bc3bf82;
    stim[56] = 53'h11fb75d5529e0f;
    stim[57] = 53'h188ce04c0fbd63;
    stim[58] = 53'h00f1890c24f8e9;
    stim[59] = 53'h0fe97745fc86fd;
    stim[60] = 53'h1b9790646ff885;
    stim[61] = 53'h003bd377eb491e;
    stim[62] = 53'h0b0514fe7c14b5;
    stim[63] = 53'h0f0f9508f2d9bc;
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
      expv[0] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 96'hxxxxxxxxxxxxxxxx7f2818eb;
      expv[9] = 96'h62f96381xxxxxxxxxxxxxxxx;
      expv[10] = 96'h62f96381xxxxxxxxxxxxxxxx;
      expv[11] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 96'hxxxxxxxxba5beeffxxxxxxxx;
      expv[17] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 96'hxxxxxxxxxxxxxxxx383fde51;
      expv[19] = 96'h7f2818ebxxxxxxxx2a4cfb5f;
      expv[20] = 96'hxxxxxxxx60365d2cxxxxxxxx;
      expv[21] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 96'hxxxxxxxxxxxxxxxx789ca2f0;
      expv[24] = 96'hxxxxxxxx38c0f88c383fde51;
      expv[25] = 96'hxxxxxxxx2a4cfb5fxxxxxxxx;
      expv[26] = 96'h383fde51xxxxxxxx7c9066e2;
      expv[27] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 96'h789ca2f0xxxxxxxxxxxxxxxx;
      expv[29] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 96'hxxxxxxxxceaaee9fxxxxxxxx;
      expv[31] = 96'h7f2818eb7f2818ebxxxxxxxx;
      expv[32] = 96'hxxxxxxxx789ca2f0xxxxxxxx;
      expv[33] = 96'h7f2818ebxxxxxxxxxxxxxxxx;
      expv[34] = 96'h02776a0bxxxxxxxx7f2818eb;
      expv[35] = 96'hxxxxxxxxa1f0e101xxxxxxxx;
      expv[36] = 96'hxxxxxxxxb1bc4ae27c9066e2;
      expv[37] = 96'hf2031c47xxxxxxxxxxxxxxxx;
      expv[38] = 96'h32c15503f2031c47xxxxxxxx;
      expv[39] = 96'ha1f0e10104087137xxxxxxxx;
      expv[40] = 96'hxxxxxxxxxxxxxxxx96ee3de6;
      expv[41] = 96'hxxxxxxxxxxxxxxxxceaaee9f;
      expv[42] = 96'hxxxxxxxx59c2d64b7ddc1132;
      expv[43] = 96'h12b0bfa0f2031c477c9066e2;
      expv[44] = 96'hxxxxxxxx12b0bfa0789ca2f0;
      expv[45] = 96'hxxxxxxxxxxxxxxxx789ca2f0;
      expv[46] = 96'h32c15503xxxxxxxxxxxxxxxx;
      expv[47] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 96'h5c1eda2c5c1eda2cxxxxxxxx;
      expv[49] = 96'hxxxxxxxxxxxxxxxxb1ec5083;
      expv[50] = 96'hae92e7ff7c9066e296ee3de6;
      expv[51] = 96'h7ddc1132b1bc4ae2xxxxxxxx;
      expv[52] = 96'ha1f0e101xxxxxxxxxxxxxxxx;
      expv[53] = 96'hxxxxxxxx38c0f88cb1bc4ae2;
      expv[54] = 96'h673a931bxxxxxxxxb1bc4ae2;
      expv[55] = 96'ha1f0e101ceaaee9f673a931b;
      expv[56] = 96'h7cc9b25159c2d64bae92e7ff;
      expv[57] = 96'hceaaee9f7cc9b2515f7ea346;
      expv[58] = 96'hxxxxxxxxxxxxxxxxa1f0e101;
      expv[59] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 96'ha2fe437exxxxxxxxxxxxxxxx;
      expv[61] = 96'hxxxxxxxx5c1eda2cxxxxxxxx;
      expv[62] = 96'hxxxxxxxxxxxxxxxx96ee3de6;
      expv[63] = 96'hxxxxxxxxf2031c47xxxxxxxx;
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
