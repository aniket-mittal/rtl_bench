// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_fcnvt_stod_sh dut (
    .stod_sh_src(in_vec[22:0]),
    .stod_sh_cnt(out_vec[35:24]),
    .stod_sh_f_v(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h4ce36a;
    stim[1] = 23'h4f50e6;
    stim[2] = 23'h3956a2;
    stim[3] = 23'h68da64;
    stim[4] = 23'h538bc6;
    stim[5] = 23'h3b50f3;
    stim[6] = 23'h727ea0;
    stim[7] = 23'h33314c;
    stim[8] = 23'h3ef53f;
    stim[9] = 23'h0f195a;
    stim[10] = 23'h12e770;
    stim[11] = 23'h76071d;
    stim[12] = 23'h0a7e50;
    stim[13] = 23'h2aebf7;
    stim[14] = 23'h794207;
    stim[15] = 23'h7ab762;
    stim[16] = 23'h259be4;
    stim[17] = 23'h72f755;
    stim[18] = 23'h27914a;
    stim[19] = 23'h64f4be;
    stim[20] = 23'h1d90d9;
    stim[21] = 23'h41c679;
    stim[22] = 23'h62b554;
    stim[23] = 23'h3549d5;
    stim[24] = 23'h6cd4a0;
    stim[25] = 23'h4c156b;
    stim[26] = 23'h60b48e;
    stim[27] = 23'h417d21;
    stim[28] = 23'h6e48ae;
    stim[29] = 23'h108147;
    stim[30] = 23'h3a875d;
    stim[31] = 23'h628353;
    stim[32] = 23'h18dd92;
    stim[33] = 23'h056646;
    stim[34] = 23'h6b4e0c;
    stim[35] = 23'h49ea46;
    stim[36] = 23'h29ee27;
    stim[37] = 23'h755d51;
    stim[38] = 23'h2f5f59;
    stim[39] = 23'h35e002;
    stim[40] = 23'h454bfa;
    stim[41] = 23'h3b37f5;
    stim[42] = 23'h266e86;
    stim[43] = 23'h7939da;
    stim[44] = 23'h3037c2;
    stim[45] = 23'h5856e8;
    stim[46] = 23'h7b52a7;
    stim[47] = 23'h680677;
    stim[48] = 23'h54f6b9;
    stim[49] = 23'h39188c;
    stim[50] = 23'h593390;
    stim[51] = 23'h10e83f;
    stim[52] = 23'h165a1a;
    stim[53] = 23'h328fcf;
    stim[54] = 23'h553471;
    stim[55] = 23'h33343f;
    stim[56] = 23'h436ab8;
    stim[57] = 23'h09bdcc;
    stim[58] = 23'h68e475;
    stim[59] = 23'h5bc16d;
    stim[60] = 23'h3fd7f2;
    stim[61] = 23'h2fccd3;
    stim[62] = 23'h79f5db;
    stim[63] = 23'h5c536c;
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
      expv[0] = 36'hf8199c6d4;
      expv[1] = 36'hf819ea1cc;
      expv[2] = 36'hf80e55a88;
      expv[3] = 36'hf81d1b4c8;
      expv[4] = 36'hf81a7178c;
      expv[5] = 36'hf80ed43cc;
      expv[6] = 36'hf81e4fd40;
      expv[7] = 36'hf80ccc530;
      expv[8] = 36'hf80fbd4fc;
      expv[9] = 36'hf7ef195a0;
      expv[10] = 36'hf7f973b80;
      expv[11] = 36'hf81ec0e3a;
      expv[12] = 36'hf7ea7e500;
      expv[13] = 36'hf80abafdc;
      expv[14] = 36'hf81f2840e;
      expv[15] = 36'hf81f56ec4;
      expv[16] = 36'hf80966f90;
      expv[17] = 36'hf81e5eeaa;
      expv[18] = 36'hf809e4528;
      expv[19] = 36'hf81c9e97c;
      expv[20] = 36'hf7fec86c8;
      expv[21] = 36'hf81838cf2;
      expv[22] = 36'hf81c56aa8;
      expv[23] = 36'hf80d52754;
      expv[24] = 36'hf81d9a940;
      expv[25] = 36'hf81982ad6;
      expv[26] = 36'hf81c1691c;
      expv[27] = 36'hf8182fa42;
      expv[28] = 36'hf81dc915c;
      expv[29] = 36'hf7f840a38;
      expv[30] = 36'hf80ea1d74;
      expv[31] = 36'hf81c506a6;
      expv[32] = 36'hf7fc6ec90;
      expv[33] = 36'hf7dacc8c0;
      expv[34] = 36'hf81d69c18;
      expv[35] = 36'hf8193d48c;
      expv[36] = 36'hf80a7b89c;
      expv[37] = 36'hf81eabaa2;
      expv[38] = 36'hf80bd7d64;
      expv[39] = 36'hf80d78008;
      expv[40] = 36'hf818a97f4;
      expv[41] = 36'hf80ecdfd4;
      expv[42] = 36'hf8099ba18;
      expv[43] = 36'hf81f273b4;
      expv[44] = 36'hf80c0df08;
      expv[45] = 36'hf81b0add0;
      expv[46] = 36'hf81f6a54e;
      expv[47] = 36'hf81d00cee;
      expv[48] = 36'hf81a9ed72;
      expv[49] = 36'hf80e46230;
      expv[50] = 36'hf81b26720;
      expv[51] = 36'hf7f8741f8;
      expv[52] = 36'hf7fb2d0d0;
      expv[53] = 36'hf80ca3f3c;
      expv[54] = 36'hf81aa68e2;
      expv[55] = 36'hf80ccd0fc;
      expv[56] = 36'hf8186d570;
      expv[57] = 36'hf7e9bdcc0;
      expv[58] = 36'hf81d1c8ea;
      expv[59] = 36'hf81b782da;
      expv[60] = 36'hf80ff5fc8;
      expv[61] = 36'hf80bf334c;
      expv[62] = 36'hf81f3ebb6;
      expv[63] = 36'hf81b8a6d8;
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
