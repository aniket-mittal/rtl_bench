// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072373 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc86;
    stim[1] = 12'h950;
    stim[2] = 12'h2c8;
    stim[3] = 12'h127;
    stim[4] = 12'h4b2;
    stim[5] = 12'h7a9;
    stim[6] = 12'h6cd;
    stim[7] = 12'h798;
    stim[8] = 12'h7ec;
    stim[9] = 12'h60a;
    stim[10] = 12'h6cb;
    stim[11] = 12'h03d;
    stim[12] = 12'h0c9;
    stim[13] = 12'h0ed;
    stim[14] = 12'h3b2;
    stim[15] = 12'h398;
    stim[16] = 12'h41b;
    stim[17] = 12'h2ae;
    stim[18] = 12'h39f;
    stim[19] = 12'h6d5;
    stim[20] = 12'h12f;
    stim[21] = 12'h54f;
    stim[22] = 12'h105;
    stim[23] = 12'h15b;
    stim[24] = 12'h145;
    stim[25] = 12'h6d9;
    stim[26] = 12'h397;
    stim[27] = 12'h503;
    stim[28] = 12'h6cc;
    stim[29] = 12'h602;
    stim[30] = 12'h240;
    stim[31] = 12'h0f5;
    stim[32] = 12'h1e9;
    stim[33] = 12'h41f;
    stim[34] = 12'h4b3;
    stim[35] = 12'h03e;
    stim[36] = 12'h207;
    stim[37] = 12'h1d5;
    stim[38] = 12'h498;
    stim[39] = 12'h07c;
    stim[40] = 12'h532;
    stim[41] = 12'h304;
    stim[42] = 12'h012;
    stim[43] = 12'h3a5;
    stim[44] = 12'h54c;
    stim[45] = 12'h125;
    stim[46] = 12'h39a;
    stim[47] = 12'h603;
    stim[48] = 12'h4f1;
    stim[49] = 12'h370;
    stim[50] = 12'h2dd;
    stim[51] = 12'h533;
    stim[52] = 12'h1d2;
    stim[53] = 12'h25f;
    stim[54] = 12'h251;
    stim[55] = 12'h0c1;
    stim[56] = 12'h296;
    stim[57] = 12'h014;
    stim[58] = 12'h2ee;
    stim[59] = 12'h167;
    stim[60] = 12'h7af;
    stim[61] = 12'h2c2;
    stim[62] = 12'h79a;
    stim[63] = 12'h0b2;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h1xx;
      expv[6] = 10'h1xx;
      expv[7] = 10'h3a9;
      expv[8] = 10'h1a9;
      expv[9] = 10'h398;
      expv[10] = 10'h3ec;
      expv[11] = 10'h1ec;
      expv[12] = 10'h1ec;
      expv[13] = 10'h1ec;
      expv[14] = 10'h1ec;
      expv[15] = 10'h1ec;
      expv[16] = 10'h1ec;
      expv[17] = 10'h1ec;
      expv[18] = 10'h1ec;
      expv[19] = 10'h1ec;
      expv[20] = 10'h1ec;
      expv[21] = 10'h1ec;
      expv[22] = 10'h1ec;
      expv[23] = 10'h1ec;
      expv[24] = 10'h1ec;
      expv[25] = 10'h1ec;
      expv[26] = 10'h34f;
      expv[27] = 10'h34f;
      expv[28] = 10'h34f;
      expv[29] = 10'h303;
      expv[30] = 10'h103;
      expv[31] = 10'h103;
      expv[32] = 10'h103;
      expv[33] = 10'h103;
      expv[34] = 10'h103;
      expv[35] = 10'h103;
      expv[36] = 10'h103;
      expv[37] = 10'h103;
      expv[38] = 10'h103;
      expv[39] = 10'h103;
      expv[40] = 10'h103;
      expv[41] = 10'h103;
      expv[42] = 10'h103;
      expv[43] = 10'h103;
      expv[44] = 10'h103;
      expv[45] = 10'h332;
      expv[46] = 10'h332;
      expv[47] = 10'h332;
      expv[48] = 10'h34c;
      expv[49] = 10'h34c;
      expv[50] = 10'h34c;
      expv[51] = 10'h34c;
      expv[52] = 10'h34c;
      expv[53] = 10'h34c;
      expv[54] = 10'h34c;
      expv[55] = 10'h34c;
      expv[56] = 10'h34c;
      expv[57] = 10'h34c;
      expv[58] = 10'h34c;
      expv[59] = 10'h34c;
      expv[60] = 10'h34c;
      expv[61] = 10'h333;
      expv[62] = 10'h333;
      expv[63] = 10'h3af;
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
