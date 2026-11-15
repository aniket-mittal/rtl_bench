// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023501 dut (
    .AUD_XCK(clk),
    .reset_n(in_vec[16:16]),
    .audiodata(in_vec[15:0]),
    .AUD_BCK(out_vec[2:2]),
    .AUD_DATA(out_vec[1:1]),
    .AUD_LRCK(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0218f;
    stim[1] = 17'h0ed0b;
    stim[2] = 17'h176cc;
    stim[3] = 17'h083c9;
    stim[4] = 17'h10a94;
    stim[5] = 17'h16fef;
    stim[6] = 17'h1fba2;
    stim[7] = 17'h125f3;
    stim[8] = 17'h11e94;
    stim[9] = 17'h1c1ea;
    stim[10] = 17'h13e56;
    stim[11] = 17'h1aefc;
    stim[12] = 17'h14e96;
    stim[13] = 17'h15efd;
    stim[14] = 17'h1ec42;
    stim[15] = 17'h1c6b2;
    stim[16] = 17'h17d20;
    stim[17] = 17'h174a8;
    stim[18] = 17'h163b9;
    stim[19] = 17'h1c86d;
    stim[20] = 17'h15a8f;
    stim[21] = 17'h1e75c;
    stim[22] = 17'h15fd1;
    stim[23] = 17'h1a8a3;
    stim[24] = 17'h142f9;
    stim[25] = 17'h1e48b;
    stim[26] = 17'h1e5d3;
    stim[27] = 17'h1e363;
    stim[28] = 17'h174e6;
    stim[29] = 17'h1e05b;
    stim[30] = 17'h080eb;
    stim[31] = 17'h199be;
    stim[32] = 17'h190e6;
    stim[33] = 17'h11894;
    stim[34] = 17'h1da4d;
    stim[35] = 17'h1ecb9;
    stim[36] = 17'h12d57;
    stim[37] = 17'h163a6;
    stim[38] = 17'h19adc;
    stim[39] = 17'h1ad00;
    stim[40] = 17'h1ee50;
    stim[41] = 17'h18bda;
    stim[42] = 17'h16f7f;
    stim[43] = 17'h10d7d;
    stim[44] = 17'h1fff7;
    stim[45] = 17'h1a916;
    stim[46] = 17'h1e25d;
    stim[47] = 17'h13771;
    stim[48] = 17'h1d754;
    stim[49] = 17'h13a09;
    stim[50] = 17'h1e335;
    stim[51] = 17'h11259;
    stim[52] = 17'h1cc66;
    stim[53] = 17'h186e7;
    stim[54] = 17'h10712;
    stim[55] = 17'h1bab0;
    stim[56] = 17'h10f3a;
    stim[57] = 17'h1c005;
    stim[58] = 17'h10628;
    stim[59] = 17'h19bb4;
    stim[60] = 17'h1642c;
    stim[61] = 17'h170d8;
    stim[62] = 17'h12643;
    stim[63] = 17'h11222;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h4;
      expv[11] = 3'h4;
      expv[12] = 3'h4;
      expv[13] = 3'h4;
      expv[14] = 3'h4;
      expv[15] = 3'h4;
      expv[16] = 3'h2;
      expv[17] = 3'h2;
      expv[18] = 3'h2;
      expv[19] = 3'h2;
      expv[20] = 3'h2;
      expv[21] = 3'h2;
      expv[22] = 3'h6;
      expv[23] = 3'h6;
      expv[24] = 3'h6;
      expv[25] = 3'h6;
      expv[26] = 3'h6;
      expv[27] = 3'h6;
      expv[28] = 3'h2;
      expv[29] = 3'h2;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h4;
      expv[42] = 3'h4;
      expv[43] = 3'h2;
      expv[44] = 3'h2;
      expv[45] = 3'h2;
      expv[46] = 3'h2;
      expv[47] = 3'h2;
      expv[48] = 3'h2;
      expv[49] = 3'h6;
      expv[50] = 3'h6;
      expv[51] = 3'h6;
      expv[52] = 3'h6;
      expv[53] = 3'h6;
      expv[54] = 3'h6;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h4;
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
