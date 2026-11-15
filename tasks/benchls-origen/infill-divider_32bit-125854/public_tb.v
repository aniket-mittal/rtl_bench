// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_125854 dut (
    .clk(clk),
    .reset(in_vec[66:66]),
    .start(in_vec[65:65]),
    .signed_op(in_vec[64:64]),
    .A(in_vec[63:32]),
    .B(in_vec[31:0]),
    .result(out_vec[32:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h701fa0641919be0fa;
    stim[1] = 67'h6e5021408b3af3c83;
    stim[2] = 67'h3286cd233e4bdb8e3;
    stim[3] = 67'h2a5cf58d7efdffc3b;
    stim[4] = 67'h1f13f2a83be7de616;
    stim[5] = 67'h12ae862331779e19e;
    stim[6] = 67'h2602dbab98c90ca75;
    stim[7] = 67'h2a2a586f7de604304;
    stim[8] = 67'h36100d72ef59f5762;
    stim[9] = 67'h3f8c205bf23169b4e;
    stim[10] = 67'h10a0ee48eb11afa22;
    stim[11] = 67'h2bb07c9f798231428;
    stim[12] = 67'h1158d8f6e192fc8c9;
    stim[13] = 67'h30e1d1a9c861a4a02;
    stim[14] = 67'h19033cfb43b7ea4a9;
    stim[15] = 67'h2b112988c257cbd56;
    stim[16] = 67'h2ddaef31c66f38c91;
    stim[17] = 67'h026ee02a4ef9eefed;
    stim[18] = 67'h3037f39012a99bb6d;
    stim[19] = 67'h3ab74d65af088fb80;
    stim[20] = 67'h14dc824a54ea22d97;
    stim[21] = 67'h02a30c0df1b7a256f;
    stim[22] = 67'h1b4ec7e83bb54cfd5;
    stim[23] = 67'h26d400482583e4355;
    stim[24] = 67'h1bbb34a786fc81680;
    stim[25] = 67'h260062b4493b400b6;
    stim[26] = 67'h26023f3f401f34f75;
    stim[27] = 67'h3a2c9ea867611b1a7;
    stim[28] = 67'h1b9412a4991d7087b;
    stim[29] = 67'h2d60e01b670673cfc;
    stim[30] = 67'h0bf05a400b90cbe6b;
    stim[31] = 67'h03cb4705b87412c5a;
    stim[32] = 67'h1070163125c40b8c5;
    stim[33] = 67'h2b3b0895e2407ae35;
    stim[34] = 67'h2d89dd9e0e4c8cd94;
    stim[35] = 67'h34153f6be56b8aeb9;
    stim[36] = 67'h0b412580e1d00b983;
    stim[37] = 67'h2ed14c2f9fa7d3e7c;
    stim[38] = 67'h503e6c86ab455899b;
    stim[39] = 67'h0b04ad99f62d13349;
    stim[40] = 67'h3a800a203b051d8ac;
    stim[41] = 67'h021e34da4802821a9;
    stim[42] = 67'h128900e91cfea2231;
    stim[43] = 67'h39e095ccbcd9d14b0;
    stim[44] = 67'h0874c465a60264ecd;
    stim[45] = 67'h2bc30fb7c9fb5297d;
    stim[46] = 67'h2714d174338f5a408;
    stim[47] = 67'h00f3f18cd8982decf;
    stim[48] = 67'h27c3b006a32143aec;
    stim[49] = 67'h120a9708731f8eb7b;
    stim[50] = 67'h4941e3da67cf04270;
    stim[51] = 67'h28e22b9cfcd1b27f9;
    stim[52] = 67'h21640484cdbf19668;
    stim[53] = 67'h314c272242982abf1;
    stim[54] = 67'h277acc6c63f7d2552;
    stim[55] = 67'h2c7d08510879cd0fd;
    stim[56] = 67'h1fefa36a79034370e;
    stim[57] = 67'h10f1900e4f4d0bcaa;
    stim[58] = 67'h1bdce8f6f027916e5;
    stim[59] = 67'h3935343a9ac391075;
    stim[60] = 67'h07e2774dcad847fce;
    stim[61] = 67'h2bf063d59997e644c;
    stim[62] = 67'h0e61e6c4eed6e3445;
    stim[63] = 67'h0bda36d1d74cb93b5;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000001;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
