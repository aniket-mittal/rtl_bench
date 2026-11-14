// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .do_sub(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[8:1]),
    .result_is_zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1e7b6;
    stim[1] = 17'h095cc;
    stim[2] = 17'h19114;
    stim[3] = 17'h08895;
    stim[4] = 17'h0028b;
    stim[5] = 17'h0c752;
    stim[6] = 17'h1a527;
    stim[7] = 17'h18b05;
    stim[8] = 17'h13538;
    stim[9] = 17'h1a318;
    stim[10] = 17'h05429;
    stim[11] = 17'h14eb0;
    stim[12] = 17'h0e4dd;
    stim[13] = 17'h1f0e3;
    stim[14] = 17'h14cbf;
    stim[15] = 17'h1fdbc;
    stim[16] = 17'h028d7;
    stim[17] = 17'h1ad20;
    stim[18] = 17'h0370b;
    stim[19] = 17'h0e2f8;
    stim[20] = 17'h1f396;
    stim[21] = 17'h0719b;
    stim[22] = 17'h052c9;
    stim[23] = 17'h05384;
    stim[24] = 17'h1f90b;
    stim[25] = 17'h1870d;
    stim[26] = 17'h160b6;
    stim[27] = 17'h11b09;
    stim[28] = 17'h1ff70;
    stim[29] = 17'h03d66;
    stim[30] = 17'h01e56;
    stim[31] = 17'h06694;
    stim[32] = 17'h103d5;
    stim[33] = 17'h0c991;
    stim[34] = 17'h07ebf;
    stim[35] = 17'h06865;
    stim[36] = 17'h0adf2;
    stim[37] = 17'h1e961;
    stim[38] = 17'h10072;
    stim[39] = 17'h00c11;
    stim[40] = 17'h0c775;
    stim[41] = 17'h037f2;
    stim[42] = 17'h1d4ef;
    stim[43] = 17'h17414;
    stim[44] = 17'h1246c;
    stim[45] = 17'h14bc4;
    stim[46] = 17'h1a38e;
    stim[47] = 17'h1507f;
    stim[48] = 17'h1988e;
    stim[49] = 17'h0b979;
    stim[50] = 17'h19779;
    stim[51] = 17'h1d6aa;
    stim[52] = 17'h05659;
    stim[53] = 17'h14b2a;
    stim[54] = 17'h12116;
    stim[55] = 17'h0dcf1;
    stim[56] = 17'h17d1f;
    stim[57] = 17'h06461;
    stim[58] = 17'h118ad;
    stim[59] = 17'h0d0bc;
    stim[60] = 17'h0a825;
    stim[61] = 17'h12b5a;
    stim[62] = 17'h16bb8;
    stim[63] = 17'h0bf9c;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 9'h062;
      expv[1] = 9'h192;
      expv[2] = 9'h0fa;
      expv[3] = 9'h1e6;
      expv[4] = 9'h0ee;
      expv[5] = 9'h0ea;
      expv[6] = 9'h0fc;
      expv[7] = 9'h10c;
      expv[8] = 9'h1fa;
      expv[9] = 9'h116;
      expv[10] = 9'h056;
      expv[11] = 9'h13c;
      expv[12] = 9'h00e;
      expv[13] = 9'h01a;
      expv[14] = 9'h11a;
      expv[15] = 9'h082;
      expv[16] = 9'h0a2;
      expv[17] = 9'h11a;
      expv[18] = 9'h058;
      expv[19] = 9'h1d4;
      expv[20] = 9'h0ba;
      expv[21] = 9'h1ac;
      expv[22] = 9'h112;
      expv[23] = 9'h19e;
      expv[24] = 9'h1dc;
      expv[25] = 9'h0f4;
      expv[26] = 9'h154;
      expv[27] = 9'h024;
      expv[28] = 9'h11e;
      expv[29] = 9'h1ae;
      expv[30] = 9'h190;
      expv[31] = 9'h1a4;
      expv[32] = 9'h05c;
      expv[33] = 9'h070;
      expv[34] = 9'h17e;
      expv[35] = 9'h006;
      expv[36] = 9'h176;
      expv[37] = 9'h110;
      expv[38] = 9'h11c;
      expv[39] = 9'h1f6;
      expv[40] = 9'h0a4;
      expv[41] = 9'h08a;
      expv[42] = 9'h1ca;
      expv[43] = 9'h0c0;
      expv[44] = 9'h170;
      expv[45] = 9'h10e;
      expv[46] = 9'h02a;
      expv[47] = 9'h1a2;
      expv[48] = 9'h014;
      expv[49] = 9'h080;
      expv[50] = 9'h03c;
      expv[51] = 9'h058;
      expv[52] = 9'h1fa;
      expv[53] = 9'h042;
      expv[54] = 9'h016;
      expv[55] = 9'h1d6;
      expv[56] = 9'h0bc;
      expv[57] = 9'h006;
      expv[58] = 9'h0d6;
      expv[59] = 9'h028;
      expv[60] = 9'h106;
      expv[61] = 9'h1a2;
      expv[62] = 9'h166;
      expv[63] = 9'h046;
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
