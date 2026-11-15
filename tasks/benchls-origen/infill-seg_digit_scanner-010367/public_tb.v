// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_010367 dut (
    .CLK(clk),
    .RSTn(in_vec[16:16]),
    .NumberSig(in_vec[15:0]),
    .NumberData(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h006be;
    stim[1] = 17'h03d43;
    stim[2] = 17'h17ef4;
    stim[3] = 17'h116af;
    stim[4] = 17'h176d0;
    stim[5] = 17'h100e5;
    stim[6] = 17'h1e05d;
    stim[7] = 17'h19cc5;
    stim[8] = 17'h10167;
    stim[9] = 17'h11215;
    stim[10] = 17'h188b4;
    stim[11] = 17'h16180;
    stim[12] = 17'h13154;
    stim[13] = 17'h1c3a7;
    stim[14] = 17'h1356d;
    stim[15] = 17'h1d3eb;
    stim[16] = 17'h171c1;
    stim[17] = 17'h12f15;
    stim[18] = 17'h1f468;
    stim[19] = 17'h10ded;
    stim[20] = 17'h158da;
    stim[21] = 17'h11d24;
    stim[22] = 17'h128eb;
    stim[23] = 17'h143ff;
    stim[24] = 17'h1d10e;
    stim[25] = 17'h1956b;
    stim[26] = 17'h177d2;
    stim[27] = 17'h1e0b7;
    stim[28] = 17'h14e75;
    stim[29] = 17'h185e3;
    stim[30] = 17'h18392;
    stim[31] = 17'h19aed;
    stim[32] = 17'h11793;
    stim[33] = 17'h1a041;
    stim[34] = 17'h12fad;
    stim[35] = 17'h131cc;
    stim[36] = 17'h1f49b;
    stim[37] = 17'h10747;
    stim[38] = 17'h173c2;
    stim[39] = 17'h1f1ee;
    stim[40] = 17'h139ce;
    stim[41] = 17'h135d4;
    stim[42] = 17'h118d8;
    stim[43] = 17'h104db;
    stim[44] = 17'h14706;
    stim[45] = 17'h1b3ff;
    stim[46] = 17'h1b0e5;
    stim[47] = 17'h08aac;
    stim[48] = 17'h1ae06;
    stim[49] = 17'h120e7;
    stim[50] = 17'h1fb62;
    stim[51] = 17'h1ff35;
    stim[52] = 17'h14419;
    stim[53] = 17'h10628;
    stim[54] = 17'h11a03;
    stim[55] = 17'h15093;
    stim[56] = 17'h1af01;
    stim[57] = 17'h144de;
    stim[58] = 17'h125de;
    stim[59] = 17'h1eeed;
    stim[60] = 17'h10e00;
    stim[61] = 17'h14234;
    stim[62] = 17'h1b75e;
    stim[63] = 17'h187d2;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
