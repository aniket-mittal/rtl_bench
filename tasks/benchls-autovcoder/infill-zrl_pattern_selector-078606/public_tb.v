// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_078606 dut (
    .isAllZero_i(in_vec[21:21]),
    .isAllWordSame_i(in_vec[20:20]),
    .zeroRunLen_i(in_vec[19:0]),
    .select_o(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h06ba79;
    stim[1] = 22'h17fd6f;
    stim[2] = 22'h02659e;
    stim[3] = 22'h39ed87;
    stim[4] = 22'h097543;
    stim[5] = 22'h13df5d;
    stim[6] = 22'h1dbd54;
    stim[7] = 22'h205343;
    stim[8] = 22'h2d5b15;
    stim[9] = 22'h26e720;
    stim[10] = 22'h04347e;
    stim[11] = 22'h10b865;
    stim[12] = 22'h367169;
    stim[13] = 22'h1c7ae7;
    stim[14] = 22'h101c4d;
    stim[15] = 22'h34236c;
    stim[16] = 22'h27c5fc;
    stim[17] = 22'h2b1c0a;
    stim[18] = 22'h36e212;
    stim[19] = 22'h28ebbd;
    stim[20] = 22'h3e5952;
    stim[21] = 22'h35f6b5;
    stim[22] = 22'h0f2efc;
    stim[23] = 22'h2b3cc0;
    stim[24] = 22'h2acdec;
    stim[25] = 22'h395401;
    stim[26] = 22'h38fe4a;
    stim[27] = 22'h3ee874;
    stim[28] = 22'h208c9f;
    stim[29] = 22'h25d714;
    stim[30] = 22'h3fdc62;
    stim[31] = 22'h19cabd;
    stim[32] = 22'h274392;
    stim[33] = 22'h310f0b;
    stim[34] = 22'h143210;
    stim[35] = 22'h2489c9;
    stim[36] = 22'h1ae111;
    stim[37] = 22'h3f5418;
    stim[38] = 22'h3b3b5a;
    stim[39] = 22'h0ea50a;
    stim[40] = 22'h3763d6;
    stim[41] = 22'h3174ad;
    stim[42] = 22'h09996f;
    stim[43] = 22'h3aa26a;
    stim[44] = 22'h1fdee4;
    stim[45] = 22'h0aec4b;
    stim[46] = 22'h37a902;
    stim[47] = 22'h0cdac4;
    stim[48] = 22'h055c40;
    stim[49] = 22'h11268e;
    stim[50] = 22'h3e6c91;
    stim[51] = 22'h0755d7;
    stim[52] = 22'h262ab8;
    stim[53] = 22'h1b990b;
    stim[54] = 22'h2afe64;
    stim[55] = 22'h2cddca;
    stim[56] = 22'h196328;
    stim[57] = 22'h2f86a7;
    stim[58] = 22'h2e9622;
    stim[59] = 22'h37e4c8;
    stim[60] = 22'h3a5adb;
    stim[61] = 22'h1c73a4;
    stim[62] = 22'h23f2d2;
    stim[63] = 22'h2e9b2e;
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
      expv[0] = 3'h3;
      expv[1] = 3'h1;
      expv[2] = 3'h6;
      expv[3] = 3'h0;
      expv[4] = 3'h2;
      expv[5] = 3'h1;
      expv[6] = 3'h1;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h6;
      expv[11] = 3'h1;
      expv[12] = 3'h0;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h5;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h1;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h1;
      expv[35] = 3'h0;
      expv[36] = 3'h1;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h2;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h6;
      expv[43] = 3'h0;
      expv[44] = 3'h1;
      expv[45] = 3'h3;
      expv[46] = 3'h0;
      expv[47] = 3'h3;
      expv[48] = 3'h4;
      expv[49] = 3'h1;
      expv[50] = 3'h0;
      expv[51] = 3'h5;
      expv[52] = 3'h0;
      expv[53] = 3'h1;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h1;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h1;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
