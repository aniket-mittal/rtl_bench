// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_035036 dut (
    .CLK(clk),
    .RST(in_vec[63:63]),
    .Enable(in_vec[62:62]),
    .Ex_ext(in_vec[61:54]),
    .Ey_ext(in_vec[53:46]),
    .Mx_ext(in_vec[45:23]),
    .My_ext(in_vec[22:0]),
    .Mx_conc(out_vec[57:34]),
    .My_conc(out_vec[33:10]),
    .Ez_add(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h9961767be74aefd5;
    stim[1] = 64'hfd132fedfc09cd8c;
    stim[2] = 64'h7a238c0231bdabd9;
    stim[3] = 64'h42ad665a22a1e231;
    stim[4] = 64'h5fcf9270a5695d5a;
    stim[5] = 64'h62d246bc22275cd6;
    stim[6] = 64'h6a68661d704d0029;
    stim[7] = 64'h51be01aeb052b0e6;
    stim[8] = 64'h0e29626c2962954c;
    stim[9] = 64'h4b470cb0fd60fb4e;
    stim[10] = 64'h3827e07cb7162e32;
    stim[11] = 64'h7323294fce49b623;
    stim[12] = 64'h12007045873280c7;
    stim[13] = 64'h7b9b9f471ede330f;
    stim[14] = 64'h1f181045ce80ccf5;
    stim[15] = 64'h640158e1093680f3;
    stim[16] = 64'h518256e075a4a22b;
    stim[17] = 64'h7dc1b22331d3893a;
    stim[18] = 64'h257077817a711d06;
    stim[19] = 64'h6a34e79dc1f9717a;
    stim[20] = 64'h2024c75c011f0d7f;
    stim[21] = 64'h7dfb9dad1d1299fa;
    stim[22] = 64'h468811783666b88e;
    stim[23] = 64'h760b7a0b346e9322;
    stim[24] = 64'h33ff62967b57803b;
    stim[25] = 64'h578abe26a041b009;
    stim[26] = 64'h5a8f0d77f13864f2;
    stim[27] = 64'h6bdc0af824bce158;
    stim[28] = 64'h4c6f98226d9812e0;
    stim[29] = 64'h383f53795de9bbb2;
    stim[30] = 64'h557d78b6e7789cb6;
    stim[31] = 64'h27702de720c27c5a;
    stim[32] = 64'h5b7428f4d21d4f4b;
    stim[33] = 64'h528e85273fb4bcf9;
    stim[34] = 64'h5daa7ae7c018edab;
    stim[35] = 64'h06baa057574ad222;
    stim[36] = 64'h2941f4b1b2782609;
    stim[37] = 64'h073ee597a5363655;
    stim[38] = 64'h4350a51476020247;
    stim[39] = 64'h484f6d08f0ac2539;
    stim[40] = 64'h75c2bf602200c7e3;
    stim[41] = 64'h2e91e0c18c899bc4;
    stim[42] = 64'h4c69d716aefdd639;
    stim[43] = 64'h20c471f68bebf8ea;
    stim[44] = 64'h5a99ae9ebe8bb2ee;
    stim[45] = 64'h0eb7040691b0cbc4;
    stim[46] = 64'h0b218b64907f1013;
    stim[47] = 64'h27a728bfd4d74e7c;
    stim[48] = 64'h5cc7ffec5d82bb62;
    stim[49] = 64'h0cbabf44bb2bb214;
    stim[50] = 64'h46b6fc005785f25c;
    stim[51] = 64'h78eeecd55f9124f0;
    stim[52] = 64'h6fff592b45ffd026;
    stim[53] = 64'h76a50ce679fab00f;
    stim[54] = 64'h0d5b3ac5a24db268;
    stim[55] = 64'h5c9a94d859dc5d4b;
    stim[56] = 64'h694a5366887e57fe;
    stim[57] = 64'h7f470a9830534fd4;
    stim[58] = 64'h62fa5198a8b4200f;
    stim[59] = 64'h1532a815514cec10;
    stim[60] = 64'h60fe9466de0f26e1;
    stim[61] = 64'h6a8013ae08327e2d;
    stim[62] = 64'h1a4b1ddd1556aa6a;
    stim[63] = 64'h59273b69cefff5f2;
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
      expv[0] = 58'h000000000000381;
      expv[1] = 58'h3b3df3b2bbf546b;
      expv[2] = 58'h000000000000381;
      expv[3] = 58'h000000000000381;
      expv[4] = 58'h000000000000381;
      expv[5] = 58'h000000000000381;
      expv[6] = 58'h000000000000381;
      expv[7] = 58'h000000000000381;
      expv[8] = 58'h000000000000381;
      expv[9] = 58'h000000000000381;
      expv[10] = 58'h000000000000381;
      expv[11] = 58'h000000000000381;
      expv[12] = 58'h000000000000381;
      expv[13] = 58'h000000000000381;
      expv[14] = 58'h000000000000381;
      expv[15] = 58'h000000000000381;
      expv[16] = 58'h000000000000381;
      expv[17] = 58'h000000000000381;
      expv[18] = 58'h000000000000381;
      expv[19] = 58'h000000000000381;
      expv[20] = 58'h000000000000381;
      expv[21] = 58'h000000000000381;
      expv[22] = 58'h000000000000381;
      expv[23] = 58'h000000000000381;
      expv[24] = 58'h000000000000381;
      expv[25] = 58'h000000000000381;
      expv[26] = 58'h000000000000381;
      expv[27] = 58'h000000000000381;
      expv[28] = 58'h000000000000381;
      expv[29] = 58'h000000000000381;
      expv[30] = 58'h000000000000381;
      expv[31] = 58'h000000000000381;
      expv[32] = 58'h000000000000381;
      expv[33] = 58'h000000000000381;
      expv[34] = 58'h000000000000381;
      expv[35] = 58'h000000000000381;
      expv[36] = 58'h000000000000381;
      expv[37] = 58'h000000000000381;
      expv[38] = 58'h000000000000381;
      expv[39] = 58'h000000000000381;
      expv[40] = 58'h000000000000381;
      expv[41] = 58'h000000000000381;
      expv[42] = 58'h000000000000381;
      expv[43] = 58'h000000000000381;
      expv[44] = 58'h000000000000381;
      expv[45] = 58'h000000000000381;
      expv[46] = 58'h000000000000381;
      expv[47] = 58'h000000000000381;
      expv[48] = 58'h000000000000381;
      expv[49] = 58'h000000000000381;
      expv[50] = 58'h000000000000381;
      expv[51] = 58'h000000000000381;
      expv[52] = 58'h000000000000381;
      expv[53] = 58'h000000000000381;
      expv[54] = 58'h000000000000381;
      expv[55] = 58'h000000000000381;
      expv[56] = 58'h000000000000381;
      expv[57] = 58'h000000000000381;
      expv[58] = 58'h000000000000381;
      expv[59] = 58'h000000000000381;
      expv[60] = 58'h000000000000381;
      expv[61] = 58'h000000000000381;
      expv[62] = 58'h000000000000381;
      expv[63] = 58'h000000000000381;
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
