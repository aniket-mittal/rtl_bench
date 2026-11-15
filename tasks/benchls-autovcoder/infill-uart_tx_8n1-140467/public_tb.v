// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_140467 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .tx_en(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .tx(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h393;
    stim[1] = 10'h3f7;
    stim[2] = 10'h03c;
    stim[3] = 10'h0d8;
    stim[4] = 10'h010;
    stim[5] = 10'h1e0;
    stim[6] = 10'h0dd;
    stim[7] = 10'h122;
    stim[8] = 10'h0c1;
    stim[9] = 10'h0c3;
    stim[10] = 10'h14b;
    stim[11] = 10'h19d;
    stim[12] = 10'h265;
    stim[13] = 10'h19c;
    stim[14] = 10'h067;
    stim[15] = 10'h0a0;
    stim[16] = 10'h390;
    stim[17] = 10'h1e2;
    stim[18] = 10'h130;
    stim[19] = 10'h100;
    stim[20] = 10'h1e5;
    stim[21] = 10'h08e;
    stim[22] = 10'h1f6;
    stim[23] = 10'h1c7;
    stim[24] = 10'h1a1;
    stim[25] = 10'h0a9;
    stim[26] = 10'h10e;
    stim[27] = 10'h1fc;
    stim[28] = 10'h00d;
    stim[29] = 10'h1b6;
    stim[30] = 10'h1f3;
    stim[31] = 10'h1d5;
    stim[32] = 10'h18c;
    stim[33] = 10'h13b;
    stim[34] = 10'h040;
    stim[35] = 10'h155;
    stim[36] = 10'h1b7;
    stim[37] = 10'h014;
    stim[38] = 10'h0b8;
    stim[39] = 10'h21e;
    stim[40] = 10'h1af;
    stim[41] = 10'h13f;
    stim[42] = 10'h053;
    stim[43] = 10'h0af;
    stim[44] = 10'h18e;
    stim[45] = 10'h15e;
    stim[46] = 10'h032;
    stim[47] = 10'h14e;
    stim[48] = 10'h1c7;
    stim[49] = 10'h01e;
    stim[50] = 10'h03a;
    stim[51] = 10'h05d;
    stim[52] = 10'h196;
    stim[53] = 10'h0fe;
    stim[54] = 10'h098;
    stim[55] = 10'h155;
    stim[56] = 10'h174;
    stim[57] = 10'h02a;
    stim[58] = 10'h161;
    stim[59] = 10'h1a1;
    stim[60] = 10'h1d0;
    stim[61] = 10'h078;
    stim[62] = 10'h13d;
    stim[63] = 10'h139;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
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
