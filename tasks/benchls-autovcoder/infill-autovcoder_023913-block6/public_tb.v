// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_023913 dut (
    .clk(clk),
    .start(in_vec[9:9]),
    .byte_in(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .crc_16(out_vec[16:1]),
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
    stim[0] = 10'h063;
    stim[1] = 10'h373;
    stim[2] = 10'h32c;
    stim[3] = 10'h118;
    stim[4] = 10'h190;
    stim[5] = 10'h298;
    stim[6] = 10'h2d2;
    stim[7] = 10'h2c6;
    stim[8] = 10'h2f8;
    stim[9] = 10'h330;
    stim[10] = 10'h0ac;
    stim[11] = 10'h102;
    stim[12] = 10'h0aa;
    stim[13] = 10'h2e8;
    stim[14] = 10'h178;
    stim[15] = 10'h356;
    stim[16] = 10'h336;
    stim[17] = 10'h190;
    stim[18] = 10'h34e;
    stim[19] = 10'h278;
    stim[20] = 10'h174;
    stim[21] = 10'h082;
    stim[22] = 10'h174;
    stim[23] = 10'h31e;
    stim[24] = 10'h1b8;
    stim[25] = 10'h3a2;
    stim[26] = 10'h39a;
    stim[27] = 10'h0d6;
    stim[28] = 10'h028;
    stim[29] = 10'h298;
    stim[30] = 10'h380;
    stim[31] = 10'h020;
    stim[32] = 10'h378;
    stim[33] = 10'h3a8;
    stim[34] = 10'h388;
    stim[35] = 10'h05a;
    stim[36] = 10'h394;
    stim[37] = 10'h3d2;
    stim[38] = 10'h3fe;
    stim[39] = 10'h08a;
    stim[40] = 10'h2c2;
    stim[41] = 10'h142;
    stim[42] = 10'h080;
    stim[43] = 10'h252;
    stim[44] = 10'h1d8;
    stim[45] = 10'h218;
    stim[46] = 10'h33a;
    stim[47] = 10'h0ce;
    stim[48] = 10'h17c;
    stim[49] = 10'h224;
    stim[50] = 10'h248;
    stim[51] = 10'h05c;
    stim[52] = 10'h1fa;
    stim[53] = 10'h0bc;
    stim[54] = 10'h30c;
    stim[55] = 10'h0f4;
    stim[56] = 10'h214;
    stim[57] = 10'h088;
    stim[58] = 10'h1b6;
    stim[59] = 10'h05c;
    stim[60] = 10'h2dc;
    stim[61] = 10'h200;
    stim[62] = 10'h3c8;
    stim[63] = 10'h06b;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'hxxxxx;
      expv[4] = 17'hxxxxx;
      expv[5] = 17'hxxxxx;
      expv[6] = 17'hxxxxx;
      expv[7] = 17'hxxxxx;
      expv[8] = 17'hxxxxx;
      expv[9] = 17'hxxxxx;
      expv[10] = 17'hxxxxx;
      expv[11] = 17'h05c7e;
      expv[12] = 17'h05c7e;
      expv[13] = 17'h05c7e;
      expv[14] = 17'h05c7e;
      expv[15] = 17'h05c7f;
      expv[16] = 17'h05c7f;
      expv[17] = 17'h05c7f;
      expv[18] = 17'h05c7f;
      expv[19] = 17'h05c7f;
      expv[20] = 17'h05c7f;
      expv[21] = 17'h05c7f;
      expv[22] = 17'h05c7f;
      expv[23] = 17'h142de;
      expv[24] = 17'h142de;
      expv[25] = 17'h142df;
      expv[26] = 17'h142df;
      expv[27] = 17'h142df;
      expv[28] = 17'h142df;
      expv[29] = 17'h142df;
      expv[30] = 17'h142df;
      expv[31] = 17'h142df;
      expv[32] = 17'h142df;
      expv[33] = 17'h16bc0;
      expv[34] = 17'h16bc1;
      expv[35] = 17'h16bc1;
      expv[36] = 17'h16bc1;
      expv[37] = 17'h16bc1;
      expv[38] = 17'h16bc1;
      expv[39] = 17'h16bc1;
      expv[40] = 17'h16bc1;
      expv[41] = 17'h16bc1;
      expv[42] = 17'h1af68;
      expv[43] = 17'h1af68;
      expv[44] = 17'h1af68;
      expv[45] = 17'h1af69;
      expv[46] = 17'h1af69;
      expv[47] = 17'h1af69;
      expv[48] = 17'h1af69;
      expv[49] = 17'h1af69;
      expv[50] = 17'h1af69;
      expv[51] = 17'h1af69;
      expv[52] = 17'h1af69;
      expv[53] = 17'h1f5ac;
      expv[54] = 17'h1f5ac;
      expv[55] = 17'h1f5ac;
      expv[56] = 17'h1f5ad;
      expv[57] = 17'h1f5ad;
      expv[58] = 17'h1f5ad;
      expv[59] = 17'h1f5ad;
      expv[60] = 17'h1f5ad;
      expv[61] = 17'h1f5ad;
      expv[62] = 17'h1f5ad;
      expv[63] = 17'h1f5ad;
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
