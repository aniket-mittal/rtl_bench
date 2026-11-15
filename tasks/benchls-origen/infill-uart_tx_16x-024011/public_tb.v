// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_024011 dut (
    .clk16x(clk),
    .tdin(in_vec[9:2]),
    .txrst(in_vec[1:1]),
    .wrn(in_vec[0:0]),
    .tbuf(out_vec[2:2]),
    .txd(out_vec[1:1]),
    .parity(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1eb;
    stim[1] = 10'h283;
    stim[2] = 10'h0b4;
    stim[3] = 10'h1f1;
    stim[4] = 10'h2e0;
    stim[5] = 10'h040;
    stim[6] = 10'h3ad;
    stim[7] = 10'h228;
    stim[8] = 10'h39c;
    stim[9] = 10'h365;
    stim[10] = 10'h155;
    stim[11] = 10'h390;
    stim[12] = 10'h17d;
    stim[13] = 10'h2f5;
    stim[14] = 10'h3c5;
    stim[15] = 10'h36d;
    stim[16] = 10'h170;
    stim[17] = 10'h174;
    stim[18] = 10'h19c;
    stim[19] = 10'h010;
    stim[20] = 10'h3b8;
    stim[21] = 10'h148;
    stim[22] = 10'h2e5;
    stim[23] = 10'h0de;
    stim[24] = 10'h16c;
    stim[25] = 10'h215;
    stim[26] = 10'h05c;
    stim[27] = 10'h171;
    stim[28] = 10'h3f8;
    stim[29] = 10'h273;
    stim[30] = 10'h1ec;
    stim[31] = 10'h0c8;
    stim[32] = 10'h0fc;
    stim[33] = 10'h2e9;
    stim[34] = 10'h284;
    stim[35] = 10'h118;
    stim[36] = 10'h3f8;
    stim[37] = 10'h0e5;
    stim[38] = 10'h0ad;
    stim[39] = 10'h205;
    stim[40] = 10'h1fc;
    stim[41] = 10'h298;
    stim[42] = 10'h2fb;
    stim[43] = 10'h37c;
    stim[44] = 10'h2a8;
    stim[45] = 10'h0a5;
    stim[46] = 10'h048;
    stim[47] = 10'h149;
    stim[48] = 10'h260;
    stim[49] = 10'h0a8;
    stim[50] = 10'h33c;
    stim[51] = 10'h1bd;
    stim[52] = 10'h050;
    stim[53] = 10'h3cc;
    stim[54] = 10'h219;
    stim[55] = 10'h3dd;
    stim[56] = 10'h0a8;
    stim[57] = 10'h2b9;
    stim[58] = 10'h09c;
    stim[59] = 10'h1d5;
    stim[60] = 10'h335;
    stim[61] = 10'h338;
    stim[62] = 10'h0a5;
    stim[63] = 10'h14c;
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
      expv[0] = 3'h3;
      expv[1] = 3'h3;
      expv[2] = 3'h3;
      expv[3] = 3'h3;
      expv[4] = 3'h3;
      expv[5] = 3'h7;
      expv[6] = 3'h7;
      expv[7] = 3'h7;
      expv[8] = 3'h7;
      expv[9] = 3'h7;
      expv[10] = 3'h7;
      expv[11] = 3'h7;
      expv[12] = 3'h7;
      expv[13] = 3'h7;
      expv[14] = 3'h7;
      expv[15] = 3'h7;
      expv[16] = 3'h7;
      expv[17] = 3'h7;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h4;
      expv[23] = 3'h3;
      expv[24] = 3'h3;
      expv[25] = 3'h3;
      expv[26] = 3'h3;
      expv[27] = 3'h7;
      expv[28] = 3'h7;
      expv[29] = 3'h3;
      expv[30] = 3'h3;
      expv[31] = 3'h7;
      expv[32] = 3'h7;
      expv[33] = 3'h7;
      expv[34] = 3'h7;
      expv[35] = 3'h7;
      expv[36] = 3'h7;
      expv[37] = 3'h7;
      expv[38] = 3'h7;
      expv[39] = 3'h7;
      expv[40] = 3'h7;
      expv[41] = 3'h7;
      expv[42] = 3'h3;
      expv[43] = 3'h3;
      expv[44] = 3'h7;
      expv[45] = 3'h7;
      expv[46] = 3'h7;
      expv[47] = 3'h7;
      expv[48] = 3'h7;
      expv[49] = 3'h7;
      expv[50] = 3'h7;
      expv[51] = 3'h7;
      expv[52] = 3'h7;
      expv[53] = 3'h7;
      expv[54] = 3'h7;
      expv[55] = 3'h7;
      expv[56] = 3'h7;
      expv[57] = 3'h7;
      expv[58] = 3'h7;
      expv[59] = 3'h4;
      expv[60] = 3'h4;
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
