// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10265 dut (
    .clock(clk),
    .ready(in_vec[8:8]),
    .volume(in_vec[7:3]),
    .source(in_vec[2:0]),
    .command_address(out_vec[24:17]),
    .command_data(out_vec[16:1]),
    .command_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0f1;
    stim[1] = 9'h1ea;
    stim[2] = 9'h1b6;
    stim[3] = 9'h0c5;
    stim[4] = 9'h1f4;
    stim[5] = 9'h133;
    stim[6] = 9'h178;
    stim[7] = 9'h1e1;
    stim[8] = 9'h0cf;
    stim[9] = 9'h16d;
    stim[10] = 9'h068;
    stim[11] = 9'h18a;
    stim[12] = 9'h065;
    stim[13] = 9'h107;
    stim[14] = 9'h052;
    stim[15] = 9'h11e;
    stim[16] = 9'h003;
    stim[17] = 9'h09b;
    stim[18] = 9'h107;
    stim[19] = 9'h041;
    stim[20] = 9'h1bb;
    stim[21] = 9'h0c4;
    stim[22] = 9'h0d2;
    stim[23] = 9'h0e8;
    stim[24] = 9'h1ad;
    stim[25] = 9'h09c;
    stim[26] = 9'h0fd;
    stim[27] = 9'h1f1;
    stim[28] = 9'h042;
    stim[29] = 9'h052;
    stim[30] = 9'h0e3;
    stim[31] = 9'h0a7;
    stim[32] = 9'h0f5;
    stim[33] = 9'h04c;
    stim[34] = 9'h13f;
    stim[35] = 9'h051;
    stim[36] = 9'h193;
    stim[37] = 9'h05f;
    stim[38] = 9'h089;
    stim[39] = 9'h06e;
    stim[40] = 9'h1d0;
    stim[41] = 9'h053;
    stim[42] = 9'h19d;
    stim[43] = 9'h157;
    stim[44] = 9'h174;
    stim[45] = 9'h0de;
    stim[46] = 9'h027;
    stim[47] = 9'h001;
    stim[48] = 9'h1c8;
    stim[49] = 9'h0f4;
    stim[50] = 9'h0b5;
    stim[51] = 9'h003;
    stim[52] = 9'h1b8;
    stim[53] = 9'h054;
    stim[54] = 9'h05e;
    stim[55] = 9'h00a;
    stim[56] = 9'h19f;
    stim[57] = 9'h1fc;
    stim[58] = 9'h1db;
    stim[59] = 9'h0bf;
    stim[60] = 9'h15f;
    stim[61] = 9'h1ec;
    stim[62] = 9'h1a7;
    stim[63] = 9'h056;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h1000001;
      expv[2] = 25'h1000001;
      expv[3] = 25'h1000001;
      expv[4] = 25'h1000001;
      expv[5] = 25'h1000001;
      expv[6] = 25'h0083233;
      expv[7] = 25'h1000001;
      expv[8] = 25'h0301011;
      expv[9] = 25'h0340e0f;
      expv[10] = 25'h0340a0b;
      expv[11] = 25'h0381e1f;
      expv[12] = 25'h0381e1f;
      expv[13] = 25'h1000001;
      expv[14] = 25'h1000001;
      expv[15] = 25'h01d0091;
      expv[16] = 25'h01d0091;
      expv[17] = 25'h0140001;
      expv[18] = 25'h0140001;
      expv[19] = 25'h0140001;
      expv[20] = 25'h0410001;
      expv[21] = 25'h0410001;
      expv[22] = 25'h1000001;
      expv[23] = 25'h1000001;
      expv[24] = 25'h1000001;
      expv[25] = 25'h1000001;
      expv[26] = 25'h1000001;
      expv[27] = 25'h1000001;
      expv[28] = 25'h1000001;
      expv[29] = 25'h1000001;
      expv[30] = 25'h1000001;
      expv[31] = 25'h1000001;
      expv[32] = 25'h1000001;
      expv[33] = 25'h1000001;
      expv[34] = 25'h1000001;
      expv[35] = 25'h1000001;
      expv[36] = 25'h1000001;
      expv[37] = 25'h1000001;
      expv[38] = 25'h1000001;
      expv[39] = 25'h1000001;
      expv[40] = 25'h1000001;
      expv[41] = 25'h1000001;
      expv[42] = 25'h1000001;
      expv[43] = 25'h1000001;
      expv[44] = 25'h1000001;
      expv[45] = 25'h0082223;
      expv[46] = 25'h1000001;
      expv[47] = 25'h1000001;
      expv[48] = 25'h1000001;
      expv[49] = 25'h1000001;
      expv[50] = 25'h0301011;
      expv[51] = 25'h0301011;
      expv[52] = 25'h0301011;
      expv[53] = 25'h0301011;
      expv[54] = 25'h0340809;
      expv[55] = 25'h0340c0d;
      expv[56] = 25'h0340405;
      expv[57] = 25'h0340e0f;
      expv[58] = 25'h0381e1f;
      expv[59] = 25'h1000001;
      expv[60] = 25'h01d0091;
      expv[61] = 25'h01d0091;
      expv[62] = 25'h0140001;
      expv[63] = 25'h0410001;
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
