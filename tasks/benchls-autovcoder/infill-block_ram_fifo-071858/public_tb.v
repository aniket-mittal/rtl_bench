// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071858 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h368cbe4845;
    stim[1] = 38'h38edff7de0;
    stim[2] = 38'h0ae321e231;
    stim[3] = 38'h032bd53de5;
    stim[4] = 38'h178a6d02b6;
    stim[5] = 38'h0895409d6b;
    stim[6] = 38'h024f8ed98c;
    stim[7] = 38'h13f96c2d2e;
    stim[8] = 38'h015c556114;
    stim[9] = 38'h19549ed95c;
    stim[10] = 38'h17d13ab660;
    stim[11] = 38'h10f443b4f0;
    stim[12] = 38'h1441bf8e60;
    stim[13] = 38'h1ffa39617e;
    stim[14] = 38'h074ccc65e9;
    stim[15] = 38'h165050bf19;
    stim[16] = 38'h00ff4c38db;
    stim[17] = 38'h1e43204325;
    stim[18] = 38'h03a35be956;
    stim[19] = 38'h0f5fa11d16;
    stim[20] = 38'h0a974ea739;
    stim[21] = 38'h14cf6c0c86;
    stim[22] = 38'h14900df221;
    stim[23] = 38'h1afc15a63f;
    stim[24] = 38'h05cb395bc1;
    stim[25] = 38'h02c4da0c36;
    stim[26] = 38'h003bb4487e;
    stim[27] = 38'h01f1305ce7;
    stim[28] = 38'h097d7f3606;
    stim[29] = 38'h142fe00abf;
    stim[30] = 38'h1f235eabac;
    stim[31] = 38'h05a5d4fee1;
    stim[32] = 38'h18fb4642fd;
    stim[33] = 38'h1b98725a08;
    stim[34] = 38'h00723e0d14;
    stim[35] = 38'h18901f7966;
    stim[36] = 38'h083ba85fb4;
    stim[37] = 38'h1a26a39d78;
    stim[38] = 38'h0a540440fe;
    stim[39] = 38'h0cced00b0f;
    stim[40] = 38'h0fd47c7f85;
    stim[41] = 38'h0f45aff765;
    stim[42] = 38'h1cae2d5401;
    stim[43] = 38'h025448e1b3;
    stim[44] = 38'h11273ff07c;
    stim[45] = 38'h1d79d7b6f7;
    stim[46] = 38'h167017efaf;
    stim[47] = 38'h144bfef336;
    stim[48] = 38'h056a19880a;
    stim[49] = 38'h0d847eeea8;
    stim[50] = 38'h126e709fe9;
    stim[51] = 38'h058605cecc;
    stim[52] = 38'h17f46297d6;
    stim[53] = 38'h10dd7ae052;
    stim[54] = 38'h05057cb205;
    stim[55] = 38'h022e48e19f;
    stim[56] = 38'h03b9081565;
    stim[57] = 38'h196f71c1fa;
    stim[58] = 38'h1f907def74;
    stim[59] = 38'h18ed0e9289;
    stim[60] = 38'h1583aa5794;
    stim[61] = 38'h06f7e98f0b;
    stim[62] = 38'h1350e63531;
    stim[63] = 38'h127a5ea735;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h200000000;
      expv[19] = 34'h200000000;
      expv[20] = 34'h200000000;
      expv[21] = 34'h200000000;
      expv[22] = 34'h3fe8e585f;
      expv[23] = 34'h3fe8e585f;
      expv[24] = 34'h390c810c9;
      expv[25] = 34'h390c810c9;
      expv[26] = 34'h390c810c9;
      expv[27] = 34'h390c810c9;
      expv[28] = 34'h390c810c9;
      expv[29] = 34'h390c810c9;
      expv[30] = 34'h290c810c9;
      expv[31] = 34'h290c810c9;
      expv[32] = 34'h290c810c9;
      expv[33] = 34'h290c810c9;
      expv[34] = 34'h290c810c9;
      expv[35] = 34'h290c810c9;
      expv[36] = 34'h3c8d7aaeb;
      expv[37] = 34'h3c8d7aaeb;
      expv[38] = 34'h3c8d7aaeb;
      expv[39] = 34'h3c8d7aaeb;
      expv[40] = 34'h3c8d7aaeb;
      expv[41] = 34'h3c8d7aaeb;
      expv[42] = 34'h3c8d7aaeb;
      expv[43] = 34'h3c8d7aaeb;
      expv[44] = 34'h3c8d7aaeb;
      expv[45] = 34'h3c8d7aaeb;
      expv[46] = 34'h32b8b5500;
      expv[47] = 34'h35e75edbd;
      expv[48] = 34'h35e75edbd;
      expv[49] = 34'h35e75edbd;
      expv[50] = 34'h35e75edbd;
      expv[51] = 34'h35e75edbd;
      expv[52] = 34'h35e75edbd;
      expv[53] = 34'h35e75edbd;
      expv[54] = 34'h35e75edbd;
      expv[55] = 34'h35e75edbd;
      expv[56] = 34'h35e75edbd;
      expv[57] = 34'h35e75edbd;
      expv[58] = 34'h35e75edbd;
      expv[59] = 34'h35e75edbd;
      expv[60] = 34'h35e75edbd;
      expv[61] = 34'h35e75edbd;
      expv[62] = 34'h35e75edbd;
      expv[63] = 34'h35e75edbd;
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
