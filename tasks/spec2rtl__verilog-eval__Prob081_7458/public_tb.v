// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .p1a(in_vec[9:9]),
    .p1b(in_vec[8:8]),
    .p1c(in_vec[7:7]),
    .p1d(in_vec[6:6]),
    .p1e(in_vec[5:5]),
    .p1f(in_vec[4:4]),
    .p2a(in_vec[3:3]),
    .p2b(in_vec[2:2]),
    .p2c(in_vec[1:1]),
    .p2d(in_vec[0:0]),
    .p1y(out_vec[1:1]),
    .p2y(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h21d;
    stim[1] = 10'h231;
    stim[2] = 10'h34f;
    stim[3] = 10'h09d;
    stim[4] = 10'h3fd;
    stim[5] = 10'h013;
    stim[6] = 10'h2b8;
    stim[7] = 10'h0ef;
    stim[8] = 10'h12b;
    stim[9] = 10'h166;
    stim[10] = 10'h1fa;
    stim[11] = 10'h2de;
    stim[12] = 10'h244;
    stim[13] = 10'h0c9;
    stim[14] = 10'h10d;
    stim[15] = 10'h3be;
    stim[16] = 10'h227;
    stim[17] = 10'h3d4;
    stim[18] = 10'h33e;
    stim[19] = 10'h3a5;
    stim[20] = 10'h1a4;
    stim[21] = 10'h211;
    stim[22] = 10'h2a7;
    stim[23] = 10'h0d0;
    stim[24] = 10'h27e;
    stim[25] = 10'h189;
    stim[26] = 10'h038;
    stim[27] = 10'h3db;
    stim[28] = 10'h3a2;
    stim[29] = 10'h351;
    stim[30] = 10'h335;
    stim[31] = 10'h0c6;
    stim[32] = 10'h3f9;
    stim[33] = 10'h293;
    stim[34] = 10'h3d7;
    stim[35] = 10'h37f;
    stim[36] = 10'h3f9;
    stim[37] = 10'h009;
    stim[38] = 10'h220;
    stim[39] = 10'h3a0;
    stim[40] = 10'h2e8;
    stim[41] = 10'h0ec;
    stim[42] = 10'h34c;
    stim[43] = 10'h240;
    stim[44] = 10'h27c;
    stim[45] = 10'h3a8;
    stim[46] = 10'h218;
    stim[47] = 10'h208;
    stim[48] = 10'h0c4;
    stim[49] = 10'h1cc;
    stim[50] = 10'h029;
    stim[51] = 10'h30f;
    stim[52] = 10'h0ec;
    stim[53] = 10'h2f5;
    stim[54] = 10'h2c3;
    stim[55] = 10'h3e4;
    stim[56] = 10'h255;
    stim[57] = 10'h042;
    stim[58] = 10'h1e0;
    stim[59] = 10'h10e;
    stim[60] = 10'h075;
    stim[61] = 10'h1e6;
    stim[62] = 10'h383;
    stim[63] = 10'h266;
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
      expv[0] = 2'h1;
      expv[1] = 2'h0;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h3;
      expv[5] = 2'h1;
      expv[6] = 2'h0;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h2;
      expv[11] = 2'h1;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h1;
      expv[15] = 2'h3;
      expv[16] = 2'h1;
      expv[17] = 2'h2;
      expv[18] = 2'h1;
      expv[19] = 2'h2;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h1;
      expv[23] = 2'h0;
      expv[24] = 2'h3;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h3;
      expv[28] = 2'h2;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h2;
      expv[33] = 2'h1;
      expv[34] = 2'h3;
      expv[35] = 2'h3;
      expv[36] = 2'h2;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h2;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h3;
      expv[45] = 2'h2;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h1;
      expv[50] = 2'h0;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h2;
      expv[54] = 2'h1;
      expv[55] = 2'h2;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h1;
      expv[60] = 2'h2;
      expv[61] = 2'h0;
      expv[62] = 2'h3;
      expv[63] = 2'h0;
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
