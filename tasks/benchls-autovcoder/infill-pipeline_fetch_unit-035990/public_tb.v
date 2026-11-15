// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_035990 dut (
    .clock(clk),
    .pc_in(in_vec[33:2]),
    .stall(in_vec[1:1]),
    .clear(in_vec[0:0]),
    .instruct(out_vec[96:65]),
    .pc_out(out_vec[64:33]),
    .spec(out_vec[32:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h37075eba1;
    stim[1] = 34'h1dffe5c82;
    stim[2] = 34'h129a78025;
    stim[3] = 34'h10a6313e6;
    stim[4] = 34'h0f496a81b;
    stim[5] = 34'h30a404db1;
    stim[6] = 34'h36adfc5c4;
    stim[7] = 34'h142629537;
    stim[8] = 34'h090badc08;
    stim[9] = 34'h23ff4d9e4;
    stim[10] = 34'h09737d16f;
    stim[11] = 34'h07eb9ded5;
    stim[12] = 34'h0336bb9c1;
    stim[13] = 34'h35e2364a9;
    stim[14] = 34'h319ea2221;
    stim[15] = 34'h0372690ac;
    stim[16] = 34'h15f932e56;
    stim[17] = 34'h362a5317e;
    stim[18] = 34'h32678d72e;
    stim[19] = 34'h36791700c;
    stim[20] = 34'h194b5c314;
    stim[21] = 34'h33f7bd644;
    stim[22] = 34'h3cdc88885;
    stim[23] = 34'h22da637fb;
    stim[24] = 34'h29816c9bb;
    stim[25] = 34'h2362dc3f2;
    stim[26] = 34'h388b0052a;
    stim[27] = 34'h09ced19c0;
    stim[28] = 34'h0942b5d52;
    stim[29] = 34'h0e159c598;
    stim[30] = 34'h01887dfb0;
    stim[31] = 34'h3870bb399;
    stim[32] = 34'h35b6307c1;
    stim[33] = 34'h187c909ff;
    stim[34] = 34'h134e7b9d8;
    stim[35] = 34'h3257a7822;
    stim[36] = 34'h1105df86e;
    stim[37] = 34'h0a4c5bca9;
    stim[38] = 34'h36a646eb5;
    stim[39] = 34'h1a0af6582;
    stim[40] = 34'h0340ebb29;
    stim[41] = 34'h14c695e29;
    stim[42] = 34'h03a11afee;
    stim[43] = 34'h22a411dc0;
    stim[44] = 34'h2f752f423;
    stim[45] = 34'h2b5f805b7;
    stim[46] = 34'h161228f33;
    stim[47] = 34'h15eb35fca;
    stim[48] = 34'h3b1e2a933;
    stim[49] = 34'h0c7a0ee94;
    stim[50] = 34'h09fa71668;
    stim[51] = 34'h300a28b53;
    stim[52] = 34'h386e917b9;
    stim[53] = 34'h226ba995f;
    stim[54] = 34'h2f473489a;
    stim[55] = 34'h2f768bf1e;
    stim[56] = 34'h27456f21f;
    stim[57] = 34'h2dd5e0434;
    stim[58] = 34'h0e467d536;
    stim[59] = 34'h384a31d56;
    stim[60] = 34'h0e9533609;
    stim[61] = 34'h122072daa;
    stim[62] = 34'h1eecbcc94;
    stim[63] = 34'h36220b903;
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
      expv[0] = 97'hxxxxxxxxxxxxxxxxx00000000;
      expv[1] = 97'hxxxxxxxxxxxxxxxxx00000000;
      expv[2] = 97'hxxxxxxxxxxxxxxxxx00000000;
      expv[3] = 97'hxxxxxxxxxxxxxxxxx00000000;
      expv[4] = 97'hxxxxxxxxxxxxxxxxx00000000;
      expv[5] = 97'hxxxxxxxxxxxxxxxxx00000000;
      expv[6] = 97'hxxxxxxxxxxxxxxxxx00000000;
      expv[7] = 97'hxxxxxxxxxb56fe2e200000000;
      expv[8] = 97'hxxxxxxxxxb56fe2e200000000;
      expv[9] = 97'hxxxxxxxxx485d6e0400000000;
      expv[10] = 97'hxxxxxxxxx1ffa6cf200000000;
      expv[11] = 97'hxxxxxxxxx1ffa6cf200000000;
      expv[12] = 97'hxxxxxxxxx1ffa6cf200000000;
      expv[13] = 97'hxxxxxxxxx1ffa6cf200000000;
      expv[14] = 97'hxxxxxxxxx1ffa6cf200000000;
      expv[15] = 97'hxxxxxxxxx1ffa6cf200000000;
      expv[16] = 97'hxxxxxxxxx1b93485600000000;
      expv[17] = 97'hxxxxxxxxx1b93485600000000;
      expv[18] = 97'hxxxxxxxxx1b93485600000000;
      expv[19] = 97'hxxxxxxxxx1b93485600000000;
      expv[20] = 97'hxxxxxxxxxb3c8b80600000000;
      expv[21] = 97'hxxxxxxxxxca5ae18a00000000;
      expv[22] = 97'hxxxxxxxxx9fbdeb2200000000;
      expv[23] = 97'hxxxxxxxxx9fbdeb2200000000;
      expv[24] = 97'hxxxxxxxxx9fbdeb2200000000;
      expv[25] = 97'hxxxxxxxxx9fbdeb2200000000;
      expv[26] = 97'hxxxxxxxxx9fbdeb2200000000;
      expv[27] = 97'hxxxxxxxxx9fbdeb2200000000;
      expv[28] = 97'hxxxxxxxxx4e768ce000000000;
      expv[29] = 97'hxxxxxxxxx4e768ce000000000;
      expv[30] = 97'hxxxxxxxxx70ace2cc00000000;
      expv[31] = 97'hxxxxxxxxx0c43efd800000000;
      expv[32] = 97'hxxxxxxxxx0c43efd800000000;
      expv[33] = 97'hxxxxxxxxx0c43efd800000000;
      expv[34] = 97'hxxxxxxxxx0c43efd800000000;
      expv[35] = 97'hxxxxxxxxx9a73dcec00000000;
      expv[36] = 97'hxxxxxxxxx9a73dcec00000000;
      expv[37] = 97'hxxxxxxxxx9a73dcec00000000;
      expv[38] = 97'hxxxxxxxxx9a73dcec00000000;
      expv[39] = 97'hxxxxxxxxx9a73dcec00000000;
      expv[40] = 97'hxxxxxxxxx9a73dcec00000000;
      expv[41] = 97'hxxxxxxxxx9a73dcec00000000;
      expv[42] = 97'hxxxxxxxxx9a73dcec00000000;
      expv[43] = 97'hxxxxxxxxx9a73dcec00000000;
      expv[44] = 97'hxxxxxxxxx15208ee000000000;
      expv[45] = 97'hxxxxxxxxx15208ee000000000;
      expv[46] = 97'hxxxxxxxxx15208ee000000000;
      expv[47] = 97'hxxxxxxxxx15208ee000000000;
      expv[48] = 97'hxxxxxxxxx15208ee000000000;
      expv[49] = 97'hxxxxxxxxx15208ee000000000;
      expv[50] = 97'hxxxxxxxxx63d0774a00000000;
      expv[51] = 97'hxxxxxxxxx4fd38b3400000000;
      expv[52] = 97'hxxxxxxxxx4fd38b3400000000;
      expv[53] = 97'hxxxxxxxxx4fd38b3400000000;
      expv[54] = 97'hxxxxxxxxx4fd38b3400000000;
      expv[55] = 97'hxxxxxxxxx4fd38b3400000000;
      expv[56] = 97'hxxxxxxxxx4fd38b3400000000;
      expv[57] = 97'hxxxxxxxxx4fd38b3400000000;
      expv[58] = 97'hxxxxxxxxx6eaf021a00000000;
      expv[59] = 97'hxxxxxxxxx6eaf021a00000000;
      expv[60] = 97'hxxxxxxxxx6eaf021a00000000;
      expv[61] = 97'hxxxxxxxxx6eaf021a00000000;
      expv[62] = 97'hxxxxxxxxx6eaf021a00000000;
      expv[63] = 97'hxxxxxxxxxf765e64a00000000;
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
