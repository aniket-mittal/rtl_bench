// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01638 dut (
    .CLK(clk),
    .nRST(in_vec[33:33]),
    .request$say__ENA(in_vec[32:32]),
    .request$say$va(in_vec[31:0]),
    .request$say__RDY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h32d0314b3;
    stim[1] = 34'h366d1e4d6;
    stim[2] = 34'h13107f1de;
    stim[3] = 34'h14432ce03;
    stim[4] = 34'h19c5e7dec;
    stim[5] = 34'h06bdbc87c;
    stim[6] = 34'h1f74ec529;
    stim[7] = 34'h026d0f613;
    stim[8] = 34'h0aa3034d9;
    stim[9] = 34'h0a55e058a;
    stim[10] = 34'h13dedd105;
    stim[11] = 34'h1eb6d5942;
    stim[12] = 34'h0884264a3;
    stim[13] = 34'h15b628fe9;
    stim[14] = 34'h1799be01c;
    stim[15] = 34'h07af9be13;
    stim[16] = 34'h0be6269ae;
    stim[17] = 34'h16f55081e;
    stim[18] = 34'h01dbd16e7;
    stim[19] = 34'h1cb8dfc7f;
    stim[20] = 34'h0835a34b7;
    stim[21] = 34'h1e560a10a;
    stim[22] = 34'h128683f38;
    stim[23] = 34'h13bf6adb4;
    stim[24] = 34'h0701029e7;
    stim[25] = 34'h09a7913a0;
    stim[26] = 34'h16bd3e70b;
    stim[27] = 34'h19a5fa93d;
    stim[28] = 34'h0d99ca900;
    stim[29] = 34'h0b61aa756;
    stim[30] = 34'h1ad0bccfa;
    stim[31] = 34'h1dd15e92d;
    stim[32] = 34'h1b759bb15;
    stim[33] = 34'h0dbf2406c;
    stim[34] = 34'h0025f9059;
    stim[35] = 34'h067262ff8;
    stim[36] = 34'h035e998fe;
    stim[37] = 34'h1e1e36087;
    stim[38] = 34'h03df0f41d;
    stim[39] = 34'h184359f03;
    stim[40] = 34'h182683d7c;
    stim[41] = 34'h0130e443e;
    stim[42] = 34'h1eba37aaa;
    stim[43] = 34'h1d02f8662;
    stim[44] = 34'h1dccafb94;
    stim[45] = 34'h111317f73;
    stim[46] = 34'h1fce33137;
    stim[47] = 34'h1e9c61433;
    stim[48] = 34'h1040f0466;
    stim[49] = 34'h176b8b93d;
    stim[50] = 34'h1251afeb0;
    stim[51] = 34'h0482ece58;
    stim[52] = 34'h143a3ebf6;
    stim[53] = 34'h12e9722a8;
    stim[54] = 34'h1a243faa5;
    stim[55] = 34'h028b4e6e2;
    stim[56] = 34'h1de1afdde;
    stim[57] = 34'h06e4940f9;
    stim[58] = 34'h11103d57b;
    stim[59] = 34'h0daa95f46;
    stim[60] = 34'h0343f80a7;
    stim[61] = 34'h1b43cf458;
    stim[62] = 34'h16fb6423e;
    stim[63] = 34'h17b99f463;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
