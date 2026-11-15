// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05977 dut (
    .clk(clk),
    .peripheralClkEdge(in_vec[11:11]),
    .parallelLoad(in_vec[10:10]),
    .parallelDataIn(in_vec[9:2]),
    .serialDataIn(in_vec[1:1]),
    .peripheralClk8Edge(in_vec[0:0]),
    .parallelDataOut(out_vec[8:1]),
    .serialDataOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hdf9;
    stim[1] = 12'hc44;
    stim[2] = 12'hdc9;
    stim[3] = 12'hc1d;
    stim[4] = 12'h5e0;
    stim[5] = 12'hea4;
    stim[6] = 12'h493;
    stim[7] = 12'h9a0;
    stim[8] = 12'h01c;
    stim[9] = 12'h64c;
    stim[10] = 12'h9fb;
    stim[11] = 12'h9d3;
    stim[12] = 12'h5af;
    stim[13] = 12'h9cd;
    stim[14] = 12'h0ce;
    stim[15] = 12'hd3f;
    stim[16] = 12'hd37;
    stim[17] = 12'h387;
    stim[18] = 12'h390;
    stim[19] = 12'h7ec;
    stim[20] = 12'hc13;
    stim[21] = 12'h53e;
    stim[22] = 12'h230;
    stim[23] = 12'h8db;
    stim[24] = 12'hcde;
    stim[25] = 12'h37a;
    stim[26] = 12'he20;
    stim[27] = 12'h7d0;
    stim[28] = 12'h3f4;
    stim[29] = 12'h87e;
    stim[30] = 12'h7d1;
    stim[31] = 12'h5a4;
    stim[32] = 12'hd4c;
    stim[33] = 12'h7bb;
    stim[34] = 12'he16;
    stim[35] = 12'h4cc;
    stim[36] = 12'hce2;
    stim[37] = 12'h258;
    stim[38] = 12'ha81;
    stim[39] = 12'h2ac;
    stim[40] = 12'h17a;
    stim[41] = 12'h9ee;
    stim[42] = 12'h21e;
    stim[43] = 12'h176;
    stim[44] = 12'h368;
    stim[45] = 12'h33f;
    stim[46] = 12'h941;
    stim[47] = 12'h9d3;
    stim[48] = 12'h430;
    stim[49] = 12'h1e5;
    stim[50] = 12'h6cc;
    stim[51] = 12'h6a1;
    stim[52] = 12'h3fc;
    stim[53] = 12'h91b;
    stim[54] = 12'h10c;
    stim[55] = 12'hdc8;
    stim[56] = 12'h46f;
    stim[57] = 12'h837;
    stim[58] = 12'h1a5;
    stim[59] = 12'hce6;
    stim[60] = 12'h05f;
    stim[61] = 12'h815;
    stim[62] = 12'h108;
    stim[63] = 12'hb1e;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'hxxx;
      expv[2] = 9'h022;
      expv[3] = 9'h022;
      expv[4] = 9'h022;
      expv[5] = 9'h044;
      expv[6] = 9'h044;
      expv[7] = 9'h088;
      expv[8] = 9'h088;
      expv[9] = 9'h088;
      expv[10] = 9'h113;
      expv[11] = 9'h113;
      expv[12] = 9'h113;
      expv[13] = 9'h024;
      expv[14] = 9'h024;
      expv[15] = 9'h04a;
      expv[16] = 9'h04a;
      expv[17] = 9'h09a;
      expv[18] = 9'h09a;
      expv[19] = 9'h09a;
      expv[20] = 9'h137;
      expv[21] = 9'h137;
      expv[22] = 9'h09e;
      expv[23] = 9'h13f;
      expv[24] = 9'h13f;
      expv[25] = 9'h06e;
      expv[26] = 9'h0dc;
      expv[27] = 9'h0dc;
      expv[28] = 9'h1e9;
      expv[29] = 9'h1d3;
      expv[30] = 9'h1d3;
      expv[31] = 9'h1e9;
      expv[32] = 9'h1d1;
      expv[33] = 9'h1d1;
      expv[34] = 9'h1a3;
      expv[35] = 9'h1a3;
      expv[36] = 9'h147;
      expv[37] = 9'h147;
      expv[38] = 9'h08c;
      expv[39] = 9'h08c;
      expv[40] = 9'h08c;
      expv[41] = 9'h11b;
      expv[42] = 9'h11b;
      expv[43] = 9'h11b;
      expv[44] = 9'h11b;
      expv[45] = 9'h11b;
      expv[46] = 9'h034;
      expv[47] = 9'h034;
      expv[48] = 9'h034;
      expv[49] = 9'h034;
      expv[50] = 9'h034;
      expv[51] = 9'h034;
      expv[52] = 9'h034;
      expv[53] = 9'h06a;
      expv[54] = 9'h06a;
      expv[55] = 9'h0d4;
      expv[56] = 9'h0d4;
      expv[57] = 9'h1ab;
      expv[58] = 9'h1ab;
      expv[59] = 9'h157;
      expv[60] = 9'h157;
      expv[61] = 9'h0ac;
      expv[62] = 9'h0ac;
      expv[63] = 9'h15b;
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
