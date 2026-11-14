// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06266 dut (
    .clk(clk),
    .rst(in_vec[44:44]),
    .x(in_vec[43:33]),
    .y(in_vec[32:22]),
    .poX(in_vec[21:11]),
    .poY(in_vec[10:0]),
    .wing(out_vec[1:1]),
    .body(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h15ef9ae4fc01;
    stim[1] = 45'h17457673a464;
    stim[2] = 45'h043ca8a3ab55;
    stim[3] = 45'h038253d4d4d7;
    stim[4] = 45'h014b2954d22c;
    stim[5] = 45'h0200bf87d863;
    stim[6] = 45'h0068eacf2fd2;
    stim[7] = 45'h019cf6517697;
    stim[8] = 45'h01ee02f3577b;
    stim[9] = 45'h0ffac415aa2c;
    stim[10] = 45'h027c84276172;
    stim[11] = 45'h01bc1c4b7064;
    stim[12] = 45'h029c7c3518f3;
    stim[13] = 45'h04c67ee2418f;
    stim[14] = 45'h0c47fd91aed2;
    stim[15] = 45'h049abb6cf01d;
    stim[16] = 45'h0034b3cb3b20;
    stim[17] = 45'h02df88fd26da;
    stim[18] = 45'h0e8fb755175f;
    stim[19] = 45'h0575b252f04e;
    stim[20] = 45'h0b8f03acefc9;
    stim[21] = 45'h005890cd6137;
    stim[22] = 45'h0047704971c3;
    stim[23] = 45'h025735e06e4e;
    stim[24] = 45'h1aaeb5a5ad12;
    stim[25] = 45'h03d50e622974;
    stim[26] = 45'h05fc2f42c1de;
    stim[27] = 45'h06712c234d7f;
    stim[28] = 45'h05c6d17a6fe8;
    stim[29] = 45'h064aae778290;
    stim[30] = 45'h016075e13db9;
    stim[31] = 45'h02c327e4115b;
    stim[32] = 45'h041cdb0f9bc3;
    stim[33] = 45'h07735fed453e;
    stim[34] = 45'h0aede57f664d;
    stim[35] = 45'h0dfe901d2209;
    stim[36] = 45'h1bbb3eca6926;
    stim[37] = 45'h07cf8c34a5d7;
    stim[38] = 45'h037cf6f4c677;
    stim[39] = 45'h0bc0dd9639ad;
    stim[40] = 45'h0e3d4e1b9a54;
    stim[41] = 45'h0ff1da6a7169;
    stim[42] = 45'h0b472056015f;
    stim[43] = 45'h06c152240364;
    stim[44] = 45'h046ff5597c8c;
    stim[45] = 45'h0f6e403bee97;
    stim[46] = 45'h037e30520e79;
    stim[47] = 45'h019b3dd7533d;
    stim[48] = 45'h00ecab0f7028;
    stim[49] = 45'h0dc5b02950d4;
    stim[50] = 45'h0658448e2133;
    stim[51] = 45'h07353623ce65;
    stim[52] = 45'h06f7e9ae56a6;
    stim[53] = 45'h040c7020504e;
    stim[54] = 45'h169a17b093ec;
    stim[55] = 45'h0aa5a003bb3a;
    stim[56] = 45'h0dd01e248035;
    stim[57] = 45'h0f6816cdb304;
    stim[58] = 45'h08c57af9af48;
    stim[59] = 45'h097e560a0345;
    stim[60] = 45'h0300e133300d;
    stim[61] = 45'h0aa19daf0e31;
    stim[62] = 45'h0a428764b6c6;
    stim[63] = 45'h0bd3a1f638bb;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
